local var_0_0 = class("CollectionProxy", import(".NetProxy"))

var_0_0.AWARDS_UPDATE = "awards update"
var_0_0.GROUP_INFO_UPDATE = "group info update"
var_0_0.GROUP_EVALUATION_UPDATE = "group evaluation update"
var_0_0.TROPHY_UPDATE = "trophy update"
var_0_0.MAX_DAILY_EVA_COUNT = 1
var_0_0.KEY_17001_TIME_STAMP = "KEY_17001_TIME_STAMP"

function var_0_0.register(arg_1_0)
	arg_1_0.shipGroups = {}
	arg_1_0.awards = {}
	arg_1_0.trophy = {}
	arg_1_0.trophyGroup = {}
	arg_1_0.dailyEvaCount = 0

	arg_1_0:on(17001, function(arg_2_0)
		arg_1_0.shipGroups = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.ship_info_list) do
			arg_1_0.shipGroups[iter_2_1.id] = ShipGroup.New(iter_2_1)
		end

		for iter_2_2, iter_2_3 in ipairs(arg_2_0.transform_list) do
			if arg_1_0.shipGroups[iter_2_3] then
				arg_1_0.shipGroups[iter_2_3].trans = true
			end
		end

		arg_1_0.awards = {}

		for iter_2_4, iter_2_5 in ipairs(arg_2_0.ship_award_list) do
			table.sort(iter_2_5.award_index)

			arg_1_0.awards[iter_2_5.id] = iter_2_5.award_index[#iter_2_5.award_index]
		end

		for iter_2_6, iter_2_7 in ipairs(arg_2_0.progress_list) do
			arg_1_0.trophy[iter_2_7.id] = Trophy.New(iter_2_7)
		end

		arg_1_0:bindTrophyGroup()
		arg_1_0:bindComplexTrophy()
		arg_1_0:hiddenTrophyAutoClaim()
		arg_1_0:updateTrophy()
	end)
	arg_1_0:on(17002, function(arg_3_0)
		for iter_3_0, iter_3_1 in ipairs(arg_3_0.progress_list) do
			local var_3_0 = false
			local var_3_1 = iter_3_1.id

			if arg_1_0.trophy[var_3_1] then
				local var_3_2 = arg_1_0.trophy[var_3_1]
				local var_3_3 = var_3_2:canClaimed()

				var_3_2:update(iter_3_1)

				local var_3_4 = var_3_2:canClaimed()

				if not var_3_2:isHide() and var_3_3 ~= var_3_4 then
					var_3_0 = true
				end
			else
				arg_1_0.trophy[var_3_1] = Trophy.New(iter_3_1)

				if arg_1_0.trophy[var_3_1]:canClaimed() then
					var_3_0 = true
				end
			end

			if var_3_0 then
				arg_1_0:dispatchClaimRemind(var_3_1)
			end
		end

		arg_1_0:hiddenTrophyAutoClaim()
		arg_1_0:updateTrophy()
	end)
	arg_1_0:on(17004, function(arg_4_0)
		local var_4_0 = arg_4_0.ship_info

		arg_1_0.shipGroups[var_4_0.id] = ShipGroup.New(var_4_0)
	end)
end

function var_0_0.timeCall(arg_5_0)
	return {
		[ProxyRegister.DayCall] = function(arg_6_0)
			arg_5_0:resetEvaCount()
		end
	}
end

function var_0_0.resetEvaCount(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.shipGroups) do
		local var_7_0 = iter_7_1.evaluation

		if var_7_0 then
			var_7_0.ievaCount = 0
		end
	end
end

function var_0_0.updateDailyEvaCount(arg_8_0, arg_8_1)
	arg_8_0.dailyEvaCount = arg_8_1
end

