local var_0_0 = class("WorldBossFormationLayer", import("..base.BaseUI"))
local var_0_1 = import("..ship.FormationUI")

var_0_0.FORM_EDIT = "EDIT"
var_0_0.FORM_PREVIEW = "PREVIEW"

function var_0_0.getUIName(arg_1_0)
	return "PreCombatUI"
end

function var_0_0.ResUISettings(arg_2_0)
	return {
		order = 5,
		anim = true,
		showType = PlayerResUI.TYPE_ALL
	}
end

function var_0_0.SetBossProxy(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.boss = arg_3_1:GetBossById(arg_3_2)
end

function var_0_0.init(arg_4_0)
	arg_4_0._startBtn = arg_4_0.rtAdapt:Find("right/start")
	arg_4_0._popup = arg_4_0.rtAdapt:Find("right/start/cost_container/popup")
	arg_4_0._costText = arg_4_0.rtAdapt:Find("right/start/cost_container/popup/Text")
	arg_4_0._backBtn = arg_4_0._tf:Find("blur_panel/top/back_btn")
	arg_4_0._moveLayer = arg_4_0._tf:Find("moveLayer")

	local var_4_0 = arg_4_0.rtAdapt:Find("middle")

	arg_4_0._autoToggle = arg_4_0.rtAdapt:Find("auto_toggle")
	arg_4_0.subToggle = arg_4_0.rtAdapt:Find("sub_toggle_container")

	setActive(arg_4_0.subToggle, false)

	arg_4_0._buffContainer = arg_4_0.rtAdapt:Find("BuffContainer")

	setActive(arg_4_0._buffContainer, false)

	arg_4_0._fleetInfo = var_4_0:Find("fleet_info")
	arg_4_0._fleetNameText = var_4_0:Find("fleet_info/fleet_name/Text")
	arg_4_0._fleetNumText = var_4_0:Find("fleet_info/fleet_number")

	setActive(arg_4_0._fleetInfo, arg_4_0.contextData.system ~= SYSTEM_DUEL)

	arg_4_0._mainGS = var_4_0:Find("gear_score/main/Text")
	arg_4_0._vanguardGS = var_4_0:Find("gear_score/vanguard/Text")
	arg_4_0._gridTFs = {
		vanguard = {},
		main = {}
	}
	arg_4_0._gridFrame = var_4_0:Find("mask/GridFrame")

	for iter_4_0 = 1, 3 do
		arg_4_0._gridTFs[TeamType.Vanguard][iter_4_0] = arg_4_0._gridFrame:Find("vanguard_" .. iter_4_0)
		arg_4_0._gridTFs[TeamType.Main][iter_4_0] = arg_4_0._gridFrame:Find("main_" .. iter_4_0)
	end

	arg_4_0._nextPage = arg_4_0.rtAdapt:Find("middle/nextPage")
	arg_4_0._prevPage = arg_4_0.rtAdapt:Find("middle/prevPage")

	arg_4_0:disableAllStepper()

	arg_4_0._heroContainer = var_4_0:Find("HeroContainer")
	arg_4_0._checkBtn = var_4_0:Find("checkBtn")
	arg_4_0._spoilsContainer = arg_4_0.rtAdapt:Find("right/infomation/atlasloot/spoils/items/items_container")
	arg_4_0._item = arg_4_0:getTpl("right/infomation/atlasloot/spoils/items/item_tpl", arg_4_0.rtAdapt)
	arg_4_0._goals = arg_4_0.rtAdapt:Find("right/infomation/target/goal")
	arg_4_0._heroInfo = arg_4_0:getTpl("heroInfo")
	arg_4_0._starTpl = arg_4_0:getTpl("star_tpl")
	arg_4_0._middle = arg_4_0.rtAdapt:Find("middle")
	arg_4_0._right = arg_4_0.rtAdapt:Find("right")
	arg_4_0.topPanel = arg_4_0._tf:Find("blur_panel/top")

	setAnchoredPosition(arg_4_0._middle, {
		x = -840
	})
	setAnchoredPosition(arg_4_0._right, {
		x = 470
	})

	arg_4_0.guideDesc = arg_4_0._middle:Find("guideDesc")

	if arg_4_0.contextData.stageId then
		arg_4_0:SetStageID(arg_4_0.contextData.stageId)
	end

	arg_4_0._formationLogic = BaseFormation.New(arg_4_0._tf, arg_4_0._heroContainer, arg_4_0._heroInfo, arg_4_0._gridTFs)

	arg_4_0:Register()
end

function var_0_0.Register(arg_5_0)
	arg_5_0._formationLogic:AddLoadComplete(function()
		if arg_5_0._currentForm ~= var_0_0.FORM_EDIT then
			arg_5_0._formationLogic:SwitchToPreviewMode()
		end
	end)
	arg_5_0._formationLogic:AddHeroInfoModify(function(arg_7_0, arg_7_1, arg_7_2)
		arg_7_2:SetLocalScale(Vector3(0.65, 0.65, 1))
		SetActive(arg_7_0, true)

		local var_7_0 = arg_7_0:Find("info")
		local var_7_1 = var_7_0:Find("stars")
		local var_7_2 = arg_7_1.energy <= Ship.ENERGY_MID
		local var_7_3 = var_7_0:Find("energy")

		if var_7_2 then
			local var_7_4, var_7_5 = arg_7_1:getEnergyPrint()
			local var_7_6 = GetSpriteFromAtlas("energy", var_7_4)

			if not var_7_6 then
				warning("找不到疲劳")
			end

			setImageSprite(var_7_3, var_7_6)
		end

		setActive(var_7_3, false)
		setActive(var_7_0:Find("expbuff"), false)

		local var_7_7 = arg_7_1:getStar()

		for iter_7_0 = 1, var_7_7 do
			cloneTplTo(arg_5_0._starTpl, var_7_1)
		end

		local var_7_8 = GetSpriteFromAtlas("shiptype", shipType2print(arg_7_1:getShipType()))

		if not var_7_8 then
			warning("找不到船形, shipConfigId: " .. arg_7_1.configId)
		end

		setImageSprite(var_7_0:Find("type"), var_7_8, true)
		setText(var_7_0:Find("frame/lv_contain/lv"), arg_7_1.level)
	end)
	arg_5_0._formationLogic:AddLongPress(function(arg_8_0, arg_8_1, arg_8_2)
		arg_5_0:emit(WorldBossFormationMediator.OPEN_SHIP_INFO, arg_8_1.id, arg_8_2)
	end)
	arg_5_0._formationLogic:AddClick(function(arg_9_0, arg_9_1, arg_9_2)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_CLICK)
		arg_5_0:emit(WorldBossFormationMediator.CHANGE_FLEET_SHIP, arg_9_0, arg_9_2, arg_9_1)
	end)
	arg_5_0._formationLogic:AddBeginDrag(function(arg_10_0)
		local var_10_0 = arg_10_0:Find("info")

		SetActive(var_10_0, false)
	end)
	arg_5_0._formationLogic:AddEndDrag(function(arg_11_0)
		local var_11_0 = arg_11_0:Find("info")

		SetActive(var_11_0, true)
	end)
	arg_5_0._formationLogic:AddShiftOnly(function(arg_12_0)
		arg_5_0:emit(WorldBossFormationMediator.CHANGE_FLEET_SHIPS_ORDER)
	end)
	arg_5_0._formationLogic:AddRemoveShip(function(arg_13_0, arg_13_1)
		arg_5_0:emit(WorldBossFormationMediator.REMOVE_SHIP, arg_13_0, arg_13_1)
	end)
	arg_5_0._formationLogic:AddCheckRemove(function(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
		if not arg_14_3:canRemove(arg_14_2) then
			local var_14_0, var_14_1 = arg_14_3:getShipPos(arg_14_2)

			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", arg_14_2:getConfigTable().name, arg_14_3.name, Fleet.C_TEAM_NAME[var_14_1]))
			arg_14_0()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				zIndex = -100,
				hideNo = false,
				content = i18n("battle_preCombatLayer_quest_leaveFleet", arg_14_2:getConfigTable().name),
				onYes = arg_14_1,
				onNo = arg_14_0
			})
		end
	end)
	arg_5_0._formationLogic:AddSwitchToDisplayMode(function()
		arg_5_0._currentForm = var_0_0.FORM_EDIT
		arg_5_0._checkBtn:GetComponent("Button").interactable = true

		setActive(arg_5_0._checkBtn:Find("save"), true)
		setActive(arg_5_0._checkBtn:Find("edit"), false)
	end)
	arg_5_0._formationLogic:AddSwitchToShiftMode(function()
		arg_5_0:disableAllStepper()

		arg_5_0._checkBtn:GetComponent("Button").interactable = false
	end)
	arg_5_0._formationLogic:AddSwitchToPreviewMode(function()
		arg_5_0._currentForm = var_0_0.FORM_PREVIEW
		arg_5_0._checkBtn:GetComponent("Button").interactable = true

		setActive(arg_5_0._checkBtn:Find("save"), false)
		setActive(arg_5_0._checkBtn:Find("edit"), true)
	end)
	arg_5_0._formationLogic:AddGridTipClick(function(arg_18_0, arg_18_1)
		arg_5_0:emit(WorldBossFormationMediator.CHANGE_FLEET_SHIP, nil, arg_18_1, arg_18_0)
	end)
