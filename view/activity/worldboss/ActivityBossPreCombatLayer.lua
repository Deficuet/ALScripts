local var_0_0 = class("ActivityBossPreCombatLayer", import("view.battle.PreCombatLayer"))
local var_0_1 = import("view.ship.FormationUI")
local var_0_2 = {
	[99] = true
}

function var_0_0.getUIName(arg_1_0)
	return "ActivityBossPrecombatUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:CommonInit()
	setActive(arg_2_0._fleetInfo, true)

	arg_2_0._ticket = arg_2_0._startBtn:Find("ticket")
	arg_2_0._bonus = arg_2_0._startBtn:Find("bonus")
	arg_2_0._costTip = arg_2_0._startBtn:Find("cost_container/popup/tip")
	arg_2_0._continuousBtn = arg_2_0:findTF("right/multiple")

	setText(arg_2_0._continuousBtn:Find("text"), i18n("multiple_sorties_title"))
	setText(arg_2_0._continuousBtn:Find("text_en"), i18n("multiple_sorties_title_eng"))
	setText(arg_2_0._ticket:Find("title"), i18n("ex_pass_use"))
	setText(arg_2_0._bonus:Find("title"), i18n("expedition_extra_drop_tip"))

	arg_2_0._formationLogic = BaseFormation.New(arg_2_0._tf, arg_2_0._heroContainer, arg_2_0._heroInfo, arg_2_0._gridTFs)

	arg_2_0:Register()
end

