local var_0_0 = class("SpWeaponStoreHouseScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "SpWeaponStoreHouseUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/equipmentui_atlas",
		"ui/share/index_atlas",
		"weaponframes",
		"ui/iconcolorful",
		"ui/CustomIndexUI",
		"ui/MsgBox",
		"ui/SpWeaponUpgradeUI"
	}

	local function var_2_1(arg_3_0)
		if not arg_3_0 then
			return
		end

		table.insert(var_2_0, arg_3_0:GetIconPath())

		local var_3_0 = arg_3_0:GetShipId()

		if var_3_0 and var_3_0 > 0 then
			local var_3_1 = getProxy(BayProxy):RawGetShipById(var_3_0)

			if var_3_1 then
				table.insert(var_2_0, "qicon/" .. var_3_1:getPainting())
			end
		end
	end

	local var_2_2 = getProxy(BayProxy)
	local var_2_3 = arg_2_0.contextData.shipId
	local var_2_4 = var_2_3 and var_2_2:RawGetShipById(var_2_3)

	for iter_2_0, iter_2_1 in ipairs(var_2_2:GetSpWeaponsInShips(var_2_4)) do
		var_2_1(iter_2_1)
	end

	for iter_2_2, iter_2_3 in pairs(getProxy(EquipmentProxy):GetSpWeapons()) do
		if not var_2_4 or not var_2_4:IsSpWeaponForbidden(iter_2_3) then
			var_2_1(iter_2_3)
		end
	end

	for iter_2_4, iter_2_5 in ipairs(SpWeapon.bindConfigTable().all) do
		local var_2_5 = SpWeapon.New({
			id = iter_2_5
		})

		if var_2_5:IsCraftable() and (not var_2_4 or not var_2_4:IsSpWeaponForbidden(var_2_5)) then
			var_2_1(var_2_5)
		end
	end

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))

	return var_2_0
end

function var_0_0.setEquipments(arg_4_0, arg_4_1)
	arg_4_0.equipmentVOs = arg_4_1
end

function var_0_0.SetCraftList(arg_5_0, arg_5_1)
	arg_5_0.craftList = arg_5_1
end

local var_0_1 = require("view.equipment.SpWeaponSortCfg")

function var_0_0.init(arg_6_0)
	arg_6_0.topItems = arg_6_0._tf:Find("topItems")
	arg_6_0.equipmentView = arg_6_0.rtAdapt:Find("ScrollView")
	arg_6_0.equipmentsGrid = arg_6_0.equipmentView:Find("Viewport/Content/StoreHouse/Grid")
	arg_6_0.craftsGrid = arg_6_0.equipmentView:Find("Viewport/Content/Craft/Grid")

	setActive(arg_6_0.equipmentView:Find("Template"), false)

	arg_6_0.blurPanel = arg_6_0._tf:Find("blur_panel")
	arg_6_0.topPanel = arg_6_0.blurPanel:Find("adapt/top")
	arg_6_0.indexBtn = arg_6_0.topPanel:Find("buttons/index_button")
	arg_6_0.sortBtn = arg_6_0.topPanel:Find("buttons/sort_button")
	arg_6_0.sortPanel = arg_6_0.topItems:Find("sort")
	arg_6_0.sortContain = arg_6_0.sortPanel:Find("adapt/mask/panel")
	arg_6_0.sortTpl = arg_6_0.sortContain:Find("tpl")

	setActive(arg_6_0.sortTpl, false)

	local var_6_0
	local var_6_1 = getProxy(SettingsProxy)

	if NotchAdapt.CheckNotchRatio == 2 or not var_6_1:CheckLargeScreen() then
		var_6_0 = arg_6_0.equipmentView.rect.width > 2000
	else
		var_6_0 = NotchAdapt.CheckNotchRatio >= 2
	end

	arg_6_0.equipmentsGrid:GetComponent(typeof(GridLayoutGroup)).constraintCount = var_6_0 and 8 or 7
	arg_6_0.craftsGrid:GetComponent(typeof(GridLayoutGroup)).constraintCount = var_6_0 and 8 or 7
	arg_6_0.decBtn = findTF(arg_6_0.topPanel, "buttons/dec_btn")
	arg_6_0.sortImgAsc = findTF(arg_6_0.decBtn, "asc")
	arg_6_0.sortImgDec = findTF(arg_6_0.decBtn, "desc")
	arg_6_0.filterBusyToggle = arg_6_0._tf:Find("blur_panel/adapt/left_length/frame/toggle_equip")

	setActive(arg_6_0.filterBusyToggle, false)

	arg_6_0.bottomBack = arg_6_0.topItems:Find("adapt/bottom_back")
	arg_6_0.capacityTF = arg_6_0.bottomBack:Find("bottom_left/tip/capcity/Text")
	arg_6_0.tipTF = arg_6_0.bottomBack:Find("bottom_left/tip")
	arg_6_0.tip = arg_6_0.tipTF:Find("label")
	arg_6_0.helpBtn = arg_6_0.topItems:Find("adapt/help_btn")

	setActive(arg_6_0.helpBtn, true)

	arg_6_0.backBtn = arg_6_0._tf:Find("blur_panel/adapt/top/back_btn")
	arg_6_0.listEmptyTF = arg_6_0._tf:Find("empty")

	setActive(arg_6_0.listEmptyTF, false)

	arg_6_0.listEmptyTxt = arg_6_0.listEmptyTF:Find("Text")

	setText(arg_6_0.listEmptyTxt, i18n("list_empty_tip_storehouseui_equip"))
	setText(arg_6_0.equipmentView:Find("Viewport/Content/Craft/Banner/Text"), i18n("spweapon_ui_create"))
	setText(arg_6_0.equipmentView:Find("Viewport/Content/StoreHouse/Banner/Text"), i18n("spweapon_ui_storage"))

	arg_6_0.isEquipingOn = false
	arg_6_0.filterImportance = nil
