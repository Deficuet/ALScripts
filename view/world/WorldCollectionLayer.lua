local var_0_0 = class("WorldCollectionLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "WorldCollectionUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.top = arg_2_0._tf:Find("top")
	arg_2_0.backBtn = arg_2_0.top:Find("back_btn")
	arg_2_0.topToggles = arg_2_0.top:Find("toggles")
	arg_2_0.rtMain = arg_2_0._tf:Find("main")
	arg_2_0.entranceContainer = arg_2_0.rtMain:Find("list_bg/map_list/content")
	arg_2_0.btnGetAll = arg_2_0.rtMain:Find("list_bg/btn_get_all")
	arg_2_0.scrollEntrance = GetComponent(arg_2_0.entranceContainer, "LScrollRect")

	function arg_2_0.scrollEntrance.onUpdateItem(arg_3_0, arg_3_1)
		arg_3_0 = arg_3_0 + 1

		local var_3_0 = tf(arg_3_1)
		local var_3_1 = arg_2_0.achEntranceList[arg_3_0]

		arg_2_0.entranceOjbecDic[arg_3_0] = var_3_0

		setText(var_3_0:Find("icon/deco_id"), var_3_1.config.serial_number)
		setText(var_3_0:Find("icon/name"), var_3_1:GetBaseMap():GetName())
		setActive(var_3_0:Find("icon/tip"), nowWorld():AnyUnachievedAchievement(var_3_1))
		onButton(arg_2_0, var_3_0, function()
			arg_2_0:UpdateAchievement(arg_3_0)
		end, SFX_PANEL)

		local var_3_2 = var_3_0:Find("icon")

		setAnchoredPosition(var_3_2, {
			y = (1 - arg_3_0 % 2 * 2) * math.abs(var_3_2.anchoredPosition.y)
		})
		setActive(var_3_2:Find("select"), arg_2_0.selectedIndex == arg_3_0)
		setText(var_3_2:Find("select/gomap/Text"), i18n("world_target_goto"))
		onButton(arg_2_0, var_3_2:Find("select/gomap"), function()
			arg_2_0:emit(WorldCollectionMediator.ON_MAP, var_3_1)
			arg_2_0:closeView()
		end, SFX_PANEL)
	end

	function arg_2_0.scrollEntrance.onReturnItem(arg_6_0, arg_6_1)
		if arg_2_0.exited then
			return
		end

		arg_2_0.entranceOjbecDic[arg_6_0 + 1] = nil

		removeOnButton(arg_6_1)
	end

	arg_2_0.scrollEntrance.onValueChanged:AddListener(function(arg_7_0)
		arg_2_0:UpdateJumpBtn()
	end)

	arg_2_0.entrancePanel = arg_2_0.rtMain:Find("map")
	arg_2_0.entranceTitle = arg_2_0.entrancePanel:Find("target_rect/title")
	arg_2_0.targetContainer = arg_2_0.entrancePanel:Find("target_rect/target_list/content")
	arg_2_0.targetItemList = UIItemList.New(arg_2_0.targetContainer, arg_2_0.targetContainer:Find("item"))

	arg_2_0.targetItemList:make(function(arg_8_0, arg_8_1, arg_8_2)
		arg_8_1 = arg_8_1 + 1

		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = arg_8_1 > #arg_2_0.achEntranceList[arg_2_0.selectedIndex].config.normal_target
			local var_8_1 = arg_8_2:Find("bg")

			setActive(var_8_1:Find("normal"), not var_8_0)
			setActive(var_8_1:Find("hidden"), var_8_0)

			local var_8_2 = arg_2_0.targetList[arg_8_1]
			local var_8_3 = var_8_2:IsAchieved()
			local var_8_4 = not var_8_0 or var_8_3 or arg_2_0.showHiddenDesc

			setText(var_8_1:Find("desc"), var_8_4 and var_8_2.config.target_desc or "???")
			setText(var_8_1:Find("progress"), var_8_4 and var_8_2:GetProgress() .. "/" .. var_8_2:GetMaxProgress() or "")
			setActive(var_8_1:Find("finish_mark/Image"), var_8_3)

			local var_8_5 = arg_8_2:Find("pop")
			local var_8_6 = var_8_2:GetTriggers()
			local var_8_7 = var_8_4 and #var_8_6 > 1

			if var_8_7 then
				local var_8_8 = var_8_5
				local var_8_9 = var_8_5:Find("Text")
				local var_8_10 = var_8_8.childCount

				local function var_8_11(arg_9_0, arg_9_1)
					local var_9_0 = var_8_6[arg_9_0]

					setText(arg_9_1, var_9_0:GetDesc())
					setTextColor(arg_9_1, var_9_0:IsAchieved() and Color.New(0.3686274509803922, 0.6078431372549019, 1) or Color.New(0.4745098039215686, 0.4745098039215686, 0.4745098039215686))
					setActive(arg_9_1, true)
				end

				for iter_8_0 = #var_8_6, var_8_10 - 1 do
					setActive(var_8_8:GetChild(iter_8_0), false)
				end

				for iter_8_1 = var_8_10, #var_8_6 - 1 do
					cloneTplTo(var_8_9, var_8_8)
				end

				for iter_8_2 = 0, #var_8_6 - 1 do
					var_8_11(iter_8_2 + 1, var_8_8:GetChild(iter_8_2))
				end
			end

			triggerToggle(arg_8_2, false)
			setToggleEnabled(arg_8_2, var_8_7)
			setActive(var_8_1:Find("arrow"), var_8_7)
		end
	end)

	arg_2_0.achAwardRect = arg_2_0.entrancePanel:Find("award_rect")
	arg_2_0.achAchieveBtn = arg_2_0.achAwardRect:Find("btn_achieve")
	arg_2_0.overviewBtn = arg_2_0.entrancePanel:Find("btn_overview")
	arg_2_0.subviewAchAward = WorldAchAwardSubview.New(arg_2_0._tf, arg_2_0.event)

	arg_2_0:bind(WorldAchAwardSubview.ShowDrop, function(arg_10_0, arg_10_1)
		arg_2_0:emit(var_0_0.ON_DROP, arg_10_1)
	end)
end

function var_0_0.onBackPressed(arg_11_0)
	if arg_11_0.subviewAchAward:isShowing() then
		arg_11_0.subviewAchAward:ActionInvoke("Hide")
	else
		var_0_0.super.onBackPressed(arg_11_0)
	end
end

function var_0_0.didEnter(arg_12_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_12_0._tf)
	onButton(arg_12_0, arg_12_0.backBtn, function()
		arg_12_0:closeView()
	end, SFX_CANCEL)
	onToggle(arg_12_0, arg_12_0.topToggles:Find("all"), function(arg_14_0)
		if arg_14_0 then
			arg_12_0:UpdateEntranceFilter(false)
		end
	end, SFX_PANEL)
	setText(arg_12_0.topToggles:Find("all/Text"), i18n("world_target_filter_tip1"))
	setText(arg_12_0.topToggles:Find("all/Image/Text"), i18n("world_target_filter_tip1"))
	onToggle(arg_12_0, arg_12_0.topToggles:Find("unfinish"), function(arg_15_0)
		if arg_15_0 then
			arg_12_0:UpdateEntranceFilter(true)
		end
	end, SFX_PANEL)
	setText(arg_12_0.topToggles:Find("unfinish/Text"), i18n("world_target_filter_tip2"))
	setText(arg_12_0.topToggles:Find("unfinish/Image/Text"), i18n("world_target_filter_tip2"))
	onButton(arg_12_0, arg_12_0.rtMain:Find("list_bg/jump_icon_left"), function()
		arg_12_0:ScrollAndSelectEntrance(arg_12_0:GetAwardIndex(false))
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.rtMain:Find("list_bg/jump_icon_right"), function()
		arg_12_0:ScrollAndSelectEntrance(arg_12_0:GetAwardIndex(true))
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.btnGetAll, function()
		local var_18_0, var_18_1 = nowWorld():GetFinishAchievements(arg_12_0.achEntranceList)

		if #var_18_0 > 0 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_target_get_all"),
				onYes = function()
					arg_12_0:emit(WorldCollectionMediator.ON_ACHIEVE_STAR, var_18_0)
				end
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("without any award")
		end
	end, SFX_CONFIRM)
	onButton(arg_12_0, arg_12_0.achAchieveBtn, function()
		local var_20_0, var_20_1 = nowWorld():AnyUnachievedAchievement(arg_12_0.entrance)

		if var_20_0 then
			arg_12_0:emit(WorldCollectionMediator.ON_ACHIEVE_STAR, {
				{
					id = arg_12_0.entrance.id,
					star_list = {
						var_20_1.star
					}
				}
			})
		end
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.entrancePanel:Find("page_left"), function()
		arg_12_0:ScrollAndSelectEntrance(arg_12_0.selectedIndex - 1)
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.entrancePanel:Find("page_right"), function()
		arg_12_0:ScrollAndSelectEntrance(arg_12_0.selectedIndex + 1)
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.overviewBtn, function()
		arg_12_0:emit(WorldCollectionMediator.ON_ACHIEVE_OVERVIEW)
	end, SFX_PANEL)
	triggerToggle(arg_12_0.topToggles:Find("all"), true)
end

function var_0_0.willExit(arg_24_0)
	arg_24_0.subviewAchAward:Destroy()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_24_0._tf)
