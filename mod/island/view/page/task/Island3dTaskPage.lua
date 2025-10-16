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
	arg_2_0.descTF = arg_2_0.detailTF:Find("view/Viewport/content/desc")
	arg_2_0.targetTF = arg_2_0.detailTF:Find("view/Viewport/content/targets")

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
	setText(arg_2_0._tf:Find("top/title/Text"), i18n("island_task_title"))
	setText(arg_2_0._tf:Find("top/title/Text/en"), i18n("island_task_title_en"))
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
			onButton(arg_3_0, arg_8_2, function()
				arg_3_0:ShowMsgBox({
					title = i18n("island_word_desc"),
					type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
					dropData = var_8_0
				})
			end)
		end
	end)
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddListener(GAME.ISLAND_SET_TRACE_TASK_DONE, arg_10_0.FlushDetail)
	arg_10_0:AddListener(GAME.ISLAND_ACCEPT_TASK_DONE, arg_10_0.Flush)
	arg_10_0:AddListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_10_0.Flush)
	arg_10_0:AddListener(GAME.ISLAND_UPDATE_TASK_DONE, arg_10_0.Flush)
	arg_10_0:AddListener(GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE, arg_10_0.Flush)
	arg_10_0:AddListener(IslandTaskAgency.TASK_ADDED, arg_10_0.Flush)
	arg_10_0:AddListener(IslandTaskAgency.TASK_UPDATED, arg_10_0.Flush)
	arg_10_0:AddListener(IslandTaskAgency.TASK_REMOVED, arg_10_0.Flush)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0:RemoveListener(GAME.ISLAND_SET_TRACE_TASK_DONE, arg_11_0.FlushDetail)
	arg_11_0:RemoveListener(GAME.ISLAND_ACCEPT_TASK_DONE, arg_11_0.Flush)
	arg_11_0:RemoveListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_11_0.Flush)
	arg_11_0:RemoveListener(GAME.ISLAND_UPDATE_TASK_DONE, arg_11_0.Flush)
	arg_11_0:RemoveListener(GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE, arg_11_0.Flush)
	arg_11_0:RemoveListener(IslandTaskAgency.TASK_ADDED, arg_11_0.Flush)
	arg_11_0:RemoveListener(IslandTaskAgency.TASK_UPDATED, arg_11_0.Flush)
	arg_11_0:RemoveListener(IslandTaskAgency.TASK_REMOVED, arg_11_0.Flush)
end

