local var_0_0 = class("SlideExtraSystem", import("view.dorm3d.Core.BaseSystem"))

var_0_0.SHOW_INTERACTION = "SlideExtraSystem.SHOW_INTERACTION"
var_0_0.HIDE_INTERACTION = "SlideExtraSystem.HIDE_INTERACTION"
var_0_0.SHOW_PERFORMANCE = "SlideExtraSystem.SHOW_PERFORMANCE"
var_0_0.HIDE_PERFORMANCE = "SlideExtraSystem.HIDE_PERFORMANCE"

function var_0_0.OnInit(arg_1_0)
	arg_1_0:RegisterNodeCanvas()
	arg_1_0:InitScene()
	arg_1_0:InitData()
	arg_1_0:InitSlide()
	arg_1_0:Emit(Dorm3dRoomMediator.ADD_EXTRA_SYSTEM_FURNITURE_SLIDE)

	arg_1_0.pickTimer = Timer.New(function()
		arg_1_0:OnPick()
	end, SlideConst.TIMER_INTERVAL, -1)

	arg_1_0.pickTimer:Start()
	arg_1_0:OnPick()
end

function var_0_0.RegisterEvents(arg_3_0)
	arg_3_0:Bind(FurnitureSystem.REFRESH_DONE, function()
		arg_3_0:InitSlide()
	end)
end

function var_0_0.OnUpdate(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in pairs(arg_5_0.ladyDic) do
		iter_5_1:OnUpdate()
	end
end

function var_0_0.OnDispose(arg_6_0)
	if arg_6_0.pickTimer then
		arg_6_0.pickTimer:Stop()

		arg_6_0.pickTimer = nil
	end

	for iter_6_0, iter_6_1 in pairs(arg_6_0.ladyDic) do
		arg_6_0:RemoveLadySlide(iter_6_0)
	end

	arg_6_0:Emit(Dorm3dRoomTemplateScene.EXTRA_CHANGE_PLAYER_POSITION)

	if arg_6_0.slideTreeOwner then
		arg_6_0.slideTreeOwner.enabled = false
	end

	if arg_6_0.performanceTreeOwner then
		arg_6_0.performanceTreeOwner.enabled = false
	end

	pg.NodeCanvasMgr.GetInstance():UnregisterFunc("Slide.ShowInteraction")
	pg.NodeCanvasMgr.GetInstance():UnregisterFunc("Slide.HideInteraction")
	pg.NodeCanvasMgr.GetInstance():UnregisterFunc("Slide.ShowPerformance")
	pg.NodeCanvasMgr.GetInstance():UnregisterFunc("Slide.HidePerformance")
	arg_6_0:Emit(Dorm3dRoomMediator.REMOVE_EXTRA_SYSTEM, FurnitureSlideExtraMediator)
end

function var_0_0.OnHandleNotification(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_1 == ApartmentProxy.UPDATE_SLIDE_INVITE_LIST then
		arg_7_0:UpdateSlideInviteList(arg_7_2.addIds, arg_7_2.removeIds)
	end
end

function var_0_0.GetInterests()
	return {
		ApartmentProxy.UPDATE_SLIDE_INVITE_LIST
	}
end

function var_0_0.IsOpen(arg_9_0)
	return arg_9_0:GetConfigID() == SlideConst.ROOM_ID and arg_9_0:IsFurnitureSetIn(SlideConst.FURNITURE_ID)
end

function var_0_0.RegisterNodeCanvas(arg_10_0)
	pg.NodeCanvasMgr.GetInstance():RegisterFunc("Slide.ShowInteraction", function()
		pg.m02:sendNotification(var_0_0.SHOW_INTERACTION)
	end)
	pg.NodeCanvasMgr.GetInstance():RegisterFunc("Slide.HideInteraction", function()
		pg.m02:sendNotification(var_0_0.HIDE_INTERACTION)
	end)
	pg.NodeCanvasMgr.GetInstance():RegisterFunc("Slide.ShowPerformance", function()
		pg.m02:sendNotification(var_0_0.SHOW_PERFORMANCE)
	end)
	pg.NodeCanvasMgr.GetInstance():RegisterFunc("Slide.HidePerformance", function()
		pg.m02:sendNotification(var_0_0.HIDE_PERFORMANCE)
	end)
end

function var_0_0.InitScene(arg_15_0)
	arg_15_0.sceneSlideConfigs = GameObject.Find("SlideConfigs").transform
	arg_15_0.movePointsRoot = arg_15_0.sceneSlideConfigs:Find("MovePoints")
	arg_15_0.defaultPointsRoot = arg_15_0.sceneSlideConfigs:Find("DefaultPoints")
end

function var_0_0.InitSlide(arg_16_0)
	warning("SystemInitSlide")

	if arg_16_0.slideInited then
		return
	end

	arg_16_0.slideInited = true
	arg_16_0.slideGo = arg_16_0:GetSceneItem("FurnitureSlots/140101/Slide(Clone)")

	if not arg_16_0.slideGo then
		arg_16_0.slideInited = nil

		return
	end

	warning("InitSlide Done")

	arg_16_0.slideTreeOwner = GetOrAddComponent(arg_16_0.slideGo, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))

	arg_16_0.slideTreeOwner.graph.blackboard:AddVariable("_player", go(arg_16_0:GetPlayer()))

	arg_16_0.slideTreeOwner.enabled = true
	arg_16_0.performanceTreeOwner = GetOrAddComponent(arg_16_0.slideGo:Find("performance_interact_point"), typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))

	arg_16_0.performanceTreeOwner.graph.blackboard:AddVariable("_player", go(arg_16_0:GetPlayer()))

	arg_16_0.performanceTreeOwner.enabled = true
