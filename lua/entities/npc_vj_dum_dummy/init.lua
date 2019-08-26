AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
local models = {
		"models/Humans/Group01/Female_01.mdl", 
		"models/Humans/Group01/Female_02.mdl", 
		"models/Humans/Group01/Female_04.mdl", 
		"models/Humans/Group01/Female_06.mdl", 
		"models/Humans/Group02/Female_01.mdl", 
		"models/Humans/Group02/Female_02.mdl", 
		"models/Humans/Group02/Female_04.mdl", 
		"models/Humans/Group02/Female_06.mdl", 
		"models/mossman.mdl", 
		"models/alyx.mdl", 
		"models/postal2/test/fatcunt.mdl"
		}

ENT.Model = models -- Leave empty if using more than one model
ENT.StartHealth = 50
ENT.LeapAttackDamage = 10
ENT.BloodColor = "Red"
ENT.CanFlinch = 1
ENT.MeleeAttackDamage = 20
ENT.HasExtraMeleeAttackSounds = true
ENT.AnimTbl_MeleeAttack = { "vjseq_meleeattack01" }
ENT.AnimTbl_LeapAttack = { "vjseq_jump_holding_jump" }
--ENT.HasLeapAttack = true
ENT.SoundTbl_Alert = { "WFemale/WFemaleDialog_uax-0000000511.wav", "WFemale/WFemaleDialog_uax-0000000510.wav", "WFemale/WFemaleDialog_uax-0000000507.wav", "WFemale/WFemaleDialog_uax-0000000506.wav", "WFemale/WFemaleDialog_uax-0000000505.wav", "WFemale/WFemaleDialog_uax-0000000504.wav", "WFemale/WFemaleDialog_uax-0000000498.wav", "WFemale/WFemaleDialog_uax-0000000495.wav", "WFemale/WFemaleDialog_uax-0000000490.wav", "WFemale/WFemaleDialog_uax-0000000483.wav", "WFemale/WFemaleDialog_uax-0000000477.wav", "WFemale/WFemaleDialog_uax-0000000471.wav", "WFemale/WFemaleDialog_uax-0000000467.wav", "WFemale/WFemaleDialog_uax-0000000466.wav", "WFemale/WFemaleDialog_uax-0000000465.wav", "WFemale/WFemaleDialog_uax-0000000463.wav", "WFemale/WFemaleDialog_uax-0000000461.wav", "WFemale/WFemaleDialog_uax-0000000446.wav", "WFemale/WFemaleDialog_uax-0000000433", "WFemale/WFemaleDialog_uax-0000000419.wav", "WFemale/WFemaleDialog_uax-0000000382.wav", "WFemale/WFemaleDialog_uax-0000000379.wav", "WFemale/WFemaleDialog_uax-0000000369.wav", "WFemale/WFemaleDialog_uax-0000000365.wav", "WFemale/WFemaleDialog_uax-0000000363.wav", "WFemale/WFemaleDialog_uax-0000000361.wav", "WFemale/WFemaleDialog_uax-0000000359.wav", "WFemale/WFemaleDialog_uax-0000000351.wav", "WFemale/WFemaleDialog_uax-0000000343.wav", "WFemale/WFemaleDialog_uax-0000000341.wav", "WFemale/WFemaleDialog_uax-0000000326.wav", "WFemale/WFemaleDialog_uax-0000000324.wav", "WFemale/WFemaleDialog_uax-0000000321.wav", "WFemale/WFemaleDialog_uax-0000000312.wav", "WFemale/WFemaleDialog_uax-0000000308.wav", "WFemale/WFemaleDialog_uax-0000000281.wav", "WFemale/WFemaleDialog_uax-0000000273.wav", "WFemale/WFemaleDialog_uax-0000000215.wav", "WFemale/WFemaleDialog_uax-0000000187.wav" }
ENT.SoundTbl_Idle = { "WFemale/WFemaleDialog_uax-0000000512.wav", "WFemale/WFemaleDialog_uax-0000000503.wav", "WFemale/WFemaleDialog_uax-0000000502.wav", "WFemale/WFemaleDialog_uax-0000000501.wav", "WFemale/WFemaleDialog_uax-0000000500.wav", "WFemale/WFemaleDialog_uax-0000000492.wav", "WFemale/WFemaleDialog_uax-0000000489.wav", "WFemale/WFemaleDialog_uax-0000000476.wav", "WFemale/WFemaleDialog_uax-0000000460.wav", "WFemale/WFemaleDialog_uax-0000000455.wav", "WFemale/WFemaleDialog_uax-0000000444.wav", "WFemale/WFemaleDialog_uax-0000000442.wav", "WFemale/WFemaleDialog_uax-0000000441.wav", "WFemale/WFemaleDialog_uax-0000000438.wav", "WFemale/WFemaleDialog_uax-0000000437.wav", "WFemale/WFemaleDialog_uax-0000000434.wav", "WFemale/WFemaleDialog_uax-0000000424.wav", "WFemale/WFemaleDialog_uax-0000000413.wav", "WFemale/WFemaleDialog_uax-0000000378.wav", "WFemale/WFemaleDialog_uax-0000000374.wav", "WFemale/WFemaleDialog_uax-0000000346.wav", "WFemale/WFemaleDialog_uax-0000000344.wav", "WFemale/WFemaleDialog_uax-0000000341.wav", "WFemale/WFemaleDialog_uax-0000000339.wav", "WFemale/WFemaleDialog_uax-0000000335.wav", "WFemale/WFemaleDialog_uax-0000000322.wav", "WFemale/WFemaleDialog_uax-0000000320.wav", "WFemale/WFemaleDialog_uax-0000000316.wav", "WFemale/WFemaleDialog_uax-0000000310.wav", "WFemale/WFemaleDialog_uax-0000000309.wav", "WFemale/WFemaleDialog_uax-0000000287.wav", "WFemale/WFemaleDialog_uax-0000000282.wav", "WFemale/WFemaleDialog_uax-0000000279.wav", "WFemale/WFemaleDialog_uax-0000000278.wav", "WFemale/WFemaleDialog_uax-0000000276.wav", "WFemale/WFemaleDialog_uax-0000000275.wav", "WFemale/WFemaleDialog_uax-0000000274.wav", "WFemale/WFemaleDialog_uax-0000000265.wav", "WFemale/WFemaleDialog_uax-0000000264.wav", "WFemale/WFemaleDialog_uax-0000000259.wav", "WFemale/WFemaleDialog_uax-0000000258.wav", "WFemale/WFemaleDialog_uax-0000000257.wav", "WFemale/WFemaleDialog_uax-0000000255.wav", "WFemale/WFemaleDialog_uax-0000000252.wav", "WFemale/WFemaleDialog_uax-0000000251.wav", "WFemale/WFemaleDialog_uax-0000000242.wav", "WFemale/WFemaleDialog_uax-0000000218.wav", "WFemale/WFemaleDialog_uax-0000000177.wav" }
ENT.SoundTbl_MeleeAttack = { "WFemale/WFemaleDialog_uax-0000000455.wav", "WFemale/WFemaleDialog_uax-0000000400.wav", "WFemale/WFemaleDialog_uax-0000000370.wav", "WFemale/WFemaleDialog_uax-0000000369.wav", "WFemale/WFemaleDialog_uax-0000000332.wav", "WFemale/WFemaleDialog_uax-0000000330.wav", "WFemale/WFemaleDialog_uax-0000000300.wav", "WFemale/WFemaleDialog_uax-0000000221.wav", "WFemale/WFemaleDialog_uax-0000000216.wav", "WFemale/WFemaleDialog_uax-0000000215.wav" }
ENT.SoundTbl_Pain = { "WFemale/WFemaleDialog_uax-0000000515.wav", "WFemale/WFemaleDialog_uax-0000000513.wav", "WFemale/WFemaleDialog_uax-0000000499.wav", "WFemale/WFemaleDialog_uax-0000000478.wav", "WFemale/WFemaleDialog_uax-0000000475.wav", "WFemale/WFemaleDialog_uax-0000000468.wav", "WFemale/WFemaleDialog_uax-0000000450.wav", "WFemale/WFemaleDialog_uax-0000000405.wav", "WFemale/WFemaleDialog_uax-0000000376.wav", "WFemale/WFemaleDialog_uax-0000000368.wav", "WFemale/WFemaleDialog_uax-0000000353.wav", "WFemale/WFemaleDialog_uax-0000000238.wav", "WFemale/WFemaleDialog_uax-0000000217.wav", "WFemale/WFemaleDialog_uax-0000000176.wav" }
ENT.SoundTbl_Death = { "WFemale/WFemaleDialog_uax-0000000513.wav", "WFemale/WFemaleDialog_uax-0000000499.wav", "WFemale/WFemaleDialog_uax-0000000478.wav", "WFemale/WFemaleDialog_uax-0000000475.wav", "WFemale/WFemaleDialog_uax-0000000405.wav", "WFemale/WFemaleDialog_uax-0000000376.wav", "WFemale/WFemaleDialog_uax-0000000368.wav", "WFemale/WFemaleDialog_uax-0000000394.wav", "WFemale/WFemaleDialog_uax-0000000393.wav", "WFemale/WFemaleDialog_uax-0000000392.wav", "WFemale/WFemaleDialog_uax-0000000289.wav" }
ENT.SoundTbl_CallForHelp = { "WFemale/WFemaleDialog_uax-0000000497.wav", "WFemale/WFemaleDialog_uax-0000000487.wav", "WFemale/WFemaleDialog_uax-0000000486.wav", "WFemale/WFemaleDialog_uax-0000000448.wav", "WFemale/WFemaleDialog_uax-0000000399.wav", "WFemale/WFemaleDialog_uax-0000000398.wav", "WFemale/WFemaleDialog_uax-0000000397.wav", "WFemale/WFemaleDialog_uax-0000000396.wav", "WFemale/WFemaleDialog_uax-0000000394.wav", "WFemale/WFemaleDialog_uax-0000000393.wav", "WFemale/WFemaleDialog_uax-0000000392.wav", "WFemale/WFemaleDialog_uax-0000000385.wav", "WFemale/WFemaleDialog_uax-0000000384.wav", "WFemale/WFemaleDialog_uax-0000000383.wav", "WFemale/WFemaleDialog_uax-0000000382.wav", "WFemale/WFemaleDialog_uax-0000000371.wav", "WFemale/WFemaleDialog_uax-0000000337.wav", "WFemale/WFemaleDialog_uax-0000000308.wav", "WFemale/WFemaleDialog_uax-0000000296.wav", "WFemale/WFemaleDialog_uax-0000000290.wav", "WFemale/WFemaleDialog_uax-0000000285.wav", "WFemale/WFemaleDialog_uax-0000000244.wav" }

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/