local var_0_0 = class("StoreHouseScene", import("view.base.BaseUI"))
local var_0_1 = 1
local var_0_2 = 0
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 1
local var_0_6 = 2
local var_0_7 = 3

function var_0_0.getResource(arg_1_0, arg_1_1)
	local var_1_0 = {
		"ui/share/index_atlas",
		"ui/storehouseui",
		"ui/equipmentui_atlas",
		"ui/recordablesearchbarui",
		"ui/iconcolorful"
	}

	return table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))
end

function var_0_0.getUIName(arg_2_0)
	return "StoreHouseUI"
end

function var_0_0.setEquipments(arg_3_0, arg_3_1)
	arg_3_0.equipmentVOs = arg_3_1

	arg_3_0:setEquipmentByIds(arg_3_1)
end

function var_0_0.setEquipmentByIds(arg_4_0, arg_4_1)
	arg_4_0.equipmentVOByIds = {}

	for iter_4_0, iter_4_1 in pairs(arg_4_1) do
		if not iter_4_1.isSkin then
			arg_4_0.equipmentVOByIds[iter_4_1.id] = iter_4_1
		end
	end
end

local var_0_8 = require("view.equipment.EquipmentSortCfg")
local var_0_9 = require("view.equipment.SpWeaponSortCfg")

