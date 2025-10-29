local var_0_0 = class("SlideExtraSystem", import("view.dorm3d.Extra.BaseExtraSystem"))

var_0_0.SHOW_INTERACTION = "SlideExtraSystem.SHOW_INTERACTION"
var_0_0.HIDE_INTERACTION = "SlideExtraSystem.HIDE_INTERACTION"
var_0_0.SHOW_PERFORMANCE = "SlideExtraSystem.SHOW_PERFORMANCE"
var_0_0.HIDE_PERFORMANCE = "SlideExtraSystem.HIDE_PERFORMANCE"

function var_0_0.RegisterNodeCanvas(arg_1_0)
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

function var_0_0.Init(arg_6_0)
	arg_6_0:RegisterNodeCanvas()
	arg_6_0:InitScene()
	arg_6_0:InitData()
	arg_6_0:InitSlide()
	arg_6_0:Emit(Dorm3dRoomMediator.ADD_EXTRA_SYSTEM_FURNITURE_SLIDE)

	arg_6_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_6_0:OnUpdate()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_6_0.updateHandler)

	arg_6_0.pickTimer = Timer.New(function()
		arg_6_0:OnPick()
	end, SlideConst.TIMER_INTERVAL, -1)

	arg_6_0.pickTimer:Start()
	arg_6_0:OnPick()
end

function var_0_0.InitScene(arg_11_0)
	arg_11_0.sceneSlideConfigs = GameObject.Find("SlideConfigs").transform
	arg_11_0.movePointsRoot = arg_11_0.sceneSlideConfigs:Find("MovePoints")
	arg_11_0.defaultPointsRoot = arg_11_0.sceneSlideConfigs:Find("DefaultPoints")
end

function var_0_0.InitSlide(arg_12_0)
	warning("SystemInitSlide")

	if not arg_12_0:Get("doneFirstSlotFresh") or arg_12_0.slideInited then
		return
	end

	arg_12_0.slideInited = true
	arg_12_0.slideGo = arg_12_0:Func("GetSceneItem", "FurnitureSlots/140101/Slide(Clone)")

	assert(arg_12_0.slideGo, "Furniture Slide not found in scene")
	warning("InitSlide Done")

	arg_12_0.slideTreeOwner = GetOrAddComponent(arg_12_0.slideGo, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))

	arg_12_0.slideTreeOwner.graph.blackboard:AddVariable("_player", go(arg_12_0:Get("player")))

	arg_12_0.slideTreeOwner.enabled = true
	arg_12_0.performanceTreeOwner = GetOrAddComponent(arg_12_0.slideGo:Find("performance_interact_point"), typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))

	arg_12_0.performanceTreeOwner.graph.blackboard:AddVariable("_player", go(arg_12_0:Get("player")))

	arg_12_0.performanceTreeOwner.enabled = true
end

function var_0_0.InitData(arg_13_0)
	arg_13_0.commandConfigDic = {}
	arg_13_0.defaultPoints = {}

	_.each(pg.dorm3d_minigame_slide.all, function(arg_14_0)
		arg_13_0.commandConfigDic[arg_14_0] = {}

		_.each(pg.dorm3d_minigame_slide[arg_14_0].slide_command, function(arg_15_0)
			table.insert(arg_13_0.commandConfigDic[arg_14_0], SlideCommand.New(arg_15_0, arg_13_0.movePointsRoot))
		end)

		local var_14_0 = arg_13_0.defaultPointsRoot:Find(pg.dorm3d_minigame_slide[arg_14_0].slide_zone)

		arg_13_0.defaultPoints[arg_14_0] = var_14_0
	end)

	arg_13_0.inviteList = getProxy(ApartmentProxy):GetSlideInviteList()
	arg_13_0.randomList = Clone(arg_13_0.inviteList)
	arg_13_0.ladyDic = {}

	_.each(arg_13_0.inviteList, function(arg_16_0)
		arg_13_0:AddLadySlide(arg_16_0)
	end)
end

