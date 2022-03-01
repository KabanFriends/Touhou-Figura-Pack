--hide default player skin
for key, value in pairs(vanilla_model) do
	value.setEnabled(false)
end

--model functions
hasSekibanki = false
function other()
	mode = "other"

	model.all.Body.logo.logoEarth.setEnabled(false)
	model.all.Body.logo.logoOther.setEnabled(true)
	model.all.Body.logo.logoMoon.setEnabled(false)
	
	if (hasSekibanki == false) then
		model.all.Head.mess.top.earthTop.setEnabled(false)
		model.all.Head.mess.top.otherTop.setEnabled(true)
		model.all.Head.mess.top.moonTop.setEnabled(false)
		model.all.Head.mess.top.head_of_sekibanki.setEnabled(false)
	else
		model.all.Head.mess.top.earthTop.setEnabled(false)
		model.all.Head.mess.top.otherTop.setEnabled(false)
		model.all.Head.mess.top.moonTop.setEnabled(false)
		model.all.Head.mess.top.head_of_sekibanki.setEnabled(true)
	end
	
	model.all.Head.mess.sideRight.moonSideRight.setEnabled(true)
	model.all.Head.mess.sideRight.earthSideRight.setEnabled(false)
	model.all.Head.mess.sideRight.otherSideRight.setEnabled(false)
	
	model.all.Head.mess.sideLeft.earthSideLeft.setEnabled(true)
	model.all.Head.mess.sideLeft.otherSideLeft.setEnabled(false)
	model.all.Head.mess.sideLeft.moonSideLeft.setEnabled(false)
end

function moon()
	mode = "moon"

	model.all.Body.logo.logoEarth.setEnabled(false)
	model.all.Body.logo.logoOther.setEnabled(false)
	model.all.Body.logo.logoMoon.setEnabled(true)
	
	if (hasSekibanki == false) then
		model.all.Head.mess.top.earthTop.setEnabled(false)
		model.all.Head.mess.top.otherTop.setEnabled(false)
		model.all.Head.mess.top.moonTop.setEnabled(true)
		model.all.Head.mess.top.head_of_sekibanki.setEnabled(false)
	else
		model.all.Head.mess.top.earthTop.setEnabled(false)
		model.all.Head.mess.top.otherTop.setEnabled(false)
		model.all.Head.mess.top.moonTop.setEnabled(false)
		model.all.Head.mess.top.head_of_sekibanki.setEnabled(true)
	end
	
	model.all.Head.mess.sideRight.moonSideRight.setEnabled(false)
	model.all.Head.mess.sideRight.earthSideRight.setEnabled(false)
	model.all.Head.mess.sideRight.otherSideRight.setEnabled(true)
	
	model.all.Head.mess.sideLeft.earthSideLeft.setEnabled(true)
	model.all.Head.mess.sideLeft.otherSideLeft.setEnabled(false)
	model.all.Head.mess.sideLeft.moonSideLeft.setEnabled(false)
end

function earth()
	mode = "earth"

	model.all.Body.logo.logoEarth.setEnabled(true)
	model.all.Body.logo.logoOther.setEnabled(false)
	model.all.Body.logo.logoMoon.setEnabled(false)
	
	if (hasSekibanki == false) then
		model.all.Head.mess.top.earthTop.setEnabled(true)
		model.all.Head.mess.top.otherTop.setEnabled(false)
		model.all.Head.mess.top.moonTop.setEnabled(false)
		model.all.Head.mess.top.head_of_sekibanki.setEnabled(false)
	else
		model.all.Head.mess.top.earthTop.setEnabled(false)
		model.all.Head.mess.top.otherTop.setEnabled(false)
		model.all.Head.mess.top.moonTop.setEnabled(false)
		model.all.Head.mess.top.head_of_sekibanki.setEnabled(true)
	end
	
	model.all.Head.mess.sideRight.moonSideRight.setEnabled(true)
	model.all.Head.mess.sideRight.earthSideRight.setEnabled(false)
	model.all.Head.mess.sideRight.otherSideRight.setEnabled(false)
	
	model.all.Head.mess.sideLeft.earthSideLeft.setEnabled(false)
	model.all.Head.mess.sideLeft.otherSideLeft.setEnabled(true)
	model.all.Head.mess.sideLeft.moonSideLeft.setEnabled(false)
end

--setup models
model.all.setScale({1.3,1.3,1.3})

model.all.RightArm.setRot({0, 0, 0})
model.all.LeftArm.setRot({0, 0, 0})

model.all.Head.blink.setEnabled(false)

other()

vec = {0,18.5,0}
for key, value in pairs(model.all) do
	if (type(value) == "table") then
		value.setPos(vec)
	end
end

vec = {0,-5.5,0}
model.all.Head.setPos(vec)
model.all.Body.setPos(vec)
model.all.RightArm.setPos(vec)
model.all.LeftArm.setPos(vec)
model.all.RightLeg.setPos(vec)
model.all.LeftLeg.setPos(vec)

--blinking animation
blinkTimer = 0
endValue = math.random(5,80)

function tick()
	if (model.all.Head.blink.getEnabled() == true) then
		model.all.Head.blink.setEnabled(false)
	end
	
	blinkTimer = blinkTimer + 1
	
	if (blinkTimer >= endValue) then
		blinkTimer = 0
		endValue = math.random(5,80)
		
		model.all.Head.blink.setEnabled(true)
	end
end

--register action pings
network.registerPing("other")
network.registerPing("moon")
network.registerPing("earth")
network.registerPing("seki")

function seki()
	if (hasSekibanki == true) then hasSekibanki = false
	else hasSekibanki = true end
	
	updateMode()
end

function updateMode()
	if (mode == "other") then other() end
	if (mode == "moon") then moon() end
	if (mode == "earth") then earth() end
end

--action wheel
item = item_stack.createItem("minecraft:redstone_block")
action_wheel.SLOT_1.setItem(item)
action_wheel.SLOT_1.setTitle("Otherworlds")
action_wheel.SLOT_1.setFunction(function() network.ping("other") end)

item = item_stack.createItem("minecraft:end_stone")
action_wheel.SLOT_2.setItem(item)
action_wheel.SLOT_2.setTitle("Moon")
action_wheel.SLOT_2.setFunction(function() network.ping("moon") end)

item = item_stack.createItem("minecraft:grass_block")
action_wheel.SLOT_3.setItem(item)
action_wheel.SLOT_3.setTitle("Earth")
action_wheel.SLOT_3.setFunction(function() network.ping("earth") end)

item = item_stack.createItem("minecraft:obsidian")
action_wheel.SLOT_4.setItem(item)
action_wheel.SLOT_4.setTitle("Toggle Sekibanki")
action_wheel.SLOT_4.setFunction(function() network.ping("seki") end)
