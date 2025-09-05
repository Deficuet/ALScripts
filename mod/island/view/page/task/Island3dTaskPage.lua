local var_0_0 = class("Island3dTaskPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "Island3dTaskUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.uiAnim = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.uiAnimEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	arg_2_0.uiAnimEvent:SetEndEvent(function()
		arg_2_0.playingHideAnim = false

		var_0_0.super.Hide(arg_2_0)
	end)

	local var_2_0 = arg_2_0._tf:Find("toggles/content")

	arg_2_0.toggleUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	local var_2_1 = arg_2_0._tf:Find("types/content")

	arg_2_0.typeUIList = UIItemList.New(var_2_1, var_2_1:Find("type_tpl"))
	arg_2_0.detailAnim = arg_2_0._tf:Find("detail"):GetComponent(typeof(Animation))
	arg_2_0.emptyTF = arg_2_0._tf:Find("detail/empty")
	arg_2_0.detailTF = arg_2_0._tf:Find("detail/content")
	arg_2_0.titleBg = arg_2_0.detailTF:Find("title")
	arg_2_0.typeIcon = arg_2_0.detailTF:Find("title/icon")
	arg_2_0.nameTF = arg_2_0.detailTF:Find("title/icon/name")
	arg_2_0.timeTF = arg_2_0.detailTF:Find("title/time")
	arg_2_0.descTF = arg_2_0.detailTF:Find("desc")
	arg_2_0.targetTF = arg_2_0.detailTF:Find("targets")

	setText(arg_2_0.targetTF:Find("Text"), i18n("island_task_target"))

	arg_2_0.finishedTargetTF = arg_2_0.targetTF:Find("finished")
	arg_2_0.finishedTargetTextTF = arg_2_0.finishedTargetTF:Find("Text")
	arg_2_0.finishedTargetLocTF = arg_2_0.finishedTargetTF:Find("location")
	arg_2_0.targetContent = arg_2_0.targetTF:Find("content")
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
end

function var_0_0.OnInit(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf:Find("top/back"), function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0._tf:Find("top/home"), function()
		arg_4_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	arg_4_0.toggleUIList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventInit then
			arg_4_0:InitToggleItem(arg_7_1, arg_7_2)
		end
	end)

	arg_4_0.toggleList = underscore.keys(IslandTaskType.ShowTypeNames)

	table.sort(arg_4_0.toggleList)
	arg_4_0.toggleUIList:align(#arg_4_0.toggleList)
	arg_4_0.typeUIList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateTypeItem(arg_8_1, arg_8_2)
		end
	end)
	arg_4_0.targetUIList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateTargetItem(arg_9_1, arg_9_2)
		end
	end)
	arg_4_0.awardUIList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_4_0.showAwards[arg_10_1 + 1]

			updateCustomDrop(arg_10_2, var_10_0)
		end
	end)
end

function var_0_0.AddListeners(arg_11_0)
	arg_11_0:AddListener(GAME.ISLAND_SET_TRACE_TASK_DONE, arg_11_0.FlushDetail)
	arg_11_0:AddListener(GAME.ISLAND_ACCEPT_TASK_DONE, arg_11_0.Flush)
	arg_11_0:AddListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_11_0.Flush)
	arg_11_0:AddListener(GAME.ISLAND_UPDATE_TASK_DONE, arg_11_0.Flush)
	arg_11_0:AddListener(GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE, arg_11_0.Flush)
	arg_11_0:AddListener(IslandTaskAgency.TASK_ADDED, arg_11_0.Flush)
	arg_11_0:AddListener(IslandTaskAgency.TASK_UPDATED, arg_11_0.Flush)
	arg_11_0:AddListener(IslandTaskAgency.TASK_REMOVED, arg_11_0.Flush)
end

function var_0_0.RemoveListeners(arg_12_0)
	arg_12_0:RemoveListener(GAME.ISLAND_SET_TRACE_TASK_DONE, arg_12_0.FlushDetail)
	arg_12_0:RemoveListener(GAME.ISLAND_ACCEPT_TASK_DONE, arg_12_0.Flush)
	arg_12_0:RemoveListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_12_0.Flush)
	arg_12_0:RemoveListener(GAME.ISLAND_UPDATE_TASK_DONE, arg_12_0.Flush)
	arg_12_0:RemoveListener(GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE, arg_12_0.Flush)
	arg_12_0:RemoveListener(IslandTaskAgency.TASK_ADDED, arg_12_0.Flush)
	arg_12_0:RemoveListener(IslandTaskAgency.TASK_UPDATED, arg_12_0.Flush)
	arg_12_0:RemoveListener(IslandTaskAgency.TASK_REMOVED, arg_12_0.Flush)
