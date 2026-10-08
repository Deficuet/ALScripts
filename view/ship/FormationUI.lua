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

function var_0_0.getResource(arg_3_0, arg_3_1)
	local var_3_0 = {
		"shiptype",
		"energy",
		"shipframeb",
		"ui/proposeshipcard"
	}

	return table.insertto(var_3_0, var_0_0.super.getResource(arg_3_0, arg_3_1))
end

function var_0_0.getFleetShipResList(arg_4_0, arg_4_1)
	local var_4_0 = {}
	local var_4_1 = arg_4_0.shipVOs or {}

	if arg_4_1 then
		_.each(arg_4_1:getShipIds(), function(arg_5_0)
			local var_5_0 = var_4_1[arg_5_0]

			if var_5_0 then
				local var_5_1 = ResPathSupport.GetSpineCharListByPrefabName(var_5_0:getPrefab())

				table.insertto(var_4_0, var_5_1)

				if pg.ship_skin_expression[var_5_0:getPrefab()] then
					table.insert(var_4_0, "paintingface/" .. var_5_0:getPrefab())
				end

				local var_5_2 = var_5_0:getPainting()

				table.insertto(var_4_0, ResPathSupport.GetPaintingListByPaintingName(var_5_2))

				local var_5_3 = string.format(ResPathSupport.ConstPath.BG.ShipCard, var_5_0:rarity2bgPrint())

				table.insert(var_4_0, var_5_3)

				local var_5_4, var_5_5 = var_5_0:GetFrameAndEffect(true)
				local var_5_6 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Effect, var_5_5)

				table.insert(var_4_0, var_5_6)
				_.each(var_5_0:getAttachmentPrefab(), function(arg_6_0)
					local var_6_0 = arg_6_0.config
					local var_6_1 = var_6_0 and var_6_0.orbit_ui

					if noEmptyStr(var_6_1) then
						table.insert(var_4_0, ys.Battle.BattleResourceManager.GetOrbitPath(var_6_1))
					end
				end)
			end
		end)
	end

	return var_4_0
end

function var_0_0.setPlayer(arg_7_0, arg_7_1)
	arg_7_0.player = arg_7_1
end

function var_0_0.setCommanderPrefabFleet(arg_8_0, arg_8_1)
	arg_8_0.commanderPrefabFleets = arg_8_1
end

