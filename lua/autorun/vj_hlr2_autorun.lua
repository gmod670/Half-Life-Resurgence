/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Half-Life Resurgence: Half Life 2"
local AddonName = "Half-Life Resurgence: Half Life 2"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_hlr2_autorun.lua"
-------------------------------------------------------

local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')
	
	-- Source Engine -------------------------------------------------------
	local vCat = "Half-Life Resurgence: HL2"
		-- Misc.
		VJ.AddNPC("Mounted Turret","sent_vj_hlr2_mountedturret",vCat)

		-- Antlions
		VJ.AddNPC("Antlion","npc_vj_hlr2_antlion",vCat)
		VJ.AddNPC("Antlion Worker","npc_vj_hlr2_antlion_worker",vCat)
		VJ.AddNPC("Antlion Guard","npc_vj_hlr2_antlion_guard",vCat)
		VJ.AddNPC("Antlion Guardian","npc_vj_hlr2_antlion_guardian",vCat)

		-- Combine
		VJ.AddNPC_HUMAN("Overwatch Soldier","npc_vj_hlr2_com_soldier",{"weapon_vj_smg1","weapon_vj_smg1","weapon_vj_smg1","weapon_vj_ar2","weapon_vj_ar2"},vCat)
		VJ.AddNPC_HUMAN("Overwatch Shotgun Soldier","npc_vj_hlr2_com_shotgunner",{"weapon_vj_spas12"},vCat)
		VJ.AddNPC_HUMAN("Overwatch Elite","npc_vj_hlr2_com_elite",{"weapon_vj_ar2"},vCat)
		VJ.AddNPC_HUMAN("Overwatch Prison Guard","npc_vj_hlr2_com_prospekt",{"weapon_vj_smg1","weapon_vj_smg1","weapon_vj_ar2","weapon_vj_ar2"},vCat)
		VJ.AddNPC_HUMAN("Overwatch Prison Shotgun Guard","npc_vj_hlr2_com_prospekt_sg",{"weapon_vj_spas12"},vCat)
		VJ.AddNPC_HUMAN("Civil Protection","npc_vj_hlr2_com_civilp",{"weapon_vj_9mmpistol","weapon_vj_smg1"},vCat)
		VJ.AddNPC_HUMAN("Civil Protection Elite","npc_vj_hlr2_com_civilp_elite",{"weapon_vj_smg1"},vCat)
		-- VJ.AddNPC("Combine Assassin","npc_vj_hlr2_com_assassin",vCat)

		-- Resistance
		-- VJ.AddNPC_HUMAN("Alyx Vance","npc_vj_hl2r_alyx",{"weapon_vj_hl2_alyxgun","weapon_vj_hl2_alyxgun","weapon_vj_hl2_alyxgun","weapon_vj_hl2_alyxgun","weapon_vj_9mmpistol""weapon_vj_smg1","weapon_vj_ar2","weapon_vj_spas12"},vCat)
		VJ.AddNPC_HUMAN("Barney Calhoun","npc_vj_hlr2_barney",{"weapon_vj_357","weapon_vj_9mmpistol","weapon_vj_glock17","weapon_vj_smg1","weapon_vj_smg1","weapon_vj_smg1","weapon_vj_ar2","weapon_vj_ar2","weapon_vj_spas12"},vCat)
		VJ.AddNPC_HUMAN("Father Grigori","npc_vj_hlr2_father_grigori",{"weapon_vj_hl2_annabelle"},vCat)
		VJ.AddNPC_HUMAN("Rebel","npc_vj_hlr2_rebel",{"weapon_vj_357","weapon_vj_9mmpistol","weapon_vj_glock17","weapon_vj_smg1","weapon_vj_smg1","weapon_vj_smg1","weapon_vj_k3","weapon_vj_k3","weapon_vj_ar2","weapon_vj_ar2","weapon_vj_ak47","weapon_vj_m16a1","weapon_vj_mp40","weapon_vj_spas12","weapon_vj_rpg","weapon_vj_blaster"},vCat)

		-- Xen Creatures
			-- Headcrab
			VJ.AddNPC("Zombie","npc_vj_hlr2_zombie",vCat)
			VJ.AddNPC("Zombie Assassin","npc_vj_hlr2b_zombie_assassin",vCat)
			VJ.AddNPC("Fast Zombie","npc_vj_hlr2_zombie_fast",vCat)
			VJ.AddNPC("Poison Zombie","npc_vj_hlr2_zombie_poison",vCat)
			VJ.AddNPC("Zombine","npc_vj_hlr2_zombine",vCat)
			VJ.AddNPC("Headcrab","npc_vj_hlr2_headcrab",vCat)
			VJ.AddNPC("Fast Headcrab","npc_vj_hlr2_headcrab_fast",vCat)
			VJ.AddNPC("Poison Headcrab","npc_vj_hlr2_headcrab_poison",vCat)
		
		-- Wild Life
		VJ.AddNPC("Hydra","npc_vj_hlr2b_hydra",vCat)
		
		-- Weapons
		VJ.AddNPCWeapon("VJ_Annabelle","weapon_vj_hl2_annabelle",false,vCat)
		VJ.AddNPCWeapon("VJ_Alyx_Gun","weapon_vj_hl2_alyxgun",false,vCat)
	
	-- ConVars --
	VJ.AddConVar("vj_hl2c_soldier_h",60)
	VJ.AddConVar("vj_hl2c_soldierprison_h",75)
	VJ.AddConVar("vj_hl2c_soldierelite_h",100)
	VJ.AddConVar("vj_hl2c_soldier_d",10)
	
	VJ.AddConVar("vj_hl2c_metrocop_h",50)
	VJ.AddConVar("vj_hl2c_elitecop_h",60)
	VJ.AddConVar("vj_hl2c_metrocop_d",10)
	
	VJ.AddConVar("vj_hl2r_rebel_h",50)
	VJ.AddConVar("vj_hl2r_rebel_d",10)
	
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