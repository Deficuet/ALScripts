local var_0_0 = class("FormationUI", import("..base.BaseUI"))

var_0_0.RADIUS = 60
var_0_0.LONGPRESS_Y = 30
var_0_0.INTERVAL = math.pi / 2 / 6
var_0_0.MAX_FLEET_NUM = 6
var_0_0.MAX_SHIPP_NUM = 5
var_0_0.TOGGLE_DETAIL = "_detailToggle"
var_0_0.TOGGLE_FORMATION = "_formationToggle"
var_0_0.BUFF_TYEP = {
	blue = "blue",
	pink = "pink",
	cyan = "cyan"
}
var_0_0.TeamNum = {
	"FIRST",
	"SECOND",
	"THIRD",
	"FOURTH",
	"FIFTH",
	"SIXTH"
}

function var_0_0.getUIName(arg_1_0)
	return "FormationUI"
end

function var_0_0.preloadUIList(arg_2_0)
	return {
		arg_2_0:getUIName(),
		"CommanderFormationUI"
	}
end

function var_0_0.setPlayer(arg_3_0, arg_3_1)
	arg_3_0.player = arg_3_1
end

function var_0_0.setCommanderPrefabFleet(arg_4_0, arg_4_1)
	arg_4_0.commanderPrefabFleets = arg_4_1
end

function var_0_0.init(arg_5_0)
	arg_5_0.eventTriggers = {}
	arg_5_0.backBtn = arg_5_0._blurLayer:Find("top/back_btn")
	arg_5_0._bgFleet = arg_5_0._adapt:Find("bg_fleet")
	arg_5_0._bgSub = arg_5_0._adapt:Find("bg_sub")
	arg_5_0._bottomPanel = arg_5_0._blurLayer:Find("bottom")
	arg_5_0._detailToggle = arg_5_0._bottomPanel:Find("toggle_list/detail_toggle")
	arg_5_0._formationToggle = arg_5_0._bottomPanel:Find("toggle_list/formation_toggle")
	arg_5_0._nextPage = arg_5_0._adapt:Find("nextPage")
	arg_5_0._prevPage = arg_5_0._adapt:Find("prevPage")
	arg_5_0._starTpl = arg_5_0._tf:Find("star_tpl")
	arg_5_0._heroInfoTpl = arg_5_0._tf:Find("heroInfo")
	arg_5_0.topPanel = arg_5_0._blurLayer:Find("top")
	arg_5_0._gridTFs = {
		[TeamType.Vanguard] = {},
		[TeamType.Main] = {},
		[TeamType.Submarine] = {}
	}
	arg_5_0._gridFrame = arg_5_0._adapt:Find("GridFrame")

	for iter_5_0 = 1, 3 do
		arg_5_0._gridTFs[TeamType.Main][iter_5_0] = arg_5_0._gridFrame:Find("main_" .. iter_5_0)
		arg_5_0._gridTFs[TeamType.Vanguard][iter_5_0] = arg_5_0._gridFrame:Find("vanguard_" .. iter_5_0)
		arg_5_0._gridTFs[TeamType.Submarine][iter_5_0] = arg_5_0._gridFrame:Find("submarine_" .. iter_5_0)
	end

	arg_5_0._heroContainer = arg_5_0._adapt:Find("HeroContainer")
	arg_5_0._formationLogic = BaseFormation.New(arg_5_0._tf, arg_5_0._heroContainer, arg_5_0._heroInfoTpl, arg_5_0._gridTFs)
	arg_5_0._fleetInfo = arg_5_0._blurLayer:Find("fleet_info")
	arg_5_0._fleetNumText = arg_5_0._fleetInfo:Find("fleet_number")
	arg_5_0._fleetNameText = arg_5_0._fleetInfo:Find("fleet_name/Text")
	arg_5_0._fleetNameEditBtn = arg_5_0._fleetInfo:Find("edit_btn")
	arg_5_0._renamePanel = arg_5_0._tf:Find("changeName_panel")
	arg_5_0._renameConfirmBtn = arg_5_0._renamePanel:Find("frame/queren")
	arg_5_0._renameCancelBtn = arg_5_0._renamePanel:Find("frame/cancel")

	setLocalPosition(arg_5_0._renamePanel, {
		z = -45
	})

	arg_5_0._propertyFrame = arg_5_0._blurLayer:Find("property_frame")
	arg_5_0._cannonPower = arg_5_0._propertyFrame:Find("cannon/Text")
	arg_5_0._torpedoPower = arg_5_0._propertyFrame:Find("torpedo/Text")
	arg_5_0._AAPower = arg_5_0._propertyFrame:Find("antiaircraft/Text")
	arg_5_0._airPower = arg_5_0._propertyFrame:Find("air/Text")
	arg_5_0._airDominance = arg_5_0._propertyFrame:Find("ac/Text")
	arg_5_0._cost = arg_5_0._propertyFrame:Find("cost/Text")
	arg_5_0._mainGS = arg_5_0._adapt:Find("gear_score/main")
	arg_5_0._vanguardGS = arg_5_0._adapt:Find("gear_score/vanguard")
	arg_5_0._subGS = arg_5_0._adapt:Find("gear_score/submarine")
	arg_5_0._arrUpVan = arg_5_0._vanguardGS:Find("up")
	arg_5_0._arrDownVan = arg_5_0._vanguardGS:Find("down")
	arg_5_0._arrUpMain = arg_5_0._mainGS:Find("up")
	arg_5_0._arrDownMain = arg_5_0._mainGS:Find("down")
	arg_5_0._arrUpSub = arg_5_0._subGS:Find("up")
	arg_5_0._arrDownSub = arg_5_0._subGS:Find("down")
	arg_5_0._attrFrame = arg_5_0._blurLayer:Find("attr_frame")
	arg_5_0._cardTpl = arg_5_0._tf:GetComponent(typeof(ItemList)).prefabItem[0]
	arg_5_0._cards = {}
	arg_5_0._cards[TeamType.Main] = {}
	arg_5_0._cards[TeamType.Vanguard] = {}
	arg_5_0._cards[TeamType.Submarine] = {}

	setActive(arg_5_0._attrFrame, false)
	setActive(arg_5_0._cardTpl, false)

	arg_5_0.btnRegular = arg_5_0._bottomPanel:Find("fleet_select/regular")
	arg_5_0._regularEnFllet = arg_5_0.btnRegular:Find("fleet/enFleet")
	arg_5_0._regularNum = arg_5_0.btnRegular:Find("fleet/num")
	arg_5_0._regualrCnFleet = arg_5_0.btnRegular:Find("fleet/CnFleet")
	arg_5_0.btnSub = arg_5_0._bottomPanel:Find("fleet_select/sub")
	arg_5_0._subEnFllet = arg_5_0.btnSub:Find("fleet/enFleet")
	arg_5_0._subNum = arg_5_0.btnSub:Find("fleet/num")
	arg_5_0._subCnFleet = arg_5_0.btnSub:Find("fleet/CnFleet")
	arg_5_0.fleetToggleMask = arg_5_0._tf:Find("blur_panel/list_mask")
	arg_5_0.fleetToggleList = arg_5_0.fleetToggleMask:Find("list")
	arg_5_0.fleetToggles = {}

	for iter_5_1 = 1, var_0_0.MAX_FLEET_NUM do
		arg_5_0.fleetToggles[iter_5_1] = arg_5_0.fleetToggleList:Find("item" .. iter_5_1)
	end

	arg_5_0._vanGSTxt = arg_5_0._vanguardGS:Find("Text"):GetComponent("Text")
	arg_5_0._mainGSTxt = arg_5_0._mainGS:Find("Text"):GetComponent("Text")
	arg_5_0._subGSTxt = arg_5_0._subGS:Find("Text"):GetComponent("Text")
	arg_5_0.prevMainGS = arg_5_0.contextData.mainGS
	arg_5_0.prevVanGS = arg_5_0.contextData.vanGS
	arg_5_0.prevSubGS = arg_5_0.contextData.subGS
	arg_5_0.mainGSInited = arg_5_0.contextData.mainGS and true or false
	arg_5_0.VanGSInited = arg_5_0.contextData.vanGS and true or false
	arg_5_0.SubGSInited = arg_5_0.contextData.subGS and true or false
	arg_5_0._vanGSTxt.text = arg_5_0.prevVanGS or 0
	arg_5_0._mainGSTxt.text = arg_5_0.prevMainGS or 0
	arg_5_0._subGSTxt.text = arg_5_0.prevSubGS or 0
	arg_5_0.commanderFormationPanel = CommanderFormationPage.New(arg_5_0._tf, arg_5_0.event, arg_5_0.contextData)
	arg_5_0.index = {
		[FleetType.Normal] = 1,
		[FleetType.Submarine] = 1
	}

	setText(arg_5_0._adapt:Find("gear_score/main/line/Image/text1"), i18n("pre_combat_main"))
	setText(arg_5_0._adapt:Find("gear_score/vanguard/line/Image/text1"), i18n("pre_combat_vanguard"))
	setText(arg_5_0._adapt:Find("gear_score/submarine/line/Image/text1"), i18n("pre_combat_submarine"))