function var_0_0.init(arg_9_0)
	arg_9_0.eventTriggers = {}
	arg_9_0.backBtn = arg_9_0._blurLayer:Find("top/back_btn")
	arg_9_0._bgFleet = arg_9_0._adapt:Find("bg_fleet")
	arg_9_0._bgSub = arg_9_0._adapt:Find("bg_sub")
	arg_9_0._bottomPanel = arg_9_0._blurLayer:Find("bottom")
	arg_9_0._detailToggle = arg_9_0._bottomPanel:Find("toggle_list/detail_toggle")
	arg_9_0._formationToggle = arg_9_0._bottomPanel:Find("toggle_list/formation_toggle")
	arg_9_0._nextPage = arg_9_0._adapt:Find("nextPage")
	arg_9_0._prevPage = arg_9_0._adapt:Find("prevPage")
	arg_9_0._starTpl = arg_9_0._tf:Find("star_tpl")
	arg_9_0._heroInfoTpl = arg_9_0._tf:Find("heroInfo")
	arg_9_0.topPanel = arg_9_0._blurLayer:Find("top")
	arg_9_0._gridTFs = {
		[TeamType.Vanguard] = {},
		[TeamType.Main] = {},
		[TeamType.Submarine] = {}
	}
	arg_9_0._gridFrame = arg_9_0._adapt:Find("GridFrame")

	for iter_9_0 = 1, 3 do
		arg_9_0._gridTFs[TeamType.Main][iter_9_0] = arg_9_0._gridFrame:Find("main_" .. iter_9_0)
		arg_9_0._gridTFs[TeamType.Vanguard][iter_9_0] = arg_9_0._gridFrame:Find("vanguard_" .. iter_9_0)
		arg_9_0._gridTFs[TeamType.Submarine][iter_9_0] = arg_9_0._gridFrame:Find("submarine_" .. iter_9_0)
	end

	arg_9_0._heroContainer = arg_9_0._adapt:Find("HeroContainer")
	arg_9_0._formationLogic = BaseFormation.New(arg_9_0._tf, arg_9_0._heroContainer, arg_9_0._heroInfoTpl, arg_9_0._gridTFs)
	arg_9_0._fleetInfo = arg_9_0._blurLayer:Find("fleet_info")
	arg_9_0._fleetNumText = arg_9_0._fleetInfo:Find("fleet_number")
	arg_9_0._fleetNameText = arg_9_0._fleetInfo:Find("fleet_name/Text")
	arg_9_0._fleetNameEditBtn = arg_9_0._fleetInfo:Find("edit_btn")
	arg_9_0._renamePanel = arg_9_0._tf:Find("changeName_panel")
	arg_9_0._renameConfirmBtn = arg_9_0._renamePanel:Find("frame/queren")
	arg_9_0._renameCancelBtn = arg_9_0._renamePanel:Find("frame/cancel")

	setLocalPosition(arg_9_0._renamePanel, {
		z = -45
	})

	arg_9_0._propertyFrame = arg_9_0._blurLayer:Find("property_frame")
	arg_9_0._cannonPower = arg_9_0._propertyFrame:Find("cannon/Text")
	arg_9_0._torpedoPower = arg_9_0._propertyFrame:Find("torpedo/Text")
	arg_9_0._AAPower = arg_9_0._propertyFrame:Find("antiaircraft/Text")
	arg_9_0._airPower = arg_9_0._propertyFrame:Find("air/Text")
	arg_9_0._airDominance = arg_9_0._propertyFrame:Find("ac/Text")
	arg_9_0._cost = arg_9_0._propertyFrame:Find("cost/Text")
	arg_9_0._mainGS = arg_9_0._adapt:Find("gear_score/main")
	arg_9_0._vanguardGS = arg_9_0._adapt:Find("gear_score/vanguard")
	arg_9_0._subGS = arg_9_0._adapt:Find("gear_score/submarine")
	arg_9_0._arrUpVan = arg_9_0._vanguardGS:Find("up")
	arg_9_0._arrDownVan = arg_9_0._vanguardGS:Find("down")
	arg_9_0._arrUpMain = arg_9_0._mainGS:Find("up")
	arg_9_0._arrDownMain = arg_9_0._mainGS:Find("down")
	arg_9_0._arrUpSub = arg_9_0._subGS:Find("up")
	arg_9_0._arrDownSub = arg_9_0._subGS:Find("down")
	arg_9_0._attrFrame = arg_9_0._blurLayer:Find("attr_frame")
	arg_9_0._cardTpl = arg_9_0._tf:Find("RectShipCardTpl")
	arg_9_0._cards = {}
	arg_9_0._cards[TeamType.Main] = {}
	arg_9_0._cards[TeamType.Vanguard] = {}
	arg_9_0._cards[TeamType.Submarine] = {}

	setActive(arg_9_0._attrFrame, false)
	setActive(arg_9_0._cardTpl, false)

	arg_9_0.btnRegular = arg_9_0._bottomPanel:Find("fleet_select/regular")
	arg_9_0._regularEnFllet = arg_9_0.btnRegular:Find("fleet/enFleet")
	arg_9_0._regularNum = arg_9_0.btnRegular:Find("fleet/num")
	arg_9_0._regualrCnFleet = arg_9_0.btnRegular:Find("fleet/CnFleet")
	arg_9_0.btnSub = arg_9_0._bottomPanel:Find("fleet_select/sub")
	arg_9_0._subEnFllet = arg_9_0.btnSub:Find("fleet/enFleet")
	arg_9_0._subNum = arg_9_0.btnSub:Find("fleet/num")
	arg_9_0._subCnFleet = arg_9_0.btnSub:Find("fleet/CnFleet")
	arg_9_0.fleetToggleMask = arg_9_0._tf:Find("blur_panel/list_mask")
	arg_9_0.fleetToggleList = arg_9_0.fleetToggleMask:Find("list")
	arg_9_0.fleetToggles = {}

	for iter_9_1 = 1, var_0_0.MAX_FLEET_NUM do
		arg_9_0.fleetToggles[iter_9_1] = arg_9_0.fleetToggleList:Find("item" .. iter_9_1)
	end

	arg_9_0._vanGSTxt = arg_9_0._vanguardGS:Find("Text"):GetComponent("Text")
	arg_9_0._mainGSTxt = arg_9_0._mainGS:Find("Text"):GetComponent("Text")
	arg_9_0._subGSTxt = arg_9_0._subGS:Find("Text"):GetComponent("Text")
	arg_9_0.prevMainGS = arg_9_0.contextData.mainGS
	arg_9_0.prevVanGS = arg_9_0.contextData.vanGS
	arg_9_0.prevSubGS = arg_9_0.contextData.subGS
	arg_9_0.mainGSInited = arg_9_0.contextData.mainGS and true or false
	arg_9_0.VanGSInited = arg_9_0.contextData.vanGS and true or false
	arg_9_0.SubGSInited = arg_9_0.contextData.subGS and true or false
	arg_9_0._vanGSTxt.text = arg_9_0.prevVanGS or 0
	arg_9_0._mainGSTxt.text = arg_9_0.prevMainGS or 0
	arg_9_0._subGSTxt.text = arg_9_0.prevSubGS or 0
	arg_9_0.commanderFormationPanel = CommanderFormationPage.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)
	arg_9_0.index = {
		[FleetType.Normal] = 1,
		[FleetType.Submarine] = 1
	}

	setText(arg_9_0._adapt:Find("gear_score/main/line/Image/text1"), i18n("pre_combat_main"))
	setText(arg_9_0._adapt:Find("gear_score/vanguard/line/Image/text1"), i18n("pre_combat_vanguard"))
	setText(arg_9_0._adapt:Find("gear_score/submarine/line/Image/text1"), i18n("pre_combat_submarine"))
end

function var_0_0.setShips(arg_10_0, arg_10_1)
	arg_10_0.shipVOs = arg_10_1

	arg_10_0._formationLogic:SetShipVOs(arg_10_0.shipVOs)
end

function var_0_0.SetFleets(arg_11_0, arg_11_1)
	arg_11_0._fleetVOs = _(arg_11_1):chain():values():filter(function(arg_12_0)
		return arg_12_0:isRegularFleet()
	end):sort(function(arg_13_0, arg_13_1)
		return arg_13_0.id < arg_13_1.id
	end):value()

	if arg_11_0._currentFleetVO then
		arg_11_0._currentFleetVO = arg_11_0:getFleetById(arg_11_0._currentFleetVO.id)

		arg_11_0._formationLogic:SetFleetVO(arg_11_0._currentFleetVO)
	end
end

function var_0_0.getFleetById(arg_14_0, arg_14_1)
	return _.detect(arg_14_0._fleetVOs, function(arg_15_0)
		return arg_15_0.id == arg_14_1
	end)
end