end

function var_0_0.SetPlayerInfo(arg_19_0, arg_19_1)
	return
end

function var_0_0.SetShips(arg_20_0, arg_20_1)
	arg_20_0._shipVOs = arg_20_1

	arg_20_0._formationLogic:SetShipVOs(arg_20_0._shipVOs)
end

function var_0_0.SetStageID(arg_21_0, arg_21_1)
	removeAllChildren(arg_21_0._spoilsContainer)

	arg_21_0._stageID = arg_21_1

	local var_21_0 = pg.expedition_data_template[arg_21_1]
	local var_21_1 = var_21_0.limit_type
	local var_21_2 = var_21_0.time_limit
	local var_21_3 = var_21_0.sink_limit
	local var_21_4 = var_21_0.award_display

	for iter_21_0, iter_21_1 in ipairs(var_21_4) do
		local var_21_5 = cloneTplTo(arg_21_0._item, arg_21_0._spoilsContainer)
		local var_21_6 = {
			id = iter_21_1[2],
			type = iter_21_1[1]
		}

		updateDrop(var_21_5, var_21_6)
	end

	local var_21_7 = arg_21_0._goals:Find("goal_tpl")
	local var_21_8 = arg_21_0._goals:Find("goal_sink")
	local var_21_9 = arg_21_0._goals:Find("goal_time")

	if var_21_1 == 1 then
		local var_21_10

		if var_21_3 < 2 then
			var_21_10 = i18n("battle_preCombatLayer_undefeated")
		else
			var_21_10 = i18n("battle_preCombatLayer_sink_limit", var_21_3)
		end

		setWidgetText(var_21_7, i18n("battle_preCombatLayer_victory"))
		setWidgetText(var_21_8, var_21_10)
		setWidgetText(var_21_9, i18n("battle_preCombatLayer_time_limit", var_21_2))
	elseif var_21_1 == 2 then
		setActive(var_21_8, false)
		setActive(var_21_9, false)
		setWidgetText(var_21_7, i18n("battle_preCombatLayer_time_hold", var_21_2))
	elseif var_21_1 == 3 then
		setActive(var_21_8, false)
		setActive(var_21_9, false)
		setWidgetText(var_21_7, i18n("battle_result_defeat_all_enemys", var_21_2))
	end

	local var_21_11 = var_21_0.guide_desc and #var_21_0.guide_desc > 0

	setActive(arg_21_0.guideDesc, var_21_11)

	if var_21_11 then
		setText(arg_21_0.guideDesc, var_21_0.guide_desc)
	end