end

function var_0_0.setShips(arg_6_0, arg_6_1)
	arg_6_0.shipVOs = arg_6_1

	arg_6_0._formationLogic:SetShipVOs(arg_6_0.shipVOs)
end

function var_0_0.SetFleets(arg_7_0, arg_7_1)
	arg_7_0._fleetVOs = _(arg_7_1):chain():values():filter(function(arg_8_0)
		return arg_8_0:isRegularFleet()
	end):sort(function(arg_9_0, arg_9_1)
		return arg_9_0.id < arg_9_1.id
	end):value()

	if arg_7_0._currentFleetVO then
		arg_7_0._currentFleetVO = arg_7_0:getFleetById(arg_7_0._currentFleetVO.id)

		arg_7_0._formationLogic:SetFleetVO(arg_7_0._currentFleetVO)
	end
end

function var_0_0.getFleetById(arg_10_0, arg_10_1)
	return _.detect(arg_10_0._fleetVOs, function(arg_11_0)
		return arg_11_0.id == arg_10_1
	end)
end

function var_0_0.UpdateFleetView(arg_12_0, arg_12_1)
	arg_12_0:displayFleetInfo()
	arg_12_0:updateFleetBg()
	arg_12_0._formationLogic:UpdateGridVisibility()
	arg_12_0._formationLogic:ResetGrid(TeamType.Vanguard)
	arg_12_0._formationLogic:ResetGrid(TeamType.Main)
	arg_12_0._formationLogic:ResetGrid(TeamType.Submarine)
	arg_12_0:resetFormationComponent()
	arg_12_0:updateAttrFrame()
	arg_12_0:updateFleetButton()

	if arg_12_1 then
		arg_12_0._formationLogic:LoadAllCharacter()
	else
		arg_12_0._formationLogic:SetAllCharacterPos()
	end
end

function var_0_0.updateFleetBg(arg_13_0)
	local var_13_0 = arg_13_0._currentFleetVO:getFleetType()

	setActive(arg_13_0._bgFleet, var_13_0 == FleetType.Normal)
	setActive(arg_13_0._bgSub, var_13_0 == FleetType.Submarine)
end