function var_0_0.UpdateFleetView(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0:getFleetShipResList(arg_16_0._currentFleetVO)

	SplitPackConst.DownloadByLuaArr(var_16_0, function()
		if arg_16_0.exited then
			return
		end

		arg_16_0:updateFleetViewAfterResDownload(arg_16_1)
	end)
end

function var_0_0.updateFleetViewAfterResDownload(arg_18_0, arg_18_1)
	arg_18_0:displayFleetInfo()
	arg_18_0:updateFleetBg()
	arg_18_0._formationLogic:UpdateGridVisibility()
	arg_18_0._formationLogic:ResetGrid(TeamType.Vanguard)
	arg_18_0._formationLogic:ResetGrid(TeamType.Main)
	arg_18_0._formationLogic:ResetGrid(TeamType.Submarine)
	arg_18_0:resetFormationComponent()
	arg_18_0:updateAttrFrame()
	arg_18_0:updateFleetButton()

	if arg_18_1 then
		arg_18_0._formationLogic:LoadAllCharacter()
	else
		arg_18_0._formationLogic:SetAllCharacterPos()
	end
end

function var_0_0.updateFleetBg(arg_19_0)
	local var_19_0 = arg_19_0._currentFleetVO:getFleetType()

	setActive(arg_19_0._bgFleet, var_19_0 == FleetType.Normal)
	setActive(arg_19_0._bgSub, var_19_0 == FleetType.Submarine)
end

function var_0_0.updateFleetButton(arg_20_0)
	local var_20_0
	local var_20_1 = arg_20_0._currentFleetVO:getFleetType()

	arg_20_0.index[var_20_1] = arg_20_0._currentFleetVO:getIndex()

	local var_20_2 = arg_20_0.index[FleetType.Normal]

	setText(arg_20_0._regularEnFllet, var_0_0.TeamNum[var_20_2] .. " FLEET")
	setText(arg_20_0._regualrCnFleet, Fleet.DEFAULT_NAME[var_20_2])
	setText(arg_20_0._regularNum, var_20_2)

	local var_20_3 = arg_20_0.index[FleetType.Submarine]

	setText(arg_20_0._subEnFllet, var_0_0.TeamNum[var_20_3] .. " FLEET")
	setText(arg_20_0._subCnFleet, Fleet.DEFAULT_NAME[var_20_3])
	setText(arg_20_0._subNum, var_20_3)
	setActive(arg_20_0.btnRegular:Find("on"), var_20_1 == FleetType.Normal)
	setActive(arg_20_0.btnRegular:Find("off"), var_20_1 ~= FleetType.Normal)
	setActive(arg_20_0.btnSub:Find("on"), var_20_1 == FleetType.Submarine)
	setActive(arg_20_0.btnSub:Find("off"), var_20_1 ~= FleetType.Submarine)
end

function var_0_0.SetFleetNameLabel(arg_21_0)
	setText(arg_21_0._fleetNameText, arg_21_0.defaultFleetName(arg_21_0._currentFleetVO))
end

function var_0_0.ForceDropChar(arg_22_0)
	arg_22_0._formationLogic:ForceDropChar()

	if arg_22_0._currentDragDelegate then
		arg_22_0._forceDropCharacter = true

		LuaHelper.triggerEndDrag(arg_22_0._currentDragDelegate)
	end
end

function var_0_0.quickExitFunc(arg_23_0)
	arg_23_0:ForceDropChar()

	local function var_23_0()
		GetOrAddComponent(arg_23_0._tf, typeof(CanvasGroup)).interactable = false

		arg_23_0:emit(var_0_0.ON_HOME)
	end

	arg_23_0:emit(FormationMediator.COMMIT_FLEET, var_23_0)
end

function var_0_0.OnVisible(arg_25_0)
	if arg_25_0._currentFleetVO then
		arg_25_0:UpdateFleetView(true)
	end
end

function var_0_0.didEnter(arg_26_0)
	arg_26_0.isOpenCommander = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_26_0.player.level, "CommanderCatMediator") and not LOCK_COMMANDER

	local var_26_0 = getProxy(ActivityProxy):getBuffShipList()

	arg_26_0._formationLogic:AddHeroInfoModify(function(arg_27_0, arg_27_1)
		local var_27_0 = arg_27_1:getConfigTable()
		local var_27_1 = pg.ship_data_template[arg_27_1.configId]
		local var_27_2 = findTF(arg_27_0, "info")
		local var_27_3 = findTF(var_27_2, "stars")
		local var_27_4 = findTF(var_27_2, "energy")
		local var_27_5 = arg_27_1:getStar()

		for iter_27_0 = 1, var_27_5 do
			cloneTplTo(arg_26_0._starTpl, var_27_3)
		end

		local var_27_6 = GetSpriteFromAtlas("shiptype", shipType2print(arg_27_1:getShipType()))

		if not var_27_6 then
			warning("找不到船形, shipConfigId: " .. arg_27_1.configId)
		end

		setImageSprite(findTF(var_27_2, "type"), var_27_6, true)
		setText(findTF(var_27_2, "frame/lv_contain/lv"), arg_27_1.level)

		if arg_27_1.energy <= Ship.ENERGY_MID then
			local var_27_7 = GetSpriteFromAtlas("energy", arg_27_1:getEnergyPrint())

			setImageSprite(var_27_4, var_27_7)
			setActive(var_27_4, true)
		end

		local var_27_8 = var_26_0[arg_27_1:getGroupId()]
		local var_27_9 = var_27_2:Find("expbuff")

		setActive(var_27_9, var_27_8 ~= nil)

		if var_27_8 then
			local var_27_10 = var_27_8 / 100
			local var_27_11 = var_27_8 % 100
			local var_27_12 = tostring(var_27_10)

			if var_27_11 > 0 then
				var_27_12 = var_27_12 .. "." .. tostring(var_27_11)
			end

			setText(var_27_9:Find("text"), string.format("EXP +%s%%", var_27_12))
		end
	end)
	arg_26_0._formationLogic:AddLongPress(function(arg_28_0, arg_28_1, arg_28_2)
		arg_26_0:emit(FormationMediator.OPEN_SHIP_INFO, arg_28_1.id, arg_26_0._currentFleetVO, var_0_0.TOGGLE_FORMATION)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_PANEL)
	end)
	arg_26_0._formationLogic:AddClick(function(arg_29_0, arg_29_1)
		arg_26_0:emit(FormationMediator.CHANGE_FLEET_SHIP, arg_29_0, arg_26_0._currentFleetVO, var_0_0.TOGGLE_FORMATION, arg_29_1)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_PANEL)
	end)
	arg_26_0._formationLogic:AddBeginDrag(function(arg_30_0)
		local var_30_0 = findTF(arg_30_0, "info")

		SetActive(var_30_0, false)
	end)
	arg_26_0._formationLogic:AddEndDrag(function(arg_31_0)
		local var_31_0 = findTF(arg_31_0, "info")

		SetActive(var_31_0, true)
	end)
	arg_26_0._formationLogic:AddShiftOnly(function(arg_32_0)
		arg_26_0:emit(FormationMediator.CHANGE_FLEET_SHIPS_ORDER, arg_32_0)
	end)
	arg_26_0._formationLogic:AddRemoveShip(function(arg_33_0, arg_33_1)
		arg_26_0:emit(FormationMediator.REMOVE_SHIP, arg_33_0, arg_33_1)
	end)
	arg_26_0._formationLogic:AddCheckRemove(function(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
		if not arg_34_3:canRemove(arg_34_2) then
			local var_34_0, var_34_1 = arg_34_3:getShipPos(arg_34_2)

			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", arg_34_2:getConfigTable().name, arg_34_3.name, Fleet.C_TEAM_NAME[var_34_1]))
			arg_34_0()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				zIndex = -30,
				hideNo = false,
				content = i18n("ship_formationUI_quest_remove", arg_34_2:getName()),
				onYes = arg_34_1,
				onNo = arg_34_0
			})
		end
	end)
	arg_26_0._formationLogic:AddGridTipClick(function(arg_35_0, arg_35_1)
		arg_26_0:emit(FormationMediator.CHANGE_FLEET_SHIP, nil, arg_35_1, var_0_0.TOGGLE_FORMATION, arg_35_0)
	end)
	onButton(arg_26_0, arg_26_0.backBtn, function()
		arg_26_0:ForceDropChar()

		if arg_26_0._attrFrame.gameObject.activeSelf then
			triggerToggle(arg_26_0._formationToggle, true)
		else
			local function var_36_0()
				GetOrAddComponent(arg_26_0._tf, typeof(CanvasGroup)).interactable = false

				arg_26_0:emit(var_0_0.ON_BACK)
			end

			arg_26_0:emit(FormationMediator.COMMIT_FLEET, var_36_0)
		end
	end, SOUND_BACK)

	arg_26_0._stamp = arg_26_0._adapt:Find("stamp")

	setActive(arg_26_0._stamp, not LOCK_CLICK_MINGSHI and (BATTLE_DEBUG or getProxy(TaskProxy):mingshiTouchFlagEnabled()))
	onButton(arg_26_0, arg_26_0._stamp, function()
		if BATTLE_DEBUG then
			print(arg_26_0._currentFleetVO:genRobotDataString())
		end

		getProxy(TaskProxy):dealMingshiTouchFlag(6)
	end, SFX_CONFIRM)
	onButton(arg_26_0, arg_26_0._fleetNameEditBtn, function()
		arg_26_0:DisplayRenamePanel(true)
	end, SFX_PANEL)
	onButton(arg_26_0, arg_26_0._renameConfirmBtn, function()
		local var_40_0 = getInputText(findTF(arg_26_0._renamePanel, "frame/name_field"))

		arg_26_0:emit(FormationMediator.CHANGE_FLEET_NAME, arg_26_0._currentFleetVO.id, var_40_0)
	end, SFX_CONFIRM)
	onButton(arg_26_0, arg_26_0._renameCancelBtn, function()
		arg_26_0:DisplayRenamePanel(false)
	end, SFX_CANCEL)
	onToggle(arg_26_0, arg_26_0._detailToggle, function(arg_42_0)
		arg_26_0:ForceDropChar()

		if arg_42_0 then
			arg_26_0:displayAttrFrame()
		end
	end, SFX_PANEL)
	onToggle(arg_26_0, arg_26_0._formationToggle, function(arg_43_0)
		arg_26_0:ForceDropChar()

		if arg_43_0 then
			arg_26_0:hideAttrFrame()
		end
	end, SFX_PANEL)
	onButton(arg_26_0, arg_26_0._attrFrame, function()
		triggerToggle(arg_26_0._formationToggle, true)
	end, SFX_PANEL)
	onButton(arg_26_0, arg_26_0.fleetToggleMask, function()
		setActive(arg_26_0.fleetToggleMask, false)
		arg_26_0:tweenTabArrow(true)
	end, SFX_CANCEL)
	onButton(arg_26_0, arg_26_0.btnRegular, function()
		arg_26_0:updateToggleList(_.filter(arg_26_0._fleetVOs, function(arg_47_0)
			return arg_47_0:getFleetType() == FleetType.Normal
		end))

		local var_46_0 = arg_26_0._currentFleetVO:getFleetType() == FleetType.Normal
		local var_46_1 = arg_26_0.index[FleetType.Normal]

		triggerToggle(arg_26_0.fleetToggles[var_46_1], true)

		if var_46_0 then
			setActive(arg_26_0.fleetToggleMask, true)
			arg_26_0:tweenTabArrow(false)
			setAnchoredPosition(arg_26_0.fleetToggleList, Vector3.New(209, 129))
		end
	end, SFX_PANEL)
	onButton(arg_26_0, arg_26_0.btnSub, function()
		arg_26_0:updateToggleList(_.filter(arg_26_0._fleetVOs, function(arg_49_0)
			return arg_49_0:getFleetType() == FleetType.Submarine
		end))

		local var_48_0 = arg_26_0._currentFleetVO:getFleetType() == FleetType.Submarine
		local var_48_1 = arg_26_0.index[FleetType.Submarine]

		triggerToggle(arg_26_0.fleetToggles[var_48_1], true)

		if var_48_0 then
			setActive(arg_26_0.fleetToggleMask, true)
			arg_26_0:tweenTabArrow(false)
			setAnchoredPosition(arg_26_0.fleetToggleList, Vector3.New(755, 129))
		end
	end, SFX_PANEL)
	onButton(arg_26_0, arg_26_0._prevPage, function()
		local var_50_0 = arg_26_0:selectFleetByStep(-1)

		arg_26_0:ForceDropChar()
		arg_26_0:emit(FormationMediator.ON_CHANGE_FLEET, var_50_0)
	end, SFX_PANEL)
	onButton(arg_26_0, arg_26_0._nextPage, function()
		local var_51_0 = arg_26_0:selectFleetByStep(1)

		arg_26_0:ForceDropChar()
		arg_26_0:emit(FormationMediator.ON_CHANGE_FLEET, var_51_0)
	end, SFX_PANEL)

	local var_26_1 = defaultValue(arg_26_0.contextData.number, 1)

	arg_26_0:SetCurrentFleetID(var_26_1)

	if arg_26_0.isOpenCommander then
		arg_26_0.commanderFormationPanel:ActionInvoke("Show")
	end

	arg_26_0:UpdateFleetView(true)
	triggerToggle(arg_26_0[arg_26_0.contextData.toggle or var_0_0.TOGGLE_FORMATION], true)
	arg_26_0:tweenTabArrow(true)
	onButton(arg_26_0, arg_26_0._vanguardGS:Find("SonarTip"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.fleet_antisub_range_tip.tip
		})
	end, SFX_PANEL)