function var_0_0.Register(arg_3_0)
	arg_3_0._formationLogic:AddLoadComplete(function()
		if arg_3_0._currentForm ~= PreCombatLayer.FORM_EDIT then
			arg_3_0._formationLogic:SwitchToPreviewMode()
		end
	end)
	arg_3_0._formationLogic:AddHeroInfoModify(function(arg_5_0, arg_5_1)
		setAnchoredPosition(arg_5_0, {
			x = 0,
			y = 0
		})
		SetActive(arg_5_0, true)

		arg_5_0.name = "info"

		local var_5_0 = findTF(arg_5_0, "info")
		local var_5_1 = findTF(var_5_0, "stars")
		local var_5_2 = arg_5_1.energy <= Ship.ENERGY_MID
		local var_5_3 = findTF(var_5_0, "energy")

		if var_5_2 then
			local var_5_4, var_5_5 = arg_5_1:getEnergyPrint()
			local var_5_6 = GetSpriteFromAtlas("energy", var_5_4)

			if not var_5_6 then
				warning("找不到疲劳")
			end

			setImageSprite(var_5_3, var_5_6)
		end

		local var_5_7 = arg_3_0.contextData.system
		local var_5_8 = pg.battle_cost_template[var_5_7]

		setActive(var_5_3, var_5_2 and var_5_8.enter_energy_cost > 0)

		local var_5_9 = arg_5_1:getStar()

		for iter_5_0 = 1, var_5_9 do
			cloneTplTo(arg_3_0._starTpl, var_5_1)
		end

		local var_5_10 = GetSpriteFromAtlas("shiptype", shipType2print(arg_5_1:getShipType()))

		if not var_5_10 then
			warning("找不到船形, shipConfigId: " .. arg_5_1.configId)
		end

		setImageSprite(findTF(var_5_0, "type"), var_5_10, true)
		setText(findTF(var_5_0, "frame/lv_contain/lv"), arg_5_1.level)

		if var_5_8.ship_exp_award > 0 then
			local var_5_11 = getProxy(ActivityProxy):getBuffShipList()[arg_5_1:getGroupId()]
			local var_5_12 = var_5_0:Find("expbuff")

			setActive(var_5_12, var_5_11 ~= nil)

			if var_5_11 then
				local var_5_13 = var_5_11 / 100
				local var_5_14 = var_5_11 % 100
				local var_5_15 = tostring(var_5_13)

				if var_5_14 > 0 then
					var_5_15 = var_5_15 .. "." .. tostring(var_5_14)
				end

				setText(var_5_12:Find("text"), string.format("EXP +%s%%", var_5_15))
			end
		else
			local var_5_16 = var_5_0:Find("expbuff")

			setActive(var_5_16, false)
		end
	end)
	arg_3_0._formationLogic:AddLongPress(function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
		arg_3_0:emit(ActivityBossPreCombatMediator.OPEN_SHIP_INFO, arg_6_1.id, arg_6_2)
	end)
	arg_3_0._formationLogic:AddBeginDrag(function(arg_7_0)
		local var_7_0 = findTF(arg_7_0, "info")

		SetActive(var_7_0, false)
	end)
	arg_3_0._formationLogic:AddEndDrag(function(arg_8_0)
		local var_8_0 = findTF(arg_8_0, "info")

		SetActive(var_8_0, true)
	end)
	arg_3_0._formationLogic:AddClick(function(arg_9_0, arg_9_1, arg_9_2)
		return
	end)
	arg_3_0._formationLogic:AddShiftOnly(function(arg_10_0)
		arg_3_0:emit(ActivityBossPreCombatMediator.CHANGE_FLEET_SHIPS_ORDER, arg_10_0)
	end)
	arg_3_0._formationLogic:AddRemoveShip(function(arg_11_0, arg_11_1)
		return
	end)
	arg_3_0._formationLogic:AddCheckRemove(function(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
		arg_12_0()
	end)
	arg_3_0._formationLogic:AddSwitchToDisplayMode(function()
		arg_3_0._currentForm = PreCombatLayer.FORM_EDIT
		arg_3_0._checkBtn:GetComponent("Button").interactable = true

		arg_3_0:SetFleetStepper()
		setActive(arg_3_0._checkBtn:Find("save"), true)
		setActive(arg_3_0._checkBtn:Find("edit"), false)
	end)
	arg_3_0._formationLogic:AddSwitchToShiftMode(function()
		arg_3_0:SetFleetStepper()

		arg_3_0._checkBtn:GetComponent("Button").interactable = false
	end)
	arg_3_0._formationLogic:AddSwitchToPreviewMode(function()
		arg_3_0._currentForm = PreCombatLayer.FORM_PREVIEW
		arg_3_0._checkBtn:GetComponent("Button").interactable = true

		arg_3_0:SetFleetStepper()
		setActive(arg_3_0._checkBtn:Find("save"), false)
		setActive(arg_3_0._checkBtn:Find("edit"), true)
	end)
	arg_3_0._formationLogic:AddGridTipClick(function(arg_16_0, arg_16_1)
		return
	end)

	if arg_3_0.contextData.system == SYSTEM_ACT_BOSS then
		arg_3_0._formationLogic:DisableTip()
	end
end

function var_0_0.SetPlayerInfo(arg_17_0, arg_17_1)
	return
end

function var_0_0.SetSubFlag(arg_18_0, arg_18_1)
	arg_18_0._subUseable = arg_18_1 or false
end

function var_0_0.SetShips(arg_19_0, arg_19_1)
	arg_19_0._shipVOs = arg_19_1

	arg_19_0._formationLogic:SetShipVOs(arg_19_0._shipVOs)
end

function var_0_0.SetStageID(arg_20_0, arg_20_1)
	removeAllChildren(arg_20_0._spoilsContainer)

	arg_20_0._stageID = arg_20_1

	local var_20_0 = pg.expedition_data_template[arg_20_1]
	local var_20_1 = Clone(var_20_0.award_display)
	local var_20_2 = checkExist(pg.expedition_activity_template[arg_20_1], {
		"pt_drop_display"
	})

	if var_20_2 and type(var_20_2) == "table" then
		local var_20_3 = getProxy(ActivityProxy)

		for iter_20_0 = #var_20_2, 1, -1 do
			local var_20_4 = var_20_3:getActivityById(var_20_2[iter_20_0][1])

			if var_20_4 and not var_20_4:isEnd() then
				table.insert(var_20_1, 1, {
					2,
					id2ItemId(var_20_2[iter_20_0][2])
				})
			end
		end
	end

	if arg_20_0.contextData.system ~= SYSTEM_BOSS_EXPERIMENT then
		for iter_20_1, iter_20_2 in ipairs(var_20_1) do
			local var_20_5 = cloneTplTo(arg_20_0._item, arg_20_0._spoilsContainer)
			local var_20_6 = {
				id = iter_20_2[2],
				type = iter_20_2[1]
			}

			updateDrop(var_20_5, var_20_6)
			onButton(arg_20_0, var_20_5, function()
				local var_21_0 = Item.getConfigData(iter_20_2[2])

				if var_21_0 and var_0_2[var_21_0.type] then
					local var_21_1 = var_21_0.display_icon
					local var_21_2 = {}

					for iter_21_0, iter_21_1 in ipairs(var_21_1) do
						local var_21_3 = iter_21_1[1]
						local var_21_4 = iter_21_1[2]

						var_21_2[#var_21_2 + 1] = {
							hideName = true,
							type = var_21_3,
							id = var_21_4
						}
					end

					arg_20_0:emit(var_0_0.ON_DROP_LIST, {
						item2Row = true,
						itemList = var_21_2,
						content = var_21_0.display
					})
				else
					arg_20_0:emit(var_0_0.ON_DROP, var_20_6)
				end
			end, SFX_PANEL)
		end
	end

	local function var_20_7(arg_22_0, arg_22_1)
		if type(arg_22_0) == "table" then
			setActive(arg_22_1, true)

			local var_22_0 = i18n(PreCombatLayer.ObjectiveList[arg_22_0[1]], arg_22_0[2])

			setWidgetText(arg_22_1, var_22_0)
		else
			setActive(arg_22_1, false)
		end
	end

	local var_20_8 = {
		findTF(arg_20_0._goals, "goal_tpl"),
		findTF(arg_20_0._goals, "goal_sink"),
		findTF(arg_20_0._goals, "goal_time")
	}
	local var_20_9 = {
		var_20_0.objective_1,
		var_20_0.objective_2,
		var_20_0.objective_3
	}
	local var_20_10 = 1

	for iter_20_3, iter_20_4 in ipairs(var_20_9) do
		if type(iter_20_4) ~= "string" then
			var_20_7(iter_20_4, var_20_8[var_20_10])

			var_20_10 = var_20_10 + 1
		end
	end

	for iter_20_5 = var_20_10, #var_20_8 do
		var_20_7("", var_20_8[iter_20_5])
	end

	local var_20_11 = var_20_0.guide_desc and #var_20_0.guide_desc > 0

	setActive(arg_20_0.guideDesc, var_20_11)

	if var_20_11 then
		setText(arg_20_0.guideDesc, var_20_0.guide_desc)
	end
end

function var_0_0.SetFleets(arg_23_0, arg_23_1)
	local var_23_0 = _.filter(_.values(arg_23_1), function(arg_24_0)
		return arg_24_0:getFleetType() == FleetType.Normal
	end)

	arg_23_0._fleetVOs = {}

	_.each(var_23_0, function(arg_25_0)
		arg_23_0._fleetVOs[arg_25_0.id] = arg_25_0
	end)
	arg_23_0:CheckLegalFleet()
end

function var_0_0.SetCurrentFleet(arg_26_0, arg_26_1)
	arg_26_0._currentFleetVO = arg_26_0._fleetVOs[arg_26_1]

	arg_26_0._formationLogic:SetFleetVO(arg_26_0._currentFleetVO)
	arg_26_0:CheckLegalFleet()

	for iter_26_0, iter_26_1 in ipairs(arg_26_0._legalFleetIdList) do
		if arg_26_0._currentFleetVO.id == iter_26_1 then
			arg_26_0._curFleetIndex = iter_26_0

			break
		end
	end
end

function var_0_0.SetTicketItemID(arg_27_0, arg_27_1)
	arg_27_0._ticketItemID = arg_27_1
end

function var_0_0.CheckLegalFleet(arg_28_0)
	arg_28_0._legalFleetIdList = {}

	for iter_28_0, iter_28_1 in pairs(arg_28_0._fleetVOs) do
		if #iter_28_1.ships > 0 and iter_28_1.id ~= FleetProxy.PVP_FLEET_ID then
			table.insert(arg_28_0._legalFleetIdList, iter_28_1.id)
		end
	end

	table.sort(arg_28_0._legalFleetIdList)
end

function var_0_0.UpdateFleetView(arg_29_0, arg_29_1)
	arg_29_0:displayFleetInfo()
	arg_29_0:updateFleetBg()
	arg_29_0._formationLogic:UpdateGridVisibility()
	arg_29_0._formationLogic:ResetGrid(TeamType.Vanguard, arg_29_0._currentForm ~= PreCombatLayer.FORM_EDIT)
	arg_29_0._formationLogic:ResetGrid(TeamType.Main, arg_29_0._currentForm ~= PreCombatLayer.FORM_EDIT)
	arg_29_0._formationLogic:ResetGrid(TeamType.Submarine, arg_29_0._currentForm ~= PreCombatLayer.FORM_EDIT)
	arg_29_0:resetFormationComponent()

	if arg_29_1 then
		arg_29_0._formationLogic:LoadAllCharacter()
	else
		arg_29_0._formationLogic:SetAllCharacterPos()
	end
end

function var_0_0.updateFleetBg(arg_30_0)
	local var_30_0 = arg_30_0._currentFleetVO:getFleetType()

	setActive(arg_30_0._bgFleet, var_30_0 == FleetType.Normal)
	setActive(arg_30_0._bgSub, var_30_0 == FleetType.Submarine)
end

function var_0_0.resetFormationComponent(arg_31_0)
	SetActive(arg_31_0._gridTFs.main[1]:Find("flag"), #arg_31_0._currentFleetVO:getTeamByName(TeamType.Main) ~= 0)
	SetActive(arg_31_0._gridTFs.submarine[1]:Find("flag"), #arg_31_0._currentFleetVO:getTeamByName(TeamType.Submarine) ~= 0)
end

function var_0_0.uiStartAnimating(arg_32_0)
	local var_32_0 = 0
	local var_32_1 = 0.3

	shiftPanel(arg_32_0._middle, 0, nil, var_32_1, var_32_0, true, true)
	shiftPanel(arg_32_0._right, 0, nil, var_32_1, var_32_0, true, true)
end

function var_0_0.uiExitAnimating(arg_33_0)
	shiftPanel(arg_33_0._middle, -840, nil, nil, nil, true, true)
	shiftPanel(arg_33_0._right, 470, nil, nil, nil, true, true)
end

function var_0_0.quickExitFunc(arg_34_0)
	if arg_34_0._currentForm == PreCombatLayer.FORM_EDIT then
		arg_34_0:emit(ActivityBossPreCombatMediator.ON_ABORT_EDIT)
	end

	var_0_0.super.quickExitFunc(arg_34_0)
end

function var_0_0.didEnter(arg_35_0)
	onButton(arg_35_0, arg_35_0._backBtn, function()
		local var_36_0 = {}

		if arg_35_0._currentForm == PreCombatLayer.FORM_EDIT then
			table.insert(var_36_0, function(arg_37_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					zIndex = -100,
					hideNo = false,
					content = i18n("battle_preCombatLayer_save_confirm"),
					onYes = function()
						arg_35_0:emit(ActivityBossPreCombatMediator.ON_COMMIT_EDIT, function()
							pg.TipsMgr.GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))
							arg_37_0()
						end)
					end,
					onNo = function()
						arg_35_0:emit(ActivityBossPreCombatMediator.ON_ABORT_EDIT)
						arg_37_0()
					end,
					weight = LayerWeightConst.TOP_LAYER
				})
			end)
		end

		seriesAsync(var_36_0, function()
			GetOrAddComponent(arg_35_0._tf, typeof(CanvasGroup)).interactable = false

			arg_35_0:uiExitAnimating()
			LeanTween.delayedCall(0.3, System.Action(function()
				arg_35_0:emit(var_0_0.ON_CLOSE)
			end))
		end)
	end, SFX_CANCEL)
	onButton(arg_35_0, arg_35_0._startBtn, function()
		local var_43_0 = {}

		if arg_35_0._currentForm == PreCombatLayer.FORM_EDIT then
			table.insert(var_43_0, function(arg_44_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					zIndex = -100,
					hideNo = false,
					content = i18n("battle_preCombatLayer_save_march"),
					onYes = function()
						arg_35_0:emit(ActivityBossPreCombatMediator.ON_COMMIT_EDIT, function()
							pg.TipsMgr.GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))
							arg_44_0()
						end)
					end
				})
			end)
		end

		seriesAsync(var_43_0, function()
			arg_35_0:emit(ActivityBossPreCombatMediator.ON_START, arg_35_0._currentFleetVO.id)
		end)
	end, SFX_UI_WEIGHANCHOR)
	onButton(arg_35_0, arg_35_0._checkBtn, function()
		if arg_35_0._currentForm == PreCombatLayer.FORM_EDIT then
			arg_35_0:emit(ActivityBossPreCombatMediator.ON_COMMIT_EDIT, function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))
				arg_35_0._formationLogic:SwitchToPreviewMode()
			end)
		elseif arg_35_0._currentForm == PreCombatLayer.FORM_PREVIEW then
			arg_35_0._formationLogic:SwitchToDisplayMode()
		else
			assert("currentForm error")
		end
	end, SFX_PANEL)

	arg_35_0._currentForm = arg_35_0.contextData.form
	arg_35_0.contextData.form = nil

	arg_35_0:UpdateFleetView(true)

	if arg_35_0._currentForm == PreCombatLayer.FORM_EDIT then
		arg_35_0._formationLogic:SwitchToDisplayMode()
	else
		arg_35_0._formationLogic:SwitchToPreviewMode()
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_35_0._tf)
	setActive(arg_35_0._autoToggle, true)
	onToggle(arg_35_0, arg_35_0._autoToggle, function(arg_50_0)
		arg_35_0:emit(ActivityBossPreCombatMediator.ON_AUTO, {
			isOn = not arg_50_0,
			toggle = arg_35_0._autoToggle
		})

		if arg_50_0 and arg_35_0._subUseable == true then
			setActive(arg_35_0._autoSubToggle, true)
			onToggle(arg_35_0, arg_35_0._autoSubToggle, function(arg_51_0)
				arg_35_0:emit(ActivityBossPreCombatMediator.ON_SUB_AUTO, {
					isOn = not arg_51_0,
					toggle = arg_35_0._autoSubToggle
				})
			end, SFX_PANEL, SFX_PANEL)
			triggerToggle(arg_35_0._autoSubToggle, ys.Battle.BattleState.IsAutoSubActive())
		else
			setActive(arg_35_0._autoSubToggle, false)
		end
	end, SFX_PANEL, SFX_PANEL)
	triggerToggle(arg_35_0._autoToggle, ys.Battle.BattleState.IsAutoBotActive())
	onNextTick(function()
		arg_35_0:uiStartAnimating()
	end)

	local var_35_0 = arg_35_0.contextData.stageId
	local var_35_1 = getProxy(ActivityProxy):getActivityById(arg_35_0.contextData.actId)

	setActive(arg_35_0._continuousBtn, arg_35_0.contextData.system == SYSTEM_ACT_BOSS)

	local var_35_2 = var_35_1 and var_35_1:IsOilLimit(var_35_0)

	setActive(arg_35_0._continuousBtn:Find("lock"), not var_35_2)

	local var_35_3 = var_35_2 and Color.white or Color.New(0.2980392156862745, 0.2980392156862745, 0.2980392156862745)

	setImageColor(arg_35_0._continuousBtn, var_35_3)
	setTextColor(arg_35_0._continuousBtn:Find("text"), var_35_3)
	setTextColor(arg_35_0._continuousBtn:Find("text_en"), var_35_3)
	onButton(arg_35_0, arg_35_0._continuousBtn, function()
		if var_35_2 then
			arg_35_0:emit(ActivityBossPreCombatMediator.SHOW_CONTINUOUS_OPERATION_WINDOW, arg_35_0._currentFleetVO.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("multiple_sorties_locked_tip"))
		end
	end, SFX_PANEL)
