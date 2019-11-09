AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hl2/strider.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 500
ENT.HullType = HULL_LARGE
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_COMBINE"} -- NPCs with the same class with be allied to each other
ENT.BloodColor = "White" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackDistance = 32 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 60 -- How far does the damage go?
ENT.MeleeAttackDamage = 18
ENT.TimeUntilMeleeAttackDamage = 1
ENT.FootStepTimeRun = 0.38 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.38 -- Next foot step sound when it is walking
ENT.HasExtraMeleeAttackSounds = true -- Set to true to use the extra melee attack sounds
ENT.GeneralSoundPitch1 = 100

ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = 1500 -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 800 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_Type = "OnlyRange" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events

	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS} -- If it uses normal based animation, use this
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
	"npc/strider/strider_step1.wav",
	"npc/strider/strider_step2.wav",
	"npc/strider/strider_step3.wav",
	"npc/strider/strider_step4.wav",
	"npc/strider/strider_step5.wav",
	"npc/strider/strider_step6.wav",
}
-- ENT.SoundTbl_Breath = {"npc/fast_zombie/breathe_loop1.wav"}
ENT.SoundTbl_Alert = {
	"npc/strider/striderx_alert2.wav",
	"npc/strider/striderx_alert4.wav",
	"npc/strider/striderx_alert5.wav",
	"npc/strider/striderx_alert6.wav",
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"npc/strider/creak1.wav",
	"npc/strider/creak2.wav",
	"npc/strider/creak3.wav",
	"npc/strider/creak4.wav",
}
ENT.SoundTbl_Pain = {
	"npc/strider/striderx_pain2.wav",
	"npc/strider/striderx_pain5.wav",
	"npc/strider/striderx_pain7.wav",
	"npc/strider/striderx_pain8.wav",
}
ENT.SoundTbl_Death = {"npc/strider/striderx_die1.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(35,35,42), Vector(-35,-35,-500))
	self:SetPos(self:GetPos() +Vector(0,0,500))
	self.AnimTbl_IdleStand = {ACT_IDLE}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
	if key == "melee" then
		self:MeleeAttackCode()
	end
	-- if key == "shoot" then
		-- self:RangeAttackCode()
	-- end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	-- self:SetPoseParameter("body_height",500)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/