function var_0_0.updateFleetButton(arg_14_0)
	local var_14_0
	local var_14_1 = arg_14_0._currentFleetVO:getFleetType()

	arg_14_0.index[var_14_1] = arg_14_0._currentFleetVO:getIndex()

	local var_14_2 = arg_14_0.index[FleetType.Normal]

	setText(arg_14_0._regularEnFllet, var_0_0.TeamNum[var_14_2] .. " FLEET")
	setText(arg_14_0._regualrCnFleet, Fleet.DEFAULT_NAME[var_14_2])
	setText(arg_14_0._regularNum, var_14_2)

	local var_14_3 = arg_14_0.index[FleetType.Submarine]

	setText(arg_14_0._subEnFllet, var_0_0.TeamNum[var_14_3] .. " FLEET")
	setText(arg_14_0._subCnFleet, Fleet.DEFAULT_NAME[var_14_3])
	setText(arg_14_0._subNum, var_14_3)
	setActive(arg_14_0.btnRegular:Find("on"), var_14_1 == FleetType.Normal)
	setActive(arg_14_0.btnRegular:Find("off"), var_14_1 ~= FleetType.Normal)
	setActive(arg_14_0.btnSub:Find("on"), var_14_1 == FleetType.Submarine)
	setActive(arg_14_0.btnSub:Find("off"), var_14_1 ~= FleetType.Submarine)
end

function var_0_0.SetFleetNameLabel(arg_15_0)
	setText(arg_15_0._fleetNameText, arg_15_0.defaultFleetName(arg_15_0._currentFleetVO))
end

function var_0_0.ForceDropChar(arg_16_0)
	arg_16_0._formationLogic:ForceDropChar()

	if arg_16_0._currentDragDelegate then
		arg_16_0._forceDropCharacter = true

		LuaHelper.triggerEndDrag(arg_16_0._currentDragDelegate)
	end
end

function var_0_0.quickExitFunc(arg_17_0)
	arg_17_0:ForceDropChar()

	local function var_17_0()
		GetOrAddComponent(arg_17_0._tf, typeof(CanvasGroup)).interactable = false

		arg_17_0:emit(var_0_0.ON_HOME)
	end

	arg_17_0:emit(FormationMediator.COMMIT_FLEET, var_17_0)
end

