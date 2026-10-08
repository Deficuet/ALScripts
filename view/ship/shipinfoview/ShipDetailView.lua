local var_0_0 = class("ShipDetailView", import("...base.BaseSubView"))
local var_0_1 = require("view.equipment.EquipmentSortCfg")
local var_0_2 = {
	equipCampIndex = 2047,
	equipPropertyIndex = 4095,
	equipPropertyIndex2 = 4095,
	equipAmmoIndex1 = 15,
	equipAmmoIndex2 = 3,
	extraIndex = 0,
	typeIndex = 2047,
	rarityIndex = 31
}

function var_0_0.getUIName(arg_1_0)
	return "ShipDetailView"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/RecordableSearchBarUI4ShipDetailView",
		"template/intimacytpl"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:InitDetail()
	arg_3_0:InitEvent()
	setParent(arg_3_0.randomFlagToggle, arg_3_0._tf.parent)
	triggerToggle(arg_3_0.showQuickBtn, false)
	triggerToggle(arg_3_0.showRecordBtn, false)
end

function var_0_0.InitDetail(arg_4_0)
	arg_4_0.mainPanel = arg_4_0._parentTf.parent
	arg_4_0.detailPanel = arg_4_0._tf
	arg_4_0.attrs = arg_4_0.detailPanel:Find("attrs")

	setActive(arg_4_0.attrs, false)

	arg_4_0.shipDetailLogicPanel = ShipDetailLogicPanel.New(arg_4_0.attrs)

	arg_4_0.shipDetailLogicPanel:attach(arg_4_0)

	arg_4_0.equipments = arg_4_0.detailPanel:Find("equipments")
	arg_4_0.equipmentsGrid = arg_4_0.equipments:Find("equipments")
	arg_4_0.detailEquipmentTpl = arg_4_0.equipments:Find("equipment_tpl")
	arg_4_0.emptyGridTpl = arg_4_0.equipments:Find("empty_tpl")
	arg_4_0.showRecordBtn = arg_4_0.equipments:Find("unload_all")
	arg_4_0.showQuickBtn = arg_4_0.equipments:Find("quickButton")
	arg_4_0.showECodeShareBtn = arg_4_0.equipments:Find("shareButton")
	arg_4_0.equipCodeBtn = arg_4_0.equipments:Find("equip_code")
	arg_4_0.lockBtn = arg_4_0.detailPanel:Find("lock_btn")
	arg_4_0.unlockBtn = arg_4_0.detailPanel:Find("unlock_btn")
	arg_4_0.viewBtn = arg_4_0.detailPanel:Find("view_btn")
	arg_4_0.evaluationBtn = arg_4_0.detailPanel:Find("evaluation_btn")
	arg_4_0.profileBtn = arg_4_0.detailPanel:Find("profile_btn")
	arg_4_0.fashionToggle = arg_4_0.detailPanel:Find("fashion_toggle")
	arg_4_0.randomFlagToggle = arg_4_0.detailPanel:Find("random_flag_toggle")
	arg_4_0.fashionTag = arg_4_0.fashionToggle:Find("Tag")
	arg_4_0.commonTagToggle = arg_4_0.detailPanel:Find("common_toggle")
	arg_4_0.spWeaponSlot = arg_4_0.equipments:Find("SpSlot")
	arg_4_0.propertyIcons = arg_4_0.detailPanel:Find("attrs/attrs/property/icons")
	arg_4_0.intimacyTF = arg_4_0._tf:Find("intimacy")
	arg_4_0.updateItemTick = 0
	arg_4_0.quickPanel = arg_4_0.detailPanel:Find("quick_panel")
	arg_4_0.equiping = arg_4_0.quickPanel:Find("equiping")
	arg_4_0.fillter = arg_4_0.quickPanel:Find("fillter")
	arg_4_0.selectTitle = arg_4_0.quickPanel:Find("frame/selectTitle")
	arg_4_0.emptyTitle = arg_4_0.quickPanel:Find("frame/emptyTitle")
	arg_4_0.list = arg_4_0.quickPanel:Find("frame/container/Content"):GetComponent("LScrollRect")
	arg_4_0.indexData = {}

	arg_4_0:CloseQuickPanel()
	setText(arg_4_0.quickPanel:Find("fillter/on/text2"), i18n("quick_equip_tip2"))
	setText(arg_4_0.quickPanel:Find("fillter/off/text2"), i18n("quick_equip_tip2"))
	setText(arg_4_0.quickPanel:Find("equiping/on/text2"), i18n("quick_equip_tip1"))
	setText(arg_4_0.quickPanel:Find("equiping/off/text2"), i18n("quick_equip_tip1"))
	setText(arg_4_0.quickPanel:Find("title/text"), i18n("quick_equip_tip3"))
	setText(arg_4_0.quickPanel:Find("frame/emptyTitle/text"), i18n("quick_equip_tip4"))
	setText(arg_4_0.quickPanel:Find("frame/selectTitle/text"), i18n("quick_equip_tip5"))
	setText(arg_4_0.randomFlagToggle:Find("bg/Text"), i18n("ship_random_secretary_tag"))

	arg_4_0.equipmentProxy = getProxy(EquipmentProxy)
	arg_4_0.recordPanel = arg_4_0.detailPanel:Find("record_panel")
	arg_4_0.unloadAllBtn = arg_4_0.recordPanel:Find("frame/unload_all")
	arg_4_0.recordBars = _.map({
		1,
		2,
		3
	}, function(arg_5_0)
		return arg_4_0.recordPanel:Find("frame/container"):GetChild(arg_5_0 - 1)
	end)
	arg_4_0.recordBtns = {
		arg_4_0.recordPanel:Find("frame/container/record_1/record_btn"),
		arg_4_0.recordPanel:Find("frame/container/record_2/record_btn"),
		arg_4_0.recordPanel:Find("frame/container/record_3/record_btn")
	}
	arg_4_0.recordEquipmentsTFs = {
		arg_4_0.recordPanel:Find("frame/container/record_1/equipments"),
		arg_4_0.recordPanel:Find("frame/container/record_2/equipments"),
		arg_4_0.recordPanel:Find("frame/container/record_3/equipments")
	}
	arg_4_0.equipRecordBtns = {
		arg_4_0.recordPanel:Find("frame/container/record_1/equip_btn"),
		arg_4_0.recordPanel:Find("frame/container/record_2/equip_btn"),
		arg_4_0.recordPanel:Find("frame/container/record_3/equip_btn")
	}
	arg_4_0.searchBar = RecordableSearchBar.New(RecordableSearchBar.CreateData({
		uiName = "RecordableSearchBarUI4ShipDetailView",
		holder = i18n("search_equipment"),
		onInputChanged = function()
			arg_4_0:updateQuickPanel(true)
		end,
		key = arg_4_0.__cname,
		parent = arg_4_0.quickPanel,
		anchoredPosition = Vector3(-623, -34, 0)
	}))

	setActive(arg_4_0.detailPanel, true)
	setActive(arg_4_0.attrs, true)
	setActive(arg_4_0.recordPanel, false)
	setActive(arg_4_0.detailEquipmentTpl, false)
	setActive(arg_4_0.emptyGridTpl, false)
	setActive(arg_4_0.detailPanel, true)

	arg_4_0.onSelected = false

	if PLATFORM_CODE == PLATFORM_CHT and LOCK_SP_WEAPON then
		setActive(arg_4_0.showRecordBtn, false)
		setActive(arg_4_0.showQuickBtn, false)
		setActive(arg_4_0.spWeaponSlot, false)

		arg_4_0.showRecordBtn = arg_4_0.equipments:Find("unload_all_2")
		arg_4_0.showQuickBtn = arg_4_0.equipments:Find("quickButton_2")

		setActive(arg_4_0.showRecordBtn, true)
		setActive(arg_4_0.showQuickBtn, true)
	end