end

function var_0_0.SetCurrentFleetID(arg_53_0, arg_53_1)
	arg_53_0._currentFleetVO = arg_53_0:getFleetById(arg_53_1)

	arg_53_0._formationLogic:SetFleetVO(arg_53_0._currentFleetVO)
	arg_53_0:updateCommanderFormation()
end

function var_0_0.updateCommanderFormation(arg_54_0)
	if arg_54_0.isOpenCommander then
		arg_54_0.commanderFormationPanel:Load()
		arg_54_0.commanderFormationPanel:ActionInvoke("Update", arg_54_0._currentFleetVO, arg_54_0.commanderPrefabFleets)
	end
end

function var_0_0.selectFleetByStep(arg_55_0, arg_55_1)
	local var_55_0 = table.indexof(arg_55_0._fleetVOs, arg_55_0._currentFleetVO)

	while true do
		var_55_0 = var_55_0 + arg_55_1

		if var_55_0 < 1 or var_55_0 > #arg_55_0._fleetVOs then
			break
		end

		local var_55_1 = arg_55_0._fleetVOs[var_55_0]

		if var_55_1:isUnlock() then
			return var_55_1.id
		end
	end
end

function var_0_0.updateToggleList(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0.fleetToggleList:GetComponent(typeof(ToggleGroup))

	var_56_0.allowSwitchOff = true

	local var_56_1 = arg_56_0._currentFleetVO.id

	for iter_56_0 = 1, #arg_56_0.fleetToggles do
		local var_56_2 = arg_56_0.fleetToggles[iter_56_0]
		local var_56_3 = arg_56_1[iter_56_0]

		setActive(var_56_2, var_56_3)

		if var_56_3 then
			local var_56_4 = var_56_2:GetComponent(typeof(Toggle))
			local var_56_5 = var_56_2:Find("lock")
			local var_56_6, var_56_7 = var_56_3:isUnlock()

			setToggleEnabled(var_56_2, var_56_6)
			setActive(var_56_5, not var_56_6)
			setActive(var_56_2:Find("on"), var_56_6 and var_56_1 == var_56_3.id)
			setActive(var_56_2:Find("off"), var_56_6 and var_56_1 ~= var_56_3.id)

			if var_56_6 then
				var_56_4.isOn = var_56_3.id == var_56_1

				onToggle(arg_56_0, var_56_2, function(arg_57_0)
					if arg_57_0 then
						setActive(arg_56_0.fleetToggleMask, false)
						arg_56_0:tweenTabArrow(true)

						if var_56_3.id ~= var_56_1 then
							arg_56_0:ForceDropChar()
							arg_56_0:emit(FormationMediator.ON_CHANGE_FLEET, var_56_3.id)
						end
					end
				end, SFX_UI_TAG)
			else
				onButton(arg_56_0, var_56_5, function()
					pg.TipsMgr.GetInstance():ShowTips(var_56_7)
				end, SFX_UI_CLICK)
			end
		end
	end

	var_56_0.allowSwitchOff = false
end

function var_0_0.resetFormationComponent(arg_59_0)
	SetActive(arg_59_0._gridTFs.main[1]:Find("flag"), #arg_59_0._currentFleetVO:getTeamByName(TeamType.Main) ~= 0)
	SetActive(arg_59_0._gridTFs.submarine[1]:Find("flag"), #arg_59_0._currentFleetVO:getTeamByName(TeamType.Submarine) ~= 0)
end

function var_0_0.sortCardSiblingIndex(arg_60_0)
	local var_60_0 = {
		TeamType.Main,
		TeamType.Vanguard,
		TeamType.Submarine
	}

	_.each(var_60_0, function(arg_61_0)
		local var_61_0 = arg_60_0._cards[arg_61_0]

		if #var_61_0 > 0 then
			for iter_61_0 = 1, #var_61_0 do
				var_61_0[iter_61_0].tr:SetSiblingIndex(iter_61_0 - 1)
			end
		end
	end)
end

function var_0_0.displayFleetInfo(arg_62_0)
	SetActive(arg_62_0._prevPage, arg_62_0:selectFleetByStep(-1))
	SetActive(arg_62_0._nextPage, arg_62_0:selectFleetByStep(1))
	setActive(arg_62_0._adapt:Find("gear_score"), true)
	setActive(arg_62_0._vanguardGS, false)
	setActive(arg_62_0._mainGS, false)
	setActive(arg_62_0._subGS, false)

	local var_62_0 = arg_62_0._currentFleetVO:GetPropertiesSum()
	local var_62_1 = math.floor(arg_62_0._currentFleetVO:GetGearScoreSum(TeamType.Vanguard))
	local var_62_2 = math.floor(arg_62_0._currentFleetVO:GetGearScoreSum(TeamType.Main))
	local var_62_3 = math.floor(arg_62_0._currentFleetVO:GetGearScoreSum(TeamType.Submarine))
	local var_62_4 = arg_62_0._currentFleetVO:GetCostSum()

	arg_62_0.tweenNumText(arg_62_0._cannonPower, var_62_0.cannon)
	arg_62_0.tweenNumText(arg_62_0._torpedoPower, var_62_0.torpedo)
	arg_62_0.tweenNumText(arg_62_0._AAPower, var_62_0.antiAir)
	arg_62_0.tweenNumText(arg_62_0._airPower, var_62_0.air)
	arg_62_0.tweenNumText(arg_62_0._cost, var_62_4.oil)

	if OPEN_AIR_DOMINANCE then
		setActive(arg_62_0._airDominance.parent, true)
		arg_62_0.tweenNumText(arg_62_0._airDominance, arg_62_0._currentFleetVO:getFleetAirDominanceValue())
	else
		setActive(arg_62_0._airDominance.parent, false)
	end

	local var_62_5 = arg_62_0._currentFleetVO:getFleetType()

	if var_62_5 == FleetType.Normal then
		setActive(arg_62_0._vanguardGS, true)
		setActive(arg_62_0._mainGS, true)
		setActive(arg_62_0._arrUpVan, false)
		setActive(arg_62_0._arrDownVan, false)
		setActive(arg_62_0._arrUpMain, false)
		setActive(arg_62_0._arrDownMain, false)

		arg_62_0.prevVanGS = tonumber(arg_62_0._vanGSTxt.text)

		arg_62_0.tweenNumText(arg_62_0._vanguardGS:Find("Text"), var_62_1)

		if arg_62_0.VanGSInited then
			setActive(arg_62_0._arrUpVan, var_62_1 > arg_62_0.prevVanGS)
			setActive(arg_62_0._arrDownVan, var_62_1 < arg_62_0.prevVanGS)
		end

		arg_62_0.prevMainGS = tonumber(arg_62_0._mainGSTxt.text)

		arg_62_0.tweenNumText(arg_62_0._mainGS:Find("Text"), var_62_2)

		if arg_62_0.mainGSInited then
			setActive(arg_62_0._arrUpMain, var_62_2 > arg_62_0.prevMainGS)
			setActive(arg_62_0._arrDownMain, var_62_2 < arg_62_0.prevMainGS)
		end

		arg_62_0.contextData.mainGS = var_62_2
		arg_62_0.contextData.vanGS = var_62_1
		arg_62_0.mainGSInited = true
		arg_62_0.VanGSInited = true

		local var_62_6 = arg_62_0._currentFleetVO:GetFleetSonarRange()

		setActive(arg_62_0._vanguardGS:Find("SonarActive"), var_62_6 > 0)
		setActive(arg_62_0._vanguardGS:Find("SonarInactive"), var_62_6 <= 0)

		local function var_62_7()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.fleet_antisub_range_tip.tip
			})
		end

		if var_62_6 > 0 then
			setText(arg_62_0._vanguardGS:Find("SonarActive/Text"), math.floor(var_62_6))
			onButton(arg_62_0, arg_62_0._vanguardGS:Find("SonarActive"), var_62_7, SFX_PANEL)
		else
			onButton(arg_62_0, arg_62_0._vanguardGS:Find("SonarInactive"), var_62_7, SFX_PANEL)
		end
	elseif var_62_5 == FleetType.Submarine then
		setActive(arg_62_0._arrUpSub, false)
		setActive(arg_62_0._arrDownSub, false)
		setActive(arg_62_0._subGS, true)

		arg_62_0.prevSubGS = tonumber(arg_62_0._subGSTxt.text)

		arg_62_0.tweenNumText(arg_62_0._subGS:Find("Text"), var_62_3)

		if arg_62_0.SubGSInited then
			setActive(arg_62_0._arrUpSub, var_62_3 > arg_62_0.prevSubGS)
			setActive(arg_62_0._arrDownSub, var_62_3 < arg_62_0.prevSubGS)
		end

		arg_62_0.contextData.subGS = var_62_3
		arg_62_0.SubGSInited = true
	end

	arg_62_0:SetFleetNameLabel()
	setText(arg_62_0._fleetNumText, arg_62_0._currentFleetVO:getIndex())
end

function var_0_0.DisplayRenamePanel(arg_64_0, arg_64_1)
	SetActive(arg_64_0._renamePanel, arg_64_1)

	if arg_64_1 then
		pg.UIMgr.GetInstance():BlurPanel(arg_64_0._renamePanel)

		local var_64_0 = getText(arg_64_0._fleetNameText)

		setInputText(findTF(arg_64_0._renamePanel, "frame/name_field"), var_64_0)
	else
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_64_0._renamePanel, arg_64_0._tf)
	end
