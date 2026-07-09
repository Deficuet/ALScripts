local var_0_0 = class("PlayerConst")

var_0_0.ResGold = 1
var_0_0.ResOil = 2
var_0_0.ResExploit = 3
var_0_0.ResDiamond = 4
var_0_0.ResOilField = 5
var_0_0.ResDormMoney = 6
var_0_0.ResGoldField = 7
var_0_0.ResGuildCoin = 8
var_0_0.ResBlueprintFragment = 9
var_0_0.ResClassField = 10
var_0_0.ResFreeDiamond = 14
var_0_0.ResStoreGold = 16
var_0_0.ResStoreOil = 17
var_0_0.ResIslandGold = 18
var_0_0.ResIslandGem = 19
var_0_0.ResIslandSpeedUpTicket = 20
var_0_0.ResBattery = 101
var_0_0.ResPT = 102

local var_0_1

local function var_0_2(arg_1_0)
	var_0_1 = var_0_1 or {
		[DROP_TYPE_RESOURCE] = function(arg_2_0)
			local var_2_0 = getProxy(PlayerProxy)

			if var_2_0 then
				var_2_0:UpdatePlayerRes({
					arg_2_0
				})
			end
		end,
		[DROP_TYPE_ITEM] = function(arg_3_0)
			local var_3_0 = getProxy(BagProxy)

			if var_3_0 then
				if arg_3_0.count > 0 then
					var_3_0:addItemById(arg_3_0.id, arg_3_0.count)
				elseif arg_3_0.count < 0 then
					var_3_0:removeItemById(arg_3_0.id, -arg_3_0.count)
				end
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_4_0)
			local var_4_0 = nowWorld()

			assert(var_4_0.type == World.TypeFull)

			local var_4_1 = var_4_0:GetInventoryProxy()

			if var_4_1 then
				if arg_4_0.count > 0 then
					var_4_1:AddItem(arg_4_0.id, arg_4_0.count)
				elseif arg_4_0.count < 0 then
					var_4_1:RemoveItem(arg_4_0.id, -arg_4_0.count)
				end
			end
		end
	}

	switch(arg_1_0.type, var_0_1, function(arg_5_0)
		if arg_5_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_5_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_5_0.type].activity_id)

			if var_5_0 and not var_5_0:isEnd() then
				if arg_5_0.count > 0 then
					var_5_0:addVitemNumber(arg_5_0.id, arg_5_0.count)
				elseif arg_5_0.count < 0 then
					var_5_0:subVitemNumber(arg_5_0.id, -arg_5_0.count)
				end
			end

			getProxy(ActivityProxy):updateActivity(var_5_0)
		else
			assert(false, string.format("without drop_type_%d owner logic from id_%d", type, arg_5_0.id))
		end
	end, arg_1_0)
end

function addPlayerOwn(arg_6_0)
	arg_6_0.count = math.max(arg_6_0.count, 0)

	var_0_2(arg_6_0)
end

function reducePlayerOwn(arg_7_0)
	arg_7_0.count = -math.max(arg_7_0.count, 0)

	print(arg_7_0.count)
	var_0_2(arg_7_0)
end

function var_0_0.addTranDrop(arg_8_0, arg_8_1)
	arg_8_0 = underscore.map(arg_8_0, function(arg_9_0)
		return Drop.New({
			type = arg_9_0.type,
			id = arg_9_0.id,
			count = arg_9_0.number
		})
	end)

	local var_8_0 = getProxy(BayProxy):getNewShip(false)
	local var_8_1 = {}

	for iter_8_0, iter_8_1 in pairs(var_8_0) do
		if iter_8_1:isMetaShip() then
			table.insert(var_8_1, iter_8_1.configId)
		end
	end

	for iter_8_2, iter_8_3 in ipairs(arg_8_0) do
		if iter_8_3.type == DROP_TYPE_SHIP and Ship.isMetaShipByConfigID(iter_8_3.id) and not Player.isMetaShipNeedToTrans(iter_8_3.id) then
			getProxy(MetaCharacterProxy):setMetaIDMark(iter_8_3.id)
		end
	end

	local var_8_2 = {}

	for iter_8_4, iter_8_5 in ipairs(arg_8_0) do
		local var_8_3, var_8_4 = iter_8_5:DropTrans(var_8_1, arg_8_1)

		if var_8_3 and var_8_3.type ~= DROP_TYPE_TIMESTAMP then
			table.insert(var_8_2, var_8_3)
			pg.m02:sendNotification(GAME.ADD_ITEM, var_8_3)
		end

		if var_8_4 then
			pg.m02:sendNotification(GAME.ADD_ITEM, var_8_4)
		end
	end

	if arg_8_1 and arg_8_1.taskId and pg.task_data_template[arg_8_1.taskId].auto_commit == 1 then
		return {}
	else
		return var_8_2
	end
