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

function var_0_0.OnInit(arg_2_0)
	arg_2_0:InitDetail()
	arg_2_0:InitEvent()
	setParent(arg_2_0.randomFlagToggle, arg_2_0._tf.parent)
	setActive(arg_2_0.randomFlagToggle, true)
end

function var_0_0.InitDetail(arg_3_0)
	arg_3_0.mainPanel = arg_3_0._parentTf.parent
	arg_3_0.detailPanel = arg_3_0._tf
	arg_3_0.attrs = arg_3_0.detailPanel:Find("attrs")

	setActive(arg_3_0.attrs, false)

	arg_3_0.shipDetailLogicPanel = ShipDetailLogicPanel.New(arg_3_0.attrs)

	arg_3_0.shipDetailLogicPanel:attach(arg_3_0)

	arg_3_0.equipments = arg_3_0.detailPanel:Find("equipments")
	arg_3_0.equipmentsGrid = arg_3_0.equipments:Find("equipments")
	arg_3_0.detailEquipmentTpl = arg_3_0.equipments:Find("equipment_tpl")
	arg_3_0.emptyGridTpl = arg_3_0.equipments:Find("empty_tpl")
	arg_3_0.showRecordBtn = arg_3_0.equipments:Find("unload_all")
	arg_3_0.showQuickBtn = arg_3_0.equipments:Find("quickButton")
	arg_3_0.showECodeShareBtn = arg_3_0.equipments:Find("shareButton")
	arg_3_0.equipCodeBtn = arg_3_0.equipments:Find("equip_code")
	arg_3_0.lockBtn = arg_3_0.detailPanel:Find("lock_btn")
	arg_3_0.unlockBtn = arg_3_0.detailPanel:Find("unlock_btn")
	arg_3_0.viewBtn = arg_3_0.detailPanel:Find("view_btn")
	arg_3_0.evaluationBtn = arg_3_0.detailPanel:Find("evaluation_btn")
	arg_3_0.profileBtn = arg_3_0.detailPanel:Find("profile_btn")
	arg_3_0.fashionToggle = arg_3_0.detailPanel:Find("fashion_toggle")
	arg_3_0.randomFlagToggle = arg_3_0.detailPanel:Find("random_flag_toggle")
	arg_3_0.fashionTag = arg_3_0.fashionToggle:Find("Tag")
	arg_3_0.commonTagToggle = arg_3_0.detailPanel:Find("common_toggle")
	arg_3_0.spWeaponSlot = arg_3_0.equipments:Find("SpSlot")
	arg_3_0.propertyIcons = arg_3_0.detailPanel:Find("attrs/attrs/property/icons")
	arg_3_0.intimacyTF = arg_3_0:findTF("intimacy")
	arg_3_0.updateItemTick = 0
	arg_3_0.quickPanel = arg_3_0.detailPanel:Find("quick_panel")
	arg_3_0.equiping = arg_3_0.quickPanel:Find("equiping")
	arg_3_0.fillter = arg_3_0.quickPanel:Find("fillter")
	arg_3_0.selectTitle = arg_3_0.quickPanel:Find("frame/selectTitle")
	arg_3_0.emptyTitle = arg_3_0.quickPanel:Find("frame/emptyTitle")
	arg_3_0.list = arg_3_0.quickPanel:Find("frame/container/Content"):GetComponent("LScrollRect")
	arg_3_0.indexData = {}

	arg_3_0:CloseQuickPanel()
	setText(arg_3_0.quickPanel:Find("fillter/on/text2"), i18n("quick_equip_tip2"))
	setText(arg_3_0.quickPanel:Find("fillter/off/text2"), i18n("quick_equip_tip2"))
	setText(arg_3_0.quickPanel:Find("equiping/on/text2"), i18n("quick_equip_tip1"))
	setText(arg_3_0.quickPanel:Find("equiping/off/text2"), i18n("quick_equip_tip1"))
	setText(arg_3_0.quickPanel:Find("title/text"), i18n("quick_equip_tip3"))
	setText(arg_3_0.quickPanel:Find("frame/emptyTitle/text"), i18n("quick_equip_tip4"))
	setText(arg_3_0.quickPanel:Find("frame/selectTitle/text"), i18n("quick_equip_tip5"))
	setText(arg_3_0.randomFlagToggle:Find("bg/Text"), i18n("ship_random_secretary_tag"))

	arg_3_0.equipmentProxy = getProxy(EquipmentProxy)
	arg_3_0.recordPanel = arg_3_0.detailPanel:Find("record_panel")
	arg_3_0.unloadAllBtn = arg_3_0.recordPanel:Find("frame/unload_all")
	arg_3_0.recordBars = _.map({
		1,
		2,
		3
	}, function(arg_4_0)
		return arg_3_0.recordPanel:Find("frame/container"):GetChild(arg_4_0 - 1)
	end)
	arg_3_0.recordBtns = {
		arg_3_0.recordPanel:Find("frame/container/record_1/record_btn"),
		arg_3_0.recordPanel:Find("frame/container/record_2/record_btn"),
		arg_3_0.recordPanel:Find("frame/container/record_3/record_btn")
	}
	arg_3_0.recordEquipmentsTFs = {
		arg_3_0.recordPanel:Find("frame/container/record_1/equipments"),
		arg_3_0.recordPanel:Find("frame/container/record_2/equipments"),
		arg_3_0.recordPanel:Find("frame/container/record_3/equipments")
	}
	arg_3_0.equipRecordBtns = {
		arg_3_0.recordPanel:Find("frame/container/record_1/equip_btn"),
		arg_3_0.recordPanel:Find("frame/container/record_2/equip_btn"),
		arg_3_0.recordPanel:Find("frame/container/record_3/equip_btn")
	}

	setActive(arg_3_0.detailPanel, true)
	setActive(arg_3_0.attrs, true)
	setActive(arg_3_0.recordPanel, false)
	setActive(arg_3_0.detailEquipmentTpl, false)
	setActive(arg_3_0.emptyGridTpl, false)
	setActive(arg_3_0.detailPanel, true)

	arg_3_0.onSelected = false

	if PLATFORM_CODE == PLATFORM_CHT and LOCK_SP_WEAPON then
		setActive(arg_3_0.showRecordBtn, false)
		setActive(arg_3_0.showQuickBtn, false)
		setActive(arg_3_0.spWeaponSlot, false)

		arg_3_0.showRecordBtn = arg_3_0.equipments:Find("unload_all_2")
		arg_3_0.showQuickBtn = arg_3_0.equipments:Find("quickButton_2")

		setActive(arg_3_0.showRecordBtn, true)
		setActive(arg_3_0.showQuickBtn, true)
	end
