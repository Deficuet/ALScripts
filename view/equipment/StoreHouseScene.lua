local var_0_0 = class("StoreHouseScene", import("view.base.BaseUI"))
local var_0_1 = 1
local var_0_2 = 0
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 1
local var_0_6 = 2

function var_0_0.getUIName(arg_1_0)
	return "StoreHouseUI"
end

function var_0_0.setEquipments(arg_2_0, arg_2_1)
	arg_2_0.equipmentVOs = arg_2_1

	arg_2_0:setEquipmentByIds(arg_2_1)
end

function var_0_0.setEquipmentByIds(arg_3_0, arg_3_1)
	arg_3_0.equipmentVOByIds = {}

	for iter_3_0, iter_3_1 in pairs(arg_3_1) do
		if not iter_3_1.isSkin then
			arg_3_0.equipmentVOByIds[iter_3_1.id] = iter_3_1
		end
	end
end

local var_0_7 = require("view.equipment.EquipmentSortCfg")
local var_0_8 = require("view.equipment.SpWeaponSortCfg")

function var_0_0.init(arg_4_0)
	arg_4_0.filterEquipWaitting = 0

	local var_4_0 = arg_4_0.contextData

	arg_4_0.topItems = arg_4_0._tf:Find("topItems")
	arg_4_0.equipmentView = arg_4_0._tf:Find("adapt/equipment_scrollview")
	arg_4_0.blurPanel = arg_4_0._tf:Find("blur_panel")
	arg_4_0.topPanel = arg_4_0.blurPanel:Find("adapt/top")
	arg_4_0.indexBtn = arg_4_0.topPanel:Find("buttons/index_button")
	arg_4_0.sortBtn = arg_4_0.topPanel:Find("buttons/sort_button")
	arg_4_0.sortPanel = arg_4_0.topItems:Find("sort")
	arg_4_0.sortPanelTG = arg_4_0.sortPanel:GetComponent("ToggleGroup")
	arg_4_0.sortPanelTG.allowSwitchOff = true
	arg_4_0.sortContain = arg_4_0.sortPanel:Find("adapt/mask/panel")
	arg_4_0.sortTpl = arg_4_0.sortContain:Find("tpl")

	setActive(arg_4_0.sortTpl, false)

	arg_4_0.equipSkinFilteBtn = arg_4_0.topPanel:Find("buttons/EquipSkinFilteBtn")
	arg_4_0.nameSearchInput = arg_4_0.topPanel:Find("buttons/serachPanel/search")
	arg_4_0.nameSearchText = arg_4_0.nameSearchInput:Find("holder")

	setInputText(arg_4_0.nameSearchInput, "")
	onInputChanged(arg_4_0, arg_4_0.nameSearchInput, function()
		arg_4_0:filterEquipment()
	end)

	arg_4_0.itemView = arg_4_0._tf:Find("adapt/item_scrollview")

	local var_4_1
	local var_4_2 = getProxy(SettingsProxy)

	if NotchAdapt.CheckNotchRatio == 2 or not var_4_2:CheckLargeScreen() then
		var_4_1 = arg_4_0.itemView.rect.width > 2000
	else
		var_4_1 = NotchAdapt.CheckNotchRatio >= 2
	end

	arg_4_0.equipmentView:Find("equipment_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = var_4_1 and 8 or 7
	arg_4_0.itemView:Find("item_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = var_4_1 and 8 or 7
	arg_4_0.decBtn = findTF(arg_4_0.topPanel, "buttons/dec_btn")
	arg_4_0.sortImgAsc = findTF(arg_4_0.decBtn, "asc")
	arg_4_0.sortImgDec = findTF(arg_4_0.decBtn, "desc")
	arg_4_0.equipmentToggle = arg_4_0._tf:Find("blur_panel/adapt/left_length/frame/toggle_root")

	setActive(arg_4_0.equipmentToggle, false)

	arg_4_0.filterBusyToggle = arg_4_0._tf:Find("blur_panel/adapt/left_length/frame/toggle_equip")

	setActive(arg_4_0.filterBusyToggle, false)

	arg_4_0.designTabRoot = arg_4_0._tf:Find("blur_panel/adapt/left_length/frame/toggle_design")

	setActive(arg_4_0.designTabRoot, false)

	arg_4_0.designTabs = CustomIndexLayer.Clone2Full(arg_4_0.designTabRoot, 2)
	arg_4_0.bottomBack = arg_4_0.topItems:Find("adapt/bottom_back")
	arg_4_0.bottomPanel = arg_4_0.bottomBack:Find("types")
	arg_4_0.materialToggle = arg_4_0.bottomPanel:Find("material")
	arg_4_0.weaponToggle = arg_4_0.bottomPanel:Find("weapon")
	arg_4_0.designToggle = arg_4_0.bottomPanel:Find("design")
	arg_4_0.capacityTF = arg_4_0.bottomBack:Find("bottom_left/tip/capcity/Text")
	arg_4_0.tipTF = arg_4_0.bottomBack:Find("bottom_left/tip")
	arg_4_0.tip = arg_4_0.tipTF:Find("label")
	arg_4_0.helpBtn = arg_4_0.topItems:Find("adapt/help_btn")

	setActive(arg_4_0.helpBtn, true)

	arg_4_0.backBtn = arg_4_0._tf:Find("blur_panel/adapt/top/back_btn")
	arg_4_0.selectedMin = defaultValue(var_4_0.selectedMin, 1)
	arg_4_0.selectedMax = defaultValue(var_4_0.selectedMax, pg.gameset.equip_select_limit.key_value or 0)
	arg_4_0.selectedIds = Clone(var_4_0.selectedIds or {})
	arg_4_0.checkEquipment = var_4_0.onEquipment or function(arg_6_0, arg_6_1, arg_6_2)
		return true
	end
	arg_4_0.onSelected = var_4_0.onSelected or function()
		warning("not implemented.")
	end
	arg_4_0.BatchDisposeBtn = arg_4_0.bottomPanel:Find("dispos")

	if not arg_4_0.BatchDisposeBtn then
		arg_4_0.BatchDisposeBtn = arg_4_0.bottomBack:Find("dispos")
	end

	arg_4_0.selectPanel = arg_4_0.topItems:Find("adapt/select_panel")

	setActive(arg_4_0.selectPanel, true)
	setAnchoredPosition(arg_4_0.selectPanel, {
		y = -124
	})

	arg_4_0.selectTransformPanel = arg_4_0.topItems:Find("adapt/select_transform_panel")

	setActive(arg_4_0.selectTransformPanel, false)

	arg_4_0.listEmptyTF = arg_4_0._tf:Find("adapt/empty")

	setActive(arg_4_0.listEmptyTF, false)

	arg_4_0.listEmptyTxt = arg_4_0.listEmptyTF:Find("Text")
	arg_4_0.destroyConfirmView = DestroyConfirmView.New(arg_4_0.topItems, arg_4_0.event)
	arg_4_0.assignedItemView = AssignedItemView.New(arg_4_0.topItems, arg_4_0.event)
	arg_4_0.blueprintAssignedItemView = BlueprintAssignedItemView.New(arg_4_0.topItems, arg_4_0.event)
	arg_4_0.equipDestroyConfirmWindow = EquipDestoryConfirmWindow.New(arg_4_0.topItems, arg_4_0.event)
	arg_4_0.isEquipingOn = false
	arg_4_0.msgBox = SelectSkinMsgbox.New(arg_4_0._tf, arg_4_0.event)
end

function var_0_0.setEquipment(arg_8_0, arg_8_1)
	local var_8_0 = #arg_8_0.equipmentVOs + 1

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.equipmentVOs) do
		if not iter_8_1.shipId and iter_8_1.id == arg_8_1.id then
			var_8_0 = iter_8_0

			break
		end
	end

	if arg_8_1.count > 0 then
		arg_8_0.equipmentVOs[var_8_0] = arg_8_1
		arg_8_0.equipmentVOByIds[arg_8_1.id] = arg_8_1
	else
		table.remove(arg_8_0.equipmentVOs, var_8_0)

		arg_8_0.equipmentVOByIds[arg_8_1.id] = nil
	end
end

function var_0_0.setEquipmentUpdate(arg_9_0)
	if arg_9_0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON then
		arg_9_0:filterEquipment()
		arg_9_0:updateCapacity()
	end
end

function var_0_0.addShipEquipment(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.equipmentVOs) do
		if EquipmentProxy.SameEquip(iter_10_1, arg_10_1) then
			arg_10_0.equipmentVOs[iter_10_0] = arg_10_1

			return
		end
	end

	table.insert(arg_10_0.equipmentVOs, arg_10_1)
end

function var_0_0.removeShipEquipment(arg_11_0, arg_11_1)
	for iter_11_0 = #arg_11_0.equipmentVOs, 1, -1 do
		local var_11_0 = arg_11_0.equipmentVOs[iter_11_0]

		if EquipmentProxy.SameEquip(var_11_0, arg_11_1) then
			table.remove(arg_11_0.equipmentVOs, iter_11_0)
		end
	end
end

function var_0_0.setEquipmentSkin(arg_12_0, arg_12_1)
	local var_12_0 = true

	for iter_12_0, iter_12_1 in pairs(arg_12_0.equipmentVOs) do
		if iter_12_1.id == arg_12_1.id and iter_12_1.isSkin then
			arg_12_0.equipmentVOs[iter_12_0] = {
				isSkin = true,
				id = arg_12_1.id,
				count = arg_12_1.count
			}
			var_12_0 = false
		end
	end

	if var_12_0 then
		table.insert(arg_12_0.equipmentVOs, {
			isSkin = true,
			id = arg_12_1.id,
			count = arg_12_1.count
		})
	end
end

function var_0_0.setEquipmentSkinUpdate(arg_13_0)
	if arg_13_0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON then
		arg_13_0:filterEquipment()
		arg_13_0:updateCapacity()
	end
end

function var_0_0.SetSpWeapons(arg_14_0, arg_14_1)
	arg_14_0.spweaponVOs = arg_14_1
end

function var_0_0.SetSpWeaponUpdate(arg_15_0)
	if arg_15_0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON and arg_15_0.page == var_0_4 then
		arg_15_0:filterEquipment()
		arg_15_0:UpdateSpweaponCapacity()
	elseif arg_15_0.contextData.warp == StoreHouseConst.WARP_TO_DESIGN and arg_15_0.contextData.designPage == var_0_6 then
		arg_15_0:UpdateSpweaponCapacity()
	end
end

function var_0_0.didEnter(arg_16_0)
	setText(arg_16_0.selectPanel:Find("tip"), i18n("equipment_select_device_destroy_tip"))
	setActive(arg_16_0.topItems:Find("adapt/stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())
	onButton(arg_16_0, arg_16_0.topItems:Find("adapt/stamp"), function()
		getProxy(TaskProxy):dealMingshiTouchFlag(2)
	end, SFX_CONFIRM)
	onButton(arg_16_0, arg_16_0.helpBtn, function()
		local var_18_0

		if arg_16_0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON then
			if arg_16_0.page == var_0_2 then
				var_18_0 = pg.gametip.help_equipment.tip
			elseif arg_16_0.page == var_0_3 then
				var_18_0 = pg.gametip.help_equipment_skin.tip
			elseif arg_16_0.page == var_0_4 then
				var_18_0 = pg.gametip.spweapon_help_storage.tip
			end
		elseif arg_16_0.contextData.warp == StoreHouseConst.WARP_TO_DESIGN then
			if arg_16_0.contextData.designPage == var_0_5 then
				var_18_0 = pg.gametip.help_equipment.tip
			elseif arg_16_0.contextData.designPage == var_0_6 then
				var_18_0 = pg.gametip.spweapon_help_storage.tip
			end
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = var_18_0
		})
	end, SFX_PANEL)
	onToggle(arg_16_0, arg_16_0.equipmentToggle:Find("equipment"), function(arg_19_0)
		if arg_19_0 then
			arg_16_0.page = var_0_2

			arg_16_0:SwitchEquipmentType(var_0_2)
			arg_16_0:UpdateWeaponWrapButtons()
			arg_16_0:filterEquipment()
		end
	end, SFX_PANEL)
	onToggle(arg_16_0, arg_16_0.equipmentToggle:Find("skin"), function(arg_20_0)
		if arg_20_0 then
			arg_16_0.page = var_0_3

			arg_16_0:SwitchEquipmentType(var_0_3)
			arg_16_0:UpdateWeaponWrapButtons()
			arg_16_0:filterEquipment()
		end
	end, SFX_PANEL)
	onToggle(arg_16_0, arg_16_0.equipmentToggle:Find("spweapon"), function(arg_21_0)
		if arg_21_0 then
			arg_16_0.page = var_0_4

			arg_16_0:SwitchEquipmentType(var_0_4)
			arg_16_0:UpdateWeaponWrapButtons()
			arg_16_0:filterEquipment()
		end
	end, SFX_PANEL)
	setActive(arg_16_0.equipmentToggle:Find("spweapon"), not LOCK_SP_WEAPON)
	onToggle(arg_16_0, arg_16_0.designTabs[var_0_5], function(arg_22_0)
		if arg_22_0 then
			arg_16_0.contextData.designPage = var_0_5

			arg_16_0:emit(EquipmentMediator.OPEN_DESIGN)
			arg_16_0:updateCapacity()
			setActive(arg_16_0.tip, false)
			setActive(arg_16_0.listEmptyTF, false)
		else
			arg_16_0:emit(EquipmentMediator.CLOSE_DESIGN_LAYER)
		end
	end, SFX_PANEL)
	onToggle(arg_16_0, arg_16_0.designTabs[var_0_6], function(arg_23_0)
		if arg_23_0 then
			arg_16_0.contextData.designPage = var_0_6

			arg_16_0:emit(EquipmentMediator.OPEN_SPWEAPON_DESIGN)
			arg_16_0:UpdateSpweaponCapacity()
			setActive(arg_16_0.tip, false)
			setActive(arg_16_0.listEmptyTF, false)
		else
			arg_16_0:emit(EquipmentMediator.CLOSE_SPWEAPON_DESIGN_LAYER)
		end
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.backBtn, function()
		if arg_16_0.mode == StoreHouseConst.DESTROY then
			triggerButton(arg_16_0.BatchDisposeBtn)

			return
		end

		GetOrAddComponent(arg_16_0._tf, typeof(CanvasGroup)).interactable = false

		arg_16_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onToggle(arg_16_0, arg_16_0.sortBtn, function(arg_25_0)
		if arg_25_0 then
			arg_16_0:OverlayPanel(arg_16_0.sortPanel)
			setActive(arg_16_0.sortPanel, true)
			onNextTick(function()
				arg_16_0.sortPanelTG.allowSwitchOff = false
			end)
		else
			arg_16_0:UnOverlayPanel(arg_16_0.sortPanel, arg_16_0.topItems)
			setActive(arg_16_0.sortPanel, false)

			arg_16_0.sortPanelTG.allowSwitchOff = true
		end
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.sortPanel, function()
		triggerToggle(arg_16_0.sortBtn, false)
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.indexBtn, function()
		local var_28_0 = switch(arg_16_0.page, {
			[var_0_2] = function()
				return setmetatable({
					indexDatas = Clone(arg_16_0.contextData.indexDatas),
					callback = function(arg_30_0)
						arg_16_0.contextData.indexDatas.typeIndex = arg_30_0.typeIndex
						arg_16_0.contextData.indexDatas.equipPropertyIndex = arg_30_0.equipPropertyIndex
						arg_16_0.contextData.indexDatas.equipPropertyIndex2 = arg_30_0.equipPropertyIndex2
						arg_16_0.contextData.indexDatas.equipAmmoIndex1 = arg_30_0.equipAmmoIndex1
						arg_16_0.contextData.indexDatas.equipAmmoIndex2 = arg_30_0.equipAmmoIndex2
						arg_16_0.contextData.indexDatas.equipCampIndex = arg_30_0.equipCampIndex
						arg_16_0.contextData.indexDatas.rarityIndex = arg_30_0.rarityIndex
						arg_16_0.contextData.indexDatas.extraIndex = arg_30_0.extraIndex

						if arg_16_0.filterBusyToggle:GetComponent(typeof(Toggle)) then
							if bit.band(arg_30_0.extraIndex, IndexConst.EquipmentExtraEquiping) > 0 then
								arg_16_0:SetShowBusyFlag(true)
							end

							triggerToggle(arg_16_0.filterBusyToggle, arg_16_0:GetShowBusyFlag())
						else
							arg_16_0:filterEquipment()
						end
					end
				}, {
					__index = StoreHouseConst.EQUIPMENT_INDEX_COMMON
				})
			end,
			[var_0_4] = function()
				return setmetatable({
					indexDatas = Clone(arg_16_0.contextData.spweaponIndexDatas),
					callback = function(arg_32_0)
						arg_16_0.contextData.spweaponIndexDatas.typeIndex = arg_32_0.typeIndex
						arg_16_0.contextData.spweaponIndexDatas.rarityIndex = arg_32_0.rarityIndex

						arg_16_0:filterEquipment()
					end
				}, {
					__index = StoreHouseConst.SPWEAPON_INDEX_COMMON
				})
			end
		})

		arg_16_0:emit(EquipmentMediator.OPEN_EQUIPMENT_INDEX, var_28_0)
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.equipSkinFilteBtn, function()
		local var_33_0 = {
			display = {
				equipSkinIndex = IndexConst.FlagRange2Bits(IndexConst.EquipSkinIndexAll, IndexConst.EquipSkinIndexAux),
				equipSkinTheme = IndexConst.FlagRange2Str(IndexConst.EquipSkinThemeAll, IndexConst.EquipSkinThemeEnd)
			},
			equipSkinSort = arg_16_0.equipSkinSort or IndexConst.EquipSkinSortType,
			equipSkinIndex = arg_16_0.equipSkinIndex or IndexConst.Flags2Bits({
				IndexConst.EquipSkinIndexAll
			}),
			equipSkinTheme = arg_16_0.equipSkinTheme or IndexConst.Flags2Str({
				IndexConst.EquipSkinThemeAll
			}),
			callback = function(arg_34_0)
				arg_16_0.equipSkinSort = arg_34_0.equipSkinSort
				arg_16_0.equipSkinIndex = arg_34_0.equipSkinIndex
				arg_16_0.equipSkinTheme = arg_34_0.equipSkinTheme

				arg_16_0:filterEquipment()
			end
		}

		arg_16_0:emit(EquipmentMediator.OPEN_EQUIPSKIN_INDEX_LAYER, var_33_0)
	end, SFX_PANEL)

	arg_16_0.equipmetItems = {}
	arg_16_0.itemCards = {}

	arg_16_0:initItems()
	arg_16_0:initEquipments()

	arg_16_0.asc = arg_16_0.contextData.asc or false
	arg_16_0.contextData.sortData = arg_16_0.contextData.sortData or var_0_7.sort[1]
	arg_16_0.contextData.indexDatas = arg_16_0.contextData.indexDatas or {}
	arg_16_0.contextData.spweaponIndexDatas = arg_16_0.contextData.spweaponIndexDatas or {}
	arg_16_0.contextData.spweaponSortData = arg_16_0.contextData.spweaponSortData or var_0_8.sort[1]

	arg_16_0:initSort()
	setActive(arg_16_0.itemView, false)
	setActive(arg_16_0.equipmentView, false)
	onToggle(arg_16_0, arg_16_0.materialToggle, function(arg_35_0)
		arg_16_0.inMaterial = arg_35_0

		if arg_35_0 and arg_16_0.contextData.warp ~= StoreHouseConst.WARP_TO_MATERIAL then
			arg_16_0.contextData.warp = StoreHouseConst.WARP_TO_MATERIAL

			setText(arg_16_0.tip, i18n("equipment_select_materials_tip"))
			setActive(arg_16_0.capacityTF.parent, false)
			setActive(arg_16_0.tip, true)
			arg_16_0:sortItems()
		end

		setActive(arg_16_0.helpBtn, not arg_35_0)
	end, SFX_PANEL)
	onToggle(arg_16_0, arg_16_0.weaponToggle, function(arg_36_0)
		if arg_36_0 then
			if arg_16_0.contextData.warp ~= StoreHouseConst.WARP_TO_WEAPON then
				arg_16_0.contextData.warp = StoreHouseConst.WARP_TO_WEAPON

				setActive(arg_16_0.tip, false)
				setActive(arg_16_0.capacityTF.parent, true)

				if arg_16_0.page == var_0_3 then
					triggerToggle(arg_16_0.equipmentToggle:Find("skin"), true)
				elseif arg_16_0.page == var_0_4 then
					triggerToggle(arg_16_0.equipmentToggle:Find("spweapon"), true)
				else
					triggerToggle(arg_16_0.equipmentToggle:Find("equipment"), true)
				end
			end
		else
			setActive(arg_16_0.BatchDisposeBtn, false)
			setActive(arg_16_0.filterBusyToggle, false)
			setActive(arg_16_0.equipmentToggle, false)
		end
	end, SFX_PANEL)
	onToggle(arg_16_0, arg_16_0.designToggle, function(arg_37_0)
		if arg_37_0 then
			arg_16_0.contextData.warp = StoreHouseConst.WARP_TO_DESIGN

			local var_37_0 = arg_16_0.contextData.designPage or var_0_5

			triggerToggle(arg_16_0.designTabs[var_37_0], true)
			setActive(arg_16_0.capacityTF.parent, true)
		else
			arg_16_0:emit(EquipmentMediator.CLOSE_DESIGN_LAYER)
			arg_16_0:emit(EquipmentMediator.CLOSE_SPWEAPON_DESIGN_LAYER)
		end

		setActive(arg_16_0.designTabRoot, arg_37_0 and not LOCK_SP_WEAPON)
	end, SFX_PANEL)
	onToggle(arg_16_0, arg_16_0.filterBusyToggle, function(arg_38_0)
		arg_16_0:SetShowBusyFlag(arg_38_0)
		arg_16_0:filterEquipment()
	end, SFX_PANEL)

	arg_16_0.filterEquipWaitting = arg_16_0.filterEquipWaitting + 1

	triggerToggle(arg_16_0.filterBusyToggle, arg_16_0.shipVO)
	onButton(arg_16_0, arg_16_0.BatchDisposeBtn, function()
		if arg_16_0.mode == StoreHouseConst.DESTROY then
			arg_16_0.mode = StoreHouseConst.OVERVIEW
			arg_16_0.asc = arg_16_0.lastasc
			arg_16_0.lastasc = nil
			arg_16_0.filterImportance = nil

			shiftPanel(arg_16_0.bottomBack, nil, 0, nil, 0, true, true)
			shiftPanel(arg_16_0.selectPanel, nil, -124, nil, 0, true, true)
			arg_16_0:filterEquipment()
		else
			arg_16_0.mode = StoreHouseConst.DESTROY
			arg_16_0.lastasc = arg_16_0.asc
			arg_16_0.filterImportance = true
			arg_16_0.asc = true

			shiftPanel(arg_16_0.bottomBack, nil, -124, nil, 0, true, true)
			shiftPanel(arg_16_0.selectPanel, nil, 0, nil, 0, true, true)

			arg_16_0.contextData.asc = arg_16_0.asc
			arg_16_0.contextData.sortData = var_0_7.sort[1]

			arg_16_0:filterEquipment()
		end

		arg_16_0:UpdateWeaponWrapButtons()
	end, SFX_PANEL)
	onButton(arg_16_0, findTF(arg_16_0.selectPanel, "cancel_button"), function()
		arg_16_0:unselecteAllEquips()
		triggerButton(arg_16_0.BatchDisposeBtn)
	end, SFX_CANCEL)
	onButton(arg_16_0, findTF(arg_16_0.selectPanel, "confirm_button"), function()
		local var_41_0 = {}

		if underscore.any(arg_16_0.selectedIds, function(arg_42_0)
			local var_42_0 = arg_16_0.equipmentVOByIds[arg_42_0[1]]

			return var_42_0:getConfig("rarity") >= 4 or var_42_0:getConfig("level") > 1
		end) then
			table.insert(var_41_0, function(arg_43_0)
				arg_16_0.equipDestroyConfirmWindow:Load()
				arg_16_0.equipDestroyConfirmWindow:ActionInvoke("Show", underscore.map(arg_16_0.selectedIds, function(arg_44_0)
					return setmetatable({
						count = arg_44_0[2]
					}, {
						__index = arg_16_0.equipmentVOByIds[arg_44_0[1]]
					})
				end), arg_43_0)
			end)
		end

		seriesAsync(var_41_0, function()
			arg_16_0.destroyConfirmView:Load()
			arg_16_0.destroyConfirmView:ActionInvoke("Show")
			arg_16_0.destroyConfirmView:ActionInvoke("DisplayDestroyBonus", arg_16_0.selectedIds)
			arg_16_0.destroyConfirmView:ActionInvoke("SetConfirmBtnCB", function()
				arg_16_0:unselecteAllEquips()
			end)
		end)
	end, SFX_CONFIRM)
	arg_16_0:OverlayPanel(arg_16_0.blurPanel)
	arg_16_0:PlayUIAnimation(arg_16_0.blurPanel, "enter")
	arg_16_0:OverlayPanel(arg_16_0.topItems)

	local var_16_0 = arg_16_0.contextData.warp or StoreHouseConst.WARP_TO_MATERIAL
	local var_16_1 = arg_16_0.contextData.mode or StoreHouseConst.OVERVIEW

	arg_16_0.contextData.warp = nil
	arg_16_0.contextData.mode = nil
	arg_16_0.mode = arg_16_0.mode or StoreHouseConst.OVERVIEW

	if var_16_0 == StoreHouseConst.WARP_TO_DESIGN then
		triggerToggle(arg_16_0.designToggle, true)
	elseif var_16_0 == StoreHouseConst.WARP_TO_MATERIAL then
		triggerToggle(arg_16_0.materialToggle, true)
	elseif var_16_0 == StoreHouseConst.WARP_TO_WEAPON then
		if var_16_1 == StoreHouseConst.DESTROY then
			arg_16_0.filterEquipWaitting = arg_16_0.filterEquipWaitting + 1

			triggerToggle(arg_16_0.weaponToggle, true)
			triggerButton(arg_16_0.BatchDisposeBtn)
		else
			if var_16_1 == StoreHouseConst.SKIN then
				arg_16_0.page = var_0_3
			elseif var_16_1 == StoreHouseConst.SPWEAPON then
				arg_16_0.page = var_0_4
			else
				arg_16_0.page = var_0_2
			end

			triggerToggle(arg_16_0.weaponToggle, true)
		end
	end

	arg_16_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_16_0, arg_16_0.topItems)
end

function var_0_0.isDefaultStatus(arg_47_0)
	return underscore(arg_47_0.contextData.indexDatas):chain():keys():all(function(arg_48_0)
		return arg_47_0.contextData.indexDatas[arg_48_0] == StoreHouseConst.EQUIPMENT_INDEX_COMMON.customPanels[arg_48_0].options[1]
	end):value()
end

function var_0_0.isDefaultSpWeaponIndexData(arg_49_0)
	return underscore(arg_49_0.contextData.spweaponIndexDatas):chain():keys():all(function(arg_50_0)
		return arg_49_0.contextData.spweaponIndexDatas[arg_50_0] == StoreHouseConst.SPWEAPON_INDEX_COMMON.customPanels[arg_50_0].options[1]
	end):value()
end

function var_0_0.onBackPressed(arg_51_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if isActive(arg_51_0.sortPanel) then
		triggerButton(arg_51_0.sortPanel)
	elseif arg_51_0.destroyConfirmView:isShowing() then
		arg_51_0.destroyConfirmView:Hide()
	elseif arg_51_0.assignedItemView:isShowing() then
		arg_51_0.assignedItemView:Hide()
	elseif arg_51_0.blueprintAssignedItemView:isShowing() then
		arg_51_0.blueprintAssignedItemView:Hide()
	elseif arg_51_0.equipDestroyConfirmWindow:isShowing() then
		arg_51_0.equipDestroyConfirmWindow:Hide()
	else
		triggerButton(arg_51_0.backBtn)
	end
end

function var_0_0.updateCapacity(arg_52_0)
	if arg_52_0.contextData.warp == StoreHouseConst.WARP_TO_MATERIAL then
		return
	end

	setText(arg_52_0.tip, "")
	setText(arg_52_0.capacityTF, arg_52_0.capacity .. "/" .. arg_52_0.player:getMaxEquipmentBag())
end

function var_0_0.setCapacity(arg_53_0, arg_53_1)
	arg_53_0.capacity = arg_53_1
end

function var_0_0.UpdateSpweaponCapacity(arg_54_0)
	local var_54_0 = getProxy(EquipmentProxy)

	setText(arg_54_0.capacityTF, var_54_0:GetSpWeaponCount() .. "/" .. var_54_0:GetSpWeaponCapacity())
end

function var_0_0.setShip(arg_55_0, arg_55_1)
	arg_55_0.shipVO = arg_55_1

	setActive(arg_55_0.bottomPanel, not tobool(arg_55_1))
end

function var_0_0.setPlayer(arg_56_0, arg_56_1)
	arg_56_0.player = arg_56_1

	if arg_56_0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON and arg_56_0.page == var_0_2 then
		arg_56_0:updateCapacity()
	elseif arg_56_0.contextData.warp == StoreHouseConst.WARP_TO_DESIGN and arg_56_0.contextData.designPage == var_0_5 then
		arg_56_0:updateCapacity()
	end
end

function var_0_0.initSort(arg_57_0)
	onButton(arg_57_0, arg_57_0.decBtn, function()
		arg_57_0.asc = not arg_57_0.asc
		arg_57_0.contextData.asc = arg_57_0.asc

		arg_57_0:filterEquipment()
	end)

	arg_57_0.sortButtons = {}

	eachChild(arg_57_0.sortContain, function(arg_59_0)
		setActive(arg_59_0, false)
	end)

	for iter_57_0, iter_57_1 in ipairs(var_0_7.sort) do
		local var_57_0 = iter_57_0 <= arg_57_0.sortContain.childCount and arg_57_0.sortContain:GetChild(iter_57_0 - 1) or cloneTplTo(arg_57_0.sortTpl, arg_57_0.sortContain)

		setActive(var_57_0, true)
		setImageSprite(findTF(var_57_0, "Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", iter_57_1.spr), true)
		onToggle(arg_57_0, var_57_0, function(arg_60_0)
			if arg_60_0 then
				if arg_57_0.page == var_0_2 then
					arg_57_0.contextData.sortData = iter_57_1
				elseif arg_57_0.page == var_0_4 then
					arg_57_0.contextData.spweaponSortData = var_0_8.sort[iter_57_0]
				end

				arg_57_0:filterEquipment()
				triggerToggle(arg_57_0.sortBtn, false)
			end
		end, SFX_PANEL)

		arg_57_0.sortButtons[iter_57_0] = var_57_0
	end
end

function var_0_0.UpdateWeaponWrapButtons(arg_61_0)
	local var_61_0 = arg_61_0.page

	setActive(arg_61_0.indexBtn, var_61_0 == var_0_2 or var_61_0 == var_0_4)
	setActive(arg_61_0.sortBtn, var_61_0 == var_0_2 or var_61_0 == var_0_4)
	setActive(arg_61_0.BatchDisposeBtn, var_61_0 == var_0_2)
	setActive(arg_61_0.capacityTF.parent, var_61_0 == var_0_2 or var_61_0 == var_0_4)
	setActive(arg_61_0.equipSkinFilteBtn, var_61_0 == var_0_3)
	setActive(arg_61_0.filterBusyToggle, arg_61_0.mode == StoreHouseConst.OVERVIEW)
	setActive(arg_61_0.equipmentToggle, arg_61_0.mode == StoreHouseConst.OVERVIEW and not arg_61_0.contextData.shipId)
	arg_61_0:updatePageFilterButtons(var_61_0)
end

function var_0_0.updatePageFilterButtons(arg_62_0, arg_62_1)
	for iter_62_0, iter_62_1 in ipairs(var_0_7.sort) do
		triggerToggle(arg_62_0.sortButtons[iter_62_0], false)
		setActive(arg_62_0.sortButtons[iter_62_0], table.contains(iter_62_1.pages, arg_62_1))
	end
end

function var_0_0.initEquipments(arg_63_0)
	arg_63_0.isInitWeapons = true
	arg_63_0.equipmentRect = arg_63_0.equipmentView:GetComponent("LScrollRect")

	function arg_63_0.equipmentRect.onInitItem(arg_64_0)
		arg_63_0:initEquipment(arg_64_0)
	end

	function arg_63_0.equipmentRect.onUpdateItem(arg_65_0, arg_65_1)
		arg_63_0:updateEquipment(arg_65_0, arg_65_1)
	end

	function arg_63_0.equipmentRect.onReturnItem(arg_66_0, arg_66_1)
		arg_63_0:returnEquipment(arg_66_0, arg_66_1)
	end

	function arg_63_0.equipmentRect.onStart()
		arg_63_0:updateSelected()
	end

	arg_63_0.equipmentRect.decelerationRate = 0.07
end

function var_0_0.initEquipment(arg_68_0, arg_68_1)
	local var_68_0 = EquipmentItem.New(arg_68_1)

	onButton(arg_68_0, var_68_0.unloadBtn, function()
		if arg_68_0.page == var_0_3 then
			arg_68_0:emit(EquipmentMediator.ON_UNEQUIP_EQUIPMENT_SKIN)
		elseif arg_68_0.page == var_0_2 then
			arg_68_0:emit(EquipmentMediator.ON_UNEQUIP_EQUIPMENT)
		end
	end, SFX_PANEL)
	onButton(arg_68_0, var_68_0.reduceBtn, function()
		arg_68_0:selectEquip(var_68_0.equipmentVO, 1)
	end, SFX_PANEL)

	arg_68_0.equipmetItems[arg_68_1] = var_68_0
end

function var_0_0.updateEquipment(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = arg_71_0.equipmetItems[arg_71_2]

	assert(var_71_0, "without init item")

	local var_71_1 = arg_71_0.loadEquipmentVOs[arg_71_1 + 1]

	var_71_0:update(var_71_1)

	local var_71_2 = false
	local var_71_3 = 0

	if var_71_1 then
		for iter_71_0, iter_71_1 in ipairs(arg_71_0.selectedIds) do
			if var_71_1.id == iter_71_1[1] then
				var_71_2 = true
				var_71_3 = iter_71_1[2]

				break
			end
		end
	end

	var_71_0:updateSelected(var_71_2, var_71_3)

	if not var_71_1 then
		removeOnButton(var_71_0.go)
	elseif isa(var_71_1, SpWeapon) then
		onButton(arg_71_0, var_71_0.go, function()
			local var_72_0 = arg_71_0.shipVO and {
				type = EquipmentInfoMediator.TYPE_REPLACE,
				shipId = arg_71_0.contextData.shipId,
				oldSpWeaponUid = var_71_1:GetUID(),
				oldShipId = var_71_1:GetShipId()
			} or var_71_1:GetShipId() and {
				type = EquipmentInfoMediator.TYPE_DISPLAY,
				spWeaponUid = var_71_1:GetUID(),
				shipId = var_71_1:GetShipId()
			} or {
				type = EquipmentInfoMediator.TYPE_DEFAULT,
				spWeaponUid = var_71_1:GetUID()
			}

			arg_71_0:emit(var_0_0.ON_SPWEAPON, var_72_0)
		end, SFX_PANEL)
	elseif var_71_0.equipmentVO.isSkin then
		if var_71_1.shipId then
			onButton(arg_71_0, var_71_0.go, function()
				local var_73_0 = var_71_1.shipId
				local var_73_1 = var_71_1.shipPos

				assert(var_73_1, "equipment skin pos is nil")
				arg_71_0:emit(EquipmentMediator.ON_EQUIPMENT_SKIN_INFO, var_71_1.id, arg_71_0.contextData.pos, {
					id = var_73_0,
					pos = var_73_1
				})
			end, SFX_PANEL)
		else
			onButton(arg_71_0, var_71_0.go, function()
				arg_71_0:emit(EquipmentMediator.ON_EQUIPMENT_SKIN_INFO, var_71_1.id, arg_71_0.contextData.pos)
			end, SFX_PANEL)
		end
	elseif var_71_1.mask then
		removeOnButton(var_71_0.go)
	elseif arg_71_0.mode == StoreHouseConst.DESTROY then
		onButton(arg_71_0, var_71_0.go, function()
			arg_71_0:selectEquip(var_71_1, var_71_1.count)
		end, SFX_PANEL)
	else
		onButton(arg_71_0, var_71_0.go, function()
			local var_76_0 = arg_71_0.shipVO and {
				type = EquipmentInfoMediator.TYPE_REPLACE,
				equipmentId = var_71_1.id,
				shipId = arg_71_0.contextData.shipId,
				pos = arg_71_0.contextData.pos,
				oldShipId = var_71_1.shipId,
				oldPos = var_71_1.shipPos
			} or var_71_1.shipId and {
				showTransformTip = true,
				type = EquipmentInfoMediator.TYPE_DISPLAY,
				equipmentId = var_71_1.id,
				shipId = var_71_1.shipId,
				pos = var_71_1.shipPos
			} or {
				destroy = true,
				type = EquipmentInfoMediator.TYPE_DEFAULT,
				equipmentId = var_71_1.id
			}

			arg_71_0:emit(var_0_0.ON_EQUIPMENT, var_76_0)
		end, SFX_PANEL)
	end
end

function var_0_0.returnEquipment(arg_77_0, arg_77_1, arg_77_2)
	if arg_77_0.exited then
		return
	end

	local var_77_0 = arg_77_0.equipmetItems[arg_77_2]

	if var_77_0 then
		removeOnButton(var_77_0.go)
		var_77_0:clear()
	end
end

function var_0_0.updateEquipmentCount(arg_78_0, arg_78_1)
	arg_78_0.equipmentRect:SetTotalCount(arg_78_1 or #arg_78_0.loadEquipmentVOs, -1)
	setActive(arg_78_0.listEmptyTF, (arg_78_1 or #arg_78_0.loadEquipmentVOs) <= 0)
	setText(arg_78_0.listEmptyTxt, i18n("list_empty_tip_storehouseui_equip"))
	Canvas.ForceUpdateCanvases()
end

function var_0_0.filterEquipment(arg_79_0)
	if arg_79_0.filterEquipWaitting > 0 then
		arg_79_0.filterEquipWaitting = arg_79_0.filterEquipWaitting - 1

		return
	end

	if arg_79_0.page == var_0_3 then
		arg_79_0:filterEquipSkin()

		return
	elseif arg_79_0.page == var_0_4 then
		arg_79_0:filterSpWeapon()

		return
	end

	local var_79_0 = arg_79_0:isDefaultStatus() and "shaixuan_off" or "shaixuan_on"

	GetSpriteFromAtlasAsync("ui/share/index_atlas", var_79_0, function(arg_80_0)
		setImageSprite(arg_79_0.indexBtn, arg_80_0, true)
	end)

	local var_79_1 = {}

	arg_79_0.loadEquipmentVOs = {}

	for iter_79_0, iter_79_1 in pairs(arg_79_0.equipmentVOs) do
		if not iter_79_1.isSkin then
			table.insert(var_79_1, iter_79_1)
		end
	end

	local var_79_2 = {
		arg_79_0.contextData.indexDatas.equipPropertyIndex,
		arg_79_0.contextData.indexDatas.equipPropertyIndex2
	}

	for iter_79_2, iter_79_3 in pairs(var_79_1) do
		if (iter_79_3.count > 0 or iter_79_3.shipId) and arg_79_0:checkFitBusyCondition(iter_79_3) and IndexConst.filterEquipByType(iter_79_3, arg_79_0.contextData.indexDatas.typeIndex) and IndexConst.filterEquipByProperty(iter_79_3, var_79_2) and IndexConst.filterEquipAmmo1(iter_79_3, arg_79_0.contextData.indexDatas.equipAmmoIndex1) and IndexConst.filterEquipAmmo2(iter_79_3, arg_79_0.contextData.indexDatas.equipAmmoIndex2) and IndexConst.filterEquipByCamp(iter_79_3, arg_79_0.contextData.indexDatas.equipCampIndex) and IndexConst.filterEquipByRarity(iter_79_3, arg_79_0.contextData.indexDatas.rarityIndex) and IndexConst.filterEquipByExtra(iter_79_3, arg_79_0.contextData.indexDatas.extraIndex) then
			table.insert(arg_79_0.loadEquipmentVOs, iter_79_3)
		end
	end

	if arg_79_0.filterImportance ~= nil then
		for iter_79_4 = #arg_79_0.loadEquipmentVOs, 1, -1 do
			local var_79_3 = arg_79_0.loadEquipmentVOs[iter_79_4]

			if var_79_3.isSkin or not var_79_3.isSkin and var_79_3:isImportance() then
				table.remove(arg_79_0.loadEquipmentVOs, iter_79_4)
			end
		end
	end

	local var_79_4 = getInputText(arg_79_0.nameSearchInput)

	if var_79_4 and var_79_4 ~= "" then
		arg_79_0.loadEquipmentVOs = underscore.filter(arg_79_0.loadEquipmentVOs, function(arg_81_0)
			return arg_81_0:IsMatchKey(var_79_4)
		end)
	end

	local var_79_5 = arg_79_0.contextData.sortData

	if var_79_5 then
		local var_79_6 = arg_79_0.asc

		table.sort(arg_79_0.loadEquipmentVOs, CompareFuncs(var_0_7.sortFunc(var_79_5, var_79_6)))
	end

	if arg_79_0.contextData.qiutBtn then
		table.insert(arg_79_0.loadEquipmentVOs, 1, false)
	end

	arg_79_0:updateSelected()
	arg_79_0:updateEquipmentCount()
	setImageSprite(arg_79_0.sortBtn:Find("Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", var_79_5.spr), true)
	setActive(arg_79_0.sortImgAsc, arg_79_0.asc)
	setActive(arg_79_0.sortImgDec, not arg_79_0.asc)
	arg_79_0:updateCapacity()
end

function var_0_0.filterEquipSkin(arg_82_0)
	local var_82_0 = arg_82_0.equipSkinIndex
	local var_82_1 = arg_82_0.equipSkinTheme
	local var_82_2 = arg_82_0.page
	local var_82_3 = {}

	arg_82_0.loadEquipmentVOs = {}

	if var_82_2 ~= var_0_3 then
		assert(false, "不是外观分页")
	end

	local var_82_4 = getInputText(arg_82_0.nameSearchInput)

	for iter_82_0, iter_82_1 in pairs(arg_82_0.equipmentVOs) do
		if iter_82_1.isSkin and iter_82_1.count > 0 and (var_82_4 == "" or EquipmentTools.IsMatchEquipmentSkinKey(iter_82_1.id, var_82_4)) then
			table.insert(var_82_3, iter_82_1)
		end
	end

	for iter_82_2, iter_82_3 in pairs(var_82_3) do
		if IndexConst.filterEquipSkinByIndex(iter_82_3, var_82_0) and IndexConst.filterEquipSkinByTheme(iter_82_3, var_82_1) and arg_82_0:checkFitBusyCondition(iter_82_3) then
			table.insert(arg_82_0.loadEquipmentVOs, iter_82_3)
		end
	end

	if arg_82_0.filterImportance ~= nil then
		for iter_82_4 = #arg_82_0.loadEquipmentVOs, 1, -1 do
			local var_82_5 = arg_82_0.loadEquipmentVOs[iter_82_4]

			if var_82_5.isSkin or not var_82_5.isSkin and var_82_5:isImportance() then
				table.remove(arg_82_0.loadEquipmentVOs, iter_82_4)
			end
		end
	end

	local var_82_6 = arg_82_0.contextData.sortData

	if var_82_6 then
		local var_82_7 = arg_82_0.asc

		table.sort(arg_82_0.loadEquipmentVOs, CompareFuncs(var_0_7.sortFunc(var_82_6, var_82_7)))
	end

	if arg_82_0.contextData.qiutBtn then
		table.insert(arg_82_0.loadEquipmentVOs, 1, false)
	end

	arg_82_0:updateSelected()
	arg_82_0:updateEquipmentCount()
	setActive(arg_82_0.sortImgAsc, arg_82_0.asc)
	setActive(arg_82_0.sortImgDec, not arg_82_0.asc)
end

function var_0_0.filterSpWeapon(arg_83_0)
	if arg_83_0.page ~= var_0_4 then
		assert(false, "不是特殊兵装分页")
	end

	local var_83_0 = arg_83_0:isDefaultSpWeaponIndexData() and "shaixuan_off" or "shaixuan_on"

	GetSpriteFromAtlasAsync("ui/share/index_atlas", var_83_0, function(arg_84_0)
		setImageSprite(arg_83_0.indexBtn, arg_84_0, true)
	end)

	arg_83_0.loadEquipmentVOs = {}

	local var_83_1 = arg_83_0.contextData.spweaponIndexDatas.typeIndex
	local var_83_2 = arg_83_0.contextData.spweaponIndexDatas.rarityIndex

	for iter_83_0, iter_83_1 in pairs(arg_83_0.spweaponVOs) do
		if IndexConst.filterSpWeaponByType(iter_83_1, var_83_1) and IndexConst.filterSpWeaponByRarity(iter_83_1, var_83_2) and arg_83_0:checkFitBusyCondition(iter_83_1) and (arg_83_0.filterImportance == nil or iter_83_1:IsImportant()) then
			table.insert(arg_83_0.loadEquipmentVOs, iter_83_1)
		end
	end

	local var_83_3 = getInputText(arg_83_0.nameSearchInput)

	if var_83_3 and var_83_3 ~= "" then
		local var_83_4 = EquipmentTools.GetMatchSpEquipmentListKeyByShip(var_83_3)

		arg_83_0.loadEquipmentVOs = underscore.filter(arg_83_0.loadEquipmentVOs, function(arg_85_0)
			return arg_85_0:IsMatchKey(var_83_3) or table.contains(var_83_4, arg_85_0.id)
		end)
	end

	local var_83_5 = arg_83_0.contextData.spweaponSortData

	if var_83_5 then
		local var_83_6 = arg_83_0.asc

		table.sort(arg_83_0.loadEquipmentVOs, CompareFuncs(var_0_8.sortFunc(var_83_5, var_83_6)))
	end

	if arg_83_0.contextData.qiutBtn then
		table.insert(arg_83_0.loadEquipmentVOs, 1, false)
	end

	arg_83_0:updateSelected()
	arg_83_0:updateEquipmentCount()
	setImageSprite(arg_83_0.sortBtn:Find("Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", var_83_5.spr), true)
	setActive(arg_83_0.sortImgAsc, arg_83_0.asc)
	setActive(arg_83_0.sortImgDec, not arg_83_0.asc)
	arg_83_0:UpdateSpweaponCapacity()
end

function var_0_0.GetShowBusyFlag(arg_86_0)
	return arg_86_0.isEquipingOn
end

function var_0_0.SetShowBusyFlag(arg_87_0, arg_87_1)
	arg_87_0.isEquipingOn = arg_87_1
end

function var_0_0.Scroll2Equip(arg_88_0, arg_88_1)
	if arg_88_0.contextData.warp ~= StoreHouseConst.WARP_TO_WEAPON or arg_88_0.page ~= var_0_2 then
		return
	end

	for iter_88_0, iter_88_1 in ipairs(arg_88_0.loadEquipmentVOs) do
		if EquipmentProxy.SameEquip(iter_88_1, arg_88_1) then
			local var_88_0 = arg_88_0.equipmentView:Find("equipment_grid"):GetComponent(typeof(GridLayoutGroup))
			local var_88_1 = (var_88_0.cellSize.y + var_88_0.spacing.y) * math.floor((iter_88_0 - 1) / var_88_0.constraintCount) + arg_88_0.equipmentRect.paddingFront + arg_88_0.equipmentView.rect.height * 0.5

			arg_88_0:ScrollEquipPos(var_88_1 - arg_88_0.equipmentRect.paddingFront)

			break
		end
	end
end

function var_0_0.ScrollEquipPos(arg_89_0, arg_89_1)
	local var_89_0 = arg_89_0.equipmentView:Find("equipment_grid"):GetComponent(typeof(GridLayoutGroup))
	local var_89_1 = (var_89_0.cellSize.y + var_89_0.spacing.y) * math.ceil(#arg_89_0.loadEquipmentVOs / var_89_0.constraintCount) - var_89_0.spacing.y + arg_89_0.equipmentRect.paddingFront + arg_89_0.equipmentRect.paddingEnd
	local var_89_2 = var_89_1 - arg_89_0.equipmentView.rect.height

	var_89_2 = var_89_2 > 0 and var_89_2 or var_89_1

	local var_89_3 = (arg_89_1 - arg_89_0.equipmentView.rect.height * 0.5) / var_89_2

	arg_89_0.equipmentRect:ScrollTo(var_89_3)
end

function var_0_0.checkFitBusyCondition(arg_90_0, arg_90_1)
	return not arg_90_1.shipId or arg_90_0:GetShowBusyFlag() and arg_90_0.mode ~= StoreHouseConst.DESTROY
end

function var_0_0.setItems(arg_91_0, arg_91_1)
	arg_91_0.itemVOs = arg_91_1

	if arg_91_0.isInitItems and arg_91_0.contextData.warp == StoreHouseConst.WARP_TO_MATERIAL then
		arg_91_0:sortItems()
	end
end

function var_0_0.initItems(arg_92_0)
	arg_92_0.isInitItems = true
	arg_92_0.itemRect = arg_92_0.itemView:GetComponent("LScrollRect")

	function arg_92_0.itemRect.onInitItem(arg_93_0)
		arg_92_0:initItem(arg_93_0)
	end

	function arg_92_0.itemRect.onUpdateItem(arg_94_0, arg_94_1)
		arg_92_0:updateItem(arg_94_0, arg_94_1)
	end

	function arg_92_0.itemRect.onReturnItem(arg_95_0, arg_95_1)
		arg_92_0:returnItem(arg_95_0, arg_95_1)
	end

	arg_92_0.itemRect.decelerationRate = 0.07
end

function var_0_0.sortItems(arg_96_0)
	table.sort(arg_96_0.itemVOs, CompareFuncs({
		function(arg_97_0)
			return -arg_97_0:getConfig("order")
		end,
		function(arg_98_0)
			return -arg_98_0:getConfig("rarity")
		end,
		function(arg_99_0)
			return arg_99_0.id
		end
	}))
	arg_96_0.itemRect:SetTotalCount(#arg_96_0.itemVOs, -1)
	setActive(arg_96_0.listEmptyTF, #arg_96_0.itemVOs <= 0)
	setText(arg_96_0.listEmptyTxt, i18n("list_empty_tip_storehouseui_item"))
	Canvas.ForceUpdateCanvases()
end

function var_0_0.initItem(arg_100_0, arg_100_1)
	arg_100_0.itemCards[arg_100_1] = ItemCard.New(arg_100_1)
end

function var_0_0.updateItem(arg_101_0, arg_101_1, arg_101_2)
	local var_101_0 = arg_101_0.itemCards[arg_101_2]

	assert(var_101_0, "without init item")

	local var_101_1 = arg_101_0.itemVOs[arg_101_1 + 1]

	var_101_0:update(var_101_1)

	if not var_101_1 then
		removeOnButton(var_101_0.go)
	elseif tobool(getProxy(TechnologyProxy):getItemCanUnlockBluePrint(var_101_1.id)) then
		local var_101_2 = getProxy(TechnologyProxy)
		local var_101_3 = underscore.map(var_101_2:getItemCanUnlockBluePrint(var_101_1.id), function(arg_102_0)
			return var_101_2:getBluePrintById(arg_102_0)
		end)
		local var_101_4 = underscore.detect(var_101_3, function(arg_103_0)
			return not arg_103_0:isUnlock()
		end)

		if var_101_4 then
			onButton(arg_101_0, var_101_0.go, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_BLUEPRINT_UNLOCK_ITEM,
					item = var_101_1,
					blueprints = var_101_3,
					onYes = function()
						arg_101_0:emit(EquipmentMediator.ITEM_GO_SCENE, SCENE.SHIPBLUEPRINT, {
							shipBluePrintVO = var_101_4
						})
					end,
					yesText = i18n("text_forward")
				})
			end, SFX_PANEL)
		else
			onButton(arg_101_0, var_101_0.go, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_BLUEPRINT_UNLOCK_ITEM,
					windowSize = Vector2(1010, 685),
					item = var_101_1,
					blueprints = var_101_3,
					onYes = function()
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							type = MSGBOX_TYPE_ITEM_BOX,
							content = i18n("techpackage_item_use_confirm"),
							items = underscore.map(var_101_1:getConfig("display_icon"), function(arg_108_0)
								return {
									type = arg_108_0[1],
									id = arg_108_0[2],
									count = arg_108_0[3]
								}
							end),
							onYes = function()
								arg_101_0:emit(EquipmentMediator.ON_USE_ITEM, var_101_1.id, 1)
							end
						})
					end
				})
			end, SFX_PANEL)
		end
	elseif var_101_1:getConfig("type") == Item.INVITATION_TYPE then
		onButton(arg_101_0, var_101_0.go, function()
			arg_101_0:emit(EquipmentMediator.ITEM_GO_SCENE, SCENE.INVITATION, {
				itemVO = var_101_1
			})
		end, SFX_PANEL)
	elseif var_101_1:getConfig("type") == Item.ASSIGNED_TYPE or var_101_1:getConfig("type") == Item.EQUIPMENT_ASSIGNED_TYPE then
		if underscore.any(pg.gameset.general_blueprint_list.description, function(arg_111_0)
			return var_101_1.id == arg_111_0
		end) then
			onButton(arg_101_0, var_101_0.go, function()
				arg_101_0.blueprintAssignedItemView:Load()
				arg_101_0.blueprintAssignedItemView:ActionInvoke("Show")
				arg_101_0.blueprintAssignedItemView:ActionInvoke("update", var_101_1)
			end, SFX_PANEL)
		else
			onButton(arg_101_0, var_101_0.go, function()
				arg_101_0.assignedItemView:Load()
				arg_101_0.assignedItemView:ActionInvoke("Show")
				arg_101_0.assignedItemView:ActionInvoke("update", var_101_1)
			end, SFX_PANEL)
		end
	elseif Item.IsLoveLetterCheckItem(var_101_1.id) then
		onButton(arg_101_0, var_101_0.go, function()
			arg_101_0:emit(var_0_0.ON_ITEM_EXTRA, var_101_1.id, var_101_1.extra)
		end, SFX_PANEL)
	elseif var_101_1:getConfig("type") == Item.LOVE_LETTER_TYPE then
		onButton(arg_101_0, var_101_0.go, function()
			arg_101_0:emit(var_0_0.ON_ITEM_EXTRA, var_101_1.id, var_101_1.extra)
		end, SFX_PANEL)
	elseif var_101_1:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
		onButton(arg_101_0, var_101_0.go, function()
			arg_101_0:emit(var_0_0.ON_ITEM, var_101_1.id, function()
				local var_117_0 = var_101_1:getConfig("usage_arg")

				if var_101_1:IsAllSkinOwner() then
					local var_117_1 = Drop.New({
						count = 1,
						type = DROP_TYPE_ITEM,
						id = var_117_0[5]
					})

					arg_101_0.msgBox:ExecuteAction("Show", {
						content = i18n("blackfriday_pack_select_skinall_dialog", var_101_1:getConfig("name"), var_117_1:getName()),
						leftDrop = {
							count = 1,
							type = DROP_TYPE_ITEM,
							id = var_101_1.id
						},
						rightDrop = var_117_1,
						onYes = function()
							arg_101_0:emit(EquipmentMediator.ON_USE_ITEM, var_101_1.id, 1, {
								0
							})
						end
					})
				else
					local var_117_2 = {}

					for iter_117_0, iter_117_1 in ipairs(var_117_0[2]) do
						var_117_2[iter_117_1] = true
					end

					arg_101_0:emit(EquipmentMediator.ITEM_ADD_LAYER, Context.New({
						viewComponent = NewSelectSkinLayer,
						mediator = NewSkinAtlasMediator,
						data = {
							mode = SelectSkinLayer.MODE_SELECT,
							itemId = var_101_1.id,
							selectableSkinList = underscore.map(var_101_1:GetValidSkinList(), function(arg_119_0)
								return SelectableSkin.New({
									id = arg_119_0,
									isTimeLimit = var_117_2[arg_119_0] or false
								})
							end),
							OnConfirm = function(arg_120_0)
								arg_101_0:emit(EquipmentMediator.ON_USE_ITEM, var_101_1.id, 1, {
									arg_120_0
								})
							end
						}
					}))
				end
			end)
		end, SFX_PANEL)
	else
		onButton(arg_101_0, var_101_0.go, function()
			arg_101_0:emit(var_0_0.ON_ITEM, var_101_1.id)
		end, SFX_PANEL)
	end
end

function var_0_0.returnItem(arg_122_0, arg_122_1, arg_122_2)
	if arg_122_0.exited then
		return
	end

	local var_122_0 = arg_122_0.itemCards[arg_122_2]

	if var_122_0 then
		removeOnButton(var_122_0.go)
		var_122_0:clear()
	end
end

function var_0_0.selectCount(arg_123_0)
	local var_123_0 = 0

	for iter_123_0, iter_123_1 in ipairs(arg_123_0.selectedIds) do
		var_123_0 = var_123_0 + iter_123_1[2]
	end

	return var_123_0
end

function var_0_0.selectEquip(arg_124_0, arg_124_1, arg_124_2)
	if not arg_124_0:checkDestroyGold(arg_124_1, arg_124_2) then
		return
	end

	if arg_124_0.mode == StoreHouseConst.DESTROY then
		local var_124_0 = false
		local var_124_1
		local var_124_2 = 0

		for iter_124_0, iter_124_1 in pairs(arg_124_0.selectedIds) do
			if iter_124_1[1] == arg_124_1.id then
				var_124_0 = true
				var_124_1 = iter_124_0
				var_124_2 = iter_124_1[2]

				break
			end
		end

		if not var_124_0 then
			local var_124_3, var_124_4 = arg_124_0.checkEquipment(arg_124_1, function()
				arg_124_0:selectEquip(arg_124_1, arg_124_2)
			end, arg_124_0.selectedIds)

			if not var_124_3 then
				if var_124_4 then
					pg.TipsMgr.GetInstance():ShowTips(var_124_4)
				end

				return
			end

			local var_124_5 = arg_124_0:selectCount()

			if arg_124_0.selectedMax > 0 and var_124_5 + arg_124_2 > arg_124_0.selectedMax then
				arg_124_2 = arg_124_0.selectedMax - var_124_5
			end

			if arg_124_0.selectedMax == 0 or var_124_5 < arg_124_0.selectedMax then
				table.insert(arg_124_0.selectedIds, {
					arg_124_1.id,
					arg_124_2
				})
			elseif arg_124_0.selectedMax == 1 then
				arg_124_0.selectedIds[1] = {
					arg_124_1.id,
					arg_124_2
				}
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_equipmentScene_selectError_more", arg_124_0.selectedMax))

				return
			end
		elseif var_124_2 - arg_124_2 > 0 then
			arg_124_0.selectedIds[var_124_1][2] = var_124_2 - arg_124_2
		else
			table.remove(arg_124_0.selectedIds, var_124_1)
		end
	end

	arg_124_0:updateSelected()
end

function var_0_0.unselecteAllEquips(arg_126_0)
	arg_126_0.selectedIds = {}

	arg_126_0:updateSelected()
end

function var_0_0.checkDestroyGold(arg_127_0, arg_127_1, arg_127_2)
	local var_127_0 = 0
	local var_127_1 = false

	for iter_127_0, iter_127_1 in pairs(arg_127_0.selectedIds) do
		local var_127_2 = iter_127_1[2]

		if Equipment.CanInBag(iter_127_1[1]) then
			var_127_0 = var_127_0 + (Equipment.getConfigData(iter_127_1[1]).destory_gold or 0) * var_127_2
		end

		if arg_127_1 and iter_127_1[1] == arg_127_1.configId then
			var_127_1 = true
		end
	end

	if not var_127_1 and arg_127_1 and arg_127_2 > 0 then
		var_127_0 = var_127_0 + (arg_127_1:getConfig("destory_gold") or 0) * arg_127_2
	end

	if arg_127_0.player:GoldMax(var_127_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_destroy"))

		return false
	end

	return true
end

function var_0_0.updateSelected(arg_128_0)
	for iter_128_0, iter_128_1 in pairs(arg_128_0.equipmetItems) do
		if iter_128_1.equipmentVO then
			local var_128_0 = false
			local var_128_1 = 0

			for iter_128_2, iter_128_3 in pairs(arg_128_0.selectedIds) do
				if iter_128_1.equipmentVO.id == iter_128_3[1] then
					var_128_0 = true
					var_128_1 = iter_128_3[2]

					break
				end
			end

			iter_128_1:updateSelected(var_128_0, var_128_1)
		end
	end

	if arg_128_0.mode == StoreHouseConst.DESTROY then
		local var_128_2 = arg_128_0:selectCount()

		if arg_128_0.selectedMax == 0 then
			setText(findTF(arg_128_0.selectPanel, "bottom_info/bg_input/count"), var_128_2)
		else
			setText(findTF(arg_128_0.selectPanel, "bottom_info/bg_input/count"), var_128_2 .. "/" .. arg_128_0.selectedMax)
		end

		if #arg_128_0.selectedIds < arg_128_0.selectedMin then
			setActive(findTF(arg_128_0.selectPanel, "confirm_button/mask"), true)
		else
			setActive(findTF(arg_128_0.selectPanel, "confirm_button/mask"), false)
		end
	end
end

function var_0_0.SwitchToDestroy(arg_129_0)
	arg_129_0.page = var_0_2
	arg_129_0.filterEquipWaitting = arg_129_0.filterEquipWaitting + 1

	triggerToggle(arg_129_0.weaponToggle, true)
	triggerButton(arg_129_0.BatchDisposeBtn)
end

function var_0_0.SwitchToSpWeaponStoreHouse(arg_130_0)
	arg_130_0.page = var_0_4

	triggerToggle(arg_130_0.weaponToggle, true)
end

function var_0_0.SwitchEquipmentType(arg_131_0, arg_131_1)
	local var_131_0

	if arg_131_1 == var_0_4 then
		var_131_0 = i18n("search_sp_equipment")
	elseif arg_131_1 == var_0_3 then
		var_131_0 = i18n("search_equipment_appearance")
	else
		var_131_0 = i18n("search_equipment")
	end

	setText(arg_131_0.nameSearchText, var_131_0)
	setInputText(arg_131_0.nameSearchInput, "")
end

function var_0_0.willExit(arg_132_0)
	arg_132_0:UnOverlayPanel(arg_132_0.blurPanel, arg_132_0._tf)
	arg_132_0:UnOverlayPanel(arg_132_0.topItems, arg_132_0._tf)

	if arg_132_0.bulinTip then
		arg_132_0.bulinTip:Destroy()

		arg_132_0.bulinTip = nil
	end

	arg_132_0.destroyConfirmView:Destroy()
	arg_132_0.assignedItemView:Destroy()
	arg_132_0.blueprintAssignedItemView:Destroy()
	arg_132_0.equipDestroyConfirmWindow:Destroy()
	arg_132_0.msgBox:Destroy()
end

return var_0_0
