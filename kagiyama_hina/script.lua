--hide default player skin
for key, value in pairs(vanilla_model) do
	value.setEnabled(false)
end

--setup models
renderer.setRenderPlayerHead(false)

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

vec = {0,-5.5,0}
model.all.all2.Head.setPos(vec)
model.all.all2.Body.setPos(vec)
model.all.all2.RightArm.setPos(vec)
model.all.all2.LeftArm.setPos(vec)
model.all.all2.RightLeg.setPos(vec)
model.all.all2.LeftLeg.setPos(vec)

--blinking animation
blinkTimer = 0
endValue = math.random(5,80)
spinSpeed = 0
rot = 0
prevRot = 0
prevRad = 0
radx = 0
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
	
	if (spinSpeed ~= 0) then
		prevRot = rot
		rot = model.all.all2.getRot().y + spinSpeed
	end
	
	prevRad = radx
	radx = radx + 1
end

--sitting animation
--spinning animation
--sine wave animation
function render(delta)
	if (player.getVehicle() ~= nil) then
		model.all.all2.Body.sittingRotationSkirt.setRot({25, 0, 0})
	else
		model.all.all2.Body.sittingRotationSkirt.setRot({0, 0, 0})
	end
	
	if (spinSpeed ~= 0) then
		newVec = {0, lerp(prevRot, rot, delta), 0}
		model.all.all2.setRot(newVec)
	else
		rot = 0
		prevRot = 0
		model.all.all2.setRot({0,0,0})
	end
	
	value = lerp(prevRad, radx, delta)
	model.all.sinFloat.setPos({0,18.5 + math.sin(value/10),0})
end

--mathematic functions
function lerp(a,b,x)
    return a+(b-a)*x
end

--register action pings
network.registerPing("stop_spin")
network.registerPing("spin_1")
network.registerPing("spin_2")
network.registerPing("spin_3")
network.registerPing("spin_4")
network.registerPing("spin_5")
network.registerPing("spin_6")
network.registerPing("spin_7")

function stop_spin() spinSpeed = 0 end
function spin_1() spinSpeed = 5 end
function spin_2() spinSpeed = 25 end
function spin_3() spinSpeed = 50 end
function spin_4() spinSpeed = 80 end
function spin_5() spinSpeed = 150 end
function spin_6() spinSpeed = 10000 end
function spin_7() spinSpeed = 50000 end

--action wheel
item = item_stack.createItem("minecraft:barrier")
action_wheel.SLOT_1.setItem(item)
action_wheel.SLOT_1.setTitle("Stop Spinning")
action_wheel.SLOT_1.setFunction(function()
	spinSpeed = 0
	network.ping("stop_spin")
end)

item = item_stack.createItem("minecraft:light_blue_concrete")
action_wheel.SLOT_2.setItem(item)
action_wheel.SLOT_2.setTitle("Spin (Slow)")
action_wheel.SLOT_2.setFunction(function()
	spinSpeed = 5
	network.ping("spin_1")
end)

item = item_stack.createItem("minecraft:yellow_concrete")
action_wheel.SLOT_3.setItem(item)
action_wheel.SLOT_3.setTitle("Spin (Medium)")
action_wheel.SLOT_3.setFunction(function()
	spinSpeed = 25
	network.ping("spin_2")
end)

item = item_stack.createItem("minecraft:orange_concrete")
action_wheel.SLOT_4.setItem(item)
action_wheel.SLOT_4.setTitle("Spin (Fast)")
action_wheel.SLOT_4.setFunction(function()
	spinSpeed = 50
	network.ping("spin_3")
end)

item = item_stack.createItem("minecraft:red_concrete")
action_wheel.SLOT_5.setItem(item)
action_wheel.SLOT_5.setTitle("Spin (Faster)")
action_wheel.SLOT_5.setFunction(function()
	spinSpeed = 80
	network.ping("spin_4")
end)

item = item_stack.createItem("minecraft:black_concrete")
action_wheel.SLOT_6.setItem(item)
action_wheel.SLOT_6.setTitle("Spin (Even Faster)")
action_wheel.SLOT_6.setFunction(function()
	spinSpeed = 150
	network.ping("spin_5")
end)

item = item_stack.createItem("minecraft:diamond_block")
action_wheel.SLOT_7.setItem(item)
action_wheel.SLOT_7.setTitle("Spin (Insane)")
action_wheel.SLOT_7.setFunction(function()
	spinSpeed = 10000
	network.ping("spin_6")
end)

item = item_stack.createItem("minecraft:netherite_block")
action_wheel.SLOT_8.setItem(item)
action_wheel.SLOT_8.setTitle("Spin (wtf how)")
action_wheel.SLOT_8.setFunction(function()
	spinSpeed = 50000
	network.ping("spin_7")
end)