function var_0_0.InitToggleItem(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.toggleList[arg_12_1 + 1]

	arg_12_2.name = var_12_0

	local var_12_1 = IslandTaskType.ShowTypeNames[var_12_0]

	setText(arg_12_2:Find("unsel"), var_12_1)
	setText(arg_12_2:Find("sel/content/Text"), var_12_1)

	if var_12_0 ~= IslandTaskType.SHOW_ALL then
		LoadImageSpriteAtlasAsync("island/islandtasktype", IslandTaskType.ShowTypeFields[var_12_0], arg_12_2:Find("sel/content/Image"), false)
	end

	onToggle(arg_12_0, arg_12_2, function(arg_13_0)
		if arg_13_0 and (not arg_12_0.selectedType or arg_12_0.selectedType ~= var_12_0) then
			arg_12_0.selectedType = var_12_0

			arg_12_0:Flush()
			arg_12_2:GetComponent(typeof(Animation)):Play()
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateTypeItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.showTypeList[arg_14_1 + 1]

	arg_14_2.name = var_14_0

	local var_14_1 = IslandTaskType.ShowTypeNames[var_14_0]

	setText(arg_14_2:Find("title/Text"), var_14_1)
	setImageColor(arg_14_2:Find("title"), Color.NewHex(IslandTaskType.ShowTypeColors[var_14_0]))
	LoadImageSpriteAtlasAsync("island/islandtasktype", IslandTaskType.ShowTypeFields[var_14_0], arg_14_2:Find("title/Image"))
	setActive(arg_14_2:Find("line"), arg_14_1 + 1 ~= #arg_14_0.showTypeList)

	local var_14_2 = UIItemList.New(arg_14_2:Find("list"), arg_14_2:Find("list"):GetChild(0))

	var_14_2:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = arg_14_0.showTaskDict[var_14_0][arg_15_1 + 1]

			arg_14_0:UpdateTaskItem(arg_15_2, var_15_0)
		end
	end)

	local var_14_3 = arg_14_0.showTaskDict[var_14_0] and arg_14_0.showTaskDict[var_14_0] or {}

	var_14_2:align(#var_14_3)
end

function var_0_0.UpdateTaskItem(arg_16_0, arg_16_1, arg_16_2)
	arg_16_1.name = arg_16_2.id

	local var_16_0 = arg_16_2:GetShowType()

	setImageColor(arg_16_1:Find("main/line"), Color.NewHex(IslandTaskType.ShowTypeColors[var_16_0]))

	local var_16_1 = arg_16_2:IsSeries()

	setText(arg_16_1:Find("main/name"), var_16_1 and arg_16_2:GetSeriesTitle() or arg_16_2:GetName())
	setActive(arg_16_1:Find("sub"), var_16_1)
	setActive(arg_16_1:Find("main/location"), not var_16_1)

	if var_16_1 then
		local var_16_2 = IslandTaskType.ShowTypeFields[var_16_0]

		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "color_" .. var_16_2, arg_16_1:Find("sub/bg"))
		setText(arg_16_1:Find("sub/name"), arg_16_2:GetName())
		arg_16_0:UpdateLocation(arg_16_1:Find("sub/location"), arg_16_2)
	else
		arg_16_0:UpdateLocation(arg_16_1:Find("main/location"), arg_16_2)
	end

	onToggle(arg_16_0, arg_16_1, function(arg_17_0)
		setActive(arg_16_1:Find("main/selected"), arg_17_0 and not var_16_1)
		setActive(arg_16_1:Find("sub/selected"), arg_17_0 and var_16_1)

		if arg_17_0 and (not arg_16_0.selectedTaskId or arg_16_0.selectedTaskId ~= arg_16_2.id or arg_16_0.isOpen) then
			arg_16_0.selectedTaskId = arg_16_2.id

			arg_16_0:FlushDetail()

			arg_16_0.isOpen = false
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateLocation(arg_18_0, arg_18_1, arg_18_2)
	setActive(arg_18_1, arg_18_2.id == arg_18_0.trackTaskId)

	if arg_18_2.id == arg_18_0.trackTaskId then
		local var_18_0 = arg_18_2:GetTraceParam()
		local var_18_1 = tonumber(var_18_0)

		setActive(arg_18_1, var_18_1)

		if var_18_1 then
			local var_18_2 = pg.island_world_objects[var_18_1].mapId
			local var_18_3 = var_18_2 == arg_18_0.curMapId and arg_18_0:CalcDistance(var_18_1) .. "m" or pg.island_map[var_18_2].name

			setText(arg_18_1:Find("Text"), var_18_3)
		end
	end
end

function var_0_0.CalcDistance(arg_19_0, arg_19_1)
	local var_19_0 = _IslandCore:GetView():GetPlayerPosition()
	local var_19_1 = _IslandCore:GetView():GetUnitPosition(arg_19_1) or var_19_0
	local var_19_2 = Vector3.Distance(var_19_0, var_19_1)

	return math.ceil(var_19_2)
end

function var_0_0.UpdateTargetItem(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.showTargets[arg_20_1 + 1]

	setText(arg_20_2:Find("content/Text"), var_20_0:getConfig("name"))

	local var_20_1 = var_20_0:GetProgress()
	local var_20_2 = var_20_0:GetTargetNum()

	setText(arg_20_2:Find("content/num"), string.format("(%d/%d)", var_20_1, var_20_2))

	local var_20_3 = var_20_0:IsFinish()

	setActive(arg_20_2:Find("status/unfinish"), not var_20_3)
	setActive(arg_20_2:Find("status/finished"), var_20_3)

	local var_20_4, var_20_5 = arg_20_0.showVO:GetTraceParam()
	local var_20_6 = arg_20_2:Find("content/location")
	local var_20_7 = var_20_5 and var_20_5 == arg_20_1 + 1

	setActive(var_20_6, var_20_7)

	if var_20_7 then
		arg_20_0:UpdateLocation(var_20_6, arg_20_0.showVO)
	end
end

function var_0_0.Flush(arg_21_0)
	if not arg_21_0.selectedType then
		arg_21_0.selectedType = IslandTaskType.SHOW_ALL
	end

	local var_21_0 = getProxy(IslandProxy):GetIsland()

	arg_21_0.curMapId = var_21_0:GetMapId()
	arg_21_0.taskAgency = var_21_0:GetTaskAgency()
	arg_21_0.trackTaskId = arg_21_0.taskAgency:GetTraceId()

	local var_21_1 = arg_21_0.taskAgency:GetShowTasks()

	arg_21_0.showTaskDict = {}

	for iter_21_0, iter_21_1 in pairs(var_21_1) do
		local var_21_2 = iter_21_1:GetShowType()

		if var_21_2 then
			if not arg_21_0.showTaskDict[var_21_2] then
				arg_21_0.showTaskDict[var_21_2] = {}
			end

			table.insert(arg_21_0.showTaskDict[var_21_2], iter_21_1)
		end
	end

	arg_21_0.showTypeList = {
		arg_21_0.selectedType
	}

	if arg_21_0.selectedType == IslandTaskType.SHOW_ALL then
		arg_21_0.showTypeList = arg_21_0:GetShowTypeList()
	end

	table.sort(arg_21_0.showTypeList)
	arg_21_0.typeUIList:align(#arg_21_0.showTypeList)
	arg_21_0:PingFirstTask()
end

function var_0_0.FlushTypeUIList(arg_22_0)
	arg_22_0.typeUIList:align(#arg_22_0.showTypeList)

	local var_22_0 = {}

	arg_22_0.typeUIList:eachActive(function(arg_23_0, arg_23_1)
		arg_23_1:GetComponent(typeof(CanvasGroup)).alpha = 0

		table.insert(var_22_0, function(arg_24_0)
			arg_23_1:GetComponent(typeof(Animation)):Play()

			arg_23_1:GetComponent(typeof(CanvasGroup)).alpha = 1

			arg_22_0:managedTween(LeanTween.delayedCall, function()
				arg_24_0()
			end, 0.06, nil)
		end)
	end)
	seriesAsync(var_22_0)
end

function var_0_0.PingFirstTask(arg_26_0)
	local var_26_0 = underscore.detect(arg_26_0.showTypeList, function(arg_27_0)
		return arg_26_0.showTaskDict[arg_27_0] and #arg_26_0.showTaskDict[arg_27_0] > 0
	end)

	if var_26_0 then
		triggerToggle(arg_26_0.typeUIList.container:Find(var_26_0 .. "/list"):GetChild(0), true)
	else
		arg_26_0.selectedTaskId = nil

		arg_26_0:FlushDetail()
	end
end

function var_0_0.FlushDetail(arg_28_0)
	arg_28_0.trackTaskId = arg_28_0.taskAgency:GetTraceId()

	setActive(arg_28_0.detailTF, arg_28_0.selectedTaskId)
	setActive(arg_28_0.emptyTF, not arg_28_0.selectedTaskId)

	arg_28_0.showVO = arg_28_0.taskAgency:GetTask(arg_28_0.selectedTaskId)

	if arg_28_0.selectedTaskId and arg_28_0.showVO then
		arg_28_0.detailAnim:Play()

		local var_28_0 = arg_28_0.showVO:GetShowType()
		local var_28_1 = IslandTaskType.ShowTypeFields[var_28_0]

		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "title_bg_" .. var_28_1, arg_28_0.titleBg)
		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "title_icon_" .. var_28_1, arg_28_0.typeIcon)
		setText(arg_28_0.nameTF, arg_28_0.showVO:GetName())
		setActive(arg_28_0.timeTF, var_28_0 == IslandTaskType.SHOW_ACTIVITY)

		if var_28_0 == IslandTaskType.SHOW_ACTIVITY then
			setText(arg_28_0.timeTF:Find("Text"), arg_28_0.showVO:GetRemainTimeStr())
		end

		setText(arg_28_0.descTF, arg_28_0.showVO:GetDesc())

		arg_28_0.showTargets = arg_28_0.showVO:GetTargetList()

		local var_28_2 = not arg_28_0.showVO:IsSubmitImmediately() and arg_28_0.showVO:IsFinish()

		arg_28_0.targetUIList:align(#arg_28_0.showTargets)
		setActive(arg_28_0.finishedTargetTF, var_28_2)

		if var_28_2 then
			setText(arg_28_0.finishedTargetTextTF, arg_28_0.showVO:GetFinishedDesc())
			arg_28_0:UpdateLocation(arg_28_0.finishedTargetLocTF, arg_28_0.showVO)
		end

		arg_28_0.showAwards = arg_28_0.showVO:GetAwards()

		arg_28_0.awardUIList:align(#arg_28_0.showAwards)
		setActive(arg_28_0.traceBtn, arg_28_0.showVO.id ~= arg_28_0.trackTaskId)
		onButton(arg_28_0, arg_28_0.traceBtn, function()
			arg_28_0:emit(IslandMediator.ON_SET_TRACE_ID, arg_28_0.showVO.id)
		end, SFX_PANEL)
		setActive(arg_28_0.tracedBtn, arg_28_0.showVO.id == arg_28_0.trackTaskId)
		onButton(arg_28_0, arg_28_0.tracedBtn, function()
			arg_28_0:emit(IslandMediator.ON_SET_TRACE_ID, 0)
		end, SFX_PANEL)
	end
end

function var_0_0.OnShow(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.isOpen = true
	arg_31_0.toggleList = arg_31_0:GetShowTypeList()

	table.insert(arg_31_0.toggleList, 1, IslandTaskType.SHOW_ALL)
	arg_31_0.toggleUIList:align(#arg_31_0.toggleList)
	arg_31_0:Flush()

	local var_31_0 = false

	if arg_31_1 and arg_31_0.toggleUIList.container:Find(arg_31_1) then
		triggerToggle(arg_31_0.toggleUIList.container:Find(arg_31_1), true)

		var_31_0 = true
	end

	if getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(arg_31_2 or 0) then
		if not var_31_0 then
			triggerToggle(arg_31_0.toggleUIList.container:GetChild(0), true)
		end

		local var_31_1 = IslandTaskType.Type2ShowType[pg.island_task[arg_31_2].type]

		triggerToggle(arg_31_0.typeUIList.container:Find(var_31_1 .. "/list/" .. arg_31_2), true)
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_31_0._tf)
end

function var_0_0.GetShowTypeList(arg_32_0)
	local var_32_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()
	local var_32_1 = underscore.select(underscore.keys(IslandTaskType.ShowTypeUnlockId), function(arg_33_0)
		return var_32_0:HasAbility(IslandTaskType.ShowTypeUnlockId[arg_33_0])
	end)

	table.sort(var_32_1)

	return var_32_1
end

function var_0_0.OnHide(arg_34_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_34_0._tf)
end

function var_0_0.OnDisable(arg_35_0)
	arg_35_0:OnHide()
end

function var_0_0.OnDestroy(arg_36_0)
	arg_36_0:OnHide()
end

return var_0_0
