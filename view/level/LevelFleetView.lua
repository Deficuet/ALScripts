local var_0_0 = class("LevelFleetView", import("..base.BaseSubView"))
local var_0_1 = {
	vanguard = 1,
	submarine = 3,
	main = 2
}

var_0_0.TabIndex = {
	Duty = 3,
	Commander = 2,
	Formation = 1,
	Adjustment = 4
}

local var_0_2 = {
	SELECT = 1,
	EDIT = 2
}
local var_0_3 = {
	NORMAL = 1,
	ADDITION_SUPPORT = 2
}

function var_0_0.getUIName(arg_1_0)
	return "LevelFleetSelectView"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"weaponframes",
		"energy",
		"shiptype",
		"ui/iconcolorful"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.downloadLevelFleetViewResList(arg_3_0, arg_3_1)
	SplitPackConst.DownloadByLuaArr(ResList.LevelFleetView.GetResource(arg_3_0), function()
		if arg_3_0._state == var_0_0.STATES.DESTROY then
			return
		end

		arg_3_1()
	end)
end

function var_0_0.OnInit(arg_5_0)
	arg_5_0:InitUI()
	arg_5_0:bind(LevelUIConst.CONTINUOUS_OPERATION, function(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_1.battleTimes

		getProxy(ChapterProxy):InitContinuousTime(SYSTEM_SCENARIO, var_6_0)
		LoadContextCommand.RemoveLayerByMediator(LevelContinuousOperationWindowMediator)

		local var_6_1 = "chapter_autofight_flag_" .. arg_5_0.chapter.id

		PlayerPrefs.SetInt(var_6_1, 1)
		triggerButton(arg_5_0.btnGo)
	end)
	arg_5_0:bind(LevelMediator2.ON_SPITEM_CHANGED, function(arg_7_0, arg_7_1)
		setActive(arg_5_0.spCheckMark, not arg_7_1)
		triggerButton(arg_5_0.btnSp)
	end)
end

function var_0_0.OnDestroy(arg_8_0)
	if arg_8_0:isShowing() then
		arg_8_0:Hide()
	end
end

function var_0_0.Show(arg_9_0)
	local var_9_0 = noEmptyStr(arg_9_0.chapter:getConfig("special_operation_list"))
	local var_9_1 = arg_9_0.chapter:GetDailyBonusQuota()

	arg_9_0:initSPOPView()

	if var_9_0 and #var_9_0 > 0 and not var_9_1 then
		setActive(arg_9_0.btnSp, true)
	else
		setActive(arg_9_0.btnSp, false)
	end

	setActive(arg_9_0._tf, true)

	local var_9_2 = {
		arg_9_0.formationToggle,
		arg_9_0.commanderToggle,
		arg_9_0.dutyToggle,
		arg_9_0.adjustmentToggle
	}
	local var_9_3 = var_9_2[arg_9_0.contextData.tabIndex or var_0_0.TabIndex.Formation]

	if not isActive(var_9_3) then
		var_9_3 = var_9_2[var_0_0.TabIndex.Formation]
	end

	for iter_9_0, iter_9_1 in ipairs(var_9_2) do
		if isActive(iter_9_1) then
			triggerToggle(iter_9_1, iter_9_1 == var_9_3)
		end
	end

	arg_9_0:BlurPanel(arg_9_0._tf)
	arg_9_0:TryPlaySupportGuide()
	arg_9_0:CheckGuideElement()
end

function var_0_0.CheckGuideElement(arg_10_0)
	if not IsUnityEditor then
		return
	end

	local var_10_0 = {
		"panel/Fixed/start_button",
		"panel/ShipList/support/1/main"
	}

	_.each(var_10_0, function(arg_11_0)
		local var_11_0 = arg_10_0._tf:Find(arg_11_0)

		assert(var_11_0, "Missing Guide Need GameObject Path: " .. arg_11_0)
	end)
end

function var_0_0.TryPlaySupportGuide(arg_12_0)
	if arg_12_0:getLimitNums(FleetType.Support) == 0 then
		return
	end

	if not pg.NewStoryMgr.GetInstance():IsPlayed("NG0041") then
		pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0041")
	end
end

function var_0_0.Hide(arg_13_0)
	setActive(arg_13_0.dropDown, false)
	setActive(arg_13_0.btnSp, false)
	setActive(arg_13_0._tf, false)

	arg_13_0.spItemID = nil

	arg_13_0:UnOverlayPanel(arg_13_0._tf, arg_13_0._parentTf)
end

function var_0_0.setOpenCommanderTag(arg_14_0, arg_14_1)
	arg_14_0.openedCommanerSystem = arg_14_1
end

function var_0_0.SetDutyTabEnabled(arg_15_0, arg_15_1)
	arg_15_0.dutyTabEnabled = arg_15_1
end

function var_0_0.onConfirm(arg_16_0)
	local var_16_0 = arg_16_0.chapter
	local var_16_1 = arg_16_0:getSelectIds()
	local var_16_2 = var_16_0:getNpcShipByType(2)

	if #var_16_2 > 0 then
		local var_16_3 = {
			[TeamType.Vanguard] = #arg_16_0:getFleetById(var_16_1[1]):getTeamByName(TeamType.Vanguard),
			[TeamType.Main] = #arg_16_0:getFleetById(var_16_1[1]):getTeamByName(TeamType.Main)
		}
		local var_16_4 = {
			[TeamType.Vanguard] = 0,
			[TeamType.Main] = 0
		}
		local var_16_5

		for iter_16_0, iter_16_1 in ipairs(var_16_2) do
			var_16_5 = iter_16_1

			local var_16_6 = iter_16_1:getTeamType()

			var_16_4[var_16_6] = var_16_4[var_16_6] + 1

			if var_16_3[var_16_6] + var_16_4[var_16_6] > 3 then
				break
			end
		end

		for iter_16_2, iter_16_3 in pairs(var_16_3) do
			if iter_16_3 + var_16_4[iter_16_2] > 3 then
				arg_16_0:emit(LevelUIConst.HANDLE_SHOW_MSG_BOX, {
					modal = true,
					hideNo = true,
					content = i18n("chapter_tip_with_npc", var_16_5.name)
				})

				return
			end
		end
	end

	local var_16_7 = "chapter_autofight_flag_" .. var_16_0.id
	local var_16_8
	local var_16_9

	seriesAsync({
		function(arg_17_0)
			local var_17_0 = PlayerPrefs.GetInt("autoFight_firstUse_sp", 0) == 1

			if not (PlayerPrefs.GetInt(var_16_7, 1) == 1) or var_17_0 or not arg_16_0:getSPItem() then
				return arg_17_0()
			end

			PlayerPrefs.SetInt("autoFight_firstUse_sp", 1)
			PlayerPrefs.Save()

			local function var_17_1()
				arg_16_0:clearSPBuff()
			end

			arg_16_0:emit(LevelUIConst.HANDLE_SHOW_MSG_BOX, {
				hideNo = true,
				content = i18n("autofight_special_operation_tip"),
				onYes = var_17_1,
				onNo = var_17_1
			})
		end,
		function(arg_19_0)
			var_16_9 = var_16_0:GetActiveSPItemID()
			var_16_8 = var_16_0:isLoop() and arg_16_0:GetOrderedDuties() or nil

			arg_16_0:onCancel()
			arg_19_0()
		end,
		function(arg_20_0)
			getProxy(ChapterProxy):SetLastFleetIndex(var_16_1)

			local var_20_0 = PlayerPrefs.GetInt(var_16_7, 1) == 1
			local var_20_1 = LevelMediator2.ON_TRACKING
			local var_20_2 = packEx(var_16_0.id, var_16_0.loopFlag, var_16_9, var_16_8, var_20_0)

			if pg.m02:retrieveMediator(LevelMediator2.__cname) then
				pg.m02:sendNotification(var_20_1, var_20_2)

				return
			end

			local var_20_3 = getProxy(ContextProxy):getContextByMediator(LevelMediator2)

			if var_20_3 then
				var_20_3:extendData({
					ToTrackingData = {
						var_20_1,
						var_20_2
					}
				})
			end
		end
	})
end

function var_0_0.onCancel(arg_21_0)
	arg_21_0:clear()
	arg_21_0:emit(LevelUIConst.HIDE_FLEET_SELECT)
end

function var_0_0.InitUI(arg_22_0)
	arg_22_0.tfShipTpl = arg_22_0._tf:Find("panel/Fixed/shiptpl")
	arg_22_0.tfEmptyTpl = arg_22_0._tf:Find("panel/Fixed/emptytpl")
	arg_22_0.tfFleets = {
		[FleetType.Normal] = {
			arg_22_0._tf:Find("panel/ShipList/fleet/1"),
			arg_22_0._tf:Find("panel/ShipList/fleet/2")
		},
		[FleetType.Submarine] = {
			arg_22_0._tf:Find("panel/ShipList/sub/1")
		},
		[FleetType.Support] = {
			arg_22_0._tf:Find("panel/ShipList/support/1")
		}
	}

	local var_22_0 = arg_22_0._tf:Find("panel/Fixed/RightTabs")
	local var_22_1 = PLATFORM_CODE == PLATFORM_US and arg_22_0._tf:Find("panel/Fixed/RightTabs/hTplBtn") or arg_22_0._tf:Find("panel/Fixed/RightTabs/vTplBtn")
	local var_22_2 = {
		"formation_btn",
		"commander_btn",
		"duty_btn",
		"adjustment_btn"
	}

	for iter_22_0 = 1, #var_22_2 do
		local var_22_3 = Instantiate(var_22_1)

		var_22_3.name = var_22_2[iter_22_0]

		SetParent(tf(var_22_3), var_22_0)
		setActive(var_22_3, false)
	end

	arg_22_0.tfLimit = arg_22_0._tf:Find("panel/Fixed/limit_list/limit")
	arg_22_0.tfLimitTips = arg_22_0._tf:Find("panel/Fixed/limit_list/limit_tip")
	arg_22_0.tfLimitElite = arg_22_0._tf:Find("panel/Fixed/limit_list/limit_elite")
	arg_22_0.tfLimitSubTip = arg_22_0._tf:Find("panel/Fixed/limit_list/limit_sub_tip")
	arg_22_0.tfLimitContainer = arg_22_0._tf:Find("panel/Fixed/limit_list/limit_elite/limit_list")
	arg_22_0.rtCostLimit = arg_22_0._tf:Find("panel/Fixed/limit_list/cost_limit")
	arg_22_0.btnBack = arg_22_0._tf:Find("panel/Fixed/btnBack")
	arg_22_0.btnGo = arg_22_0._tf:Find("panel/Fixed/start_button")
	arg_22_0.btnMultiple = arg_22_0._tf:Find("panel/Fixed/multiple")
	arg_22_0.formationToggle = arg_22_0._tf:Find("panel/Fixed/RightTabs/formation_btn")
	arg_22_0.commanderToggle = arg_22_0._tf:Find("panel/Fixed/RightTabs/commander_btn")
	arg_22_0.dutyToggle = arg_22_0._tf:Find("panel/Fixed/RightTabs/duty_btn")
	arg_22_0.adjustmentToggle = arg_22_0._tf:Find("panel/Fixed/RightTabs/adjustment_btn")
	arg_22_0.toggleMask = arg_22_0._tf:Find("mask")
	arg_22_0.toggleList = arg_22_0._tf:Find("mask/list")
	arg_22_0.toggles = {}

	setText(findTF(arg_22_0.tfLimit, "text"), i18n("level_fleet_ship_desc"))
	setText(findTF(arg_22_0.tfLimit, "text_sub"), i18n("level_fleet_sub_desc"))

	for iter_22_1 = 0, arg_22_0.toggleList.childCount - 1 do
		table.insert(arg_22_0.toggles, arg_22_0.toggleList:Find("item" .. iter_22_1 + 1))
	end

	arg_22_0.btnSp = arg_22_0._tf:Find("panel/Fixed/sp")
	arg_22_0.spMask = arg_22_0._tf:Find("mask_sp")
	arg_22_0.dutyItems = {}

	for iter_22_2 = 1, 2 do
		local var_22_4 = arg_22_0._tf:Find(string.format("panel/ShipList/fleet/%d/DutySelect", iter_22_2))

		arg_22_0.dutyItems[iter_22_2] = {}

		for iter_22_3 = 1, 4 do
			local var_22_5 = var_22_4:Find("Item" .. iter_22_3)

			arg_22_0.dutyItems[iter_22_2][iter_22_3] = var_22_5

			setText(var_22_5:Find("Text"), i18n("autofight_function" .. iter_22_3))
		end
	end

	local var_22_6 = arg_22_0._tf:Find("panel/ShipList/sub/1/DutySelect")

	arg_22_0.dutyItems[3] = {}

	for iter_22_4 = 1, 2 do
		local var_22_7 = var_22_6:Find("Item" .. iter_22_4)

		arg_22_0.dutyItems[3][iter_22_4] = var_22_7

		setText(var_22_7:Find("Text"), i18n("autofight_function" .. 6 - iter_22_4))
	end

	setActive(arg_22_0.tfShipTpl, false)
	setActive(arg_22_0.tfEmptyTpl, false)
	setActive(arg_22_0.toggleMask, false)
	setActive(arg_22_0.btnSp, false)
	setActive(arg_22_0.spMask, false)
	setText(arg_22_0._tf:Find("panel/Fixed/RightTabs/formation_btn/text"), i18n("autofight_formation"))
	setText(arg_22_0._tf:Find("panel/Fixed/RightTabs/commander_btn/text"), i18n("autofight_cat"))
	setText(arg_22_0._tf:Find("panel/Fixed/RightTabs/duty_btn/text"), i18n("autofight_function"))
	setText(arg_22_0.adjustmentToggle:Find("text"), i18n("word_adjustFleet"))

	arg_22_0.dropDown = arg_22_0._tf:Find("panel/FixedTop/Dropdown")

	setActive(arg_22_0.dropDown, false)

	arg_22_0.dropDownSide = arg_22_0._tf:Find("panel/Fixed/title/DropSide")

	onButton(arg_22_0, arg_22_0.dropDownSide:Find("Click"), function()
		local var_23_0 = isActive(arg_22_0.dropDown)

		setActive(arg_22_0.dropDown, not var_23_0)
	end, SFX_UI_CLICK)
	onButton(arg_22_0, arg_22_0.dropDown, function()
		local var_24_0 = isActive(arg_22_0.dropDown)

		setActive(arg_22_0.dropDown, not var_24_0)
	end, SFX_UI_CLICK)
	onButton(arg_22_0, arg_22_0.dropDownSide:Find("Layout/Item3"), function()
		arg_22_0:emit(LevelUIConst.HANDLE_SHOW_MSG_BOX, {
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.fleet_antisub_range_tip.tip
		})
	end, SFX_PANEL)
	assert(OPEN_AIR_DOMINANCE, "Not Prepare for BANNED OPEN_AIR_DOMINANCE")

	arg_22_0.btnASHelp = arg_22_0.dropDownSide:Find("help")

	setText(arg_22_0.dropDownSide:Find("Layout/Item1/Text"), i18n("word_investigate"))
	setText(arg_22_0.dropDownSide:Find("Layout/Item2/Text"), i18n("word_attr_ac"))
	setText(arg_22_0.dropDownSide:Find("Layout/Item3/Text"), i18n("fleet_antisub_range"))
	setText(arg_22_0.dropDown:Find("Investigation/Text"), i18n("level_scene_title_word_1"))
	setText(arg_22_0.dropDown:Find("Airsupport/Text"), i18n("level_scene_title_word_3"))

	arg_22_0.supportFleetHelp = arg_22_0._tf:Find("panel/Fixed/title/Image/Help")

	onButton(arg_22_0, arg_22_0.supportFleetHelp, function()
		local var_26_0 = arg_22_0.chapter:IsSupportSubmarineStage() and "help_supportfleet_16_submarine" or arg_22_0.chapter:IsFogStage() and "help_supportfleet_16" or "help_supportfleet"

		arg_22_0:emit(LevelUIConst.HANDLE_SHOW_MSG_BOX, {
			type = MSGBOX_TYPE_HELP,
			helps = i18n(var_26_0)
		})
	end, SFX_PANEL)

	for iter_22_5 = 1, 2 do
		for iter_22_6 = 1, 4 do
			local var_22_8 = arg_22_0.dutyItems[iter_22_5][iter_22_6]

			onButton(arg_22_0, var_22_8, function()
				arg_22_0:SetDuty(iter_22_5, iter_22_6)
			end)
		end
	end

	for iter_22_7 = 1, 2 do
		local var_22_9 = arg_22_0.dutyItems[3][iter_22_7]

		onButton(arg_22_0, var_22_9, function()
			arg_22_0:SetAutoSub(iter_22_7 == 1)
		end)
	end
end

function var_0_0.onCancelSupport(arg_29_0, arg_29_1)
	if arg_29_1 then
		arg_29_0:emit(LevelMediator2.ON_UPDATE_CUSTOM_FLEET, arg_29_0.chapter)
	end
end

function var_0_0.set(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	arg_30_0.chapter = arg_30_1
	arg_30_0.mode = var_0_2.SELECT
	arg_30_0.selects = arg_30_3
	arg_30_0.chapterASValue = arg_30_0.chapter:getConfig("air_dominance")
	arg_30_0.suggestionValue = arg_30_0.chapter:getConfig("best_air_dominance")

	arg_30_0:SetDutyTabEnabled(arg_30_1:isLoop())

	arg_30_0.supportFleet = arg_30_0.chapter:getSupportFleet()

	local var_30_0 = arg_30_0:getLimitNums(FleetType.Support) > 0

	setActive(arg_30_0.supportFleetHelp, var_30_0)

	arg_30_0.displayMode = var_30_0 and var_0_3.ADDITION_SUPPORT or var_0_3.NORMAL

	arg_30_0:SwitchDisplayMode()

	arg_30_0.fleets = underscore(arg_30_2):chain():values():filter(function(arg_31_0)
		return arg_31_0:isRegularFleet()
	end):sort(CompareFuncs({
		function(arg_32_0)
			return arg_32_0.id
		end
	})):value()
	arg_30_0.selectIds = {
		[FleetType.Normal] = {},
		[FleetType.Submarine] = {}
	}

	for iter_30_0, iter_30_1 in ipairs(arg_30_3 or {}) do
		local var_30_1 = arg_30_0:getFleetById(iter_30_1)

		if var_30_1 then
			local var_30_2 = var_30_1:getFleetType()
			local var_30_3 = arg_30_0.selectIds[var_30_2]

			if #var_30_3 < arg_30_0:getLimitNums(var_30_2) then
				table.insert(var_30_3, iter_30_1)
			end
		end
	end

	arg_30_0.duties = {}

	local var_30_4 = PlayerPrefs.GetInt("lastFleetDuty_" .. (arg_30_0.chapter.id or 0), 0)

	if var_30_4 > 0 then
		local var_30_5 = bit.band(var_30_4, 255)
		local var_30_6 = bit.rshift(var_30_4, 8)
		local var_30_7 = bit.band(var_30_6, 255)

		if var_30_5 > 0 and var_30_7 > 0 then
			arg_30_0.duties[var_30_5] = var_30_7
		end
	end

	setActive(arg_30_0.tfLimitElite, false)
	setActive(arg_30_0.tfLimitSubTip, false)
	setActive(arg_30_0.tfLimitTips, false)
	setActive(arg_30_0.tfLimit, true)

	local var_30_8 = arg_30_0.chapter:isLoop() and arg_30_0.chapter:getConfig("use_oil_limit") or {}

	setActive(arg_30_0.rtCostLimit, #var_30_8 > 0)
	setText(arg_30_0.rtCostLimit:Find("text"), i18n("formationScene_use_oil_limit_tip"))

	if #var_30_8 > 0 then
		setActive(arg_30_0.rtCostLimit:Find("cost_noraml"), var_30_8[1] > 0)
		setText(arg_30_0.rtCostLimit:Find("cost_noraml/Text"), string.format("%s(%d)", i18n("formationScene_use_oil_limit_enemy"), var_30_8[1]))
		setActive(arg_30_0.rtCostLimit:Find("cost_boss"), var_30_8[2] > 0)
		setText(arg_30_0.rtCostLimit:Find("cost_boss/Text"), string.format("%s(%d)", i18n("formationScene_use_oil_limit_flagship"), var_30_8[2]))
		setActive(arg_30_0.rtCostLimit:Find("cost_sub"), var_30_8[3] > 0)
		setText(arg_30_0.rtCostLimit:Find("cost_sub/Text"), string.format("%s(%d)", i18n("formationScene_use_oil_limit_submarine"), var_30_8[3]))
	end

	onButton(arg_30_0, arg_30_0.btnGo, function()
		local function var_33_0()
			arg_30_0:onConfirm()
		end

		local var_33_1 = arg_30_0:getSPItem()

		if var_33_1 and var_33_1 ~= 0 then
			if PlayerPrefs.GetInt("SPOPItemReminder") ~= 1 then
				local var_33_2 = Item.getConfigData(var_33_1).name
				local var_33_3 = pg.benefit_buff_template[Chapter.GetSPBuffByItem(var_33_1)].desc
				local var_33_4 = i18n("levelScene_select_SP_OP_reminder", var_33_2, var_33_3)

				local function var_33_5()
					PlayerPrefs.SetInt("SPOPItemReminder", 1)
					PlayerPrefs.Save()
					var_33_0()
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_SINGLE_ITEM,
					drop = {
						count = 1,
						type = DROP_TYPE_ITEM,
						id = var_33_1
					},
					intro = var_33_4,
					onYes = var_33_5
				})
			else
				var_33_0()
			end
		else
			var_33_0()
		end
	end, SFX_UI_WEIGHANCHOR_GO)
	setActive(arg_30_0.btnMultiple, AutoBotCommand.autoBotSatisfied() and arg_30_0.chapter:isLoop())
	onButton(arg_30_0, arg_30_0.btnMultiple, function()
		local var_36_0 = arg_30_0:getSelectIds()
		local var_36_1 = arg_30_0:getSPItem()
		local var_36_2 = arg_30_0:GetOrderedDuties()

		arg_30_0:emit(LevelUIConst.OPEN_NORMAL_CONTINUOUS_WINDOW, arg_30_0.chapter, var_36_0, var_36_1, var_36_2)
	end, SFX_PANEL)
	onButton(arg_30_0, arg_30_0.btnASHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_ac")
		})
	end, SFX_UI_CLICK)
	onButton(arg_30_0, arg_30_0.btnBack, function()
		arg_30_0:onCancel()
		arg_30_0:onCancelSupport(true)
	end, SFX_CANCEL)
	onButton(arg_30_0, arg_30_0._tf:Find("bg"), function()
		arg_30_0:onCancel()
		arg_30_0:onCancelSupport(true)
	end, SFX_CANCEL)
	onButton(arg_30_0, arg_30_0.toggleMask, function()
		arg_30_0:hideToggleMask()
	end, SFX_CANCEL)
	onToggle(arg_30_0, arg_30_0.formationToggle, function(arg_41_0)
		if arg_41_0 then
			arg_30_0.contextData.tabIndex = var_0_0.TabIndex.Formation

			arg_30_0:updateFleets()
		end
	end, SFX_PANEL)
	onToggle(arg_30_0, arg_30_0.commanderToggle, function(arg_42_0)
		if arg_42_0 then
			arg_30_0.contextData.tabIndex = var_0_0.TabIndex.Commander

			arg_30_0:updateFleets()
		end
	end, SFX_PANEL)
	onToggle(arg_30_0, arg_30_0.dutyToggle, function(arg_43_0)
		if arg_43_0 then
			arg_30_0.contextData.tabIndex = var_0_0.TabIndex.Duty

			arg_30_0:updateFleets()
		end
	end, SFX_PANEL)
	setActive(arg_30_0.formationToggle, true)
	setActive(arg_30_0.commanderToggle, arg_30_0.openedCommanerSystem)
	setActive(arg_30_0.dutyToggle, arg_30_0.dutyTabEnabled)
	setActive(arg_30_0.adjustmentToggle, false)
	arg_30_0:downloadLevelFleetViewResList(function()
		arg_30_0:clearFleets()
		arg_30_0:updateFleets()
		arg_30_0:updateLimit()
		arg_30_0:updateASValue()
		arg_30_0:UpdateSonarRange()
		arg_30_0:UpdateInvestigation()
	end)
