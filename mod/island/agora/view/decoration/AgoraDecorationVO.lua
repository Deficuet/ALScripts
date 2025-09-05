local var_0_0 = class("AgoraDecorationVO")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.id = arg_1_1
	arg_1_0.list = {}
	arg_1_0.agora = arg_1_2.agora
	arg_1_0.contoller = arg_1_2:GetController()
end

function var_0_0.IsPlaced(arg_2_0, arg_2_1)
	return arg_2_0.agora:IsUsing(arg_2_1) or arg_2_0.contoller.selectedData and arg_2_0.contoller.selectedData.id == arg_2_1
end

function var_0_0.IsUsing(arg_3_0)
	return _.all(arg_3_0.list, function(arg_4_0)
		return arg_3_0:IsPlaced(arg_4_0.id)
	end)
end

function var_0_0.AddItem(arg_5_0, arg_5_1)
	table.insert(arg_5_0.list, arg_5_1)
end

function var_0_0.GetFirstItem(arg_6_0)
	return arg_6_0.list[1]
end

function var_0_0.GetAvailableItem(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.list) do
		if not arg_7_0:IsPlaced(iter_7_1.id) then
			return iter_7_1
		end
	end

	return nil
end

function var_0_0.GetAvailableCnt(arg_8_0)
	local var_8_0 = 0

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.list) do
		if not arg_8_0:IsPlaced(iter_8_1.id) then
			var_8_0 = var_8_0 + 1
		end
	end

	return var_8_0
end

function var_0_0.GetMaxCnt(arg_9_0)
	return #arg_9_0.list
end

function var_0_0.Contains(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.list) do
		if iter_10_1.id == arg_10_1 then
			return true
		end
	end

	return false
end

function var_0_0.IsSame(arg_11_0, arg_11_1)
	return arg_11_0.id == arg_11_1
end

function var_0_0.IsType(arg_12_0, arg_12_1)
	return arg_12_0:GetFirstItem():GetType() == arg_12_1
end

function var_0_0.IsMatchSearch(arg_13_0, arg_13_1)
	if not arg_13_1 or arg_13_1 == "" then
		return true
	end

	return arg_13_0:GetFirstItem():Match(arg_13_1)
end

function var_0_0.GetSortValue(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = 0

	if arg_14_1 == AgoraFurnitureType.SORT_RARITY then
		var_14_0 = arg_14_0:GetFirstItem():GetRarity()
	elseif arg_14_1 == AgoraFurnitureType.SORT_TIME then
		var_14_0 = arg_14_0:GetFirstItem():GetTime()
	elseif arg_14_1 == AgoraFurnitureType.SORT_CAPACITY then
		var_14_0 = arg_14_0:GetFirstItem():GetCost()
	else
		var_14_0 = arg_14_0:GetFirstItem().id
	end

	return arg_14_2 == 1 and var_14_0 or -1 * var_14_0
end

function var_0_0.IsOptionalShapeType(arg_15_0)
	return arg_15_0:GetFirstItem():IsOptionalShapeType()
end

function var_0_0.IsBuilding(arg_16_0)
	return arg_16_0:GetFirstItem():IsBuildingType()
end

function var_0_0.IsFoundation(arg_17_0)
	return arg_17_0:GetFirstItem():IsFoundationType()
end

function var_0_0.GetThemeName(arg_18_0)
	local var_18_0 = arg_18_0:GetFirstItem()
	local var_18_1 = arg_18_0.agora:GetSystemThemes()

	for iter_18_0, iter_18_1 in ipairs(var_18_1) do
		if iter_18_1:Belong(var_18_0) then
			return iter_18_1.name
		end
	end

	return i18n("agora_belong_theme_none")
end

return var_0_0
