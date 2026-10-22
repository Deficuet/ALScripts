local var_0_0 = class("ChapterPreCombatLayer", import("..base.BaseUI"))
local var_0_1 = import("..ship.FormationUI")
local var_0_2 = {
	[99] = true
}

var_0_0.optionsPath = {
	"adapt/top/option"
}

function var_0_0.getUIName(arg_1_0)
	return "ChapterPreCombatUI"
end

function var_0_0.ResUISettings(arg_2_0)
	return true
end

function var_0_0.getResource(arg_3_0)
	local var_3_0 = ResList.ChapterPreCombatLayerResConst.GetConstResource()

	return table.insertto(var_3_0, var_0_0.super.getResource(arg_3_0))
end

function var_0_0.downloadChapterPreCombatRes(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = ResList.ChapterPreCombatLayerResConst.GetResource(arg_4_1)

	SplitPackConst.DownloadByLuaArr(var_4_0, function()
		if arg_4_0.exited or arg_4_0.chapter ~= arg_4_1 then
			return
		end

		arg_4_2()
	end)
end

function var_0_0.init(arg_6_0)
	arg_6_0._startBtn = arg_6_0.rtAdapt:Find("right/start")
	arg_6_0._popup = arg_6_0.rtAdapt:Find("right/popup")
	arg_6_0._costText = arg_6_0.rtAdapt:Find("right/popup/Text")
	arg_6_0._costTip = arg_6_0.rtAdapt:Find("right/popup/tip")
	arg_6_0._extraCostBuffIcon = arg_6_0.rtAdapt:Find("right/operation_buff_icon")
	arg_6_0._backBtn = arg_6_0.rtAdapt:Find("top/back_btn")
	arg_6_0._moveLayer = arg_6_0._tf:Find("moveLayer")

	local var_6_0 = arg_6_0.rtAdapt:Find("middle")

	arg_6_0._mainGS = var_6_0:Find("gear_score/main/Text")
	arg_6_0._vanguardGS = var_6_0:Find("gear_score/vanguard/Text")

	setText(arg_6_0._mainGS, 0)
	setText(arg_6_0._vanguardGS, 0)

	arg_6_0._gridTFs = {
		vanguard = {},
		main = {}
	}
	arg_6_0._gridFrame = var_6_0:Find("mask/GridFrame")

	for iter_6_0 = 1, 3 do
		arg_6_0._gridTFs[TeamType.Vanguard][iter_6_0] = arg_6_0._gridFrame:Find("vanguard_" .. iter_6_0)
		arg_6_0._gridTFs[TeamType.Main][iter_6_0] = arg_6_0._gridFrame:Find("main_" .. iter_6_0)
	end

	arg_6_0._heroContainer = var_6_0:Find("HeroContainer")
	arg_6_0._strategy = var_6_0:Find("strategy")

	setActive(arg_6_0._strategy, true)

	arg_6_0._spoilsContainer = arg_6_0.rtAdapt:Find("right/infomation/spoils/items/items_container")
	arg_6_0._goals = arg_6_0.rtAdapt:Find("right/infomation/goal")
	arg_6_0._item = arg_6_0:getTpl("right/infomation/spoils/items/item_tpl", arg_6_0.rtAdapt)
	arg_6_0._heroInfo = arg_6_0:getTpl("heroInfo")
	arg_6_0._starTpl = arg_6_0:getTpl("star_tpl")
	arg_6_0._middle = arg_6_0.rtAdapt:Find("middle")
	arg_6_0._right = arg_6_0.rtAdapt:Find("right")
	arg_6_0._formationLogic = BaseFormation.New(arg_6_0._tf, arg_6_0._heroContainer, arg_6_0._heroInfo, arg_6_0._gridTFs)

	local var_6_1 = {
		Shift = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end
	}

	setmetatable(var_6_1, arg_6_0._formationLogic)
	setText(arg_6_0.rtAdapt:Find("middle/gear_score/vanguard/line/Image/Text1"), i18n("pre_combat_vanguard"))
	setText(arg_6_0.rtAdapt:Find("middle/gear_score/main/line/Image/Text1"), i18n("pre_combat_main"))

	arg_6_0._fleet = arg_6_0.rtAdapt:Find("middle/fleet")

	setText(arg_6_0._fleet:Find("title_bg/Text"), i18n("pre_combat_team"))

	arg_6_0._ship_tpl = arg_6_0._fleet:Find("shiptpl")
	arg_6_0._empty_tpl = arg_6_0._fleet:Find("emptytpl")

	setActive(arg_6_0._ship_tpl, false)
	setActive(arg_6_0._empty_tpl, false)

	arg_6_0._autoToggle = arg_6_0.rtAdapt:Find("middle/auto_toggle")
	arg_6_0._autoSubToggle = arg_6_0.rtAdapt:Find("middle/sub_toggle_container/sub_toggle")
	arg_6_0.topPanel = arg_6_0.rtAdapt:Find("top")
	arg_6_0.strategyInfo = arg_6_0._tf:Find("strategy_info")

	setActive(arg_6_0.strategyInfo, false)

	arg_6_0._operaionBuffTips = arg_6_0._extraCostBuffIcon:Find("popup")

	setAnchoredPosition(arg_6_0._middle, {
		x = -840
	})
	setAnchoredPosition(arg_6_0._right, {
		x = 470
	})
	arg_6_0:Register()
end

function var_0_0.uiStartAnimating(arg_8_0)
	setAnchoredPosition(arg_8_0.topPanel, {
		y = 100
	})

	local var_8_0 = 0
	local var_8_1 = 0.3

	shiftPanel(arg_8_0._middle, 0, nil, var_8_1, var_8_0, true, true)
	shiftPanel(arg_8_0._right, 0, nil, var_8_1, var_8_0, true, true, nil)
	shiftPanel(arg_8_0.topPanel, nil, 0, var_8_1, var_8_0, true, true, nil, nil)
end

function var_0_0.uiExitAnimating(arg_9_0)
	local var_9_0 = 0
	local var_9_1 = 0.3

	shiftPanel(arg_9_0._middle, -840, nil, var_9_1, var_9_0, true, true)
	shiftPanel(arg_9_0._right, 470, nil, var_9_1, var_9_0, true, true)
	shiftPanel(arg_9_0.topPanel, nil, arg_9_0.topPanel.rect.height, var_9_1, var_9_0, true, true, nil, nil)
end

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0._backBtn, function()
		GetOrAddComponent(arg_10_0._tf, typeof(CanvasGroup)).interactable = false

		arg_10_0:uiExitAnimating()
		LeanTween.delayedCall(0.3, System.Action(function()
			arg_10_0:emit(var_0_0.ON_CLOSE)
		end))
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0._startBtn, function()
		arg_10_0:emit(ChapterPreCombatMediator.ON_START)
	end, SFX_UI_WEIGHANCHOR)
	onToggle(arg_10_0, arg_10_0._autoToggle, function(arg_14_0)
		arg_10_0:emit(ChapterPreCombatMediator.ON_AUTO, {
			isOn = not arg_14_0,
			toggle = arg_10_0._autoToggle
		})

		if arg_14_0 and arg_10_0.subUseable == true then
			setActive(arg_10_0._autoSubToggle, true)
			onToggle(arg_10_0, arg_10_0._autoSubToggle, function(arg_15_0)
				arg_10_0:emit(ChapterPreCombatMediator.ON_SUB_AUTO, {
					isOn = not arg_15_0,
					toggle = arg_10_0._autoSubToggle
				})
			end, SFX_PANEL, SFX_PANEL)
			triggerToggle(arg_10_0._autoSubToggle, ys.Battle.BattleState.IsAutoSubActive())
		else
			setActive(arg_10_0._autoSubToggle, false)
		end
	end, SFX_PANEL, SFX_PANEL)
	pg.UIMgr.GetInstance():OverlayPanel(arg_10_0._tf)
	onNextTick(function()
		if arg_10_0.exited then
			return
		end

		triggerToggle(arg_10_0._autoToggle, ys.Battle.BattleState.IsAutoBotActive())
	end)
	setAnchoredPosition(arg_10_0.topPanel, {
		y = arg_10_0.topPanel.rect.height
	})
	onNextTick(function()
		arg_10_0:uiStartAnimating()
	end)
	onButton(arg_10_0, arg_10_0.rtAdapt:Find("middle/gear_score/vanguard/SonarTip"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.fleet_antisub_range_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0._costTip, function()
		local var_19_0 = arg_10_0.chapter.fleet
		local var_19_1 = arg_10_0.chapter:getStageId(var_19_0.line.row, var_19_0.line.column)
		local var_19_2, var_19_3, var_19_4 = arg_10_0.chapter:isOverFleetCost(var_19_0, var_19_1)

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n("use_oil_limit_help", var_19_4, var_19_3)
		})
	end)