end

function var_0_0.getFleetById(arg_45_0, arg_45_1)
	return _.detect(arg_45_0.fleets, function(arg_46_0)
		return arg_46_0.id == arg_45_1
	end)
end

function var_0_0.getLimitNums(arg_47_0, arg_47_1)
	local var_47_0 = 0

	if arg_47_1 == FleetType.Normal then
		var_47_0 = arg_47_0.chapter:getConfig("group_num")
	elseif arg_47_1 == FleetType.Submarine then
		var_47_0 = arg_47_0.chapter:getConfig("submarine_num")
	elseif arg_47_1 == FleetType.Support then
		var_47_0 = arg_47_0.chapter:getConfig("support_group_num")
	end

	return var_47_0
end

function var_0_0.getSelectIds(arg_48_0)
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in ipairs({
		FleetType.Normal,
		FleetType.Submarine
	}) do
		local var_48_1 = arg_48_0.selectIds[iter_48_1]

		for iter_48_2, iter_48_3 in ipairs(var_48_1) do
			if iter_48_3 > 0 then
				table.insert(var_48_0, iter_48_3)
			end
		end
	end

	return var_48_0
end

function var_0_0.updateFleets(arg_49_0)
	for iter_49_0, iter_49_1 in pairs(arg_49_0.tfFleets) do
		for iter_49_2 = 1, #iter_49_1 do
			if iter_49_0 == FleetType.Support then
				arg_49_0:UpdateEliteFleet(iter_49_0, iter_49_2)
			else
				arg_49_0:updateFleet(iter_49_0, iter_49_2)
			end
		end
	end

	arg_49_0:RefreshDutyBar()
