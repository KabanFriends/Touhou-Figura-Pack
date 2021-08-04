--setup models
model.all.setPos({0,-2,0})

vec = {0,18.5,0}
for key, value in pairs(model.all) do
	if (type(value) == "table") then
		value.setPos(vec)
	end
end

vec = {0,-5.5,0}
model.all.Head.setPos(vec)

--sine wave animation
radx = 0
function tick()
	radx = radx + 1
	model.all.sinFloat.setPos({0,18.5 + math.sin(radx/10),0})
end