end

function var_0_0.InitEvent(arg_7_0)
	onButton(arg_7_0, arg_7_0.fashionToggle, function()
		arg_7_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.FASHION)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.propertyIcons, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_attr.tip,
			onClose = function()
				return
			end
		})
	end)
	onToggle(arg_7_0, arg_7_0.commonTagToggle, function(arg_11_0)
		local var_11_0 = arg_7_0:GetShipVO().preferenceTag
		local var_11_1 = var_11_0 == Ship.PREFERENCE_TAG_COMMON

		if var_11_1 ~= arg_11_0 then
			if var_11_0 == Ship.PREFERENCE_TAG_COMMON then
				var_11_1 = Ship.PREFERENCE_TAG_NONE
			else
				var_11_1 = Ship.PREFERENCE_TAG_COMMON
			end

			arg_7_0:emit(ShipMainMediator.ON_TAG, arg_7_0:GetShipVO().id, var_11_1)
		end
	end, SFX_CONFIRM)
	onToggle(arg_7_0, arg_7_0.randomFlagToggle, function(arg_12_0)
		if arg_7_0:GetShipVO():getRandomFlag() ~= arg_12_0 then
			arg_7_0:emit(ShipMainMediator.CHANGE_RANDOM_FLAG, arg_7_0:GetShipVO():GetShipPhantomMark(), arg_12_0)
		end
	end, SFX_CONFIRM)
	onButton(arg_7_0, arg_7_0.lockBtn, function()
		arg_7_0:emit(ShipMainMediator.ON_LOCK, {
			arg_7_0:GetShipVO().id
		}, arg_7_0:GetShipVO().LOCK_STATE_LOCK)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.unlockBtn, function()
		arg_7_0:emit(ShipMainMediator.ON_LOCK, {
			arg_7_0:GetShipVO().id
		}, arg_7_0:GetShipVO().LOCK_STATE_UNLOCK)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.viewBtn, function()
		Input.multiTouchEnabled = true

		arg_7_0:emit(ShipViewConst.PAINT_VIEW, true)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.evaluationBtn, function()
		arg_7_0:emit(ShipMainMediator.OPEN_EVALUATION, arg_7_0:GetShipVO():getGroupId(), arg_7_0:GetShipVO():isActivityNpc())
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.profileBtn, function()
		arg_7_0:emit(ShipMainMediator.OPEN_SHIPPROFILE, arg_7_0:GetShipVO():getGroupId(), arg_7_0:GetShipVO():isRemoulded())
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.intimacyTF, function()
		if arg_7_0:GetShipVO():isActivityNpc() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("npc_propse_tip"))

			return
		end

		if LOCK_PROPOSE then
			return
		end

		arg_7_0:emit(ShipMainMediator.PROPOSE, arg_7_0:GetShipVO().id, function()
			return
		end)
	end)
	onToggle(arg_7_0, arg_7_0.showRecordBtn, function(arg_20_0)
		local var_20_0, var_20_1 = ShipStatus.ShipStatusCheck("onModify", arg_7_0:GetShipVO())

		if not var_20_0 then
			if arg_20_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_20_1)
				onNextTick(function()
					triggerToggle(arg_7_0.showRecordBtn, false)
				end)
			end

			return
		end

		if arg_20_0 then
			arg_7_0:displayRecordPanel()

			if arg_7_0.isShowQuick then
				triggerToggle(arg_7_0.showQuickBtn, false)
			end
		else
			arg_7_0:CloseRecordPanel(true)
		end
	end, SFX_PANEL)
	onToggle(arg_7_0, arg_7_0.showQuickBtn, function(arg_22_0)
		local var_22_0, var_22_1 = ShipStatus.ShipStatusCheck("onModify", arg_7_0:GetShipVO())

		if not var_22_0 then
			if arg_22_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_22_1)
				onNextTick(function()
					triggerToggle(arg_7_0.showQuickBtn, false)
				end)
			end

			arg_7_0:CloseRecordPanel(true)
			arg_7_0:CloseQuickPanel()

			return
		end

		if arg_22_0 then
			arg_7_0:displayQuickPanel()

			if arg_7_0.selectedEquip then
				arg_7_0:selectedEquipItem(arg_7_0.selectedEquip.index)
			else
				arg_7_0:quickSelectEmpty()
			end

			if arg_7_0.isShowRecord then
				triggerToggle(arg_7_0.showRecordBtn, false)
			end
		else
			arg_7_0:CloseQuickPanel()
		end
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.equipCodeBtn, function()
		arg_7_0:emit(ShipMainMediator.OPEN_EQUIP_CODE, {})
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.showECodeShareBtn, function()
		local var_25_0 = arg_7_0:GetShipVO()

		arg_7_0:emit(ShipMainMediator.OPEN_EQUIP_CODE_SHARE, var_25_0.id, var_25_0:getGroupId())
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.unloadAllBtn, function()
		local var_26_0, var_26_1 = ShipStatus.ShipStatusCheck("onModify", arg_7_0:GetShipVO())

		if not var_26_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_26_1)
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("ship_unequip_all_tip"),
				onYes = function()
					arg_7_0:emit(ShipMainMediator.UNEQUIP_FROM_SHIP_ALL, arg_7_0:GetShipVO().id)
				end
			})
		end
	end, SFX_PANEL)

	function arg_7_0.list.onInitItem(arg_28_0)
		ClearTweenItemAlphaAndWhite(arg_28_0)
	end

	function arg_7_0.list.onReturnItem(arg_29_0, arg_29_1)
		ClearTweenItemAlphaAndWhite(arg_29_1)
	end

	function arg_7_0.list.onUpdateItem(arg_30_0, arg_30_1)
		setActive(findTF(tf(arg_30_1), "IconTpl/icon_bg/icon"), false)
		TweenItemAlphaAndWhite(arg_30_1)

		if arg_30_0 == 0 and not arg_7_0.selectedEquip.empty then
			setActive(findTF(tf(arg_30_1), "unEquip"), true)
			setActive(findTF(tf(arg_30_1), "bg"), false)
			setActive(findTF(tf(arg_30_1), "IconTpl"), false)
			onButton(arg_7_0, tf(arg_30_1), function()
				local var_31_0 = arg_7_0.selectedEquip.index
				local var_31_1 = arg_7_0:GetShipVO()
				local var_31_2 = var_31_1:getEquip(arg_7_0.selectedEquip.index):getConfig("name")
				local var_31_3 = var_31_1:getName()

				arg_7_0:emit(ShipMainMediator.UNEQUIP_FROM_SHIP, {
					shipId = var_31_1.id,
					pos = var_31_0
				})
			end, SFX_PANEL)
		else
			setActive(findTF(tf(arg_30_1), "unEquip"), false)
			setActive(findTF(tf(arg_30_1), "bg"), true)
			setActive(findTF(tf(arg_30_1), "IconTpl"), true)

			local var_30_0 = arg_7_0.selectedEquip.empty and arg_30_0 + 1 or arg_30_0
			local var_30_1 = arg_7_0.fillterEquipments[var_30_0]

			if not var_30_1 then
				return
			end

			setActive(findTF(tf(arg_30_1), "IconTpl/icon_bg/icon"), true)
			updateEquipment(findTF(tf(arg_30_1), "IconTpl"), var_30_1)

			if var_30_1.shipId then
				local var_30_2 = getProxy(BayProxy):getShipById(var_30_1.shipId)

				setImageSprite(findTF(tf(arg_30_1), "IconTpl/icon_bg/equip_flag/Image"), LoadSprite("qicon/" .. var_30_2:getPainting()))
			end

			setActive(findTF(tf(arg_30_1), "IconTpl/icon_bg/equip_flag"), var_30_1.shipId and var_30_1.shipId > 0)
			setActive(findTF(tf(arg_30_1), "IconTpl/mask"), var_30_1.mask)
			onButton(arg_7_0, tf(arg_30_1), function()
				if var_30_1.mask then
					return
				end

				arg_7_0:changeEquip(var_30_1)
			end, SFX_PANEL)
		end
	end

	onToggle(arg_7_0, arg_7_0.equiping, function(arg_33_0)
		arg_7_0.equipingFlag = arg_33_0

		if arg_7_0.selectedEquip then
			arg_7_0:updateQuickPanel(true)
		end
	end, SFX_PANEL)
	triggerToggle(arg_7_0.equiping, true)
	onButton(arg_7_0, arg_7_0.fillter, function()
		arg_7_0.indexData = arg_7_0.indexData or {}

		if not var_0_0.EQUIPMENT_INDEX then
			var_0_0.EQUIPMENT_INDEX = Clone(StoreHouseConst.EQUIPMENT_INDEX_COMMON)

			table.removebyvalue(var_0_0.EQUIPMENT_INDEX.customPanels.extraIndex.options, IndexConst.EquipmentExtraEquiping)
			table.removebyvalue(var_0_0.EQUIPMENT_INDEX.customPanels.extraIndex.names, "index_equip")
		end

		local var_34_0 = setmetatable({
			indexDatas = Clone(arg_7_0.indexData),
			callback = function(arg_35_0)
				arg_7_0.indexData.typeIndex = arg_35_0.typeIndex
				arg_7_0.indexData.equipPropertyIndex = arg_35_0.equipPropertyIndex
				arg_7_0.indexData.equipPropertyIndex2 = arg_35_0.equipPropertyIndex2
				arg_7_0.indexData.equipAmmoIndex1 = arg_35_0.equipAmmoIndex1
				arg_7_0.indexData.equipAmmoIndex2 = arg_35_0.equipAmmoIndex2
				arg_7_0.indexData.equipCampIndex = arg_35_0.equipCampIndex
				arg_7_0.indexData.rarityIndex = arg_35_0.rarityIndex
				arg_7_0.indexData.extraIndex = arg_35_0.extraIndex

				local var_35_0 = underscore(arg_7_0.indexData):chain():keys():all(function(arg_36_0)
					return arg_7_0.indexData[arg_36_0] == var_0_0.EQUIPMENT_INDEX.customPanels[arg_36_0].options[1]
				end):value()

				setActive(findTF(arg_7_0.fillter, "on"), not var_35_0)
				setActive(findTF(arg_7_0.fillter, "off"), var_35_0)
				arg_7_0:updateQuickPanel(true)
			end
		}, {
			__index = var_0_0.EQUIPMENT_INDEX
		})

		arg_7_0:emit(ShipMainMediator.OPEN_EQUIPMENT_INDEX, var_34_0)
	end, SFX_PANEL)