end

function var_0_0.SetCurrentFleet(arg_22_0, arg_22_1)
	arg_22_0._currentFleetVO = arg_22_1

	arg_22_0._formationLogic:SetFleetVO(arg_22_0._currentFleetVO)

	arg_22_0._legalFleetIdList = {
		arg_22_1
	}
	arg_22_0._curFleetIndex = 1
end

function var_0_0.UpdateFleetView(arg_23_0, arg_23_1)
	arg_23_0:displayFleetInfo()
	arg_23_0._formationLogic:ResetGrid(TeamType.Vanguard, arg_23_0._currentForm ~= var_0_0.FORM_EDIT)
	arg_23_0._formationLogic:ResetGrid(TeamType.Main, arg_23_0._currentForm ~= var_0_0.FORM_EDIT)

	if arg_23_1 then
		arg_23_0._formationLogic:LoadAllCharacter()
	else
		arg_23_0._formationLogic:SetAllCharacterPos()
	end
end

function var_0_0.uiStartAnimating(arg_24_0)
	local var_24_0 = 0
	local var_24_1 = 0.3

	setAnchoredPosition(arg_24_0.topPanel, {
		y = 100
	})
	shiftPanel(arg_24_0._middle, 0, nil, var_24_1, var_24_0, true, true)
	shiftPanel(arg_24_0._right, 0, nil, var_24_1, var_24_0, true, true)
	shiftPanel(arg_24_0.topPanel, nil, 0, var_24_1, var_24_0, true, true, nil)
