local var_0_0 = class("Dorm3dSkin", import("model.vo.BaseVO"))

function var_0_0.bindConfigTable(arg_1_0)
	return pg.dorm3d_resource
end

function var_0_0.GetName(arg_2_0)
	return arg_2_0:getConfig("name")
end

function var_0_0.GetType(arg_3_0)
	return arg_3_0:getConfig("type")
end

function var_0_0.GetUnlock(arg_4_0)
	return arg_4_0:getConfig("unlock")
end

function var_0_0.GetShopId(arg_5_0)
	return arg_5_0:getConfig("shop_id")
end

function var_0_0.GetPublicRoomId(arg_6_0)
	return arg_6_0:GetUnlock()[2]
end

function var_0_0.GetIcon(arg_7_0)
	return arg_7_0:getConfig("head_Icon")
end

function var_0_0.GetUnlockText(arg_8_0)
	return arg_8_0:getConfig("unlock_text")
end

function var_0_0.GetSwitchAnim(arg_9_0)
	return arg_9_0:getConfig("switch_anim")
end

function var_0_0.GetWearAnim(arg_10_0)
	return arg_10_0:getConfig("wear_anim")
end

function var_0_0.GetRemarks(arg_11_0)
	return arg_11_0:getConfig("remarks")
end

function var_0_0.GetHiddenPartIcons(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0:getConfig("hidden_part")
	local var_12_1 = {}

	for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
		local var_12_2 = iter_12_0.find(var_12_0, function(arg_13_0)
			return arg_13_0[1] == iter_12_1
		end)

		if var_12_2 then
			table.insert(var_12_1, var_12_2[2])
		end
	end

	return var_12_1
end

function var_0_0.GetActiveAndHiddenPartNames(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:getConfig("hidden_part")
	local var_14_1 = {}
	local var_14_2 = {}

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		if table.contains(arg_14_1, iter_14_1[1]) then
			table.insert(var_14_2, iter_14_1[3])
		else
			table.insert(var_14_1, iter_14_1[3])
		end
	end

	return var_14_1, var_14_2
end

function var_0_0.GetRarity(arg_15_0)
	return 5
end

function var_0_0.GetModelName(arg_16_0)
	if HXSet.isHx() then
		return arg_16_0:getConfig("hx_model") ~= "" and arg_16_0:getConfig("hx_model") or arg_16_0:getConfig("model_id")
	else
		return arg_16_0:getConfig("model_id")
	end
end

function var_0_0.GetHXModel(arg_17_0)
	return arg_17_0:getConfig("hx_model")
end

return var_0_0
