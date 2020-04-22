AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hlze/headcrab.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 10
ENT.HullType = HULL_TINY
ENT.EntitiesToNoCollide = {"npc_vj_hlr1_gonarch"} -- Entities to not collide with when HasEntitiesToNoCollide is set to true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CustomBlood_Particle = {"vj_hl_blood_yellow"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Yellow"} -- Decals to spawn when it's damaged
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"} -- NPCs with the same class with be allied to each other
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.LeapAttackDamage = 10
ENT.AnimTbl_LeapAttack = {ACT_RANGE_ATTACK1} -- Melee Attack Animations
ENT.LeapDistance = 230 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapToMeleeDistance = 1 -- How close does it have to be until it uses melee?
ENT.LeapAttackDamageDistance = 50 -- How far does the damage go?
ENT.TimeUntilLeapAttackDamage = 0.4 -- How much time until it runs the leap damage code?
ENT.TimeUntilLeapAttackVelocity = 0.4 -- How much time until it runs the velocity code?
ENT.NextAnyAttackTime_Leap = 3 -- How much time until it can use any attack again? | Counted in Seconds
ENT.LeapAttackExtraTimers = {0.6,0.8,1} -- Extra leap attack timers | it will run the damage code after the given amount of seconds
ENT.StopLeapAttackAfterFirstHit = true -- Should it stop the leap attack from running rest of timers when it hits an enemy?
ENT.LeapAttackVelocityForward = 50 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 250 -- How much upward force should it apply?
ENT.LeapAttackVelocityRight = 0 -- How much right force should it apply?
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIESIMPLE} -- Death Animations
//ENT.DeathAnimationTime = 0.6 -- Time until the SNPC spawns its corpse and gets removed
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {"vj_hlr/hl1_npc/headcrab/hc_idle1.wav","vj_hlr/hl1_npc/headcrab/hc_idle2.wav","vj_hlr/hl1_npc/headcrab/hc_idle3.wav","vj_hlr/hl1_npc/headcrab/hc_idle4.wav","vj_hlr/hl1_npc/headcrab/hc_idle5.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hl1_npc/headcrab/hc_alert1.wav","vj_hlr/hl1_npc/headcrab/hc_alert2.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_hlr/hl1_npc/headcrab/hc_attack1.wav","vj_hlr/hl1_npc/headcrab/hc_attack2.wav","vj_hlr/hl1_npc/headcrab/hc_attack3.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_hlr/hl1_npc/headcrab/hc_headbite.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hl1_npc/headcrab/hc_pain1.wav","vj_hlr/hl1_npc/headcrab/hc_pain2.wav","vj_hlr/hl1_npc/headcrab/hc_pain3.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hl1_npc/headcrab/hc_die1.wav","vj_hlr/hl1_npc/headcrab/hc_die2.wav"}

ENT.GeneralSoundPitch1 = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(10, 10, 18), Vector(-10, -10, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if self:WaterLevel() > 1 then
		self:SetHealth(self:Health() - 1)
		if self:Health() <= 0 then
			self.Bleeds = false
			self:TakeDamage(1,self,self)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
	if self.VJ_IsBeingControlled == true then return end
	if math.random(1,2) == 1 then
		self:VJ_ACT_PLAYACTIVITY("angry",true,false,true)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ_Color2Byte(Color(255,221,35)))
		bloodeffect:SetScale(120)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(1)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
		
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos() +self:OBBCenter())
		effectdata:SetScale(1)
		util.Effect("StriderBlood",effectdata)
		util.Effect("StriderBlood",effectdata)
	end
	
	if self:GetModel() != "models/vj_hlr/hl1/headcrab_baby.mdl" then
		self:CreateGibEntity("obj_vj_gib",{"models/vj_hlr/gibs/agib1.mdl","models/vj_hlr/gibs/agib3.mdl"},{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,5))})
	end
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib5.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,5))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib7.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,5))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib9.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,5))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib10.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,5))})
	return true -- Return to true if it gibbed!
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo,hitgroup)
	VJ_EmitSound(self,"vj_gib/default_gib_splat.wav",90,math.random(100,100))
	return false