end

function var_0_0.uiExitAnimating(arg_25_0)
	shiftPanel(arg_25_0._middle, -840, nil, nil, nil, true, true)
	shiftPanel(arg_25_0._right, 470, nil, nil, nil, true, true)
	shiftPanel(arg_25_0.topPanel, nil, arg_25_0.topPanel.rect.height, nil, nil, true, true, nil)
end

function var_0_0.didEnter(arg_26_0)
	onButton(arg_26_0, arg_26_0._backBtn, function()
		local var_27_0 = {}

		if arg_26_0._currentForm == var_0_0.FORM_EDIT then
			table.insert(var_27_0, function(arg_28_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					zIndex = -100,
					hideNo = false,
					content = i18n("battle_preCombatLayer_save_confirm"),
					onYes = function()
						arg_26_0:emit(WorldBossFormationMediator.ON_COMMIT_EDIT, function()
							pg.TipsMgr.GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))
							arg_28_0()
						end)
					end,
					onNo = arg_28_0
				})
			end)
		end

		seriesAsync(var_27_0, function()
			GetOrAddComponent(arg_26_0._tf, typeof(CanvasGroup)).interactable = false

			arg_26_0:uiExitAnimating()
			LeanTween.delayedCall(0.3, System.Action(function()
				nowWorld():GetBossProxy():UnlockCacheBoss()
				arg_26_0:emit(var_0_0.ON_CLOSE)
			end))
		end)
	end, SFX_CANCEL)
	onButton(arg_26_0, arg_26_0._startBtn, function()
		local var_33_0 = {}

		if arg_26_0._currentForm == var_0_0.FORM_EDIT then
			table.insert(var_33_0, function(arg_34_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					zIndex = -100,
					hideNo = false,
					content = i18n("battle_preCombatLayer_save_march"),
					onYes = function()
						arg_26_0:emit(WorldBossFormationMediator.ON_COMMIT_EDIT, function()
							pg.TipsMgr.GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))
							arg_34_0()
						end)
					end
				})
			end)
		end

		seriesAsync(var_33_0, function()
			arg_26_0:emit(WorldBossFormationMediator.ON_START, arg_26_0._currentFleetVO.id)
		end)
	end, SFX_UI_WEIGHANCHOR)
	onButton(arg_26_0, arg_26_0._checkBtn, function()
		if arg_26_0._currentForm == var_0_0.FORM_EDIT then
			arg_26_0:emit(WorldBossFormationMediator.ON_COMMIT_EDIT, function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))
				arg_26_0._formationLogic:SwitchToPreviewMode()
			end)
		elseif arg_26_0._currentForm == var_0_0.FORM_PREVIEW then
			arg_26_0._formationLogic:SwitchToDisplayMode()
		else
			assert("currentForm error")
		end
	end, SFX_PANEL)

	arg_26_0._currentForm = arg_26_0.contextData.form
	arg_26_0.contextData.form = nil

	arg_26_0:UpdateFleetView(true)

	if arg_26_0._currentForm == var_0_0.FORM_EDIT then
		arg_26_0._formationLogic:SwitchToDisplayMode()
	else
		arg_26_0._formationLogic:SwitchToPreviewMode()
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_26_0._tf)

	if arg_26_0.contextData.system == SYSTEM_DUEL then
		setActive(arg_26_0._autoToggle, false)
	else
		setActive(arg_26_0._autoToggle, true)
		onToggle(arg_26_0, arg_26_0._autoToggle, function(arg_40_0)
			arg_26_0:emit(WorldBossFormationMediator.ON_AUTO, {
				isOn = not arg_40_0,
				toggle = arg_26_0._autoToggle
			})
		end, SFX_PANEL, SFX_PANEL)
		triggerToggle(arg_26_0._autoToggle, ys.Battle.BattleState.IsAutoBotActive(SYSTEM_WORLD))
	end

	setAnchoredPosition(arg_26_0.topPanel, {
		y = arg_26_0.topPanel.rect.height
	})
	onNextTick(function()
		arg_26_0:uiStartAnimating()
	end)

	if arg_26_0._currentForm == var_0_0.FORM_PREVIEW and arg_26_0._currentFleetVO:isLegalToFight() ~= true then
		triggerButton(arg_26_0._checkBtn)
	end

	arg_26_0:UpdateBuffContainer()
	arg_26_0:TryPlayGuide()