end

function var_0_0.InitData(arg_17_0)
	arg_17_0.commandConfigDic = {}
	arg_17_0.defaultPoints = {}

	_.each(pg.dorm3d_minigame_slide.all, function(arg_18_0)
		arg_17_0.commandConfigDic[arg_18_0] = {}

		_.each(pg.dorm3d_minigame_slide[arg_18_0].slide_command, function(arg_19_0)
			table.insert(arg_17_0.commandConfigDic[arg_18_0], SlideCommand.New(arg_19_0, arg_17_0.movePointsRoot))
		end)

		local var_18_0 = arg_17_0.defaultPointsRoot:Find(pg.dorm3d_minigame_slide[arg_18_0].slide_zone)

		arg_17_0.defaultPoints[arg_18_0] = var_18_0
	end)

	arg_17_0.inviteList = getProxy(ApartmentProxy):GetSlideInviteList()
	arg_17_0.randomList = Clone(arg_17_0.inviteList)
	arg_17_0.ladyDic = {}

	_.each(arg_17_0.inviteList, function(arg_20_0)
		arg_17_0:AddLadySlide(arg_20_0)
	end)
end

function var_0_0.AddLadySlide(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0:GetLadyDict()[arg_21_1]

	arg_21_0.ladyDic[arg_21_1] = LadySlide.New(arg_21_1, var_21_0, arg_21_0.commandConfigDic[arg_21_1], arg_21_0.defaultPoints[arg_21_1], function(arg_22_0)
		arg_21_0:PlayVFX(arg_22_0)
	end)

	arg_21_0.ladyDic[arg_21_1]:Reset()
end

function var_0_0.RemoveLadySlide(arg_23_0, arg_23_1)
	if arg_23_0.ladyDic[arg_23_1] then
		arg_23_0:Emit(Dorm3dRoomTemplateScene.EXTRA_CHANGE_CHARACTER_POSITION, arg_23_0.ladyDic[arg_23_1].ladyEnv)
		arg_23_0.ladyDic[arg_23_1].ladyEnv:PlaySingleAction(SlideConst.IDLE_ANIM)
		arg_23_0.ladyDic[arg_23_1]:Dispose()

		arg_23_0.ladyDic[arg_23_1] = nil
	end
end

function var_0_0.OnPick(arg_24_0)
	if #arg_24_0.inviteList == 0 then
		return
	end

	arg_24_0.currentGroupId = arg_24_0:RandomPick()

	if arg_24_0.ladyDic[arg_24_0.currentGroupId].ladyEnv:GetBlackboardValue("inWatchMode") then
		if #arg_24_0.inviteList > 1 then
			arg_24_0:OnPick()
		end

		return
	end

	arg_24_0.ladyDic[arg_24_0.currentGroupId]:StartMove()
end

function var_0_0.RandomPick(arg_25_0)
	if not arg_25_0.randomList or #arg_25_0.randomList == 0 then
		arg_25_0.randomList = Clone(arg_25_0.inviteList)
	end

	local var_25_0 = math.random(1, #arg_25_0.randomList)
	local var_25_1 = arg_25_0.randomList[var_25_0]

	table.remove(arg_25_0.randomList, var_25_0)

	return var_25_1
end

function var_0_0.TestMove(arg_26_0)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.ladyDic) do
		iter_26_1:EndMove()
		iter_26_1:StartMove()

		arg_26_0.currentGroupId = iter_26_1.id

		return
	end
end

function var_0_0.UpdateSlideInviteList(arg_27_0, arg_27_1, arg_27_2)
	if table.contains(arg_27_2, arg_27_0.currentGroupId) then
		arg_27_0.ladyDic[arg_27_0.currentGroupId]:EndMove()
	end

	_.each(arg_27_2, function(arg_28_0)
		arg_27_0:RemoveLadySlide(arg_28_0)
		table.removebyvalue(arg_27_0.inviteList, arg_28_0)
		table.removebyvalue(arg_27_0.randomList, arg_28_0)
	end)
	_.each(arg_27_1, function(arg_29_0)
		if not table.contains(arg_27_0.inviteList, arg_29_0) then
			table.insert(arg_27_0.inviteList, arg_29_0)
			arg_27_0:AddLadySlide(arg_29_0)
		end

		if not table.contains(arg_27_0.randomList, arg_29_0) then
			table.insert(arg_27_0.randomList, arg_29_0)
		end
	end)
end

function var_0_0.PlayVFX(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.sceneSlideConfigs:Find("vfx/" .. arg_30_1)

	setActive(var_30_0, false)
	onNextTick(function()
		setActive(var_30_0, true)
	end)
end

return var_0_0
