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

model.all.RightArm.goheiRight.setEnabled(false)
model.all.LeftArm.goheiLeft.setEnabled(false)

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

--sitting animation
--hold stick to reveal gohei
forceGohei = false
function render()
	if (player.getVehicle() ~= nil) then
		model.all.Body.sittingRotationSkirt.setRot({25, 0, 0})
	else
		model.all.Body.sittingRotationSkirt.setRot({0, 0, 0})
	end
	
	if (player.isLeftHanded() == true) then
		if (forceGohei == true) then
			held_item_model.LEFT_HAND.setEnabled(false)
			model.all.LeftArm.goheiLeft.setEnabled(true)
		else
			if (player.getHeldItem(1) ~= nil) then
				if (player.getHeldItem(1).getType() == "minecraft:stick") then
					held_item_model.LEFT_HAND.setEnabled(false)
					model.all.LeftArm.goheiLeft.setEnabled(true)
				else
					held_item_model.LEFT_HAND.setEnabled(true)
					model.all.LeftArm.goheiLeft.setEnabled(false)
				end
			else
				held_item_model.LEFT_HAND.setEnabled(true)
				model.all.LeftArm.goheiLeft.setEnabled(false)
			end
		end
		
		if (player.getHeldItem(2) ~= nil) then
			if (player.getHeldItem(2).getType() == "minecraft:stick") then
				held_item_model.RIGHT_HAND.setEnabled(false)
				model.all.RightArm.goheiRight.setEnabled(true)
			else
				held_item_model.RIGHT_HAND.setEnabled(true)
				model.all.RightArm.goheiRight.setEnabled(false)
			end
		else
			held_item_model.RIGHT_HAND.setEnabled(true)
			model.all.RightArm.goheiRight.setEnabled(false)
		end
	else
		if (forceGohei == true) then
			held_item_model.RIGHT_HAND.setEnabled(false)
			model.all.RightArm.goheiRight.setEnabled(true)
		else
			if (player.getHeldItem(1) ~= nil) then
				if (player.getHeldItem(1).getType() == "minecraft:stick") then
					held_item_model.RIGHT_HAND.setEnabled(false)
					model.all.RightArm.goheiRight.setEnabled(true)
				else
					held_item_model.RIGHT_HAND.setEnabled(true)
					model.all.RightArm.goheiRight.setEnabled(false)
				end
			else
				held_item_model.RIGHT_HAND.setEnabled(true)
				model.all.RightArm.goheiRight.setEnabled(false)
			end
		end
		
		if (player.getHeldItem(2) ~= nil) then
			if (player.getHeldItem(2).getType() == "minecraft:stick") then
				held_item_model.LEFT_HAND.setEnabled(false)
				model.all.LeftArm.goheiLeft.setEnabled(true)
			else
				held_item_model.LEFT_HAND.setEnabled(true)
				model.all.LeftArm.goheiLeft.setEnabled(false)
			end
		else
			held_item_model.LEFT_HAND.setEnabled(true)
			model.all.LeftArm.goheiLeft.setEnabled(false)
		end
	end
end

--register action pings
network.registerPing("enableGohei")
network.registerPing("disableGohei")

function enableGohei() forceGohei = true end
function disableGohei() forceGohei = false end

--action wheel
item = item_stack.createItem("minecraft:lime_concrete")
action_wheel.SLOT_1.setItem(item)
action_wheel.SLOT_1.setTitle("Enable Gohei")
action_wheel.SLOT_1.setFunction(function()
	if (forceGohei == false) then
		network.ping("enableGohei")
		item = item_stack.createItem("minecraft:red_concrete")
		action_wheel.SLOT_1.setItem(item)
		action_wheel.SLOT_1.setTitle("Disable Gohei")
		forceGohei = true
	else
		network.ping("disableGohei")
		item = item_stack.createItem("minecraft:lime_concrete")
		action_wheel.SLOT_1.setItem(item)
		action_wheel.SLOT_1.setTitle("Enable Gohei")
		forceGohei = false
	end
end)