function var_0_0.didEnter(arg_19_0)
	arg_19_0.isOpenCommander = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_19_0.player.level, "CommanderCatMediator") and not LOCK_COMMANDER

	local var_19_0 = getProxy(ActivityProxy):getBuffShipList()

	arg_19_0._formationLogic:AddHeroInfoModify(function(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_1:getConfigTable()
		local var_20_1 = pg.ship_data_template[arg_20_1.configId]
		local var_20_2 = findTF(arg_20_0, "info")
		local var_20_3 = findTF(var_20_2, "stars")
		local var_20_4 = findTF(var_20_2, "energy")
		local var_20_5 = arg_20_1:getStar()

		for iter_20_0 = 1, var_20_5 do
			cloneTplTo(arg_19_0._starTpl, var_20_3)
		end

		local var_20_6 = GetSpriteFromAtlas("shiptype", shipType2print(arg_20_1:getShipType()))

		if not var_20_6 then
			warning("找不到船形, shipConfigId: " .. arg_20_1.configId)
		end

		setImageSprite(findTF(var_20_2, "type"), var_20_6, true)
		setText(findTF(var_20_2, "frame/lv_contain/lv"), arg_20_1.level)

		if arg_20_1.energy <= Ship.ENERGY_MID then
			local var_20_7 = GetSpriteFromAtlas("energy", arg_20_1:getEnergyPrint())

			setImageSprite(var_20_4, var_20_7)
			setActive(var_20_4, true)
		end

		local var_20_8 = var_19_0[arg_20_1:getGroupId()]
		local var_20_9 = var_20_2:Find("expbuff")

		setActive(var_20_9, var_20_8 ~= nil)

		if var_20_8 then
			local var_20_10 = var_20_8 / 100
			local var_20_11 = var_20_8 % 100
			local var_20_12 = tostring(var_20_10)

			if var_20_11 > 0 then
				var_20_12 = var_20_12 .. "." .. tostring(var_20_11)
			end

			setText(var_20_9:Find("text"), string.format("EXP +%s%%", var_20_12))
		end
	end)
	arg_19_0._formationLogic:AddLongPress(function(arg_21_0, arg_21_1, arg_21_2)
		arg_19_0:emit(FormationMediator.OPEN_SHIP_INFO, arg_21_1.id, arg_19_0._currentFleetVO, var_0_0.TOGGLE_FORMATION)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_PANEL)
	end)
	arg_19_0._formationLogic:AddClick(function(arg_22_0, arg_22_1)
		arg_19_0:emit(FormationMediator.CHANGE_FLEET_SHIP, arg_22_0, arg_19_0._currentFleetVO, var_0_0.TOGGLE_FORMATION, arg_22_1)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_PANEL)
	end)
	arg_19_0._formationLogic:AddBeginDrag(function(arg_23_0)
		local var_23_0 = findTF(arg_23_0, "info")

		SetActive(var_23_0, false)
	end)
	arg_19_0._formationLogic:AddEndDrag(function(arg_24_0)
		local var_24_0 = findTF(arg_24_0, "info")

		SetActive(var_24_0, true)
	end)
	arg_19_0._formationLogic:AddShiftOnly(function(arg_25_0)
		arg_19_0:emit(FormationMediator.CHANGE_FLEET_SHIPS_ORDER, arg_25_0)
	end)
	arg_19_0._formationLogic:AddRemoveShip(function(arg_26_0, arg_26_1)
		arg_19_0:emit(FormationMediator.REMOVE_SHIP, arg_26_0, arg_26_1)
	end)
	arg_19_0._formationLogic:AddCheckRemove(function(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
		if not arg_27_3:canRemove(arg_27_2) then
			local var_27_0, var_27_1 = arg_27_3:getShipPos(arg_27_2)

			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", arg_27_2:getConfigTable().name, arg_27_3.name, Fleet.C_TEAM_NAME[var_27_1]))
			arg_27_0()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				zIndex = -30,
				hideNo = false,
				content = i18n("ship_formationUI_quest_remove", arg_27_2:getName()),
				onYes = arg_27_1,
				onNo = arg_27_0
			})
		end
	end)
	arg_19_0._formationLogic:AddGridTipClick(function(arg_28_0, arg_28_1)
		arg_19_0:emit(FormationMediator.CHANGE_FLEET_SHIP, nil, arg_28_1, var_0_0.TOGGLE_FORMATION, arg_28_0)
	end)
	onButton(arg_19_0, arg_19_0.backBtn, function()
		arg_19_0:ForceDropChar()

		if arg_19_0._attrFrame.gameObject.activeSelf then
			triggerToggle(arg_19_0._formationToggle, true)
		else
			local function var_29_0()
				GetOrAddComponent(arg_19_0._tf, typeof(CanvasGroup)).interactable = false

				arg_19_0:emit(var_0_0.ON_BACK)
			end

			arg_19_0:emit(FormationMediator.COMMIT_FLEET, var_29_0)
		end
	end, SOUND_BACK)

	arg_19_0._stamp = arg_19_0._adapt:Find("stamp")

	setActive(arg_19_0._stamp, not LOCK_CLICK_MINGSHI and (BATTLE_DEBUG or getProxy(TaskProxy):mingshiTouchFlagEnabled()))
	onButton(arg_19_0, arg_19_0._stamp, function()
		if BATTLE_DEBUG then
			print(arg_19_0._currentFleetVO:genRobotDataString())
		end

		getProxy(TaskProxy):dealMingshiTouchFlag(6)
	end, SFX_CONFIRM)
	onButton(arg_19_0, arg_19_0._fleetNameEditBtn, function()
		arg_19_0:DisplayRenamePanel(true)
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0._renameConfirmBtn, function()
		local var_33_0 = getInputText(findTF(arg_19_0._renamePanel, "frame/name_field"))

		arg_19_0:emit(FormationMediator.CHANGE_FLEET_NAME, arg_19_0._currentFleetVO.id, var_33_0)
	end, SFX_CONFIRM)
	onButton(arg_19_0, arg_19_0._renameCancelBtn, function()
		arg_19_0:DisplayRenamePanel(false)
	end, SFX_CANCEL)
	onToggle(arg_19_0, arg_19_0._detailToggle, function(arg_35_0)
		arg_19_0:ForceDropChar()

		if arg_35_0 then
			arg_19_0:displayAttrFrame()
		end
	end, SFX_PANEL)
	onToggle(arg_19_0, arg_19_0._formationToggle, function(arg_36_0)
		arg_19_0:ForceDropChar()

		if arg_36_0 then
			arg_19_0:hideAttrFrame()
		end
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0._attrFrame, function()
		triggerToggle(arg_19_0._formationToggle, true)
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.fleetToggleMask, function()
		setActive(arg_19_0.fleetToggleMask, false)
		arg_19_0:tweenTabArrow(true)
	end, SFX_CANCEL)
	onButton(arg_19_0, arg_19_0.btnRegular, function()
		arg_19_0:updateToggleList(_.filter(arg_19_0._fleetVOs, function(arg_40_0)
			return arg_40_0:getFleetType() == FleetType.Normal
		end))

		local var_39_0 = arg_19_0._currentFleetVO:getFleetType() == FleetType.Normal
		local var_39_1 = arg_19_0.index[FleetType.Normal]

		triggerToggle(arg_19_0.fleetToggles[var_39_1], true)

		if var_39_0 then
			setActive(arg_19_0.fleetToggleMask, true)
			arg_19_0:tweenTabArrow(false)
			setAnchoredPosition(arg_19_0.fleetToggleList, Vector3.New(209, 129))
		end
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.btnSub, function()
		arg_19_0:updateToggleList(_.filter(arg_19_0._fleetVOs, function(arg_42_0)
			return arg_42_0:getFleetType() == FleetType.Submarine
		end))

		local var_41_0 = arg_19_0._currentFleetVO:getFleetType() == FleetType.Submarine
		local var_41_1 = arg_19_0.index[FleetType.Submarine]

		triggerToggle(arg_19_0.fleetToggles[var_41_1], true)

		if var_41_0 then
			setActive(arg_19_0.fleetToggleMask, true)
			arg_19_0:tweenTabArrow(false)
			setAnchoredPosition(arg_19_0.fleetToggleList, Vector3.New(755, 129))
		end
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0._prevPage, function()
		local var_43_0 = arg_19_0:selectFleetByStep(-1)

		arg_19_0:ForceDropChar()
		arg_19_0:emit(FormationMediator.ON_CHANGE_FLEET, var_43_0)
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0._nextPage, function()
		local var_44_0 = arg_19_0:selectFleetByStep(1)

		arg_19_0:ForceDropChar()
		arg_19_0:emit(FormationMediator.ON_CHANGE_FLEET, var_44_0)
	end, SFX_PANEL)

	local var_19_1 = defaultValue(arg_19_0.contextData.number, 1)

	arg_19_0:SetCurrentFleetID(var_19_1)

	if arg_19_0.isOpenCommander then
		arg_19_0.commanderFormationPanel:ActionInvoke("Show")
	end

	arg_19_0:UpdateFleetView(true)
	triggerToggle(arg_19_0[arg_19_0.contextData.toggle or var_0_0.TOGGLE_FORMATION], true)
	arg_19_0:tweenTabArrow(true)
	onButton(arg_19_0, arg_19_0._vanguardGS:Find("SonarTip"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.fleet_antisub_range_tip.tip
		})
	end, SFX_PANEL)
end

function var_0_0.SetCurrentFleetID(arg_46_0, arg_46_1)
	arg_46_0._currentFleetVO = arg_46_0:getFleetById(arg_46_1)

	arg_46_0._formationLogic:SetFleetVO(arg_46_0._currentFleetVO)
	arg_46_0:updateCommanderFormation()
