local var_0_0 = class("EventInfo", import(".BaseVO"))

var_0_0.StateExpire = -1
var_0_0.StateNone = 0
var_0_0.StateActive = 1
var_0_0.StateFinish = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.template = pg.collection_template[arg_1_0.id]

	assert(arg_1_0.template, "pg.collection_template>>>" .. arg_1_0.id)

	arg_1_0.finishTime = arg_1_1.finish_time or 0
	arg_1_0.overTime = arg_1_1.over_time or 0
	arg_1_0.shipIds = underscore.to_array(arg_1_1.ship_id_list) or {}
	arg_1_0.activityId = arg_1_1.activity_id or 0

	if arg_1_0:IsActivityType() and arg_1_0.overTime == 0 then
		arg_1_0.overTime = GetZeroTime()
	end
end

function var_0_0.IsActivityType(arg_2_0)
	return arg_2_0.activityId > 0
end

function var_0_0.GetState(arg_3_0)
	if arg_3_0.finishTime == 0 then
		if arg_3_0.overTime == 0 or pg.TimeMgr.GetInstance():GetServerTime() < arg_3_0.overTime then
			return var_0_0.StateNone
		else
			return var_0_0.StateExpire
		end
	elseif arg_3_0.finishTime < pg.TimeMgr.GetInstance():GetServerTime() then
		return var_0_0.StateFinish
	else
		return var_0_0.StateActive
	end
end

function var_0_0.IsStarting(arg_4_0)
	return arg_4_0:GetState() ~= var_0_0.StateNone
end

function var_0_0.SetActivityId(arg_5_0, arg_5_1)
	arg_5_0.activityId = arg_5_1
end

function var_0_0.BelongActivity(arg_6_0, arg_6_1)
	return arg_6_0.activityId > 0 and arg_6_0.activityId == arg_6_1
end

function var_0_0.setShipIds(arg_7_0, arg_7_1)
	arg_7_0.valid = false
	arg_7_0.shipIds = underscore.to_array(arg_7_1)
end

function var_0_0.getShipList(arg_8_0)
	arg_8_0:checkValid()

	return getProxy(BayProxy):getShipList(arg_8_0.shipIds)
end

function var_0_0.checkValid(arg_9_0)
	if arg_9_0.valid then
		return
	end

	arg_9_0.valid = true

	local var_9_0 = getProxy(BayProxy)

	arg_9_0.shipIds = underscore.filter(arg_9_0.shipIds, function(arg_10_0)
		return tobool(var_9_0:RawGetShipById(arg_10_0))
	end)
end

function var_0_0.reachNum(arg_11_0)
	arg_11_0:checkValid()

	return arg_11_0.template.ship_num <= #arg_11_0.shipIds
end

function var_0_0.reachLevel(arg_12_0)
	local var_12_0 = arg_12_0:getShipList()

	return #var_12_0 > 0 and underscore.any(var_12_0, function(arg_13_0)
		return arg_13_0.level >= arg_12_0.template.ship_lv
	end)
end

function var_0_0.reachTypes(arg_14_0)
	local var_14_0 = arg_14_0:getShipList()

	if table.getCount(var_14_0) == 0 then
		return false
	end

	local var_14_1 = true

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		local var_14_2 = iter_14_1:getShipType()

		if not table.contains(arg_14_0.template.ship_type, var_14_2) then
			var_14_1 = false

			break
		end
	end

	return var_14_1
end

function var_0_0.getOilConsume(arg_15_0)
	return arg_15_0.template.oil or 0
end

function var_0_0.getTypesStr(arg_16_0)
	local var_16_0 = pg.ship_data_by_type
	local var_16_1 = arg_16_0.template.ship_type
	local var_16_2 = false

	if #var_16_1 == #var_16_0.all then
		var_16_2 = true

		for iter_16_0, iter_16_1 in pairs(var_16_0.all) do
			if not table.contains(var_16_1, iter_16_1) then
				var_16_2 = false

				break
			end
		end
	end

	if var_16_2 then
		return i18n("event_type_unlimit")
	else
		local var_16_3 = ""

		for iter_16_2, iter_16_3 in ipairs(ShipType.FilterOverQuZhuType(var_16_1)) do
			local var_16_4 = iter_16_2 == #arg_16_0.template.ship_type and "" or "、"

			var_16_3 = var_16_3 .. var_16_0[iter_16_3].type_name .. var_16_4
		end

		return i18n("event_condition_ship_type", var_16_3)
	end
end

local var_0_1 = "EVENTINFO_FORMATION_KEY_"

function var_0_0.ExistPrevFormation(arg_17_0)
	local var_17_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.HasKey(var_0_1 .. var_17_0)
end

function var_0_0.GetPrevFormation(arg_18_0)
	local var_18_0 = getProxy(PlayerProxy):getRawData().id
	local var_18_1 = PlayerPrefs.GetString(var_0_1 .. var_18_0)
	local var_18_2 = string.split(var_18_1, "#")

	return _.map(var_18_2, function(arg_19_0)
		return tonumber(arg_19_0)
	end)
end

function var_0_0.SavePrevFormation(arg_20_0)
	arg_20_0:checkValid()

	if not arg_20_0:CanRecordPrevFormation() then
		return
	end

	local var_20_0 = table.concat(arg_20_0.shipIds, "#")
	local var_20_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString(var_0_1 .. var_20_1, var_20_0)
	PlayerPrefs.Save()
end

function var_0_0.CanRecordPrevFormation(arg_21_0)
	return arg_21_0.template.oil >= 800
end

function var_0_0.GetCountDownTime(arg_22_0)
	return not arg_22_0:IsActivityType() and arg_22_0:GetState() == var_0_0.StateNone and arg_22_0.overTime > 0 and arg_22_0.overTime - pg.TimeMgr.GetInstance():GetServerTime()
end

return var_0_0