function var_0_0.updateAward(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.awards[arg_9_1] = arg_9_2

	arg_9_0:sendNotification(var_0_0.AWARDS_UPDATE, Clone(arg_9_0.awards))
end

function var_0_0.getShipGroup(arg_10_0, arg_10_1)
	return Clone(arg_10_0.shipGroups[arg_10_1])
end

function var_0_0.updateShipGroup(arg_11_0, arg_11_1)
	assert(arg_11_1, "update ship group: group cannot be nil.")

	arg_11_0.shipGroups[arg_11_1.id] = Clone(arg_11_1)
end

function var_0_0.getGroups(arg_12_0)
	return Clone(arg_12_0.shipGroups)
end

function var_0_0.RawgetGroups(arg_13_0)
	return arg_13_0.shipGroups
end

function var_0_0.getAwards(arg_14_0)
	return Clone(arg_14_0.awards)
end

function var_0_0.hasFinish(arg_15_0)
	local var_15_0 = pg.storeup_data_template

	for iter_15_0, iter_15_1 in ipairs(var_15_0.all) do
		if Favorite.New({
			id = iter_15_1
		}):canGetRes(arg_15_0.shipGroups, arg_15_0.awards) then
			return true
		end
	end

	return false
end

function var_0_0.getCollectionRate(arg_16_0)
	local var_16_0 = arg_16_0:getCollectionCount()
	local var_16_1 = arg_16_0:getCollectionTotal()

	return string.format("%0.3f", var_16_0 / var_16_1), var_16_0, var_16_1
end

function var_0_0.getCollectionCount(arg_17_0)
	return _.reduce(_.values(arg_17_0.shipGroups), 0, function(arg_18_0, arg_18_1)
		return arg_18_0 + (Nation.IsLinkType(arg_18_1:getNation()) and 0 or arg_18_1.trans and 2 or 1)
	end)
end

function var_0_0.getCollectionTotal(arg_19_0)
	return _.reduce(pg.ship_data_group.all, 0, function(arg_20_0, arg_20_1)
		local var_20_0 = pg.ship_data_group[arg_20_1].group_type
		local var_20_1 = ShipGroup.getDefaultShipConfig(var_20_0)

		return arg_20_0 + (Nation.IsLinkType(var_20_1.nationality) and 0 or 1)
	end) + #pg.ship_data_trans.all
end

function var_0_0.getLinkCollectionCount(arg_21_0)
	return _.reduce(_.values(arg_21_0.shipGroups), 0, function(arg_22_0, arg_22_1)
		return arg_22_0 + (Nation.IsLinkType(arg_22_1:getNation()) and 1 or 0)
	end)
end

function var_0_0.flushCollection(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0:getShipGroup(arg_23_1.groupId)
	local var_23_1

	if not var_23_0 then
		var_23_0 = ShipGroup.New({
			heart_count = 0,
			heart_flag = 0,
			lv_max = 1,
			id = arg_23_1.groupId,
			star = arg_23_1:getStar(),
			marry_flag = arg_23_1.propose and 1 or 0,
			intimacy_max = arg_23_1.intimacy
		})

		if OPEN_TEC_TREE_SYSTEM and table.indexof(pg.fleet_tech_ship_template.all, arg_23_1.groupId, 1) then
			var_23_1 = true
		end
	else
		if OPEN_TEC_TREE_SYSTEM and table.indexof(pg.fleet_tech_ship_template.all, arg_23_1.groupId, 1) then
			if var_23_0.star < arg_23_1:getStar() and arg_23_1:getStar() == pg.fleet_tech_ship_template[arg_23_1.groupId].max_star then
				var_23_1 = true

				local var_23_2 = pg.fleet_tech_ship_template[arg_23_1.groupId].pt_upgrage

				pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_TECPOINT, {
					point = var_23_2
				})
			end

			if var_23_0.maxLV < arg_23_1.level and arg_23_1.level == TechnologyConst.SHIP_LEVEL_FOR_BUFF then
				var_23_1 = true

				local var_23_3 = pg.fleet_tech_ship_template[arg_23_1.groupId].pt_level
				local var_23_4 = ShipType.FilterOverQuZhuType(pg.fleet_tech_ship_template[arg_23_1.groupId].add_level_shiptype)
				local var_23_5 = pg.fleet_tech_ship_template[arg_23_1.groupId].add_level_attr
				local var_23_6 = pg.fleet_tech_ship_template[arg_23_1.groupId].add_level_value

				pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_TECPOINT, {
					point = var_23_3,
					typeList = var_23_4,
					attr = var_23_5,
					value = var_23_6
				})
			end
		end

		var_23_0.star = math.max(var_23_0.star, arg_23_1:getStar())
		var_23_0.maxIntimacy = math.max(var_23_0.maxIntimacy, arg_23_1.intimacy)
		var_23_0.married = math.max(var_23_0.married, arg_23_1.propose and 1 or 0)
		var_23_0.maxLV = math.max(var_23_0.maxLV, arg_23_1.level)
	end

	arg_23_0:updateShipGroup(var_23_0)

	if var_23_1 then
		getProxy(TechnologyNationProxy):flushData()
	end