end

function var_0_0.InitEvent(arg_5_0)
	onButton(arg_5_0, arg_5_0.fashionToggle, function()
		arg_5_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.FASHION)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.propertyIcons, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_attr.tip,
			onClose = function()
				return
			end
		})
	end)
	onToggle(arg_5_0, arg_5_0.commonTagToggle, function(arg_9_0)
		local var_9_0 = arg_5_0:GetShipVO().preferenceTag
		local var_9_1 = var_9_0 == Ship.PREFERENCE_TAG_COMMON

		if var_9_1 ~= arg_9_0 then
			if var_9_0 == Ship.PREFERENCE_TAG_COMMON then
				var_9_1 = Ship.PREFERENCE_TAG_NONE
			else
				var_9_1 = Ship.PREFERENCE_TAG_COMMON
			end

			arg_5_0:emit(ShipMainMediator.ON_TAG, arg_5_0:GetShipVO().id, var_9_1)
		end
	end, SFX_CONFIRM)
	onToggle(arg_5_0, arg_5_0.randomFlagToggle, function(arg_10_0)
		if arg_5_0:GetShipVO():getRandomFlag() ~= arg_10_0 then
			arg_5_0:emit(ShipMainMediator.CHANGE_RANDOM_FLAG, arg_5_0:GetShipVO():GetShipPhantomMark(), arg_10_0)
		end
	end, SFX_CONFIRM)
	onButton(arg_5_0, arg_5_0.lockBtn, function()
		arg_5_0:emit(ShipMainMediator.ON_LOCK, {
			arg_5_0:GetShipVO().id
		}, arg_5_0:GetShipVO().LOCK_STATE_LOCK)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.unlockBtn, function()
		arg_5_0:emit(ShipMainMediator.ON_LOCK, {
			arg_5_0:GetShipVO().id
		}, arg_5_0:GetShipVO().LOCK_STATE_UNLOCK)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.viewBtn, function()
		Input.multiTouchEnabled = true

		arg_5_0:emit(ShipViewConst.PAINT_VIEW, true)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.evaluationBtn, function()
		arg_5_0:emit(ShipMainMediator.OPEN_EVALUATION, arg_5_0:GetShipVO():getGroupId(), arg_5_0:GetShipVO():isActivityNpc())
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.profileBtn, function()
		arg_5_0:emit(ShipMainMediator.OPEN_SHIPPROFILE, arg_5_0:GetShipVO():getGroupId(), arg_5_0:GetShipVO():isRemoulded())
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.intimacyTF, function()
		if arg_5_0:GetShipVO():isActivityNpc() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("npc_propse_tip"))

			return
		end

		if LOCK_PROPOSE then
			return
		end

		arg_5_0:emit(ShipMainMediator.PROPOSE, arg_5_0:GetShipVO().id, function()
			return
		end)
	end)
	onToggle(arg_5_0, arg_5_0.showRecordBtn, function(arg_18_0)
		local var_18_0, var_18_1 = ShipStatus.ShipStatusCheck("onModify", arg_5_0:GetShipVO())

		if not var_18_0 then
			if arg_18_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_18_1)
				onNextTick(function()
					triggerToggle(arg_5_0.showRecordBtn, false)
				end)
			end

			return
		end

		if arg_18_0 then
			arg_5_0:displayRecordPanel()

			if arg_5_0.isShowQuick then
				triggerToggle(arg_5_0.showQuickBtn, false)
			end
		else
			arg_5_0:CloseRecordPanel(true)
		end
	end, SFX_PANEL)
	onToggle(arg_5_0, arg_5_0.showQuickBtn, function(arg_20_0)
		local var_20_0, var_20_1 = ShipStatus.ShipStatusCheck("onModify", arg_5_0:GetShipVO())

		if not var_20_0 then
			if arg_20_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_20_1)
				onNextTick(function()
					triggerToggle(arg_5_0.showQuickBtn, false)
				end)
			end

			arg_5_0:CloseRecordPanel(true)
			arg_5_0:CloseQuickPanel()

			return
		end

		if arg_20_0 then
			arg_5_0:displayQuickPanel()

			if arg_5_0.selectedEquip then
				arg_5_0:selectedEquipItem(arg_5_0.selectedEquip.index)
			else
				arg_5_0:quickSelectEmpty()
			end

			if arg_5_0.isShowRecord then
				triggerToggle(arg_5_0.showRecordBtn, false)
			end
		else
			arg_5_0:CloseQuickPanel()
		end
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.equipCodeBtn, function()
		arg_5_0:emit(ShipMainMediator.OPEN_EQUIP_CODE, {})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.showECodeShareBtn, function()
		local var_23_0 = arg_5_0:GetShipVO()

		arg_5_0:emit(ShipMainMediator.OPEN_EQUIP_CODE_SHARE, var_23_0.id, var_23_0:getGroupId())
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.unloadAllBtn, function()
		local var_24_0, var_24_1 = ShipStatus.ShipStatusCheck("onModify", arg_5_0:GetShipVO())

		if not var_24_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_24_1)
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("ship_unequip_all_tip"),
				onYes = function()
					arg_5_0:emit(ShipMainMediator.UNEQUIP_FROM_SHIP_ALL, arg_5_0:GetShipVO().id)
				end
			})
		end
	end, SFX_PANEL)

	function arg_5_0.list.onInitItem(arg_26_0)
		ClearTweenItemAlphaAndWhite(arg_26_0)
	end

	function arg_5_0.list.onReturnItem(arg_27_0, arg_27_1)
		ClearTweenItemAlphaAndWhite(arg_27_1)
	end

	function arg_5_0.list.onUpdateItem(arg_28_0, arg_28_1)
		setActive(findTF(tf(arg_28_1), "IconTpl/icon_bg/icon"), false)
		TweenItemAlphaAndWhite(arg_28_1)

		if arg_28_0 == 0 and not arg_5_0.selectedEquip.empty then
			setActive(findTF(tf(arg_28_1), "unEquip"), true)
			setActive(findTF(tf(arg_28_1), "bg"), false)
			setActive(findTF(tf(arg_28_1), "IconTpl"), false)
			onButton(arg_5_0, tf(arg_28_1), function()
				local var_29_0 = arg_5_0.selectedEquip.index
				local var_29_1 = arg_5_0:GetShipVO()
				local var_29_2 = var_29_1:getEquip(arg_5_0.selectedEquip.index):getConfig("name")
				local var_29_3 = var_29_1:getName()

				arg_5_0:emit(ShipMainMediator.UNEQUIP_FROM_SHIP, {
					shipId = var_29_1.id,
					pos = var_29_0
				})
			end, SFX_PANEL)
		else
			setActive(findTF(tf(arg_28_1), "unEquip"), false)
			setActive(findTF(tf(arg_28_1), "bg"), true)
			setActive(findTF(tf(arg_28_1), "IconTpl"), true)

			local var_28_0 = arg_5_0.selectedEquip.empty and arg_28_0 + 1 or arg_28_0
			local var_28_1 = arg_5_0.fillterEquipments[var_28_0]

			if not var_28_1 then
				return
			end

			setActive(findTF(tf(arg_28_1), "IconTpl/icon_bg/icon"), true)
			updateEquipment(arg_5_0:findTF("IconTpl", tf(arg_28_1)), var_28_1)

			if var_28_1.shipId then
				local var_28_2 = getProxy(BayProxy):getShipById(var_28_1.shipId)

				setImageSprite(findTF(tf(arg_28_1), "IconTpl/icon_bg/equip_flag/Image"), LoadSprite("qicon/" .. var_28_2:getPainting()))
			end

			setActive(findTF(tf(arg_28_1), "IconTpl/icon_bg/equip_flag"), var_28_1.shipId and var_28_1.shipId > 0)
			setActive(findTF(tf(arg_28_1), "IconTpl/mask"), var_28_1.mask)
			onButton(arg_5_0, tf(arg_28_1), function()
				if var_28_1.mask then
					return
				end

				arg_5_0:changeEquip(var_28_1)
			end, SFX_PANEL)
		end
	end

	onToggle(arg_5_0, arg_5_0.equiping, function(arg_31_0)
		arg_5_0.equipingFlag = arg_31_0

		if arg_5_0.selectedEquip then
			arg_5_0:updateQuickPanel(true)
		end
	end, SFX_PANEL)
	triggerToggle(arg_5_0.equiping, true)
	onButton(arg_5_0, arg_5_0.fillter, function()
		arg_5_0.indexData = arg_5_0.indexData or {}

		if not var_0_0.EQUIPMENT_INDEX then
			var_0_0.EQUIPMENT_INDEX = Clone(StoreHouseConst.EQUIPMENT_INDEX_COMMON)

			table.removebyvalue(var_0_0.EQUIPMENT_INDEX.customPanels.extraIndex.options, IndexConst.EquipmentExtraEquiping)
			table.removebyvalue(var_0_0.EQUIPMENT_INDEX.customPanels.extraIndex.names, "index_equip")
		end

		local var_32_0 = setmetatable({
			indexDatas = Clone(arg_5_0.indexData),
			callback = function(arg_33_0)
				arg_5_0.indexData.typeIndex = arg_33_0.typeIndex
				arg_5_0.indexData.equipPropertyIndex = arg_33_0.equipPropertyIndex
				arg_5_0.indexData.equipPropertyIndex2 = arg_33_0.equipPropertyIndex2
				arg_5_0.indexData.equipAmmoIndex1 = arg_33_0.equipAmmoIndex1
				arg_5_0.indexData.equipAmmoIndex2 = arg_33_0.equipAmmoIndex2
				arg_5_0.indexData.equipCampIndex = arg_33_0.equipCampIndex
				arg_5_0.indexData.rarityIndex = arg_33_0.rarityIndex
				arg_5_0.indexData.extraIndex = arg_33_0.extraIndex

				local var_33_0 = underscore(arg_5_0.indexData):chain():keys():all(function(arg_34_0)
					return arg_5_0.indexData[arg_34_0] == var_0_0.EQUIPMENT_INDEX.customPanels[arg_34_0].options[1]
				end):value()

				setActive(findTF(arg_5_0.fillter, "on"), not var_33_0)
				setActive(findTF(arg_5_0.fillter, "off"), var_33_0)
				arg_5_0:updateQuickPanel(true)
			end
		}, {
			__index = var_0_0.EQUIPMENT_INDEX
		})

		arg_5_0:emit(ShipMainMediator.OPEN_EQUIPMENT_INDEX, var_32_0)
	end, SFX_PANEL)