end

function var_0_0.SetAchievementList(arg_25_0, arg_25_1)
	arg_25_0.baseEntranceList = arg_25_1
end

function var_0_0.BuildEntranceScrollPos(arg_26_0)
	arg_26_0.entrancePos = {}
	arg_26_0.entranceIndexDic = {}

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.achEntranceList) do
		table.insert(arg_26_0.entrancePos, arg_26_0.scrollEntrance:HeadIndexToValue(iter_26_0 - 1))

		arg_26_0.entranceIndexDic[iter_26_1.id] = iter_26_0

		if nowWorld():AnyUnachievedAchievement(iter_26_1) then
			table.insert(arg_26_0.achAwardIndexList, iter_26_0)
		end
	end
end

function var_0_0.UpdateEntranceFilter(arg_27_0, arg_27_1)
	if arg_27_1 then
		arg_27_0.achEntranceList = underscore.filter(arg_27_0.baseEntranceList, function(arg_28_0)
			local var_28_0, var_28_1, var_28_2 = nowWorld():CountAchievements(arg_28_0)

			return var_28_2 > var_28_0 + var_28_1
		end)
	else
		arg_27_0.achEntranceList = underscore.to_array(arg_27_0.baseEntranceList)
	end

	arg_27_0:UpdateGetAllAwardBtn()

	arg_27_0.achAwardIndexList = {}
	arg_27_0.entranceOjbecDic = {}

	arg_27_0.scrollEntrance:SetTotalCount(#arg_27_0.achEntranceList)
	arg_27_0:BuildEntranceScrollPos()

	arg_27_0.contextData.entranceId = defaultValue(arg_27_0.contextData.entranceId, 0)

	local var_27_0 = defaultValue(arg_27_0.entranceIndexDic[arg_27_0.contextData.entranceId], 1)

	if arg_27_0.achEntranceList[var_27_0] then
		arg_27_0:ScrollAndSelectEntrance(var_27_0)
	else
		setActive(arg_27_0.entrancePanel:Find("page_left"), false)
		setActive(arg_27_0.entrancePanel:Find("page_right"), false)
	end
end

function var_0_0.UpdateGetAllAwardBtn(arg_29_0)
	local var_29_0, var_29_1 = nowWorld():GetFinishAchievements(arg_29_0.achEntranceList)
	local var_29_2 = pg.gameset.world_target_obtain.key_value

	setActive(arg_29_0.btnGetAll, var_29_2 <= #var_29_0)
end

function var_0_0.FlushEntranceItem(arg_30_0, arg_30_1)
	for iter_30_0, iter_30_1 in ipairs(arg_30_1) do
		local var_30_0 = arg_30_0.entranceIndexDic[iter_30_1.id]

		if not nowWorld():AnyUnachievedAchievement(arg_30_0.achEntranceList[var_30_0]) then
			if arg_30_0.entranceOjbecDic[var_30_0] then
				setActive(arg_30_0.entranceOjbecDic[var_30_0]:Find("icon/tip"), false)
			end

			table.removebyvalue(arg_30_0.achAwardIndexList, var_30_0)
		end
	end

	arg_30_0:UpdateGetAllAwardBtn()
end

function var_0_0.UpdateAchievement(arg_31_0, arg_31_1, arg_31_2)
	if arg_31_2 or arg_31_0.selectedIndex ~= arg_31_1 then
		arg_31_1, arg_31_0.selectedIndex = arg_31_0.selectedIndex, arg_31_1

		for iter_31_0, iter_31_1 in ipairs({
			arg_31_1,
			arg_31_0.selectedIndex
		}) do
			local var_31_0 = arg_31_0.entranceOjbecDic[iter_31_1]

			if var_31_0 then
				setActive(var_31_0:Find("icon/select"), arg_31_0.selectedIndex == iter_31_1)
			end
		end

		arg_31_0.entrance = arg_31_0.achEntranceList[arg_31_0.selectedIndex]

		arg_31_0:FlushAchievement()
	end
end

function var_0_0.GetAwardIndex(arg_32_0, arg_32_1)
	if #arg_32_0.achEntranceList == 0 then
		return nil
	end

	local var_32_0 = arg_32_0.entrancePos[#arg_32_0.achEntranceList] - 1

	if arg_32_1 then
		local var_32_1 = arg_32_0.scrollEntrance.value + var_32_0

		for iter_32_0 = 1, #arg_32_0.achAwardIndexList do
			if var_32_1 < arg_32_0.entrancePos[arg_32_0.achAwardIndexList[iter_32_0]] then
				return arg_32_0.achAwardIndexList[iter_32_0]
			end
		end

		return nil
	else
		local var_32_2 = arg_32_0.scrollEntrance.value

		for iter_32_1 = #arg_32_0.achAwardIndexList, 1, -1 do
			if var_32_2 > arg_32_0.entrancePos[arg_32_0.achAwardIndexList[iter_32_1]] then
				return arg_32_0.achAwardIndexList[iter_32_1]
			end
		end

		return nil
	end
end

function var_0_0.ScrollAndSelectEntrance(arg_33_0, arg_33_1)
	arg_33_0:UpdateAchievement(arg_33_1, true)

	local var_33_0 = arg_33_0.entrancePos[#arg_33_0.achEntranceList] - 1

	arg_33_0.scrollEntrance:ScrollTo(math.clamp(arg_33_0.entrancePos[arg_33_1] - var_33_0 / 2, 0, 1))
end

function var_0_0.UpdateJumpBtn(arg_34_0)
	setActive(arg_34_0.rtMain:Find("list_bg/jump_icon_left"), arg_34_0:GetAwardIndex(false))
	setActive(arg_34_0.rtMain:Find("list_bg/jump_icon_right"), arg_34_0:GetAwardIndex(true))
end

function var_0_0.FlushAchievement(arg_35_0)
	arg_35_0:UpdateJumpBtn()

	local var_35_0 = nowWorld()

	arg_35_0.showHiddenDesc = var_35_0:IsNormalAchievementAchieved(arg_35_0.entrance)
	arg_35_0.targetList = var_35_0:GetAchievements(arg_35_0.entrance)

	arg_35_0.targetItemList:align(#arg_35_0.targetList)

	local var_35_1 = arg_35_0.entrance:GetBaseMap()

	GetImageSpriteFromAtlasAsync("world/targeticon/" .. var_35_1.config.entrance_mapicon, "", arg_35_0.entranceTitle)
	setText(arg_35_0.entranceTitle:Find("name"), var_35_1:GetName(arg_35_0.entrance))
	setText(arg_35_0.entranceTitle:Find("deco_id"), arg_35_0.entrance.config.serial_number)

	local var_35_2, var_35_3, var_35_4 = var_35_0:CountAchievements(arg_35_0.entrance)

	setText(arg_35_0.entranceTitle:Find("progress_text"), var_35_2 + var_35_3 .. "/" .. var_35_4)

	local var_35_5, var_35_6 = var_35_0:AnyUnachievedAchievement(arg_35_0.entrance)
	local var_35_7 = arg_35_0.achAwardRect:Find("award")

	if var_35_6 then
		setActive(arg_35_0.achAwardRect:Find("get_mask"), var_35_5)
		setActive(arg_35_0.achAwardRect:Find("got_mask"), false)
	else
		local var_35_8 = arg_35_0.entrance:GetAchievementAwards()

		var_35_6 = var_35_8[#var_35_8]

		setActive(arg_35_0.achAwardRect:Find("get_mask"), false)
		setActive(arg_35_0.achAwardRect:Find("got_mask"), true)
	end

	updateDrop(var_35_7, var_35_6.drop)
	onButton(arg_35_0, var_35_7, function()
		arg_35_0:showAchAwardPanel(arg_35_0.entrance)
	end, SFX_PANEL)
	setText(arg_35_0.achAwardRect:Find("star_count/Text"), var_35_2 + var_35_3 .. "/" .. var_35_6.star)
	setActive(arg_35_0.achAchieveBtn, var_35_5)
	setActive(arg_35_0.entrancePanel:Find("page_left"), arg_35_0.selectedIndex > 1)
	setActive(arg_35_0.entrancePanel:Find("page_right"), arg_35_0.selectedIndex < #arg_35_0.achEntranceList)
end

function var_0_0.flushAchieveUpdate(arg_37_0, arg_37_1)
	arg_37_0:FlushEntranceItem(arg_37_1)
	arg_37_0:FlushAchievement()
end

function var_0_0.showAchAwardPanel(arg_38_0, arg_38_1)
	arg_38_0.subviewAchAward:Load()
	arg_38_0.subviewAchAward:ActionInvoke("Setup", arg_38_1)
	arg_38_0.subviewAchAward:ActionInvoke("Show")
end

return var_0_0
