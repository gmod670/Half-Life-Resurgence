if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Grunt's Shotgun"
SWEP.Author 					= "oteek"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Base Dummies"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel					= "" -- The view model (First person)
SWEP.WorldModel					= "" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.HoldType 					= "" -- List of holdtypes are in the GMod wiki
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= false