end

function var_0_0.setEquipmentUpdate(arg_7_0)
	arg_7_0:filterEquipment()
	arg_7_0:updateCapacity()
end

function var_0_0.didEnter(arg_8_0)
	onButton(arg_8_0, arg_8_0.helpBtn, function()
		local var_9_0 = pg.gametip.spweapon_help_storage.tip

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = var_9_0
		})
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.backBtn, function()
		GetOrAddComponent(arg_8_0._tf, typeof(CanvasGroup)).interactable = false

		arg_8_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onToggle(arg_8_0, arg_8_0.sortBtn, function(arg_11_0)
		if arg_11_0 then
			arg_8_0:OverlayPanel(arg_8_0.sortPanel)
			setActive(arg_8_0.sortPanel, true)
		else
			arg_8_0:UnOverlayPanel(arg_8_0.sortPanel, arg_8_0.topItems)
			setActive(arg_8_0.sortPanel, false)
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.sortPanel, function()
		triggerToggle(arg_8_0.sortBtn, false)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.indexBtn, function()
		local var_13_0 = {
			indexDatas = Clone(arg_8_0.contextData.indexDatas),
			customPanels = {
				typeIndex = {
					mode = CustomIndexLayer.Mode.OR,
					options = IndexConst.SpWeaponTypeIndexs,
					names = IndexConst.SpWeaponTypeNames
				},
				rarityIndex = {
					mode = CustomIndexLayer.Mode.AND,
					options = IndexConst.SpWeaponRarityIndexs,
					names = IndexConst.SpWeaponRarityNames
				}
			},
			groupList = {
				{
					dropdown = false,
					titleTxt = "indexsort_type",
					titleENTxt = "indexsort_typeeng",
					tags = {
						"typeIndex"
					}
				},
				{
					dropdown = false,
					titleTxt = "indexsort_rarity",
					titleENTxt = "indexsort_rarityeng",
					tags = {
						"rarityIndex"
					}
				}
			},
			callback = function(arg_14_0)
				arg_8_0.contextData.indexDatas.typeIndex = arg_14_0.typeIndex
				arg_8_0.contextData.indexDatas.rarityIndex = arg_14_0.rarityIndex

				arg_8_0:filterEquipment()
			end
		}

		arg_8_0:emit(SpWeaponStoreHouseMediator.OPEN_EQUIPMENT_INDEX, var_13_0)
	end, SFX_PANEL)

	local var_8_0 = arg_8_0.equipmentView:Find("Viewport/Content/Craft/Banner/Arrow")

	onToggle(arg_8_0, var_8_0, function(arg_15_0)
		arg_8_0.hideCraft = not arg_15_0

		arg_8_0:UpdateCraftCount()
	end, SFX_PANEL, SFX_PANEL)

	local var_8_1 = arg_8_0.equipmentView:Find("Viewport/Content/StoreHouse/Banner/Arrow")

	onToggle(arg_8_0, var_8_1, function(arg_16_0)
		arg_8_0.hideSpweapon = not arg_16_0

		arg_8_0:updateEquipmentCount()
	end, SFX_PANEL, SFX_PANEL)

	arg_8_0.equipmetItems = {}
	arg_8_0.craftItems = {}

	arg_8_0:initEquipments()

	arg_8_0.asc = arg_8_0.contextData.asc or false
	arg_8_0.contextData.sortData = arg_8_0.contextData.sortData or var_0_1.sort[1]
	arg_8_0.contextData.indexDatas = arg_8_0.contextData.indexDatas or {}

	arg_8_0:initSort()
	onToggle(arg_8_0, arg_8_0.filterBusyToggle, function(arg_17_0)
		arg_8_0:SetShowBusyFlag(arg_17_0)
		arg_8_0:filterEquipment()
	end, SFX_PANEL)
	triggerToggle(arg_8_0.filterBusyToggle, arg_8_0.shipVO)
	arg_8_0:OverlayPanel(arg_8_0.blurPanel)
	arg_8_0:OverlayPanel(arg_8_0.topItems)

	local var_8_2 = arg_8_0.contextData.mode or StoreHouseConst.OVERVIEW

	arg_8_0.contextData.mode = var_8_2

	arg_8_0:updateCapacity()
	setActive(arg_8_0.tip, false)
	setActive(arg_8_0.capacityTF.parent, true)
	setActive(arg_8_0.filterBusyToggle, true)
	setActive(arg_8_0.indexBtn, true)
	setActive(arg_8_0.sortBtn, false)
	triggerToggle(var_8_0, true)
	triggerToggle(var_8_1, true)