end

function var_0_0.changeEquip(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0.selectedEquip.index
	local var_37_1 = arg_37_0:GetShipVO()
	local var_37_2 = {
		quickFlag = true,
		type = EquipmentInfoMediator.TYPE_REPLACE,
		equipmentId = arg_37_1.id,
		shipId = var_37_1.id,
		pos = var_37_0,
		oldShipId = arg_37_1.shipId,
		oldPos = arg_37_1.shipPos
	}

	if var_37_2 then
		if PlayerPrefs.GetInt("QUICK_CHANGE_EQUIP", 1) == 1 then
			arg_37_0:emit(BaseUI.ON_EQUIPMENT, var_37_2)
		else
			local var_37_3, var_37_4 = var_37_1:canEquipAtPos(arg_37_1, var_37_0)

			if not var_37_3 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_equipmentInfoLayer_error_canNotEquip", var_37_4))

				return
			end

			if arg_37_1.shipId then
				local var_37_5 = getProxy(BayProxy):getShipById(arg_37_1.shipId)
				local var_37_6, var_37_7 = ShipStatus.ShipStatusCheck("onModify", var_37_5)

				if not var_37_6 then
					pg.TipsMgr.GetInstance():ShowTips(var_37_7)
				else
					arg_37_0:emit(ShipMainMediator.EQUIP_CHANGE_NOTICE, {
						notice = GAME.EQUIP_FROM_SHIP,
						data = var_37_2
					})
				end
			else
				arg_37_0:emit(ShipMainMediator.EQUIP_CHANGE_NOTICE, {
					notice = GAME.EQUIP_TO_SHIP,
					data = var_37_2
				})
			end
		end
	end
end

function var_0_0.SetShareData(arg_38_0, arg_38_1)
	arg_38_0.shareData = arg_38_1
end

function var_0_0.GetShipVO(arg_39_0)
	if arg_39_0.shareData and arg_39_0.shareData.shipVO then
		return arg_39_0.shareData.shipVO
	end

	return nil
end

function var_0_0.OnSelected(arg_40_0, arg_40_1)
	if arg_40_1 then
		arg_40_0:OverlayPanel(arg_40_0._parentTf, {
			pbList = {
				arg_40_0.detailPanel:Find("attrs"),
				arg_40_0.detailPanel:Find("equipments"),
				arg_40_0.detailPanel:Find("quick_panel")
			},
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
	else
		arg_40_0:UnOverlayPanel(arg_40_0._parentTf, arg_40_0.mainPanel)
	end

	arg_40_0.onSelected = arg_40_1

	if arg_40_0.onSelected and arg_40_0.selectedEquip then
		local var_40_0 = arg_40_0.selectedEquip.index

		arg_40_0:selectedEquipItem(nil)
		arg_40_0:selectedEquipItem(var_40_0)
	end
end

function var_0_0.UpdateUI(arg_41_0)
	arg_41_0.searchBar:ClearInputText()

	local var_41_0 = arg_41_0:GetShipVO()

	arg_41_0:UpdateIntimacy(var_41_0)
	arg_41_0:UpdateDetail(var_41_0)
	arg_41_0:UpdateEquipments(var_41_0)
	arg_41_0:UpdateLock()
	arg_41_0:UpdatePreferenceTag()

	arg_41_0.activeRandomFlag = not var_41_0:isActivityNpc()

	setActive(arg_41_0.randomFlagToggle, arg_41_0.activeRandomFlag)
	triggerToggle(arg_41_0.randomFlagToggle, var_41_0:getRandomFlag())
end

function var_0_0.UpdateIntimacy(arg_42_0, arg_42_1)
	setActive(arg_42_0.intimacyTF, not LOCK_PROPOSE)
	setIntimacyIcon(arg_42_0.intimacyTF, arg_42_1:getIntimacyIcon())
end

function var_0_0.UpdateDetail(arg_43_0, arg_43_1)
	arg_43_0.shipDetailLogicPanel:flush(arg_43_1)

	local var_43_0 = arg_43_0.shipDetailLogicPanel.attrs:Find("icons/hunting_range/bg")

	removeOnButton(var_43_0)

	if table.contains(ShipType.SubShipType, arg_43_1:getShipType()) then
		onButton(arg_43_0, var_43_0, function()
			arg_43_0:emit(ShipViewConst.DISPLAY_HUNTING_RANGE, true)
		end, SFX_PANEL)
	end

	if not HXSet.isHxSkin() then
		setActive(arg_43_0.fashionToggle, arg_43_0.shareData:HasFashion())
	else
		setActive(arg_43_0.fashionToggle, false)
	end

	arg_43_0:UpdateFashionTag()
	setActive(arg_43_0.profileBtn, not arg_43_1:isActivityNpc())
end

function var_0_0.UpdateFashionTag(arg_45_0)
	local var_45_0 = arg_45_0:GetShipVO()

	setActive(arg_45_0.fashionTag, #PaintingGroupConst.GetPaintingNameListByShipVO(var_45_0) > 0)
end

function var_0_0.UpdateEquipments(arg_46_0, arg_46_1)
	arg_46_0:clearListener()
	removeAllChildren(arg_46_0.equipmentsGrid)

	local var_46_0 = arg_46_1:getActiveEquipments()

	arg_46_0.equipItems = {}

	for iter_46_0, iter_46_1 in ipairs(arg_46_1.equipments) do
		local var_46_1 = var_46_0[iter_46_0]
		local var_46_2
		local var_46_3 = iter_46_0
		local var_46_4

		if iter_46_1 then
			var_46_2 = cloneTplTo(arg_46_0.detailEquipmentTpl, arg_46_0.equipmentsGrid)
			var_46_4 = {
				empty = false,
				tf = var_46_2,
				index = var_46_3
			}

			table.insert(arg_46_0.equipItems, var_46_4)
			updateEquipment(var_46_2:Find("IconTpl"), iter_46_1)
			onButton(arg_46_0, var_46_2, function()
				if arg_46_0.isShowQuick then
					arg_46_0:selectedEquipItem(var_46_3)
				else
					arg_46_0:emit(BaseUI.ON_EQUIPMENT, {
						type = EquipmentInfoMediator.TYPE_SHIP,
						shipId = arg_46_0:GetShipVO().id,
						pos = iter_46_0
					})
				end
			end, SFX_UI_DOCKYARD_EQUIPADD)
		else
			var_46_2 = cloneTplTo(arg_46_0.emptyGridTpl, arg_46_0.equipmentsGrid)
			var_46_4 = {
				empty = true,
				tf = var_46_2,
				index = var_46_3
			}

			table.insert(arg_46_0.equipItems, var_46_4)
			onButton(arg_46_0, var_46_2, function()
				if arg_46_0.isShowQuick then
					arg_46_0:selectedEquipItem(var_46_3)
				else
					arg_46_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.EQUIPMENT)
				end
			end, SFX_UI_DOCKYARD_EQUIPADD)
		end

		local var_46_5 = GetOrAddComponent(var_46_2, typeof(EventTriggerListener))

		var_46_5:AddPointDownFunc(function()
			if var_46_2 and not arg_46_0.isShowQuick then
				LeanTween.delayedCall(go(var_46_2), 1, System.Action(function()
					arg_46_0.selectedEquip = var_46_4

					triggerToggle(arg_46_0.showQuickBtn, true)
				end))
			end
		end)
		var_46_5:AddPointUpFunc(function()
			if var_46_2 and LeanTween.isTweening(go(var_46_2)) then
				LeanTween.cancel(go(var_46_2))
			end
		end)
	end

	local var_46_6, var_46_7 = ShipStatus.ShipStatusCheck("onModify", arg_46_0:GetShipVO())

	if not var_46_6 then
		triggerToggle(arg_46_0.showQuickBtn, false)
	elseif arg_46_1.id ~= arg_46_0.lastShipVo and arg_46_0.isShowQuick then
		onNextTick(function()
			triggerToggle(arg_46_0.showQuickBtn, false)
			triggerToggle(arg_46_0.showQuickBtn, true)
		end)
	elseif arg_46_0.selectedEquip and arg_46_0.isShowQuick then
		local var_46_8 = arg_46_0.selectedEquip.index

		arg_46_0:selectedEquipItem(nil)
		arg_46_0:selectedEquipItem(var_46_8)
	end

	arg_46_0.lastShipVo = arg_46_1.id

	local var_46_9, var_46_10 = arg_46_1:IsSpweaponUnlock()

	setActive(arg_46_0.spWeaponSlot:Find("Lock"), not var_46_9)

	local var_46_11 = arg_46_1:GetSpWeapon()

	setActive(arg_46_0.spWeaponSlot:Find("Icon"), var_46_11)
	setActive(arg_46_0.spWeaponSlot:Find("IconShadow"), var_46_11)

	if var_46_11 then
		UpdateSpWeaponSlot(arg_46_0.spWeaponSlot, var_46_11)
	end

	onButton(arg_46_0, arg_46_0.spWeaponSlot, function()
		if not var_46_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n(var_46_10))

			return
		elseif var_46_11 then
			arg_46_0:emit(BaseUI.ON_SPWEAPON, {
				type = EquipmentInfoMediator.TYPE_SHIP,
				shipId = arg_46_0:GetShipVO().id
			})
		else
			arg_46_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.EQUIPMENT)
		end
	end, SFX_PANEL)
end

function var_0_0.selectedEquipItem(arg_54_0, arg_54_1)
	if not arg_54_1 then
		if arg_54_0.selectedEquip then
			arg_54_0.selectedEquip = nil
			arg_54_0.showEquipItem = nil
		end
	else
		arg_54_0.selectedEquip = arg_54_0.equipItems[arg_54_1]
	end

	if arg_54_0.isShowQuick then
		arg_54_0:updateQuickPanel()
	end
end

function var_0_0.updateQuickPanel(arg_55_0, arg_55_1)
	setActive(arg_55_0.selectTitle, not arg_55_0.selectedEquip)

	if arg_55_0.isShowQuick and arg_55_0.selectedEquip then
		if arg_55_0.selectedEquip ~= arg_55_0.showEquipItem or arg_55_1 then
			arg_55_0.showEquipItem = arg_55_0.selectedEquip

			arg_55_0:updateQuickEquipments()
		end
	else
		arg_55_0:setListCount(0, 0)
		setActive(arg_55_0.emptyTitle, false)
	end

	if arg_55_0.equipItems then
		for iter_55_0 = 1, #arg_55_0.equipItems do
			if arg_55_0.selectedEquip and arg_55_0.selectedEquip.index == iter_55_0 then
				setActive(findTF(arg_55_0.equipItems[iter_55_0].tf, "selected"), true)
			else
				setActive(findTF(arg_55_0.equipItems[iter_55_0].tf, "selected"), false)
			end
		end
	end
end

function var_0_0.updateQuickEquipments(arg_56_0)
	arg_56_0:setListCount(0, 0)

	arg_56_0.fillterEquipments = arg_56_0:getEquipments()

	setActive(arg_56_0.emptyTitle, false)

	if arg_56_0.selectedEquip and arg_56_0.selectedEquip.empty then
		setActive(arg_56_0.emptyTitle, #arg_56_0.fillterEquipments == 0)
	end

	local var_56_0 = arg_56_0.selectedEquip.empty and 0 or 1

	arg_56_0:setListCount(#arg_56_0.fillterEquipments + var_56_0, 0)
end

function var_0_0.setListCount(arg_57_0, arg_57_1, arg_57_2)
	if arg_57_0.onSelected and isActive(arg_57_0._tf) then
		arg_57_0.list:SetTotalCount(arg_57_1, arg_57_2)
	end
end

function var_0_0.getEquipments(arg_58_0)
	local var_58_0 = getProxy(BayProxy)
	local var_58_1 = arg_58_0:GetShipVO()
	local var_58_2 = getProxy(EquipmentProxy)
	local var_58_3 = pg.ship_data_template[var_58_1.configId]["equip_" .. arg_58_0.selectedEquip.index]
	local var_58_4 = var_58_1:getShipType()
	local var_58_5 = var_58_2:getEquipmentsByFillter(var_58_4, var_58_3)
	local var_58_6 = arg_58_0.searchBar:GetInputText()

	if arg_58_0.equipingFlag then
		for iter_58_0, iter_58_1 in ipairs(var_58_0:getEquipsInShips(function(arg_59_0, arg_59_1)
			return var_58_1.id ~= arg_59_1 and not var_58_1:isForbiddenAtPos(arg_59_0, arg_58_0.selectedEquip.index)
		end)) do
			if var_58_6 == "" or iter_58_1:IsMatchKey(var_58_6) then
				table.insert(var_58_5, iter_58_1)
			end
		end
	end

	local var_58_7 = {}
	local var_58_8 = {
		arg_58_0.indexData.equipPropertyIndex,
		arg_58_0.indexData.equipPropertyIndex2
	}

	for iter_58_2, iter_58_3 in pairs(var_58_5) do
		if arg_58_0:checkFillter(iter_58_3, var_58_8) and (var_58_6 == "" or iter_58_3:IsMatchKey(var_58_6)) then
			table.insert(var_58_7, iter_58_3)
		end
	end

	_.each(var_58_7, function(arg_60_0)
		if not var_58_1:canEquipAtPos(arg_60_0, arg_58_0.selectedEquip.index) then
			arg_60_0.mask = true
		end
	end)
	table.sort(var_58_7, CompareFuncs(var_0_1.sortFunc(var_0_1.sort[1], false)))

	return var_58_7
end

function var_0_0.checkFillter(arg_61_0, arg_61_1, arg_61_2)
	return (arg_61_1.count > 0 or arg_61_1.shipId and arg_61_0.equipingFlag) and IndexConst.filterEquipByType(arg_61_1, arg_61_0.indexData.typeIndex) and IndexConst.filterEquipByProperty(arg_61_1, arg_61_2) and IndexConst.filterEquipAmmo1(arg_61_1, arg_61_0.indexData.equipAmmoIndex1) and IndexConst.filterEquipAmmo2(arg_61_1, arg_61_0.indexData.equipAmmoIndex2) and IndexConst.filterEquipByCamp(arg_61_1, arg_61_0.indexData.equipCampIndex) and IndexConst.filterEquipByRarity(arg_61_1, arg_61_0.indexData.rarityIndex) and IndexConst.filterEquipByExtra(arg_61_1, arg_61_0.indexData.extraIndex)
end

function var_0_0.UpdateLock(arg_62_0)
	local var_62_0 = arg_62_0:GetShipVO():GetLockState()

	if var_62_0 == arg_62_0:GetShipVO().LOCK_STATE_UNLOCK then
		setActive(arg_62_0.lockBtn, true)
		setActive(arg_62_0.unlockBtn, false)
	elseif var_62_0 == arg_62_0:GetShipVO().LOCK_STATE_LOCK then
		setActive(arg_62_0.lockBtn, false)
		setActive(arg_62_0.unlockBtn, true)
	end
end

function var_0_0.displayQuickPanel(arg_63_0)
	if not arg_63_0:GetShipVO() then
		return
	end

	arg_63_0.isShowQuick = true

	setActive(arg_63_0.attrs, false)
	setActive(arg_63_0.quickPanel, true)
	arg_63_0:updateQuickPanel()
end

function var_0_0.quickSelectEmpty(arg_64_0)
	if not arg_64_0.selectedEquip and arg_64_0.equipItems then
		for iter_64_0 = 1, #arg_64_0.equipItems do
			if arg_64_0.equipItems[iter_64_0].empty then
				arg_64_0:selectedEquipItem(arg_64_0.equipItems[iter_64_0].index)

				return
			end
		end
	end
end

function var_0_0.Show(arg_65_0)
	var_0_0.super.Show(arg_65_0)
	setActive(arg_65_0.randomFlagToggle, arg_65_0.activeRandomFlag)
end

function var_0_0.Hide(arg_66_0)
	var_0_0.super.Hide(arg_66_0)
	setActive(arg_66_0.randomFlagToggle, false)
end

local var_0_3 = 0.2

function var_0_0.displayRecordPanel(arg_67_0)
	if not arg_67_0:GetShipVO() then
		return
	end

	arg_67_0.isShowRecord = true

	setActive(arg_67_0.recordPanel, true)
	setActive(arg_67_0.attrs, false)

	for iter_67_0, iter_67_1 in ipairs(arg_67_0.recordBtns) do
		onButton(arg_67_0, iter_67_1, function()
			arg_67_0:emit(ShipMainMediator.ON_RECORD_EQUIPMENT, arg_67_0:GetShipVO().id, iter_67_0, 1)
		end, SFX_PANEL)
	end

	for iter_67_2, iter_67_3 in ipairs(arg_67_0.equipRecordBtns) do
		onButton(arg_67_0, iter_67_3, function()
			arg_67_0:emit(ShipMainMediator.ON_RECORD_EQUIPMENT, arg_67_0:GetShipVO().id, iter_67_2, 2)
		end, SFX_PANEL)
	end

	for iter_67_4, iter_67_5 in ipairs(arg_67_0.recordEquipmentsTFs) do
		arg_67_0:UpdateRecordEquipments(iter_67_4)
	end

	arg_67_0:UpdateRecordSpWeapons()
end

function var_0_0.CloseRecordPanel(arg_70_0, arg_70_1)
	if arg_70_1 then
		arg_70_0.isShowRecord = nil

		setActive(arg_70_0.recordPanel, false)

		if not arg_70_0.isShowRecord and not arg_70_0.isShowQuick then
			setActive(arg_70_0.attrs, true)
		end
	else
		triggerToggle(arg_70_0.showRecordBtn, false)
	end
end

function var_0_0.CloseQuickPanel(arg_71_0)
	arg_71_0.isShowQuick = nil

	arg_71_0:selectedEquipItem(nil)

	arg_71_0.showEquipItem = nil

	if arg_71_0.list then
		arg_71_0:setListCount(0, 0)
	end

	setActive(arg_71_0.quickPanel, false)

	if not arg_71_0.isShowRecord and not arg_71_0.isShowQuick then
		setActive(arg_71_0.attrs, true)
	end

	arg_71_0:updateQuickPanel()
end

function var_0_0.UpdateRecordEquipments(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_0.recordEquipmentsTFs[arg_72_1]
	local var_72_1 = arg_72_0:GetShipVO():getEquipmentRecord(arg_72_0.shareData.player.id)[arg_72_1] or {}

	for iter_72_0 = 1, 5 do
		local var_72_2 = tonumber(var_72_1[iter_72_0])
		local var_72_3 = var_72_2 and var_72_2 ~= -1
		local var_72_4 = var_72_0:Find("equipment_" .. iter_72_0)
		local var_72_5 = var_72_4:Find("empty")
		local var_72_6 = var_72_4:Find("info")

		setActive(var_72_6, var_72_3)
		setActive(var_72_5, not var_72_3)

		if var_72_3 then
			local var_72_7 = arg_72_0.equipmentProxy:getEquipmentById(var_72_2)
			local var_72_8 = arg_72_0:GetShipVO().equipments[iter_72_0]
			local var_72_9 = not (var_72_8 and var_72_8.id == var_72_2 or false) and (not var_72_7 or not (var_72_7.count > 0))

			setActive(var_72_6:Find("tip"), var_72_9)
			updateEquipment(var_72_6:Find("IconTpl"), Equipment.New({
				id = var_72_2
			}))

			if var_72_9 then
				onButton(arg_72_0, var_72_6, function()
					pg.TipsMgr.GetInstance():ShowTips(i18n("ship_quick_change_nofreeequip"))
				end, SFX_PANEL)
			end
		else
			removeOnButton(var_72_6)
		end
	end
end

function var_0_0.UpdateRecordSpWeapons(arg_74_0, arg_74_1)
	if LOCK_SP_WEAPON then
		return
	end

	local var_74_0 = arg_74_0:GetShipVO():GetSpWeaponRecord(arg_74_0.shareData.player.id)

	table.Foreach(arg_74_0.recordBars, function(arg_75_0, arg_75_1)
		if arg_74_1 and arg_75_0 ~= arg_74_1 then
			return
		end

		local var_75_0 = var_74_0[arg_75_0]
		local var_75_1 = arg_75_1:Find("SpSlot")
		local var_75_2 = arg_74_0:GetShipVO():IsSpweaponUnlock()

		setActive(var_75_1:Find("Lock"), not var_75_2)
		setActive(var_75_1:Find("Icon"), var_75_0)
		setActive(var_75_1:Find("IconShadow"), var_75_0)

		if var_75_0 then
			UpdateSpWeaponSlot(var_75_1, var_75_0)

			local var_75_3 = arg_74_0:GetShipVO():GetSpWeapon()
			local var_75_4 = var_75_3 and var_75_3:GetConfigID() or 0
			local var_75_5 = var_75_0:GetConfigID() ~= var_75_4

			if var_75_5 then
				local var_75_6 = getProxy(EquipmentProxy):GetSameTypeSpWeapon(var_75_0)

				if var_75_6 and var_75_6:GetConfigID() == var_75_0:GetConfigID() then
					var_75_5 = false
				end
			end

			setActive(var_75_1:Find("Icon/tip"), var_75_5)

			if var_75_5 then
				onButton(arg_74_0, var_75_1, function()
					pg.TipsMgr.GetInstance():ShowTips(i18n("ship_quick_change_nofreeequip"))
				end, SFX_PANEL)
			else
				removeOnButton(var_75_1)
			end
		else
			removeOnButton(var_75_1)
		end
	end)
end

function var_0_0.UpdatePreferenceTag(arg_77_0)
	triggerToggle(arg_77_0.commonTagToggle, arg_77_0:GetShipVO().preferenceTag == Ship.PREFERENCE_TAG_COMMON)
end

function var_0_0.DoLeveUpAnim(arg_78_0, arg_78_1, arg_78_2, arg_78_3)
	arg_78_0.shipDetailLogicPanel:doLeveUpAnim(arg_78_1, arg_78_2, arg_78_3)
end

function var_0_0.clearListener(arg_79_0)
	if arg_79_0.equipItems then
		for iter_79_0 = 1, #arg_79_0.equipItems do
			local var_79_0 = arg_79_0.equipItems[iter_79_0].tf

			if var_79_0 then
				ClearEventTrigger(GetOrAddComponent(go(var_79_0), typeof(EventTriggerListener)))
				removeOnButton(go(var_79_0))
			end
		end
	end
end

function var_0_0.OnDestroy(arg_80_0)
	setParent(arg_80_0.randomFlagToggle, arg_80_0._tf)
	arg_80_0:clearListener()
	removeAllChildren(arg_80_0.equipmentsGrid)

	if arg_80_0.list then
		arg_80_0.list:SetTotalCount(0)

		function arg_80_0.list.onUpdateItem()
			return
		end
	end

	arg_80_0.destroy = true

	if arg_80_0.recordPanel then
		if LeanTween.isTweening(go(arg_80_0.recordPanel)) then
			LeanTween.cancel(go(arg_80_0.recordPanel))
		end

		arg_80_0.recordPanel = nil
	end

	arg_80_0.shipDetailLogicPanel:clear()
	arg_80_0.shipDetailLogicPanel:detach()

	arg_80_0.shareData = nil

	if arg_80_0.searchBar then
		arg_80_0.searchBar:Dispose()

		arg_80_0.searchBar = nil
	end
end

return var_0_0