end

function var_0_0.updateCommanderFormation(arg_47_0)
	if arg_47_0.isOpenCommander then
		arg_47_0.commanderFormationPanel:Load()
		arg_47_0.commanderFormationPanel:ActionInvoke("Update", arg_47_0._currentFleetVO, arg_47_0.commanderPrefabFleets)
	end
end

function var_0_0.selectFleetByStep(arg_48_0, arg_48_1)
	local var_48_0 = table.indexof(arg_48_0._fleetVOs, arg_48_0._currentFleetVO)

	while true do
		var_48_0 = var_48_0 + arg_48_1

		if var_48_0 < 1 or var_48_0 > #arg_48_0._fleetVOs then
			break
		end

		local var_48_1 = arg_48_0._fleetVOs[var_48_0]

		if var_48_1:isUnlock() then
			return var_48_1.id
		end
	end
end

function var_0_0.updateToggleList(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_0.fleetToggleList:GetComponent(typeof(ToggleGroup))

	var_49_0.allowSwitchOff = true

	local var_49_1 = arg_49_0._currentFleetVO.id

	for iter_49_0 = 1, #arg_49_0.fleetToggles do
		local var_49_2 = arg_49_0.fleetToggles[iter_49_0]
		local var_49_3 = arg_49_1[iter_49_0]

		setActive(var_49_2, var_49_3)

		if var_49_3 then
			local var_49_4 = var_49_2:GetComponent(typeof(Toggle))
			local var_49_5 = var_49_2:Find("lock")
			local var_49_6, var_49_7 = var_49_3:isUnlock()

			setToggleEnabled(var_49_2, var_49_6)
			setActive(var_49_5, not var_49_6)
			setActive(var_49_2:Find("on"), var_49_6 and var_49_1 == var_49_3.id)
			setActive(var_49_2:Find("off"), var_49_6 and var_49_1 ~= var_49_3.id)

			if var_49_6 then
				var_49_4.isOn = var_49_3.id == var_49_1

				onToggle(arg_49_0, var_49_2, function(arg_50_0)
					if arg_50_0 then
						setActive(arg_49_0.fleetToggleMask, false)
						arg_49_0:tweenTabArrow(true)

						if var_49_3.id ~= var_49_1 then
							arg_49_0:ForceDropChar()
							arg_49_0:emit(FormationMediator.ON_CHANGE_FLEET, var_49_3.id)
						end
					end
				end, SFX_UI_TAG)
			else
				onButton(arg_49_0, var_49_5, function()
					pg.TipsMgr.GetInstance():ShowTips(var_49_7)
				end, SFX_UI_CLICK)
			end
		end
	end

	var_49_0.allowSwitchOff = false
end

function var_0_0.resetFormationComponent(arg_52_0)
	SetActive(arg_52_0._gridTFs.main[1]:Find("flag"), #arg_52_0._currentFleetVO:getTeamByName(TeamType.Main) ~= 0)
	SetActive(arg_52_0._gridTFs.submarine[1]:Find("flag"), #arg_52_0._currentFleetVO:getTeamByName(TeamType.Submarine) ~= 0)
end

function var_0_0.sortCardSiblingIndex(arg_53_0)
	local var_53_0 = {
		TeamType.Main,
		TeamType.Vanguard,
		TeamType.Submarine
	}

	_.each(var_53_0, function(arg_54_0)
		local var_54_0 = arg_53_0._cards[arg_54_0]

		if #var_54_0 > 0 then
			for iter_54_0 = 1, #var_54_0 do
				var_54_0[iter_54_0].tr:SetSiblingIndex(iter_54_0 - 1)
			end
		end
	end)
end

function var_0_0.displayFleetInfo(arg_55_0)
	SetActive(arg_55_0._prevPage, arg_55_0:selectFleetByStep(-1))
	SetActive(arg_55_0._nextPage, arg_55_0:selectFleetByStep(1))
	setActive(arg_55_0._adapt:Find("gear_score"), true)
	setActive(arg_55_0._vanguardGS, false)
	setActive(arg_55_0._mainGS, false)
	setActive(arg_55_0._subGS, false)

	local var_55_0 = arg_55_0._currentFleetVO:GetPropertiesSum()
	local var_55_1 = math.floor(arg_55_0._currentFleetVO:GetGearScoreSum(TeamType.Vanguard))
	local var_55_2 = math.floor(arg_55_0._currentFleetVO:GetGearScoreSum(TeamType.Main))
	local var_55_3 = math.floor(arg_55_0._currentFleetVO:GetGearScoreSum(TeamType.Submarine))
	local var_55_4 = arg_55_0._currentFleetVO:GetCostSum()

	arg_55_0.tweenNumText(arg_55_0._cannonPower, var_55_0.cannon)
	arg_55_0.tweenNumText(arg_55_0._torpedoPower, var_55_0.torpedo)
	arg_55_0.tweenNumText(arg_55_0._AAPower, var_55_0.antiAir)
	arg_55_0.tweenNumText(arg_55_0._airPower, var_55_0.air)
	arg_55_0.tweenNumText(arg_55_0._cost, var_55_4.oil)

	if OPEN_AIR_DOMINANCE then
		setActive(arg_55_0._airDominance.parent, true)
		arg_55_0.tweenNumText(arg_55_0._airDominance, arg_55_0._currentFleetVO:getFleetAirDominanceValue())
	else
		setActive(arg_55_0._airDominance.parent, false)
	end

	local var_55_5 = arg_55_0._currentFleetVO:getFleetType()

	if var_55_5 == FleetType.Normal then
		setActive(arg_55_0._vanguardGS, true)
		setActive(arg_55_0._mainGS, true)
		setActive(arg_55_0._arrUpVan, false)
		setActive(arg_55_0._arrDownVan, false)
		setActive(arg_55_0._arrUpMain, false)
		setActive(arg_55_0._arrDownMain, false)

		arg_55_0.prevVanGS = tonumber(arg_55_0._vanGSTxt.text)

		arg_55_0.tweenNumText(arg_55_0._vanguardGS:Find("Text"), var_55_1)

		if arg_55_0.VanGSInited then
			setActive(arg_55_0._arrUpVan, var_55_1 > arg_55_0.prevVanGS)
			setActive(arg_55_0._arrDownVan, var_55_1 < arg_55_0.prevVanGS)
		end

		arg_55_0.prevMainGS = tonumber(arg_55_0._mainGSTxt.text)

		arg_55_0.tweenNumText(arg_55_0._mainGS:Find("Text"), var_55_2)

		if arg_55_0.mainGSInited then
			setActive(arg_55_0._arrUpMain, var_55_2 > arg_55_0.prevMainGS)
			setActive(arg_55_0._arrDownMain, var_55_2 < arg_55_0.prevMainGS)
		end

		arg_55_0.contextData.mainGS = var_55_2
		arg_55_0.contextData.vanGS = var_55_1
		arg_55_0.mainGSInited = true
		arg_55_0.VanGSInited = true

		local var_55_6 = arg_55_0._currentFleetVO:GetFleetSonarRange()

		setActive(arg_55_0._vanguardGS:Find("SonarActive"), var_55_6 > 0)
		setActive(arg_55_0._vanguardGS:Find("SonarInactive"), var_55_6 <= 0)

		local function var_55_7()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.fleet_antisub_range_tip.tip
			})
		end

		if var_55_6 > 0 then
			setText(arg_55_0._vanguardGS:Find("SonarActive/Text"), math.floor(var_55_6))
			onButton(arg_55_0, arg_55_0._vanguardGS:Find("SonarActive"), var_55_7, SFX_PANEL)
		else
			onButton(arg_55_0, arg_55_0._vanguardGS:Find("SonarInactive"), var_55_7, SFX_PANEL)
		end
	elseif var_55_5 == FleetType.Submarine then
		setActive(arg_55_0._arrUpSub, false)
		setActive(arg_55_0._arrDownSub, false)
		setActive(arg_55_0._subGS, true)

		arg_55_0.prevSubGS = tonumber(arg_55_0._subGSTxt.text)

		arg_55_0.tweenNumText(arg_55_0._subGS:Find("Text"), var_55_3)

		if arg_55_0.SubGSInited then
			setActive(arg_55_0._arrUpSub, var_55_3 > arg_55_0.prevSubGS)
			setActive(arg_55_0._arrDownSub, var_55_3 < arg_55_0.prevSubGS)
		end

		arg_55_0.contextData.subGS = var_55_3
		arg_55_0.SubGSInited = true
	end

	arg_55_0:SetFleetNameLabel()
	setText(arg_55_0._fleetNumText, arg_55_0._currentFleetVO:getIndex())
end

function var_0_0.DisplayRenamePanel(arg_57_0, arg_57_1)
	SetActive(arg_57_0._renamePanel, arg_57_1)

	if arg_57_1 then
		pg.UIMgr.GetInstance():BlurPanel(arg_57_0._renamePanel)

		local var_57_0 = getText(arg_57_0._fleetNameText)

		setInputText(findTF(arg_57_0._renamePanel, "frame/name_field"), var_57_0)
	else
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_57_0._renamePanel, arg_57_0._tf)
	end
