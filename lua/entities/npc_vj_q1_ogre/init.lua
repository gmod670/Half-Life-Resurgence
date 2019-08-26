AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.VJ_NPC_Class = {"CLASS_QUAKE1"}
ENT.Model = "models/quake1/ogre_fix.mdl"
ENT.RangeAttackEntityToSpawn = "obj_vj_q1_grenade_test"
--ENT.RangeAttackEntityToSpawn = "obj_vj_grenade"
--ENT.RangeAttackEntityToSpawn = "q1_grenade"
ENT.RangeAttackAnimationDelay = 0
ENT.DeathCorpseModel = { "models/quake1/ogre_killed.mdl" }
ENT.HasRangeAttack = true
ENT.HasDeathRagdoll = true
--ENT.HasDeathAnimation = true
ENT.RangeDistance = 500
ENT.RangeToMeleeDistance = 200
ENT.RangeAttackPos_Up = 60
ENT.RangeAttackAnimationDelay = 0.01
ENT.TimeUntilRangeAttackProjectileRelease = 0.5
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DisableFootStepOnRun = true
ENT.StartHealth = 200
ENT.DeathAnimationTime = 5
ENT.BloodColor = "Red"
ENT.NextAnyAttackTime_Melee = 1.29999998
ENT.BloodDecalUseGMod = false
ENT.CanFlinch = 1
ENT.MeleeAttackDamage = 15
ENT.RangeAttackPos_Right = -40
ENT.MeleeAttackExtraTimers = {0.5}
ENT.FootStepTimeWalk = 1.5
--ENT.RangeAttackAnimationDecreaseLengthAmount = 300
ENT.FlinchChance = 1
ENT.FlinchAnimation_UseSchedule = true
ENT.ScheduleTbl_Flinch = {SCHED_BIG_FLINCH}
ENT.LeapToMeleeDistance = 100
ENT.LeapAttackDamageDistance = 100
ENT.HasExtraMeleeAttackSounds = true
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.AnimTbl_LeapAttack = {ACT_LEAP}
ENT.AnimTbl_Flinch = {ACT_BIG_FLINCH}
ENT.SoundTbl_Alert = { "q1/ogre/ogwake.wav" }
ENT.SoundTbl_MeleeAttack = { "q1/ogre/ogsawatk.wav" }
ENT.SoundTbl_MeleeAttackMiss = { "q1/ogre/ogsawatk.wav" }
ENT.SoundTbl_Idle = { "q1/ogre/ogidle.wav", "q1/ogre/ogidle2.wav" }
ENT.SoundTbl_MeleeAttackExtra = { "q1/ogre/ogsawatk.wav" }
ENT.SoundTbl_Pain = { "q1/ogre/ogpain1.wav" }
ENT.SoundTbl_Death = { "q1/ogre/ogdth.wav" }
ENT.SoundTbl_RangeAttack = { "q1/weapons/grenade.wav" }
ENT.HullType = HULL_HUMAN
ENT.SoundTbl_FootStep = { "q1/ogre/ogdrag.wav" }
ENT.MeleeAttackDamageDistance = 120

function ENT:CustomOnInitialize()
	self:SetModelScale( 1.35, 0.1 ) 
end

function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack" then
		self:MeleeAttackCode()
	end
end

function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	self:CreateExtraDeathCorpse("prop_physics","models/quake1/ogre_chainsaw.mdl",{Pos=self:LocalToWorld(Vector(-5,-50,30))})
	self:CreateExtraDeathCorpse("prop_physics","models/quake1/ogre_gl.mdl",{Pos=self:LocalToWorld(Vector(0,50,30))})
end

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/