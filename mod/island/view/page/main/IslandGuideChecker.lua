local var_0_0 = class("IslandGuideChecker")

var_0_0.MOVE_TASK_ID = 10010000
var_0_0.FIRST_TASK_ID = 10010001
var_0_0.ORDER_TASK_ID = 10010033
var_0_0.ORDER_TASK_PRE_ID = 10010008
var_0_0.TECH_TASK_ID = 10010037
var_0_0.MAP_GUIDE_ABILITY_ID = 5004
var_0_0.INVITE_TASK_ID = 10010036
var_0_0.INVITE_TASK_PRE_ID = 10010035
var_0_0.MANAGE_ABILITY_ID = 26
var_0_0.MINING_ABILITY_ID = 2003
var_0_0.PASTIRE_ABILITY_ID = 2002
var_0_0.COMBP_ABILITY_ID = 29001
var_0_0.FINISH_TYPE = {
	ON_GUIDE = 2,
	ON_BEGIN = 1,
	ON_END = 3
}
var_0_0.loadedConfig = {
	{
		id = "ISLAND_GUIDE_2",
		mapId = 0,
		condition = function()
			return not getProxy(IslandProxy):GetIsland():GetTaskAgency():IsFinishTask(var_0_0.MOVE_TASK_ID)
		end,
		type = var_0_0.FINISH_TYPE.ON_GUIDE
	},
	{
		id = "ISLAND_GUIDE_25",
		condition = function()
			return true
		end,
		mapId = IslandConst.AGORA_MAP_ID,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	},
	{
		id = "ISLAND_GUIDE_27",
		condition = function()
			return getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_0_0.MANAGE_ABILITY_ID)
		end,
		mapId = IslandConst.COFFEE_SHOP_MAP_ID,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	}
}
var_0_0.interactionConfig = {
	{
		id = "ISLAND_GUIDE_3",
		interactionId = 0,
		condition = function()
			return true
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	},
	{
		id = "ISLAND_GUIDE_8",
		interactionId = 10070004,
		condition = function()
			return getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(var_0_0.TECH_TASK_ID)
		end,
		type = var_0_0.FINISH_TYPE.ON_GUIDE
	}
}
var_0_0.pageConfig = {
	{
		id = "ISLAND_GUIDE_6",
		page = "IslandMapPage",
		condition = function()
			return getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_0_0.MAP_GUIDE_ABILITY_ID)
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	},
	{
		id = "ISLAND_GUIDE_9",
		page = "IslandInvitePage",
		condition = function()
			local var_7_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

			return var_7_0:IsFinishTask(var_0_0.INVITE_TASK_PRE_ID) and not var_7_0:IsFinishTask(var_0_0.INVITE_TASK_ID)
		end,
		type = var_0_0.FINISH_TYPE.ON_GUIDE
	},
	{
		id = "ISLAND_GUIDE_21",
		page = "IslandShipOrderPage",
		condition = function()
			return true
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	},
	{
		id = "ISLAND_GUIDE_28",
		page = "IslandSetMealHandbookPage",
		condition = function()
			return getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_0_0.COMBP_ABILITY_ID)
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	},
	{
		id = "ISLAND_GUIDE_29",
		page = "IslandFriendPage",
		condition = function()
			return true
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	},
	{
		id = "ISLAND_GUIDE_30",
		page = "IslandInventoryPage",
		condition = function()
			return true
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	}
}

function var_0_0.CheckOnLoaded(arg_12_0, arg_12_1)
	local var_12_0 = _.detect(var_0_0.loadedConfig, function(arg_13_0)
		local var_13_0 = arg_13_0.id
		local var_13_1 = arg_13_0.mapId
		local var_13_2 = arg_13_0.condition

		return not pg.NewStoryMgr.GetInstance():IsPlayed(var_13_0) and (var_13_1 == 0 or var_13_1 == arg_12_0) and var_13_2()
	end)

	if not var_12_0 then
		existCall(arg_12_1)

		return
	end

	var_0_0._PlayGuide(var_12_0.id, var_12_0.type, arg_12_1)
end

function var_0_0.CheckOnShowInteraction(arg_14_0, arg_14_1)
	local var_14_0 = _.detect(var_0_0.interactionConfig, function(arg_15_0)
		local var_15_0 = arg_15_0.id
		local var_15_1 = arg_15_0.interactionId
		local var_15_2 = arg_15_0.condition

		return not pg.NewStoryMgr.GetInstance():IsPlayed(var_15_0) and (var_15_1 == 0 or var_15_1 == arg_14_0) and var_15_2()
	end)

	if not var_14_0 then
		existCall(arg_14_1)

		return
	end

	var_0_0._PlayGuide(var_14_0.id, var_14_0.type, arg_14_1)
end

function var_0_0.CheckOnOpenPage(arg_16_0, arg_16_1)
	local var_16_0 = _.detect(var_0_0.pageConfig, function(arg_17_0)
		local var_17_0 = arg_17_0.id
		local var_17_1 = arg_17_0.page
		local var_17_2 = arg_17_0.condition

		return not pg.NewStoryMgr.GetInstance():IsPlayed(var_17_0) and var_17_1 == arg_16_0 and var_17_2()
	end)

	if not var_16_0 then
		existCall(arg_16_1)

		return
	end

	var_0_0._PlayGuide(var_16_0.id, var_16_0.type, arg_16_1)
end

function var_0_0.CheckGuide(arg_18_0, arg_18_1, arg_18_2)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_18_0) then
		return
	end

	local var_18_0 = arg_18_1 or var_0_0.FINISH_TYPE.ON_BEGIN

	var_0_0._PlayGuide(arg_18_0, var_18_0, arg_18_2)
end

function var_0_0._PlayGuide(arg_19_0, arg_19_1, arg_19_2)
	if LOCK_ISLAND_GUIDE then
		if arg_19_2 then
			arg_19_2()
		end

		return
	end

	if pg.SeriesGuideMgr.GetInstance():isRunning() then
		existCall(arg_19_2)

		return
	end

	if not pg.NewGuideMgr.GetInstance():CanPlay() then
		existCall(arg_19_2)

		return
	end

	if arg_19_1 and arg_19_1 == var_0_0.FINISH_TYPE.ON_BEGIN then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = arg_19_0
		})
	end

	if _IslandCore then
		_IslandCore:Link(ISLAND_EVT.START_GUIDE)
	end

	pg.NewGuideMgr.GetInstance():Play(arg_19_0, nil, function()
		if _IslandCore then
			_IslandCore:Link(ISLAND_EVT.END_GUIDE)
		end

		if arg_19_1 and arg_19_1 == var_0_0.FINISH_TYPE.ON_END then
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_19_0
			})
		end
	end, arg_19_2, function(arg_21_0, arg_21_1)
		var_0_0.Record(arg_21_0, arg_21_1, arg_19_0)
	end)
end

function var_0_0.Record(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_22_1

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandGuide(arg_22_0, var_22_0, arg_22_2))
end

return var_0_0