end

function var_0_0.updateLimit(arg_50_0)
	local var_50_0 = #_.filter(arg_50_0.selectIds[FleetType.Normal], function(arg_51_0)
		return arg_51_0 > 0
	end)
	local var_50_1 = #_.filter(arg_50_0.selectIds[FleetType.Submarine], function(arg_52_0)
		return arg_52_0 > 0
	end)
	local var_50_2 = arg_50_0:getLimitNums(FleetType.Normal)

	setText(arg_50_0.tfLimit:Find("number"), string.format("%d/%d", var_50_0, var_50_2))

	local var_50_3 = arg_50_0:getLimitNums(FleetType.Submarine)

	setText(arg_50_0.tfLimit:Find("number_sub"), string.format("%d/%d", var_50_1, var_50_3))
end

function var_0_0.selectFleet(arg_53_0, arg_53_1, arg_53_2, arg_53_3)
	local var_53_0 = arg_53_0.selectIds[arg_53_1]

	if arg_53_3 > 0 and table.contains(var_53_0, arg_53_3) then
		return
	end

	if arg_53_1 == FleetType.Normal and arg_53_0:getLimitNums(arg_53_1) > 0 and arg_53_3 == 0 and #_.filter(var_53_0, function(arg_54_0)
		return arg_54_0 > 0
	end) == 1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("level_fleet_lease_one_ship"))

		return
	end

	local var_53_1 = arg_53_0:getFleetById(arg_53_3)

	if var_53_1 then
		if not var_53_1:isUnlock() then
			return
		end

		if var_53_1:isLegalToFight() ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("level_fleet_not_enough"))

			return
		end
	end

	local var_53_2 = {
		not arg_53_0:IsListOfFleetEmpty(1) or nil,
		not arg_53_0:IsListOfFleetEmpty(2) or nil
	}
	local var_53_3 = var_53_0[arg_53_2]

	var_53_0[arg_53_2] = arg_53_3

	arg_53_0:updateFleet(arg_53_1, arg_53_2)
	arg_53_0:updateLimit()
	arg_53_0:updateASValue()
	arg_53_0:UpdateSonarRange()
	arg_53_0:RefreshDutyBar()

	local var_53_4 = {
		not arg_53_0:IsListOfFleetEmpty(1) or nil,
		not arg_53_0:IsListOfFleetEmpty(2) or nil
	}

	if arg_53_0.dutyTabEnabled and table.getCount(var_53_2) == 2 and table.getCount(var_53_4) == 1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("autofight_change_tip"))
	end

	arg_53_0:UpdateInvestigation()
end

function var_0_0.updateFleet(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = arg_55_0.contextData.tabIndex == var_0_0.TabIndex.Formation
	local var_55_1 = arg_55_0.contextData.tabIndex == var_0_0.TabIndex.Commander
	local var_55_2 = arg_55_0.contextData.tabIndex == var_0_0.TabIndex.Duty
	local var_55_3 = arg_55_0.contextData.tabIndex == var_0_0.TabIndex.Adjustment
	local var_55_4 = arg_55_0.selectIds[arg_55_1][arg_55_2]
	local var_55_5 = arg_55_0:getFleetById(var_55_4)
	local var_55_6 = arg_55_2 <= arg_55_0:getLimitNums(arg_55_1)
	local var_55_7 = arg_55_0.tfFleets[arg_55_1][arg_55_2]
	local var_55_8 = findTF(var_55_7, "bg/name")
	local var_55_9 = var_55_7:Find("btn_select")
	local var_55_10 = var_55_7:Find("btn_recom")
	local var_55_11 = var_55_7:Find("btn_clear")
	local var_55_12 = var_55_7:Find("blank")
	local var_55_13 = var_55_7:Find("selected")
	local var_55_14 = var_55_7:Find("commander")
	local var_55_15 = var_55_7:Find("adjustment_flag")

	setActive(var_55_10, false)
	setActive(var_55_13, false)
	setText(var_55_8, "")

	local var_55_16 = var_55_7:Find(TeamType.Main)
	local var_55_17 = var_55_7:Find(TeamType.Vanguard)

	if not var_55_6 then
		setActive(var_55_11, false)
		setActive(var_55_9, false)
		setActive(var_55_14, false)
		setActive(var_55_15, false)
		setActive(var_55_12, true)
		setActive(var_55_16, false)

		if arg_55_1 == FleetType.Normal then
			setActive(var_55_17, false)
		end

		return
	end

	setActive(var_55_11, var_55_0)
	setActive(var_55_9, var_55_0)
	setActive(var_55_14, var_55_1 and var_55_5)
	setActive(var_55_15, var_55_3)
	setActive(var_55_12, var_55_2 or var_55_3 or var_55_1 and not var_55_5)
	setText(var_55_8, var_55_5 and var_55_5:GetName() or "")
	setActive(var_55_16, var_55_5)

	if arg_55_1 == FleetType.Normal then
		setActive(var_55_17, var_55_5)
	end

	if var_55_5 then
		if arg_55_1 == FleetType.Submarine then
			arg_55_0:updateShips(var_55_16, var_55_5.subShips)
		else
			arg_55_0:updateShips(var_55_16, var_55_5.mainShips)
			arg_55_0:updateShips(var_55_17, var_55_5.vanguardShips)
		end

		arg_55_0:updateCommanders(var_55_14, var_55_5)
	end

	onButton(arg_55_0, var_55_9, function()
		arg_55_0.toggleList.position = (var_55_9.position + var_55_11.position) / 2
		arg_55_0.toggleList.anchoredPosition = arg_55_0.toggleList.anchoredPosition + Vector2(-arg_55_0.toggleList.rect.width / 2, -var_55_9.rect.height / 2)

		arg_55_0:showToggleMask(arg_55_1, function(arg_57_0)
			arg_55_0:hideToggleMask()
			arg_55_0:selectFleet(arg_55_1, arg_55_2, arg_57_0)
		end)
	end, SFX_UI_CLICK)
	onButton(arg_55_0, var_55_11, function()
		arg_55_0:selectFleet(arg_55_1, arg_55_2, 0)
	end, SFX_UI_CLICK)
end

function var_0_0.updateCommanders(arg_59_0, arg_59_1, arg_59_2)
	for iter_59_0 = 1, 2 do
		local var_59_0 = arg_59_2:getCommanderByPos(iter_59_0)
		local var_59_1 = arg_59_1:Find("pos" .. iter_59_0)
		local var_59_2 = var_59_1:Find("add")
		local var_59_3 = var_59_1:Find("info")

		setActive(var_59_2, not var_59_0)
		setActive(var_59_3, var_59_0)

		if var_59_0 then
			local var_59_4 = Commander.rarity2Frame(var_59_0:getRarity())

			setImageSprite(var_59_3:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. var_59_4))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. var_59_0:getPainting(), "", var_59_3:Find("mask/icon"))
		end

		onButton(arg_59_0, var_59_2, function()
			arg_59_0:emit(LevelUIConst.OPEN_COMMANDER_PANEL, arg_59_2, arg_59_0.chapter)
		end, SFX_PANEL)
		onButton(arg_59_0, var_59_3, function()
			arg_59_0:emit(LevelUIConst.OPEN_COMMANDER_PANEL, arg_59_2, arg_59_0.chapter)
		end, SFX_PANEL)
	end
end

