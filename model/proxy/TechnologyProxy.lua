local var_0_0 = class("TechnologyProxy", import(".NetProxy"))

var_0_0.TECHNOLOGY_UPDATED = "TechnologyProxy:TECHNOLOGY_UPDATED"
var_0_0.BLUEPRINT_ADDED = "TechnologyProxy:BLUEPRINT_ADDED"
var_0_0.BLUEPRINT_UPDATED = "TechnologyProxy:BLUEPRINT_UPDATED"
var_0_0.REFRESH_UPDATED = "TechnologyProxy:REFRESH_UPDATED"

function var_0_0.register(arg_1_0)
	arg_1_0.tendency = {}

	arg_1_0:on(63000, function(arg_2_0)
		arg_1_0:updateTechnologys(arg_2_0.refresh_list)

		arg_1_0.refreshTechnologysFlag = arg_2_0.refresh_flag

		arg_1_0:updateTecCatchup(arg_2_0.catchup)
		arg_1_0:updateTechnologyQueue(arg_2_0.queue)
	end)

	arg_1_0.bluePrintData = {}
	arg_1_0.item2blueprint = {}
	arg_1_0.maxConfigVersion = 0

	_.each(pg.ship_data_blueprint.all, function(arg_3_0)
		local var_3_0 = ShipBluePrint.New({
			id = arg_3_0
		})

		arg_1_0.maxConfigVersion = math.max(arg_1_0.maxConfigVersion, var_3_0:getConfig("blueprint_version"))
		arg_1_0.bluePrintData[var_3_0.id] = var_3_0
		arg_1_0.item2blueprint[var_3_0:getItemId()] = var_3_0.id
	end)
	arg_1_0:on(63100, function(arg_4_0)
		for iter_4_0, iter_4_1 in ipairs(arg_4_0.blueprint_list) do
			local var_4_0 = arg_1_0.bluePrintData[iter_4_1.id]

			assert(var_4_0, "miss config ship_data_blueprint>>>>>>>>" .. iter_4_1.id)
			var_4_0:updateInfo(iter_4_1)
		end

		arg_1_0.coldTime = arg_4_0.cold_time or 0
		arg_1_0.pursuingTimes = arg_4_0.daily_catchup_strengthen or 0
		arg_1_0.pursuingTimesUR = arg_4_0.daily_catchup_strengthen_ur or 0
	end)
end

function var_0_0.timeCall(arg_5_0)
	return {
		[ProxyRegister.DayCall] = function(arg_6_0)
			arg_5_0:updateRefreshFlag(0)
		end,
		[ProxyRegister.HourCall] = function(arg_7_0)
			if arg_7_0 == 4 then
				arg_5_0:resetPursuingTimes()
			end
		end
	}
end

function var_0_0.setVersion(arg_8_0, arg_8_1)
	PlayerPrefs.SetInt("technology_version", arg_8_1)
	PlayerPrefs.Save()
end

function var_0_0.getVersion(arg_9_0)
	if not PlayerPrefs.HasKey("technology_version") then
		arg_9_0:setVersion(1)

		return 1
	else
		return PlayerPrefs.GetInt("technology_version")
	end
end

function var_0_0.getConfigMaxVersion(arg_10_0)
	return arg_10_0.maxConfigVersion
end

function var_0_0.setTendency(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.tendency[arg_11_1] = arg_11_2
end

function var_0_0.getTendency(arg_12_0, arg_12_1)
	return arg_12_0.tendency[arg_12_1]
end

function var_0_0.updateBlueprintStates(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.bluePrintData or {}) do
		iter_13_1:updateState()
	end
end

function var_0_0.getColdTime(arg_14_0)
	return arg_14_0.coldTime
end

function var_0_0.updateColdTime(arg_15_0)
	arg_15_0.coldTime = pg.TimeMgr.GetInstance():GetServerTime() + 86400
end

function var_0_0.updateRefreshFlag(arg_16_0, arg_16_1)
	arg_16_0.refreshTechnologysFlag = arg_16_1

	arg_16_0:sendNotification(var_0_0.REFRESH_UPDATED, arg_16_0.refreshTechnologysFlag)
end

function var_0_0.updateTechnologys(arg_17_0, arg_17_1)
	arg_17_0.data = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_1) do
		arg_17_0.tendency[iter_17_1.id] = iter_17_1.target

		for iter_17_2, iter_17_3 in ipairs(iter_17_1.technologys) do
			arg_17_0.data[iter_17_3.id] = Technology.New({
				id = iter_17_3.id,
				time = iter_17_3.time,
				pool_id = iter_17_1.id
			})
		end
	end