function var_0_0.init(arg_5_0)
	arg_5_0.filterEquipWaitting = 0

	local var_5_0 = arg_5_0.contextData

	arg_5_0.topItems = arg_5_0._tf:Find("topItems")
	arg_5_0.equipmentView = arg_5_0._tf:Find("adapt/equipment_scrollview")
	arg_5_0.blurPanel = arg_5_0._tf:Find("blur_panel")
	arg_5_0.topPanel = arg_5_0.blurPanel:Find("adapt/top")
	arg_5_0.indexBtn = arg_5_0.topPanel:Find("buttons/index_button")
	arg_5_0.sortBtn = arg_5_0.topPanel:Find("buttons/sort_button")
	arg_5_0.sortPanel = arg_5_0.topItems:Find("sort")
	arg_5_0.sortPanelTG = arg_5_0.sortPanel:GetComponent("ToggleGroup")
	arg_5_0.sortPanelTG.allowSwitchOff = true
	arg_5_0.sortContain = arg_5_0.sortPanel:Find("adapt/mask/panel")
	arg_5_0.sortTpl = arg_5_0.sortContain:Find("tpl")

	setActive(arg_5_0.sortTpl, false)

	arg_5_0.equipSkinFilteBtn = arg_5_0.topPanel:Find("buttons/EquipSkinFilteBtn")
	arg_5_0.searchBar = RecordableSearchBar.New(RecordableSearchBar.CreateData({
		enabledFlag = false,
		holder = i18n("search_equipment"),
		onInputChanged = function()
			arg_5_0:filterEquipment()
		end,
		key = arg_5_0.__cname,
		parent = arg_5_0.topPanel:Find("buttons"),
		expand_parent = arg_5_0.blurPanel:Find("adapt"),
		anchoredPosition = Vector3(-1305, arg_5_0.topPanel.sizeDelta.y * -0.5, 0)
	}))
	arg_5_0.itemView = arg_5_0._tf:Find("adapt/item_scrollview")

	local var_5_1
	local var_5_2 = getProxy(SettingsProxy)

	if NotchAdapt.CheckNotchRatio == 2 or not var_5_2:CheckLargeScreen() then
		var_5_1 = arg_5_0.itemView.rect.width > 2000
	else
		var_5_1 = NotchAdapt.CheckNotchRatio >= 2
	end

	arg_5_0.equipmentView:Find("equipment_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = var_5_1 and 8 or 7
	arg_5_0.itemView:Find("item_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = var_5_1 and 8 or 7
	arg_5_0.decBtn = findTF(arg_5_0.topPanel, "buttons/dec_btn")
	arg_5_0.sortImgAsc = findTF(arg_5_0.decBtn, "asc")
	arg_5_0.sortImgDec = findTF(arg_5_0.decBtn, "desc")
	arg_5_0.equipmentToggle = arg_5_0._tf:Find("blur_panel/adapt/left_length/frame/toggle_root")

	setActive(arg_5_0.equipmentToggle, false)

	arg_5_0.filterBusyToggle = arg_5_0._tf:Find("blur_panel/adapt/left_length/frame/toggle_equip")

	setActive(arg_5_0.filterBusyToggle, false)

	arg_5_0.designTabRoot = arg_5_0._tf:Find("blur_panel/adapt/left_length/frame/toggle_design")

	setActive(arg_5_0.designTabRoot, false)

	arg_5_0.designTabs = CustomIndexLayer.Clone2Full(arg_5_0.designTabRoot, 3)
	arg_5_0.bottomBack = arg_5_0.topItems:Find("adapt/bottom_back")
	arg_5_0.bottomPanel = arg_5_0.bottomBack:Find("types")
	arg_5_0.materialToggle = arg_5_0.bottomPanel:Find("material")
	arg_5_0.weaponToggle = arg_5_0.bottomPanel:Find("weapon")
	arg_5_0.designToggle = arg_5_0.bottomPanel:Find("design")
	arg_5_0.capacityTF = arg_5_0.bottomBack:Find("bottom_left/tip/capcity/Text")
	arg_5_0.tipTF = arg_5_0.bottomBack:Find("bottom_left/tip")
	arg_5_0.tip = arg_5_0.tipTF:Find("label")
	arg_5_0.helpBtn = arg_5_0.topItems:Find("adapt/help_btn")

	setActive(arg_5_0.helpBtn, true)

	arg_5_0.backBtn = arg_5_0._tf:Find("blur_panel/adapt/top/back_btn")
	arg_5_0.selectedMin = defaultValue(var_5_0.selectedMin, 1)
	arg_5_0.selectedMax = defaultValue(var_5_0.selectedMax, pg.gameset.equip_select_limit.key_value or 0)
	arg_5_0.selectedIds = Clone(var_5_0.selectedIds or {})
	arg_5_0.checkEquipment = var_5_0.onEquipment or function(arg_7_0, arg_7_1, arg_7_2)
		return true
	end
	arg_5_0.onSelected = var_5_0.onSelected or function()
		warning("not implemented.")
	end
	arg_5_0.BatchDisposeBtn = arg_5_0.bottomPanel:Find("dispos")

	if not arg_5_0.BatchDisposeBtn then
		arg_5_0.BatchDisposeBtn = arg_5_0.bottomBack:Find("dispos")
	end

	arg_5_0.selectPanel = arg_5_0.topItems:Find("adapt/select_panel")

	setActive(arg_5_0.selectPanel, true)
	setAnchoredPosition(arg_5_0.selectPanel, {
		y = -124
	})

	arg_5_0.selectTransformPanel = arg_5_0.topItems:Find("adapt/select_transform_panel")

	setActive(arg_5_0.selectTransformPanel, false)

	arg_5_0.listEmptyTF = arg_5_0._tf:Find("adapt/empty")

	setActive(arg_5_0.listEmptyTF, false)

	arg_5_0.listEmptyTxt = arg_5_0.listEmptyTF:Find("Text")
	arg_5_0.destroyConfirmView = DestroyConfirmView.New(arg_5_0.topItems, arg_5_0.event)
	arg_5_0.assignedItemView = AssignedItemView.New(arg_5_0.topItems, arg_5_0.event)
	arg_5_0.blueprintAssignedItemView = BlueprintAssignedItemView.New(arg_5_0.topItems, arg_5_0.event)
	arg_5_0.equipDestroyConfirmWindow = EquipDestoryConfirmWindow.New(arg_5_0.topItems, arg_5_0.event)
	arg_5_0.isEquipingOn = false
	arg_5_0.msgBox = SelectSkinMsgbox.New(arg_5_0._tf, arg_5_0.event)
end

function var_0_0.setEquipment(arg_9_0, arg_9_1)
	local var_9_0 = #arg_9_0.equipmentVOs + 1

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.equipmentVOs) do
		if not iter_9_1.shipId and iter_9_1.id == arg_9_1.id then
			var_9_0 = iter_9_0

			break
		end
	end

	if arg_9_1.count > 0 then
		arg_9_0.equipmentVOs[var_9_0] = arg_9_1
		arg_9_0.equipmentVOByIds[arg_9_1.id] = arg_9_1
	else
		table.remove(arg_9_0.equipmentVOs, var_9_0)

		arg_9_0.equipmentVOByIds[arg_9_1.id] = nil
	end
end

function var_0_0.setEquipmentUpdate(arg_10_0)
	if arg_10_0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON then
		arg_10_0:filterEquipment()
		arg_10_0:updateCapacity()
	end
end

function var_0_0.addShipEquipment(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.equipmentVOs) do
		if EquipmentProxy.SameEquip(iter_11_1, arg_11_1) then
			arg_11_0.equipmentVOs[iter_11_0] = arg_11_1

			return
		end
	end

	table.insert(arg_11_0.equipmentVOs, arg_11_1)
end

function var_0_0.removeShipEquipment(arg_12_0, arg_12_1)
	for iter_12_0 = #arg_12_0.equipmentVOs, 1, -1 do
		local var_12_0 = arg_12_0.equipmentVOs[iter_12_0]

		if EquipmentProxy.SameEquip(var_12_0, arg_12_1) then
			table.remove(arg_12_0.equipmentVOs, iter_12_0)
		end
	end
end

function var_0_0.setEquipmentSkin(arg_13_0, arg_13_1)
	local var_13_0 = true

	for iter_13_0, iter_13_1 in pairs(arg_13_0.equipmentVOs) do
		if iter_13_1.id == arg_13_1.id and iter_13_1.isSkin then
			arg_13_0.equipmentVOs[iter_13_0] = {
				isSkin = true,
				id = arg_13_1.id,
				count = arg_13_1.count
			}
			var_13_0 = false
		end
	end

	if var_13_0 then
		table.insert(arg_13_0.equipmentVOs, {
			isSkin = true,
			id = arg_13_1.id,
			count = arg_13_1.count
		})
	end
end

function var_0_0.setEquipmentSkinUpdate(arg_14_0)
	if arg_14_0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON then
		arg_14_0:filterEquipment()
		arg_14_0:updateCapacity()
	end
end

function var_0_0.SetSpWeapons(arg_15_0, arg_15_1)
	arg_15_0.spweaponVOs = arg_15_1
end

function var_0_0.SetSpWeaponUpdate(arg_16_0)
	if arg_16_0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON and arg_16_0.page == var_0_4 then
		arg_16_0:filterEquipment()
		arg_16_0:UpdateSpweaponCapacity()
	elseif arg_16_0.contextData.warp == StoreHouseConst.WARP_TO_DESIGN and arg_16_0.contextData.designPage == var_0_6 then
		arg_16_0:UpdateSpweaponCapacity()
	end
end

function var_0_0.didEnter(arg_17_0)
	setText(arg_17_0.selectPanel:Find("tip"), i18n("equipment_select_device_destroy_tip"))
	setActive(arg_17_0.topItems:Find("adapt/stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())
	onButton(arg_17_0, arg_17_0.topItems:Find("adapt/stamp"), function()
		getProxy(TaskProxy):dealMingshiTouchFlag(2)
	end, SFX_CONFIRM)
	onButton(arg_17_0, arg_17_0.helpBtn, function()
		local var_19_0

		if arg_17_0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON then
			if arg_17_0.page == var_0_2 then
				var_19_0 = pg.gametip.help_equipment.tip
			elseif arg_17_0.page == var_0_3 then
				var_19_0 = pg.gametip.help_equipment_skin.tip
			elseif arg_17_0.page == var_0_4 then
				var_19_0 = pg.gametip.spweapon_help_storage.tip
			end
		elseif arg_17_0.contextData.warp == StoreHouseConst.WARP_TO_DESIGN then
			if arg_17_0.contextData.designPage == var_0_5 then
				var_19_0 = pg.gametip.help_equipment.tip
			elseif arg_17_0.contextData.designPage == var_0_6 then
				var_19_0 = pg.gametip.spweapon_help_storage.tip
			end
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = var_19_0
		})
	end, SFX_PANEL)
	onToggle(arg_17_0, arg_17_0.equipmentToggle:Find("equipment"), function(arg_20_0)
		if arg_20_0 then
			arg_17_0.page = var_0_2

			arg_17_0:SwitchEquipmentType(var_0_2)
			arg_17_0:UpdateWeaponWrapButtons()
			arg_17_0:filterEquipment()
		end
	end, SFX_PANEL)
	onToggle(arg_17_0, arg_17_0.equipmentToggle:Find("skin"), function(arg_21_0)
		if arg_21_0 then
			arg_17_0.page = var_0_3

			arg_17_0:SwitchEquipmentType(var_0_3)
			arg_17_0:UpdateWeaponWrapButtons()
			arg_17_0:filterEquipment()
		end
	end, SFX_PANEL)
	onToggle(arg_17_0, arg_17_0.equipmentToggle:Find("spweapon"), function(arg_22_0)
		if arg_22_0 then
			arg_17_0.page = var_0_4

			arg_17_0:SwitchEquipmentType(var_0_4)
			arg_17_0:UpdateWeaponWrapButtons()
			arg_17_0:filterEquipment()
		end
	end, SFX_PANEL)
	setActive(arg_17_0.equipmentToggle:Find("spweapon"), not LOCK_SP_WEAPON)
	onToggle(arg_17_0, arg_17_0.designTabs[var_0_5], function(arg_23_0)
		if arg_23_0 then
			arg_17_0.contextData.designPage = var_0_5

			arg_17_0:emit(EquipmentMediator.OPEN_DESIGN)
			arg_17_0:updateCapacity()
			setActive(arg_17_0.tip, false)
			setActive(arg_17_0.listEmptyTF, false)
		else
			arg_17_0:emit(EquipmentMediator.CLOSE_DESIGN_LAYER)
		end

		setActive(arg_17_0.designTabs[var_0_7], arg_23_0)
	end, SFX_PANEL)
	onToggle(arg_17_0, arg_17_0.designTabs[var_0_6], function(arg_24_0)
		if arg_24_0 then
			arg_17_0.contextData.designPage = var_0_6

			arg_17_0:emit(EquipmentMediator.OPEN_SPWEAPON_DESIGN)
			arg_17_0:UpdateSpweaponCapacity()
			setActive(arg_17_0.tip, false)
			setActive(arg_17_0.listEmptyTF, false)
		else
			arg_17_0:emit(EquipmentMediator.CLOSE_SPWEAPON_DESIGN_LAYER)
		end
	end, SFX_PANEL)
	setActive(arg_17_0.designTabs[var_0_7], arg_17_0.contextData.designPage == var_0_5)

	arg_17_0.isShowAllDesign = false

	onToggle(arg_17_0, arg_17_0.designTabs[var_0_7], function(arg_25_0)
		arg_17_0.isShowAllDesign = arg_25_0

		arg_17_0:emit(EquipmentMediator.DESIGN_FILTER_CHANGED, arg_17_0.isShowAllDesign)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.backBtn, function()
		if arg_17_0.mode == StoreHouseConst.DESTROY then
			triggerButton(arg_17_0.BatchDisposeBtn)

			return
		end

		GetOrAddComponent(arg_17_0._tf, typeof(CanvasGroup)).interactable = false

		arg_17_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onToggle(arg_17_0, arg_17_0.sortBtn, function(arg_27_0)
		if arg_27_0 then
			arg_17_0:OverlayPanel(arg_17_0.sortPanel)
			setActive(arg_17_0.sortPanel, true)
			onNextTick(function()
				arg_17_0.sortPanelTG.allowSwitchOff = false
			end)
		else
			arg_17_0:UnOverlayPanel(arg_17_0.sortPanel, arg_17_0.topItems)
			setActive(arg_17_0.sortPanel, false)

			arg_17_0.sortPanelTG.allowSwitchOff = true
		end
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.sortPanel, function()
		triggerToggle(arg_17_0.sortBtn, false)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.indexBtn, function()
		local var_30_0 = switch(arg_17_0.page, {
			[var_0_2] = function()
				return setmetatable({
					indexDatas = Clone(arg_17_0.contextData.indexDatas),
					callback = function(arg_32_0)
						arg_17_0.contextData.indexDatas.typeIndex = arg_32_0.typeIndex
						arg_17_0.contextData.indexDatas.equipPropertyIndex = arg_32_0.equipPropertyIndex
						arg_17_0.contextData.indexDatas.equipPropertyIndex2 = arg_32_0.equipPropertyIndex2
						arg_17_0.contextData.indexDatas.equipAmmoIndex1 = arg_32_0.equipAmmoIndex1
						arg_17_0.contextData.indexDatas.equipAmmoIndex2 = arg_32_0.equipAmmoIndex2
						arg_17_0.contextData.indexDatas.equipCampIndex = arg_32_0.equipCampIndex
						arg_17_0.contextData.indexDatas.rarityIndex = arg_32_0.rarityIndex
						arg_17_0.contextData.indexDatas.extraIndex = arg_32_0.extraIndex

						if arg_17_0.filterBusyToggle:GetComponent(typeof(Toggle)) then
							if bit.band(arg_32_0.extraIndex, IndexConst.EquipmentExtraEquiping) > 0 then
								arg_17_0:SetShowBusyFlag(true)
							end

							triggerToggle(arg_17_0.filterBusyToggle, arg_17_0:GetShowBusyFlag())
						else
							arg_17_0:filterEquipment()
						end
					end
				}, {
					__index = StoreHouseConst.EQUIPMENT_INDEX_COMMON
				})
			end,
			[var_0_4] = function()
				return setmetatable({
					indexDatas = Clone(arg_17_0.contextData.spweaponIndexDatas),
					callback = function(arg_34_0)
						arg_17_0.contextData.spweaponIndexDatas.typeIndex = arg_34_0.typeIndex
						arg_17_0.contextData.spweaponIndexDatas.rarityIndex = arg_34_0.rarityIndex

						arg_17_0:filterEquipment()
					end
				}, {
					__index = StoreHouseConst.SPWEAPON_INDEX_COMMON
				})
			end
		})

		arg_17_0:emit(EquipmentMediator.OPEN_EQUIPMENT_INDEX, var_30_0)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.equipSkinFilteBtn, function()
		local var_35_0 = {
			display = {
				equipSkinIndex = IndexConst.FlagRange2Bits(IndexConst.EquipSkinIndexAll, IndexConst.EquipSkinIndexAux),
				equipSkinTheme = IndexConst.FlagRange2Str(IndexConst.EquipSkinThemeAll, IndexConst.EquipSkinThemeEnd)
			},
			equipSkinSort = arg_17_0.equipSkinSort or IndexConst.EquipSkinSortType,
			equipSkinIndex = arg_17_0.equipSkinIndex or IndexConst.Flags2Bits({
				IndexConst.EquipSkinIndexAll
			}),
			equipSkinTheme = arg_17_0.equipSkinTheme or IndexConst.Flags2Str({
				IndexConst.EquipSkinThemeAll
			}),
			callback = function(arg_36_0)
				arg_17_0.equipSkinSort = arg_36_0.equipSkinSort
				arg_17_0.equipSkinIndex = arg_36_0.equipSkinIndex
				arg_17_0.equipSkinTheme = arg_36_0.equipSkinTheme

				arg_17_0:filterEquipment()
			end
		}

		arg_17_0:emit(EquipmentMediator.OPEN_EQUIPSKIN_INDEX_LAYER, var_35_0)
	end, SFX_PANEL)

	arg_17_0.equipmetItems = {}
	arg_17_0.itemCards = {}

	arg_17_0:initItems()
	arg_17_0:initEquipments()

	arg_17_0.asc = arg_17_0.contextData.asc or false
	arg_17_0.contextData.sortData = arg_17_0.contextData.sortData or var_0_8.sort[1]
	arg_17_0.contextData.indexDatas = arg_17_0.contextData.indexDatas or {}
	arg_17_0.contextData.spweaponIndexDatas = arg_17_0.contextData.spweaponIndexDatas or {}
	arg_17_0.contextData.spweaponSortData = arg_17_0.contextData.spweaponSortData or var_0_9.sort[1]

	arg_17_0:initSort()
	setActive(arg_17_0.itemView, false)
	setActive(arg_17_0.equipmentView, false)
	onToggle(arg_17_0, arg_17_0.materialToggle, function(arg_37_0)
		arg_17_0.inMaterial = arg_37_0

		if arg_37_0 and arg_17_0.contextData.warp ~= StoreHouseConst.WARP_TO_MATERIAL then
			arg_17_0.contextData.warp = StoreHouseConst.WARP_TO_MATERIAL

			setText(arg_17_0.tip, i18n("equipment_select_materials_tip"))
			setActive(arg_17_0.capacityTF.parent, false)
			setActive(arg_17_0.tip, true)
			arg_17_0:sortItems()
		end

		setActive(arg_17_0.helpBtn, not arg_37_0)
	end, SFX_PANEL)
	onToggle(arg_17_0, arg_17_0.weaponToggle, function(arg_38_0)
		if arg_38_0 then
			if arg_17_0.contextData.warp ~= StoreHouseConst.WARP_TO_WEAPON then
				arg_17_0.contextData.warp = StoreHouseConst.WARP_TO_WEAPON

				setActive(arg_17_0.tip, false)
				setActive(arg_17_0.capacityTF.parent, true)

				if arg_17_0.page == var_0_3 then
					triggerToggle(arg_17_0.equipmentToggle:Find("skin"), true)
				elseif arg_17_0.page == var_0_4 then
					triggerToggle(arg_17_0.equipmentToggle:Find("spweapon"), true)
				else
					triggerToggle(arg_17_0.equipmentToggle:Find("equipment"), true)
				end
			end
		else
			setActive(arg_17_0.BatchDisposeBtn, false)
			setActive(arg_17_0.filterBusyToggle, false)
			setActive(arg_17_0.equipmentToggle, false)
		end

		arg_17_0.searchBar:EnableOrDisable(arg_38_0)
	end, SFX_PANEL)
	onToggle(arg_17_0, arg_17_0.designToggle, function(arg_39_0)
		if arg_39_0 then
			arg_17_0.contextData.warp = StoreHouseConst.WARP_TO_DESIGN

			local var_39_0 = arg_17_0.contextData.designPage or var_0_5

			triggerToggle(arg_17_0.designTabs[var_39_0], true)
			setActive(arg_17_0.capacityTF.parent, true)
		else
			arg_17_0:emit(EquipmentMediator.CLOSE_DESIGN_LAYER)
			arg_17_0:emit(EquipmentMediator.CLOSE_SPWEAPON_DESIGN_LAYER)
		end

		setActive(arg_17_0.designTabRoot, arg_39_0 and not LOCK_SP_WEAPON)
	end, SFX_PANEL)
	onToggle(arg_17_0, arg_17_0.filterBusyToggle, function(arg_40_0)
		arg_17_0:SetShowBusyFlag(arg_40_0)
		arg_17_0:filterEquipment()
	end, SFX_PANEL)

	arg_17_0.filterEquipWaitting = arg_17_0.filterEquipWaitting + 1

	triggerToggle(arg_17_0.filterBusyToggle, arg_17_0.shipVO)
	onButton(arg_17_0, arg_17_0.BatchDisposeBtn, function()
		if arg_17_0.mode == StoreHouseConst.DESTROY then
			arg_17_0.mode = StoreHouseConst.OVERVIEW
			arg_17_0.asc = arg_17_0.lastasc
			arg_17_0.lastasc = nil
			arg_17_0.filterImportance = nil

			shiftPanel(arg_17_0.bottomBack, nil, 0, nil, 0, true, true)
			shiftPanel(arg_17_0.selectPanel, nil, -124, nil, 0, true, true)
			arg_17_0:filterEquipment()
		else
			arg_17_0.mode = StoreHouseConst.DESTROY
			arg_17_0.lastasc = arg_17_0.asc
			arg_17_0.filterImportance = true
			arg_17_0.asc = true

			shiftPanel(arg_17_0.bottomBack, nil, -124, nil, 0, true, true)
			shiftPanel(arg_17_0.selectPanel, nil, 0, nil, 0, true, true)

			arg_17_0.contextData.asc = arg_17_0.asc
			arg_17_0.contextData.sortData = var_0_8.sort[1]

			arg_17_0:filterEquipment()
		end

		arg_17_0:UpdateWeaponWrapButtons()
	end, SFX_PANEL)
	onButton(arg_17_0, findTF(arg_17_0.selectPanel, "cancel_button"), function()
		arg_17_0:unselecteAllEquips()
		triggerButton(arg_17_0.BatchDisposeBtn)
	end, SFX_CANCEL)
	onButton(arg_17_0, findTF(arg_17_0.selectPanel, "confirm_button"), function()
		local var_43_0 = {}

		if underscore.any(arg_17_0.selectedIds, function(arg_44_0)
			local var_44_0 = arg_17_0.equipmentVOByIds[arg_44_0[1]]

			return var_44_0:getConfig("rarity") >= 4 or var_44_0:getConfig("level") > 1
		end) then
			table.insert(var_43_0, function(arg_45_0)
				arg_17_0.equipDestroyConfirmWindow:Load()
				arg_17_0.equipDestroyConfirmWindow:ActionInvoke("Show", underscore.map(arg_17_0.selectedIds, function(arg_46_0)
					return setmetatable({
						count = arg_46_0[2]
					}, {
						__index = arg_17_0.equipmentVOByIds[arg_46_0[1]]
					})
				end), arg_45_0)
			end)
		end

		seriesAsync(var_43_0, function()
			arg_17_0.destroyConfirmView:Load()
			arg_17_0.destroyConfirmView:ActionInvoke("Show")
			arg_17_0.destroyConfirmView:ActionInvoke("DisplayDestroyBonus", arg_17_0.selectedIds)
			arg_17_0.destroyConfirmView:ActionInvoke("SetConfirmBtnCB", function()
				arg_17_0:unselecteAllEquips()
			end)
		end)
	end, SFX_CONFIRM)
	arg_17_0:OverlayPanel(arg_17_0.blurPanel)
	arg_17_0:PlayUIAnimation(arg_17_0.blurPanel, "enter")
	arg_17_0:OverlayPanel(arg_17_0.topItems)

	local var_17_0 = arg_17_0.contextData.warp or StoreHouseConst.WARP_TO_MATERIAL
	local var_17_1 = arg_17_0.contextData.mode or StoreHouseConst.OVERVIEW

	arg_17_0.contextData.warp = nil
	arg_17_0.contextData.mode = nil
	arg_17_0.mode = arg_17_0.mode or StoreHouseConst.OVERVIEW

	if var_17_0 == StoreHouseConst.WARP_TO_DESIGN then
		triggerToggle(arg_17_0.designToggle, true)
	elseif var_17_0 == StoreHouseConst.WARP_TO_MATERIAL then
		triggerToggle(arg_17_0.materialToggle, true)
	elseif var_17_0 == StoreHouseConst.WARP_TO_WEAPON then
		if var_17_1 == StoreHouseConst.DESTROY then
			arg_17_0.filterEquipWaitting = arg_17_0.filterEquipWaitting + 1

			triggerToggle(arg_17_0.weaponToggle, true)
			triggerButton(arg_17_0.BatchDisposeBtn)
		else
			if var_17_1 == StoreHouseConst.SKIN then
				arg_17_0.page = var_0_3
			elseif var_17_1 == StoreHouseConst.SPWEAPON then
				arg_17_0.page = var_0_4
			else
				arg_17_0.page = var_0_2
			end

			triggerToggle(arg_17_0.weaponToggle, true)
		end
	end

	arg_17_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_17_0, arg_17_0.topItems)
end

function var_0_0.isDefaultStatus(arg_49_0)
	return underscore(arg_49_0.contextData.indexDatas):chain():keys():all(function(arg_50_0)
		return arg_49_0.contextData.indexDatas[arg_50_0] == StoreHouseConst.EQUIPMENT_INDEX_COMMON.customPanels[arg_50_0].options[1]
	end):value()
end

function var_0_0.isDefaultSpWeaponIndexData(arg_51_0)
	return underscore(arg_51_0.contextData.spweaponIndexDatas):chain():keys():all(function(arg_52_0)
		return arg_51_0.contextData.spweaponIndexDatas[arg_52_0] == StoreHouseConst.SPWEAPON_INDEX_COMMON.customPanels[arg_52_0].options[1]
	end):value()
end

function var_0_0.onBackPressed(arg_53_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if isActive(arg_53_0.sortPanel) then
		triggerButton(arg_53_0.sortPanel)
	elseif arg_53_0.destroyConfirmView:isShowing() then
		arg_53_0.destroyConfirmView:Hide()
	elseif arg_53_0.assignedItemView:isShowing() then
		arg_53_0.assignedItemView:Hide()
	elseif arg_53_0.blueprintAssignedItemView:isShowing() then
		arg_53_0.blueprintAssignedItemView:Hide()
	elseif arg_53_0.equipDestroyConfirmWindow:isShowing() then
		arg_53_0.equipDestroyConfirmWindow:Hide()
	else
		triggerButton(arg_53_0.backBtn)
	end
end

function var_0_0.updateCapacity(arg_54_0)
	if arg_54_0.contextData.warp == StoreHouseConst.WARP_TO_MATERIAL then
		return
	end

	setText(arg_54_0.tip, "")
	setText(arg_54_0.capacityTF, arg_54_0.capacity .. "/" .. arg_54_0.player:getMaxEquipmentBag())
end

function var_0_0.setCapacity(arg_55_0, arg_55_1)
	arg_55_0.capacity = arg_55_1
end

function var_0_0.UpdateSpweaponCapacity(arg_56_0)
	local var_56_0 = getProxy(EquipmentProxy)

	setText(arg_56_0.capacityTF, var_56_0:GetSpWeaponCount() .. "/" .. var_56_0:GetSpWeaponCapacity())
end

function var_0_0.setShip(arg_57_0, arg_57_1)
	arg_57_0.shipVO = arg_57_1

	setActive(arg_57_0.bottomPanel, not tobool(arg_57_1))
end

function var_0_0.setPlayer(arg_58_0, arg_58_1)
	arg_58_0.player = arg_58_1

	if arg_58_0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON and arg_58_0.page == var_0_2 then
		arg_58_0:updateCapacity()
	elseif arg_58_0.contextData.warp == StoreHouseConst.WARP_TO_DESIGN and arg_58_0.contextData.designPage == var_0_5 then
		arg_58_0:updateCapacity()
	end
end

function var_0_0.initSort(arg_59_0)
	onButton(arg_59_0, arg_59_0.decBtn, function()
		arg_59_0.asc = not arg_59_0.asc
		arg_59_0.contextData.asc = arg_59_0.asc

		arg_59_0:filterEquipment()
	end)

	arg_59_0.sortButtons = {}

	eachChild(arg_59_0.sortContain, function(arg_61_0)
		setActive(arg_61_0, false)
	end)

	for iter_59_0, iter_59_1 in ipairs(var_0_8.sort) do
		local var_59_0 = iter_59_0 <= arg_59_0.sortContain.childCount and arg_59_0.sortContain:GetChild(iter_59_0 - 1) or cloneTplTo(arg_59_0.sortTpl, arg_59_0.sortContain)

		setActive(var_59_0, true)
		setImageSprite(findTF(var_59_0, "Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", iter_59_1.spr), true)
		onToggle(arg_59_0, var_59_0, function(arg_62_0)
			if arg_62_0 then
				if arg_59_0.page == var_0_2 then
					arg_59_0.contextData.sortData = iter_59_1
				elseif arg_59_0.page == var_0_4 then
					arg_59_0.contextData.spweaponSortData = var_0_9.sort[iter_59_0]
				end

				arg_59_0:filterEquipment()
				triggerToggle(arg_59_0.sortBtn, false)
			end
		end, SFX_PANEL)

		arg_59_0.sortButtons[iter_59_0] = var_59_0
	end
end

function var_0_0.UpdateWeaponWrapButtons(arg_63_0)
	local var_63_0 = arg_63_0.page

	setActive(arg_63_0.indexBtn, var_63_0 == var_0_2 or var_63_0 == var_0_4)
	setActive(arg_63_0.sortBtn, var_63_0 == var_0_2 or var_63_0 == var_0_4)
	setActive(arg_63_0.BatchDisposeBtn, var_63_0 == var_0_2)
	setActive(arg_63_0.capacityTF.parent, var_63_0 == var_0_2 or var_63_0 == var_0_4)
	setActive(arg_63_0.equipSkinFilteBtn, var_63_0 == var_0_3)
	setActive(arg_63_0.filterBusyToggle, arg_63_0.mode == StoreHouseConst.OVERVIEW)
	setActive(arg_63_0.equipmentToggle, arg_63_0.mode == StoreHouseConst.OVERVIEW and not arg_63_0.contextData.shipId)
	arg_63_0:updatePageFilterButtons(var_63_0)
end

function var_0_0.updatePageFilterButtons(arg_64_0, arg_64_1)
	for iter_64_0, iter_64_1 in ipairs(var_0_8.sort) do
		triggerToggle(arg_64_0.sortButtons[iter_64_0], false)
		setActive(arg_64_0.sortButtons[iter_64_0], table.contains(iter_64_1.pages, arg_64_1))
	end
end

function var_0_0.initEquipments(arg_65_0)
	arg_65_0.isInitWeapons = true
	arg_65_0.equipmentRect = arg_65_0.equipmentView:GetComponent("LScrollRect")

	function arg_65_0.equipmentRect.onInitItem(arg_66_0)
		arg_65_0:initEquipment(arg_66_0)
	end

	function arg_65_0.equipmentRect.onUpdateItem(arg_67_0, arg_67_1)
		arg_65_0:updateEquipment(arg_67_0, arg_67_1)
	end

	function arg_65_0.equipmentRect.onReturnItem(arg_68_0, arg_68_1)
		arg_65_0:returnEquipment(arg_68_0, arg_68_1)
	end

	function arg_65_0.equipmentRect.onStart()
		arg_65_0:updateSelected()
	end

	arg_65_0.equipmentRect.decelerationRate = 0.07
end

function var_0_0.initEquipment(arg_70_0, arg_70_1)
	local var_70_0 = EquipmentItem.New(arg_70_1)

	onButton(arg_70_0, var_70_0.unloadBtn, function()
		if arg_70_0.page == var_0_3 then
			arg_70_0:emit(EquipmentMediator.ON_UNEQUIP_EQUIPMENT_SKIN)
		elseif arg_70_0.page == var_0_2 then
			arg_70_0:emit(EquipmentMediator.ON_UNEQUIP_EQUIPMENT)
		end
	end, SFX_PANEL)
	onButton(arg_70_0, var_70_0.reduceBtn, function()
		arg_70_0:selectEquip(var_70_0.equipmentVO, 1)
	end, SFX_PANEL)

	arg_70_0.equipmetItems[arg_70_1] = var_70_0
end

function var_0_0.updateEquipment(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = arg_73_0.equipmetItems[arg_73_2]

	assert(var_73_0, "without init item")

	local var_73_1 = arg_73_0.loadEquipmentVOs[arg_73_1 + 1]

	var_73_0:update(var_73_1)

	local var_73_2 = false
	local var_73_3 = 0

	if var_73_1 then
		for iter_73_0, iter_73_1 in ipairs(arg_73_0.selectedIds) do
			if var_73_1.id == iter_73_1[1] then
				var_73_2 = true
				var_73_3 = iter_73_1[2]

				break
			end
		end
	end

	var_73_0:updateSelected(var_73_2, var_73_3)

	if not var_73_1 then
		removeOnButton(var_73_0.go)
	elseif isa(var_73_1, SpWeapon) then
		onButton(arg_73_0, var_73_0.go, function()
			local var_74_0 = arg_73_0.shipVO and {
				type = EquipmentInfoMediator.TYPE_REPLACE,
				shipId = arg_73_0.contextData.shipId,
				oldSpWeaponUid = var_73_1:GetUID(),
				oldShipId = var_73_1:GetShipId()
			} or var_73_1:GetShipId() and {
				type = EquipmentInfoMediator.TYPE_DISPLAY,
				spWeaponUid = var_73_1:GetUID(),
				shipId = var_73_1:GetShipId()
			} or {
				type = EquipmentInfoMediator.TYPE_DEFAULT,
				spWeaponUid = var_73_1:GetUID()
			}

			arg_73_0:emit(var_0_0.ON_SPWEAPON, var_74_0)
		end, SFX_PANEL)
	elseif var_73_0.equipmentVO.isSkin then
		if var_73_1.shipId then
			onButton(arg_73_0, var_73_0.go, function()
				local var_75_0 = var_73_1.shipId
				local var_75_1 = var_73_1.shipPos

				assert(var_75_1, "equipment skin pos is nil")
				arg_73_0:emit(EquipmentMediator.ON_EQUIPMENT_SKIN_INFO, var_73_1.id, arg_73_0.contextData.pos, {
					id = var_75_0,
					pos = var_75_1
				})
			end, SFX_PANEL)
		else
			onButton(arg_73_0, var_73_0.go, function()
				arg_73_0:emit(EquipmentMediator.ON_EQUIPMENT_SKIN_INFO, var_73_1.id, arg_73_0.contextData.pos)
			end, SFX_PANEL)
		end
	elseif var_73_1.mask then
		removeOnButton(var_73_0.go)
	elseif arg_73_0.mode == StoreHouseConst.DESTROY then
		onButton(arg_73_0, var_73_0.go, function()
			arg_73_0:selectEquip(var_73_1, var_73_1.count)
		end, SFX_PANEL)
	else
		onButton(arg_73_0, var_73_0.go, function()
			local var_78_0 = arg_73_0.shipVO and {
				type = EquipmentInfoMediator.TYPE_REPLACE,
				equipmentId = var_73_1.id,
				shipId = arg_73_0.contextData.shipId,
				pos = arg_73_0.contextData.pos,
				oldShipId = var_73_1.shipId,
				oldPos = var_73_1.shipPos
			} or var_73_1.shipId and {
				showTransformTip = true,
				type = EquipmentInfoMediator.TYPE_DISPLAY,
				equipmentId = var_73_1.id,
				shipId = var_73_1.shipId,
				pos = var_73_1.shipPos
			} or {
				destroy = true,
				type = EquipmentInfoMediator.TYPE_DEFAULT,
				equipmentId = var_73_1.id
			}

			arg_73_0:emit(var_0_0.ON_EQUIPMENT, var_78_0)
		end, SFX_PANEL)
	end
end

function var_0_0.returnEquipment(arg_79_0, arg_79_1, arg_79_2)
	if arg_79_0.exited then
		return
	end

	local var_79_0 = arg_79_0.equipmetItems[arg_79_2]

	if var_79_0 then
		removeOnButton(var_79_0.go)
		var_79_0:clear()
	end
end

function var_0_0.updateEquipmentCount(arg_80_0, arg_80_1)
	arg_80_0.equipmentRect:SetTotalCount(arg_80_1 or #arg_80_0.loadEquipmentVOs, -1)
	setActive(arg_80_0.listEmptyTF, (arg_80_1 or #arg_80_0.loadEquipmentVOs) <= 0)
	setText(arg_80_0.listEmptyTxt, i18n("list_empty_tip_storehouseui_equip"))
	Canvas.ForceUpdateCanvases()
end

function var_0_0.filterEquipment(arg_81_0)
	if arg_81_0.filterEquipWaitting > 0 then
		arg_81_0.filterEquipWaitting = arg_81_0.filterEquipWaitting - 1

		return
	end

	if arg_81_0.page == var_0_3 then
		arg_81_0:filterEquipSkin()

		return
	elseif arg_81_0.page == var_0_4 then
		arg_81_0:filterSpWeapon()

		return
	end

	local var_81_0 = arg_81_0:isDefaultStatus() and "shaixuan_off" or "shaixuan_on"

	GetSpriteFromAtlasAsync("ui/share/index_atlas", var_81_0, function(arg_82_0)
		setImageSprite(arg_81_0.indexBtn, arg_82_0, true)
	end)

	local var_81_1 = {}

	arg_81_0.loadEquipmentVOs = {}

	for iter_81_0, iter_81_1 in pairs(arg_81_0.equipmentVOs) do
		if not iter_81_1.isSkin then
			table.insert(var_81_1, iter_81_1)
		end
	end

	local var_81_2 = {
		arg_81_0.contextData.indexDatas.equipPropertyIndex,
		arg_81_0.contextData.indexDatas.equipPropertyIndex2
	}

	for iter_81_2, iter_81_3 in pairs(var_81_1) do
		if (iter_81_3.count > 0 or iter_81_3.shipId) and arg_81_0:checkFitBusyCondition(iter_81_3) and IndexConst.filterEquipByType(iter_81_3, arg_81_0.contextData.indexDatas.typeIndex) and IndexConst.filterEquipByProperty(iter_81_3, var_81_2) and IndexConst.filterEquipAmmo1(iter_81_3, arg_81_0.contextData.indexDatas.equipAmmoIndex1) and IndexConst.filterEquipAmmo2(iter_81_3, arg_81_0.contextData.indexDatas.equipAmmoIndex2) and IndexConst.filterEquipByCamp(iter_81_3, arg_81_0.contextData.indexDatas.equipCampIndex) and IndexConst.filterEquipByRarity(iter_81_3, arg_81_0.contextData.indexDatas.rarityIndex) and IndexConst.filterEquipByExtra(iter_81_3, arg_81_0.contextData.indexDatas.extraIndex) then
			table.insert(arg_81_0.loadEquipmentVOs, iter_81_3)
		end
	end

	if arg_81_0.filterImportance ~= nil then
		for iter_81_4 = #arg_81_0.loadEquipmentVOs, 1, -1 do
			local var_81_3 = arg_81_0.loadEquipmentVOs[iter_81_4]

			if var_81_3.isSkin or not var_81_3.isSkin and var_81_3:isImportance() then
				table.remove(arg_81_0.loadEquipmentVOs, iter_81_4)
			end
		end
	end

	local var_81_4 = arg_81_0.searchBar:GetInputText()

	if var_81_4 and var_81_4 ~= "" then
		arg_81_0.loadEquipmentVOs = underscore.filter(arg_81_0.loadEquipmentVOs, function(arg_83_0)
			return arg_83_0:IsMatchKey(var_81_4)
		end)
	end

	local var_81_5 = arg_81_0.contextData.sortData

	if var_81_5 then
		local var_81_6 = arg_81_0.asc

		table.sort(arg_81_0.loadEquipmentVOs, CompareFuncs(var_0_8.sortFunc(var_81_5, var_81_6)))
	end

	if arg_81_0.contextData.qiutBtn then
		table.insert(arg_81_0.loadEquipmentVOs, 1, false)
	end

	arg_81_0:updateSelected()
	arg_81_0:updateEquipmentCount()
	setImageSprite(arg_81_0.sortBtn:Find("Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", var_81_5.spr), true)
	setActive(arg_81_0.sortImgAsc, arg_81_0.asc)
	setActive(arg_81_0.sortImgDec, not arg_81_0.asc)
	arg_81_0:updateCapacity()
end

function var_0_0.filterEquipSkin(arg_84_0)
	local var_84_0 = arg_84_0.equipSkinIndex
	local var_84_1 = arg_84_0.equipSkinTheme
	local var_84_2 = arg_84_0.page
	local var_84_3 = {}

	arg_84_0.loadEquipmentVOs = {}

	if var_84_2 ~= var_0_3 then
		assert(false, "不是外观分页")
	end

	local var_84_4 = arg_84_0.searchBar:GetInputText()

	for iter_84_0, iter_84_1 in pairs(arg_84_0.equipmentVOs) do
		if iter_84_1.isSkin and iter_84_1.count > 0 and (var_84_4 == "" or EquipmentTools.IsMatchEquipmentSkinKey(iter_84_1.id, var_84_4)) then
			table.insert(var_84_3, iter_84_1)
		end
	end

	for iter_84_2, iter_84_3 in pairs(var_84_3) do
		if IndexConst.filterEquipSkinByIndex(iter_84_3, var_84_0) and IndexConst.filterEquipSkinByTheme(iter_84_3, var_84_1) and arg_84_0:checkFitBusyCondition(iter_84_3) then
			table.insert(arg_84_0.loadEquipmentVOs, iter_84_3)
		end
	end

	if arg_84_0.filterImportance ~= nil then
		for iter_84_4 = #arg_84_0.loadEquipmentVOs, 1, -1 do
			local var_84_5 = arg_84_0.loadEquipmentVOs[iter_84_4]

			if var_84_5.isSkin or not var_84_5.isSkin and var_84_5:isImportance() then
				table.remove(arg_84_0.loadEquipmentVOs, iter_84_4)
			end
		end
	end

	local var_84_6 = arg_84_0.contextData.sortData

	if var_84_6 then
		local var_84_7 = arg_84_0.asc

		table.sort(arg_84_0.loadEquipmentVOs, CompareFuncs(var_0_8.sortFunc(var_84_6, var_84_7)))
	end

	if arg_84_0.contextData.qiutBtn then
		table.insert(arg_84_0.loadEquipmentVOs, 1, false)
	end

	arg_84_0:updateSelected()
	arg_84_0:updateEquipmentCount()
	setActive(arg_84_0.sortImgAsc, arg_84_0.asc)
	setActive(arg_84_0.sortImgDec, not arg_84_0.asc)
end

function var_0_0.filterSpWeapon(arg_85_0)
	if arg_85_0.page ~= var_0_4 then
		assert(false, "不是特殊兵装分页")
	end

	local var_85_0 = arg_85_0:isDefaultSpWeaponIndexData() and "shaixuan_off" or "shaixuan_on"

	GetSpriteFromAtlasAsync("ui/share/index_atlas", var_85_0, function(arg_86_0)
		setImageSprite(arg_85_0.indexBtn, arg_86_0, true)
	end)

	arg_85_0.loadEquipmentVOs = {}

	local var_85_1 = arg_85_0.contextData.spweaponIndexDatas.typeIndex
	local var_85_2 = arg_85_0.contextData.spweaponIndexDatas.rarityIndex

	for iter_85_0, iter_85_1 in pairs(arg_85_0.spweaponVOs) do
		if IndexConst.filterSpWeaponByType(iter_85_1, var_85_1) and IndexConst.filterSpWeaponByRarity(iter_85_1, var_85_2) and arg_85_0:checkFitBusyCondition(iter_85_1) and (arg_85_0.filterImportance == nil or iter_85_1:IsImportant()) then
			table.insert(arg_85_0.loadEquipmentVOs, iter_85_1)
		end
	end

	local var_85_3 = arg_85_0.searchBar:GetInputText()

	if var_85_3 and var_85_3 ~= "" then
		local var_85_4 = EquipmentTools.GetMatchSpEquipmentListKeyByShip(var_85_3)

		arg_85_0.loadEquipmentVOs = underscore.filter(arg_85_0.loadEquipmentVOs, function(arg_87_0)
			return arg_87_0:IsMatchKey(var_85_3) or table.contains(var_85_4, arg_87_0.id)
		end)
	end

	local var_85_5 = arg_85_0.contextData.spweaponSortData

	if var_85_5 then
		local var_85_6 = arg_85_0.asc

		table.sort(arg_85_0.loadEquipmentVOs, CompareFuncs(var_0_9.sortFunc(var_85_5, var_85_6)))
	end

	if arg_85_0.contextData.qiutBtn then
		table.insert(arg_85_0.loadEquipmentVOs, 1, false)
	end

	arg_85_0:updateSelected()
	arg_85_0:updateEquipmentCount()
	setImageSprite(arg_85_0.sortBtn:Find("Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", var_85_5.spr), true)
	setActive(arg_85_0.sortImgAsc, arg_85_0.asc)
	setActive(arg_85_0.sortImgDec, not arg_85_0.asc)
	arg_85_0:UpdateSpweaponCapacity()
end

function var_0_0.GetShowBusyFlag(arg_88_0)
	return arg_88_0.isEquipingOn
end

function var_0_0.SetShowBusyFlag(arg_89_0, arg_89_1)
	arg_89_0.isEquipingOn = arg_89_1
end

function var_0_0.Scroll2Equip(arg_90_0, arg_90_1)
	if arg_90_0.contextData.warp ~= StoreHouseConst.WARP_TO_WEAPON or arg_90_0.page ~= var_0_2 then
		return
	end

	for iter_90_0, iter_90_1 in ipairs(arg_90_0.loadEquipmentVOs) do
		if EquipmentProxy.SameEquip(iter_90_1, arg_90_1) then
			local var_90_0 = arg_90_0.equipmentView:Find("equipment_grid"):GetComponent(typeof(GridLayoutGroup))
			local var_90_1 = (var_90_0.cellSize.y + var_90_0.spacing.y) * math.floor((iter_90_0 - 1) / var_90_0.constraintCount) + arg_90_0.equipmentRect.paddingFront + arg_90_0.equipmentView.rect.height * 0.5

			arg_90_0:ScrollEquipPos(var_90_1 - arg_90_0.equipmentRect.paddingFront)

			break
		end
	end
end

function var_0_0.ScrollEquipPos(arg_91_0, arg_91_1)
	local var_91_0 = arg_91_0.equipmentView:Find("equipment_grid"):GetComponent(typeof(GridLayoutGroup))
	local var_91_1 = (var_91_0.cellSize.y + var_91_0.spacing.y) * math.ceil(#arg_91_0.loadEquipmentVOs / var_91_0.constraintCount) - var_91_0.spacing.y + arg_91_0.equipmentRect.paddingFront + arg_91_0.equipmentRect.paddingEnd
	local var_91_2 = var_91_1 - arg_91_0.equipmentView.rect.height

	var_91_2 = var_91_2 > 0 and var_91_2 or var_91_1

	local var_91_3 = (arg_91_1 - arg_91_0.equipmentView.rect.height * 0.5) / var_91_2

	arg_91_0.equipmentRect:ScrollTo(var_91_3)
end

function var_0_0.checkFitBusyCondition(arg_92_0, arg_92_1)
	return not arg_92_1.shipId or arg_92_0:GetShowBusyFlag() and arg_92_0.mode ~= StoreHouseConst.DESTROY
end

function var_0_0.setItems(arg_93_0, arg_93_1)
	arg_93_0.itemVOs = arg_93_1

	if arg_93_0.isInitItems and arg_93_0.contextData.warp == StoreHouseConst.WARP_TO_MATERIAL then
		arg_93_0:sortItems()
	end
end

function var_0_0.initItems(arg_94_0)
	arg_94_0.isInitItems = true
	arg_94_0.itemRect = arg_94_0.itemView:GetComponent("LScrollRect")

	function arg_94_0.itemRect.onInitItem(arg_95_0)
		arg_94_0:initItem(arg_95_0)
	end

	function arg_94_0.itemRect.onUpdateItem(arg_96_0, arg_96_1)
		arg_94_0:updateItem(arg_96_0, arg_96_1)
	end

	function arg_94_0.itemRect.onReturnItem(arg_97_0, arg_97_1)
		arg_94_0:returnItem(arg_97_0, arg_97_1)
	end

	arg_94_0.itemRect.decelerationRate = 0.07
end

function var_0_0.sortItems(arg_98_0)
	table.sort(arg_98_0.itemVOs, CompareFuncs({
		function(arg_99_0)
			return -arg_99_0:getConfig("order")
		end,
		function(arg_100_0)
			return -arg_100_0:getConfig("rarity")
		end,
		function(arg_101_0)
			return arg_101_0.id
		end
	}))
	arg_98_0.itemRect:SetTotalCount(#arg_98_0.itemVOs, -1)
	setActive(arg_98_0.listEmptyTF, #arg_98_0.itemVOs <= 0)
	setText(arg_98_0.listEmptyTxt, i18n("list_empty_tip_storehouseui_item"))
	Canvas.ForceUpdateCanvases()
end

function var_0_0.initItem(arg_102_0, arg_102_1)
	arg_102_0.itemCards[arg_102_1] = ItemCard.New(arg_102_1)
end

function var_0_0.updateItem(arg_103_0, arg_103_1, arg_103_2)
	local var_103_0 = arg_103_0.itemCards[arg_103_2]

	assert(var_103_0, "without init item")

	local var_103_1 = arg_103_0.itemVOs[arg_103_1 + 1]

	var_103_0:update(var_103_1)

	if not var_103_1 then
		removeOnButton(var_103_0.go)
	elseif tobool(getProxy(TechnologyProxy):getItemCanUnlockBluePrint(var_103_1.id)) then
		local var_103_2 = getProxy(TechnologyProxy)
		local var_103_3 = underscore.map(var_103_2:getItemCanUnlockBluePrint(var_103_1.id), function(arg_104_0)
			return var_103_2:getBluePrintById(arg_104_0)
		end)
		local var_103_4 = underscore.detect(var_103_3, function(arg_105_0)
			return not arg_105_0:isUnlock()
		end)

		if var_103_4 then
			onButton(arg_103_0, var_103_0.go, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_BLUEPRINT_UNLOCK_ITEM,
					item = var_103_1,
					blueprints = var_103_3,
					onYes = function()
						arg_103_0:emit(EquipmentMediator.ITEM_GO_SCENE, SCENE.SHIPBLUEPRINT, {
							shipBluePrintVO = var_103_4
						})
					end,
					yesText = i18n("text_forward")
				})
			end, SFX_PANEL)
		else
			onButton(arg_103_0, var_103_0.go, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_BLUEPRINT_UNLOCK_ITEM,
					windowSize = Vector2(1010, 685),
					item = var_103_1,
					blueprints = var_103_3,
					onYes = function()
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							type = MSGBOX_TYPE_ITEM_BOX,
							content = i18n("techpackage_item_use_confirm"),
							items = underscore.map(var_103_1:getConfig("display_icon"), function(arg_110_0)
								return {
									type = arg_110_0[1],
									id = arg_110_0[2],
									count = arg_110_0[3]
								}
							end),
							onYes = function()
								arg_103_0:emit(EquipmentMediator.ON_USE_ITEM, var_103_1.id, 1)
							end
						})
					end
				})
			end, SFX_PANEL)
		end
	elseif var_103_1:getConfig("type") == Item.INVITATION_TYPE then
		onButton(arg_103_0, var_103_0.go, function()
			arg_103_0:emit(EquipmentMediator.ITEM_GO_SCENE, SCENE.INVITATION, {
				itemVO = var_103_1
			})
		end, SFX_PANEL)
	elseif var_103_1:getConfig("type") == Item.ASSIGNED_TYPE or var_103_1:getConfig("type") == Item.EQUIPMENT_ASSIGNED_TYPE then
		if var_103_1:getConfig("usage") == ItemUsage.EX_RE_MAP then
			onButton(arg_103_0, var_103_0.go, function()
				arg_103_0:emit(var_0_0.ON_ITEM, var_103_1.id)
			end, SFX_PANEL)
		elseif underscore.any(pg.gameset.general_blueprint_list.description, function(arg_114_0)
			return var_103_1.id == arg_114_0
		end) then
			onButton(arg_103_0, var_103_0.go, function()
				arg_103_0.blueprintAssignedItemView:Load()
				arg_103_0.blueprintAssignedItemView:ActionInvoke("Show")
				arg_103_0.blueprintAssignedItemView:ActionInvoke("update", var_103_1)
			end, SFX_PANEL)
		else
			onButton(arg_103_0, var_103_0.go, function()
				arg_103_0.assignedItemView:Load()
				arg_103_0.assignedItemView:ActionInvoke("Show")
				arg_103_0.assignedItemView:ActionInvoke("update", var_103_1)
			end, SFX_PANEL)
		end
	elseif Item.IsLoveLetterCheckItem(var_103_1.id) then
		onButton(arg_103_0, var_103_0.go, function()
			arg_103_0:emit(var_0_0.ON_ITEM_EXTRA, var_103_1.id, var_103_1.extra)
		end, SFX_PANEL)
	elseif var_103_1:getConfig("type") == Item.LOVE_LETTER_TYPE then
		onButton(arg_103_0, var_103_0.go, function()
			arg_103_0:emit(var_0_0.ON_ITEM_EXTRA, var_103_1.id, var_103_1.extra)
		end, SFX_PANEL)
	elseif var_103_1:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
		onButton(arg_103_0, var_103_0.go, function()
			arg_103_0:emit(var_0_0.ON_ITEM, var_103_1.id, function()
				local var_120_0 = var_103_1:getConfig("usage_arg")

				if var_103_1:IsAllSkinOwner() then
					local var_120_1 = Drop.New({
						count = 1,
						type = DROP_TYPE_ITEM,
						id = var_120_0[5]
					})

					arg_103_0.msgBox:ExecuteAction("Show", {
						content = i18n("blackfriday_pack_select_skinall_dialog", var_103_1:getConfig("name"), var_120_1:getName()),
						leftDrop = {
							count = 1,
							type = DROP_TYPE_ITEM,
							id = var_103_1.id
						},
						rightDrop = var_120_1,
						onYes = function()
							arg_103_0:emit(EquipmentMediator.ON_USE_ITEM, var_103_1.id, 1, {
								0
							})
						end
					})
				else
					local var_120_2 = {}

					for iter_120_0, iter_120_1 in ipairs(var_120_0[2]) do
						var_120_2[iter_120_1] = true
					end

					arg_103_0:emit(EquipmentMediator.ITEM_ADD_LAYER, Context.New({
						viewComponent = NewSelectSkinLayer,
						mediator = NewSkinAtlasMediator,
						data = {
							mode = SelectSkinLayer.MODE_SELECT,
							itemId = var_103_1.id,
							selectableSkinList = underscore.map(var_103_1:GetValidSkinList(), function(arg_122_0)
								return SelectableSkin.New({
									id = arg_122_0,
									isTimeLimit = var_120_2[arg_122_0] or false
								})
							end),
							OnConfirm = function(arg_123_0)
								arg_103_0:emit(EquipmentMediator.ON_USE_ITEM, var_103_1.id, 1, {
									arg_123_0
								})
							end
						}
					}))
				end
			end)
		end, SFX_PANEL)
	else
		onButton(arg_103_0, var_103_0.go, function()
			arg_103_0:emit(var_0_0.ON_ITEM, var_103_1.id)
		end, SFX_PANEL)
	end
end

function var_0_0.returnItem(arg_125_0, arg_125_1, arg_125_2)
	if arg_125_0.exited then
		return
	end

	local var_125_0 = arg_125_0.itemCards[arg_125_2]

	if var_125_0 then
		removeOnButton(var_125_0.go)
		var_125_0:clear()
	end
end

function var_0_0.selectCount(arg_126_0)
	local var_126_0 = 0

	for iter_126_0, iter_126_1 in ipairs(arg_126_0.selectedIds) do
		var_126_0 = var_126_0 + iter_126_1[2]
	end

	return var_126_0
end

function var_0_0.selectEquip(arg_127_0, arg_127_1, arg_127_2)
	if not arg_127_0:checkDestroyGold(arg_127_1, arg_127_2) then
		return
	end

	if arg_127_0.mode == StoreHouseConst.DESTROY then
		local var_127_0 = false
		local var_127_1
		local var_127_2 = 0

		for iter_127_0, iter_127_1 in pairs(arg_127_0.selectedIds) do
			if iter_127_1[1] == arg_127_1.id then
				var_127_0 = true
				var_127_1 = iter_127_0
				var_127_2 = iter_127_1[2]

				break
			end
		end

		if not var_127_0 then
			local var_127_3, var_127_4 = arg_127_0.checkEquipment(arg_127_1, function()
				arg_127_0:selectEquip(arg_127_1, arg_127_2)
			end, arg_127_0.selectedIds)

			if not var_127_3 then
				if var_127_4 then
					pg.TipsMgr.GetInstance():ShowTips(var_127_4)
				end

				return
			end

			local var_127_5 = arg_127_0:selectCount()

			if arg_127_0.selectedMax > 0 and var_127_5 + arg_127_2 > arg_127_0.selectedMax then
				arg_127_2 = arg_127_0.selectedMax - var_127_5
			end

			if arg_127_0.selectedMax == 0 or var_127_5 < arg_127_0.selectedMax then
				table.insert(arg_127_0.selectedIds, {
					arg_127_1.id,
					arg_127_2
				})
			elseif arg_127_0.selectedMax == 1 then
				arg_127_0.selectedIds[1] = {
					arg_127_1.id,
					arg_127_2
				}
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_equipmentScene_selectError_more", arg_127_0.selectedMax))

				return
			end
		elseif var_127_2 - arg_127_2 > 0 then
			arg_127_0.selectedIds[var_127_1][2] = var_127_2 - arg_127_2
		else
			table.remove(arg_127_0.selectedIds, var_127_1)
		end
	end

	arg_127_0:updateSelected()
end

function var_0_0.unselecteAllEquips(arg_129_0)
	arg_129_0.selectedIds = {}

	arg_129_0:updateSelected()
end

function var_0_0.checkDestroyGold(arg_130_0, arg_130_1, arg_130_2)
	local var_130_0 = 0
	local var_130_1 = false

	for iter_130_0, iter_130_1 in pairs(arg_130_0.selectedIds) do
		local var_130_2 = iter_130_1[2]

		if Equipment.CanInBag(iter_130_1[1]) then
			var_130_0 = var_130_0 + (Equipment.getConfigData(iter_130_1[1]).destory_gold or 0) * var_130_2
		end

		if arg_130_1 and iter_130_1[1] == arg_130_1.configId then
			var_130_1 = true
		end
	end

	if not var_130_1 and arg_130_1 and arg_130_2 > 0 then
		var_130_0 = var_130_0 + (arg_130_1:getConfig("destory_gold") or 0) * arg_130_2
	end

	if arg_130_0.player:GoldMax(var_130_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_destroy"))

		return false
	end

	return true
end

function var_0_0.updateSelected(arg_131_0)
	for iter_131_0, iter_131_1 in pairs(arg_131_0.equipmetItems) do
		if iter_131_1.equipmentVO then
			local var_131_0 = false
			local var_131_1 = 0

			for iter_131_2, iter_131_3 in pairs(arg_131_0.selectedIds) do
				if iter_131_1.equipmentVO.id == iter_131_3[1] then
					var_131_0 = true
					var_131_1 = iter_131_3[2]

					break
				end
			end

			iter_131_1:updateSelected(var_131_0, var_131_1)
		end
	end

	if arg_131_0.mode == StoreHouseConst.DESTROY then
		local var_131_2 = arg_131_0:selectCount()

		if arg_131_0.selectedMax == 0 then
			setText(findTF(arg_131_0.selectPanel, "bottom_info/bg_input/count"), var_131_2)
		else
			setText(findTF(arg_131_0.selectPanel, "bottom_info/bg_input/count"), var_131_2 .. "/" .. arg_131_0.selectedMax)
		end

		if #arg_131_0.selectedIds < arg_131_0.selectedMin then
			setActive(findTF(arg_131_0.selectPanel, "confirm_button/mask"), true)
		else
			setActive(findTF(arg_131_0.selectPanel, "confirm_button/mask"), false)
		end
	end
end

function var_0_0.SwitchToDestroy(arg_132_0)
	arg_132_0.page = var_0_2
	arg_132_0.filterEquipWaitting = arg_132_0.filterEquipWaitting + 1

	triggerToggle(arg_132_0.weaponToggle, true)
	triggerButton(arg_132_0.BatchDisposeBtn)
end

function var_0_0.SwitchToSpWeaponStoreHouse(arg_133_0)
	arg_133_0.page = var_0_4

	triggerToggle(arg_133_0.weaponToggle, true)
end

function var_0_0.SwitchEquipmentType(arg_134_0, arg_134_1)
	local var_134_0

	if arg_134_1 == var_0_4 then
		var_134_0 = i18n("search_sp_equipment")
	elseif arg_134_1 == var_0_3 then
		var_134_0 = i18n("search_equipment_appearance")
	else
		var_134_0 = i18n("search_equipment")
	end

	arg_134_0.searchBar:UpdateHolder(var_134_0)
	arg_134_0.searchBar:ClearInputText()
end

function var_0_0.willExit(arg_135_0)
	arg_135_0:UnOverlayPanel(arg_135_0.blurPanel, arg_135_0._tf)
	arg_135_0:UnOverlayPanel(arg_135_0.topItems, arg_135_0._tf)

	if arg_135_0.bulinTip then
		arg_135_0.bulinTip:Destroy()

		arg_135_0.bulinTip = nil
	end

	if arg_135_0.searchBar then
		arg_135_0.searchBar:Dispose()

		arg_135_0.searchBar = nil
	end

	arg_135_0.destroyConfirmView:Destroy()
	arg_135_0.assignedItemView:Destroy()
	arg_135_0.blueprintAssignedItemView:Destroy()
	arg_135_0.equipDestroyConfirmWindow:Destroy()
	arg_135_0.msgBox:Destroy()
end

return var_0_0