function var_0_0.updateShips(arg_62_0, arg_62_1, arg_62_2)
	local var_62_0 = UIItemList.New(arg_62_1, arg_62_0.tfShipTpl)

	var_62_0:make(function(arg_63_0, arg_63_1, arg_63_2)
		if arg_63_0 == UIItemList.EventUpdate then
			local var_63_0 = getProxy(BayProxy):getShipById(arg_62_2[arg_63_1 + 1])

			updateShip(arg_63_2, var_63_0)
			setActive(findTF(arg_63_2, "ship_type"), false)

			local var_63_1 = arg_63_2:Find("icon_bg/energy")
			local var_63_2 = var_63_0:getEnergeConfig()

			if var_63_2 and var_63_2.id <= 2 then
				setActive(var_63_1, true)
				GetImageSpriteFromAtlasAsync("energy", var_63_2.icon, var_63_1)
			else
				setActive(var_63_1, false)
			end
		end
	end)
	var_62_0:align(#arg_62_2)

	for iter_62_0, iter_62_1 in ipairs(arg_62_2) do
		local var_62_1 = arg_62_1:GetChild(iter_62_0 - 1)
		local var_62_2 = GetOrAddComponent(var_62_1, "UILongPressTrigger").onLongPressed

		pg.DelegateInfo.Add(arg_62_0, var_62_2)
		var_62_2:RemoveAllListeners()
		var_62_2:AddListener(function()
			arg_62_0:emit(LevelMediator2.ON_SHIP_DETAIL, {
				id = iter_62_1,
				chapter = arg_62_0.chapter
			})
		end)
	end
end

function var_0_0.showToggleMask(arg_65_0, arg_65_1, arg_65_2)
	setActive(arg_65_0.toggleMask, true)

	local var_65_0 = _.filter(arg_65_0.fleets, function(arg_66_0)
		return arg_66_0:getFleetType() == arg_65_1
	end)

	for iter_65_0, iter_65_1 in ipairs(arg_65_0.toggles) do
		local var_65_1 = var_65_0[iter_65_0]

		setActive(iter_65_1, var_65_1)

		if var_65_1 then
			local var_65_2 = iter_65_1:GetComponent(typeof(Toggle))
			local var_65_3 = iter_65_1:Find("lock")
			local var_65_4, var_65_5 = var_65_1:isUnlock()

			setToggleEnabled(iter_65_1, var_65_4)
			setActive(var_65_3, not var_65_4)

			local var_65_6 = table.contains(arg_65_0.selectIds[arg_65_1], var_65_1.id)

			setActive(iter_65_1:Find("on"), var_65_6)
			setActive(iter_65_1:Find("off"), not var_65_6)

			if var_65_4 then
				var_65_2.isOn = false

				onToggle(arg_65_0, iter_65_1, function(arg_67_0)
					if arg_67_0 then
						setActive(arg_65_0.toggleMask, false)
						arg_65_2(var_65_1.id)
					end
				end, SFX_UI_TAG)
			else
				onButton(arg_65_0, var_65_3, function()
					pg.TipsMgr.GetInstance():ShowTips(var_65_5)
				end, SFX_UI_CLICK)
			end
		end
	end
end

function var_0_0.hideToggleMask(arg_69_0)
	setActive(arg_69_0.toggleMask, false)
end

function var_0_0.clearFleets(arg_70_0)
	for iter_70_0, iter_70_1 in pairs(arg_70_0.tfFleets) do
		_.each(iter_70_1, function(arg_71_0)
			arg_70_0:clearFleet(arg_71_0)
		end)
	end
end

function var_0_0.UpdateInvestigation(arg_72_0)
	if not arg_72_0.chapter:existAmbush() then
		arg_72_0:UpdateLoopInvestigation()

		return
	end

	local var_72_0 = 0

	for iter_72_0 = 1, 2 do
		local var_72_1 = arg_72_0.selectIds[FleetType.Normal][iter_72_0] or 0
		local var_72_2 = arg_72_0:getFleetById(var_72_1)
		local var_72_3 = var_72_2 and math.floor(var_72_2:getInvestSums(true)) or 0

		var_72_0 = math.max(var_72_0, var_72_3)
	end

	local var_72_4 = arg_72_0.chapter:getConfig("avoid_require")

	arg_72_0:UpdateInvestigationComparision(var_72_0, var_72_4)
end

function var_0_0.UpdateEliteInvestigation(arg_73_0)
	if not arg_73_0.chapter:existAmbush() then
		arg_73_0:UpdateLoopInvestigation()

		return
	end

	local var_73_0 = 0

	for iter_73_0 = 1, 2 do
		local var_73_1 = 0

		if iter_73_0 <= arg_73_0.chapter:GetNomralFleetMaxCount() then
			local var_73_2 = arg_73_0.eliteFleetList[iter_73_0]
			local var_73_3 = {}

			for iter_73_1, iter_73_2 in pairs(arg_73_0.eliteCommanderList[iter_73_0]) do
				table.insert(var_73_3, {
					pos = iter_73_1,
					id = iter_73_2
				})
			end

			local var_73_4 = TypedFleet.New({
				ship_list = var_73_2,
				commanders = var_73_3,
				fleetType = FleetType.Normal
			})

			var_73_1 = math.floor(var_73_4:getInvestSums())
		end

		var_73_0 = math.max(var_73_0, var_73_1)
	end

	local var_73_5 = arg_73_0.chapter:getConfig("avoid_require")

	arg_73_0:UpdateInvestigationComparision(var_73_0, var_73_5)
end

function var_0_0.UpdateLoopInvestigation(arg_74_0)
	local var_74_0 = arg_74_0.dropDown:Find("Investigation")

	setText(var_74_0:Find("Value1"), "-")
	setText(var_74_0:Find("Value2"), "-")
	triggerToggle(arg_74_0.dropDownSide:Find("Layout/Item1/Dot"), true)
end

function var_0_0.UpdateInvestigationComparision(arg_75_0, arg_75_1, arg_75_2)
	arg_75_1 = math.floor(arg_75_1)

	local var_75_0 = arg_75_0.dropDown:Find("Investigation")
	local var_75_1 = arg_75_2 <= arg_75_1

	setText(var_75_0:Find("Value1"), setColorStr(arg_75_1, var_75_1 and "#51FF55" or COLOR_WHITE))
	setText(var_75_0:Find("Value2"), arg_75_2)
	triggerToggle(arg_75_0.dropDownSide:Find("Layout/Item1/Dot"), var_75_1)
end

function var_0_0.updateASValue(arg_76_0)
	if arg_76_0.chapterASValue <= 0 then
		arg_76_0:UpdateBannedAS()

		return
	end

	local var_76_0 = 0

	for iter_76_0 = 1, 2 do
		local var_76_1 = arg_76_0.selectIds[FleetType.Normal][iter_76_0] or 0
		local var_76_2 = arg_76_0:getFleetById(var_76_1)

		var_76_0 = var_76_0 + (var_76_2 and var_76_2:getFleetAirDominanceValue() or 0)
	end

	for iter_76_1 = 1, 1 do
		local var_76_3 = arg_76_0.selectIds[FleetType.Submarine][iter_76_1] or 0
		local var_76_4 = arg_76_0:getFleetById(var_76_3)

		var_76_0 = var_76_0 + (var_76_4 and var_76_4:getFleetAirDominanceValue() or 0)
	end

	arg_76_0:UpdateASComparision(var_76_0, arg_76_0.suggestionValue)
end

function var_0_0.updateEliteASValue(arg_77_0)
	if arg_77_0.chapterASValue <= 0 then
		arg_77_0:UpdateBannedAS()

		return
	end

	local var_77_0 = getProxy(BayProxy)
	local var_77_1 = 0

	for iter_77_0, iter_77_1 in ipairs(arg_77_0.eliteFleetList) do
		local var_77_2 = {}

		for iter_77_2, iter_77_3 in pairs(arg_77_0.eliteCommanderList[iter_77_0]) do
			var_77_2[iter_77_2] = getProxy(CommanderProxy):RawGetCommanderById(iter_77_3)
		end

		for iter_77_4, iter_77_5 in ipairs(iter_77_1) do
			var_77_1 = var_77_1 + calcAirDominanceValue(var_77_0:RawGetShipById(iter_77_5), var_77_2)
		end
	end

	arg_77_0:UpdateASComparision(var_77_1, arg_77_0.suggestionValue)
end

function var_0_0.UpdateBannedAS(arg_78_0)
	local var_78_0 = arg_78_0.dropDown:Find("Airsupport")

	setText(var_78_0:Find("Value1"), "-")
	setText(var_78_0:Find("Value2"), "-")
	triggerToggle(arg_78_0.dropDownSide:Find("Layout/Item2/Dot"), true)
end

function var_0_0.UpdateASComparision(arg_79_0, arg_79_1, arg_79_2)
	arg_79_1 = math.floor(arg_79_1)

	local var_79_0 = arg_79_0.dropDown:Find("Airsupport")

	setText(var_79_0:Find("Text"), i18n("level_scene_title_word_3"))

	local var_79_1 = arg_79_2 < arg_79_1

	setText(var_79_0:Find("Value1"), setColorStr(arg_79_1, var_79_1 and "#51FF55" or COLOR_WHITE))
	setText(var_79_0:Find("Value2"), arg_79_2)
	triggerToggle(arg_79_0.dropDownSide:Find("Layout/Item2/Dot"), var_79_1)
end

function var_0_0.UpdateSonarRange(arg_80_0)
	for iter_80_0 = 1, 2 do
		local var_80_0 = arg_80_0.selectIds[FleetType.Normal][iter_80_0] or 0
		local var_80_1 = arg_80_0:getFleetById(var_80_0)
		local var_80_2 = var_80_1 and math.floor(var_80_1:GetFleetSonarRange()) or 0

		arg_80_0:UpdateSonarRangeValues(iter_80_0, var_80_2)
	end
end

function var_0_0.UpdateEliteSonarRange(arg_81_0)
	for iter_81_0 = 1, 2 do
		if not arg_81_0.eliteFleetList[iter_81_0] then
			arg_81_0:UpdateSonarRangeValues(iter_81_0, 0)
		else
			local var_81_0 = arg_81_0.eliteFleetList[iter_81_0]
			local var_81_1 = {}

			for iter_81_1, iter_81_2 in pairs(arg_81_0.eliteCommanderList[iter_81_0]) do
				table.insert(var_81_1, {
					pos = iter_81_1,
					id = iter_81_2
				})
			end

			local var_81_2 = TypedFleet.New({
				ship_list = var_81_0,
				commanders = var_81_1,
				fleetType = FleetType.Normal
			})
			local var_81_3 = var_81_2 and math.floor(var_81_2:GetFleetSonarRange()) or 0

			arg_81_0:UpdateSonarRangeValues(iter_81_0, var_81_3)
		end
	end
end

function var_0_0.UpdateSonarRangeValues(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = arg_82_0.dropDownSide:Find("Layout/Item3/Values")

	setText(var_82_0:GetChild(arg_82_1 - 1), arg_82_2)
end

function var_0_0.clearFleet(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_1:Find(TeamType.Main)
	local var_83_1 = arg_83_1:Find(TeamType.Vanguard)

	if var_83_0 then
		removeAllChildren(var_83_0)
	end

	if var_83_1 then
		removeAllChildren(var_83_1)
	end
end

function var_0_0.clear(arg_84_0)
	arg_84_0.contextData.tabIndex = nil
	arg_84_0.duties = nil
end

function var_0_0.onCancelHard(arg_85_0, arg_85_1)
	if arg_85_1 then
		arg_85_0:emit(LevelMediator2.ON_UPDATE_CUSTOM_FLEET, arg_85_0.chapter)
	end

	arg_85_0:emit(LevelUIConst.HIDE_FLEET_EDIT)
end

function var_0_0.setHardShipVOs(arg_86_0, arg_86_1)
	arg_86_0.shipVOs = arg_86_1
end

function var_0_0.setOnHard(arg_87_0, arg_87_1)
	arg_87_0.chapter = arg_87_1
	arg_87_0.mode = var_0_2.EDIT
	arg_87_0.eliteFleetList = arg_87_0.chapter:getEliteFleetList()
	arg_87_0.eliteCommanderList = arg_87_0.chapter:getEliteFleetCommanders()
	arg_87_0.propetyLimitation = arg_87_0.chapter:getConfig("property_limitation")
	arg_87_0.chapterASValue = arg_87_0.chapter:getConfig("air_dominance")
	arg_87_0.suggestionValue = arg_87_0.chapter:getConfig("best_air_dominance")
	arg_87_0.typeLimitations = arg_87_0.chapter:getConfig("limitation")

	arg_87_0:SetDutyTabEnabled(arg_87_1:isLoop())

	local var_87_0 = arg_87_0:getLimitNums(FleetType.Support) > 0

	setActive(arg_87_0.supportFleetHelp, var_87_0)

	arg_87_0.displayMode = var_87_0 and var_0_3.ADDITION_SUPPORT or var_0_3.NORMAL

	arg_87_0:SwitchDisplayMode()

	arg_87_0.duties = {}

	local var_87_1 = PlayerPrefs.GetInt("lastFleetDuty_" .. (arg_87_0.chapter.id or 0), 0)

	if var_87_1 > 0 then
		local var_87_2 = bit.band(var_87_1, 255)
		local var_87_3 = bit.rshift(var_87_1, 8)
		local var_87_4 = bit.band(var_87_3, 255)

		if var_87_2 > 0 and var_87_4 > 0 then
			arg_87_0.duties[var_87_2] = var_87_4
		end
	end

	onButton(arg_87_0, arg_87_0.btnGo, function()
		local var_88_0 = "chapter_autofight_flag_" .. arg_87_0.chapter.id
		local var_88_1 = arg_87_0.chapter
		local var_88_2
		local var_88_3

		seriesAsync({
			function(arg_89_0)
				local var_89_0 = PlayerPrefs.GetInt("autoFight_firstUse_sp", 0) == 1

				if not (PlayerPrefs.GetInt(var_88_0, 1) == 1) or not arg_87_0:getSPItem() or var_89_0 then
					return arg_89_0()
				end

				PlayerPrefs.SetInt("autoFight_firstUse_sp", 1)
				PlayerPrefs.Save()

				local function var_89_1()
					arg_87_0:clearSPBuff()
				end

				arg_87_0:emit(LevelUIConst.HANDLE_SHOW_MSG_BOX, {
					hideNo = true,
					content = i18n("autofight_special_operation_tip"),
					onYes = var_89_1,
					onNo = var_89_1
				})
			end,
			function(arg_91_0)
				var_88_2 = arg_87_0.chapter:GetActiveSPItemID()
				var_88_3 = arg_87_0.chapter:isLoop() and arg_87_0:GetOrderedDuties() or nil

				arg_87_0:clear()
				arg_87_0:onCancelHard()
				arg_91_0()
			end,
			function(arg_92_0)
				local var_92_0 = PlayerPrefs.GetInt(var_88_0, 1) == 1
				local var_92_1 = LevelMediator2.ON_ELITE_TRACKING
				local var_92_2 = packEx(var_88_1.id, var_88_1.loopFlag, var_88_2, var_88_3, var_92_0)

				if pg.m02:retrieveMediator(LevelMediator2.__cname) then
					pg.m02:sendNotification(var_92_1, var_92_2)

					return
				end

				local var_92_3 = getProxy(ContextProxy):getContextByMediator(LevelMediator2)

				if var_92_3 then
					var_92_3:extendData({
						ToTrackingData = {
							var_92_1,
							var_92_2
						}
					})
				end
			end
		})
	end, SFX_UI_WEIGHANCHOR_GO)
	setActive(arg_87_0.btnMultiple, AutoBotCommand.autoBotSatisfied() and arg_87_0.chapter:isLoop())
	onButton(arg_87_0, arg_87_0.btnMultiple, function()
		local var_93_0 = arg_87_0:getSPItem()
		local var_93_1 = arg_87_0:GetOrderedDuties()

		arg_87_0:emit(LevelUIConst.OPEN_ELITE_CONTINUOUS_WINDOW, arg_87_0.chapter, var_93_0, var_93_1)
	end, SFX_PANEL)
	onButton(arg_87_0, arg_87_0.btnASHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_ac")
		})
	end, SFX_UI_CLICK)
	onButton(arg_87_0, arg_87_0.btnBack, function()
		arg_87_0:clear()
		arg_87_0:onCancelHard(true)
	end, SFX_CANCEL)
	onButton(arg_87_0, arg_87_0._tf:Find("bg"), function()
		arg_87_0:clear()
		arg_87_0:onCancelHard(true)
	end, SFX_CANCEL)
	onToggle(arg_87_0, arg_87_0.commanderToggle, function(arg_97_0)
		if arg_97_0 then
			arg_87_0.contextData.tabIndex = var_0_0.TabIndex.Commander

			arg_87_0:flush()
		end
	end, SFX_PANEL)
	onToggle(arg_87_0, arg_87_0.formationToggle, function(arg_98_0)
		if arg_98_0 then
			arg_87_0.contextData.tabIndex = var_0_0.TabIndex.Formation

			arg_87_0:flush()
		end
	end, SFX_PANEL)
	onToggle(arg_87_0, arg_87_0.dutyToggle, function(arg_99_0)
		if arg_99_0 then
			arg_87_0.contextData.tabIndex = var_0_0.TabIndex.Duty

			arg_87_0:flush()
		end
	end, SFX_UI_TAG)
	onToggle(arg_87_0, arg_87_0.adjustmentToggle, function(arg_100_0)
		if arg_100_0 then
			arg_87_0.contextData.tabIndex = var_0_0.TabIndex.Adjustment

			arg_87_0:flush()
		end
	end, SFX_PANEL)
	setActive(arg_87_0.formationToggle, true)
	setActive(arg_87_0.commanderToggle, arg_87_0.openedCommanerSystem)
	setActive(arg_87_0.dutyToggle, arg_87_0.dutyTabEnabled)
	setActive(arg_87_0.adjustmentToggle, true)
	arg_87_0:downloadLevelFleetViewResList(function()
		arg_87_0:flush()
	end)
end

function var_0_0.flush(arg_102_0)
	arg_102_0:updateEliteLimit()
	arg_102_0:updateEliteASValue()

	arg_102_0.lastFleetValidStatus = arg_102_0.lastFleetValidStatus or {}

	local var_102_0 = {
		not arg_102_0:IsListOfFleetEmpty(1) or nil,
		not arg_102_0:IsListOfFleetEmpty(2) or nil
	}

	if arg_102_0.dutyTabEnabled and table.getCount(arg_102_0.lastFleetValidStatus) == 2 and table.getCount(var_102_0) == 1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("autofight_change_tip"))
	end

	arg_102_0.lastFleetValidStatus = var_102_0

	arg_102_0:updateEliteFleets()
	arg_102_0:UpdateEliteSonarRange()
	arg_102_0:UpdateEliteInvestigation()
