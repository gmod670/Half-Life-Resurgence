AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hl2/advisor_ep2.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 500
ENT.HullType = HULL_TINY
ENT.MovementType = VJ_MOVETYPE_AERIAL -- How does the SNPC move?
ENT.Aerial_FlyingSpeed_Calm = 200 -- The speed it should fly with, when it's wandering, moving slowly, etc. | Basically walking campared to ground SNPCs
ENT.Aerial_FlyingSpeed_Alerted = 325
ENT.Aerial_AnimTbl_Calm = {ACT_IDLE} -- Animations it plays when it's wandering around while idle
ENT.Aerial_AnimTbl_Alerted = {ACT_IDLE_ANGRY} -- Animations it plays when it's moving while alerted
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_COMBINE"} -- NPCs with the same class with be allied to each other
ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)

ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackDistance = 120 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 170 -- How far does the damage go?
ENT.TimeUntilMeleeAttackDamage = false -- This counted in seconds | This calculates the time until it hits something
ENT.MeleeAttackDamage = 55

ENT.HasExtraMeleeAttackSounds = true -- Set to true to use the extra melee attack sounds

ENT.NoChaseAfterCertainRange = false -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance" -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = "UseRangeDistance" -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_Type = "Regular" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Breath = {"ambient/atmosphere/city_beacon_loop1.wav"}
ENT.SoundTbl_Idle = {
	"vj_hlr/hl2_npc/advisor/advisor_speak01.wav",
}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_hlr/hl2_npc/advisor/advisorattack03.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hl2_npc/advisor/pain.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hl2_npc/advisor/advisor_scream.wav"}

ENT.BreathSoundLevel = 50

util.AddNetworkString("VJ_HLR_AdvisorScreenFX")
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(38,38,30), Vector(-38,-38,-30))
	
	self.NextScreenBlastT = CurTime() +math.Rand(3,8)
	self.NextSearchForEntitiesT = 0
	self.tbl_HeldEntities = {}
	
	self:ShieldCode(true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "melee" then
		self:MeleeAttackCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ShieldCode(bEnable)
	self.HasShield = bEnable
	if bEnable then
		ParticleEffectAttach("advisor_psychic_shield_idle",PATTACH_ABSORIGIN_FOLLOW,self,0)
		self.ShieldHealth = 150
		self.CustomBlood_Particle = {"hunter_shield_impact"}
		return
	end
	self.CustomBlood_Particle = {nil}
	self:StopParticles()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if self.HasShield then
		self:RemoveAllDecals()
		self.ShieldHealth = self.ShieldHealth -dmginfo:GetDamage()
		dmginfo:SetDamage(0)
		if self.ShieldHealth <= 0 then
			self:ShieldCode(false)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GrabEntity(ent)
	table.insert(self.tbl_HeldEntities,ent)
	VJ_EmitSound(self,"vj_hlr/hl2_npc/advisor/advisor_blast6.wav")
	VJ_EmitSound(ent,"ambient/energy/whiteflash.wav")
	ent:GetPhysicsObject():ApplyForceCenter(ent:GetPos() +Vector(0,0,ent:GetPhysicsObject():GetMass() *1.5))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if CurTime() > self.NextScreenBlastT && math.random(1,20) == 1 then
		for _,v in pairs(player.GetAll()) do
			net.Start("VJ_HLR_AdvisorScreenFX")
				net.WriteEntity(v)
				net.WriteFloat(v:GetPos():Distance(self:GetPos()))
			net.Send(v)
		end
		self.NextScreenBlastT = CurTime() +math.Rand(1,10)
	end
	-- if IsValid(self:GetEnemy()) then
		if CurTime() > self.NextSearchForEntitiesT then
			for _,v in ipairs(ents.FindInSphere(self:GetPos(),750)) do
				if v:GetClass() == "prop_physics" && !VJ_HasValue(self.tbl_HeldEntities,v) then
					if IsValid(v:GetPhysicsObject()) && v:GetPhysicsObject():GetMass() <= 1500 && v:Visible(self) then
						self:GrabEntity(v)
					end
				end
			end
		end
		if #self.tbl_HeldEntities > 0 then
			for _,v in ipairs(self.tbl_HeldEntities) do
				v:GetPhysicsObject():EnableGravity(false)
				-- if v:GetPos():Distance(self:GetPos()) > 750 then
					-- v:GetPhysicsObject():ApplyForceCenter((self:GetPos() -v:GetPos()):GetNormal() *v:GetPhysicsObject():GetMass())
				-- end -- Crashes
			end
		end
	-- end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	if #self.tbl_HeldEntities > 0 then
		for _,v in ipairs(self.tbl_HeldEntities) do
			if IsValid(v) then
				v:GetPhysicsObject():EnableGravity(true)
			end
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/