end

function var_0_0.hideAttrFrame(arg_65_0)
	SetActive(arg_65_0._attrFrame, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_65_0._blurLayer, arg_65_0._tf)
end

function var_0_0.displayAttrFrame(arg_66_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_66_0._blurLayer)
	SetActive(arg_66_0._attrFrame, true)
	arg_66_0:initAttrFrame()
end

function var_0_0.initAttrFrame(arg_67_0)
	local var_67_0 = {
		[TeamType.Main] = arg_67_0._currentFleetVO.mainShips,
		[TeamType.Vanguard] = arg_67_0._currentFleetVO.vanguardShips,
		[TeamType.Submarine] = arg_67_0._currentFleetVO.subShips
	}
	local var_67_1 = false

	for iter_67_0, iter_67_1 in pairs(var_67_0) do
		local var_67_2 = arg_67_0._cards[iter_67_0]

		if #var_67_2 == 0 then
			local var_67_3 = arg_67_0._attrFrame:Find(iter_67_0 .. "/list")

			for iter_67_2 = 1, 3 do
				local var_67_4 = cloneTplTo(arg_67_0._cardTpl, var_67_3).gameObject

				table.insert(var_67_2, FormationDetailCard.New(var_67_4))
			end

			var_67_1 = true
		end
	end

	if var_67_1 then
		arg_67_0:updateAttrFrame()
	end
