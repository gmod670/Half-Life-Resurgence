AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(14,14,15), Vector(-14,-14,0))
	self:SetMaterial("models/hl_resurgence/hl2b/headcrab_poison/Blackcrab_sheet")
	self.CustomRunActivites = {self:VJ_LookupAnimationString("Scurry")}
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/