end

function var_0_0.hideAttrFrame(arg_58_0)
	SetActive(arg_58_0._attrFrame, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_58_0._blurLayer, arg_58_0._tf)
end

function var_0_0.displayAttrFrame(arg_59_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_59_0._blurLayer)
	SetActive(arg_59_0._attrFrame, true)
	arg_59_0:initAttrFrame()
end

function var_0_0.initAttrFrame(arg_60_0)
	local var_60_0 = {
		[TeamType.Main] = arg_60_0._currentFleetVO.mainShips,
		[TeamType.Vanguard] = arg_60_0._currentFleetVO.vanguardShips,
		[TeamType.Submarine] = arg_60_0._currentFleetVO.subShips
	}
	local var_60_1 = false

	for iter_60_0, iter_60_1 in pairs(var_60_0) do
		local var_60_2 = arg_60_0._cards[iter_60_0]

		if #var_60_2 == 0 then
			local var_60_3 = arg_60_0._attrFrame:Find(iter_60_0 .. "/list")

			for iter_60_2 = 1, 3 do
				local var_60_4 = cloneTplTo(arg_60_0._cardTpl, var_60_3).gameObject

				table.insert(var_60_2, FormationDetailCard.New(var_60_4))
			end

			var_60_1 = true
		end
	end

	if var_60_1 then
		arg_60_0:updateAttrFrame()
	end
end

function var_0_0.updateAttrFrame(arg_61_0)
	local var_61_0 = {
		[TeamType.Main] = arg_61_0._currentFleetVO.mainShips,
		[TeamType.Vanguard] = arg_61_0._currentFleetVO.vanguardShips,
		[TeamType.Submarine] = arg_61_0._currentFleetVO.subShips
	}
	local var_61_1 = arg_61_0._currentFleetVO:getFleetType()

	for iter_61_0, iter_61_1 in pairs(var_61_0) do
		local var_61_2 = arg_61_0._cards[iter_61_0]

		if #var_61_2 > 0 then
			local var_61_3 = var_61_1 == FleetType.Submarine and iter_61_0 == TeamType.Vanguard

			for iter_61_2 = 1, 3 do
				if iter_61_2 <= #iter_61_1 then
					local var_61_4 = arg_61_0.shipVOs[iter_61_1[iter_61_2]]

					var_61_2[iter_61_2]:update(var_61_4, var_61_3)
					var_61_2[iter_61_2]:updateProps(arg_61_0:getCardAttrProps(var_61_4))
				else
					var_61_2[iter_61_2]:update(nil, var_61_3)
				end

				arg_61_0:detachOnCardButton(var_61_2[iter_61_2])

				if not var_61_3 then
					arg_61_0:attachOnCardButton(var_61_2[iter_61_2], iter_61_0)
				end
			end
		end
	end

	setActive(arg_61_0._attrFrame:Find(TeamType.Main), var_61_1 == FleetType.Normal)
	setActive(arg_61_0._attrFrame:Find(TeamType.Submarine), var_61_1 == FleetType.Submarine)
	setActive(arg_61_0._attrFrame:Find(TeamType.Vanguard .. "/vanguard"), var_61_1 ~= FleetType.Submarine)
	arg_61_0:updateUltimateTitle()
