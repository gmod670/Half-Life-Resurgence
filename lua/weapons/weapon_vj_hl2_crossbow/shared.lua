if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Crossbow"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
-- SWEP.Category					= "VJ Base"
	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if (CLIENT) then
SWEP.Slot						= 4 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos					= 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.UseHands					= true
end
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true
SWEP.NPC_NextPrimaryFire 		= 3.5 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire	 		= 0 -- How much time until the bullet/projectile is fired?
SWEP.NPC_ReloadSound			= {"weapons/crossbow/reload1.wav"}
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel					= "models/vj_weapons/c_crossbow.mdl"
SWEP.WorldModel					= "models/weapons/w_crossbow.mdl"
SWEP.HoldType 					= "crossbow"
SWEP.ViewModelFOV				= 60 -- Player FOV for the view model
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= false
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.ClipSize			= 1 -- Max amount of bullets per clip
SWEP.Primary.Delay				= 0.3 -- Time until it can shoot again
SWEP.Primary.Ammo				= "CrossbowBolt" -- Ammo type
SWEP.Primary.Sound				= {"weapons/crossbow/fire1.wav"}
SWEP.Primary.DisableBulletCode	= true -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.PrimaryEffects_MuzzleFlash = false
SWEP.PrimaryEffects_SpawnShells = false
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
	if (CLIENT) then return end
	local SpawnBlaserRod = ents.Create("obj_vj_hl2r_crossbowbolt")
	local OwnerPos = self:GetOwner():GetShootPos()
	local OwnerAng = self:GetOwner():GetAimVector():Angle()
	OwnerPos = OwnerPos + OwnerAng:Forward()*-20 + OwnerAng:Up()*-9 + OwnerAng:Right()*10
	SpawnBlaserRod:SetPos(self:GetAttachment(self:LookupAttachment("muzzle")).Pos)
	SpawnBlaserRod:SetAngles(self:GetOwner():GetAngles())
	SpawnBlaserRod:SetOwner(self:GetOwner())
	SpawnBlaserRod:Activate()
	SpawnBlaserRod:Spawn()

	local phy = SpawnBlaserRod:GetPhysicsObject()
	if phy:IsValid() then
		phy:ApplyForceCenter(((self:GetOwner():GetEnemy():GetPos()+self:GetOwner():GetEnemy():OBBCenter()+self:GetOwner():GetEnemy():GetUp()*-45) - self:GetOwner():GetPos()+self:GetOwner():OBBCenter()+self:GetOwner():GetEnemy():GetUp()*-45) * 4000)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_ReloadWeapon()
	self:GetOwner().NextThrowGrenadeT = self:GetOwner().NextThrowGrenadeT + 2
	self:CustomOnNPC_Reload()
	VJ_EmitSound(self:GetOwner(),self.NPC_ReloadSound,self.NPC_ReloadSoundLevel)
	timer.Simple(SoundDuration("weapons/crossbow/reload1.wav"),function()
		if IsValid(self) && IsValid(self:GetOwner()) then
			VJ_EmitSound(self:GetOwner(),{"weapons/crossbow/bolt_load1.wav","weapons/crossbow/bolt_load2.wav"},self.NPC_ReloadSoundLevel)
		end
	end)
end