end

function var_0_0.updateEliteLimit(arg_103_0)
	setActive(arg_103_0.toggleMask, false)
	setActive(arg_103_0.tfLimit, false)
	setActive(arg_103_0.tfLimitTips, #arg_103_0.propetyLimitation == 0)
	setActive(arg_103_0.tfLimitElite, #arg_103_0.propetyLimitation > 0)
	setActive(arg_103_0.tfLimitSubTip, #arg_103_0.propetyLimitation > 0)

	if #arg_103_0.propetyLimitation > 0 then
		local var_103_0, var_103_1 = arg_103_0.chapter:IsPropertyLimitationSatisfy()
		local var_103_2 = UIItemList.New(arg_103_0.tfLimitContainer, arg_103_0.tfLimitContainer:GetChild(0))

		var_103_2:make(function(arg_104_0, arg_104_1, arg_104_2)
			arg_104_1 = arg_104_1 + 1

			if arg_104_0 == UIItemList.EventUpdate then
				local var_104_0 = arg_103_0.propetyLimitation[arg_104_1]
				local var_104_1, var_104_2, var_104_3, var_104_4 = unpack(var_104_0)

				if var_103_0[arg_104_1] == 1 then
					arg_104_2:Find("Text"):GetComponent(typeof(Text)).color = Color.New(1, 0.9607843137254902, 0.5019607843137255)
				else
					arg_104_2:Find("Text"):GetComponent(typeof(Text)).color = Color.New(0.9568627450980393, 0.30196078431372547, 0.30196078431372547)
				end

				setActive(arg_104_2, true)

				local var_104_5 = (AttributeType.EliteCondition2Name(var_104_1, var_104_4) .. AttributeType.eliteConditionCompareTip(var_104_2) .. var_104_3) .. "（" .. var_103_1[var_104_1] .. "）"

				setText(arg_104_2:Find("Text"), var_104_5)
			end
		end)
		var_103_2:align(#arg_103_0.propetyLimitation)
		setActive(arg_103_0.tfLimitSubTip, arg_103_0.chapter:getConfig("submarine_num") > 0)
	end

	local var_103_3 = arg_103_0.chapter:isLoop() and arg_103_0.chapter:getConfig("use_oil_limit") or {}

	setActive(arg_103_0.rtCostLimit, #var_103_3 > 0)
	setText(arg_103_0.rtCostLimit:Find("text"), i18n("formationScene_use_oil_limit_tip"))

	if #var_103_3 > 0 then
		setActive(arg_103_0.rtCostLimit:Find("cost_noraml"), var_103_3[1] > 0)
		setText(arg_103_0.rtCostLimit:Find("cost_noraml/Text"), string.format("%s(%d)", i18n("formationScene_use_oil_limit_enemy"), var_103_3[1]))
		setActive(arg_103_0.rtCostLimit:Find("cost_boss"), var_103_3[2] > 0)
		setText(arg_103_0.rtCostLimit:Find("cost_boss/Text"), string.format("%s(%d)", i18n("formationScene_use_oil_limit_flagship"), var_103_3[2]))
		setActive(arg_103_0.rtCostLimit:Find("cost_sub"), var_103_3[3] > 0)
		setText(arg_103_0.rtCostLimit:Find("cost_sub/Text"), string.format("%s(%d)", i18n("formationScene_use_oil_limit_submarine"), var_103_3[3]))
	end
end

function var_0_0.initAddButton(arg_105_0, arg_105_1, arg_105_2, arg_105_3, arg_105_4)
	local var_105_0 = arg_105_0.eliteFleetList[arg_105_4]
	local var_105_1 = {}
	local var_105_2 = {}

	for iter_105_0, iter_105_1 in ipairs(var_105_0) do
		var_105_1[arg_105_0.shipVOs[iter_105_1]] = true

		if not arg_105_2 or arg_105_2 == arg_105_0.shipVOs[iter_105_1]:getTeamType() then
			table.insert(var_105_2, iter_105_1)
		end
	end

	removeAllChildren(arg_105_1)

	local var_105_3 = 0
	local var_105_4 = false
	local var_105_5 = 0

	arg_105_3 = var_0_0.sortTeamLimitation(arg_105_3)

	local var_105_6 = arg_105_1:GetComponent("ContentSizeFitter")
	local var_105_7 = arg_105_1:GetComponent("HorizontalLayoutGroup")

	var_105_6.enabled = true
	var_105_7.enabled = true
	arg_105_0.isDraging = false

	for iter_105_2 = 1, 3 do
		local var_105_8
		local var_105_9
		local var_105_10
		local var_105_11 = var_105_2[iter_105_2] and arg_105_0.shipVOs[var_105_2[iter_105_2]] or nil

		if var_105_11 then
			for iter_105_3, iter_105_4 in ipairs(arg_105_3) do
				if ShipType.ContainInLimitBundle(iter_105_4, var_105_11:getShipType()) then
					var_105_9 = var_105_11
					var_105_10 = iter_105_4

					table.remove(arg_105_3, iter_105_3)

					var_105_4 = var_105_4 or iter_105_4 ~= 0

					break
				end
			end
		else
			var_105_10 = arg_105_3[1]

			table.remove(arg_105_3, 1)
		end

		if var_105_10 == 0 then
			var_105_5 = var_105_5 + 1
		end

		local var_105_12 = var_105_9 and cloneTplTo(arg_105_0.tfShipTpl, arg_105_1) or cloneTplTo(arg_105_0.tfEmptyTpl, arg_105_1)

		setActive(var_105_12, true)

		if var_105_9 then
			updateShip(var_105_12, var_105_9)
			setActive(var_105_12:Find("event_block"), var_105_9:getFlag("inEvent"))

			var_105_1[var_105_9] = true
		else
			var_105_3 = var_105_3 + 1
		end

		setActive(var_105_12:Find("ship_type"), var_105_10 and var_105_10 ~= 0)

		if var_105_10 and var_105_10 ~= 0 then
			if type(var_105_10) == "number" then
				local var_105_13 = GetSpriteFromAtlas("shiptype", ShipType.Type2CNLabel(var_105_10))

				setImageSprite(var_105_12:Find("ship_type"), var_105_13, true)
			elseif type(var_105_10) == "string" then
				local var_105_14 = GetSpriteFromAtlas("shiptype", ShipType.BundleType2CNLabel(var_105_10))

				setImageSprite(var_105_12:Find("ship_type"), var_105_14, true)
			end
		end

		local var_105_15 = _.map(var_105_0, function(arg_106_0)
			return arg_105_0.shipVOs[arg_106_0]
		end)

		table.sort(var_105_15, function(arg_107_0, arg_107_1)
			return var_0_1[arg_107_0:getTeamType()] < var_0_1[arg_107_1:getTeamType()] or var_0_1[arg_107_0:getTeamType()] == var_0_1[arg_107_1:getTeamType()] and table.indexof(var_105_0, arg_107_0.id) < table.indexof(var_105_0, arg_107_1.id)
		end)

		local var_105_16 = GetOrAddComponent(var_105_12, typeof(UILongPressTrigger))

		var_105_16.onLongPressed:RemoveAllListeners()

		if var_105_9 and arg_105_0.contextData.tabIndex ~= var_0_0.TabIndex.Adjustment then
			var_105_16.onLongPressed:AddListener(function()
				arg_105_0:onCancelHard(true)
				arg_105_0:emit(LevelMediator2.ON_FLEET_SHIPINFO, {
					shipId = var_105_9.id,
					shipVOs = var_105_15,
					chapter = arg_105_0.chapter
				})
			end)
		end

		local var_105_17 = GetOrAddComponent(var_105_12, "EventTriggerListener")

		var_105_17:RemovePointClickFunc()
		var_105_17:AddPointClickFunc(function(arg_109_0, arg_109_1)
			if arg_109_0 ~= var_105_12.gameObject then
				return
			end

			if arg_105_0.isDraging then
				return
			end

			arg_105_0:onCancelHard()
			arg_105_0:emit(LevelMediator2.ON_ELITE_OEPN_DECK, {
				shipType = var_105_10,
				fleet = var_105_1,
				chapter = arg_105_0.chapter,
				shipVO = var_105_9,
				fleetIndex = arg_105_4,
				teamType = arg_105_2
			})
		end)
		var_105_17:RemoveBeginDragFunc()
		var_105_17:RemoveDragFunc()
		var_105_17:RemoveDragEndFunc()

		if var_105_9 and arg_105_0.contextData.tabIndex == var_0_0.TabIndex.Adjustment then
			local var_105_18 = var_105_12.rect.width * 0.5
			local var_105_19 = {}
			local var_105_20 = {}

			var_105_17:AddBeginDragFunc(function(arg_110_0, arg_110_1)
				if arg_110_0 ~= var_105_12.gameObject then
					return
				end

				if arg_105_0.isDraging then
					return
				end

				arg_105_0.isDraging = true
				var_105_6.enabled = false
				var_105_7.enabled = false

				for iter_110_0 = 1, 3 do
					local var_110_0 = arg_105_1:GetChild(iter_110_0 - 1)

					if var_105_12 == var_110_0 then
						arg_105_0.dragIndex = iter_110_0
					end

					var_105_19[iter_110_0] = var_110_0.anchoredPosition
					var_105_20[iter_110_0] = var_110_0
				end
			end)
			var_105_17:AddDragFunc(function(arg_111_0, arg_111_1)
				if arg_111_0 ~= var_105_12.gameObject then
					return
				end

				if not arg_105_0.isDraging then
					return
				end

				local var_111_0 = var_105_12.localPosition

				var_111_0.x = arg_105_0:change2ScrPos(var_105_12.parent, arg_111_1.position).x
				var_111_0.x = math.clamp(var_111_0.x, var_105_19[1].x, var_105_19[3].x)
				var_105_12.localPosition = var_111_0

				local var_111_1 = 1

				for iter_111_0 = 1, 3 do
					if var_105_12 ~= var_105_20[iter_111_0] and var_105_12.localPosition.x > var_105_20[iter_111_0].localPosition.x + (var_111_1 < arg_105_0.dragIndex and 1.1 or -1.1) * var_105_18 then
						var_111_1 = var_111_1 + 1
					end
				end

				if arg_105_0.dragIndex ~= var_111_1 then
					local var_111_2 = var_111_1 < arg_105_0.dragIndex and -1 or 1

					while arg_105_0.dragIndex ~= var_111_1 do
						local var_111_3 = arg_105_0.dragIndex
						local var_111_4 = arg_105_0.dragIndex + var_111_2

						var_105_2[var_111_3], var_105_2[var_111_4] = var_105_2[var_111_4], var_105_2[var_111_3]
						var_105_20[var_111_3], var_105_20[var_111_4] = var_105_20[var_111_4], var_105_20[var_111_3]
						arg_105_0.dragIndex = arg_105_0.dragIndex + var_111_2
					end

					for iter_111_1 = 1, 3 do
						if var_105_12 ~= var_105_20[iter_111_1] then
							var_105_20[iter_111_1].anchoredPosition = var_105_19[iter_111_1]
						end
					end
				end
			end)
			var_105_17:AddDragEndFunc(function(arg_112_0, arg_112_1)
				if arg_112_0 ~= var_105_12.gameObject then
					return
				end

				if not arg_105_0.isDraging then
					return
				end

				arg_105_0.isDraging = false

				for iter_112_0 = 1, 3 do
					if not var_105_2[iter_112_0] then
						for iter_112_1 = iter_112_0 + 1, 3 do
							if var_105_2[iter_112_1] then
								var_105_2[iter_112_0], var_105_2[iter_112_1] = var_105_2[iter_112_1], var_105_2[iter_112_0]
								var_105_20[iter_112_0], var_105_20[iter_112_1] = var_105_20[iter_112_1], var_105_20[iter_112_0]
							end
						end
					end

					if var_105_2[iter_112_0] then
						table.removebyvalue(var_105_0, var_105_2[iter_112_0])
						table.insert(var_105_0, var_105_2[iter_112_0])
					else
						break
					end
				end

				for iter_112_2 = 1, 3 do
					var_105_20[iter_112_2]:SetSiblingIndex(iter_112_2 - 1)
				end

				var_105_6.enabled = true
				var_105_7.enabled = true
				arg_105_0.dragIndex = nil

				arg_105_0.chapter:setEliteFleetByIndex(arg_105_4, {
					{
						TeamType.FormShips,
						underscore.to_array(var_105_0)
					}
				})
				arg_105_0:emit(LevelMediator2.ON_ELITE_ADJUSTMENT, arg_105_0.chapter)
			end)
		end
	end

	if (var_105_4 == true or var_105_5 == 3) and var_105_3 ~= 3 then
		return true
	else
		return false
	end
end

function var_0_0.change2ScrPos(arg_113_0, arg_113_1, arg_113_2)
	local var_113_0 = pg.UIMgr.GetInstance().overlayCameraComp

	return (LuaHelper.ScreenToLocal(arg_113_1, arg_113_2, var_113_0))
end

function var_0_0.updateEliteFleets(arg_114_0)
	for iter_114_0, iter_114_1 in pairs(arg_114_0.tfFleets) do
		for iter_114_2 = 1, #iter_114_1 do
			arg_114_0:UpdateEliteFleet(iter_114_0, iter_114_2)
		end
	end

	arg_114_0:RefreshDutyBar()
end

function var_0_0.UpdateEliteFleet(arg_115_0, arg_115_1, arg_115_2)
	local var_115_0 = arg_115_0.contextData.tabIndex == var_0_0.TabIndex.Formation
	local var_115_1 = arg_115_0.contextData.tabIndex == var_0_0.TabIndex.Commander
	local var_115_2 = arg_115_0.contextData.tabIndex == var_0_0.TabIndex.Duty
	local var_115_3 = arg_115_0.contextData.tabIndex == var_0_0.TabIndex.Adjustment
	local var_115_4 = arg_115_2 <= arg_115_0:getLimitNums(arg_115_1)
	local var_115_5 = arg_115_0.tfFleets[arg_115_1][arg_115_2]
	local var_115_6 = findTF(var_115_5, "bg/name")
	local var_115_7 = var_115_5:Find("btn_select")
	local var_115_8 = var_115_5:Find("btn_recom")
	local var_115_9 = var_115_5:Find("btn_clear")
	local var_115_10 = var_115_5:Find("blank")
	local var_115_11 = var_115_5:Find("selected")
	local var_115_12 = var_115_5:Find("commander")
	local var_115_13 = var_115_5:Find("adjustment_flag")

	setActive(var_115_7, false)

	local var_115_14 = var_115_5:Find(TeamType.Main)
	local var_115_15 = var_115_5:Find(TeamType.Vanguard)

	if not var_115_4 then
		setActive(var_115_9, false)
		setActive(var_115_8, false)
		setActive(var_115_12, false)
		setActive(var_115_13, false)
		setActive(var_115_10, true)
		setActive(var_115_11, false)
		setText(var_115_6, "")
		setActive(var_115_14, false)

		if arg_115_1 == FleetType.Normal then
			setActive(var_115_15, false)
		end

		return
	end

	local var_115_16 = arg_115_1 == FleetType.Support

	setActive(var_115_9, var_115_0)
	setActive(var_115_8, var_115_0)
	setActive(var_115_12, var_115_1 and not var_115_16)
	setActive(var_115_13, var_115_3)
	setActive(var_115_10, var_115_2 or var_115_3 or var_115_1 and var_115_16)

	local var_115_17 = arg_115_2

	if arg_115_1 == FleetType.Normal then
		setText(var_115_6, Fleet.DEFAULT_NAME[arg_115_2])
		setActive(var_115_14, true)
		setActive(var_115_15, true)
	elseif arg_115_1 == FleetType.Submarine then
		var_115_17 = 3

		setText(var_115_6, Fleet.DEFAULT_NAME[Fleet.SUBMARINE_FLEET_ID + arg_115_2 - 1])
		setActive(var_115_14, true)
	elseif arg_115_1 == FleetType.Support then
		var_115_17 = 4

		setText(var_115_6, i18n("ship_formationUI_fleetName13"))
		setActive(var_115_14, true)
	end

	local var_115_18 = 6

	if arg_115_1 == FleetType.Normal then
		local var_115_19 = arg_115_0.typeLimitations[arg_115_2]
		local var_115_20 = var_115_19[1]
		local var_115_21 = var_115_19[2]
		local var_115_22 = arg_115_0:initAddButton(var_115_5:Find(TeamType.Main), TeamType.Main, var_115_20, var_115_17)
		local var_115_23 = arg_115_0:initAddButton(var_115_5:Find(TeamType.Vanguard), TeamType.Vanguard, var_115_21, var_115_17)

		setActive(var_115_11, var_115_22 and var_115_23)
	elseif arg_115_1 == FleetType.Submarine then
		var_115_18 = 3

		local var_115_24 = arg_115_0:initAddButton(var_115_5:Find(TeamType.Main), TeamType.Submarine, {
			0,
			0,
			0
		}, var_115_17)

		setActive(var_115_11, var_115_24)
	elseif arg_115_1 == FleetType.Support then
		var_115_18 = 3

		local var_115_25 = arg_115_0.chapter:getConfigMiscArg("submarine_support") and {
			"qian",
			"qian",
			"qian"
		} or {
			"hang",
			"hang",
			"hang"
		}
		local var_115_26 = arg_115_0:initSupportAddButton(var_115_5:Find(TeamType.Main), nil, var_115_25, var_115_17)

		setActive(var_115_11, arg_115_0.mode == var_0_2.EDIT and var_115_26)
	end

	if not var_115_16 then
		arg_115_0:initCommander(var_115_17, var_115_12, arg_115_0.chapter)
	end

	onButton(arg_115_0, var_115_9, function()
		if #(not var_115_16 and arg_115_0.eliteFleetList[var_115_17] or arg_115_0.supportFleet) == 0 then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("battle_preCombatLayer_clear_confirm"),
			onYes = function()
				arg_115_0:emit(LevelMediator2.ON_ELITE_CLEAR, {
					index = var_115_17,
					chapterVO = arg_115_0.chapter
				})
			end
		})
	end)
	onButton(arg_115_0, var_115_8, function()
		local var_118_0 = #(not var_115_16 and arg_115_0.eliteFleetList[var_115_17] or arg_115_0.supportFleet)

		if var_118_0 == var_115_18 then
			return
		end

		seriesAsync({
			function(arg_119_0)
				if var_118_0 == 0 then
					return arg_119_0()
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("battle_preCombatLayer_auto_confirm"),
					onYes = arg_119_0
				})
			end,
			function()
				arg_115_0:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
					index = var_115_17,
					chapterVO = arg_115_0.chapter
				})
			end
		})
	end)
