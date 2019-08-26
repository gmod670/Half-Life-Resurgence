AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.VJ_NPC_Class = {"CLASS_QUAKE1"}
ENT.Model = "models/quake1/knight.mdl"
ENT.HasDeathRagdoll = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.StartHealth = 75
ENT.DeathAnimationTime = 5
ENT.BloodColor = "Red"
ENT.BloodDecalUseGMod = true
ENT.CanFlinch = 1
ENT.MeleeAttackDamage = 15
ENT.FlinchChance = 1
ENT.FlinchAnimation_UseSchedule = true
ENT.ScheduleTbl_Flinch = {SCHED_BIG_FLINCH}
ENT.HasExtraMeleeAttackSounds = true
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.AnimTbl_Flinch = {ACT_BIG_FLINCH}
ENT.SoundTbl_Alert = { "q1/knight/ksight.wav" }
ENT.SoundTbl_MeleeAttack = { "q1/knight/sword1.wav", "q1/knight/sword2.wav" }
ENT.SoundTbl_MeleeAttackMiss = { "q1/knight/sword1.wav", "q1/knight/sword2.wav" }
ENT.SoundTbl_Idle = { "q1/knight/idle.wav" }
ENT.SoundTbl_MeleeAttackExtra = { "q1/demon/dhit2.wav" }
--ENT.SoundTbl_MeleeAttack = { "q1/demon/dhit2.wav" }
ENT.SoundTbl_Pain = { "q1/knight/khurt.wav" }
ENT.SoundTbl_Death = { "q1/knight/kdeath.wav" }
ENT.HullType = HULL_HUMAN

function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(13, 13, 60), Vector(-13, -13, 0))
	self:SetModelScale( 1.25, 0.1 ) 
end













/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/