end

function var_0_0.InitToggleItem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.toggleList[arg_13_1 + 1]

	arg_13_2.name = var_13_0

	local var_13_1 = IslandTaskType.ShowTypeNames[var_13_0]

	setText(arg_13_2:Find("unsel"), var_13_1)
	setText(arg_13_2:Find("sel/content/Text"), var_13_1)

	if var_13_0 ~= IslandTaskType.SHOW_ALL then
		LoadImageSpriteAtlasAsync("island/islandtasktype", IslandTaskType.ShowTypeFields[var_13_0], arg_13_2:Find("sel/content/Image"), false)
	end

	onToggle(arg_13_0, arg_13_2, function(arg_14_0)
		arg_13_0.selectedType = var_13_0

		arg_13_0:Flush()

		if arg_14_0 then
			arg_13_2:GetComponent(typeof(Animation)):Play()
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateTypeItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.showTypeList[arg_15_1 + 1]

	arg_15_2.name = var_15_0

	local var_15_1 = IslandTaskType.ShowTypeNames[var_15_0]

	setText(arg_15_2:Find("title/Text"), var_15_1)
	setImageColor(arg_15_2:Find("title"), Color.NewHex(IslandTaskType.ShowTypeColors[var_15_0]))
	LoadImageSpriteAtlasAsync("island/islandtasktype", IslandTaskType.ShowTypeFields[var_15_0], arg_15_2:Find("title/Image"))
	setActive(arg_15_2:Find("line"), arg_15_1 + 1 ~= #arg_15_0.showTypeList)

	local var_15_2 = UIItemList.New(arg_15_2:Find("list"), arg_15_2:Find("list"):GetChild(0))

	var_15_2:make(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == UIItemList.EventUpdate then
			local var_16_0 = arg_15_0.showTaskDict[var_15_0][arg_16_1 + 1]

			arg_15_0:UpdateTaskItem(arg_16_2, var_16_0)
		end
	end)

	local var_15_3 = arg_15_0.showTaskDict[var_15_0] and arg_15_0.showTaskDict[var_15_0] or {}

	var_15_2:align(#var_15_3)
end

function var_0_0.UpdateTaskItem(arg_17_0, arg_17_1, arg_17_2)
	arg_17_1.name = arg_17_2.id

	local var_17_0 = arg_17_2:GetShowType()

	setImageColor(arg_17_1:Find("main/line"), Color.NewHex(IslandTaskType.ShowTypeColors[var_17_0]))

	local var_17_1 = arg_17_2:IsSeries()

	setText(arg_17_1:Find("main/name"), var_17_1 and arg_17_2:GetSeriesTitle() or arg_17_2:GetName())
	setActive(arg_17_1:Find("sub"), var_17_1)
	setActive(arg_17_1:Find("main/location"), not var_17_1)

	if var_17_1 then
		local var_17_2 = IslandTaskType.ShowTypeFields[var_17_0]

		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "color_" .. var_17_2, arg_17_1:Find("sub/bg"))
		setText(arg_17_1:Find("sub/name"), arg_17_2:GetName())
		arg_17_0:UpdateLocation(arg_17_1:Find("sub/location"), arg_17_2)
	else
		arg_17_0:UpdateLocation(arg_17_1:Find("main/location"), arg_17_2)
	end

	onToggle(arg_17_0, arg_17_1, function(arg_18_0)
		arg_17_0.selectedTaskId = arg_17_2.id

		setActive(arg_17_1:Find("main/selected"), arg_18_0 and not var_17_1)
		setActive(arg_17_1:Find("sub/selected"), arg_18_0 and var_17_1)
		arg_17_0:FlushDetail()
	end, SFX_PANEL)
end

function var_0_0.UpdateLocation(arg_19_0, arg_19_1, arg_19_2)
	setActive(arg_19_1, arg_19_2.id == arg_19_0.trackTaskId)

	if arg_19_2.id == arg_19_0.trackTaskId then
		local var_19_0 = arg_19_2:GetTraceParam()
		local var_19_1 = tonumber(var_19_0)

		setActive(arg_19_1, var_19_1)

		if var_19_1 then
			local var_19_2 = pg.island_world_objects[var_19_1].mapId
			local var_19_3 = var_19_2 == arg_19_0.curMapId and arg_19_0:CalcDistance(var_19_1) .. "m" or pg.island_map[var_19_2].name

			setText(arg_19_1:Find("Text"), var_19_3)
		end
	end
end

function var_0_0.CalcDistance(arg_20_0, arg_20_1)
	local var_20_0 = _IslandCore:GetView():GetPlayerPosition()
	local var_20_1 = _IslandCore:GetView():GetUnitPosition(arg_20_1) or var_20_0
	local var_20_2 = Vector3.Distance(var_20_0, var_20_1)

	return math.ceil(var_20_2)
end

function var_0_0.UpdateTargetItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.showTargets[arg_21_1 + 1]

	setText(arg_21_2:Find("content/Text"), var_21_0:getConfig("name"))

	local var_21_1 = var_21_0:GetProgress()
	local var_21_2 = var_21_0:GetTargetNum()

	setText(arg_21_2:Find("content/num"), string.format("(%d/%d)", var_21_1, var_21_2))

	local var_21_3 = var_21_0:IsFinish()

	setActive(arg_21_2:Find("status/unfinish"), not var_21_3)
	setActive(arg_21_2:Find("status/finished"), var_21_3)

	local var_21_4, var_21_5 = arg_21_0.showVO:GetTraceParam()
	local var_21_6 = arg_21_2:Find("content/location")
	local var_21_7 = var_21_5 and var_21_5 == arg_21_1 + 1

	setActive(var_21_6, var_21_7)

	if var_21_7 then
		arg_21_0:UpdateLocation(var_21_6, arg_21_0.showVO)
	end
end

function var_0_0.Flush(arg_22_0)
	if not arg_22_0.selectedType then
		arg_22_0.selectedType = IslandTaskType.SHOW_ALL
	end

	local var_22_0 = getProxy(IslandProxy):GetIsland()

	arg_22_0.curMapId = var_22_0:GetMapId()
	arg_22_0.taskAgency = var_22_0:GetTaskAgency()
	arg_22_0.trackTaskId = arg_22_0.taskAgency:GetTraceId()

	local var_22_1 = arg_22_0.taskAgency:GetShowTasks()

	arg_22_0.showTaskDict = {}

	for iter_22_0, iter_22_1 in pairs(var_22_1) do
		local var_22_2 = iter_22_1:GetShowType()

		if var_22_2 then
			if not arg_22_0.showTaskDict[var_22_2] then
				arg_22_0.showTaskDict[var_22_2] = {}
			end

			table.insert(arg_22_0.showTaskDict[var_22_2], iter_22_1)
		end
	end

	arg_22_0.showTypeList = {
		arg_22_0.selectedType
	}

	if arg_22_0.selectedType == IslandTaskType.SHOW_ALL then
		arg_22_0.showTypeList = underscore.keys(IslandTaskType.ShowTypeFields)
	end

	table.sort(arg_22_0.showTypeList)
	arg_22_0:FlushTypeUIList()
	arg_22_0:PingFirstTask()
end

function var_0_0.FlushTypeUIList(arg_23_0)
	arg_23_0.typeUIList:align(#arg_23_0.showTypeList)

	local var_23_0 = {}

	arg_23_0.typeUIList:eachActive(function(arg_24_0, arg_24_1)
		arg_24_1:GetComponent(typeof(CanvasGroup)).alpha = 0

		table.insert(var_23_0, function(arg_25_0)
			arg_24_1:GetComponent(typeof(Animation)):Play()

			arg_24_1:GetComponent(typeof(CanvasGroup)).alpha = 1

			arg_23_0:managedTween(LeanTween.delayedCall, function()
				arg_25_0()
			end, 0.06, nil)
		end)
	end)
	seriesAsync(var_23_0)
end

function var_0_0.PingFirstTask(arg_27_0)
	local var_27_0 = underscore.detect(arg_27_0.showTypeList, function(arg_28_0)
		return arg_27_0.showTaskDict[arg_28_0] and #arg_27_0.showTaskDict[arg_28_0] > 0
	end)

	if var_27_0 then
		triggerToggle(arg_27_0.typeUIList.container:Find(var_27_0 .. "/list"):GetChild(0), true)
	else
		arg_27_0.selectedTaskId = nil

		arg_27_0:FlushDetail()
	end
end

function var_0_0.FlushDetail(arg_29_0)
	arg_29_0.trackTaskId = arg_29_0.taskAgency:GetTraceId()

	setActive(arg_29_0.detailTF, arg_29_0.selectedTaskId)
	setActive(arg_29_0.emptyTF, not arg_29_0.selectedTaskId)

	if arg_29_0.selectedTaskId then
		arg_29_0.detailAnim:Play()

		arg_29_0.showVO = arg_29_0.taskAgency:GetTask(arg_29_0.selectedTaskId)

		local var_29_0 = arg_29_0.showVO:GetShowType()
		local var_29_1 = IslandTaskType.ShowTypeFields[var_29_0]

		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "title_bg_" .. var_29_1, arg_29_0.titleBg)
		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "title_icon_" .. var_29_1, arg_29_0.typeIcon)
		setText(arg_29_0.nameTF, arg_29_0.showVO:GetName())
		setActive(arg_29_0.timeTF, var_29_0 == IslandTaskType.SHOW_ACTIVITY)

		if var_29_0 == IslandTaskType.SHOW_ACTIVITY then
			setText(arg_29_0.timeTF:Find("Text"), arg_29_0.showVO:GetRemainTimeStr())
		end

		setText(arg_29_0.descTF, arg_29_0.showVO:GetDesc())

		arg_29_0.showTargets = arg_29_0.showVO:GetTargetList()

		local var_29_2 = not arg_29_0.showVO:IsSubmitImmediately() and arg_29_0.showVO:IsFinish()

		setActive(arg_29_0.finishedTargetTF, var_29_2)
		setActive(arg_29_0.targetContent, not var_29_2)

		if var_29_2 then
			setText(arg_29_0.finishedTargetTextTF, arg_29_0.showVO:GetFinishedDesc())
			arg_29_0:UpdateLocation(arg_29_0.finishedTargetLocTF, arg_29_0.showVO)
		else
			arg_29_0.targetUIList:align(#arg_29_0.showTargets)
		end

		arg_29_0.showAwards = arg_29_0.showVO:GetAwards()

		arg_29_0.awardUIList:align(#arg_29_0.showAwards)
		setActive(arg_29_0.traceBtn, arg_29_0.showVO.id ~= arg_29_0.trackTaskId)
		onButton(arg_29_0, arg_29_0.traceBtn, function()
			arg_29_0:emit(IslandMediator.ON_SET_TRACE_ID, arg_29_0.showVO.id)
		end, SFX_PANEL)
		setActive(arg_29_0.tracedBtn, arg_29_0.showVO.id == arg_29_0.trackTaskId)
		onButton(arg_29_0, arg_29_0.tracedBtn, function()
			arg_29_0:emit(IslandMediator.ON_SET_TRACE_ID, 0)
		end, SFX_PANEL)
	end
end

function var_0_0.OnShow(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = false

	if arg_32_1 and arg_32_0.toggleUIList.container:Find(arg_32_1) then
		triggerToggle(arg_32_0.toggleUIList.container:Find(arg_32_1), true)

		var_32_0 = true
	end

	if getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(arg_32_2 or 0) then
		if not var_32_0 then
			triggerToggle(arg_32_0.toggleUIList.container:GetChild(0), true)
		end

		local var_32_1 = IslandTaskType.Type2ShowType[pg.island_task[arg_32_2].type]

		triggerToggle(arg_32_0.typeUIList.container:Find(var_32_1 .. "/list/" .. arg_32_2), true)
	else
		arg_32_0:Flush()
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_32_0._tf)
end

function var_0_0.Hide(arg_33_0)
	if arg_33_0.playingHideAnim then
		return
	end

	arg_33_0.uiAnim:Play("Anim_Island3dTaskUI_out")

	arg_33_0.playingHideAnim = true
end

function var_0_0.OnHide(arg_34_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_34_0._tf)
end

function var_0_0.OnDisable(arg_35_0)
	arg_35_0:OnHide()
end

function var_0_0.OnDestroy(arg_36_0)
	arg_36_0.uiAnimEvent:SetEndEvent(nil)
end

return var_0_0