end

local var_0_3
local var_0_4

function var_0_0.MergePassItemDrop(arg_10_0)
	if not var_0_3 then
		var_0_4 = {
			[DROP_TYPE_SKIN] = 1,
			[DROP_TYPE_SHIP] = 9
		}
		var_0_3 = {}

		for iter_10_0, iter_10_1 in pairs({
			[DROP_TYPE_RESOURCE] = {
				8,
				8,
				[14] = 2
			},
			[DROP_TYPE_ITEM] = {
				[20001] = 3,
				[21101] = 12,
				[16502] = 6,
				[50006] = 10,
				[16004] = 7,
				[16024] = 7,
				[17023] = 16,
				[17024] = 11,
				[30035] = 13,
				[15008] = 15,
				[42036] = 4,
				[30025] = 13,
				[21131] = 12,
				[21121] = 12,
				[17013] = 16,
				[42030] = 5,
				[20013] = 14,
				[17044] = 11,
				[17004] = 11,
				[17014] = 11,
				[30015] = 13,
				[16014] = 7,
				[17003] = 16,
				[21111] = 12,
				[17043] = 16,
				[17034] = 11,
				[54007] = 5,
				[30045] = 13,
				[15001] = 17,
				[17033] = 16
			}
		}) do
			for iter_10_2, iter_10_3 in pairs(iter_10_1) do
				var_0_3[string.format("%d_%d", iter_10_0, iter_10_2)] = iter_10_3
			end
		end

		var_0_0.PassItemOrder = setmetatable(var_0_3, {
			__index = function(arg_11_0, arg_11_1)
				local var_11_0, var_11_1 = unpack(underscore.map(string.split(arg_11_1, "_"), function(arg_12_0)
					return tonumber(arg_12_0)
				end))

				if var_0_4[var_11_0] then
					arg_11_0[arg_11_1] = var_0_4[var_11_0]
				elseif var_11_0 == DROP_TYPE_ITEM and Item.getConfigData(var_11_1).type == 13 then
					arg_11_0[arg_11_1] = 9
				else
					arg_11_0[arg_11_1] = 100
				end

				return arg_11_0[arg_11_1]
			end
		})
	end

	local var_10_0 = var_0_0.MergeSameDrops(arg_10_0)

	table.sort(var_10_0, CompareFuncs({
		function(arg_13_0)
			return var_0_0.PassItemOrder[arg_13_0.type .. "_" .. arg_13_0.id]
		end,
		function(arg_14_0)
			return arg_14_0.id
		end
	}))

	return var_10_0
end

function var_0_0.CheckResForShopping(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.count * arg_15_1
	local var_15_1 = 0

	if arg_15_0.type == DROP_TYPE_RESOURCE then
		var_15_1 = getProxy(PlayerProxy):getRawData():getResource(arg_15_0.id)
	elseif arg_15_0.type == DROP_TYPE_ITEM then
		var_15_1 = getProxy(BagProxy):getItemCountById(arg_15_0.id)
	else
		assert(false)
	end

	return var_15_0 <= var_15_1
end

function var_0_0.ConsumeResForShopping(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.count * arg_16_1

	if arg_16_0.type == DROP_TYPE_RESOURCE then
		local var_16_1 = getProxy(PlayerProxy):getData()

		var_16_1:consume({
			[id2res(arg_16_0.id)] = var_16_0
		})
		getProxy(PlayerProxy):updatePlayer(var_16_1)
	elseif arg_16_0.type == DROP_TYPE_ITEM then
		getProxy(BagProxy):removeItemById(arg_16_0.id, var_16_0)
	else
		assert(false)
	end
end

function var_0_0.GetTranAwards(arg_17_0, arg_17_1)
	local var_17_0 = {}
	local var_17_1 = PlayerConst.addTranDrop(arg_17_1.award_list)

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		if iter_17_1.type == DROP_TYPE_SHIP then
			local var_17_2 = pg.ship_data_template[iter_17_1.id]

			if not getProxy(CollectionProxy):getShipGroup(var_17_2.group_type) and Ship.inUnlockTip(iter_17_1.id) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("collection_award_ship", var_17_2.name))
			end
		end
	end

	if arg_17_0.isAwardMerge then
		var_17_1 = var_0_0.MergeSameDrops(var_17_1)
	end

	return var_17_1
end

function var_0_0.MergeTechnologyAward(arg_18_0)
	local var_18_0 = arg_18_0.items

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.commons) do
		iter_18_1.riraty = true

		table.insert(var_18_0, iter_18_1)
	end

	for iter_18_2, iter_18_3 in ipairs(arg_18_0.catchupItems) do
		iter_18_3.catchupTag = true

		table.insert(var_18_0, iter_18_3)
	end

	for iter_18_4, iter_18_5 in ipairs(arg_18_0.catchupActItems) do
		iter_18_5.catchupActTag = true

		table.insert(var_18_0, iter_18_5)
	end

	return var_18_0
