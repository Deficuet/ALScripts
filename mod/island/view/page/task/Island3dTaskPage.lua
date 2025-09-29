local var_0_0 = class("Island3dTaskPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "Island3dTaskUI"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("adapt/toggles/content")

	arg_2_0.toggleUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	local var_2_1 = arg_2_0._tf:Find("adapt/types/content")

	arg_2_0.typeUIList = UIItemList.New(var_2_1, var_2_1:Find("type_tpl"))
	arg_2_0.detailAnim = arg_2_0._tf:Find("adapt/detail"):GetComponent(typeof(Animation))
	arg_2_0.emptyTF = arg_2_0._tf:Find("adapt/detail/empty")
	arg_2_0.detailTF = arg_2_0._tf:Find("adapt/detail/content")
	arg_2_0.titleBg = arg_2_0.detailTF:Find("title")
	arg_2_0.typeIcon = arg_2_0.detailTF:Find("title/icon")
	arg_2_0.nameTF = arg_2_0.detailTF:Find("title/icon/name")
	arg_2_0.timeTF = arg_2_0.detailTF:Find("title/time")
	arg_2_0.descTF = arg_2_0.detailTF:Find("desc")
	arg_2_0.targetTF = arg_2_0.detailTF:Find("targets")

	setText(arg_2_0.targetTF:Find("Text"), i18n("island_task_target"))

	arg_2_0.finishedTargetTF = arg_2_0.targetTF:Find("content/finished")
	arg_2_0.finishedTargetTextTF = arg_2_0.finishedTargetTF:Find("Text")
	arg_2_0.finishedTargetLocTF = arg_2_0.finishedTargetTF:Find("location")
	arg_2_0.targetContent = arg_2_0.targetTF:Find("content/list")
	arg_2_0.targetUIList = UIItemList.New(arg_2_0.targetContent, arg_2_0.targetContent:Find("tpl"))
	arg_2_0.awardsTF = arg_2_0.detailTF:Find("awards")

	setText(arg_2_0.awardsTF:Find("title/Text"), i18n("island_task_award"))

	local var_2_2 = arg_2_0.awardsTF:Find("view/mask/content")

	arg_2_0.awardUIList = UIItemList.New(var_2_2, var_2_2:Find("tpl"))
	arg_2_0.detailBtns = arg_2_0.detailTF:Find("btns")
	arg_2_0.traceBtn = arg_2_0.detailBtns:Find("trace")

	setText(arg_2_0.traceBtn:Find("Text"), i18n("island_task_tracking"))

	arg_2_0.tracedBtn = arg_2_0.detailBtns:Find("traced")

	setText(arg_2_0.tracedBtn:Find("Text"), i18n("island_task_tracked"))
	setText(arg_2_0:findTF("top/title/Text"), i18n("island_task_title"))
	setText(arg_2_0:findTF("top/title/Text/en"), i18n("island_task_title_en"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/back"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0.toggleUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventInit then
			arg_3_0:InitToggleItem(arg_5_1, arg_5_2)
		end
	end)
	arg_3_0.typeUIList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateTypeItem(arg_6_1, arg_6_2)
		end
	end)
	arg_3_0.targetUIList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateTargetItem(arg_7_1, arg_7_2)
		end
	end)
	arg_3_0.awardUIList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = arg_3_0.showAwards[arg_8_1 + 1]

			updateCustomDrop(arg_8_2, var_8_0)
		end
	end)
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddListener(GAME.ISLAND_SET_TRACE_TASK_DONE, arg_9_0.FlushDetail)
	arg_9_0:AddListener(GAME.ISLAND_ACCEPT_TASK_DONE, arg_9_0.Flush)
	arg_9_0:AddListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_9_0.Flush)
	arg_9_0:AddListener(GAME.ISLAND_UPDATE_TASK_DONE, arg_9_0.Flush)
	arg_9_0:AddListener(GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE, arg_9_0.Flush)
	arg_9_0:AddListener(IslandTaskAgency.TASK_ADDED, arg_9_0.Flush)
	arg_9_0:AddListener(IslandTaskAgency.TASK_UPDATED, arg_9_0.Flush)
	arg_9_0:AddListener(IslandTaskAgency.TASK_REMOVED, arg_9_0.Flush)
end