end

function var_0_0.onBackPressed(arg_42_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(arg_42_0._backBtn)
end

function var_0_0.displayFleetInfo(arg_43_0)
	local var_43_0 = arg_43_0._currentFleetVO:GetPropertiesSum()
	local var_43_1 = arg_43_0._currentFleetVO:GetGearScoreSum(TeamType.Vanguard)
	local var_43_2 = arg_43_0._currentFleetVO:GetGearScoreSum(TeamType.Main)
	local var_43_3 = 0

	if arg_43_0.boss and arg_43_0.boss:IsSelf() and arg_43_0.boss:GetSelfFightCnt() > 0 then
		var_43_3 = arg_43_0.boss:GetOilConsume()
	end

	setActive(arg_43_0._popup, arg_43_0.contextData.system ~= SYSTEM_DUEL)
	var_0_1.tweenNumText(arg_43_0._costText, var_43_3)
	var_0_1.tweenNumText(arg_43_0._vanguardGS, var_43_1)
	var_0_1.tweenNumText(arg_43_0._mainGS, var_43_2)
	setText(arg_43_0._fleetNameText, var_0_1.defaultFleetName(arg_43_0._currentFleetVO))
	setText(arg_43_0._fleetNumText, arg_43_0._currentFleetVO.id)
end

function var_0_0.disableAllStepper(arg_44_0)
	SetActive(arg_44_0._nextPage, false)
	SetActive(arg_44_0._prevPage, false)
end

function var_0_0.GetActiveStgs(arg_45_0)
	local var_45_0 = {}
	local var_45_1, var_45_2, var_45_3 = WorldBossProxy.GetSupportValue()

	if var_45_1 and arg_45_0.boss and arg_45_0.boss:IsSelf() then
		table.insert(var_45_0, var_45_3)
	end

	return var_45_0
end

function var_0_0.UpdateBuffContainer(arg_46_0)
	local var_46_0 = arg_46_0:GetActiveStgs()
	local var_46_1 = #var_46_0 > 0

	setActive(arg_46_0._buffContainer, var_46_1)

	if not var_46_1 then
		return
	end

	UIItemList.StaticAlign(arg_46_0._buffContainer, arg_46_0._buffContainer:GetChild(0), #var_46_0, function(arg_47_0, arg_47_1, arg_47_2)
		if arg_47_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_47_0 = pg.strategy_data_template[var_46_0[arg_47_1 + 1]]

		GetImageSpriteFromAtlasAsync("strategyicon/" .. var_47_0.icon, "", arg_47_2)
		onButton(arg_46_0, arg_47_2, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = "",
				yesText = "text_confirm",
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = {
					type = DROP_TYPE_STRATEGY,
					id = var_47_0.id,
					cfg = var_47_0
				}
			})
		end, SFX_PANEL)
	end)
end

function var_0_0.TryPlayGuide(arg_49_0)
	if #arg_49_0:GetActiveStgs() > 0 then
		WorldGuider.GetInstance():PlayGuide("WorldG200")
	end
end

function var_0_0.willExit(arg_50_0)
	if arg_50_0._currentForm == var_0_0.FORM_EDIT then
		arg_50_0.contextData.editingFleetVO = arg_50_0._currentFleetVO
	end

	arg_50_0._formationLogic:Destroy()

	if arg_50_0.tweens then
		cancelTweens(arg_50_0.tweens)
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_50_0._tf)
end

return var_0_0