end

function var_0_0.updateTecCatchup(arg_18_0, arg_18_1)
	arg_18_0.curCatchupTecID = arg_18_1.version
	arg_18_0.curCatchupGroupID = arg_18_1.target
	arg_18_0.catchupData = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_1.pursuings) do
		local var_18_0 = TechnologyCatchup.New(iter_18_1)

		arg_18_0.catchupData[var_18_0.id] = var_18_0
	end

	arg_18_0.curCatchupPrintsNum = arg_18_0:getCurCatchNum()

	print("初始下发的科研追赶信息", arg_18_0.curCatchupTecID, arg_18_0.curCatchupGroupID, arg_18_0.curCatchupPrintsNum)
end

function var_0_0.updateTechnologyQueue(arg_19_0, arg_19_1)
	arg_19_0.queue = {}

	for iter_19_0, iter_19_1 in ipairs(arg_19_1) do
		table.insert(arg_19_0.queue, Technology.New({
			queue = true,
			id = iter_19_1.id,
			time = iter_19_1.time
		}))
	end

	table.sort(arg_19_0.queue, function(arg_20_0, arg_20_1)
		return arg_20_0.time < arg_20_1.time
	end)
end

function var_0_0.moveTechnologyToQueue(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.data[arg_21_1]

	var_21_0.inQueue = true

	table.insert(arg_21_0.queue, var_21_0)

	arg_21_0.data[arg_21_1] = nil
end

function var_0_0.removeFirstQueueTechnology(arg_22_0)
	assert(#arg_22_0.queue > 0)
	table.remove(arg_22_0.queue, 1)
end

function var_0_0.getActivateTechnology(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.data or {}) do
		if iter_23_1:isActivate() then
			return Clone(iter_23_1)
		end
	end
end

function var_0_0.getTechnologyById(arg_24_0, arg_24_1)
	assert(arg_24_0.data[arg_24_1], "technology should exist>>" .. arg_24_1)

	return arg_24_0.data[arg_24_1]:clone()
end

function var_0_0.updateTechnology(arg_25_0, arg_25_1)
	assert(arg_25_0.data[arg_25_1.id], "technology should exist>>" .. arg_25_1.id)
	assert(isa(arg_25_1, Technology), "technology should be instance of Technology")

	arg_25_0.data[arg_25_1.id] = arg_25_1

	arg_25_0:sendNotification(var_0_0.TECHNOLOGY_UPDATED, arg_25_1:clone())
end

function var_0_0.getTechnologys(arg_26_0)
	return underscore.values(arg_26_0.data)
end

function var_0_0.getPlanningTechnologys(arg_27_0)
	return table.mergeArray(arg_27_0.queue, {
		arg_27_0:getActivateTechnology()
	})
end

function var_0_0.getBluePrints(arg_28_0)
	return Clone(arg_28_0.bluePrintData)
end

function var_0_0.getBluePrintById(arg_29_0, arg_29_1)
	return Clone(arg_29_0.bluePrintData[arg_29_1])
end

function var_0_0.getRawBluePrintById(arg_30_0, arg_30_1)
	return arg_30_0.bluePrintData[arg_30_1]
end

function var_0_0.addBluePrint(arg_31_0, arg_31_1)
	assert(isa(arg_31_1, ShipBluePrint), "bluePrint should be instance of ShipBluePrint")
	assert(arg_31_0.bluePrintData[arg_31_1.id] == nil, "use function updateBluePrint instead")

	arg_31_0.bluePrintData[arg_31_1.id] = arg_31_1

	arg_31_0:sendNotification(var_0_0.BLUEPRINT_ADDED, arg_31_1:clone())
end

function var_0_0.updateBluePrint(arg_32_0, arg_32_1)
	assert(isa(arg_32_1, ShipBluePrint), "bluePrint should be instance of ShipBluePrint")
	assert(arg_32_0.bluePrintData[arg_32_1.id], "use function addBluePrint instead")

	arg_32_0.bluePrintData[arg_32_1.id] = arg_32_1

	arg_32_0:sendNotification(var_0_0.BLUEPRINT_UPDATED, arg_32_1:clone())
end

function var_0_0.getBuildingBluePrint(arg_33_0)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.bluePrintData) do
		if iter_33_1:isDeving() or iter_33_1:isFinished() then
			return iter_33_1
		end
	end
end

function var_0_0.GetBlueprint4Item(arg_34_0, arg_34_1)
	return arg_34_0.item2blueprint[arg_34_1]
end

function var_0_0.getCatchupData(arg_35_0, arg_35_1)
	if not arg_35_0.catchupData[arg_35_1] then
		local var_35_0 = TechnologyCatchup.New({
			version = arg_35_1
		})

		arg_35_0.catchupData[arg_35_1] = var_35_0
	end

	return arg_35_0.catchupData[arg_35_1]
end

function var_0_0.updateCatchupData(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	arg_36_0.catchupData[arg_36_1]:addTargetNum(arg_36_2, arg_36_3)
end

function var_0_0.getCurCatchNum(arg_37_0)
	if arg_37_0.curCatchupTecID ~= 0 and arg_37_0.curCatchupGroupID ~= 0 then
		return arg_37_0.catchupData[arg_37_0.curCatchupTecID]:getTargetNum(arg_37_0.curCatchupGroupID)
	else
		return 0
	end
end

function var_0_0.getCatchupState(arg_38_0, arg_38_1)
	if not arg_38_0.catchupData[arg_38_1] then
		return TechnologyCatchup.STATE_UNSELECT
	end

	return arg_38_0.catchupData[arg_38_1]:getState()
end

function var_0_0.updateCatchupStates(arg_39_0)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.catchupData) do
		iter_39_1:updateState()
	end
end

function var_0_0.isOpenTargetCatchup(arg_40_0)
	return pg.technology_catchup_template ~= nil and #pg.technology_catchup_template.all > 0
end

function var_0_0.getNewestCatchupTecID(arg_41_0)
	return math.max(unpack(pg.technology_catchup_template.all))
end

function var_0_0.isOnCatchup(arg_42_0)
	return arg_42_0.curCatchupTecID ~= 0 and arg_42_0.curCatchupGroupID ~= 0
end

function var_0_0.getBluePrintVOByGroupID(arg_43_0, arg_43_1)
	return arg_43_0.bluePrintData[arg_43_1]
end

function var_0_0.getCurCatchupTecInfo(arg_44_0)
	return {
		tecID = arg_44_0.curCatchupTecID,
		groupID = arg_44_0.curCatchupGroupID,
		printNum = arg_44_0.curCatchupPrintsNum
	}
end

function var_0_0.setCurCatchupTecInfo(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0.curCatchupTecID = arg_45_1
	arg_45_0.curCatchupGroupID = arg_45_2
	arg_45_0.curCatchupPrintsNum = arg_45_0:getCurCatchNum()

	arg_45_0:updateCatchupStates()
	print("设置后的科研追赶信息", arg_45_0.curCatchupTecID, arg_45_0.curCatchupGroupID, arg_45_0.curCatchupPrintsNum)
end

function var_0_0.addCatupPrintsNum(arg_46_0, arg_46_1)
	arg_46_0:updateCatchupData(arg_46_0.curCatchupTecID, arg_46_0.curCatchupGroupID, arg_46_1)

	arg_46_0.curCatchupPrintsNum = arg_46_0:getCurCatchNum()

	print("增加科研图纸", arg_46_1, arg_46_0.curCatchupPrintsNum)
end

function var_0_0.IsShowTip(arg_47_0)
	local var_47_0 = SelectTechnologyMediator.onTechnologyNotify()
	local var_47_1 = SelectTechnologyMediator.onBlueprintNotify()
	local var_47_2, var_47_3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getData().level, "TechnologyMediator")

	return OPEN_TEC_TREE_SYSTEM and getProxy(TechnologyNationProxy):getShowRedPointTag() or (var_47_1 or var_47_0) and var_47_2
end

function var_0_0.addPursuingTimes(arg_48_0, arg_48_1, arg_48_2)
	if arg_48_2 then
		arg_48_0.pursuingTimesUR = arg_48_0.pursuingTimesUR + arg_48_1
	else
		arg_48_0.pursuingTimes = arg_48_0.pursuingTimes + arg_48_1
	end
end

function var_0_0.resetPursuingTimes(arg_49_0)
	arg_49_0.pursuingTimes = 0
	arg_49_0.pursuingTimesUR = 0

	arg_49_0:sendNotification(GAME.PURSUING_RESET_DONE)
end

function var_0_0.getPursuingTimes(arg_50_0, arg_50_1)
	if arg_50_1 then
		return arg_50_0.pursuingTimesUR
	else
		return arg_50_0.pursuingTimes
	end
end

function var_0_0.calcMaxPursuingCount(arg_51_0, arg_51_1)
	local var_51_0 = pg.gameset[arg_51_1:isRarityUR() and "blueprint_pursue_discount_ur" or "blueprint_pursue_discount_ssr"].description
	local var_51_1 = getProxy(PlayerProxy):getRawData():getResource(PlayerConst.ResGold)
	local var_51_2 = 0

	local function var_51_3(arg_52_0)
		local var_52_0 = #var_51_0

		while arg_52_0 < var_51_0[var_52_0][1] do
			var_52_0 = var_52_0 - 1
		end

		return var_51_0[var_52_0][2]
	end

	local var_51_4

	for iter_51_0 = arg_51_0:getPursuingTimes(arg_51_1:isRarityUR()) + 1, var_51_0[#var_51_0][1] - 1 do
		local var_51_5 = arg_51_1:getPursuingPrice(var_51_3(iter_51_0))

		if var_51_1 < var_51_5 then
			return var_51_2
		else
			var_51_1 = var_51_1 - var_51_5
			var_51_2 = var_51_2 + 1
		end
	end

	return var_51_2 + math.floor(var_51_1 / arg_51_1:getPursuingPrice())
end

function var_0_0.calcPursuingCost(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = pg.gameset[arg_53_1:isRarityUR() and "blueprint_pursue_discount_ur" or "blueprint_pursue_discount_ssr"].description
	local var_53_1 = 0

	local function var_53_2(arg_54_0)
		local var_54_0 = #var_53_0

		while arg_54_0 < var_53_0[var_54_0][1] do
			var_54_0 = var_54_0 - 1
		end

		return var_53_0[var_54_0][2]
	end

	local var_53_3

	for iter_53_0 = arg_53_0:getPursuingTimes(arg_53_1:isRarityUR()) + 1, var_53_0[#var_53_0][1] - 1 do
		local var_53_4 = arg_53_1:getPursuingPrice(var_53_2(iter_53_0))

		if arg_53_2 == 0 then
			return var_53_1
		else
			var_53_1 = var_53_1 + var_53_4
			arg_53_2 = arg_53_2 - 1
		end
	end

	return var_53_1 + arg_53_2 * arg_53_1:getPursuingPrice()
end

function var_0_0.getPursuingDiscount(arg_55_0, arg_55_1)
	local var_55_0 = getGameset(arg_55_1 and "blueprint_pursue_discount_ur" or "blueprint_pursue_discount_ssr")[2]
	local var_55_1 = #var_55_0

	while arg_55_0 < var_55_0[var_55_1][1] do
		var_55_1 = var_55_1 - 1
	end

	return var_55_0[var_55_1][2]
end

function var_0_0.getItemCanUnlockBluePrint(arg_56_0, arg_56_1)
	if not arg_56_0.unlockItemDic then
		arg_56_0.unlockItemDic = {}

		for iter_56_0, iter_56_1 in ipairs(pg.ship_data_blueprint.all) do
			local var_56_0 = arg_56_0.bluePrintData[iter_56_1]

			for iter_56_2, iter_56_3 in ipairs(var_56_0:getConfig("gain_item_id")) do
				arg_56_0.unlockItemDic[iter_56_3] = arg_56_0.unlockItemDic[iter_56_3] or {}

				table.insert(arg_56_0.unlockItemDic[iter_56_3], iter_56_1)
			end
		end
	end

	return arg_56_0.unlockItemDic[arg_56_1]
end

function var_0_0.CheckPursuingCostTip(arg_57_0, arg_57_1)
	if var_0_0.getPursuingDiscount(arg_57_0.pursuingTimes + 1, false) > 0 and var_0_0.getPursuingDiscount(arg_57_0.pursuingTimesUR + 1, true) > 0 then
		return false
	end

	local var_57_0 = {}

	if arg_57_1 then
		for iter_57_0, iter_57_1 in ipairs(arg_57_1) do
			var_57_0[iter_57_1] = true
		end
	else
		for iter_57_2 = 1, arg_57_0.maxConfigVersion do
			var_57_0[iter_57_2] = true
		end
	end

	for iter_57_3, iter_57_4 in pairs(arg_57_0.bluePrintData) do
		if var_57_0[iter_57_4:getConfig("blueprint_version")] and iter_57_4:isPursuingCostTip() then
			return true
		end
	end

	return false
end

return var_0_0
