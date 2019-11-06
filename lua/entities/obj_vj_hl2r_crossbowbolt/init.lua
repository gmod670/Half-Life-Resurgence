AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/crossbow_bolt.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesDirectDamage = true -- Should it do a direct damage when it hits something?
ENT.DirectDamage = 90 -- How much damage should it do when it hits something
ENT.DirectDamageType = DMG_SLASH -- Damage type
ENT.DecalTbl_DeathDecals = {"Impact.Concrete"}
ENT.SoundTbl_OnCollide = {"weapons/crossbow/hit1.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:SetMass(1)
	phys:EnableGravity(false)
	phys:EnableDrag(false)
	phys:SetBuoyancyRatio(0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPhysicsCollide(data,phys)
	if IsValid(data.HitEntity) then
		self.SoundTbl_OnCollide = {"weapons/crossbow/hitbod1.wav","weapons/crossbow/hitbod2.wav"}
		local doactualdmg = DamageInfo()
		doactualdmg:SetDamage(5)
		doactualdmg:SetDamageType(DMG_BURN)
		doactualdmg:SetDamagePosition(data.HitPos)
		doactualdmg:SetInflictor(self)
		doactualdmg:SetAttacker(self:GetOwner() || self)
		if IsValid(data.HitEntity) then data.HitEntity:TakeDamageInfo(doactualdmg,self) end
		if IsValid(data.HitEntity) && data.HitEntity:GetHullType() == HULL_TINY then data.HitEntity:Ignite(3) end
	else
		local spike = ents.Create("prop_dynamic")
		spike:SetModel("models/crossbow_bolt.mdl")
		spike:SetPos(data.HitPos + data.HitNormal + self:GetForward()*-15)
		spike:SetAngles(self:GetAngles())
		spike:Activate()
		spike:Spawn()
		timer.Simple(15,function() if IsValid(spike) then spike:Remove() end end)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/