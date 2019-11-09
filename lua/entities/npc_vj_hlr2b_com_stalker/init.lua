AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hl2b/stalker.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 60
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_COMBINE"} -- NPCs with the same class with be allied to each other
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)

ENT.MeleeAttackDamage = 20
ENT.TimeUntilMeleeAttackDamage = false -- This counted in seconds | This calculates the time until it hits something
ENT.MeleeAttackDistance = 40 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 70 -- How far does the damage go?

ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = 750 -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 200 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_Type = "OnlyRange" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.HasExtraMeleeAttackSounds = true -- Set to true to use the extra melee attack sounds
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"physics/metal/metal_grenade_impact_hard1.wav","physics/metal/metal_grenade_impact_hard2.wav"}
ENT.SoundTbl_Idle = {}
ENT.SoundTbl_Alert = {}
ENT.SoundTbl_MeleeAttackExtra = {"vj_hlr/hl1_npc/zombie/claw_strike1.wav","vj_hlr/hl1_npc/zombie/claw_strike2.wav","vj_hlr/hl1_npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_Death = {}

ENT.GeneralSoundPitch1 = 100

ENT.Stalker_RunAway = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(20,20,65), Vector(-20,-20,0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
	if key == "melee" then
		self:MeleeAttackCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FireLaser()
	if IsValid(self:GetEnemy()) then
		local startpos = self:GetPos() + self:GetUp()*45 + self:GetForward()*40
		local tr = util.TraceLine({
			start = self:GetPos() + self:GetUp()*45 + self:GetForward()*40,
			endpos = self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter() +VectorRand() *4,
			filter = self
		})
		local hitpos = tr.HitPos

		local elec = EffectData()
		elec:SetStart(startpos)
		elec:SetOrigin(hitpos)
		elec:SetEntity(self)
		elec:SetAttachment(1)
		util.Effect("VJ_HLR_StalkerBeam",elec)

		util.VJ_SphereDamage(self,self,hitpos,30,2,DMG_BURN,true,false,{Force=1})
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:LaserReset()
	self.IsLaserAttacking = false
	self:StopMoving()
	self:StopMoving()
	self:ClearSchedule()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if self.IsLaserAttacking then
		self:VJ_ACT_PLAYACTIVITY("vjseq_rangeattack",true,false,true)
		self:FireLaser()
	end
	local ent = self:GetEnemy()
	if IsValid(ent) then
		if self:Visible(ent) && ent:GetPos():Distance(self:GetPos()) < self.NoChaseAfterCertainRange_FarDistance && ent:GetPos():Distance(self:GetPos()) > self.NoChaseAfterCertainRange_CloseDistance then
			if !self.IsLaserAttacking then
				self.IsLaserAttacking = true
			end
		else
			if self.IsLaserAttacking then
				self:LaserReset()
			end
		end
	elseif !IsValid(ent) || IsValid(ent) && ent:Health() <= 0 then
		if self.IsLaserAttacking then
			self:LaserReset()
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSchedule()
	if self.Dead == false && self.vACT_StopAttacks == false && self.Stalker_RunAway == true && self.PlayingAttackAnimation == false then
		self.Stalker_RunAway = false
		self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH",function(x) x.RunCode_OnFail = function() self.NextDoAnyAttackT = 0 end end)
		self.NextDoAnyAttackT = CurTime() + 5
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if (self.NextDoAnyAttackT + 2) > CurTime() then return end
	self.Stalker_RunAway = true
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/