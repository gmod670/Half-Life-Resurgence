AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 90
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_hlr/pl_step1.wav","vj_hlr/pl_step2.wav","vj_hlr/pl_step3.wav","vj_hlr/pl_step4.wav"}
ENT.SoundTbl_Idle = {"vj_hlr/hl1_npc/zombie/zo_idle1.wav","vj_hlr/hl1_npc/zombie/zo_idle2.wav","vj_hlr/hl1_npc/zombie/zo_idle3.wav","vj_hlr/hl1_npc/zombie/zo_idle4.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hl1_npc/zombie/zo_alert10.wav","vj_hlr/hl1_npc/zombie/zo_alert20.wav","vj_hlr/hl1_npc/zombie/zo_alert30.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_hlr/hl1_npc/zombie/zo_attack1.wav","vj_hlr/hl1_npc/zombie/zo_attack2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_hlr/hl1_npc/zombie/claw_strike1.wav","vj_hlr/hl1_npc/zombie/claw_strike2.wav","vj_hlr/hl1_npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_hlr/hl1_npc/zombie/claw_miss1.wav","vj_hlr/hl1_npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hl1_npc/zombie/zo_pain1.wav","vj_hlr/hl1_npc/zombie/zo_pain2.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hl1_npc/zombie/zo_pain1.wav","vj_hlr/hl1_npc/zombie/zo_pain2.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.BodyGroups = {
	[0] = 2,
	[1] = math.random(2,3),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetBodygroup(0,self.BodyGroups[0])
	self:SetBodygroup(1,math.random(2,3))
	self.GrenadePulled = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Explode()
	self.GrenadePulled = false
	local grenent = ents.Create("obj_vj_grenade")
	grenent:SetPos(self:GetPos() +self:OBBCenter())
	grenent:SetOwner(self)
	grenent:SetParent(self)
	grenent.FussTime = 0
	grenent:Spawn()
	grenent:Activate()
	grenent.FussTime = 0
	self:SetUpGibesOnDeath(dmginfo,hitgroup)
	gamemode.Call("OnNPCKilled",self,self,self,dmginfo)
	self:Remove()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GrenadeCode()
	if self.GrenadePulled == true then return end
	self.GrenadePulled = true
	self.HasMeleeAttack = false
	self:VJ_ACT_PLAYACTIVITY("arm_grenade",true,VJ_GetSequenceDuration(self,self:VJ_LookupAnimationString("arm_grenade")))
	timer.Simple(VJ_GetSequenceDuration(self,self:VJ_LookupAnimationString("arm_grenade")) -0.4,function()
		if self:IsValid() then
			self:SetBodygroup(2,1)
			timer.Simple(5,function() if IsValid(self) then self:Explode() end end)
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == 3 then
		dmginfo:ScaleDamage(0.5)
		VJ_EmitSound(self,"vj_hlr/fx/ric" .. math.random(1,5) .. ".wav",85,100)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	-- if self.VJ_IsBeingControlled == false then
		-- if self:Health() < 40 && IsValid(self:GetEnemy()) && math.random(1,10) == 1 && self:GetEnemy():GetPos():Distance(self:GetPos()) < 500 then
			-- self:GrenadeCode()
		-- end
	-- else
		-- if self:Health() < 40 && self.VJ_TheController:KeyDown(IN_ATTACK2) then
			-- self.AnimTbl_IdleStand = {"Idle_Grenade"}
			-- self:GrenadeCode()
		-- end
	-- end
	if self.GrenadePulled == true then
		self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
		self.AnimTbl_Run = {ACT_RUN_AGITATED}
		self.AnimTbl_Walk = {ACT_RUN_AGITATED}
	else
		self.AnimTbl_IdleStand = {ACT_IDLE}
		self.AnimTbl_Walk = {ACT_WALK_STIMULATED}
		self.AnimTbl_Run = {ACT_WALK_STIMULATED}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo,hitgroup)
	if self.GrenadePulled == true then
		local grenent = ents.Create("obj_vj_grenade")
		grenent:SetPos(self:GetPos() +self:OBBCenter())
		grenent:SetOwner(self)
		grenent:SetParent(self)
		grenent.FussTime = 1.5
		grenent:Spawn()
		grenent:Activate()
		grenent.FussTime = 1.5
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/