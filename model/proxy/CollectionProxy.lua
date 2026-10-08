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

function var_0_0.RawGetShipGroup(arg_11_0, arg_11_1)
	return arg_11_0.shipGroups[arg_11_1]
end

function var_0_0.updateShipGroup(arg_12_0, arg_12_1)
	assert(arg_12_1, "update ship group: group cannot be nil.")

	arg_12_0.shipGroups[arg_12_1.id] = Clone(arg_12_1)
end

function var_0_0.getGroups(arg_13_0)
	return Clone(arg_13_0.shipGroups)
end

function var_0_0.RawgetGroups(arg_14_0)
	return arg_14_0.shipGroups
end

function var_0_0.getAwards(arg_15_0)
	return Clone(arg_15_0.awards)
end

function var_0_0.hasFinish(arg_16_0)
	local var_16_0 = pg.storeup_data_template

	for iter_16_0, iter_16_1 in ipairs(var_16_0.all) do
		if Favorite.New({
			id = iter_16_1
		}):canGetRes(arg_16_0.shipGroups, arg_16_0.awards) then
			return true
		end
	end

	return false
end

function var_0_0.getCollectionRate(arg_17_0)
	local var_17_0 = arg_17_0:getCollectionCount()
	local var_17_1 = arg_17_0:getCollectionTotal()

	return string.format("%0.3f", var_17_0 / var_17_1), var_17_0, var_17_1
end

function var_0_0.getCollectionCount(arg_18_0)
	return _.reduce(_.values(arg_18_0.shipGroups), 0, function(arg_19_0, arg_19_1)
		return arg_19_0 + (Nation.IsLinkType(arg_19_1:getNation()) and 0 or arg_19_1.trans and 2 or 1)
	end)
end

function var_0_0.getCollectionTotal(arg_20_0)
	return _.reduce(pg.ship_data_group.all, 0, function(arg_21_0, arg_21_1)
		local var_21_0 = pg.ship_data_group[arg_21_1].group_type
		local var_21_1 = ShipGroup.getDefaultShipConfig(var_21_0)

		return arg_21_0 + (Nation.IsLinkType(var_21_1.nationality) and 0 or 1)
	end) + #pg.ship_data_trans.all
end

function var_0_0.getLinkCollectionCount(arg_22_0)
	return _.reduce(_.values(arg_22_0.shipGroups), 0, function(arg_23_0, arg_23_1)
		return arg_23_0 + (Nation.IsLinkType(arg_23_1:getNation()) and 1 or 0)
	end)
end

function var_0_0.flushCollection(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:getShipGroup(arg_24_1.groupId)
	local var_24_1

	if not var_24_0 then
		var_24_0 = ShipGroup.New({
			heart_count = 0,
			heart_flag = 0,
			lv_max = 1,
			id = arg_24_1.groupId,
			star = arg_24_1:getStar(),
			marry_flag = arg_24_1.propose and 1 or 0,
			intimacy_max = arg_24_1.intimacy
		})

		if OPEN_TEC_TREE_SYSTEM and table.indexof(pg.fleet_tech_ship_template.all, arg_24_1.groupId, 1) then
			var_24_1 = true
		end
	else
		if OPEN_TEC_TREE_SYSTEM and table.indexof(pg.fleet_tech_ship_template.all, arg_24_1.groupId, 1) then
			if var_24_0.star < arg_24_1:getStar() and arg_24_1:getStar() == pg.fleet_tech_ship_template[arg_24_1.groupId].max_star then
				var_24_1 = true

				local var_24_2 = pg.fleet_tech_ship_template[arg_24_1.groupId].pt_upgrage

				pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_TECPOINT, {
					point = var_24_2
				})
			end

			if var_24_0.maxLV < arg_24_1.level and arg_24_1.level == TechnologyConst.SHIP_LEVEL_FOR_BUFF then
				var_24_1 = true

				local var_24_3 = pg.fleet_tech_ship_template[arg_24_1.groupId].pt_level
				local var_24_4 = ShipType.FilterOverQuZhuType(pg.fleet_tech_ship_template[arg_24_1.groupId].add_level_shiptype)
				local var_24_5 = pg.fleet_tech_ship_template[arg_24_1.groupId].add_level_attr
				local var_24_6 = pg.fleet_tech_ship_template[arg_24_1.groupId].add_level_value

				pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_TECPOINT, {
					point = var_24_3,
					typeList = var_24_4,
					attr = var_24_5,
					value = var_24_6
				})
			end
		end

		var_24_0.star = math.max(var_24_0.star, arg_24_1:getStar())
		var_24_0.maxIntimacy = math.max(var_24_0.maxIntimacy, arg_24_1.intimacy)
		var_24_0.married = math.max(var_24_0.married, arg_24_1.propose and 1 or 0)
		var_24_0.maxLV = math.max(var_24_0.maxLV, arg_24_1.level)
	end

	arg_24_0:updateShipGroup(var_24_0)

	if var_24_1 then
		getProxy(TechnologyNationProxy):flushData()
	end
