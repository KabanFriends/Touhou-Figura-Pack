--[[ SETUP ]]
--hide default player skin
vanilla_model.PLAYER:setVisible(false)

--setup models
models.player_model:scale(1.3, 1.3, 1.3)

models.player_model.all.all2.RightArm:setRot(0, 0, 0)
models.player_model.all.all2.LeftArm:setRot(0, 0, 0)

--setup skull
local skullmodel = models.player_model.all.all2.Head:copy("SkullModel")
skullmodel:setParentType("None")
skullmodel:setPos(0, -18, 0)
skullmodel:removeChild(skullmodel.blink)
models.skull.Skull:addChild(skullmodel)

--setup tablist portrait
local portmodel = models.player_model.all.all2.Head:copy("SkullModel")
portmodel:setParentType("None")
portmodel:setPos(0, -18, 0)
portmodel:removeChild(portmodel.blink)
models.skull.Portrait:addChild(portmodel)

--[[ BLINK ]]
--init
models.player_model.all.all2.Head.blink:setVisible(false)

--blinking animation
local blinkTimer = 0
local endValue = math.random(5,80)

--[[ SCRIPT ]]

local spinSpeed = 0
local rot = 0
local prevRot = 0
local prevRad = 0
local radx = 0
events.TICK:register(function()
	if (models.player_model.all.all2.Head.blink:getVisible() == true) then
		models.player_model.all.all2.Head.blink:setVisible(false)
	end
	
	blinkTimer = blinkTimer + 1
	
	if (blinkTimer >= endValue) then
		blinkTimer = 0
		endValue = math.random(5,80)
		
		models.player_model.all.all2.Head.blink:setVisible(true)
	end

	if (spinSpeed ~= 0) then
		prevRot = rot
		rot = models.player_model.all.all2:getRot().y + spinSpeed
	end
	
	prevRad = radx
	radx = radx + 1
end)

events.RENDER:register(function(delta, ctx)
	if (player:getVehicle() ~= nil) then
		models.player_model.all.all2.Body.sittingRotationSkirt:setRot(25, 0, 0)
	else
		models.player_model.all.all2.Body.sittingRotationSkirt:setRot(0, 0, 0)
	end

	if (spinSpeed ~= 0) then
		models.player_model.all.all2:setRot(0, math.lerp(prevRot, rot, delta), 0)
	else
		rot = 0
		prevRot = 0
		models.player_model.all.all2:setRot(0, 0, 0)
	end
	
	local value = math.lerp(prevRad, radx, delta)
	models.player_model.all.sinFloat:setPos(0, math.sin(value/10), 0)
end)

--action pings
function pings.stop_spin() spinSpeed = 0 end
function pings.spin_1() spinSpeed = 5 end
function pings.spin_2() spinSpeed = 25 end
function pings.spin_3() spinSpeed = 50 end
function pings.spin_4() spinSpeed = 80 end
function pings.spin_5() spinSpeed = 150 end
function pings.spin_6() spinSpeed = 10000 end
function pings.spin_7() spinSpeed = 50000 end

--action wheel
local wheel = action_wheel:newPage()
action_wheel:setPage(wheel)

local stopaction = wheel:newAction()
stopaction:setItem("minecraft:barrier")
stopaction:setTitle("Stop Spinning")
stopaction:onLeftClick(function (self)
	pings.stop_spin()
end)

local sp1action = wheel:newAction()
sp1action:setItem("minecraft:light{BlockStateTag:{level:\"1\"}}")
sp1action:setTitle("Spin (Slow)")
sp1action:onLeftClick(function (self)
	pings.spin_1()
end)

local sp2action = wheel:newAction()
sp2action:setItem("minecraft:light{BlockStateTag:{level:\"2\"}}")
sp2action:setTitle("Spin (Medium)")
sp2action:onLeftClick(function (self)
	pings.spin_2()
end)

local sp3action = wheel:newAction()
sp3action:setItem("minecraft:light{BlockStateTag:{level:\"3\"}}")
sp3action:setTitle("Spin (Fast)")
sp3action:onLeftClick(function (self)
	pings.spin_3()
end)

local sp4action = wheel:newAction()
sp4action:setItem("minecraft:light{BlockStateTag:{level:\"4\"}}")
sp4action:setTitle("Spin (Faster)")
sp4action:onLeftClick(function (self)
	pings.spin_4()
end)

local sp5action = wheel:newAction()
sp5action:setItem("minecraft:light{BlockStateTag:{level:\"5\"}}")
sp5action:setTitle("Spin (Even Faster)")
sp5action:onLeftClick(function (self)
	pings.spin_5()
end)

local sp6action = wheel:newAction()
sp6action:setItem("minecraft:light{BlockStateTag:{level:\"10\"}}")
sp6action:setTitle("Spin (Insane)")
sp6action:onLeftClick(function (self)
	pings.spin_6()
end)

local sp7action = wheel:newAction()
sp7action:setItem("minecraft:light{BlockStateTag:{level:\"15\"}}")
sp7action:setTitle("Spin (Light Speed)")
sp7action:onLeftClick(function (self)
	pings.spin_7()
end)
