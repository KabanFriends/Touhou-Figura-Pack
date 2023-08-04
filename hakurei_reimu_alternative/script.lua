--setup models
models.player_model.all.RightArm.goheiRight:setVisible(false)
models.player_model.all.LeftArm.goheiLeft:setVisible(false)

--sitting animation
--hold stick to reveal gohei
local forceGohei = false
events.RENDER:register(function (delta, context)
	if (player:isLeftHanded() == true) then
		if (forceGohei == true) then
			vanilla_model.LEFT_ITEM:setVisible(false)
			models.player_model.player_model.all.LeftArm.goheiLeft:setVisible(true)
		else
			if (player:getHeldItem(false).id ~= "minecraft:air") then
				if (player:getHeldItem(false).id == "minecraft:stick") then
					vanilla_model.LEFT_ITEM:setVisible(false)
					models.player_model.all.LeftArm.goheiLeft:setVisible(true)
				else
					vanilla_model.LEFT_ITEM:setVisible(true)
					models.player_model.all.LeftArm.goheiLeft:setVisible(false)
				end
			else
				vanilla_model.LEFT_ITEM:setVisible(false)
				models.player_model.all.LeftArm.goheiLeft:setVisible(false)
			end
		end
		
		if (player:getHeldItem(true).id ~= "minecraft:air") then
			if (player:getHeldItem(true).id == "minecraft:stick") then
				vanilla_model.RIGHT_ITEM:setVisible(false)
				models.player_model.all.RightArm.goheiRight:setVisible(true)
			else
				vanilla_model.RIGHT_ITEM:setVisible(true)
				models.player_model.all.RightArm.goheiRight:setVisible(false)
			end
		else
			vanilla_model.RIGHT_ITEM:setVisible(true)
			models.player_model.all.RightArm.goheiRight:setVisible(false)
		end
	else
		if (forceGohei == true) then
			vanilla_model.RIGHT_ITEM:setVisible(false)
			models.player_model.all.RightArm.goheiRight:setVisible(true)
		else
			if (player:getHeldItem(false).id ~= "minecraft:air") then
				if (player:getHeldItem(false).id == "minecraft:stick") then
					vanilla_model.RIGHT_ITEM:setVisible(false)
					models.player_model.all.RightArm.goheiRight:setVisible(true)
				else
					vanilla_model.RIGHT_ITEM:setVisible(true)
					models.player_model.all.RightArm.goheiRight:setVisible(false)
				end
			else
				vanilla_model.RIGHT_ITEM:setVisible(true)
				models.player_model.all.RightArm.goheiRight:setVisible(false)
			end
		end
		
		if (player:getHeldItem(true).id ~= "minecraft:air") then
			if (player:getHeldItem(true).id == "minecraft:stick") then
				vanilla_model.LEFT_ITEM:setVisible(false)
				models.player_model.all.LeftArm.goheiLeft:setVisible(true)
			else
				vanilla_model.LEFT_ITEM:setVisible(true)
				models.player_model.all.LeftArm.goheiLeft:setVisible(false)
			end
		else
			vanilla_model.LEFT_ITEM:setVisible(true)
			models.player_model.all.LeftArm.goheiLeft:setVisible(false)
		end
	end
end)

--action pings
function pings.enableGohei()
	forceGohei = true 
end

function pings.disableGohei()
	forceGohei = false
end

--action wheel
local wheel = action_wheel:newPage()
action_wheel:setPage(wheel)

local action = wheel:newAction()
action:setItem("minecraft:stick")
action:setTitle("Toggle Gohei")
action:onToggle(function()
	if (forceGohei == false) then
		pings.enableGohei()
	else
		pings.disableGohei()
	end
end)