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

--sitting animation
--sine and cosine wave animation
function render(delta)
	if (player.getVehicle() ~= nil) then
		model.all.Body.sittingRotationSkirt.setRot({25, 0, 0})
	else
		model.all.Body.sittingRotationSkirt.setRot({0, 0, 0})
	end
	
	value = lerp(prevRad, radx, delta)
	model.all.LeftArm.chestPlateLeft.sinFloat.setPos({0,18.5 + math.sin(value/10),0})
	model.all.RightArm.chestPlateRight.cosFloat.setPos({0,18.5 + math.cos(value/10),0})
end

--mathematic functions
function lerp(a,b,x)
    return a+(b-a)*x
end