end

function var_0_0.updateUltimateTitle(arg_62_0)
	local var_62_0 = arg_62_0._cards[TeamType.Main]
	local var_62_1 = arg_62_0._currentFleetVO.mainShips

	if #var_62_0 > 0 then
		for iter_62_0 = 1, #var_62_0 do
			go(var_62_0[iter_62_0].shipState):SetActive(iter_62_0 == 1)
		end
	end
end

function var_0_0.getCardAttrProps(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_1:getProperties()
	local var_63_1 = arg_63_1:getShipCombatPower()
	local var_63_2 = arg_63_1:getBattleTotalExpend()

	return {
		{
			i18n("word_attr_durability"),
			tostring(math.floor(var_63_0.durability))
		},
		{
			i18n("word_attr_luck"),
			"" .. tostring(math.floor(var_63_2))
		},
		{
			i18n("word_synthesize_power"),
			"<color=#ffff00>" .. var_63_1 .. "</color>"
		}
	}
end

function var_0_0.detachOnCardButton(arg_64_0, arg_64_1)
	local var_64_0 = GetOrAddComponent(arg_64_1.go, "EventTriggerListener")

	var_64_0:RemovePointClickFunc()
	var_64_0:RemoveBeginDragFunc()
	var_64_0:RemoveDragFunc()
	var_64_0:RemoveDragEndFunc()
end

function var_0_0.attachOnCardButton(arg_65_0, arg_65_1, arg_65_2)
	local var_65_0 = GetOrAddComponent(arg_65_1.go, "EventTriggerListener")

	arg_65_0.eventTriggers[var_65_0] = true

	var_65_0:AddPointClickFunc(function(arg_66_0, arg_66_1)
		if not arg_65_0.carddrag and arg_66_0 == arg_65_1.go then
			if arg_65_1.shipVO then
				arg_65_0:emit(FormationMediator.OPEN_SHIP_INFO, arg_65_1.shipVO.id, arg_65_0._currentFleetVO, var_0_0.TOGGLE_DETAIL)
			else
				arg_65_0:emit(FormationMediator.CHANGE_FLEET_SHIP, arg_65_1.shipVO, arg_65_0._currentFleetVO, var_0_0.TOGGLE_DETAIL, arg_65_2)
			end

			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_PANEL)
		end
	end)

	if arg_65_1.shipVO then
		local var_65_1 = arg_65_0._cards[arg_65_2]
		local var_65_2 = arg_65_1.tr.parent:GetComponent("ContentSizeFitter")
		local var_65_3 = arg_65_1.tr.parent:GetComponent("HorizontalLayoutGroup")
		local var_65_4 = arg_65_1.tr.rect.width * 0.5
		local var_65_5 = {}

		var_65_0:AddBeginDragFunc(function()
			if arg_65_0.carddrag then
				return
			end

			arg_65_0._currentDragDelegate = var_65_0
			arg_65_0.carddrag = arg_65_1
			var_65_2.enabled = false
			var_65_3.enabled = false

			arg_65_1.tr:SetSiblingIndex(#var_65_1)

			for iter_67_0 = 1, #var_65_1 do
				if var_65_1[iter_67_0] == arg_65_1 then
					arg_65_0._shiftIndex = iter_67_0
				end

				var_65_5[iter_67_0] = var_65_1[iter_67_0].tr.anchoredPosition
			end

			LeanTween.scale(arg_65_1.paintingTr, Vector3(1.1, 1.1, 0), 0.3)
		end)
		var_65_0:AddDragFunc(function(arg_68_0, arg_68_1)
			if arg_65_0.carddrag ~= arg_65_1 then
				return
			end

			local var_68_0 = arg_65_1.tr.localPosition

			var_68_0.x = arg_65_0:change2ScrPos(arg_65_1.tr.parent, arg_68_1.position).x
			arg_65_1.tr.localPosition = var_68_0

			local var_68_1 = 1

			for iter_68_0 = 1, #var_65_1 do
				if var_65_1[iter_68_0] ~= arg_65_1 and var_65_1[iter_68_0].shipVO and arg_65_1.tr.localPosition.x > var_65_1[iter_68_0].tr.localPosition.x + (var_68_1 < arg_65_0._shiftIndex and 1.1 or -1.1) * var_65_4 then
					var_68_1 = var_68_1 + 1
				end
			end

			if arg_65_0._shiftIndex ~= var_68_1 then
				arg_65_0._formationLogic:Shift(arg_65_0._shiftIndex, var_68_1, arg_65_2)
				arg_65_0:shiftCard(arg_65_0._shiftIndex, var_68_1, arg_65_2)

				for iter_68_1 = 1, #var_65_1 do
					if var_65_1[iter_68_1] and var_65_1[iter_68_1] ~= arg_65_1 then
						var_65_1[iter_68_1].tr.anchoredPosition = var_65_5[iter_68_1]
					end
				end
			end
		end)
		var_65_0:AddDragEndFunc(function(arg_69_0, arg_69_1)
			if arg_65_0.carddrag ~= arg_65_1 then
				return
			end

			function resetCard()
				for iter_70_0 = 1, #var_65_1 do
					var_65_1[iter_70_0].tr.anchoredPosition = var_65_5[iter_70_0]
				end

				var_65_2.enabled = true
				var_65_3.enabled = true
				arg_65_0._shiftIndex = nil

				arg_65_0:updateUltimateTitle()
				arg_65_0._formationLogic:SortSiblingIndex()
				arg_65_0:sortCardSiblingIndex()
				arg_65_0:emit(FormationMediator.CHANGE_FLEET_SHIPS_ORDER, arg_65_0._currentFleetVO)

				var_65_0.enabled = true
				arg_65_0.carddrag = nil
			end

			local var_69_0 = arg_65_0._forceDropCharacter

			arg_65_0._forceDropCharacter = nil
			arg_65_0._currentDragDelegate = nil
			var_65_0.enabled = false

			if var_69_0 then
				resetCard()

				arg_65_1.paintingTr.localScale = Vector3(1, 1, 0)
			else
				local var_69_1 = math.min(math.abs(arg_65_1.tr.anchoredPosition.x - var_65_5[arg_65_0._shiftIndex].x) / 200, 1) * 0.3

				LeanTween.value(arg_65_1.go, arg_65_1.tr.anchoredPosition.x, var_65_5[arg_65_0._shiftIndex].x, var_69_1):setEase(LeanTweenType.easeOutCubic):setOnUpdate(System.Action_float(function(arg_71_0)
					local var_71_0 = arg_65_1.tr.anchoredPosition

					var_71_0.x = arg_71_0
					arg_65_1.tr.anchoredPosition = var_71_0
				end)):setOnComplete(System.Action(function()
					resetCard()
					LeanTween.scale(arg_65_1.paintingTr, Vector3(1, 1, 0), 0.3)
				end))
			end
		end)
	end
end

function var_0_0.shiftCard(arg_73_0, arg_73_1, arg_73_2, arg_73_3)
	local var_73_0 = arg_73_0._cards[arg_73_3]

	if #var_73_0 > 0 then
		var_73_0[arg_73_1], var_73_0[arg_73_2] = var_73_0[arg_73_2], var_73_0[arg_73_1]
	end

	arg_73_0._shiftIndex = arg_73_2
end

function var_0_0.change2ScrPos(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = pg.UIMgr.GetInstance().overlayCameraComp

	return (LuaHelper.ScreenToLocal(arg_74_1, arg_74_2, var_74_0))
end

function var_0_0.tweenNumText(arg_75_0, arg_75_1, arg_75_2, arg_75_3, arg_75_4)
	LeanTween.value(go(arg_75_0), arg_75_4 or 0, math.floor(arg_75_1), arg_75_2 or 0.7):setOnUpdate(System.Action_float(function(arg_76_0)
		setText(arg_75_0, math.floor(arg_76_0))
	end)):setOnComplete(System.Action(function()
		if arg_75_3 then
			arg_75_3()
		end
	end))
end

function var_0_0.defaultFleetName(arg_78_0)
	if arg_78_0.name == "" or arg_78_0.name == nil then
		return Fleet.DEFAULT_NAME[arg_78_0.id]
	else
		return arg_78_0.name
	end
end

function var_0_0.GetFleetCount(arg_79_0)
	local var_79_0 = 0

	for iter_79_0, iter_79_1 in pairs(arg_79_0._fleetVOs) do
		var_79_0 = var_79_0 + 1
	end

	return var_79_0
end

function var_0_0.tweenTabArrow(arg_80_0, arg_80_1)
	local var_80_0 = arg_80_0.btnRegular:Find("arr")
	local var_80_1 = arg_80_0.btnSub:Find("arr")

	setActive(var_80_0, arg_80_1)
	setActive(var_80_1, arg_80_1)

	if arg_80_1 then
		LeanTween.moveLocalY(go(var_80_0), var_80_0.localPosition.y + 8, 0.8):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(-1)
		LeanTween.moveLocalY(go(var_80_1), var_80_1.localPosition.y + 8, 0.8):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(-1)
	else
		LeanTween.cancel(go(var_80_0))
		LeanTween.cancel(go(var_80_1))

		local var_80_2 = var_80_0.localPosition

		var_80_2.y = 80
		var_80_0.localPosition = var_80_2

		local var_80_3 = var_80_1.localPosition

		var_80_3.y = 80
		var_80_1.localPosition = var_80_3
	end
end

function var_0_0.recyclePainting(arg_81_0)
	for iter_81_0, iter_81_1 in pairs(arg_81_0._cards) do
		for iter_81_2, iter_81_3 in ipairs(iter_81_1) do
			iter_81_3:clear()
		end
	end
end

function var_0_0.onBackPressed(arg_82_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if isActive(arg_82_0._renamePanel) then
		arg_82_0:DisplayRenamePanel(false)
	else
		triggerButton(arg_82_0.backBtn)
	end
end

function var_0_0.willExit(arg_83_0)
	arg_83_0.commanderFormationPanel:Destroy()

	if arg_83_0._attrFrame.gameObject.activeSelf then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_83_0._blurLayer, arg_83_0._tf)
	end

	arg_83_0._formationLogic:Destroy()
	arg_83_0:recyclePainting()
	arg_83_0:DisplayRenamePanel(false)
	arg_83_0:tweenTabArrow(false)

	if arg_83_0.tweens then
		cancelTweens(arg_83_0.tweens)
	end

	if arg_83_0.eventTriggers then
		for iter_83_0, iter_83_1 in pairs(arg_83_0.eventTriggers) do
			ClearEventTrigger(iter_83_0)
		end

		arg_83_0.eventTriggers = nil
	end
end

return var_0_0