end

function var_0_0.updateTrophyClaim(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.trophy[arg_24_1]:updateTimeStamp(arg_24_2)
end

function var_0_0.unlockNewTrophy(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
		arg_25_0.trophy[iter_25_1.id] = iter_25_1
	end

	arg_25_0:bindTrophyGroup()
	arg_25_0:bindComplexTrophy()
	arg_25_0:hiddenTrophyAutoClaim()
end

function var_0_0.getTrophyGroup(arg_26_0)
	return Clone(arg_26_0.trophyGroup)
end

function var_0_0.getTrophys(arg_27_0)
	local var_27_0 = Clone(arg_27_0.trophy)

	for iter_27_0, iter_27_1 in pairs(arg_27_0.trophy) do
		iter_27_1:clearNew()
	end

	return var_27_0
end

function var_0_0.hiddenTrophyAutoClaim(arg_28_0)
	for iter_28_0, iter_28_1 in pairs(arg_28_0.trophy) do
		if iter_28_1:getHideType() ~= Trophy.ALWAYS_SHOW and iter_28_1:getHideType() ~= Trophy.COMING_SOON and iter_28_1:canClaimed() and not iter_28_1:isClaimed() then
			arg_28_0:sendNotification(GAME.TROPHY_CLAIM, {
				trophyID = iter_28_0
			})
		end
	end
end

function var_0_0.unclaimTrophyCount(arg_29_0)
	local var_29_0 = 0

	for iter_29_0, iter_29_1 in pairs(arg_29_0.trophy) do
		if iter_29_1:getHideType() == Trophy.ALWAYS_SHOW and iter_29_1:canClaimed() and not iter_29_1:isClaimed() then
			var_29_0 = var_29_0 + 1
		end
	end

	return var_29_0
end

function var_0_0.updateTrophy(arg_30_0)
	arg_30_0:sendNotification(var_0_0.TROPHY_UPDATE, Clone(arg_30_0.trophy))
end

function var_0_0.dispatchClaimRemind(arg_31_0, arg_31_1)
	pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_TROPHY, {
		id = arg_31_1
	})
end

function var_0_0.bindComplexTrophy(arg_32_0)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.trophyGroup) do
		local var_32_0 = iter_32_1:getTrophyList()

		for iter_32_2, iter_32_3 in pairs(var_32_0) do
			if iter_32_3:isComplexTrophy() then
				for iter_32_4, iter_32_5 in ipairs(iter_32_3:getTargetID()) do
					local var_32_1 = arg_32_0.trophy[iter_32_5] or Trophy.generateDummyTrophy(iter_32_5)

					iter_32_3:bindTrophys(var_32_1)
				end
			end
		end
	end
end

function var_0_0.bindTrophyGroup(arg_33_0)
	local var_33_0 = pg.medal_template

	for iter_33_0, iter_33_1 in ipairs(var_33_0.all) do
		if var_33_0[iter_33_1].hide == Trophy.ALWAYS_SHOW then
			local var_33_1 = math.floor(iter_33_1 / 10)

			if not arg_33_0.trophyGroup[var_33_1] then
				arg_33_0.trophyGroup[var_33_1] = TrophyGroup.New(var_33_1)
			end

			local var_33_2 = arg_33_0.trophyGroup[var_33_1]

			if arg_33_0.trophy[iter_33_1] then
				var_33_2:addTrophy(arg_33_0.trophy[iter_33_1])
			else
				var_33_2:addDummyTrophy(iter_33_1)
			end
		end
	end

	for iter_33_2, iter_33_3 in pairs(arg_33_0.trophyGroup) do
		iter_33_3:sortGroup()
	end

	table.sort(arg_33_0.trophyGroup, function(arg_34_0, arg_34_1)
		return arg_34_0:getGroupID() < arg_34_1:getGroupID()
	end)
end

return var_0_0