end

function var_0_0.changeEquip(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0.selectedEquip.index
	local var_35_1 = arg_35_0:GetShipVO()
	local var_35_2 = {
		quickFlag = true,
		type = EquipmentInfoMediator.TYPE_REPLACE,
		equipmentId = arg_35_1.id,
		shipId = var_35_1.id,
		pos = var_35_0,
		oldShipId = arg_35_1.shipId,
		oldPos = arg_35_1.shipPos
	}

	if var_35_2 then
		if PlayerPrefs.GetInt("QUICK_CHANGE_EQUIP", 1) == 1 then
			arg_35_0:emit(BaseUI.ON_EQUIPMENT, var_35_2)
		else
			local var_35_3, var_35_4 = var_35_1:canEquipAtPos(arg_35_1, var_35_0)

			if not var_35_3 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_equipmentInfoLayer_error_canNotEquip", var_35_4))

				return
			end

			if arg_35_1.shipId then
				local var_35_5 = getProxy(BayProxy):getShipById(arg_35_1.shipId)
				local var_35_6, var_35_7 = ShipStatus.ShipStatusCheck("onModify", var_35_5)

				if not var_35_6 then
					pg.TipsMgr.GetInstance():ShowTips(var_35_7)
				else
					arg_35_0:emit(ShipMainMediator.EQUIP_CHANGE_NOTICE, {
						notice = GAME.EQUIP_FROM_SHIP,
						data = var_35_2
					})
				end
			else
				arg_35_0:emit(ShipMainMediator.EQUIP_CHANGE_NOTICE, {
					notice = GAME.EQUIP_TO_SHIP,
					data = var_35_2
				})
			end
		end
	end
end

function var_0_0.SetShareData(arg_36_0, arg_36_1)
	arg_36_0.shareData = arg_36_1
end

function var_0_0.GetShipVO(arg_37_0)
	if arg_37_0.shareData and arg_37_0.shareData.shipVO then
		return arg_37_0.shareData.shipVO
	end

	return nil
end

function var_0_0.OnSelected(arg_38_0, arg_38_1)
	if arg_38_1 then
		arg_38_0:OverlayPanel(arg_38_0._parentTf, {
			pbList = {
				arg_38_0.detailPanel:Find("attrs"),
				arg_38_0.detailPanel:Find("equipments"),
				arg_38_0.detailPanel:Find("quick_panel")
			}
		})
	else
		arg_38_0:UnOverlayPanel(arg_38_0._parentTf, arg_38_0.mainPanel)
	end

	arg_38_0.onSelected = arg_38_1

	if arg_38_0.onSelected and arg_38_0.selectedEquip then
		local var_38_0 = arg_38_0.selectedEquip.index

		arg_38_0:selectedEquipItem(nil)
		arg_38_0:selectedEquipItem(var_38_0)
	end
end

function var_0_0.UpdateUI(arg_39_0)
	local var_39_0 = arg_39_0:GetShipVO()

	arg_39_0:UpdateIntimacy(var_39_0)
	arg_39_0:UpdateDetail(var_39_0)
	arg_39_0:UpdateEquipments(var_39_0)
	arg_39_0:UpdateLock()
	arg_39_0:UpdatePreferenceTag()
	triggerToggle(arg_39_0.randomFlagToggle, arg_39_0:GetShipVO():getRandomFlag())
end

function var_0_0.UpdateIntimacy(arg_40_0, arg_40_1)
	setActive(arg_40_0.intimacyTF, not LOCK_PROPOSE)
	setIntimacyIcon(arg_40_0.intimacyTF, arg_40_1:getIntimacyIcon())
end

function var_0_0.UpdateDetail(arg_41_0, arg_41_1)
	arg_41_0.shipDetailLogicPanel:flush(arg_41_1)

	local var_41_0 = arg_41_0.shipDetailLogicPanel.attrs:Find("icons/hunting_range/bg")

	removeOnButton(var_41_0)

	if table.contains(TeamType.SubShipType, arg_41_1:getShipType()) then
		onButton(arg_41_0, var_41_0, function()
			arg_41_0:emit(ShipViewConst.DISPLAY_HUNTING_RANGE, true)
		end, SFX_PANEL)
	end

	if not HXSet.isHxSkin() then
		setActive(arg_41_0.fashionToggle, arg_41_0.shareData:HasFashion())
	else
		setActive(arg_41_0.fashionToggle, false)
	end

	arg_41_0:UpdateFashionTag()
	setActive(arg_41_0.profileBtn, not arg_41_1:isActivityNpc())
end

function var_0_0.UpdateFashionTag(arg_43_0)
	local var_43_0 = arg_43_0:GetShipVO()

	setActive(arg_43_0.fashionTag, #PaintingGroupConst.GetPaintingNameListByShipVO(var_43_0) > 0)
end

function var_0_0.UpdateEquipments(arg_44_0, arg_44_1)
	arg_44_0:clearListener()
	removeAllChildren(arg_44_0.equipmentsGrid)

	local var_44_0 = arg_44_1:getActiveEquipments()

	arg_44_0.equipItems = {}

	for iter_44_0, iter_44_1 in ipairs(arg_44_1.equipments) do
		local var_44_1 = var_44_0[iter_44_0]
		local var_44_2
		local var_44_3 = iter_44_0
		local var_44_4

		if iter_44_1 then
			var_44_2 = cloneTplTo(arg_44_0.detailEquipmentTpl, arg_44_0.equipmentsGrid)
			var_44_4 = {
				empty = false,
				tf = var_44_2,
				index = var_44_3
			}

			table.insert(arg_44_0.equipItems, var_44_4)
			updateEquipment(arg_44_0:findTF("IconTpl", var_44_2), iter_44_1)
			onButton(arg_44_0, var_44_2, function()
				if arg_44_0.isShowQuick then
					arg_44_0:selectedEquipItem(var_44_3)
				else
					arg_44_0:emit(BaseUI.ON_EQUIPMENT, {
						type = EquipmentInfoMediator.TYPE_SHIP,
						shipId = arg_44_0:GetShipVO().id,
						pos = iter_44_0
					})
				end
			end, SFX_UI_DOCKYARD_EQUIPADD)
		else
			var_44_2 = cloneTplTo(arg_44_0.emptyGridTpl, arg_44_0.equipmentsGrid)
			var_44_4 = {
				empty = true,
				tf = var_44_2,
				index = var_44_3
			}

			table.insert(arg_44_0.equipItems, var_44_4)
			onButton(arg_44_0, var_44_2, function()
				if arg_44_0.isShowQuick then
					arg_44_0:selectedEquipItem(var_44_3)
				else
					arg_44_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.EQUIPMENT)
				end
			end, SFX_UI_DOCKYARD_EQUIPADD)
		end

		local var_44_5 = GetOrAddComponent(var_44_2, typeof(EventTriggerListener))

		var_44_5:AddPointDownFunc(function()
			if var_44_2 and not arg_44_0.isShowQuick then
				LeanTween.delayedCall(go(var_44_2), 1, System.Action(function()
					arg_44_0.selectedEquip = var_44_4

					triggerToggle(arg_44_0.showQuickBtn, true)
				end))
			end
		end)
		var_44_5:AddPointUpFunc(function()
			if var_44_2 and LeanTween.isTweening(go(var_44_2)) then
				LeanTween.cancel(go(var_44_2))
			end
		end)
	end

	local var_44_6, var_44_7 = ShipStatus.ShipStatusCheck("onModify", arg_44_0:GetShipVO())

	if not var_44_6 then
		triggerToggle(arg_44_0.showQuickBtn, false)
	elseif arg_44_1.id ~= arg_44_0.lastShipVo and arg_44_0.isShowQuick then
		onNextTick(function()
			triggerToggle(arg_44_0.showQuickBtn, false)
			triggerToggle(arg_44_0.showQuickBtn, true)
		end)
	elseif arg_44_0.selectedEquip and arg_44_0.isShowQuick then
		local var_44_8 = arg_44_0.selectedEquip.index

		arg_44_0:selectedEquipItem(nil)
		arg_44_0:selectedEquipItem(var_44_8)
	end

	arg_44_0.lastShipVo = arg_44_1.id

	local var_44_9, var_44_10 = arg_44_1:IsSpweaponUnlock()

	setActive(arg_44_0.spWeaponSlot:Find("Lock"), not var_44_9)

	local var_44_11 = arg_44_1:GetSpWeapon()

	setActive(arg_44_0.spWeaponSlot:Find("Icon"), var_44_11)
	setActive(arg_44_0.spWeaponSlot:Find("IconShadow"), var_44_11)

	if var_44_11 then
		UpdateSpWeaponSlot(arg_44_0.spWeaponSlot, var_44_11)
	end

	onButton(arg_44_0, arg_44_0.spWeaponSlot, function()
		if not var_44_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n(var_44_10))

			return
		elseif var_44_11 then
			arg_44_0:emit(BaseUI.ON_SPWEAPON, {
				type = EquipmentInfoMediator.TYPE_SHIP,
				shipId = arg_44_0:GetShipVO().id
			})
		else
			arg_44_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.EQUIPMENT)
		end
	end, SFX_PANEL)
