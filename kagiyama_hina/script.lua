--hide default player skin
for key, value in pairs(vanilla_model) do
	value.setEnabled(false)
end

--setup models
model.all.setScale({1.3,1.3,1.3})

model.all.all2.RightArm.setRot({0, 0, 0})
model.all.all2.LeftArm.setRot({0, 0, 0})

model.all.all2.Head.blink.setEnabled(false)

vec = {0,18.5,0}
for key, value in pairs(model.all.all2) do
	if (type(value) == "table") then
		value.setPos(vec)
	end
end

model.all.chestPlate.setPos(vec)

vec = {0,-5.5,0}
model.all.all2.Head.setPos(vec)
model.all.all2.Body.setPos(vec)
model.all.all2.RightArm.setPos(vec)
model.all.all2.LeftArm.setPos(vec)
model.all.all2.RightLeg.setPos(vec)
model.all.all2.LeftLeg.setPos(vec)

--blinking animation
--sitting animation
blinkTimer = 0
endValue = math.random(5,80)
spinSpeed = 0
function tick()
	if (model.all.all2.Head.blink.getEnabled() == true) then
		model.all.all2.Head.blink.setEnabled(false)
	end
	
	blinkTimer = blinkTimer + 1
	
	if (blinkTimer >= endValue) then
		blinkTimer = 0
		endValue = math.random(5,80)
		
		model.all.all2.Head.blink.setEnabled(true)
	end
	
	if (player.getVehicle() ~= nil) then
		model.all.all2.Body.sittingRotationSkirt.setRot({25, 0, 0})
	else
		model.all.all2.Body.sittingRotationSkirt.setRot({0, 0, 0})
	end
	
	if (spinSpeed ~= 0) then
		rot = model.all.all2.getRot()
		newVec = {0, rot.y + spinSpeed, 0}
		model.all.all2.setRot(newVec)
	else
		model.all.all2.setRot({0,0,0})
	end
end

--action wheel
item = item_stack.createItem("minecraft:barrier")
action_wheel.SLOT_1.setItem(item)
action_wheel.SLOT_1.setTitle("Stop Spinning")
action_wheel.SLOT_1.setFunction(function()
	spinSpeed = 0
end)

item = item_stack.createItem("minecraft:light_blue_concrete")
action_wheel.SLOT_2.setItem(item)
action_wheel.SLOT_2.setTitle("Spin (Slow)")
action_wheel.SLOT_2.setFunction(function()
	spinSpeed = 10
end)

item = item_stack.createItem("minecraft:yellow_concrete")
action_wheel.SLOT_3.setItem(item)
action_wheel.SLOT_3.setTitle("Spin (Medium)")
action_wheel.SLOT_3.setFunction(function()
	spinSpeed = 25
end)

item = item_stack.createItem("minecraft:orange_concrete")
action_wheel.SLOT_4.setItem(item)
action_wheel.SLOT_4.setTitle("Spin (Fast)")
action_wheel.SLOT_4.setFunction(function()
	spinSpeed = 50
end)

item = item_stack.createItem("minecraft:red_concrete")
action_wheel.SLOT_5.setItem(item)
action_wheel.SLOT_5.setTitle("Spin (Faster)")
action_wheel.SLOT_5.setFunction(function()
	spinSpeed = 100
end)