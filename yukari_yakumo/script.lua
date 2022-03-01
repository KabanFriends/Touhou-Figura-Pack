--hide default player skin
for key, value in pairs(vanilla_model) do
	value.setEnabled(false)
end

--setup models
renderer.setRenderPlayerHead(false)

model.all.setScale({1.3,1.3,1.3})

model.all.RightArm.setRot({0, 0, 0})
model.all.LeftArm.setRot({0, 0, 0})

model.all.Body.blink.setEnabled(true)

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
	if (model.all.Body.blink.getEnabled() == false) then
		model.all.Body.blink.setEnabled(true)
	end
	
	blinkTimer = blinkTimer + 1
	
	if (blinkTimer >= endValue) then
		blinkTimer = 0
		endValue = math.random(5,80)
		
		model.all.Body.blink.setEnabled(false)
	end
end

--sitting animation
--hide the chestPlate bones when offhand item exists
function render()
	if (player.getVehicle() ~= nil) then
		model.all.Body.sittingRotationSkirt.setRot({25, 0, 0})
	else
		model.all.Body.sittingRotationSkirt.setRot({0, 0, 0})
	end

	if (player.isLeftHanded() == true) then
		if (player.getHeldItem(1) ~= nil) then
			model.all.LeftArm.chestPlate.setEnabled(false)
		else
			model.all.LeftArm.chestPlate.setEnabled(true)
		end
	else
		if (player.getHeldItem(2) ~= nil) then
			model.all.LeftArm.chestPlate.setEnabled(false)
		else
			model.all.LeftArm.chestPlate.setEnabled(true)
		end
	end
end