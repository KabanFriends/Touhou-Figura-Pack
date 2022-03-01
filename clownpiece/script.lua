--hide default player skin
for key, value in pairs(vanilla_model) do
	value.setEnabled(false)
end

--setup models
renderer.setRenderPlayerHead(false)

model.all.setScale({1.3,1.3,1.3})

model.all.RightArm.setRot({0, 0, 0})
model.all.LeftArm.setRot({0, 0, 0})

model.all.Head.blink.setEnabled(false)

model.all.Head.helmet.setEnabled(false)
model.all.Body.chestPlateMiddle.setEnabled(false)
model.all.RightArm.chestPlateRight.setEnabled(false)
model.all.LeftArm.chestPlateLeft.setEnabled(false)
model.all.RightLeg.leggingsRight.setEnabled(false)
model.all.LeftLeg.leggingsLeft.setEnabled(false)

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
prevRad = 0
radx = 0
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
	
	prevRad = radx
	radx = radx + 1
end

--sine wave animation
function render(delta)
	value = lerp(prevRad, radx, delta)
	model.all.sinFloat.setPos({0,18.5 + math.sin(value/10),0})
end

--mathematic functions
function lerp(a,b,x)
    return a+(b-a)*x
end

--register action pings
network.registerPing("enableCommunism")
network.registerPing("disableCommunism")

function enableCommunism()
	model.all.Head.helmet.setEnabled(true)
	model.all.Body.chestPlateMiddle.setEnabled(true)
	model.all.RightArm.chestPlateRight.setEnabled(true)
	model.all.LeftArm.chestPlateLeft.setEnabled(true)
	model.all.RightLeg.leggingsRight.setEnabled(true)
	model.all.LeftLeg.leggingsLeft.setEnabled(true)
	
	model.all.Head._helmet.setEnabled(false)
	model.all.Body._chestPlateMiddle.setEnabled(false)
	model.all.RightArm._chestPlateRight.setEnabled(false)
	model.all.LeftArm._chestPlateLeft.setEnabled(false)
	model.all.RightLeg._leggingsRight.setEnabled(false)
	model.all.LeftLeg._leggingsLeft.setEnabled(false)
end

function disableCommunism()
	model.all.Head.helmet.setEnabled(false)
	model.all.Body.chestPlateMiddle.setEnabled(false)
	model.all.RightArm.chestPlateRight.setEnabled(false)
	model.all.LeftArm.chestPlateLeft.setEnabled(false)
	model.all.RightLeg.leggingsRight.setEnabled(false)
	model.all.LeftLeg.leggingsLeft.setEnabled(false)
	
	model.all.Head._helmet.setEnabled(true)
	model.all.Body._chestPlateMiddle.setEnabled(true)
	model.all.RightArm._chestPlateRight.setEnabled(true)
	model.all.LeftArm._chestPlateLeft.setEnabled(true)
	model.all.RightLeg._leggingsRight.setEnabled(true)
	model.all.LeftLeg._leggingsLeft.setEnabled(true)
end

--action wheel
item = item_stack.createItem("minecraft:red_concrete")
action_wheel.SLOT_1.setItem(item)
action_wheel.SLOT_1.setTitle("Enable Communism")
action_wheel.SLOT_1.setFunction(function()
	if (model.all.Head.helmet.getEnabled() == false) then
		network.ping("enableCommunism")
		item = item_stack.createItem("minecraft:light_gray_concrete")
		action_wheel.SLOT_1.setItem(item)
		action_wheel.SLOT_1.setTitle("Disable Communism")
		enableCommunism()
	else
		network.ping("disableCommunism")
		item = item_stack.createItem("minecraft:red_concrete")
		action_wheel.SLOT_1.setItem(item)
		action_wheel.SLOT_1.setTitle("Enable Communism")
		disableCommunism()
	end
end)