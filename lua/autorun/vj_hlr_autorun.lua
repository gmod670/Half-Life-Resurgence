/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Half-Life Resurgence"
local AddonName = "Half-Life Resurgence"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_hlr_autorun.lua"
-------------------------------------------------------

local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')
	
	-- Gold Source Engine -------------------------------------------------------
	local vCat = "Half-Life Resurgence: HL1"
	VJ.AddCategoryInfo(vCat, {Icon = "vj_hl/icons/hl1.png"})
		
		-- HECU
		VJ.AddNPC("Human Grunt","npc_vj_hlr1_hgrunt",vCat)
		VJ.AddNPC("Human Sergeant","npc_vj_hlr1_hgrunt_serg",vCat)
		VJ.AddNPC("Robot Grunt","npc_vj_hlr1_rgrunt",vCat)
		VJ.AddNPC("HECU Sentry Gun","npc_vj_hlr1_sentry",vCat)
		VJ.AddNPC("M2A3 Bradley","npc_vj_hlr1_m2a3bradley",vCat)
		VJ.AddNPC("M1A1 Abrams","npc_vj_hlr1_m1a1abrams",vCat)
			-- Opposing Force
			VJ.AddNPC("Human Grunt (OppF)","npc_vj_hlrof_hgrunt",vCat)
			VJ.AddNPC("Human Grunt Medic (OppF)","npc_vj_hlrof_hgrunt_med",vCat)
			VJ.AddNPC("Human Grunt Engineer (OppF)","npc_vj_hlrof_hgrunt_eng",vCat)
			-- Decay
			VJ.AddNPC("Decay HECU Sentry Gun","npc_vj_hlrdc_sentry",vCat)
			-- Alpha
			VJ.AddNPC("Alpha Human Grunt","npc_vj_hlr1a_hgrunt",vCat)
		
		-- Black Ops
		VJ.AddNPC("Black Ops Female Assassin","npc_vj_hlr1_assassin_female",vCat)
		VJ.AddNPC("Black Ops Male Assassin","npc_vj_hlrof_assassin_male",vCat)
		VJ.AddNPC("Black Ops Robot Assassin","npc_vj_hlrof_assassin_rgrunt",vCat)
		
		-- Black Mesa Security Weaponry
		VJ.AddNPC("Ceiling Turret (Large)","npc_vj_hlr1_turret",vCat,false,function(x) x.OnCeiling = true x.Offset = 0 end)
		VJ.AddNPC("Ceiling Turret (Small)","npc_vj_hlr1_turret_small",vCat,false,function(x) x.OnCeiling = true x.Offset = 0 end)

		-- Black Mesa Personnel
		VJ.AddNPC("Security Guard","npc_vj_hlr1_securityguard",vCat)
		VJ.AddNPC("Scientist","npc_vj_hlr1_scientist",vCat)
			-- Blue Shift
			VJ.AddNPC("Dr. Rosenberg","npc_vj_hlrbs_rosenberg",vCat)
			-- Opposing Force
			VJ.AddNPC("Cleansuit Scientist","npc_vj_hlrof_cleansuitsci",vCat)
			VJ.AddNPC("Otis Laurey","npc_vj_hlrof_otis",vCat)
			-- Decay
			VJ.AddNPC("Dr. Richard Keller","npc_vj_hlrdc_keller",vCat)
			-- Alpha
			VJ.AddNPC("Alpha Security Guard","npc_vj_hlr1a_securityguard",vCat)
			VJ.AddNPC("Alpha Scientist","npc_vj_hlr1a_scientist",vCat)
			VJ.AddNPC("Ivan the Space Biker","npc_vj_hlr1a_ivan",vCat)
		
		-- Xen Creatures
		VJ.AddNPC("Flocking Floater","npc_vj_hlr1_floater",vCat)
		VJ.AddNPC("Alien Controller","npc_vj_hlr1_aliencontroller",vCat)
		VJ.AddNPC("Alien Grunt","npc_vj_hlr1_aliengrunt",vCat)
		VJ.AddNPC("Alien Slave","npc_vj_hlr1_alienslave",vCat)
		VJ.AddNPC("Bullsquid","npc_vj_hlr1_bullsquid",vCat)
		VJ.AddNPC("Gargantua","npc_vj_hlr1_garg",vCat)
		VJ.AddNPC("Houndeye","npc_vj_hlr1_houndeye",vCat)
		VJ.AddNPC("Kingpin","npc_vj_hlr1_kingpin",vCat)
		VJ.AddNPC("Snark","npc_vj_hlr1_snark",vCat)
		VJ.AddNPC("Snark Nest","npc_vj_hlr1_snarknest",vCat)
		VJ.AddNPC("Ichthyosaur","npc_vj_hlr1_ichthyosaur",vCat)
		VJ.AddNPC("Archer","npc_vj_hlr1_archer",vCat)
		VJ.AddNPC("Leech","npc_vj_hlr1_leech",vCat)
		VJ.AddNPC("Chumtoad","npc_vj_hlr1_chumtoad",vCat)
		VJ.AddNPC("Boid","npc_vj_hlr1_boid",vCat)
		VJ.AddNPC("AFlock","npc_vj_hlr1_aflock",vCat)
		VJ.AddNPC("Protozoan","npc_vj_hlr1_protozoan",vCat)
		VJ.AddNPC("Tentacle","npc_vj_hlr1_tentacle",vCat)
		VJ.AddNPC("Panther Eye","npc_vj_hlr1_panthereye",vCat)
		VJ.AddNPC("Control Sphere","npc_vj_hlr1_controlsphere",vCat)
		VJ.AddNPC("Mr. Friendly","npc_vj_hlr1_mrfriendly",vCat)
		VJ.AddNPC("Nihilanth","npc_vj_hlr1_nihilanth",vCat)
		VJ.AddNPC("Barnacle","npc_vj_hlr1_barnacle",vCat,false,function(x) x.OnCeiling = true x.Offset = 0 end)
		VJ.AddNPC("Xen Tree","npc_vj_hlr1_xentree",vCat)
		VJ.AddNPC("Xen Hair","sent_vj_xen_hair",vCat)
		VJ.AddNPC("Xen Spore (Large)","sent_vj_xen_spore_large",vCat)
		VJ.AddNPC("Xen Spore (Medium)","sent_vj_xen_spore_medium",vCat)
		VJ.AddNPC("Xen Spore (Small)","sent_vj_xen_spore_small",vCat)
		VJ.AddNPC("Xen Plant Light","sent_vj_xen_plant_light",vCat)
		VJ.AddNPC("Xen Crystal","sent_vj_xen_crystal",vCat)
			-- Extras
			VJ.AddNPC("Portal (Xen)","sent_vj_hlr_alientp",vCat)
			VJ.AddNPC("Portal (Race X)","sent_vj_hlr_alientp_x",vCat)
			-- Opposing Force
			VJ.AddNPC("Penguin","npc_vj_hlrof_penguin",vCat)
			VJ.AddNPC("Penguin Nest","npc_vj_hlrof_penguinnest",vCat)
			-- Headcrab
			VJ.AddNPC("Gonarch","npc_vj_hlr1_gonarch",vCat)
			VJ.AddNPC("Headcrab","npc_vj_hlr1_headcrab",vCat)
			VJ.AddNPC("Baby Headcrab","npc_vj_hlr1_headcrab_baby",vCat)
			VJ.AddNPC("Zombie","npc_vj_hlr1_zombie",vCat)
				-- Alpha
				VJ.AddNPC("Alpha Zombie","npc_vj_hlr1a_zombie",vCat)
				VJ.AddNPC("Alpha Headcrab","npc_vj_hlr1a_headcrab",vCat)
				-- Opposing Force
				VJ.AddNPC("Zombie Security Guard","npc_vj_hlrof_zombie_sec",vCat)
				VJ.AddNPC("Zombie Soldier","npc_vj_hlrof_zombie_soldier",vCat)
				VJ.AddNPC("Gonome","npc_vj_hlrof_gonome",vCat)
		
		-- Race X
		VJ.AddNPC("Shock Trooper","npc_vj_hlrof_shocktrooper",vCat)
		VJ.AddNPC("Shock Roach","npc_vj_hlrof_shockroach",vCat)
		VJ.AddNPC("Pit Drone","npc_vj_hlrof_pitdrone",vCat)
		VJ.AddNPC("Pit Worm","npc_vj_hlrof_pitworm",vCat)
		VJ.AddNPC("Voltigore","npc_vj_hlrof_voltigore",vCat)
		VJ.AddNPC("Baby Voltigore","npc_vj_hlrof_voltigore_baby",vCat)
		VJ.AddNPC("Gene Worm","npc_vj_hlrof_geneworm",vCat)
		
		-- Animals
		VJ.AddNPC("Cockroach","npc_vj_hlr1_cockroach",vCat)
		
		-- Unknown
		VJ.AddNPC("The G-Man","npc_vj_hlr1_gman",vCat)

		-- Sven Co-Op
		VJ.AddNPC("Baby Gargantua","npc_vj_hlrsv_garg_baby",vCat)
		VJ.AddNPC("Tor","npc_vj_hlrsv_tor",vCat)
		
		-- Weapons
		//VJ.AddNPCWeapon("VJ_HLR1_Glock17","weapon_vj_hlr1_glock17",false,vCat)
		//VJ.AddNPCWeapon("VJ_HLR1_MP5","weapon_vj_hlr1_mp5",false,vCat)
		
	-- Decals
		-- Blood
		game.AddDecal("VJ_HLR_Blood_Red",{"vj_hl/decals/hl_blood01","vj_hl/decals/hl_blood02","vj_hl/decals/hl_blood03","vj_hl/decals/hl_blood04","vj_hl/decals/hl_blood05","vj_hl/decals/hl_blood06","vj_hl/decals/hl_blood07","vj_hl/decals/hl_blood08"})
		game.AddDecal("VJ_HLR_Blood_Red_Large",{"vj_hl/decals/hl_bigblood01","vj_hl/decals/hl_bigblood02"})
		game.AddDecal("VJ_HLR_Blood_Yellow",{"vj_hl/decals/hl_yblood01","vj_hl/decals/hl_yblood02","vj_hl/decals/hl_yblood03","vj_hl/decals/hl_yblood04","vj_hl/decals/hl_yblood05","vj_hl/decals/hl_yblood06"})
		-- Spits
		game.AddDecal("VJ_HLR_Spit_Acid",{"vj_hl/decals/spit1","vj_hl/decals/spit2"})
		//game.AddDecal("VJ_HLR_Spit_Gonarch",{"vj_hl/decals/gonarch"})
		game.AddDecal("VJ_HLR_Gonarch_Blob",{"vj_hl/decals/mommablob"})
		-- Scorchs
		game.AddDecal("VJ_HLR_Scorch",{"vj_hl/decals/scorch1","vj_hl/decals/scorch2","vj_hl/decals/scorch3"})
		game.AddDecal("VJ_HLR_Scorch_Small",{"vj_hl/decals/smscorch1","vj_hl/decals/smscorch2","vj_hl/decals/smscorch3"})
		game.AddDecal("VJ_HLR_Gargantua_Stomp",{"vj_hl/decals/gargstomp"})
		-- Bullet Holes
		game.AddDecal("VJ_HLR_BULLET_HOLE",{"vj_hl/decals/shot1","vj_hl/decals/shot2","vj_hl/decals/shot3","vj_hl/decals/shot4","vj_hl/decals/shot5"})
		/*
		function SWEP:CustomOnPrimaryAttack_BulletCallback(attacker,tr,dmginfo)
			util.Decal("VJ_HLR_BULLET_HOLE", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		end
		*/
	
	-- Particles
	VJ.AddParticle("particles/advisor.pcf",{})
	VJ.AddParticle("particles/choreo_dog_v_strider.pcf",{})
	VJ.AddParticle("particles/vj_hl_blood.pcf",{
		"vj_hl_blood_red",
		"vj_hl_blood_red_large",
		"vj_hl_blood_yellow",
		"vj_hl_blood_yellow_large",
		"vj_hl_blood_boob_red",
		"vj_hl_blood_boob_yellow",
	})
	VJ.AddParticle("particles/vj_hl_garg_flame.pcf",{
		"vj_hl_garg_flame",
		"vj_hl_garg_flame_small",
	})
	VJ.AddParticle("particles/vj_hl_shocktrooper.pcf",{
		"vj_hl_shockroach",
		"vj_hl_shockroach_aura",
		"vj_hl_shockroach_bright",
		"vj_hl_shockroach_trail",
	})
	VJ.AddParticle("particles/vj_hl_sporegrenade.pcf",{
		"vj_hl_spore",
		"vj_hl_spore_idle",
		"vj_hl_spore_splash1",
		"vj_hl_spore_splash2",
	})
	VJ.AddParticle("particles/vj_hl_gonome.pcf",{
		"vj_hl_gonome",
		"vj_hl_gonome_idle",
	})
	VJ.AddParticle("particles/vj_hl_spit.pcf",{
		"vj_hl_spit_bullsquid",
		"vj_hl_spit_bullsquid_impact",
		"vj_hl_spit_drone",
		"vj_hl_spit_drone_impact",
		"vj_hl_spit_drone_spawn",
		"vj_hl_spit_gonarch",
		"vj_hl_spit_gonarch_impact",
		"vj_hl_spit_spore_spawn",
	})
	VJ.AddParticle("particles/vj_hl_torch.pcf",{
		"vj_hl_torch",
	})
	VJ.AddParticle("particles/vj_hl_muzzle.pcf",{
        "vj_hl_muz1", -- Tau
        "vj_hl_muz2", -- HD pistol
        "vj_hl_muz3", -- HD MP5
        "vj_hl_muz4", -- HD Hornet
        "vj_hl_muz5", -- LD Hornet 1
        "vj_hl_muz6", -- LD Hornet 2
        "vj_hl_muz7", -- HD Hornet 2?
        "vj_hl_muz8", -- HD Brush turret
        "vj_hl_muzzle1", -- LD Pistol (Also used by LD brush turret, I'll make another one that's bigger)
        "vj_hl_muzzle2", -- LD MP5
        "vj_hl_muzzle3", -- LD Shotgun
        "vj_hl_muzzle4", -- HD Pistol 2?
		"vj_hl_muzzlebigturret",
	})
	VJ.AddParticle("particles/vj_hlr_garg_stomp.pcf",{
		"vj_hlr_garg_stomp",
	})
	VJ.AddParticle("particles/vj_hlr_nihilanth.pcf",{
		"vj_hlr_nihilanth_chargeorb",
		"vj_hlr_nihilanth_deathorbs",
		"vj_hlr_nihilanth_deathorbs_white",
	})
	
	-- Precache Models --
	util.PrecacheModel("models/vj_hlr/gibs/agib1.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/agib2.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/agib3.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/agib4.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/agib5.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/agib6.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/agib7.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/agib8.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/agib9.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/agib10.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/flesh1.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/flesh2.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/flesh3.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/flesh4.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/hgib_b_bone.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/hgib_b_gib.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/hgib_guts.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/hgib_hmeat.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/hgib_lung.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/hgib_skull.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/hgib_legbone.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/gib_hgrunt.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/zombiegib.mdl")
	util.PrecacheModel("models/vj_hlr/gibs/islavegib.mdl")
	
	-- ConVars --
	//VJ.AddConVar("vj_hl2c_soldier_h",60)
	
	-- Meta Tables --
	local NPC = FindMetaTable("NPC")

	function NPC:VJ_GetSequenceID(anim)
		local tb = self:GetSequenceList()
		local i = 0
		for k,v in ipairs(tb) do
			if v == anim then
				i = k; break
			end
		end
		return i
	end

	function NPC:VJ_LookupAnimationString(seq)
		return self:GetSequenceInfo(self:VJ_GetSequenceID(seq)).activity
	end
	
	-- Temp weapon hook!
	/*hook.Add("PlayerSpawn","VJ_HL1SWEPs_AutoSpawn",function(ply)
		if GetConVarNumber("hl1_sv_loadout") == 1 then
			ply:Give("weapon_hl1_357")
			ply:Give("weapon_hl1_glock")
			ply:Give("weapon_hl1_crossbow")
			ply:Give("weapon_hl1_egon")
			ply:Give("weapon_hl1_handgrenade")
			ply:Give("weapon_hl1_hornetgun")
			ply:Give("weapon_hl1_mp5")
			ply:Give("weapon_hl1_rpg")
			ply:Give("weapon_hl1_satchel")
			ply:Give("weapon_hl1_shotgun")
			//ply:Give("weapon_hl1_snark")
			ply:Give("weapon_hl1_gauss")
			ply:Give("weapon_hl1_tripmine")
		end
	end)*/
	
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end

				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end