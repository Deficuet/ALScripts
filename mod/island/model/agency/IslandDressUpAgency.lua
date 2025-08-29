local var_0_0 = class("IslandDressUpAgency", import(".IslandBaseAgency"))

var_0_0.CHANGE_PLAYER_DRESS = "IslandDressUpAgency:CHANGE_DRESS"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.user_dress

	arg_1_0.currentDressTypeDic = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0.cur_dress or {}) do
		arg_1_0.currentDressTypeDic[iter_1_1.type] = iter_1_1.id
	end

	arg_1_0.hasDressList = {}

	for iter_1_2, iter_1_3 in ipairs(var_1_0.had_dress or {}) do
		table.insert(arg_1_0.hasDressList, IslandShipDressItem.New(iter_1_3))
	end

	arg_1_0.cap_Dic = {}

	for iter_1_4, iter_1_5 in ipairs(var_1_0.cap_list) do
		arg_1_0.cap_Dic[iter_1_5.dress_id] = iter_1_5.cap_id
	end
end

function var_0_0.GetBodyHatIsOn(arg_2_0, arg_2_1, arg_2_2)
	return arg_2_0.cap_Dic[arg_2_1] ~= 0
end

function var_0_0.GetBodyHatDressId(arg_3_0, arg_3_1, arg_3_2)
	return arg_3_0.cap_Dic[arg_3_1] or 0
end

function var_0_0.SetBodyHatIsOn(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.cap_Dic[arg_4_1] = arg_4_2
end

function var_0_0.GetDressByType(arg_5_0, arg_5_1)
	return arg_5_0.currentDressTypeDic[arg_5_1]
end

function var_0_0.GetDressUpData(arg_6_0)
	return arg_6_0.currentDressTypeDic
end

function var_0_0.SetDressByTpye(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.currentDressTypeDic[arg_7_1] = arg_7_2
end

function var_0_0.GetAllHasDress(arg_8_0)
	return arg_8_0.hasDressList
end

function var_0_0.GetHasDressByType(arg_9_0, arg_9_1)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0.hasDressList) do
		if iter_9_1:getConfig("type") == arg_9_1 then
			table.insert(var_9_0, iter_9_1)
		end
	end

	return var_9_0
end

function var_0_0.CheckOwnDress(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.hasDressList) do
		if iter_10_1.id == arg_10_1 then
			return true
		end
	end

	return false
end

function var_0_0.AddDressByDressId(arg_11_0, arg_11_1)
	table.insert(arg_11_0.hasDressList, IslandShipDressItem.New({
		color = 0,
		state = 0,
		id = arg_11_1,
		color_list = {}
	}))
end

function var_0_0.IsNew(arg_12_0)
	local var_12_0 = arg_12_0.currentDressTypeDic[IslandShipDressHelperNew.DressType.Hair]
	local var_12_1 = arg_12_0.currentDressTypeDic[IslandShipDressHelperNew.DressType.Face]
	local var_12_2 = arg_12_0.currentDressTypeDic[IslandShipDressHelperNew.DressType.Body]

	return var_12_0 == nil and var_12_1 == nil and var_12_2 == nil
end

function var_0_0.GetHairFaceBodyDress(arg_13_0)
	local var_13_0 = arg_13_0:GetDressByType(IslandShipDressHelperNew.DressType.Hair)
	local var_13_1 = arg_13_0:GetDressByType(IslandShipDressHelperNew.DressType.Face)
	local var_13_2 = arg_13_0:GetDressByType(IslandShipDressHelperNew.DressType.Body)

	return var_13_0, var_13_1, var_13_2
end

function var_0_0.GetCurCommderId(arg_14_0)
	local var_14_0, var_14_1, var_14_2 = arg_14_0:GetHairFaceBodyDress()

	return (IslandShipDressHelper.GetCurCommanderId(var_14_0, var_14_1, var_14_2))
end

function var_0_0.ChangeDress(arg_15_0, arg_15_1)
	for iter_15_0, iter_15_1 in ipairs(arg_15_1) do
		arg_15_0:SetDressByTpye(iter_15_1.type, iter_15_1.id)
	end
end

function var_0_0.ChangeDressColor(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0.hasDressList) do
		if iter_16_1.id == arg_16_1.id then
			iter_16_1:ChangeColor(arg_16_1.color)
		end
	end
end

function var_0_0.GetCurrentColorByDressId(arg_17_0, arg_17_1)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.hasDressList) do
		if iter_17_1.id == arg_17_1 then
			return iter_17_1.color
		end
	end

	return 0
end

function var_0_0.CheckDressColorIsOwned(arg_18_0, arg_18_1, arg_18_2)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.hasDressList) do
		if iter_18_1.id == arg_18_1 then
			return iter_18_1:CheckColorIsOwned(arg_18_2)
		end
	end

	return false
end

function var_0_0.AddDressColor(arg_19_0, arg_19_1, arg_19_2)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.hasDressList) do
		if iter_19_1.id == arg_19_1 then
			return iter_19_1:AddDressColor(arg_19_2)
		end
	end

	return false
end

function var_0_0.ChangeCapState(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(arg_20_1) do
		arg_20_0:SetBodyHatIsOn(iter_20_1.dress_id, iter_20_1.cap_id)
	end
end

return var_0_0