end

function var_0_0.isDefaultStatus(arg_18_0)
	return (not arg_18_0.contextData.indexDatas.typeIndex or arg_18_0.contextData.indexDatas.typeIndex == IndexConst.SpWeaponTypeAll) and (not arg_18_0.contextData.indexDatas.rarityIndex or arg_18_0.contextData.indexDatas.rarityIndex == IndexConst.SpWeaponRarityAll)
end

function var_0_0.onBackPressed(arg_19_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if isActive(arg_19_0.sortPanel) then
		triggerButton(arg_19_0.sortPanel)
	else
		triggerButton(arg_19_0.backBtn)
	end
end

function var_0_0.updateCapacity(arg_20_0)
	setText(arg_20_0.tip, "")

	local var_20_0 = getProxy(EquipmentProxy):GetSpWeaponCount()
	local var_20_1 = getProxy(EquipmentProxy):GetSpWeaponCapacity()

	setText(arg_20_0.capacityTF, var_20_0 .. "/" .. var_20_1)
end

function var_0_0.setShip(arg_21_0, arg_21_1)
	arg_21_0.shipVO = arg_21_1
end

function var_0_0.setPlayer(arg_22_0, arg_22_1)
	arg_22_0.player = arg_22_1
end

function var_0_0.initSort(arg_23_0)
	onButton(arg_23_0, arg_23_0.decBtn, function()
		arg_23_0.asc = not arg_23_0.asc
		arg_23_0.contextData.asc = arg_23_0.asc

		arg_23_0:filterEquipment()
	end)

	arg_23_0.sortButtons = {}

	eachChild(arg_23_0.sortContain, function(arg_25_0)
		setActive(arg_25_0, false)
	end)

	for iter_23_0, iter_23_1 in ipairs(var_0_1.sort) do
		local var_23_0 = iter_23_0 <= arg_23_0.sortContain.childCount and arg_23_0.sortContain:GetChild(iter_23_0 - 1) or cloneTplTo(arg_23_0.sortTpl, arg_23_0.sortContain)

		setActive(var_23_0, true)
		setImageSprite(findTF(var_23_0, "Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", iter_23_1.spr), true)
		onToggle(arg_23_0, var_23_0, function(arg_26_0)
			if arg_26_0 then
				arg_23_0.contextData.sortData = iter_23_1

				arg_23_0:filterEquipment()
				triggerToggle(arg_23_0.sortBtn, false)
			end
		end, SFX_PANEL)

		arg_23_0.sortButtons[iter_23_0] = var_23_0
	end
end

function var_0_0.initEquipments(arg_27_0)
	arg_27_0.equipmentRect = UIItemList.New(arg_27_0.equipmentsGrid, arg_27_0.equipmentView:Find("Template"))

	arg_27_0.equipmentRect:make(function(arg_28_0, arg_28_1, arg_28_2)
		local var_28_0 = go(arg_28_2)

		if arg_28_0 == UIItemList.EventInit then
			arg_27_0:InitSpWeapon(var_28_0)
		elseif arg_28_0 == UIItemList.EventUpdate then
			arg_27_0:UpdateSpWeapon(arg_28_1, var_28_0)
		elseif arg_28_0 == UIItemList.EventExcess then
			arg_27_0:ReturnSpWeapon(arg_28_1, var_28_0)
		end
	end)

	arg_27_0.craftRect = UIItemList.New(arg_27_0.craftsGrid, arg_27_0.equipmentView:Find("Template"))

	arg_27_0.craftRect:make(function(arg_29_0, arg_29_1, arg_29_2)
		local var_29_0 = go(arg_29_2)

		if arg_29_0 == UIItemList.EventInit then
			arg_27_0:InitCraftItem(var_29_0)
		elseif arg_29_0 == UIItemList.EventUpdate then
			arg_27_0:UpdateCraftItem(arg_29_1, var_29_0)
		elseif arg_29_0 == UIItemList.EventExcess then
			arg_27_0:ReturnCraftItem(arg_29_1, var_29_0)
		end
	end)
end

function var_0_0.InitSpWeapon(arg_30_0, arg_30_1)
	local var_30_0 = SpWeaponItemView.New(arg_30_1)

	onButton(arg_30_0, var_30_0.unloadBtn, function()
		arg_30_0:emit(SpWeaponStoreHouseMediator.ON_UNEQUIP)
	end, SFX_PANEL)

	arg_30_0.equipmetItems[arg_30_1] = var_30_0
end

function var_0_0.UpdateSpWeapon(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0.equipmetItems[arg_32_2]

	assert(var_32_0, "without init item")

	local var_32_1 = arg_32_0.loadEquipmentVOs[arg_32_1 + 1]

	var_32_0:update(var_32_1)

	if not var_32_1 or var_32_1.mask then
		removeOnButton(var_32_0.go)
	else
		onButton(arg_32_0, var_32_0.go, function()
			local var_33_0 = arg_32_0.shipVO and {
				type = EquipmentInfoMediator.TYPE_REPLACE,
				shipId = arg_32_0.contextData.shipId,
				oldSpWeaponUid = var_32_1:GetUID(),
				oldShipId = var_32_1:GetShipId()
			} or var_32_1:GetShipId() and {
				type = EquipmentInfoMediator.TYPE_DISPLAY,
				spWeaponUid = var_32_1:GetUID(),
				shipId = var_32_1:GetShipId()
			} or {
				type = EquipmentInfoMediator.TYPE_DEFAULT,
				spWeaponUid = var_32_1:GetUID()
			}

			arg_32_0:emit(var_0_0.ON_SPWEAPON, var_33_0)
		end, SFX_PANEL)
	end
end

function var_0_0.ReturnSpWeapon(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_0.exited then
		return
	end

	local var_34_0 = arg_34_0.equipmetItems[arg_34_2]

	if var_34_0 then
		removeOnButton(var_34_0.go)
		var_34_0:clear()
	end
end

function var_0_0.updateEquipmentCount(arg_35_0)
	local var_35_0 = arg_35_0.hideSpweapon and 0 or #arg_35_0.loadEquipmentVOs

	arg_35_0.equipmentRect:align(var_35_0)

	local var_35_1 = arg_35_0.equipmentsGrid:GetComponent(typeof(GridLayoutGroup))
	local var_35_2 = var_35_1.padding

	if var_35_0 then
		var_35_2.top = 31
		var_35_2.bottom = 25
	else
		var_35_2.top = 0
		var_35_2.bottom = 0
	end

	var_35_1.padding = var_35_2
end

function var_0_0.filterEquipment(arg_36_0)
	local var_36_0 = arg_36_0:isDefaultStatus() and "shaixuan_off" or "shaixuan_on"

	GetSpriteFromAtlasAsync("ui/share/index_atlas", var_36_0, function(arg_37_0)
		setImageSprite(arg_36_0.indexBtn, arg_37_0, true)
	end)

	local var_36_1 = arg_36_0.contextData.sortData

	;(function()
		arg_36_0.loadEquipmentVOs = {}

		local var_38_0 = {}

		for iter_38_0, iter_38_1 in pairs(arg_36_0.equipmentVOs) do
			table.insert(var_38_0, iter_38_1)
		end

		for iter_38_2, iter_38_3 in pairs(var_38_0) do
			if arg_36_0:checkFitBusyCondition(iter_38_3) and IndexConst.filterSpWeaponByType(iter_38_3, arg_36_0.contextData.indexDatas.typeIndex) and IndexConst.filterSpWeaponByRarity(iter_38_3, arg_36_0.contextData.indexDatas.rarityIndex) and (arg_36_0.filterImportance == nil or iter_38_3:IsImportant()) then
				table.insert(arg_36_0.loadEquipmentVOs, iter_38_3)
			end
		end

		if var_36_1 then
			local var_38_1 = arg_36_0.asc

			table.sort(arg_36_0.loadEquipmentVOs, CompareFuncs(var_0_1.sortFunc(var_36_1, var_38_1)))
		end

		if arg_36_0.contextData.qiutBtn then
			table.insert(arg_36_0.loadEquipmentVOs, 1, false)
		end
	end)()
	arg_36_0:updateEquipmentCount()
	;(function()
		arg_36_0.showCraftList = {}

		local var_39_0 = {}

		for iter_39_0, iter_39_1 in pairs(arg_36_0.craftList) do
			table.insert(var_39_0, iter_39_1)
		end

		for iter_39_2, iter_39_3 in pairs(var_39_0) do
			if arg_36_0:checkFitBusyCondition(iter_39_3) and IndexConst.filterSpWeaponByType(iter_39_3, arg_36_0.contextData.indexDatas.typeIndex) and IndexConst.filterSpWeaponByRarity(iter_39_3, arg_36_0.contextData.indexDatas.rarityIndex) and (arg_36_0.filterImportance == nil or iter_39_3:IsImportant()) then
				table.insert(arg_36_0.showCraftList, iter_39_3)
			end
		end

		if var_36_1 then
			local var_39_1 = arg_36_0.asc

			table.sort(arg_36_0.showCraftList, CompareFuncs(var_0_1.sortFunc(var_36_1, var_39_1)))
		end
	end)()
	arg_36_0:UpdateCraftCount()
	setImageSprite(arg_36_0.sortBtn:Find("Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", var_36_1.spr), true)
	setActive(arg_36_0.sortImgAsc, arg_36_0.asc)
	setActive(arg_36_0.sortImgDec, not arg_36_0.asc)
end

function var_0_0.InitCraftItem(arg_40_0, arg_40_1)
	local var_40_0 = SpWeaponItemView.New(arg_40_1)

	arg_40_0.craftItems[arg_40_1] = var_40_0
end

function var_0_0.UpdateCraftItem(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = arg_41_0.craftItems[arg_41_2]

	assert(var_41_0, "without init item")

	local var_41_1 = arg_41_0.showCraftList[arg_41_1 + 1]

	var_41_0:update(var_41_1)
	onButton(arg_41_0, var_41_0.go, function()
		arg_41_0:emit(SpWeaponStoreHouseMediator.ON_COMPOSITE, var_41_1:GetConfigID())
	end, SFX_PANEL)
end

function var_0_0.ReturnCraftItem(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_0.craftItems[arg_43_2]

	if var_43_0 then
		removeOnButton(var_43_0.go)
		var_43_0:clear()
	end
end

function var_0_0.UpdateCraftCount(arg_44_0)
	local var_44_0 = arg_44_0.hideCraft and 0 or #arg_44_0.showCraftList

	arg_44_0.craftRect:align(var_44_0)

	local var_44_1 = arg_44_0.craftsGrid:GetComponent(typeof(GridLayoutGroup))
	local var_44_2 = var_44_1.padding

	if var_44_0 > 0 then
		var_44_2.top = 31
		var_44_2.bottom = 25
	else
		var_44_2.top = 0
		var_44_2.bottom = 0
	end

	var_44_1.padding = var_44_2
end

function var_0_0.GetShowBusyFlag(arg_45_0)
	return arg_45_0.isEquipingOn
end

function var_0_0.SetShowBusyFlag(arg_46_0, arg_46_1)
	arg_46_0.isEquipingOn = arg_46_1
end

function var_0_0.checkFitBusyCondition(arg_47_0, arg_47_1)
	return arg_47_0:GetShowBusyFlag() or not arg_47_1:GetShipId()
end

function var_0_0.willExit(arg_48_0)
	arg_48_0:UnOverlayPanel(arg_48_0.blurPanel, arg_48_0._tf)
	arg_48_0:UnOverlayPanel(arg_48_0.topItems, arg_48_0._tf)
end

return var_0_0
