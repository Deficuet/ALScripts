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
		table.insert(arg_1_0.hasDressList, IslandCommanderDressItem.New(iter_1_3))
	end

	arg_1_0.cap_Dic = {}

	for iter_1_4, iter_1_5 in ipairs(var_1_0.cap_list) do
		arg_1_0.cap_Dic[iter_1_5.dress_id] = iter_1_5.cap_id
	end
end

function var_0_0.SetDressHasRead(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.hasDressList) do
		if iter_2_1.id == arg_2_1 then
			iter_2_1:SetReadState(true)
		end
	end
end

function var_0_0.CheckRedDotByDressType(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.hasDressList) do
		if iter_3_1:getConfigTable().type == arg_3_1 and iter_3_1.state == 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetBodyHatIsOn(arg_4_0, arg_4_1, arg_4_2)
	return arg_4_0.cap_Dic[arg_4_1] ~= 0
end

function var_0_0.GetBodyHatDressId(arg_5_0, arg_5_1, arg_5_2)
	return arg_5_0.cap_Dic[arg_5_1] or 0
end

function var_0_0.SetBodyHatIsOn(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.cap_Dic[arg_6_1] = arg_6_2
end

function var_0_0.GetDressByType(arg_7_0, arg_7_1)
	return arg_7_0.currentDressTypeDic[arg_7_1]
end

function var_0_0.GetDressUpData(arg_8_0)
	return arg_8_0.currentDressTypeDic
end

function var_0_0.SetDressByTpye(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.currentDressTypeDic[arg_9_1] = arg_9_2
end

function var_0_0.GetAllHasDress(arg_10_0)
	return arg_10_0.hasDressList
end

function var_0_0.GetHasDressByType(arg_11_0, arg_11_1)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0.hasDressList) do
		if iter_11_1:getConfig("type") == arg_11_1 then
			table.insert(var_11_0, iter_11_1)
		end
	end

	return var_11_0
end

function var_0_0.CheckOwnDress(arg_12_0, arg_12_1)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0.hasDressList) do
		if iter_12_1.id == arg_12_1 then
			return true
		end
	end

	return false
end

function var_0_0.AddDressByDressId(arg_13_0, arg_13_1)
	table.insert(arg_13_0.hasDressList, IslandCommanderDressItem.New({
		color = 0,
		state = 0,
		id = arg_13_1,
		color_list = {}
	}))
end

function var_0_0.IsNew(arg_14_0)
	local var_14_0 = arg_14_0.currentDressTypeDic[IslandShipDressHelperNew.DressType.Hair]
	local var_14_1 = arg_14_0.currentDressTypeDic[IslandShipDressHelperNew.DressType.Face]
	local var_14_2 = arg_14_0.currentDressTypeDic[IslandShipDressHelperNew.DressType.Body]

	return var_14_0 == nil and var_14_1 == nil and var_14_2 == nil
end

function var_0_0.GetHairFaceBodyDress(arg_15_0)
	local var_15_0 = arg_15_0:GetDressByType(IslandShipDressHelperNew.DressType.Hair)
	local var_15_1 = arg_15_0:GetDressByType(IslandShipDressHelperNew.DressType.Face)
	local var_15_2 = arg_15_0:GetDressByType(IslandShipDressHelperNew.DressType.Body)

	return var_15_0, var_15_1, var_15_2
end

function var_0_0.GetCurCommderId(arg_16_0)
	local var_16_0, var_16_1, var_16_2 = arg_16_0:GetHairFaceBodyDress()

	return (IslandShipDressHelper.GetCurCommanderId(var_16_0, var_16_1, var_16_2))
end

function var_0_0.ChangeDress(arg_17_0, arg_17_1)
	for iter_17_0, iter_17_1 in ipairs(arg_17_1) do
		arg_17_0:SetDressByTpye(iter_17_1.type, iter_17_1.id)
	end
end

function var_0_0.ChangeDressColor(arg_18_0, arg_18_1)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.hasDressList) do
		if iter_18_1.id == arg_18_1.id then
			iter_18_1:ChangeColor(arg_18_1.color)
		end
	end
end

function var_0_0.GetCurrentColorByDressId(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.hasDressList) do
		if iter_19_1.id == arg_19_1 then
			return iter_19_1.color
		end
	end

	return 0
end

function var_0_0.CheckDressColorIsOwned(arg_20_0, arg_20_1, arg_20_2)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.hasDressList) do
		if iter_20_1.id == arg_20_1 then
			return iter_20_1:CheckColorIsOwned(arg_20_2)
		end
	end

	return false
end

function var_0_0.AddDressColor(arg_21_0, arg_21_1, arg_21_2)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0.hasDressList) do
		if iter_21_1.id == arg_21_1 then
			return iter_21_1:AddDressColor(arg_21_2)
		end
	end

	return false
end

function var_0_0.ChangeCapState(arg_22_0, arg_22_1)
	for iter_22_0, iter_22_1 in ipairs(arg_22_1) do
		arg_22_0:SetBodyHatIsOn(iter_22_1.dress_id, iter_22_1.cap_id)
	end
end

return var_0_0