end

function var_0_0.initCommander(arg_121_0, arg_121_1, arg_121_2, arg_121_3)
	local var_121_0 = arg_121_3:getEliteFleetCommanders()[arg_121_1]

	for iter_121_0 = 1, 2 do
		local var_121_1 = var_121_0[iter_121_0]
		local var_121_2 = var_121_1 and getProxy(CommanderProxy):getCommanderById(var_121_1)
		local var_121_3 = arg_121_2:Find("pos" .. iter_121_0)
		local var_121_4 = var_121_3:Find("add")
		local var_121_5 = var_121_3:Find("info")

		setActive(var_121_4, not var_121_2)
		setActive(var_121_5, var_121_2)

		if var_121_2 then
			local var_121_6 = Commander.rarity2Frame(var_121_2:getRarity())

			setImageSprite(var_121_5:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. var_121_6))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. var_121_2:getPainting(), "", var_121_5:Find("mask/icon"))
		end

		local var_121_7 = arg_121_3:wrapEliteFleet(arg_121_1)

		onButton(arg_121_0, var_121_4, function()
			arg_121_0:emit(LevelUIConst.OPEN_COMMANDER_PANEL, var_121_7, arg_121_3, arg_121_1)
		end, SFX_PANEL)
		onButton(arg_121_0, var_121_5, function()
			arg_121_0:emit(LevelUIConst.OPEN_COMMANDER_PANEL, var_121_7, arg_121_3, arg_121_1)
		end, SFX_PANEL)
	end
