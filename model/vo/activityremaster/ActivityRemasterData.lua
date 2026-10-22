local var_0_0 = class("ActivityRemasterData", import("..BaseVO"))

var_0_0.MAINTAIN = 1

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.isFinish = false

	local var_1_0, var_1_1, var_1_2, var_1_3 = arg_1_0:BuildAllAwards()

	arg_1_0.collectionFurnitures = var_1_0
	arg_1_0.ships = var_1_1
	arg_1_0.equipmentSkins = var_1_2
	arg_1_0.other = var_1_3
end

function var_0_0.BuildAllAwards(arg_2_0)
	local var_2_0 = pg.activity_limit_item_guide_re.get_id_list_by_activity[arg_2_0.configId] or {}
	local var_2_1 = {}
	local var_2_2 = {}
	local var_2_3 = {}
	local var_2_4 = {}

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		local var_2_5 = ActivityRemasterAward.New(iter_2_1)

		if var_2_5:IsCollectionFurniture() then
			table.insert(var_2_1, var_2_5)
			table.insert(var_2_4, var_2_5)
		elseif var_2_5:IsShip() then
			table.insert(var_2_2, var_2_5)
		elseif var_2_5:IsEquipmentSkin() then
			table.insert(var_2_3, var_2_5)
		else
			table.insert(var_2_4, var_2_5)
		end
	end

	return var_2_1, var_2_2, var_2_3, var_2_4
end

function var_0_0.bindConfigTable(arg_3_0)
	return pg.activity_re
end

function var_0_0.IsSpecial(arg_4_0)
	return arg_4_0:getConfig("is_special") == 1
end

function var_0_0.GetBanner(arg_5_0)
	return arg_5_0:getConfig("banner")
end

function var_0_0.IsFinish(arg_6_0)
	return arg_6_0.isFinish
end

function var_0_0.MarkFinish(arg_7_0)
	arg_7_0.isFinish = true
end

function var_0_0.GetFirstOpenActId(arg_8_0)
	local var_8_0 = arg_8_0:getConfig("act_id")
	local var_8_1 = getProxy(ActivityProxy)
	local var_8_2 = _.detect(var_8_0, function(arg_9_0)
		local var_9_0 = var_8_1:RawGetActivityById(arg_9_0)

		return var_9_0 and not var_9_0:isEnd()
	end)

	assert(var_8_2 and var_8_2 > 0, "")

	return var_8_2
end

function var_0_0.GetActList(arg_10_0)
	return arg_10_0:getConfig("act_id")
end

function var_0_0.GetRawCollectableOtherList(arg_11_0)
	return arg_11_0.other
end

function var_0_0.GetCollectableOtherList(arg_12_0)
	local var_12_0 = arg_12_0.other

	return _.map(var_12_0, function(arg_13_0)
		local var_13_0 = arg_13_0:GetRawDropData()
		local var_13_1 = var_13_0[1]
		local var_13_2 = var_13_0[2]
		local var_13_3 = var_13_0[3]

		return {
			var_13_1,
			var_13_2,
			var_13_3
		}
	end)
end

function var_0_0.GetOtherOwnStr(arg_14_0)
	local var_14_0 = arg_14_0:GetCollectableOtherList()
	local var_14_1 = #var_14_0
	local var_14_2 = _.map(var_14_0, function(arg_15_0)
		return Drop.Create(arg_15_0)
	end)
	local var_14_3 = 0

	for iter_14_0, iter_14_1 in ipairs(var_14_2) do
		if iter_14_1:getOwnedCount() > 0 then
			var_14_3 = var_14_3 + 1
		end
	end

	return var_14_3 .. "/" .. var_14_1
end

function var_0_0.GetRawCollectableEsList(arg_16_0)
	return arg_16_0.equipmentSkins
end

function var_0_0.GetCollectableEsList(arg_17_0)
	local var_17_0 = arg_17_0.equipmentSkins

	return _.map(var_17_0, function(arg_18_0)
		local var_18_0 = arg_18_0:GetRawDropData()
		local var_18_1 = var_18_0[1]
		local var_18_2 = var_18_0[2]
		local var_18_3 = var_18_0[3]

		return {
			DROP_TYPE_EQUIPMENT_SKIN,
			var_18_2,
			var_18_3
		}
	end)
end

function var_0_0.GetEsOwnStr(arg_19_0)
	local var_19_0 = arg_19_0.equipmentSkins
	local var_19_1 = #var_19_0
	local var_19_2 = 0
	local var_19_3 = getProxy(EquipmentProxy)

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		local var_19_4 = iter_19_1:GetRawDropData()

		if Drop.Create(var_19_4):getOwnedCount() > 0 then
			var_19_2 = var_19_2 + 1
		end
	end

	return var_19_2 .. "/" .. var_19_1