end

function ENT:CustomOnDoKilledEnemy(argent,attacker,inflictor) 
--print(argent)
end

function ENT:CustomOnLeapAttack_AfterChecks(TheHitEntity) 
	local victim = TheHitEntity
	if (victim:GetClass() == "npc_vj_hlrze_scientist" || victim:GetClass() == "npc_vj_hlrze_barney" || victim:GetClass() == "npc_vj_hlrze_hgrunt") && victim:Health() > 0 && victim:IsNPC() then
		victim.DeathAnimationTime = 60
		victim.AnimTbl_Death = {"zombify_begin"}
		victim.TurningSpeed = 0
		victim:EmitSound("vj_hlr/hl1_npc/headcrab/hc_headbite.wav")
		self:Remove()
		local newzombietype = ""
		local zombiespawnoffset = 50
		local zombifycontinuetime = 3.01
		victim:TakeDamage(1000,self,self)
		victim.VJ_NPC_Class = {"CLASS_NONE"}
		victim.BringFriendsOnDeath = false
		local fakedamage = DamageInfo()
		fakedamage:SetDamage(0)
		fakedamage:SetAttacker(victim)
		fakedamage:SetDamageType(DMG_GENERIC) 
		
		if victim:GetClass() == "npc_vj_hlrze_barney" then victim:SetSkin(1) victim:CreateGibEntity("prop_physics","models/vj_hlr/hlze/barney_helmet.mdl",{Pos=victim:GetPos() + victim:GetUp() * 50}) victim:GetActiveWeapon():SetClip1(victim:GetActiveWeapon().Primary.ClipSize) victim:DropWeaponOnDeathCode(fakedamage,1) else victim:SetSkin(2) end
		if victim:GetClass() == "npc_vj_hlrze_scientist" then victim:SetBodygroup(1,4) victim.IsMedicSNPC = false newzombietype = "npc_vj_hlrze_zombie" end
		if victim:GetClass() == "npc_vj_hlrze_barney" then victim:SetBodygroup(2,2) victim:SetBodygroup(1,2) newzombietype = "npc_vj_hlrze_zombie_barney" end
		if victim:GetClass() == "npc_vj_hlrze_hgrunt" then victim:SetBodygroup(2,3) zombifycontinuetime = 1.61 zombiespawnoffset = 30
			if victim:GetBodygroup(1) == 0 then victim:SetBodygroup(1,5) newzombietype = "npc_vj_hlrze_zsoldier_grenade" else victim:SetBodygroup(1,4) newzombietype = "npc_vj_hlrze_zsoldier" end end
		--timer.Simple(3,function() if victim:IsValid() then victim:VJ_ACT_PLAYACTIVITY("zombify_continues",true,29.5,false) end end)
		timer.Simple(1,function() if victim:IsValid() then victim.MovementType = VJ_MOVETYPE_STATIONARY victim.CanTurnWhileStationary = false end end)
		timer.Simple(zombifycontinuetime,function() if victim:IsValid() then victim:VJ_ACT_PLAYACTIVITY("zombify_continues",true,29.5,false) end end)
		timer.Simple(29.5,function() if victim:IsValid() then
			newzombie = ents.Create(newzombietype)
			newzombie:SetPos(victim:GetPos() + victim:GetForward() * zombiespawnoffset)
			newzombie:SetAngles(victim:GetAngles())
			newzombie:SetColor(victim:GetColor())
			newzombie:SetMaterial(victim:GetMaterial())
			newzombie:Spawn()
			newzombie:VJ_ACT_PLAYACTIVITY("getup",true,1,false)
			victim:Remove()
		end end)
	end
end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/