end

function var_0_0.displayFleetInfo(arg_54_0)
	var_0_0.super.displayFleetInfo(arg_54_0)

	local var_54_0 = arg_54_0.contextData.system

	setActive(arg_54_0._costContainer, true)

	local var_54_1 = arg_54_0.contextData.stageId
	local var_54_2 = getProxy(ActivityProxy):getActivityById(arg_54_0.contextData.actId):GetStageBonus(var_54_1)

	setActive(arg_54_0._bonus, var_54_2 > 0)
	setActive(arg_54_0._ticket, var_54_2 <= 0)
	setText(arg_54_0._bonus:Find("Text"), var_54_2)

	if var_54_2 <= 0 then
		local var_54_3 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = arg_54_0._ticketItemID
		}):getIcon()
		local var_54_4 = LoadSprite(var_54_3, "")

		setImageSprite(arg_54_0._ticket:Find("icon"), var_54_4)

		local var_54_5 = getProxy(PlayerProxy):getRawData():getResource(arg_54_0._ticketItemID)
		local var_54_6 = 1
		local var_54_7 = arg_54_0._ticket:Find("checkbox")

		if var_54_0 == SYSTEM_BOSS_EXPERIMENT then
			var_54_6 = 0

			triggerToggle(var_54_7, false)
			setToggleEnabled(var_54_7, false)
		elseif var_54_0 == SYSTEM_HP_SHARE_ACT_BOSS then
			triggerToggle(var_54_7, true)
			setToggleEnabled(var_54_7, false)
		elseif var_54_0 == SYSTEM_ACT_BOSS_SP then
			setActive(arg_54_0._ticket, false)
		elseif var_54_0 == SYSTEM_ACT_BOSS then
			local var_54_8 = var_54_5 > 0
			local var_54_9 = getProxy(SettingsProxy):isTipActBossExchangeTicket() == 1

			setToggleEnabled(var_54_7, var_54_8)
			triggerToggle(var_54_7, var_54_8 and var_54_9)
		end

		var_54_5 = var_54_5 < var_54_6 and setColorStr(var_54_5, COLOR_RED) or var_54_5

		setText(arg_54_0._ticket:Find("Text"), var_54_6 .. "/" .. var_54_5)
		onToggle(arg_54_0, var_54_7, function(arg_55_0)
			getProxy(SettingsProxy):setActBossExchangeTicketTip(arg_55_0 and 1 or 0)
		end, SFX_PANEL, SFX_CANCEL)
	end

	local var_54_10 = pg.battle_cost_template[var_54_0].oil_cost > 0
	local var_54_11 = 0
	local var_54_12 = 0
	local var_54_13 = false

	for iter_54_0, iter_54_1 in ipairs({
		arg_54_0.contextData.fleets[1]
	}) do
		local var_54_14 = iter_54_1:GetCostSum().oil

		if not var_54_10 then
			var_54_14 = 0
		end

		var_54_12 = var_54_12 + var_54_14

		local var_54_15 = iter_54_0 == 1
		local var_54_16 = arg_54_0.contextData.costLimit[var_54_15 and 1 or 2]

		if var_54_16 > 0 then
			var_54_13 = var_54_13 or var_54_16 < var_54_14
			var_54_14 = math.min(var_54_14, var_54_16)
		end

		var_54_11 = var_54_11 + var_54_14
	end

	setTextColor(arg_54_0._costText, var_54_13 and Color(0.9803921568627451, 0.39215686274509803, 0.39215686274509803) or Color.white)
	var_0_1.tweenNumText(arg_54_0._costText, var_54_11)
	setActive(arg_54_0._costTip, var_54_13)

	if var_54_13 then
		onButton(arg_54_0, arg_54_0._costTip, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("use_oil_limit_help", var_54_12, var_54_11),
				weight = LayerWeightConst.SECOND_LAYER
			})
		end)
	end

	setText(arg_54_0._fleetNameText, Fleet.DEFAULT_NAME_BOSS_ACT[arg_54_0._currentFleetVO.id])
end

function var_0_0.SetFleetStepper(arg_57_0)
	SetActive(arg_57_0._nextPage, false)
	SetActive(arg_57_0._prevPage, false)
end

function var_0_0.onBackPressed(arg_58_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(arg_58_0._backBtn)
end

function var_0_0.willExit(arg_59_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_59_0._tf)
	arg_59_0._formationLogic:Destroy()

	arg_59_0._formationLogic = nil
end

return var_0_0
