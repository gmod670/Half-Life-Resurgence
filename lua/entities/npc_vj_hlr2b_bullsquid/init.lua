AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hl2b/bullsquid.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.VJ_NPC_Class = {"CLASS_XEN"} -- NPCs with the same class with be allied to each other
ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.CustomBlood_Decal = {"VJ_Blood_Yellow"}
ENT.MeleeAttackDamage = 20
ENT.TimeUntilRangeAttackProjectileRelease = 0.8
ENT.RangeAttackEntityToSpawn = "obj_vj_hlr2_antlionspit" -- The entity that is spawned when range attacking
ENT.RangeAttackExtraTimers = {0.8,0.8,0.8}
ENT.HasDeathAnimation = false -- Does it play an animation when it dies?

ENT.Accuracy = 30
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(40, 40 , 40), Vector(-40, -40, 0))
	self.SoundTbl_FootStep = {"npc/zombie_poison/pz_left_foot1.wav"}
	self.SoundTbl_Idle = {
		"vj_hlr/hl2_npc/bullsquid/idle1.wav",
		"vj_hlr/hl2_npc/bullsquid/idle2.wav",
		"vj_hlr/hl2_npc/bullsquid/idle3.wav",
		"vj_hlr/hl2_npc/bullsquid/idle4.wav",
		"vj_hlr/hl2_npc/bullsquid/idle5.wav",
		"vj_hlr/hl2_npc/bullsquid/snort1.wav",
		"vj_hlr/hl2_npc/bullsquid/snort2.wav",
		"vj_hlr/hl2_npc/bullsquid/snort3.wav",
	}
	self.SoundTbl_Alert = {"vj_hlr/hl2_npc/bullsquid/excited1.wav"}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_hlr/hl2_npc/bullsquid/attack2.wav",
		"vj_hlr/hl2_npc/bullsquid/attackgrowl1.wav",
		"vj_hlr/hl2_npc/bullsquid/attackgrowl2.wav",
		"vj_hlr/hl2_npc/bullsquid/attackgrowl3.wav",
	}
	self.SoundTbl_MeleeAttack = {}
	self.SoundTbl_MeleeAttackMiss = {"vj_hlr/hl2_npc/bullsquid/tail_whip1.wav"}
	self.SoundTbl_RangeAttack = {
		"vj_hlr/hl2_npc/bullsquid/attack1.wav",
		"vj_hlr/hl2_npc/bullsquid/attack3.wav",
	}
	self.SoundTbl_Pain = {
		"vj_hlr/hl2_npc/bullsquid/pain1.wav",
		"vj_hlr/hl2_npc/bullsquid/pain2.wav",
		"vj_hlr/hl2_npc/bullsquid/pain3.wav",
		"vj_hlr/hl2_npc/bullsquid/pain4.wav",
	}
	self.SoundTbl_Death = {
		"vj_hlr/hl2_npc/bullsquid/die1.wav",
		"vj_hlr/hl2_npc/bullsquid/die2.wav",
		"vj_hlr/hl2_npc/bullsquid/die3.wav",
	}
	self.CustomBlood_Decal = {"VJ_Blood_Yellow"}
	self.HasBloodPool = true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
	if key == "attack" then
		self:MeleeAttackCode()
	end
	-- if key == "range" then
		-- self:RangeAttackCode()
	-- end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetPos(), self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter() +VectorRand() *self.Accuracy, 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(argent)
	if math.random(1,3) == 1 then
		if argent:GetClass() == "npc_vj_hlr1_headcrab" or argent:GetClass() == "npc_vj_hlr1_headcrab_baby" or argent:GetClass() == "npc_headcrab" or argent:GetClass() == "npc_headcrab_black" or argent:GetClass() == "npc_headcrab_fast" then
			self:VJ_ACT_PLAYACTIVITY("hc_spot",true,false,true)
		else
			self:VJ_ACT_PLAYACTIVITY(ACT_HOP,true,false,true)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks() end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/