end

function var_0_0.initSupportAddButton(arg_124_0, arg_124_1, arg_124_2, arg_124_3, arg_124_4)
	local var_124_0 = {}
	local var_124_1 = {}

	for iter_124_0, iter_124_1 in ipairs(arg_124_0.supportFleet) do
		var_124_0[arg_124_0.shipVOs[iter_124_1]] = true

		if not arg_124_2 or arg_124_2 == arg_124_0.shipVOs[iter_124_1]:getTeamType() then
			table.insert(var_124_1, iter_124_1)
		end
	end

	removeAllChildren(arg_124_1)

	local var_124_2 = 0
	local var_124_3 = false
	local var_124_4 = 0

	arg_124_3 = var_0_0.sortTeamLimitation(arg_124_3)

	for iter_124_2 = 1, 3 do
		local var_124_5
		local var_124_6
		local var_124_7 = var_124_1[iter_124_2] and arg_124_0.shipVOs[var_124_1[iter_124_2]] or nil

		if var_124_7 then
			for iter_124_3, iter_124_4 in ipairs(arg_124_3) do
				if ShipType.ContainInLimitBundle(iter_124_4, var_124_7:getShipType()) then
					var_124_5 = var_124_7
					var_124_6 = iter_124_4

					table.remove(arg_124_3, iter_124_3)

					var_124_3 = var_124_3 or iter_124_4 ~= 0

					break
				end
			end
		else
			var_124_6 = arg_124_3[1]

			table.remove(arg_124_3, 1)
		end

		if var_124_6 == 0 then
			var_124_4 = var_124_4 + 1
		end

		local var_124_8 = var_124_5 and cloneTplTo(arg_124_0.tfShipTpl, arg_124_1) or cloneTplTo(arg_124_0.tfEmptyTpl, arg_124_1)

		setActive(var_124_8, true)

		if var_124_5 then
			updateShip(var_124_8, var_124_5)
			setActive(var_124_8:Find("event_block"), var_124_5:getFlag("inEvent"))

			var_124_0[var_124_5] = true
		else
			var_124_2 = var_124_2 + 1
		end

		setActive(var_124_8:Find("ship_type"), var_124_6 and var_124_6 ~= 0)

		if var_124_6 and var_124_6 ~= 0 then
			if type(var_124_6) == "number" then
				local var_124_9 = GetSpriteFromAtlas("shiptype", ShipType.Type2CNLabel(var_124_6))

				setImageSprite(var_124_8:Find("ship_type"), var_124_9, true)
			elseif type(var_124_6) == "string" then
				local var_124_10 = GetSpriteFromAtlas("shiptype", ShipType.BundleType2CNLabel(var_124_6))

				setImageSprite(var_124_8:Find("ship_type"), var_124_10, true)
			end
		end

		local var_124_11 = _.map(arg_124_0.supportFleet, function(arg_125_0)
			return arg_124_0.shipVOs[arg_125_0]
		end)
		local var_124_12 = GetOrAddComponent(var_124_8, typeof(UILongPressTrigger))

		var_124_12.onLongPressed:RemoveAllListeners()

		if var_124_5 and arg_124_0.contextData.tabIndex ~= var_0_0.TabIndex.Adjustment then
			var_124_12.onLongPressed:AddListener(function()
				arg_124_0:onCancelSupport(true)
				arg_124_0:emit(LevelMediator2.ON_SUPPORT_SHIPINFO, {
					shipId = var_124_5.id,
					shipVOs = var_124_11,
					chapter = arg_124_0.chapter
				})
			end)
		end

		local var_124_13 = GetOrAddComponent(var_124_8, "EventTriggerListener")

		var_124_13:RemovePointClickFunc()
		var_124_13:AddPointClickFunc(function(arg_127_0, arg_127_1)
			if arg_127_0 ~= var_124_8.gameObject then
				return
			end

			if arg_124_0.isDraging then
				return
			end

			arg_124_0:onCancelSupport()
			arg_124_0:emit(LevelMediator2.ON_SUPPORT_OPEN_DECK, {
				shipType = var_124_6,
				fleet = var_124_0,
				chapter = arg_124_0.chapter,
				shipVO = var_124_5
			})
		end)
		var_124_13:RemoveBeginDragFunc()
		var_124_13:RemoveDragFunc()
		var_124_13:RemoveDragEndFunc()
	end

	if (var_124_3 == true or var_124_4 == 3) and var_124_2 ~= 3 then
		return true
	else
		return false
	end
end

function var_0_0.updateSpecialOperationTickets(arg_128_0, arg_128_1)
	arg_128_0.spOPTicketItems = arg_128_1 or {}
end

function var_0_0.getLegalSPBuffList(arg_129_0)
	local var_129_0 = arg_129_0.chapter:GetSpItems()

	return _.map(var_129_0, function(arg_130_0)
		return Chapter.GetSPBuffByItem(arg_130_0:GetConfigID())
	end)
end

function var_0_0.initSPOPView(arg_131_0)
	arg_131_0.spPanel = arg_131_0.btnSp:Find("sp_panel")
	arg_131_0.spItem = arg_131_0.btnSp:Find("item")
	arg_131_0.spDesc = arg_131_0.btnSp:Find("desc")
	arg_131_0.spCheckBox = arg_131_0.btnSp:Find("checkbox")
	arg_131_0.spCheckMark = arg_131_0.spCheckBox:Find("mark")
	arg_131_0.spTpl = arg_131_0.spPanel:Find("sp_tpl")
	arg_131_0.spContainer = arg_131_0.spPanel:Find("sp_container")
	arg_131_0.spItemEmptyBlock = arg_131_0.btnSp:Find("empty_block")

	setText(arg_131_0.spItemEmptyBlock, i18n("levelScene_select_noitem"))
	removeAllChildren(arg_131_0.spContainer)

	local var_131_0 = arg_131_0:getLegalSPBuffList()
	local var_131_1 = arg_131_0.chapter:GetActiveSPItemID()

	arg_131_0:setSPBtnFormByBuffCount()

	if #var_131_0 == 0 then
		arg_131_0:clearSPBuff()
	elseif #var_131_0 == 1 then
		local var_131_2 = var_131_0[1]
		local var_131_3 = pg.benefit_buff_template[var_131_2]
		local var_131_4 = ActivityBuff.GetBenefitCondition(var_131_3.benefit_condition)

		assert(var_131_4[1] == "item")

		local var_131_5 = var_131_4[2]

		arg_131_0:setTicketInfo(arg_131_0.btnSp, var_131_5)
		setText(arg_131_0.spDesc, var_131_3.desc)
		onButton(arg_131_0, arg_131_0.btnSp:Find("item"), function()
			arg_131_0:emit(BaseUI.ON_ITEM, var_131_5)
		end)
		onButton(arg_131_0, arg_131_0.btnSp, function()
			local var_133_0 = Chapter.GetSPOperationItemCacheKey(arg_131_0.chapter.id)

			if arg_131_0.spCheckMark.gameObject.activeSelf then
				PlayerPrefs.SetInt(var_133_0, 0)
				arg_131_0:clearSPBuff()
			else
				arg_131_0.spItemID = var_131_5

				PlayerPrefs.SetInt(var_133_0, arg_131_0.spItemID)
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_select_sp"))
				setActive(arg_131_0.spCheckMark, true)
			end
		end)
		setActive(arg_131_0.spCheckMark, var_131_1 == 0)
		triggerButton(arg_131_0.btnSp)
	elseif #var_131_0 > 1 then
		setText(arg_131_0.spDesc, i18n("levelScene_select_SP_OP"))

		for iter_131_0, iter_131_1 in ipairs(var_131_0) do
			local var_131_6 = ActivityBuff.GetBenefitCondition(iter_131_1.benefit_condition)

			assert(var_131_6[1] == "item")

			local var_131_7 = var_131_6[2]
			local var_131_8 = cloneTplTo(arg_131_0.spTpl, arg_131_0.spContainer)

			setText(var_131_8:Find("desc"), iter_131_1.desc)
			arg_131_0:setTicketInfo(var_131_8, var_131_7)
			setActive(var_131_8:Find("block"), false)
			onButton(arg_131_0, var_131_8, function()
				arg_131_0:setSPBuffSelected(iter_131_1.id)
				setActive(arg_131_0.spPanel, false)
			end)
		end

		onButton(arg_131_0, arg_131_0.btnSp, function()
			if arg_131_0.spPanel.gameObject.activeSelf then
				arg_131_0:clearSPBuff()

				local var_135_0 = Chapter.GetSPOperationItemCacheKey(arg_131_0.chapter.id)

				PlayerPrefs.SetInt(var_135_0, 0)
				setActive(arg_131_0.spPanel, false)
			else
				setActive(arg_131_0.spPanel, true)
				setActive(arg_131_0.btnSp:Find("item"), false)
				setText(arg_131_0.spDesc, i18n("levelScene_unselect_SP_OP"))
			end
		end)

		if var_131_1 ~= 0 then
			local var_131_9

			for iter_131_2, iter_131_3 in ipairs(var_131_0) do
				if iter_131_3.id == Chapter.GetSPBuffByItem(var_131_1) then
					var_131_9 = true

					break
				end
			end

			if var_131_9 then
				local var_131_10 = Chapter.GetSPBuffByItem(var_131_1)

				arg_131_0:setSPBuffSelected(var_131_10)
			else
				arg_131_0:clearSPBuff()
			end
		else
			arg_131_0:clearSPBuff()
		end
	end

	setActive(arg_131_0.spPanel, false)
end

function var_0_0.setSPBuffSelected(arg_136_0, arg_136_1)
	local var_136_0 = pg.benefit_buff_template[arg_136_1]
	local var_136_1 = ActivityBuff.GetBenefitCondition(var_136_0.benefit_condition)

	assert(var_136_1[1] == "item")

	arg_136_0.spItemID = var_136_1[2]

	arg_136_0:setTicketInfo(arg_136_0.btnSp, arg_136_0.spItemID)
	setText(arg_136_0.spDesc, var_136_0.desc)

	local var_136_2 = Chapter.GetSPOperationItemCacheKey(arg_136_0.chapter.id)

	PlayerPrefs.SetInt(var_136_2, arg_136_0.spItemID)
end

function var_0_0.clearSPBuff(arg_137_0)
	local var_137_0 = arg_137_0:getLegalSPBuffList()

	arg_137_0.spItemID = nil

	arg_137_0:setSPBtnFormByBuffCount()

	if #var_137_0 == 0 then
		setActive(arg_137_0.btnSp:Find("item"), false)
	elseif #var_137_0 == 1 then
		setActive(arg_137_0.btnSp:Find("item"), true)
		setActive(arg_137_0.spCheckMark, false)
	elseif #var_137_0 > 1 then
		setActive(arg_137_0.btnSp:Find("item"), false)
		setText(arg_137_0.spDesc, i18n("levelScene_select_SP_OP"))
	end
end

function var_0_0.setSPBtnFormByBuffCount(arg_138_0)
	local var_138_0 = arg_138_0:getLegalSPBuffList()

	if #var_138_0 == 0 then
		setActive(arg_138_0.spItemEmptyBlock, true)
		setActive(arg_138_0.spDesc, false)
		setActive(arg_138_0.spCheckBox, false)
		setActive(arg_138_0.btnSp:Find("add"), false)
	elseif #var_138_0 == 1 then
		setActive(arg_138_0.spItemEmptyBlock, false)
		setActive(arg_138_0.spDesc, true)
		setActive(arg_138_0.spCheckBox, true)
		setActive(arg_138_0.btnSp:Find("add"), false)
	elseif #var_138_0 > 1 then
		setActive(arg_138_0.spItemEmptyBlock, false)
		setActive(arg_138_0.spDesc, true)
		setActive(arg_138_0.spCheckBox, false)
		setActive(arg_138_0.btnSp:Find("add"), true)
	end
end