end

function var_0_0.selectedEquipItem(arg_52_0, arg_52_1)
	if not arg_52_1 then
		if arg_52_0.selectedEquip then
			arg_52_0.selectedEquip = nil
			arg_52_0.showEquipItem = nil
		end
	else
		arg_52_0.selectedEquip = arg_52_0.equipItems[arg_52_1]
	end

	if arg_52_0.isShowQuick then
		arg_52_0:updateQuickPanel()
	end
end

function var_0_0.updateQuickPanel(arg_53_0, arg_53_1)
	setActive(arg_53_0.selectTitle, not arg_53_0.selectedEquip)

	if arg_53_0.isShowQuick and arg_53_0.selectedEquip then
		if arg_53_0.selectedEquip ~= arg_53_0.showEquipItem or arg_53_1 then
			arg_53_0.showEquipItem = arg_53_0.selectedEquip

			arg_53_0:updateQuickEquipments()
		end
	else
		arg_53_0:setListCount(0, 0)
		setActive(arg_53_0.emptyTitle, false)
	end

	if arg_53_0.equipItems then
		for iter_53_0 = 1, #arg_53_0.equipItems do
			if arg_53_0.selectedEquip and arg_53_0.selectedEquip.index == iter_53_0 then
				setActive(findTF(arg_53_0.equipItems[iter_53_0].tf, "selected"), true)
			else
				setActive(findTF(arg_53_0.equipItems[iter_53_0].tf, "selected"), false)
			end
		end
	end