end

function var_0_0.GetRawCollectableShipIdList(arg_20_0)
	return arg_20_0.ships
end

function var_0_0.GetCollectableShipIdList(arg_21_0)
	local var_21_0 = {}
	local var_21_1 = arg_21_0.ships

	return (_.map(var_21_1, function(arg_22_0)
		local var_22_0 = arg_22_0:GetRawDropData()
		local var_22_1 = var_22_0[1]
		local var_22_2 = var_22_0[2]
		local var_22_3 = var_22_0[3]

		return var_22_2
	end))
end

function var_0_0.GetShipProgress(arg_23_0)
	local var_23_0 = getProxy(CollectionProxy)
	local var_23_1 = arg_23_0:GetCollectableShipIdList()
	local var_23_2 = 0

	for iter_23_0, iter_23_1 in ipairs(var_23_1) do
		if var_23_0:RawGetShipGroup(iter_23_1) then
			var_23_2 = var_23_2 + 1
		end
	end

	return var_23_2
end

function var_0_0.GetShipTotalCnt(arg_24_0)
	return #arg_24_0:GetCollectableShipIdList()
end

function var_0_0.GetShipOwnStr(arg_25_0)
	local var_25_0 = arg_25_0:GetShipProgress()
	local var_25_1 = arg_25_0:GetShipTotalCnt()

	return var_25_0 .. "/" .. var_25_1
end

function var_0_0.GetFurnitureProgress(arg_26_0)
	local var_26_0 = arg_26_0.collectionFurnitures

	if #var_26_0 <= 0 then
		return 0
	end

	local var_26_1 = var_26_0[1]:GetRawDropData()
	local var_26_2 = var_26_1[1]
	local var_26_3 = var_26_1[2]
	local var_26_4 = var_26_1[3]

	return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(var_26_3) >= 1 and 1 or 0
end

function var_0_0.GetFurnitureTotalCnt(arg_27_0)
	return 1
end

function var_0_0.GetStartTime(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0:GetStartTimeTable(arg_28_1)

	return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_28_0)
end

function var_0_0.GetStartTimeTable(arg_29_0, arg_29_1)
	local var_29_0 = getProxy(ActivityRemasterProxy).actTimeID

	return pg.activity_re_timer[var_29_0].timer[2]
end

function var_0_0.GetActivityTimeDesc(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = getProxy(ActivityRemasterProxy).actTimeID

	if not pg.activity_re_timer[var_30_0] then
		return ""
	end

	local var_30_1 = arg_30_0:getConfig("act_time")
	local var_30_2

	for iter_30_0, iter_30_1 in ipairs(var_30_1) do
		if iter_30_1[1] == arg_30_1 then
			var_30_2 = iter_30_1

			break
		end
	end

	if not var_30_2 then
		return ""
	end

	local var_30_3 = getProxy(ActivityProxy):RawGetActivityById(arg_30_1)

	if not var_30_3 or var_30_3:isEnd() then
		return ""
	end

	local var_30_4 = pg.TimeMgr.GetInstance():STimeDescC(var_30_3.stopTime, "%Y/%m/%d/%H/%M/%S")
	local var_30_5 = string.split(var_30_4, "/")
	local var_30_6 = pg.activity_re_timer[var_30_0].timer[2]
	local var_30_7 = var_30_2[1]
	local var_30_8 = var_30_2[2]
	local var_30_9 = var_30_2[3]
	local var_30_10 = pg.activity_re_timer[var_30_0].is_maintain == var_0_0.MAINTAIN

	return GetActTimeDesc(arg_30_2, var_30_10, var_30_6[1][2], var_30_6[1][3], var_30_5[2], var_30_5[3], var_30_5[4], var_30_5[5], var_30_5[6])
end

function var_0_0.GetActivityTimeDescByBanner(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_0:getConfig("act_time")
	local var_31_1

	for iter_31_0, iter_31_1 in ipairs(var_31_0) do
		if iter_31_1[3] == arg_31_1 then
			var_31_1 = iter_31_1[1]

			break
		end
	end

	if not var_31_1 then
		return ""
	end

	return arg_31_0:GetActivityTimeDesc(var_31_1, arg_31_2)
end

function var_0_0.GetName(arg_32_0)
	return arg_32_0:getConfig("name") or ""
end

return var_0_0