end

function var_0_0.updateTrophyClaim(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.trophy[arg_25_1]:updateTimeStamp(arg_25_2)
end

function var_0_0.unlockNewTrophy(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in ipairs(arg_26_1) do
		arg_26_0.trophy[iter_26_1.id] = iter_26_1
	end

	arg_26_0:bindTrophyGroup()
	arg_26_0:bindComplexTrophy()
	arg_26_0:hiddenTrophyAutoClaim()
end

function var_0_0.getTrophyGroup(arg_27_0)
	return Clone(arg_27_0.trophyGroup)
end

function var_0_0.getTrophys(arg_28_0)
	local var_28_0 = Clone(arg_28_0.trophy)

	for iter_28_0, iter_28_1 in pairs(arg_28_0.trophy) do
		iter_28_1:clearNew()
	end

	return var_28_0
end

function var_0_0.GetTrophyById(arg_29_0, arg_29_1)
	return arg_29_0.trophy[arg_29_1]
end

function var_0_0.hiddenTrophyAutoClaim(arg_30_0)
	for iter_30_0, iter_30_1 in pairs(arg_30_0.trophy) do
		if iter_30_1:getHideType() ~= Trophy.ALWAYS_SHOW and iter_30_1:getHideType() ~= Trophy.COMING_SOON and iter_30_1:canClaimed() and not iter_30_1:isClaimed() then
			arg_30_0:sendNotification(GAME.TROPHY_CLAIM, {
				trophyID = iter_30_0
			})
		end
	end
end

function var_0_0.unclaimTrophyCount(arg_31_0)
	local var_31_0 = 0

	for iter_31_0, iter_31_1 in pairs(arg_31_0.trophy) do
		if iter_31_1:getHideType() == Trophy.ALWAYS_SHOW and iter_31_1:canClaimed() and not iter_31_1:isClaimed() then
			var_31_0 = var_31_0 + 1
		end
	end

	return var_31_0
end

function var_0_0.updateTrophy(arg_32_0)
	arg_32_0:sendNotification(var_0_0.TROPHY_UPDATE, Clone(arg_32_0.trophy))
end

function var_0_0.dispatchClaimRemind(arg_33_0, arg_33_1)
	pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_TROPHY, {
		id = arg_33_1
	})
end

function var_0_0.bindComplexTrophy(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.trophyGroup) do
		local var_34_0 = iter_34_1:getTrophyList()

		for iter_34_2, iter_34_3 in pairs(var_34_0) do
			if iter_34_3:isComplexTrophy() then
				for iter_34_4, iter_34_5 in ipairs(iter_34_3:getTargetID()) do
					local var_34_1 = arg_34_0.trophy[iter_34_5] or Trophy.generateDummyTrophy(iter_34_5)

					iter_34_3:bindTrophys(var_34_1)
				end
			end
		end
	end
end

function var_0_0.bindTrophyGroup(arg_35_0)
	local var_35_0 = pg.medal_template

	for iter_35_0, iter_35_1 in ipairs(var_35_0.all) do
		if var_35_0[iter_35_1].hide == Trophy.ALWAYS_SHOW then
			local var_35_1 = math.floor(iter_35_1 / 10)

			if not arg_35_0.trophyGroup[var_35_1] then
				arg_35_0.trophyGroup[var_35_1] = TrophyGroup.New(var_35_1)
			end

			local var_35_2 = arg_35_0.trophyGroup[var_35_1]

			if arg_35_0.trophy[iter_35_1] then
				var_35_2:addTrophy(arg_35_0.trophy[iter_35_1])
			else
				var_35_2:addDummyTrophy(iter_35_1)
			end
		end
	end

	for iter_35_2, iter_35_3 in pairs(arg_35_0.trophyGroup) do
		iter_35_3:sortGroup()
	end

	table.sort(arg_35_0.trophyGroup, function(arg_36_0, arg_36_1)
		return arg_36_0:getGroupID() < arg_36_1:getGroupID()
	end)
end

return var_0_0