end

function var_0_0.updateQuickEquipments(arg_54_0)
	arg_54_0:setListCount(0, 0)

	arg_54_0.fillterEquipments = arg_54_0:getEquipments()

	setActive(arg_54_0.emptyTitle, false)

	if arg_54_0.selectedEquip and arg_54_0.selectedEquip.empty then
		setActive(arg_54_0.emptyTitle, #arg_54_0.fillterEquipments == 0)
	end

	local var_54_0 = arg_54_0.selectedEquip.empty and 0 or 1

	arg_54_0:setListCount(#arg_54_0.fillterEquipments + var_54_0, 0)
end

function var_0_0.setListCount(arg_55_0, arg_55_1, arg_55_2)
	if arg_55_0.onSelected and isActive(arg_55_0._tf) then
		arg_55_0.list:SetTotalCount(arg_55_1, arg_55_2)
	end
end

function var_0_0.getEquipments(arg_56_0)
	local var_56_0 = getProxy(BayProxy)
	local var_56_1 = arg_56_0:GetShipVO()
	local var_56_2 = getProxy(EquipmentProxy)
	local var_56_3 = pg.ship_data_template[var_56_1.configId]["equip_" .. arg_56_0.selectedEquip.index]
	local var_56_4 = var_56_1:getShipType()
	local var_56_5 = var_56_2:getEquipmentsByFillter(var_56_4, var_56_3)

	if arg_56_0.equipingFlag then
		for iter_56_0, iter_56_1 in ipairs(var_56_0:getEquipsInShips(function(arg_57_0, arg_57_1)
			return var_56_1.id ~= arg_57_1 and not var_56_1:isForbiddenAtPos(arg_57_0, arg_56_0.selectedEquip.index)
		end)) do
			table.insert(var_56_5, iter_56_1)
		end
	end

	local var_56_6 = {}
	local var_56_7 = {
		arg_56_0.indexData.equipPropertyIndex,
		arg_56_0.indexData.equipPropertyIndex2
	}

	for iter_56_2, iter_56_3 in pairs(var_56_5) do
		if arg_56_0:checkFillter(iter_56_3, var_56_7) then
			table.insert(var_56_6, iter_56_3)
		end
	end

	_.each(var_56_6, function(arg_58_0)
		if not var_56_1:canEquipAtPos(arg_58_0, arg_56_0.selectedEquip.index) then
			arg_58_0.mask = true
		end
	end)
	table.sort(var_56_6, CompareFuncs(var_0_1.sortFunc(var_0_1.sort[1], false)))

	return var_56_6
end

function var_0_0.checkFillter(arg_59_0, arg_59_1, arg_59_2)
	return (arg_59_1.count > 0 or arg_59_1.shipId and arg_59_0.equipingFlag) and IndexConst.filterEquipByType(arg_59_1, arg_59_0.indexData.typeIndex) and IndexConst.filterEquipByProperty(arg_59_1, arg_59_2) and IndexConst.filterEquipAmmo1(arg_59_1, arg_59_0.indexData.equipAmmoIndex1) and IndexConst.filterEquipAmmo2(arg_59_1, arg_59_0.indexData.equipAmmoIndex2) and IndexConst.filterEquipByCamp(arg_59_1, arg_59_0.indexData.equipCampIndex) and IndexConst.filterEquipByRarity(arg_59_1, arg_59_0.indexData.rarityIndex) and IndexConst.filterEquipByExtra(arg_59_1, arg_59_0.indexData.extraIndex)
end

function var_0_0.UpdateLock(arg_60_0)
	local var_60_0 = arg_60_0:GetShipVO():GetLockState()

	if var_60_0 == arg_60_0:GetShipVO().LOCK_STATE_UNLOCK then
		setActive(arg_60_0.lockBtn, true)
		setActive(arg_60_0.unlockBtn, false)
	elseif var_60_0 == arg_60_0:GetShipVO().LOCK_STATE_LOCK then
		setActive(arg_60_0.lockBtn, false)
		setActive(arg_60_0.unlockBtn, true)
	end
end

function var_0_0.displayQuickPanel(arg_61_0)
	if not arg_61_0:GetShipVO() then
		return
	end

	arg_61_0.isShowQuick = true

	setActive(arg_61_0.attrs, false)
	setActive(arg_61_0.quickPanel, true)
	arg_61_0:updateQuickPanel()
end

function var_0_0.quickSelectEmpty(arg_62_0)
	if not arg_62_0.selectedEquip and arg_62_0.equipItems then
		for iter_62_0 = 1, #arg_62_0.equipItems do
			if arg_62_0.equipItems[iter_62_0].empty then
				arg_62_0:selectedEquipItem(arg_62_0.equipItems[iter_62_0].index)

				return
			end
		end
	end
end

function var_0_0.Show(arg_63_0)
	var_0_0.super.Show(arg_63_0)
	setActive(arg_63_0.randomFlagToggle, true)
end

function var_0_0.Hide(arg_64_0)
	var_0_0.super.Hide(arg_64_0)
	setActive(arg_64_0.randomFlagToggle, false)
end

local var_0_3 = 0.2

function var_0_0.displayRecordPanel(arg_65_0)
	if not arg_65_0:GetShipVO() then
		return
	end

	arg_65_0.isShowRecord = true

	setActive(arg_65_0.recordPanel, true)
	setActive(arg_65_0.attrs, false)

	for iter_65_0, iter_65_1 in ipairs(arg_65_0.recordBtns) do
		onButton(arg_65_0, iter_65_1, function()
			arg_65_0:emit(ShipMainMediator.ON_RECORD_EQUIPMENT, arg_65_0:GetShipVO().id, iter_65_0, 1)
		end, SFX_PANEL)
	end

	for iter_65_2, iter_65_3 in ipairs(arg_65_0.equipRecordBtns) do
		onButton(arg_65_0, iter_65_3, function()
			arg_65_0:emit(ShipMainMediator.ON_RECORD_EQUIPMENT, arg_65_0:GetShipVO().id, iter_65_2, 2)
		end, SFX_PANEL)
	end

	for iter_65_4, iter_65_5 in ipairs(arg_65_0.recordEquipmentsTFs) do
		arg_65_0:UpdateRecordEquipments(iter_65_4)
	end

	arg_65_0:UpdateRecordSpWeapons()
end

function var_0_0.CloseRecordPanel(arg_68_0, arg_68_1)
	if arg_68_1 then
		arg_68_0.isShowRecord = nil

		setActive(arg_68_0.recordPanel, false)

		if not arg_68_0.isShowRecord and not arg_68_0.isShowQuick then
			setActive(arg_68_0.attrs, true)
		end
	else
		triggerToggle(arg_68_0.showRecordBtn, false)
	end
end

function var_0_0.CloseQuickPanel(arg_69_0)
	arg_69_0.isShowQuick = nil

	arg_69_0:selectedEquipItem(nil)

	arg_69_0.showEquipItem = nil

	if arg_69_0.list then
		arg_69_0:setListCount(0, 0)
	end

	setActive(arg_69_0.quickPanel, false)

	if not arg_69_0.isShowRecord and not arg_69_0.isShowQuick then
		setActive(arg_69_0.attrs, true)
	end

	arg_69_0:updateQuickPanel()
end

function var_0_0.UpdateRecordEquipments(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_0.recordEquipmentsTFs[arg_70_1]
	local var_70_1 = arg_70_0:GetShipVO():getEquipmentRecord(arg_70_0.shareData.player.id)[arg_70_1] or {}

	for iter_70_0 = 1, 5 do
		local var_70_2 = tonumber(var_70_1[iter_70_0])
		local var_70_3 = var_70_2 and var_70_2 ~= -1
		local var_70_4 = var_70_0:Find("equipment_" .. iter_70_0)
		local var_70_5 = var_70_4:Find("empty")
		local var_70_6 = var_70_4:Find("info")

		setActive(var_70_6, var_70_3)
		setActive(var_70_5, not var_70_3)

		if var_70_3 then
			local var_70_7 = arg_70_0.equipmentProxy:getEquipmentById(var_70_2)
			local var_70_8 = arg_70_0:GetShipVO().equipments[iter_70_0]
			local var_70_9 = not (var_70_8 and var_70_8.id == var_70_2 or false) and (not var_70_7 or not (var_70_7.count > 0))

			setActive(var_70_6:Find("tip"), var_70_9)
			updateEquipment(arg_70_0:findTF("IconTpl", var_70_6), Equipment.New({
				id = var_70_2
			}))

			if var_70_9 then
				onButton(arg_70_0, var_70_6, function()
					pg.TipsMgr.GetInstance():ShowTips(i18n("ship_quick_change_nofreeequip"))
				end, SFX_PANEL)
			end
		else
			removeOnButton(var_70_6)
		end
	end
end

function var_0_0.UpdateRecordSpWeapons(arg_72_0, arg_72_1)
	if LOCK_SP_WEAPON then
		return
	end

	local var_72_0 = arg_72_0:GetShipVO():GetSpWeaponRecord(arg_72_0.shareData.player.id)

	table.Foreach(arg_72_0.recordBars, function(arg_73_0, arg_73_1)
		if arg_72_1 and arg_73_0 ~= arg_72_1 then
			return
		end

		local var_73_0 = var_72_0[arg_73_0]
		local var_73_1 = arg_73_1:Find("SpSlot")
		local var_73_2 = arg_72_0:GetShipVO():IsSpweaponUnlock()

		setActive(var_73_1:Find("Lock"), not var_73_2)
		setActive(var_73_1:Find("Icon"), var_73_0)
		setActive(var_73_1:Find("IconShadow"), var_73_0)

		if var_73_0 then
			UpdateSpWeaponSlot(var_73_1, var_73_0)

			local var_73_3 = arg_72_0:GetShipVO():GetSpWeapon()
			local var_73_4 = var_73_3 and var_73_3:GetConfigID() or 0
			local var_73_5 = var_73_0:GetConfigID() ~= var_73_4

			if var_73_5 then
				local var_73_6 = getProxy(EquipmentProxy):GetSameTypeSpWeapon(var_73_0)

				if var_73_6 and var_73_6:GetConfigID() == var_73_0:GetConfigID() then
					var_73_5 = false
				end
			end

			setActive(var_73_1:Find("Icon/tip"), var_73_5)

			if var_73_5 then
				onButton(arg_72_0, var_73_1, function()
					pg.TipsMgr.GetInstance():ShowTips(i18n("ship_quick_change_nofreeequip"))
				end, SFX_PANEL)
			else
				removeOnButton(var_73_1)
			end
		else
			removeOnButton(var_73_1)
		end
	end)
end

function var_0_0.UpdatePreferenceTag(arg_75_0)
	triggerToggle(arg_75_0.commonTagToggle, arg_75_0:GetShipVO().preferenceTag == Ship.PREFERENCE_TAG_COMMON)
end

function var_0_0.DoLeveUpAnim(arg_76_0, arg_76_1, arg_76_2, arg_76_3)
	arg_76_0.shipDetailLogicPanel:doLeveUpAnim(arg_76_1, arg_76_2, arg_76_3)
end

function var_0_0.clearListener(arg_77_0)
	if arg_77_0.equipItems then
		for iter_77_0 = 1, #arg_77_0.equipItems do
			local var_77_0 = arg_77_0.equipItems[iter_77_0].tf

			if var_77_0 then
				ClearEventTrigger(GetOrAddComponent(go(var_77_0), typeof(EventTriggerListener)))
				removeOnButton(go(var_77_0))
			end
		end
	end
end

function var_0_0.OnDestroy(arg_78_0)
	setParent(arg_78_0.randomFlagToggle, arg_78_0._tf)
	arg_78_0:clearListener()
	removeAllChildren(arg_78_0.equipmentsGrid)

	if arg_78_0.list then
		arg_78_0.list:SetTotalCount(0)

		function arg_78_0.list.onUpdateItem()
			return
		end
	end

	arg_78_0.destroy = true

	if arg_78_0.recordPanel then
		if LeanTween.isTweening(go(arg_78_0.recordPanel)) then
			LeanTween.cancel(go(arg_78_0.recordPanel))
		end

		arg_78_0.recordPanel = nil
	end

	arg_78_0.shipDetailLogicPanel:clear()
	arg_78_0.shipDetailLogicPanel:detach()

	arg_78_0.shareData = nil
end

return var_0_0
