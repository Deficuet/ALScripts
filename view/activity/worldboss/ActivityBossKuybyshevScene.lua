local var_0_0 = class("ActivityBossKuybyshevScene", import(".ActivityBossSceneTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "ActivityBossKuybyshevUI"
end

function var_0_0.UpdateDropItems(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.contextData.DisplayItems or {}) do
		local var_2_0 = arg_2_0.barList[iter_2_0]:Find("milestone/item")
		local var_2_1 = {
			type = arg_2_0.contextData.DisplayItems[5 - iter_2_0][1],
			id = arg_2_0.contextData.DisplayItems[5 - iter_2_0][2],
			count = arg_2_0.contextData.DisplayItems[5 - iter_2_0][3]
		}

		updateDrop(var_2_0:GetChild(0), var_2_1)
		onButton(arg_2_0, var_2_0, function()
			arg_2_0:emit(var_0_0.ON_DROP, var_2_1)
		end, SFX_PANEL)
	end
end

return var_0_0
