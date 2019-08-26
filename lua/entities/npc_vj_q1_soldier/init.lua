AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.VJ_NPC_Class = {"CLASS_QUAKE1"}
ENT.Model = "models/quake1/soldier_fixx.mdl"
ENT.HasDeathRagdoll = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.StartHealth = 30
ENT.DeathAnimationTime = 4
ENT.BloodColor = "Red"
ENT.BloodDecalUseGMod = true
ENT.CanFlinch = 1
ENT.MeleeAttackDamage = 16
ENT.MeleeAttackDistance = 300
ENT.MeleeAttackDamageDistance = 350
ENT.FlinchChance = 1
ENT.FlinchAnimation_UseSchedule = false
ENT.ScheduleTbl_Flinch = {SCHED_BIG_FLINCH}
ENT.LeapToMeleeDistance = 100
ENT.LeapAttackDamageDistance = 100
ENT.HasExtraMeleeAttackSounds = true
ENT.AnimTbl_MeleeAttack = {ACT_RANGE_ATTACK1}
ENT.AnimTbl_Flinch = {ACT_BIG_FLINCH}
ENT.SoundTbl_Alert = { "q1/soldier/sight1.wav" }
ENT.SoundTbl_MeleeAttackMiss = { "q1/soldier/sattck1.wav" }
ENT.SoundTbl_MeleeAttackExtra = { "q1/soldier/sattck1.wav" }
ENT.SoundTbl_Idle = { "q1/soldier/idle.wav" }
ENT.SoundTbl_Pain = { "q1/soldier/pain1.wav", "q1/soldier/pain2.wav" }
ENT.SoundTbl_Death = { "q1/soldier/death1.wav" }
ENT.HullType = HULL_HUMAN

function ENT:CustomOnInitialize()
	self:SetModelScale( 1.35, 0.1 ) 
end














/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/