function var_0_0.setTicketInfo(arg_139_0, arg_139_1, arg_139_2)
	local var_139_0

	arg_139_2 = tonumber(arg_139_2)

	for iter_139_0, iter_139_1 in ipairs(arg_139_0.spOPTicketItems) do
		if arg_139_2 == iter_139_1.configId then
			var_139_0 = iter_139_1

			break
		end
	end

	if var_139_0 then
		setText(arg_139_1:Find("item/count"), var_139_0.count)
		GetImageSpriteFromAtlasAsync(var_139_0:getConfig("icon"), "", arg_139_1:Find("item/icon"))
	else
		setText(arg_139_1:Find("item/count"), 0)
		GetImageSpriteFromAtlasAsync(Drop.New({
			type = DROP_TYPE_ITEM,
			id = arg_139_2
		}):getIcon(), "", arg_139_1:Find("item/icon"))
	end

	setActive(arg_139_1:Find("item"), true)
end

function var_0_0.getSPItem(arg_140_0)
	return arg_140_0.spItemID
end

function var_0_0.SetDuty(arg_141_0, arg_141_1, arg_141_2)
	if not arg_141_2 or not arg_141_0.duties then
		return
	end

	if arg_141_0.duties[arg_141_1] == arg_141_2 then
		return
	end

	arg_141_0.duties[arg_141_1] = arg_141_2
	arg_141_0.duties[3 - arg_141_1] = nil

	arg_141_0:RefreshDutyBar()
end

function var_0_0.UpdateDuties(arg_142_0)
	if not arg_142_0.dutyTabEnabled then
		return
	end

	local var_142_0 = 0
	local var_142_1 = 0

	for iter_142_0 = 1, 2 do
		if not arg_142_0:IsListOfFleetEmpty(iter_142_0) then
			var_142_0 = var_142_0 + 1
			var_142_1 = iter_142_0
		end
	end

	if var_142_0 == 0 then
		table.clear(arg_142_0.duties)
	elseif var_142_0 == 1 then
		arg_142_0.duties[var_142_1] = ChapterFleet.DUTY_KILLALL
		arg_142_0.duties[3 - var_142_1] = nil
	elseif var_142_0 == 2 then
		if arg_142_0.duties[1] then
			local var_142_2 = arg_142_0.duties[1]
			local var_142_3 = var_142_2 < 3 and 3 - var_142_2 or 7 - var_142_2

			arg_142_0.duties[2] = var_142_3
		elseif arg_142_0.duties[2] then
			local var_142_4 = arg_142_0.duties[2]
			local var_142_5 = var_142_4 < 3 and 3 - var_142_4 or 7 - var_142_4

			arg_142_0.duties[1] = var_142_5
		else
			arg_142_0.duties[1] = ChapterFleet.DUTY_CLEANPATH
			arg_142_0.duties[2] = ChapterFleet.DUTY_KILLBOSS
		end
	end

	if var_142_1 ~= 0 then
		local var_142_6 = "lastFleetDuty_" .. (arg_142_0.chapter.id or 0)
		local var_142_7 = 0
		local var_142_8 = 8

		for iter_142_1, iter_142_2 in ipairs({
			var_142_1,
			arg_142_0.duties[var_142_1]
		}) do
			var_142_7 = var_142_7 + bit.lshift(iter_142_2, var_142_8 * (iter_142_1 - 1))
		end

		PlayerPrefs.SetInt(var_142_6, var_142_7)
		PlayerPrefs.Save()
	end
end

function var_0_0.RefreshDutyBar(arg_143_0)
	arg_143_0:UpdateDuties()
	arg_143_0:UpdateDutyBar()
end

function var_0_0.UpdateDutyBar(arg_144_0)
	local var_144_0 = arg_144_0.contextData.tabIndex == var_0_0.TabIndex.Duty

	for iter_144_0 = 1, 2 do
		local var_144_1 = arg_144_0._tf:Find(string.format("panel/ShipList/fleet/%d/DutySelect", iter_144_0))

		setActive(var_144_1, var_144_0 and arg_144_0.duties[iter_144_0] ~= nil)
	end

	local var_144_2 = arg_144_0._tf:Find("panel/ShipList/sub/1/DutySelect")

	setActive(var_144_2, var_144_0 and not arg_144_0:IsListOfFleetEmpty(3))

	if not var_144_0 then
		return
	end

	for iter_144_1, iter_144_2 in pairs(arg_144_0.duties) do
		for iter_144_3 = 1, 4 do
			setActive(arg_144_0.dutyItems[iter_144_1][iter_144_3]:Find("Checkmark"), iter_144_3 == iter_144_2)
		end
	end

	local var_144_3 = ys.Battle.BattleState.IsAutoSubActive()

	for iter_144_4 = 1, 2 do
		local var_144_4 = arg_144_0.dutyItems[3][iter_144_4]

		setActive(var_144_4:Find("Checkmark"), iter_144_4 == 1 == var_144_3)
	end
end

function var_0_0.GetOrderedDuties(arg_145_0)
	if not arg_145_0.duties then
		return
	end

	arg_145_0:UpdateDuties()

	local var_145_0 = {}
	local var_145_1 = 1

	for iter_145_0 = 1, 2 do
		if arg_145_0.duties[iter_145_0] then
			var_145_0[var_145_1] = arg_145_0.duties[iter_145_0]
			var_145_1 = var_145_1 + 1
		end
	end

	return var_145_0
end

function var_0_0.SetAutoSub(arg_146_0, arg_146_1)
	arg_146_1 = tobool(arg_146_1)

	if arg_146_1 == ys.Battle.BattleState.IsAutoSubActive() then
		return
	end

	if not AutoBotCommand.autoBotSatisfied() then
		return
	end

	pg.m02:sendNotification(GAME.AUTO_SUB, {
		isActiveSub = not arg_146_1
	})
	arg_146_0:UpdateDutyBar()
end

function var_0_0.GetValidFleets(arg_147_0, arg_147_1)
	if arg_147_0.mode == var_0_2.SELECT then
		local var_147_0 = {}
		local var_147_1 = arg_147_1 and {
			arg_147_1
		} or {
			FleetType.Normal,
			FleetType.Submarine
		}

		for iter_147_0, iter_147_1 in ipairs(var_147_1) do
			local var_147_2 = arg_147_0.selectIds[iter_147_1]

			for iter_147_2, iter_147_3 in ipairs(var_147_2) do
				if iter_147_3 > 0 then
					table.insert(var_147_0, arg_147_0.fleets[iter_147_3])
				end
			end
		end

		return var_147_0
	elseif arg_147_0.mode == var_0_2.EDIT then
		local var_147_3 = {}
		local var_147_4
		local var_147_5

		if arg_147_1 == FleetType.Normal then
			var_147_4 = 1
			var_147_5 = 2
		elseif arg_147_1 == FleetType.Submarine then
			var_147_4 = 3
			var_147_5 = 3
		elseif not arg_147_1 then
			var_147_4 = 1
			var_147_5 = 3
		end

		for iter_147_4 = var_147_4, var_147_5 do
			local var_147_6 = arg_147_0.eliteFleetList[iter_147_4]

			if #var_147_6 > 0 then
				local var_147_7 = {}

				for iter_147_5, iter_147_6 in pairs(arg_147_0.eliteCommanderList[iter_147_4]) do
					table.insert(var_147_7, {
						pos = iter_147_5,
						id = iter_147_6
					})
				end

				local var_147_8 = TypedFleet.New({
					ship_list = var_147_6,
					commanders = var_147_7,
					fleetType = FleetType.Normal
				})

				table.insert(var_147_3, var_147_8)
			end
		end

		return var_147_3
	end
end

function var_0_0.IsListOfFleetEmpty(arg_148_0, arg_148_1)
	if arg_148_1 > 0 and arg_148_1 < 3 and arg_148_1 > arg_148_0:getLimitNums(FleetType.Normal) then
		return true
	elseif arg_148_1 == 3 and arg_148_1 - 2 > arg_148_0:getLimitNums(FleetType.Submarine) then
		return true
	end

	if arg_148_0.mode == var_0_2.SELECT then
		local var_148_0

		if arg_148_1 > 0 and arg_148_1 < 3 then
			var_148_0 = arg_148_0.selectIds[FleetType.Normal][arg_148_1] or 0
		elseif arg_148_1 == 3 then
			var_148_0 = arg_148_0.selectIds[FleetType.Submarine][arg_148_1 - 2] or 0
		end

		return var_148_0 == 0
	elseif arg_148_0.mode == var_0_2.EDIT then
		return #arg_148_0.eliteFleetList[arg_148_1] == 0
	end
end

function var_0_0.GetListFleets(arg_149_0)
	local var_149_0 = {}
	local var_149_1 = arg_149_0:getLimitNums(FleetType.Normal)
	local var_149_2 = arg_149_0:getLimitNums(FleetType.Submarine)

	if arg_149_0.mode == var_0_2.SELECT then
		local var_149_3 = arg_149_0.selectIds[FleetType.Normal]

		for iter_149_0 = 1, var_149_1 do
			local var_149_4 = var_149_3[iter_149_0] or 0

			var_149_0[iter_149_0] = var_149_4 > 0 and arg_149_0.fleets[var_149_4] or nil
		end

		local var_149_5 = arg_149_0.selectIds[FleetType.Submarine]

		for iter_149_1 = 1, var_149_2 do
			local var_149_6 = var_149_5[iter_149_1] or 0

			var_149_0[iter_149_1 + var_149_1] = var_149_6 > 0 and arg_149_0.fleets[var_149_6] or nil
		end
	elseif arg_149_0.mode == var_0_2.EDIT then
		local var_149_7 = {}

		for iter_149_2 = 1, var_149_1 do
			table.insert(var_149_7, iter_149_2)
		end

		for iter_149_3 = 1, var_149_2 do
			table.insert(var_149_7, iter_149_3 + 2)
		end

		for iter_149_4 = 1, #var_149_7 do
			local var_149_8 = var_149_7[iter_149_4]
			local var_149_9
			local var_149_10 = arg_149_0.eliteFleetList[var_149_8]

			if #var_149_10 > 0 then
				local var_149_11 = var_149_8 > 2 and FleetType.Submarine or FleetType.Normal
				local var_149_12 = {}

				for iter_149_5, iter_149_6 in pairs(arg_149_0.eliteCommanderList[var_149_8]) do
					table.insert(var_149_12, {
						pos = iter_149_5,
						id = iter_149_6
					})
				end

				var_149_9 = TypedFleet.New({
					ship_list = var_149_10,
					commanders = var_149_12,
					fleetType = var_149_11
				})
			end

			var_149_0[iter_149_4] = var_149_9
		end
	end

	return var_149_0
end

function var_0_0.IsSelectMode(arg_150_0)
	return arg_150_0.mode == var_0_2.SELECT
end

function var_0_0.SwitchDisplayMode(arg_151_0)
	local var_151_0 = arg_151_0.displayMode == var_0_3.ADDITION_SUPPORT

	setActive(arg_151_0._tf:Find("panel/ShipList/Line"), not var_151_0)
	setActive(arg_151_0._tf:Find("panel/ShipList/support"), var_151_0)

	local var_151_1 = arg_151_0._tf:Find("panel/ShipList"):GetComponent(typeof(VerticalLayoutGroup))
	local var_151_2 = var_151_1.padding

	var_151_2.top = var_151_0 and 9 or 20
	var_151_2.bottom = var_151_0 and 14 or 25
	var_151_1.padding = var_151_2
	var_151_1.spacing = var_151_0 and 13 or 20
end

function var_0_0.sortTeamLimitation(arg_152_0)
	arg_152_0 = Clone(arg_152_0)

	table.sort(arg_152_0, function(arg_153_0, arg_153_1)
		local var_153_0 = type(arg_153_0)
		local var_153_1 = type(arg_153_1)

		if var_153_0 == var_153_1 then
			return var_153_1 < var_153_0
		elseif arg_153_1 == 0 or var_153_1 == "string" and arg_153_0 ~= 0 then
			return true
		else
			return false
		end
	end)

	return arg_152_0
end

return var_0_0