end

function var_0_0.Register(arg_20_0)
	arg_20_0._formationLogic:AddHeroInfoModify(function(arg_21_0, arg_21_1, arg_21_2)
		setAnchoredPosition(arg_21_0, {
			x = 0,
			y = 0
		})
		SetActive(arg_21_0, true)

		arg_21_0.name = "info"

		local var_21_0 = arg_21_0:Find("info")
		local var_21_1 = var_21_0:Find("stars")
		local var_21_2 = arg_21_1:getEnergy() <= Ship.ENERGY_MID
		local var_21_3 = var_21_0:Find("energy")

		if var_21_2 then
			local var_21_4, var_21_5 = arg_21_1:getEnergyPrint()
			local var_21_6 = GetSpriteFromAtlas("energy", var_21_4)

			if not var_21_6 then
				warning("找不到疲劳")
			end

			setImageSprite(var_21_3, var_21_6)
		end

		setActive(var_21_3, var_21_2)

		local var_21_7 = arg_21_1:getStar()

		for iter_21_0 = 1, var_21_7 do
			cloneTplTo(arg_20_0._starTpl, var_21_1)
		end

		local var_21_8 = GetSpriteFromAtlas("shiptype", shipType2print(arg_21_1:getShipType()))

		if not var_21_8 then
			warning("找不到船形, shipConfigId: " .. arg_21_1.configId)
		end

		setImageSprite(var_21_0:Find("type"), var_21_8, true)
		setText(var_21_0:Find("frame/lv_contain/lv"), arg_21_1.level)

		local var_21_9 = var_21_0:Find("blood")
		local var_21_10 = var_21_9:Find("fillarea/green")
		local var_21_11 = var_21_9:Find("fillarea/red")

		setActive(var_21_10, arg_21_1.hpRant >= ChapterConst.HpGreen)
		setActive(var_21_11, arg_21_1.hpRant < ChapterConst.HpGreen)

		;(arg_21_1.hpRant >= ChapterConst.HpGreen and var_21_10 or var_21_11):GetComponent("Image").fillAmount = arg_21_1.hpRant * 0.0001

		arg_21_2:SetVisible(arg_21_1.hpRant > 0)
		SetActive(arg_21_0, arg_21_1.hpRant > 0)

		local var_21_12 = getProxy(ActivityProxy):getBuffShipList()[arg_21_1:getGroupId()]
		local var_21_13 = var_21_0:Find("expbuff")

		setActive(var_21_13, var_21_12 ~= nil)

		if var_21_12 then
			local var_21_14 = var_21_12 / 100
			local var_21_15 = var_21_12 % 100
			local var_21_16 = tostring(var_21_14)

			if var_21_15 > 0 then
				var_21_16 = var_21_16 .. "." .. tostring(var_21_15)
			end

			setText(var_21_13:Find("text"), string.format("EXP +%s%%", var_21_16))
		end
	end)
	arg_20_0._formationLogic:AddShiftOnly(function(arg_22_0)
		arg_20_0:updateView(false)
	end)
	arg_20_0._formationLogic:AddEndDrag(function()
		arg_20_0:emit(ChapterPreCombatMediator.ON_SWITCH_SHIP, arg_20_0.chapter.fleet)
	end)
	arg_20_0._formationLogic:AddCheckRemove(function(arg_24_0, arg_24_1)
		arg_24_0()
	end)
	arg_20_0._formationLogic:AddCheckSwitch(function(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
		local var_25_0 = arg_25_3:getTeamByName(arg_25_4)

		if arg_25_3.ships[var_25_0[arg_25_2]].hpRant == 0 then
			return
		end

		arg_25_0()
	end)
	arg_20_0._formationLogic:AddCheckBeginDrag(function(arg_26_0, arg_26_1, arg_26_2)
		return arg_26_0.hpRant > 0
	end)
end

function var_0_0.setPlayerInfo(arg_27_0, arg_27_1)
	return
end

function var_0_0.updateChapter(arg_28_0, arg_28_1)
	arg_28_0.chapter = arg_28_1

	arg_28_0:downloadChapterPreCombatRes(arg_28_1, function()
		arg_28_0:updateChapterAfterDownload(arg_28_1)
	end)
end

function var_0_0.updateChapterAfterDownload(arg_30_0, arg_30_1)
	if arg_30_0.chapter ~= arg_30_1 then
		return
	end

	local var_30_0 = arg_30_0.chapter.fleet

	arg_30_0._formationLogic:SetFleetVO(var_30_0)

	local var_30_1 = var_30_0.ships

	arg_30_0._formationLogic:SetShipVOs(var_30_1)
	arg_30_0:updateView(true)
end

function var_0_0.setSubFlag(arg_31_0, arg_31_1)
	arg_31_0.subUseable = arg_31_1 or false
end

function var_0_0.updateView(arg_32_0, arg_32_1)
	arg_32_0._formationLogic:ResetGrid(TeamType.Vanguard, true)
	arg_32_0._formationLogic:ResetGrid(TeamType.Main, true)
	SetActive(arg_32_0._gridTFs[TeamType.Main][1]:Find("flag"), true)

	if arg_32_1 then
		local var_32_0 = arg_32_0.chapter.fleet
		local var_32_1 = arg_32_0.chapter:getStageId(var_32_0.line.row, var_32_0.line.column)

		arg_32_0:updateStageView(var_32_1)
		arg_32_0._formationLogic:LoadAllCharacter()
	else
		arg_32_0._formationLogic:SetAllCharacterPos()
	end

	arg_32_0:updateBattleFleetView()
	arg_32_0:updateStrategyIcon()
	arg_32_0:displayFleetInfo()
end

function var_0_0.updateStageView(arg_33_0, arg_33_1)
	local var_33_0 = pg.expedition_data_template[arg_33_1]

	assert(var_33_0, "expedition_data_template not exist: " .. arg_33_1)

	local var_33_1 = var_33_0.limit_type
	local var_33_2 = var_33_0.time_limit
	local var_33_3 = var_33_0.sink_limit
	local var_33_4 = Clone(var_33_0.award_display)
	local var_33_5 = checkExist(pg.expedition_activity_template[arg_33_1], {
		"pt_drop_display"
	})

	if var_33_5 and type(var_33_5) == "table" then
		local var_33_6 = getProxy(ActivityProxy)

		for iter_33_0 = #var_33_5, 1, -1 do
			local var_33_7, var_33_8, var_33_9, var_33_10 = unpack(var_33_5[iter_33_0])
			local var_33_11 = var_33_6:getActivityById(var_33_7)

			if var_33_11 and not var_33_11:isEnd() then
				if var_33_8 == DROP_TYPE_RESOURCE then
					table.insert(var_33_4, 1, {
						DROP_TYPE_ITEM,
						id2ItemId(var_33_9)
					})
				else
					table.insert(var_33_4, 1, {
						var_33_8,
						var_33_9
					})
				end
			end
		end
	end

	local var_33_12 = UIItemList.New(arg_33_0._spoilsContainer, arg_33_0._item)

	var_33_12:make(function(arg_34_0, arg_34_1, arg_34_2)
		local var_34_0 = arg_34_2
		local var_34_1 = var_33_4[arg_34_1 + 1]
		local var_34_2 = {
			type = var_34_1[1],
			id = var_34_1[2]
		}

		updateDrop(var_34_0, var_34_2)
		onButton(arg_33_0, var_34_0, function()
			local var_35_0 = Item.getConfigData(var_34_1[2])

			if var_35_0 and var_0_2[var_35_0.type] then
				local function var_35_1(arg_36_0)
					local var_36_0 = var_35_0.display_icon
					local var_36_1 = {}

					for iter_36_0, iter_36_1 in ipairs(var_36_0) do
						local var_36_2 = iter_36_1[1]
						local var_36_3 = iter_36_1[2]
						local var_36_4 = var_36_2 == DROP_TYPE_SHIP and not table.contains(arg_36_0, var_36_3)

						var_36_1[#var_36_1 + 1] = {
							type = var_36_2,
							id = var_36_3,
							anonymous = var_36_4
						}
					end

					arg_33_0:emit(var_0_0.ON_DROP_LIST, {
						item2Row = true,
						itemList = var_36_1,
						content = var_35_0.display
					})
				end

				arg_33_0:emit(ChapterPreCombatMediator.GET_CHAPTER_DROP_SHIP_LIST, arg_33_0.chapter.id, var_35_1)
			else
				arg_33_0:emit(var_0_0.ON_DROP, var_34_2)
			end
		end, SFX_PANEL)
	end)
	var_33_12:align(math.min(#var_33_4, 6))

	local function var_33_13(arg_37_0, arg_37_1)
		if type(arg_37_0) == "table" then
			setActive(arg_37_1, true)

			local var_37_0 = i18n(PreCombatLayer.ObjectiveList[arg_37_0[1]], arg_37_0[2])

			setWidgetText(arg_37_1, var_37_0)
		else
			setActive(arg_37_1, false)
		end
	end

	local var_33_14 = {
		arg_33_0._goals:Find("goal_tpl"),
		arg_33_0._goals:Find("goal_sink"),
		arg_33_0._goals:Find("goal_time")
	}
	local var_33_15 = {
		var_33_0.objective_1,
		var_33_0.objective_2,
		var_33_0.objective_3
	}
	local var_33_16 = 1

	for iter_33_1, iter_33_2 in ipairs(var_33_15) do
		if type(iter_33_2) ~= "string" then
			var_33_13(iter_33_2, var_33_14[var_33_16])

			var_33_16 = var_33_16 + 1
		end
	end

	for iter_33_3 = var_33_16, #var_33_14 do
		var_33_13("", var_33_14[iter_33_3])
	end
end

function var_0_0.updateBattleFleetView(arg_38_0)
	local function var_38_0(arg_39_0, arg_39_1)
		removeAllChildren(arg_39_0)

		for iter_39_0 = 1, 3 do
			if arg_39_1[iter_39_0] then
				local var_39_0 = cloneTplTo(arg_38_0._ship_tpl, arg_39_0)

				updateShip(var_39_0, arg_39_1[iter_39_0])

				local var_39_1 = arg_39_1[iter_39_0].hpRant
				local var_39_2 = var_39_0:Find("blood")
				local var_39_3 = var_39_0:Find("blood/fillarea/green")
				local var_39_4 = var_39_0:Find("blood/fillarea/red")

				setActive(var_39_3, var_39_1 >= ChapterConst.HpGreen)
				setActive(var_39_4, var_39_1 < ChapterConst.HpGreen)

				;(var_39_1 >= ChapterConst.HpGreen and var_39_3 or var_39_4):GetComponent("Image").fillAmount = var_39_1 * 0.0001

				setActive(var_39_0:Find("broken"), var_39_1 == 0)
			end
		end
	end

	local var_38_1 = arg_38_0.chapter.fleet

	var_38_0(arg_38_0._fleet:Find("main"), var_38_1:getShipsByTeam(TeamType.Main, true))
	var_38_0(arg_38_0._fleet:Find("vanguard"), var_38_1:getShipsByTeam(TeamType.Vanguard, true))
end

function var_0_0.displayFleetInfo(arg_40_0)
	local var_40_0 = arg_40_0.chapter.fleet
	local var_40_1 = arg_40_0.chapter:getStageId(var_40_0.line.row, var_40_0.line.column)
	local var_40_2 = var_40_0:getCommanders()
	local var_40_3 = _.reduce(var_40_0:getShipsByTeam(TeamType.Vanguard, false), 0, function(arg_41_0, arg_41_1)
		return arg_41_0 + arg_41_1:getShipCombatPower(var_40_2)
	end)
	local var_40_4 = _.reduce(var_40_0:getShipsByTeam(TeamType.Main, false), 0, function(arg_42_0, arg_42_1)
		return arg_42_0 + arg_42_1:getShipCombatPower(var_40_2)
	end)
	local var_40_5 = 0

	for iter_40_0, iter_40_1 in ipairs({
		arg_40_0.chapter:getFleetCost(var_40_0, var_40_1)
	}) do
		var_40_5 = var_40_5 + iter_40_1.oil
	end

	local var_40_6 = arg_40_0.chapter:isOverFleetCost(var_40_0, var_40_1)

	setActive(arg_40_0._popup, true)
	setActive(arg_40_0._costTip, var_40_6)
	setTextColor(arg_40_0._costText, var_40_6 and Color(0.9803921568627451, 0.39215686274509803, 0.39215686274509803) or Color.white)
	var_0_1.tweenNumText(arg_40_0._costText, var_40_5)
	var_0_1.tweenNumText(arg_40_0._vanguardGS, var_40_3)
	var_0_1.tweenNumText(arg_40_0._mainGS, var_40_4)

	local var_40_7, var_40_8 = arg_40_0.chapter:GetExtraCostRate()

	setActive(arg_40_0._extraCostBuffIcon, #var_40_8 > 0)

	for iter_40_2, iter_40_3 in ipairs(var_40_8) do
		if iter_40_3.benefit_type == Chapter.OPERATION_BUFF_TYPE_COST then
			setText(arg_40_0._extraCostBuffIcon:Find("text_cost"), tonumber(iter_40_3.benefit_effect) * 0.01 + 1)
		elseif iter_40_3.benefit_type == Chapter.OPERATION_BUFF_TYPE_EXP then
			setText(arg_40_0._extraCostBuffIcon:Find("text_reward"), tonumber(iter_40_3.benefit_effect) * 0.01 + 1)
		elseif iter_40_3.benefit_type == Chapter.OPERATION_BUFF_TYPE_DESC then
			onButton(arg_40_0, arg_40_0._extraCostBuffIcon, function()
				local var_43_0 = ActivityBuff.GetBenefitCondition(iter_40_3.benefit_condition)

				assert(var_43_0[1] == "item")

				local var_43_1 = var_43_0[2]
				local var_43_2 = pg.strategy_data_template[iter_40_3.id]

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = true,
					type = MSGBOX_TYPE_SINGLE_ITEM,
					drop = {
						count = 1,
						type = DROP_TYPE_ITEM,
						id = var_43_1
					},
					intro = var_43_2.desc
				})
			end)
		end
	end

	local var_40_9 = arg_40_0.rtAdapt:Find("middle/gear_score/vanguard")
	local var_40_10 = ChapterFleet.StaticTransformChapterFleet2Fleet(var_40_0):GetFleetSonarRange()

	setActive(var_40_9:Find("SonarActive"), var_40_10 > 0)
	setActive(var_40_9:Find("SonarInactive"), var_40_10 <= 0)

	if var_40_10 > 0 then
		setText(var_40_9:Find("SonarActive/Text"), math.floor(var_40_10))
	end
end

function var_0_0.updateStrategyIcon(arg_44_0)
	local var_44_0 = arg_44_0.chapter.fleet:getStrategies()
	local var_44_1 = _.detect(var_44_0, function(arg_45_0)
		return arg_45_0.id == ChapterConst.StrategyRepair
	end)
	local var_44_2 = pg.strategy_data_template[var_44_1.id]

	GetImageSpriteFromAtlasAsync("strategyicon/" .. var_44_2.icon, "", arg_44_0._strategy:Find("icon"))
	onButton(arg_44_0, arg_44_0._strategy, function()
		arg_44_0:displayStrategyInfo(var_44_1)
	end, SFX_PANEL)
	setText(arg_44_0._strategy:Find("nums"), var_44_1.count)
	setActive(arg_44_0._strategy:Find("mask"), var_44_1.count == 0)
	setActive(arg_44_0._strategy:Find("selected"), false)

	local var_44_3 = arg_44_0.rtAdapt:Find("middle/formation_list")
	local var_44_4 = var_44_3:Find("formation")

	setActive(var_44_4, false)

	local var_44_5 = ChapterConst.StrategyForms
	local var_44_6 = {}
	local var_44_7 = arg_44_0.chapter.fleet:getFormationStg()

	table.insert(var_44_6, 1, {
		id = var_44_7
	})

	local var_44_8 = UIItemList.New(var_44_3, var_44_4)

	var_44_8:make(function(arg_47_0, arg_47_1, arg_47_2)
		if arg_47_0 == UIItemList.EventUpdate then
			local var_47_0 = var_44_6[arg_47_1 + 1]
			local var_47_1 = pg.strategy_data_template[var_47_0.id]

			if var_47_1.type ~= ChapterConst.StgTypeForm then
				return
			end

			GetImageSpriteFromAtlasAsync("strategyicon/" .. var_47_1.icon, "", arg_47_2:Find("icon"))
			onButton(arg_44_0, arg_47_2, function()
				if var_47_1.type == ChapterConst.StgTypeForm then
					local var_48_0 = arg_44_0.chapter.fleet:getNextStgUser(var_47_0.id)
					local var_48_1 = table.indexof(var_44_5, var_47_0.id)

					arg_44_0:emit(ChapterPreCombatMediator.ON_OP, {
						type = ChapterConst.OpStrategy,
						id = var_48_0,
						arg1 = var_44_5[var_48_1 % #var_44_5 + 1]
					})
				end
			end, SFX_PANEL)
			setText(arg_47_2:Find("nums"), "")
			setActive(arg_47_2:Find("mask"), false)
			setActive(arg_47_2:Find("selected"), false)
		end
	end)
	var_44_8:align(#var_44_6)
end

function var_0_0.displayStrategyInfo(arg_49_0, arg_49_1)
	arg_49_0.strategyPanel = arg_49_0.strategyPanel or StrategyPanel.New(arg_49_0.strategyInfo)

	arg_49_0.strategyPanel:attach(arg_49_0)
	arg_49_0.strategyPanel:set(arg_49_1)
	pg.UIMgr.GetInstance():BlurPanel(arg_49_0.strategyPanel._tf)

	function arg_49_0.strategyPanel.onConfirm()
		local var_50_0 = arg_49_0.chapter.fleet
		local var_50_1 = pg.strategy_data_template[arg_49_1.id]

		if not var_50_0:canUseStrategy(arg_49_1) then
			return
		end

		local var_50_2 = var_50_0:getNextStgUser(arg_49_1.id)

		arg_49_0:emit(ChapterPreCombatMediator.ON_OP, {
			type = ChapterConst.OpStrategy,
			id = var_50_2,
			arg1 = arg_49_1.id
		})
		arg_49_0:hideStrategyInfo()
	end

	function arg_49_0.strategyPanel.onCancel()
		arg_49_0:hideStrategyInfo()
	end
end

function var_0_0.hideStrategyInfo(arg_52_0)
	if arg_52_0.strategyPanel then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_52_0.strategyPanel._tf)
		arg_52_0.strategyPanel:detach()
	end
end

function var_0_0.onBackPressed(arg_53_0)
	if arg_53_0.strategyPanel and arg_53_0.strategyPanel._go and isActive(arg_53_0.strategyPanel._go) then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		arg_53_0:hideStrategyInfo()
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		triggerButton(arg_53_0._backBtn)
	end
end

function var_0_0.willExit(arg_54_0)
	if arg_54_0.strategyPanel and arg_54_0.strategyPanel._go and isActive(arg_54_0.strategyPanel._go) then
		arg_54_0:hideStrategyInfo()
	end

	arg_54_0._formationLogic:Destroy()

	arg_54_0._formationLogic = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_54_0._tf)
end

return var_0_0
