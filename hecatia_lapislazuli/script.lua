--action pings
local mode
local hasSekibanki = false
function pings.other()
	mode = "other"

	models.player_model.all.Head.hair.earthHair:setVisible(false)
	models.player_model.all.Head.hair.otherHair:setVisible(true)
	models.player_model.all.Head.hair.moonHair:setVisible(false)

	models.player_model.all.Body.logo.logoEarth:setVisible(false)
	models.player_model.all.Body.logo.logoOther:setVisible(true)
	models.player_model.all.Body.logo.logoMoon:setVisible(false)
	
	if (hasSekibanki == false) then
		models.player_model.all.Head.mess.top.earthTop:setVisible(false)
		models.player_model.all.Head.mess.top.otherTop:setVisible(true)
		models.player_model.all.Head.mess.top.moonTop:setVisible(false)
		models.player_model.all.Head.mess.top.head_of_sekibanki:setVisible(false)
	else
		models.player_model.all.Head.mess.top.earthTop:setVisible(false)
		models.player_model.all.Head.mess.top.otherTop:setVisible(false)
		models.player_model.all.Head.mess.top.moonTop:setVisible(false)
		models.player_model.all.Head.mess.top.head_of_sekibanki:setVisible(true)
	end
	
	models.player_model.all.Head.mess.sideRight.moonSideRight:setVisible(true)
	models.player_model.all.Head.mess.sideRight.earthSideRight:setVisible(false)
	models.player_model.all.Head.mess.sideRight.otherSideRight:setVisible(false)
	
	models.player_model.all.Head.mess.sideLeft.earthSideLeft:setVisible(true)
	models.player_model.all.Head.mess.sideLeft.otherSideLeft:setVisible(false)
	models.player_model.all.Head.mess.sideLeft.moonSideLeft:setVisible(false)
end

function pings.moon()
	mode = "moon"

	models.player_model.all.Head.hair.earthHair:setVisible(false)
	models.player_model.all.Head.hair.otherHair:setVisible(false)
	models.player_model.all.Head.hair.moonHair:setVisible(true)

	models.player_model.all.Body.logo.logoEarth:setVisible(false)
	models.player_model.all.Body.logo.logoOther:setVisible(false)
	models.player_model.all.Body.logo.logoMoon:setVisible(true)
	
	if (hasSekibanki == false) then
		models.player_model.all.Head.mess.top.earthTop:setVisible(false)
		models.player_model.all.Head.mess.top.otherTop:setVisible(false)
		models.player_model.all.Head.mess.top.moonTop:setVisible(true)
		models.player_model.all.Head.mess.top.head_of_sekibanki:setVisible(false)
	else
		models.player_model.all.Head.mess.top.earthTop:setVisible(false)
		models.player_model.all.Head.mess.top.otherTop:setVisible(false)
		models.player_model.all.Head.mess.top.moonTop:setVisible(false)
		models.player_model.all.Head.mess.top.head_of_sekibanki:setVisible(true)
	end
	
	models.player_model.all.Head.mess.sideRight.moonSideRight:setVisible(false)
	models.player_model.all.Head.mess.sideRight.earthSideRight:setVisible(false)
	models.player_model.all.Head.mess.sideRight.otherSideRight:setVisible(true)
	
	models.player_model.all.Head.mess.sideLeft.earthSideLeft:setVisible(true)
	models.player_model.all.Head.mess.sideLeft.otherSideLeft:setVisible(false)
	models.player_model.all.Head.mess.sideLeft.moonSideLeft:setVisible(false)
end

function pings.earth()
	mode = "earth"

	models.player_model.all.Head.hair.earthHair:setVisible(true)
	models.player_model.all.Head.hair.otherHair:setVisible(false)
	models.player_model.all.Head.hair.moonHair:setVisible(false)

	models.player_model.all.Body.logo.logoEarth:setVisible(true)
	models.player_model.all.Body.logo.logoOther:setVisible(false)
	models.player_model.all.Body.logo.logoMoon:setVisible(false)
	
	if (hasSekibanki == false) then
		models.player_model.all.Head.mess.top.earthTop:setVisible(true)
		models.player_model.all.Head.mess.top.otherTop:setVisible(false)
		models.player_model.all.Head.mess.top.moonTop:setVisible(false)
		models.player_model.all.Head.mess.top.head_of_sekibanki:setVisible(false)
	else
		models.player_model.all.Head.mess.top.earthTop:setVisible(false)
		models.player_model.all.Head.mess.top.otherTop:setVisible(false)
		models.player_model.all.Head.mess.top.moonTop:setVisible(false)
		models.player_model.all.Head.mess.top.head_of_sekibanki:setVisible(true)
	end
	
	models.player_model.all.Head.mess.sideRight.moonSideRight:setVisible(true)
	models.player_model.all.Head.mess.sideRight.earthSideRight:setVisible(false)
	models.player_model.all.Head.mess.sideRight.otherSideRight:setVisible(false)
	
	models.player_model.all.Head.mess.sideLeft.earthSideLeft:setVisible(false)
	models.player_model.all.Head.mess.sideLeft.otherSideLeft:setVisible(true)
	models.player_model.all.Head.mess.sideLeft.moonSideLeft:setVisible(false)
end

function pings.seki()
	if (hasSekibanki == true) then hasSekibanki = false
	else hasSekibanki = true end
	
	updateMode()
end

function updateMode()
	if (mode == "other") then pings.other() end
	if (mode == "moon") then pings.moon() end
	if (mode == "earth") then pings.earth() end
end

pings.other()

--action wheel
local wheel = action_wheel:newPage()
action_wheel:setPage(wheel)

local otheraction = wheel:newAction()
otheraction:setItem("minecraft:redstone_block")
otheraction:setTitle("Otherworlds")
otheraction:onLeftClick(function (self)
	pings.other()
end)

local moonaction = wheel:newAction()
moonaction:setItem("minecraft:end_stone")
moonaction:setTitle("Moon")
moonaction:onLeftClick(function (self)
	pings.moon()
end)

local earthaction = wheel:newAction()
earthaction:setItem("minecraft:grass_block")
earthaction:setTitle("Earth")
earthaction:onLeftClick(function (self)
	pings.earth()
end)

local sekiaction = wheel:newAction()
sekiaction:setItem("minecraft:obsidian")
sekiaction:setTitle("Toggle Sekibanki")
sekiaction:onToggle(function (self)
	pings.seki()
end)
