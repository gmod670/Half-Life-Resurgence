ENT.Base 			= "npc_vj_creature_base" -- Full list of bases is in the base, or go back to this link and read the list: https://saludos.sites.google.com/site/vrejgaming/makingvjbaseaddon
ENT.Type 			= "ai"
ENT.PrintName 		= "Dummy"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Dummies"

if (CLIENT) then
	local Name = "Dummy"
	local LangName = "npc_vj_dum_dummy"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end