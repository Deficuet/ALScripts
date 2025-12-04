local var_0_0 = class("IslandGuideChecker")

var_0_0.MOVE_TASK_ID = 10001000
var_0_0.FIRST_TASK_ID = 10001010
var_0_0.ORDER_TASK_ID = 10001071
var_0_0.ORDER_TASK_PRE_ID = 10001070
var_0_0.ORDER_NEED_ITEMS = {
	{
		2700,
		1
	},
	{
		2800,
		1
	}
}
var_0_0.TECH_TASK_ID = 10001141
var_0_0.MAP_GUIDE_ABILITY_ID = 5004
var_0_0.INVITE_TASK_ID = 10001151
var_0_0.INVITE_TASK_PRE_ID = 10001150
var_0_0.MANAGE_ABILITY_ID = 26
var_0_0.MINING_ABILITY_ID = 2003
var_0_0.PASTIRE_ABILITY_ID = 2002
var_0_0.COMBP_ABILITY_ID = 29001
var_0_0.DAILY_TASK_ABILITY_ID = 30001
var_0_0.SIGNIN_STORY_NAME = "ISLAND1001032_1"
var_0_0.TECH_FIRST_ID = 100001
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
	}
}
var_0_0.pageConfig = {
	{
		id = "ISLAND_GUIDE_5",
		page = "IslandUpgradeDisplayPage",
		condition = function()
			return true
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	},
	{
		id = "ISLAND_GUIDE_6",
		page = "IslandMapPage",
		condition = function()
			return getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_0_0.MAP_GUIDE_ABILITY_ID)
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	},
	{
		id = "ISLAND_GUIDE_8",
		page = "IslandTechnologyPage",
		condition = function()
			local var_6_0 = getProxy(IslandProxy):GetIsland()
			local var_6_1 = var_6_0:GetTaskAgency():GetTask(var_0_0.TECH_TASK_ID)
			local var_6_2 = var_6_0:GetTechnologyAgency():GetTechnology(var_0_0.TECH_FIRST_ID):GetStatus()

			return var_6_1 and (var_6_2 == IslandTechnology.STATUS.LOCK or var_6_2 == IslandTechnology.STATUS.UNLOCK or var_6_2 == IslandTechnology.STATUS.NORMAL)
		end,
		type = var_0_0.FINISH_TYPE.ON_GUIDE
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
		id = "ISLAND_GUIDE_13",
		page = "Island3dTaskPage",
		condition = function()
			return getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_0_0.DAILY_TASK_ABILITY_ID)
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
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
		id = "ISLAND_GUIDE_23",
		page = "IslandBookPage",
		condition = function()
			return true
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	},
	{
		id = "ISLAND_GUIDE_28",
		page = "IslandPhotoMainPage",
		condition = function()
			return true
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
		id = "ISLAND_GUIDE_31",
		page = "IslandMallDelegationPage",
		condition = function()
			return getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_0_0.COMBP_ABILITY_ID)
		end,
		type = var_0_0.FINISH_TYPE.ON_BEGIN
	},
	{
		id = "ISLAND_GUIDE_32",
		page = "IslandBookFishPage",
		condition = function()
			return true
		end,
		type = var_0_0.FINISH_TYPE.ON_END
	}
}

function var_0_0.CheckOnLoaded(arg_15_0, arg_15_1)
	local var_15_0 = _.detect(var_0_0.loadedConfig, function(arg_16_0)
		local var_16_0 = arg_16_0.id
		local var_16_1 = arg_16_0.mapId
		local var_16_2 = arg_16_0.condition

		return not pg.NewStoryMgr.GetInstance():IsPlayed(var_16_0) and (var_16_1 == 0 or var_16_1 == arg_15_0) and var_16_2()
	end)

	if not var_15_0 then
		existCall(arg_15_1)

		return
	end

	var_0_0._PlayGuide(var_15_0.id, var_15_0.type, arg_15_1)
end

function var_0_0.CheckOnShowInteraction(arg_17_0, arg_17_1)
	local var_17_0 = _.detect(var_0_0.interactionConfig, function(arg_18_0)
		local var_18_0 = arg_18_0.id
		local var_18_1 = arg_18_0.interactionId
		local var_18_2 = arg_18_0.condition

		return not pg.NewStoryMgr.GetInstance():IsPlayed(var_18_0) and (var_18_1 == 0 or var_18_1 == arg_17_0) and var_18_2()
	end)

	if not var_17_0 then
		existCall(arg_17_1)

		return
	end

	var_0_0._PlayGuide(var_17_0.id, var_17_0.type, arg_17_1)
end

function var_0_0.CheckOnOpenPage(arg_19_0, arg_19_1)
	local var_19_0 = _.detect(var_0_0.pageConfig, function(arg_20_0)
		local var_20_0 = arg_20_0.id
		local var_20_1 = arg_20_0.page
		local var_20_2 = arg_20_0.condition

		print("GUIDECHECK:..................." .. var_20_0 .. "::" .. var_20_1)

		return not pg.NewStoryMgr.GetInstance():IsPlayed(var_20_0) and var_20_1 == arg_19_0 and var_20_2()
	end)

	if not var_19_0 then
		existCall(arg_19_1)

		return
	end

	var_0_0._PlayGuide(var_19_0.id, var_19_0.type, arg_19_1)
end

function var_0_0.CheckGuide(arg_21_0, arg_21_1, arg_21_2)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_21_0) then
		return
	end

	local var_21_0 = arg_21_1 or var_0_0.FINISH_TYPE.ON_BEGIN

	var_0_0._PlayGuide(arg_21_0, var_21_0, arg_21_2)
end

function var_0_0.CheckGuideWithArgs(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_22_0) then
		return
	end

	local var_22_0 = arg_22_1 or var_0_0.FINISH_TYPE.ON_BEGIN

	var_0_0._PlayGuide(arg_22_0, var_22_0, arg_22_2, arg_22_3)
end

function var_0_0._PlayGuide(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	if LOCK_ISLAND_GUIDE then
		if arg_23_2 then
			arg_23_2()
		end

		return
	end

	print("GUIDE:..................." .. arg_23_0)

	if pg.SeriesGuideMgr.GetInstance():isRunning() then
		existCall(arg_23_2)

		return
	end

	if not pg.NewGuideMgr.GetInstance():CanPlay() then
		existCall(arg_23_2)

		return
	end

	if arg_23_1 and arg_23_1 == var_0_0.FINISH_TYPE.ON_BEGIN then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = arg_23_0
		})
	end

	if _IslandCore then
		_IslandCore:Link(ISLAND_EVT.START_GUIDE)
	end

	pg.NewGuideMgr.GetInstance():Play(arg_23_0, arg_23_3, function()
		if _IslandCore then
			_IslandCore:Link(ISLAND_EVT.END_GUIDE)
		end

		if arg_23_1 and arg_23_1 == var_0_0.FINISH_TYPE.ON_END then
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_23_0
			})
		end
	end, arg_23_2, function(arg_25_0, arg_25_1)
		var_0_0.Record(arg_25_0, arg_25_1, arg_23_0)
	end)
end

function var_0_0.Record(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_26_1

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandGuide(arg_26_0, var_26_0, arg_26_2))
end

return var_0_0