end

function var_0_0.updateAttrFrame(arg_68_0)
	local var_68_0 = {
		[TeamType.Main] = arg_68_0._currentFleetVO.mainShips,
		[TeamType.Vanguard] = arg_68_0._currentFleetVO.vanguardShips,
		[TeamType.Submarine] = arg_68_0._currentFleetVO.subShips
	}
	local var_68_1 = arg_68_0._currentFleetVO:getFleetType()

	for iter_68_0, iter_68_1 in pairs(var_68_0) do
		local var_68_2 = arg_68_0._cards[iter_68_0]

		if #var_68_2 > 0 then
			local var_68_3 = var_68_1 == FleetType.Submarine and iter_68_0 == TeamType.Vanguard

			for iter_68_2 = 1, 3 do
				if iter_68_2 <= #iter_68_1 then
					local var_68_4 = arg_68_0.shipVOs[iter_68_1[iter_68_2]]

					var_68_2[iter_68_2]:update(var_68_4, var_68_3)
					var_68_2[iter_68_2]:updateProps(arg_68_0:getCardAttrProps(var_68_4))
				else
					var_68_2[iter_68_2]:update(nil, var_68_3)
				end

				arg_68_0:detachOnCardButton(var_68_2[iter_68_2])

				if not var_68_3 then
					arg_68_0:attachOnCardButton(var_68_2[iter_68_2], iter_68_0)
				end
			end
		end
	end

	setActive(arg_68_0._attrFrame:Find(TeamType.Main), var_68_1 == FleetType.Normal)
	setActive(arg_68_0._attrFrame:Find(TeamType.Submarine), var_68_1 == FleetType.Submarine)
	setActive(arg_68_0._attrFrame:Find(TeamType.Vanguard .. "/vanguard"), var_68_1 ~= FleetType.Submarine)
	arg_68_0:updateUltimateTitle()
