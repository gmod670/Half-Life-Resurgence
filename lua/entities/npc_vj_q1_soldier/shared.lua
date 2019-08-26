ENT.Base 			= "npc_vj_creature_base" -- Full list of bases is in the base, or go back to this link and read the list: https://saludos.sites.google.com/site/vrejgaming/makingvjbaseaddon
ENT.Type 			= "ai"
ENT.PrintName 		= "Grunt"
ENT.Author 			= "Mawskeeto"
ENT.Contact 		= "http://steamcommunity.com/groups/mawwork"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Quake 1"

if (CLIENT) then
	local Name = "Grunt"
	local LangName = "npc_vj_q1_soldier"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end