function var_0_0.AddLadySlide(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:Get("ladyDict")[arg_17_1]

	arg_17_0.ladyDic[arg_17_1] = LadySlide.New(arg_17_1, var_17_0, arg_17_0.commandConfigDic[arg_17_1], arg_17_0.defaultPoints[arg_17_1], function(arg_18_0)
		arg_17_0:PlayVFX(arg_18_0)
	end)

	arg_17_0.ladyDic[arg_17_1]:Reset()
end

function var_0_0.RemoveLadySlide(arg_19_0, arg_19_1)
	if arg_19_0.ladyDic[arg_19_1] then
		arg_19_0:Func("ChangeCharacterPosition", arg_19_0.ladyDic[arg_19_1].ladyEnv)
		arg_19_0.ladyDic[arg_19_1].ladyEnv:PlaySingleAction(SlideConst.IDLE_ANIM)
		arg_19_0.ladyDic[arg_19_1]:Dispose()

		arg_19_0.ladyDic[arg_19_1] = nil
	end
end

function var_0_0.OnPick(arg_20_0)
	if #arg_20_0.inviteList == 0 then
		return
	end

	arg_20_0.currentGroupId = arg_20_0:RandomPick()

	if arg_20_0.ladyDic[arg_20_0.currentGroupId].ladyEnv:GetBlackboardValue("inWatchMode") then
		if #arg_20_0.inviteList > 1 then
			arg_20_0:OnPick()
		end

		return
	end

	arg_20_0.ladyDic[arg_20_0.currentGroupId]:StartMove()
end

function var_0_0.RandomPick(arg_21_0)
	if not arg_21_0.randomList or #arg_21_0.randomList == 0 then
		arg_21_0.randomList = Clone(arg_21_0.inviteList)
	end

	local var_21_0 = math.random(1, #arg_21_0.randomList)
	local var_21_1 = arg_21_0.randomList[var_21_0]

	table.remove(arg_21_0.randomList, var_21_0)

	return var_21_1
end

function var_0_0.TestMove(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(arg_22_0.ladyDic) do
		iter_22_1:EndMove()
		iter_22_1:StartMove()

		arg_22_0.currentGroupId = iter_22_1.id

		return
	end
end

function var_0_0.UpdateSlideInviteList(arg_23_0, arg_23_1, arg_23_2)
	if table.contains(arg_23_2, arg_23_0.currentGroupId) then
		arg_23_0.ladyDic[arg_23_0.currentGroupId]:EndMove()
	end

	_.each(arg_23_2, function(arg_24_0)
		arg_23_0:RemoveLadySlide(arg_24_0)
		table.removebyvalue(arg_23_0.inviteList, arg_24_0)
		table.removebyvalue(arg_23_0.randomList, arg_24_0)
	end)
	_.each(arg_23_1, function(arg_25_0)
		if not table.contains(arg_23_0.inviteList, arg_25_0) then
			table.insert(arg_23_0.inviteList, arg_25_0)
			arg_23_0:AddLadySlide(arg_25_0)
		end

		if not table.contains(arg_23_0.randomList, arg_25_0) then
			table.insert(arg_23_0.randomList, arg_25_0)
		end
	end)
end

function var_0_0.OnUpdate(arg_26_0)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.ladyDic) do
		iter_26_1:OnUpdate()
	end
end

function var_0_0.PlayVFX(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0.sceneSlideConfigs:Find("vfx/" .. arg_27_1)

	setActive(var_27_0, false)
	onNextTick(function()
		setActive(var_27_0, true)
	end)
end

function var_0_0.Dispose(arg_29_0)
	UpdateBeat:RemoveListener(arg_29_0.updateHandler)
	arg_29_0.pickTimer:Stop()

	for iter_29_0, iter_29_1 in pairs(arg_29_0.ladyDic) do
		arg_29_0:RemoveLadySlide(iter_29_0)
	end

	arg_29_0:Func("ChangePlayerPosition")

	arg_29_0.slideTreeOwner.enabled = false
	arg_29_0.performanceTreeOwner.enabled = false

	pg.NodeCanvasMgr.GetInstance():UnregisterFunc("Slide.ShowInteraction")
	pg.NodeCanvasMgr.GetInstance():UnregisterFunc("Slide.HideInteraction")
	pg.NodeCanvasMgr.GetInstance():UnregisterFunc("Slide.ShowPerformance")
	pg.NodeCanvasMgr.GetInstance():UnregisterFunc("Slide.HidePerformance")
	arg_29_0:Emit(Dorm3dRoomMediator.REMOVE_EXTRA_SYSTEM, FurnitureSlideExtraMediator)
end

function var_0_0.HandleNotification(arg_30_0, arg_30_1, arg_30_2)
	if arg_30_1 == ApartmentProxy.UPDATE_SLIDE_INVITE_LIST then
		arg_30_0:UpdateSlideInviteList(arg_30_2.addIds, arg_30_2.removeIds)
	elseif arg_30_1 == Dorm3dRoomMediator.REFRESH_FURNITURE_AND_SLOTS_DONE then
		arg_30_0:InitSlide()
	end
end

function var_0_0.GetInterests()
	return {
		ApartmentProxy.UPDATE_SLIDE_INVITE_LIST,
		Dorm3dRoomMediator.REFRESH_FURNITURE_AND_SLOTS_DONE
	}
end

function var_0_0.IsOpen(arg_32_0)
	return arg_32_0:GetConfigID() == SlideConst.ROOM_ID and arg_32_0:IsFurnitureSetIn(SlideConst.FURNITURE_ID)
end

return var_0_0