end

function var_0_0.CanDropItem(arg_19_0)
	local var_19_0 = getProxy(ActivityProxy)
	local var_19_1 = var_19_0:getActivityById(ActivityConst.UTAWARERU_ACTIVITY_PT_ID)

	if var_19_1 and not var_19_1:isEnd() then
		local var_19_2 = var_19_1:getConfig("config_client").pt_id
		local var_19_3 = _.detect(var_19_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function(arg_20_0)
			return arg_20_0:getConfig("config_id") == var_19_2
		end):getData1()

		if var_19_3 >= 1500 then
			local var_19_4 = var_19_3 - 1500
			local var_19_5 = _.detect(arg_19_0, function(arg_21_0)
				return arg_21_0.type == DROP_TYPE_RESOURCE and arg_21_0.id == var_19_2
			end)

			arg_19_0 = _.filter(arg_19_0, function(arg_22_0)
				return arg_22_0.type ~= DROP_TYPE_RESOURCE or arg_22_0.id ~= var_19_2
			end)

			if var_19_5 and var_19_4 < var_19_5.count then
				var_19_5.count = var_19_5.count - var_19_4

				table.insert(arg_19_0, var_19_5)
			end
		end
	end

	return table.getCount(arg_19_0) > 0
end

local var_0_5

local function var_0_6(arg_23_0)
	var_0_5 = var_0_5 or {
		[DROP_TYPE_SHIP] = true,
		[DROP_TYPE_OPERATION] = true,
		[DROP_TYPE_LOVE_LETTER] = true
	}

	if var_0_5[arg_23_0.type] then
		return true
	elseif arg_23_0.type == DROP_TYPE_ITEM and tobool(arg_23_0.extra) then
		return true
	else
		return false
	end
end

function var_0_0.MergeSameDrops(arg_24_0)
	local var_24_0 = {}
	local var_24_1 = {}

	for iter_24_0, iter_24_1 in ipairs(arg_24_0) do
		local var_24_2 = iter_24_1.type .. "_" .. iter_24_1.id

		if not var_24_1[var_24_2] then
			if var_0_6(iter_24_1) then
				-- block empty
			else
				var_24_1[var_24_2] = iter_24_1
			end

			table.insert(var_24_0, iter_24_1)
		else
			var_24_1[var_24_2].count = var_24_1[var_24_2].count + iter_24_1.count
		end
	end

	return var_24_0
end

function var_0_0.CheckMedalAllCollectionTrack()
	local var_25_0, var_25_1 = unpack(getGameset("live_streaming26_data2")[2])
	local var_25_2 = 0
	local var_25_3 = getProxy(PlayerProxy):getRawData()

	for iter_25_0, iter_25_1 in pairs(pg.activity_medal_template.get_id_list_by_group) do
		if iter_25_0 == math.clamp(iter_25_0, var_25_0, var_25_1) then
			if not var_25_3.activityMedalGroupList[iter_25_0] or not var_25_3.activityMedalGroupList[iter_25_0]:GetAll() then
				var_25_2 = -1

				break
			else
				var_25_2 = var_25_2 + 1
			end
		end
	end

	local var_25_4 = getProxy(PlayerProxy):getRawData().id

	if var_25_2 > PlayerPrefs.GetInt("MEDAL_ALL_COLLECTION:" .. var_25_4, 0) then
		PlayerPrefs.SetInt("MEDAL_ALL_COLLECTION:" .. var_25_4, var_25_2)
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildAllCollection(20001, var_25_2))
	end
end

function var_0_0.UpdateLinkActivity(arg_26_0)
	local var_26_0 = getProxy(ActivityProxy)
	local var_26_1 = underscore.filter(var_26_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_LINK_COLLECT), function(arg_27_0)
		return not arg_27_0:isEnd()
	end)

	for iter_26_0, iter_26_1 in ipairs(var_26_1) do
		local var_26_2 = pg.activity_limit_item_guide.get_id_list_by_activity[iter_26_1.id]

		assert(var_26_2, "activity_limit_item_guide not exist activity id: " .. iter_26_1.id)

		for iter_26_2, iter_26_3 in ipairs(var_26_2) do
			local var_26_3 = pg.activity_limit_item_guide[iter_26_3]

			for iter_26_4, iter_26_5 in ipairs(arg_26_0) do
				if iter_26_5.type == var_26_3.type and iter_26_5.id == var_26_3.drop_id then
					local var_26_4 = iter_26_1:getKVPList(1, var_26_3.id) + iter_26_5.count

					iter_26_1:updateKVPList(1, var_26_3.id, var_26_4)
				end
			end
		end

		var_26_0:updateActivity(iter_26_1)
	end
end

return var_0_0