end

function var_0_0.updateUltimateTitle(arg_69_0)
	local var_69_0 = arg_69_0._cards[TeamType.Main]
	local var_69_1 = arg_69_0._currentFleetVO.mainShips

	if #var_69_0 > 0 then
		for iter_69_0 = 1, #var_69_0 do
			go(var_69_0[iter_69_0].shipState):SetActive(iter_69_0 == 1)
		end
	end
end

function var_0_0.getCardAttrProps(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_1:getProperties()
	local var_70_1 = arg_70_1:getShipCombatPower()
	local var_70_2 = arg_70_1:getBattleTotalExpend()

	return {
		{
			i18n("word_attr_durability"),
			tostring(math.floor(var_70_0.durability))
		},
		{
			i18n("word_attr_luck"),
			"" .. tostring(math.floor(var_70_2))
		},
		{
			i18n("word_synthesize_power"),
			"<color=#ffff00>" .. var_70_1 .. "</color>"
		}
	}
end

function var_0_0.detachOnCardButton(arg_71_0, arg_71_1)
	local var_71_0 = GetOrAddComponent(arg_71_1.go, "EventTriggerListener")

	var_71_0:RemovePointClickFunc()
	var_71_0:RemoveBeginDragFunc()
	var_71_0:RemoveDragFunc()
	var_71_0:RemoveDragEndFunc()
end

function var_0_0.attachOnCardButton(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = GetOrAddComponent(arg_72_1.go, "EventTriggerListener")

	arg_72_0.eventTriggers[var_72_0] = true

	var_72_0:AddPointClickFunc(function(arg_73_0, arg_73_1)
		if not arg_72_0.carddrag and arg_73_0 == arg_72_1.go then
			if arg_72_1.shipVO then
				arg_72_0:emit(FormationMediator.OPEN_SHIP_INFO, arg_72_1.shipVO.id, arg_72_0._currentFleetVO, var_0_0.TOGGLE_DETAIL)
			else
				arg_72_0:emit(FormationMediator.CHANGE_FLEET_SHIP, arg_72_1.shipVO, arg_72_0._currentFleetVO, var_0_0.TOGGLE_DETAIL, arg_72_2)
			end

			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_PANEL)
		end
	end)

	if arg_72_1.shipVO then
		local var_72_1 = arg_72_0._cards[arg_72_2]
		local var_72_2 = arg_72_1.tr.parent:GetComponent("ContentSizeFitter")
		local var_72_3 = arg_72_1.tr.parent:GetComponent("HorizontalLayoutGroup")
		local var_72_4 = arg_72_1.tr.rect.width * 0.5
		local var_72_5 = {}

		var_72_0:AddBeginDragFunc(function()
			if arg_72_0.carddrag then
				return
			end

			arg_72_0._currentDragDelegate = var_72_0
			arg_72_0.carddrag = arg_72_1
			var_72_2.enabled = false
			var_72_3.enabled = false

			arg_72_1.tr:SetSiblingIndex(#var_72_1)

			for iter_74_0 = 1, #var_72_1 do
				if var_72_1[iter_74_0] == arg_72_1 then
					arg_72_0._shiftIndex = iter_74_0
				end

				var_72_5[iter_74_0] = var_72_1[iter_74_0].tr.anchoredPosition
			end

			LeanTween.scale(arg_72_1.paintingTr, Vector3(1.1, 1.1, 0), 0.3)
		end)
		var_72_0:AddDragFunc(function(arg_75_0, arg_75_1)
			if arg_72_0.carddrag ~= arg_72_1 then
				return
			end

			local var_75_0 = arg_72_1.tr.localPosition

			var_75_0.x = arg_72_0:change2ScrPos(arg_72_1.tr.parent, arg_75_1.position).x
			arg_72_1.tr.localPosition = var_75_0

			local var_75_1 = 1

			for iter_75_0 = 1, #var_72_1 do
				if var_72_1[iter_75_0] ~= arg_72_1 and var_72_1[iter_75_0].shipVO and arg_72_1.tr.localPosition.x > var_72_1[iter_75_0].tr.localPosition.x + (var_75_1 < arg_72_0._shiftIndex and 1.1 or -1.1) * var_72_4 then
					var_75_1 = var_75_1 + 1
				end
			end

			if arg_72_0._shiftIndex ~= var_75_1 then
				arg_72_0._formationLogic:Shift(arg_72_0._shiftIndex, var_75_1, arg_72_2)
				arg_72_0:shiftCard(arg_72_0._shiftIndex, var_75_1, arg_72_2)

				for iter_75_1 = 1, #var_72_1 do
					if var_72_1[iter_75_1] and var_72_1[iter_75_1] ~= arg_72_1 then
						var_72_1[iter_75_1].tr.anchoredPosition = var_72_5[iter_75_1]
					end
				end
			end
		end)
		var_72_0:AddDragEndFunc(function(arg_76_0, arg_76_1)
			if arg_72_0.carddrag ~= arg_72_1 then
				return
			end

			function resetCard()
				for iter_77_0 = 1, #var_72_1 do
					var_72_1[iter_77_0].tr.anchoredPosition = var_72_5[iter_77_0]
				end

				var_72_2.enabled = true
				var_72_3.enabled = true
				arg_72_0._shiftIndex = nil

				arg_72_0:updateUltimateTitle()
				arg_72_0._formationLogic:SortSiblingIndex()
				arg_72_0:sortCardSiblingIndex()
				arg_72_0:emit(FormationMediator.CHANGE_FLEET_SHIPS_ORDER, arg_72_0._currentFleetVO)

				var_72_0.enabled = true
				arg_72_0.carddrag = nil
			end

			local var_76_0 = arg_72_0._forceDropCharacter

			arg_72_0._forceDropCharacter = nil
			arg_72_0._currentDragDelegate = nil
			var_72_0.enabled = false

			if var_76_0 then
				resetCard()

				arg_72_1.paintingTr.localScale = Vector3(1, 1, 0)
			else
				local var_76_1 = math.min(math.abs(arg_72_1.tr.anchoredPosition.x - var_72_5[arg_72_0._shiftIndex].x) / 200, 1) * 0.3

				LeanTween.value(arg_72_1.go, arg_72_1.tr.anchoredPosition.x, var_72_5[arg_72_0._shiftIndex].x, var_76_1):setEase(LeanTweenType.easeOutCubic):setOnUpdate(System.Action_float(function(arg_78_0)
					local var_78_0 = arg_72_1.tr.anchoredPosition

					var_78_0.x = arg_78_0
					arg_72_1.tr.anchoredPosition = var_78_0
				end)):setOnComplete(System.Action(function()
					resetCard()
					LeanTween.scale(arg_72_1.paintingTr, Vector3(1, 1, 0), 0.3)
				end))
			end
		end)
	end
end

function var_0_0.shiftCard(arg_80_0, arg_80_1, arg_80_2, arg_80_3)
	local var_80_0 = arg_80_0._cards[arg_80_3]

	if #var_80_0 > 0 then
		var_80_0[arg_80_1], var_80_0[arg_80_2] = var_80_0[arg_80_2], var_80_0[arg_80_1]
	end

	arg_80_0._shiftIndex = arg_80_2
end

function var_0_0.change2ScrPos(arg_81_0, arg_81_1, arg_81_2)
	local var_81_0 = pg.UIMgr.GetInstance().overlayCameraComp

	return (LuaHelper.ScreenToLocal(arg_81_1, arg_81_2, var_81_0))
end

function var_0_0.tweenNumText(arg_82_0, arg_82_1, arg_82_2, arg_82_3, arg_82_4)
	LeanTween.value(go(arg_82_0), arg_82_4 or 0, math.floor(arg_82_1), arg_82_2 or 0.7):setOnUpdate(System.Action_float(function(arg_83_0)
		setText(arg_82_0, math.floor(arg_83_0))
	end)):setOnComplete(System.Action(function()
		if arg_82_3 then
			arg_82_3()
		end
	end))
end

function var_0_0.defaultFleetName(arg_85_0)
	if arg_85_0.name == "" or arg_85_0.name == nil then
		return Fleet.DEFAULT_NAME[arg_85_0.id]
	else
		return arg_85_0.name
	end
end

function var_0_0.GetFleetCount(arg_86_0)
	local var_86_0 = 0

	for iter_86_0, iter_86_1 in pairs(arg_86_0._fleetVOs) do
		var_86_0 = var_86_0 + 1
	end

	return var_86_0
end

function var_0_0.tweenTabArrow(arg_87_0, arg_87_1)
	local var_87_0 = arg_87_0.btnRegular:Find("arr")
	local var_87_1 = arg_87_0.btnSub:Find("arr")

	setActive(var_87_0, arg_87_1)
	setActive(var_87_1, arg_87_1)

	if arg_87_1 then
		LeanTween.moveLocalY(go(var_87_0), var_87_0.localPosition.y + 8, 0.8):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(-1)
		LeanTween.moveLocalY(go(var_87_1), var_87_1.localPosition.y + 8, 0.8):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(-1)
	else
		LeanTween.cancel(go(var_87_0))
		LeanTween.cancel(go(var_87_1))

		local var_87_2 = var_87_0.localPosition

		var_87_2.y = 80
		var_87_0.localPosition = var_87_2

		local var_87_3 = var_87_1.localPosition

		var_87_3.y = 80
		var_87_1.localPosition = var_87_3
	end
end

function var_0_0.recyclePainting(arg_88_0)
	for iter_88_0, iter_88_1 in pairs(arg_88_0._cards) do
		for iter_88_2, iter_88_3 in ipairs(iter_88_1) do
			iter_88_3:clear()
		end
	end
end

function var_0_0.onBackPressed(arg_89_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if isActive(arg_89_0._renamePanel) then
		arg_89_0:DisplayRenamePanel(false)
	else
		triggerButton(arg_89_0.backBtn)
	end
end

function var_0_0.willExit(arg_90_0)
	arg_90_0.commanderFormationPanel:Destroy()

	if arg_90_0._attrFrame.gameObject.activeSelf then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_90_0._blurLayer, arg_90_0._tf)
	end

	arg_90_0._formationLogic:Destroy()
	arg_90_0:recyclePainting()
	arg_90_0:DisplayRenamePanel(false)
	arg_90_0:tweenTabArrow(false)

	if arg_90_0.tweens then
		cancelTweens(arg_90_0.tweens)
	end

	if arg_90_0.eventTriggers then
		for iter_90_0, iter_90_1 in pairs(arg_90_0.eventTriggers) do
			ClearEventTrigger(iter_90_0)
		end

		arg_90_0.eventTriggers = nil
	end
end

return var_0_0
