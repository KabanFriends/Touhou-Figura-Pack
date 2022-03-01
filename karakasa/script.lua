--setup models
renderer.setRenderPlayerHead(false)

model.all.setScale({1.3,1.3,1.3})

vec = {0,18.5,0}
for key, value in pairs(model.all) do
	if (type(value) == "table") then
		value.setPos(vec)
	end
end

vec = {0,-5.5,0}
model.all.Body.setPos(vec)