function var_0_0.RemoveListeners(arg_10_0)
	arg_10_0:RemoveListener(GAME.ISLAND_SET_TRACE_TASK_DONE, arg_10_0.FlushDetail)
	arg_10_0:RemoveListener(GAME.ISLAND_ACCEPT_TASK_DONE, arg_10_0.Flush)
	arg_10_0:RemoveListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_10_0.Flush)
	arg_10_0:RemoveListener(GAME.ISLAND_UPDATE_TASK_DONE, arg_10_0.Flush)
	arg_10_0:RemoveListener(GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE, arg_10_0.Flush)
	arg_10_0:RemoveListener(IslandTaskAgency.TASK_ADDED, arg_10_0.Flush)
	arg_10_0:RemoveListener(IslandTaskAgency.TASK_UPDATED, arg_10_0.Flush)
	arg_10_0:RemoveListener(IslandTaskAgency.TASK_REMOVED, arg_10_0.Flush)
end

function var_0_0.InitToggleItem(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.toggleList[arg_11_1 + 1]

	arg_11_2.name = var_11_0

	local var_11_1 = IslandTaskType.ShowTypeNames[var_11_0]

	setText(arg_11_2:Find("unsel"), var_11_1)
	setText(arg_11_2:Find("sel/content/Text"), var_11_1)

	if var_11_0 ~= IslandTaskType.SHOW_ALL then
		LoadImageSpriteAtlasAsync("island/islandtasktype", IslandTaskType.ShowTypeFields[var_11_0], arg_11_2:Find("sel/content/Image"), false)
	end

	onToggle(arg_11_0, arg_11_2, function(arg_12_0)
		if arg_12_0 and (not arg_11_0.selectedType or arg_11_0.selectedType ~= var_11_0) then
			arg_11_0.selectedType = var_11_0

			arg_11_0:Flush()
			arg_11_2:GetComponent(typeof(Animation)):Play()
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateTypeItem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.showTypeList[arg_13_1 + 1]

	arg_13_2.name = var_13_0

	local var_13_1 = IslandTaskType.ShowTypeNames[var_13_0]

	setText(arg_13_2:Find("title/Text"), var_13_1)
	setImageColor(arg_13_2:Find("title"), Color.NewHex(IslandTaskType.ShowTypeColors[var_13_0]))
	LoadImageSpriteAtlasAsync("island/islandtasktype", IslandTaskType.ShowTypeFields[var_13_0], arg_13_2:Find("title/Image"))
	setActive(arg_13_2:Find("line"), arg_13_1 + 1 ~= #arg_13_0.showTypeList)

	local var_13_2 = UIItemList.New(arg_13_2:Find("list"), arg_13_2:Find("list"):GetChild(0))

	var_13_2:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = arg_13_0.showTaskDict[var_13_0][arg_14_1 + 1]

			arg_13_0:UpdateTaskItem(arg_14_2, var_14_0)
		end
	end)

	local var_13_3 = arg_13_0.showTaskDict[var_13_0] and arg_13_0.showTaskDict[var_13_0] or {}

	var_13_2:align(#var_13_3)
end

function var_0_0.UpdateTaskItem(arg_15_0, arg_15_1, arg_15_2)
	arg_15_1.name = arg_15_2.id

	local var_15_0 = arg_15_2:GetShowType()

	setImageColor(arg_15_1:Find("main/line"), Color.NewHex(IslandTaskType.ShowTypeColors[var_15_0]))

	local var_15_1 = arg_15_2:IsSeries()

	setText(arg_15_1:Find("main/name"), var_15_1 and arg_15_2:GetSeriesTitle() or arg_15_2:GetName())
	setActive(arg_15_1:Find("sub"), var_15_1)
	setActive(arg_15_1:Find("main/location"), not var_15_1)

	if var_15_1 then
		local var_15_2 = IslandTaskType.ShowTypeFields[var_15_0]

		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "color_" .. var_15_2, arg_15_1:Find("sub/bg"))
		setText(arg_15_1:Find("sub/name"), arg_15_2:GetName())
		arg_15_0:UpdateLocation(arg_15_1:Find("sub/location"), arg_15_2)
	else
		arg_15_0:UpdateLocation(arg_15_1:Find("main/location"), arg_15_2)
	end

	onToggle(arg_15_0, arg_15_1, function(arg_16_0)
		setActive(arg_15_1:Find("main/selected"), arg_16_0 and not var_15_1)
		setActive(arg_15_1:Find("sub/selected"), arg_16_0 and var_15_1)

		if arg_16_0 and (not arg_15_0.selectedTaskId or arg_15_0.selectedTaskId ~= arg_15_2.id or arg_15_0.isOpen) then
			arg_15_0.selectedTaskId = arg_15_2.id

			arg_15_0:FlushDetail()

			arg_15_0.isOpen = false
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateLocation(arg_17_0, arg_17_1, arg_17_2)
	setActive(arg_17_1, arg_17_2.id == arg_17_0.trackTaskId)

	if arg_17_2.id == arg_17_0.trackTaskId then
		local var_17_0 = arg_17_2:GetTraceParam()
		local var_17_1 = tonumber(var_17_0)

		setActive(arg_17_1, var_17_1)

		if var_17_1 then
			local var_17_2 = pg.island_world_objects[var_17_1].mapId
			local var_17_3 = var_17_2 == arg_17_0.curMapId and arg_17_0:CalcDistance(var_17_1) .. "m" or pg.island_map[var_17_2].name

			setText(arg_17_1:Find("Text"), var_17_3)
		end
	end
end

function var_0_0.CalcDistance(arg_18_0, arg_18_1)
	local var_18_0 = _IslandCore:GetView():GetPlayerPosition()
	local var_18_1 = _IslandCore:GetView():GetUnitPosition(arg_18_1) or var_18_0
	local var_18_2 = Vector3.Distance(var_18_0, var_18_1)

	return math.ceil(var_18_2)
end

function var_0_0.UpdateTargetItem(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.showTargets[arg_19_1 + 1]

	setText(arg_19_2:Find("content/Text"), var_19_0:getConfig("name"))

	local var_19_1 = var_19_0:GetProgress()
	local var_19_2 = var_19_0:GetTargetNum()

	setText(arg_19_2:Find("content/num"), string.format("(%d/%d)", var_19_1, var_19_2))

	local var_19_3 = var_19_0:IsFinish()

	setActive(arg_19_2:Find("status/unfinish"), not var_19_3)
	setActive(arg_19_2:Find("status/finished"), var_19_3)

	local var_19_4, var_19_5 = arg_19_0.showVO:GetTraceParam()
	local var_19_6 = arg_19_2:Find("content/location")
	local var_19_7 = var_19_5 and var_19_5 == arg_19_1 + 1

	setActive(var_19_6, var_19_7)

	if var_19_7 then
		arg_19_0:UpdateLocation(var_19_6, arg_19_0.showVO)
	end
end

function var_0_0.Flush(arg_20_0)
	if not arg_20_0.selectedType then
		arg_20_0.selectedType = IslandTaskType.SHOW_ALL
	end

	local var_20_0 = getProxy(IslandProxy):GetIsland()

	arg_20_0.curMapId = var_20_0:GetMapId()
	arg_20_0.taskAgency = var_20_0:GetTaskAgency()
	arg_20_0.trackTaskId = arg_20_0.taskAgency:GetTraceId()

	local var_20_1 = arg_20_0.taskAgency:GetShowTasks()

	arg_20_0.showTaskDict = {}

	for iter_20_0, iter_20_1 in pairs(var_20_1) do
		local var_20_2 = iter_20_1:GetShowType()

		if var_20_2 then
			if not arg_20_0.showTaskDict[var_20_2] then
				arg_20_0.showTaskDict[var_20_2] = {}
			end

			table.insert(arg_20_0.showTaskDict[var_20_2], iter_20_1)
		end
	end

	arg_20_0.showTypeList = {
		arg_20_0.selectedType
	}

	if arg_20_0.selectedType == IslandTaskType.SHOW_ALL then
		arg_20_0.showTypeList = arg_20_0:GetShowTypeList()
	end

	table.sort(arg_20_0.showTypeList)
	arg_20_0.typeUIList:align(#arg_20_0.showTypeList)
	arg_20_0:PingFirstTask()
end

function var_0_0.FlushTypeUIList(arg_21_0)
	arg_21_0.typeUIList:align(#arg_21_0.showTypeList)

	local var_21_0 = {}

	arg_21_0.typeUIList:eachActive(function(arg_22_0, arg_22_1)
		arg_22_1:GetComponent(typeof(CanvasGroup)).alpha = 0

		table.insert(var_21_0, function(arg_23_0)
			arg_22_1:GetComponent(typeof(Animation)):Play()

			arg_22_1:GetComponent(typeof(CanvasGroup)).alpha = 1

			arg_21_0:managedTween(LeanTween.delayedCall, function()
				arg_23_0()
			end, 0.06, nil)
		end)
	end)
	seriesAsync(var_21_0)
end

function var_0_0.PingFirstTask(arg_25_0)
	local var_25_0 = underscore.detect(arg_25_0.showTypeList, function(arg_26_0)
		return arg_25_0.showTaskDict[arg_26_0] and #arg_25_0.showTaskDict[arg_26_0] > 0
	end)

	if var_25_0 then
		triggerToggle(arg_25_0.typeUIList.container:Find(var_25_0 .. "/list"):GetChild(0), true)
	else
		arg_25_0.selectedTaskId = nil

		arg_25_0:FlushDetail()
	end
end

function var_0_0.FlushDetail(arg_27_0)
	arg_27_0.trackTaskId = arg_27_0.taskAgency:GetTraceId()

	setActive(arg_27_0.detailTF, arg_27_0.selectedTaskId)
	setActive(arg_27_0.emptyTF, not arg_27_0.selectedTaskId)

	arg_27_0.showVO = arg_27_0.taskAgency:GetTask(arg_27_0.selectedTaskId)

	if arg_27_0.selectedTaskId and arg_27_0.showVO then
		arg_27_0.detailAnim:Play()

		local var_27_0 = arg_27_0.showVO:GetShowType()
		local var_27_1 = IslandTaskType.ShowTypeFields[var_27_0]

		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "title_bg_" .. var_27_1, arg_27_0.titleBg)
		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "title_icon_" .. var_27_1, arg_27_0.typeIcon)
		setText(arg_27_0.nameTF, arg_27_0.showVO:GetName())
		setActive(arg_27_0.timeTF, var_27_0 == IslandTaskType.SHOW_ACTIVITY)

		if var_27_0 == IslandTaskType.SHOW_ACTIVITY then
			setText(arg_27_0.timeTF:Find("Text"), arg_27_0.showVO:GetRemainTimeStr())
		end

		setText(arg_27_0.descTF, arg_27_0.showVO:GetDesc())

		arg_27_0.showTargets = arg_27_0.showVO:GetTargetList()

		local var_27_2 = not arg_27_0.showVO:IsSubmitImmediately() and arg_27_0.showVO:IsFinish()

		arg_27_0.targetUIList:align(#arg_27_0.showTargets)
		setActive(arg_27_0.finishedTargetTF, var_27_2)

		if var_27_2 then
			setText(arg_27_0.finishedTargetTextTF, arg_27_0.showVO:GetFinishedDesc())
			arg_27_0:UpdateLocation(arg_27_0.finishedTargetLocTF, arg_27_0.showVO)
		end

		arg_27_0.showAwards = arg_27_0.showVO:GetAwards()

		arg_27_0.awardUIList:align(#arg_27_0.showAwards)
		setActive(arg_27_0.traceBtn, arg_27_0.showVO.id ~= arg_27_0.trackTaskId)
		onButton(arg_27_0, arg_27_0.traceBtn, function()
			arg_27_0:emit(IslandMediator.ON_SET_TRACE_ID, arg_27_0.showVO.id)
		end, SFX_PANEL)
		setActive(arg_27_0.tracedBtn, arg_27_0.showVO.id == arg_27_0.trackTaskId)
		onButton(arg_27_0, arg_27_0.tracedBtn, function()
			arg_27_0:emit(IslandMediator.ON_SET_TRACE_ID, 0)
		end, SFX_PANEL)
	end
end

function var_0_0.OnShow(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0.isOpen = true
	arg_30_0.toggleList = arg_30_0:GetShowTypeList()

	table.insert(arg_30_0.toggleList, 1, IslandTaskType.SHOW_ALL)
	arg_30_0.toggleUIList:align(#arg_30_0.toggleList)
	arg_30_0:Flush()

	local var_30_0 = false

	if arg_30_1 and arg_30_0.toggleUIList.container:Find(arg_30_1) then
		triggerToggle(arg_30_0.toggleUIList.container:Find(arg_30_1), true)

		var_30_0 = true
	end

	if getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(arg_30_2 or 0) then
		if not var_30_0 then
			triggerToggle(arg_30_0.toggleUIList.container:GetChild(0), true)
		end

		local var_30_1 = IslandTaskType.Type2ShowType[pg.island_task[arg_30_2].type]

		triggerToggle(arg_30_0.typeUIList.container:Find(var_30_1 .. "/list/" .. arg_30_2), true)
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_30_0._tf)
end

function var_0_0.GetShowTypeList(arg_31_0)
	local var_31_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()
	local var_31_1 = underscore.select(underscore.keys(IslandTaskType.ShowTypeUnlockId), function(arg_32_0)
		return var_31_0:HasAbility(IslandTaskType.ShowTypeUnlockId[arg_32_0])
	end)

	table.sort(var_31_1)

	return var_31_1
end

function var_0_0.OnHide(arg_33_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_33_0._tf)
end

function var_0_0.OnDisable(arg_34_0)
	arg_34_0:OnHide()
end

function var_0_0.OnDestroy(arg_35_0)
	arg_35_0:OnHide()
end

return var_0_0
