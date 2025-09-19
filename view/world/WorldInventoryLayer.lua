local var_0_0 = class("WorldInventoryLayer", import("..base.BaseUI"))
local var_0_1 = require("view.equipment.EquipmentSortCfg")

var_0_0.PAGE = {
	Equipment = 2,
	Property = 1,
	Material = 3
}

function var_0_0.getUIName(arg_1_0)
	return "WorldInventoryUI"
end

function var_0_0.init(arg_2_0)
	function arg_2_0.itemUpdateListenerFunc(...)
		arg_2_0:setItemList(arg_2_0.inventoryProxy:GetItemList())
	end

	arg_2_0.blurPanel = arg_2_0:findTF("adapt/blur_panel")
	arg_2_0.backBtn = arg_2_0:findTF("adapt/top/back_btn", arg_2_0.blurPanel)
	arg_2_0.topItems = arg_2_0:findTF("adapt/topItems")
	arg_2_0.itemView = arg_2_0:findTF("adapt/item_scrollview")
	arg_2_0.equipmentView = arg_2_0:findTF("adapt/equipment_scrollview")
	arg_2_0.materialtView = arg_2_0:findTF("adapt/material_scrollview")

	local var_2_0
	local var_2_1 = getProxy(SettingsProxy)

	if NotchAdapt.CheckNotchRatio == 2 or not var_2_1:CheckLargeScreen() then
		var_2_0 = arg_2_0.itemView.rect.width > 2000
	else
		var_2_0 = NotchAdapt.CheckNotchRatio >= 2
	end

	arg_2_0.itemView:Find("Viewport/item_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = var_2_0 and 8 or 7
	arg_2_0.equipmentView:Find("Viewport/moudle_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = var_2_0 and 8 or 7
	arg_2_0.materialtView:Find("Viewport/item_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = var_2_0 and 8 or 7
	arg_2_0.itemUsagePanel = ItemUsagePanel.New(arg_2_0:findTF("adapt/item_usage_panel"), arg_2_0:findTF("adapt"))
	arg_2_0.itemResetPanel = ItemResetPanel.New(arg_2_0:findTF("adapt/reset_info_panel"), arg_2_0:findTF("adapt"))
	arg_2_0.assignedItemView = WorldAssignedItemView.New(arg_2_0:findTF("adapt"), arg_2_0.event)
	arg_2_0.itemCards = {}
	arg_2_0.equipmetItems = {}
	arg_2_0.materialCards = {}
	arg_2_0._itemToggle = arg_2_0:findTF("bottom_back/types/properties", arg_2_0.topItems)
	arg_2_0._weaponToggle = arg_2_0:findTF("bottom_back/types/siren_weapon", arg_2_0.topItems)
	arg_2_0._materialToggle = arg_2_0:findTF("bottom_back/types/material", arg_2_0.topItems)
	arg_2_0.exchangeTips = arg_2_0:findTF("bottom_back/reset_exchange", arg_2_0.topItems)
	arg_2_0.filterBusyToggle = arg_2_0:findTF("adapt/left_length/frame/toggle_equip", arg_2_0.blurPanel)
	arg_2_0.sortBtn = arg_2_0:findTF("adapt/top/buttons/sort_button", arg_2_0.blurPanel)
	arg_2_0.indexBtn = arg_2_0:findTF("adapt/top/buttons/index_button", arg_2_0.blurPanel)
	arg_2_0.decBtn = arg_2_0:findTF("adapt/top/buttons/dec_btn", arg_2_0.blurPanel)
	arg_2_0.upOrderTF = arg_2_0:findTF("asc", arg_2_0.decBtn)
	arg_2_0.downOrderTF = arg_2_0:findTF("desc", arg_2_0.decBtn)
	arg_2_0.sortPanel = arg_2_0:findTF("sort", arg_2_0.topItems)
	arg_2_0.sortContain = arg_2_0:findTF("adapt/mask/panel", arg_2_0.sortPanel)
	arg_2_0.sortTpl = arg_2_0:findTF("tpl", arg_2_0.sortContain)

	setActive(arg_2_0.sortTpl, false)
	arg_2_0:initData()
	arg_2_0:addListener()
	print(arg_2_0:findTF("bg").rect.width)
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:initItems()
	arg_4_0:initEquipments()
	arg_4_0:InitMaterials()
	setActive(arg_4_0._weaponToggle, true)
	setActive(arg_4_0._itemToggle, true)

	local var_4_0 = arg_4_0.contextData.pageNum

	arg_4_0.contextData.pageNum = nil

	if var_4_0 == var_0_0.PAGE.Property then
		triggerToggle(arg_4_0._itemToggle, true)
	elseif var_4_0 == var_0_0.PAGE.Equipment then
		triggerToggle(arg_4_0._weaponToggle, true)
	elseif var_4_0 == var_0_0.PAGE.Material then
		triggerToggle(arg_4_0._materialToggle, true)
	end

	if arg_4_0.contextData.equipScrollPos then
		arg_4_0:ScrollEquipPos(arg_4_0.contextData.equipScrollPos.y)
	end

	onButton(arg_4_0, arg_4_0.exchangeTips:Find("capcity"), function()
		arg_4_0:emit(var_0_0.ON_DROP, {
			type = DROP_TYPE_RESOURCE,
			id = WorldConst.ResourceID
		})
	end, SFX_PANEL)
	pg.UIMgr.GetInstance():OverlayPanel(arg_4_0._tf, {
		groupName = arg_4_0:getGroupNameFromData()
	})
end

function var_0_0.OverlayPanel(arg_6_0, arg_6_1)
	arg_6_0.overlayIndex = arg_6_0.overlayIndex or 0
	arg_6_0.overlayIndex = arg_6_0.overlayIndex + 1

	setParent(tf(arg_6_1), arg_6_0._tf.parent, false)
	tf(arg_6_1):SetSiblingIndex(arg_6_0._tf:GetSiblingIndex() + arg_6_0.overlayIndex)

	if arg_6_0:findTF("bg") then
		print(arg_6_0:findTF("bg").rect.width)
	end
end

function var_0_0.UnOverlayPanel(arg_7_0, arg_7_1, arg_7_2)
	setParent(tf(arg_7_1), arg_7_2, false)

	arg_7_0.overlayIndex = arg_7_0.overlayIndex or 0
	arg_7_0.overlayIndex = arg_7_0.overlayIndex - 1
	arg_7_0.overlayIndex = math.max(arg_7_0.overlayIndex, 0)

	if arg_7_0:findTF("bg") then
		print(arg_7_0:findTF("bg").rect.width)
	end
end

function var_0_0.onBackPressed(arg_8_0)
	print(arg_8_0:findTF("bg").rect.width)

	if isActive(arg_8_0.itemResetPanel._go) then
		arg_8_0.itemResetPanel:Close()
	elseif isActive(arg_8_0.itemUsagePanel._go) then
		arg_8_0.itemUsagePanel:Close()
	elseif arg_8_0.assignedItemView:isShowing() then
		arg_8_0.assignedItemView:Hide()
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		triggerButton(arg_8_0.backBtn)
	end
end

function var_0_0.willExit(arg_9_0)
	arg_9_0.assignedItemView:Destroy()
	arg_9_0.inventoryProxy:RemoveListener(WorldInventoryProxy.EventUpdateItem, arg_9_0.itemUpdateListenerFunc)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_9_0._tf)
end

function var_0_0.initData(arg_10_0)
	arg_10_0.contextData.pageNum = arg_10_0.contextData.pageNum or var_0_0.PAGE.Property
	arg_10_0.contextData.asc = arg_10_0.contextData.asc or false

	if not arg_10_0.contextData.sortData then
		arg_10_0.contextData.sortData = var_0_1.sort[1]
	end

	arg_10_0.contextData.indexDatas = arg_10_0.contextData.indexDatas or {}
	arg_10_0.isEquipingOn = false

	print(arg_10_0:findTF("bg").rect.width)
end

function var_0_0.GetShowBusyFlag(arg_11_0)
	return arg_11_0.isEquipingOn
end

function var_0_0.SetShowBusyFlag(arg_12_0, arg_12_1)
	arg_12_0.isEquipingOn = arg_12_1
end

function var_0_0.addListener(arg_13_0)
	onButton(arg_13_0, arg_13_0.backBtn, function()
		print(arg_13_0:findTF("bg").rect.width)
		arg_13_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0.decBtn, function()
		arg_13_0.contextData.asc = not arg_13_0.contextData.asc

		if arg_13_0.contextData.pageNum == var_0_0.PAGE.Equipment then
			arg_13_0:filterEquipment()
		end
	end, SFX_PANEL)

	arg_13_0.sortButtons = {}

	eachChild(arg_13_0.sortContain, function(arg_16_0)
		setActive(arg_16_0, false)
	end)

	for iter_13_0, iter_13_1 in ipairs(var_0_1.sort) do
		local var_13_0 = iter_13_0 <= arg_13_0.sortContain.childCount and arg_13_0.sortContain:GetChild(iter_13_0 - 1) or cloneTplTo(arg_13_0.sortTpl, arg_13_0.sortContain)

		setActive(var_13_0, true)
		setImageSprite(findTF(var_13_0, "Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", iter_13_1.spr), true)
		onToggle(arg_13_0, var_13_0, function(arg_17_0)
			if arg_17_0 then
				arg_13_0.contextData.sortData = iter_13_1

				arg_13_0:filterEquipment()
				triggerToggle(arg_13_0.sortBtn, false)
			end
		end, SFX_PANEL)

		arg_13_0.sortButtons[iter_13_0] = var_13_0
	end

	onToggle(arg_13_0, arg_13_0.sortBtn, function(arg_18_0)
		if arg_18_0 then
			arg_13_0:OverlayPanel(arg_13_0.sortPanel)
			setActive(arg_13_0.sortPanel, true)
		else
			arg_13_0:UnOverlayPanel(arg_13_0.sortPanel, arg_13_0.topItems)
			setActive(arg_13_0.sortPanel, false)
		end
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.sortPanel, function()
		triggerToggle(arg_13_0.sortBtn, false)
	end, SFX_PANEL)
	onToggle(arg_13_0, arg_13_0.filterBusyToggle, function(arg_20_0)
		arg_13_0:SetShowBusyFlag(arg_20_0)

		if arg_13_0.contextData.pageNum == var_0_0.PAGE.Equipment then
			arg_13_0:filterEquipment()
		end
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.indexBtn, function()
		local var_21_0 = {
			indexDatas = Clone(arg_13_0.contextData.indexDatas),
			customPanels = {
				minHeight = 650,
				typeIndex = {
					mode = CustomIndexLayer.Mode.OR,
					options = IndexConst.EquipmentTypeIndexs,
					names = IndexConst.EquipmentTypeNames
				},
				equipPropertyIndex = {
					mode = CustomIndexLayer.Mode.OR,
					options = IndexConst.EquipPropertyIndexs,
					names = IndexConst.EquipPropertyNames
				},
				equipPropertyIndex2 = {
					mode = CustomIndexLayer.Mode.OR,
					options = IndexConst.EquipPropertyIndexs,
					names = IndexConst.EquipPropertyNames
				},
				equipAmmoIndex1 = {
					mode = CustomIndexLayer.Mode.OR,
					options = IndexConst.EquipAmmoIndexs_1,
					names = IndexConst.EquipAmmoIndexs_1_Names
				},
				equipAmmoIndex2 = {
					mode = CustomIndexLayer.Mode.OR,
					options = IndexConst.EquipAmmoIndexs_2,
					names = IndexConst.EquipAmmoIndexs_2_Names
				},
				equipCampIndex = {
					mode = CustomIndexLayer.Mode.AND,
					options = IndexConst.EquipCampIndexs,
					names = IndexConst.EquipCampNames
				},
				rarityIndex = {
					mode = CustomIndexLayer.Mode.AND,
					options = IndexConst.EquipmentRarityIndexs,
					names = IndexConst.RarityNames
				},
				extraIndex = {
					mode = CustomIndexLayer.Mode.OR,
					options = IndexConst.EquipmentExtraIndexs,
					names = IndexConst.EquipmentExtraNames
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
					dropdown = true,
					titleTxt = "indexsort_index",
					titleENTxt = "indexsort_indexeng",
					tags = {
						"equipPropertyIndex",
						"equipPropertyIndex2",
						"equipAmmoIndex1",
						"equipAmmoIndex2"
					}
				},
				{
					dropdown = false,
					titleTxt = "indexsort_camp",
					titleENTxt = "indexsort_campeng",
					tags = {
						"equipCampIndex"
					}
				},
				{
					dropdown = false,
					titleTxt = "indexsort_rarity",
					titleENTxt = "indexsort_rarityeng",
					tags = {
						"rarityIndex"
					}
				},
				{
					dropdown = false,
					titleTxt = "indexsort_extraindex",
					titleENTxt = "indexsort_indexeng",
					tags = {
						"extraIndex"
					}
				}
			},
			dropdownLimit = {
				equipPropertyIndex = {
					include = {
						typeIndex = IndexConst.EquipmentTypeAll
					},
					exclude = {}
				},
				equipPropertyIndex2 = {
					include = {
						typeIndex = IndexConst.EquipmentTypeEquip
					},
					exclude = {
						typeIndex = IndexConst.EquipmentTypeAll
					}
				},
				equipAmmoIndex1 = {
					include = {
						typeIndex = IndexConst.BitAll({
							IndexConst.EquipmentTypeSmallCannon,
							IndexConst.EquipmentTypeMediumCannon,
							IndexConst.EquipmentTypeBigCannon
						})
					},
					exclude = {
						typeIndex = IndexConst.EquipmentTypeAll
					}
				},
				equipAmmoIndex2 = {
					include = {
						typeIndex = IndexConst.BitAll({
							IndexConst.EquipmentTypeWarshipTorpedo,
							IndexConst.EquipmentTypeSubmaraineTorpedo
						})
					},
					exclude = {
						typeIndex = IndexConst.EquipmentTypeAll
					}
				}
			},
			callback = function(arg_22_0)
				arg_13_0.contextData.indexDatas.typeIndex = arg_22_0.typeIndex
				arg_13_0.contextData.indexDatas.equipPropertyIndex = arg_22_0.equipPropertyIndex
				arg_13_0.contextData.indexDatas.equipPropertyIndex2 = arg_22_0.equipPropertyIndex2
				arg_13_0.contextData.indexDatas.equipAmmoIndex1 = arg_22_0.equipAmmoIndex1
				arg_13_0.contextData.indexDatas.equipAmmoIndex2 = arg_22_0.equipAmmoIndex2
				arg_13_0.contextData.indexDatas.equipCampIndex = arg_22_0.equipCampIndex
				arg_13_0.contextData.indexDatas.rarityIndex = arg_22_0.rarityIndex
				arg_13_0.contextData.indexDatas.extraIndex = arg_22_0.extraIndex

				if arg_13_0.filterBusyToggle:GetComponent(typeof(Toggle)) then
					if bit.band(arg_22_0.extraIndex, IndexConst.EquipmentExtraEquiping) > 0 then
						arg_13_0:SetShowBusyFlag(true)
					end

					triggerToggle(arg_13_0.filterBusyToggle, arg_13_0:GetShowBusyFlag())
				else
					arg_13_0:filterEquipment()
				end
			end
		}

		arg_13_0:emit(WorldInventoryMediator.OPEN_EQUIPMENT_INDEX, var_21_0)
	end, SFX_PANEL)
	onToggle(arg_13_0, arg_13_0._itemToggle, function(arg_23_0)
		if arg_23_0 and arg_13_0.contextData.pageNum ~= var_0_0.PAGE.Property then
			arg_13_0.contextData.pageNum = var_0_0.PAGE.Property

			arg_13_0:activeResetExchange(arg_13_0.contextData.pageNum == var_0_0.PAGE.Property)
			arg_13_0:sortItems()
		end
	end, SFX_PANEL)
	onToggle(arg_13_0, arg_13_0._weaponToggle, function(arg_24_0)
		if arg_24_0 and arg_13_0.contextData.pageNum ~= var_0_0.PAGE.Equipment then
			arg_13_0.contextData.pageNum = var_0_0.PAGE.Equipment

			arg_13_0:activeResetExchange(arg_13_0.contextData.pageNum == var_0_0.PAGE.Property)
			arg_13_0:filterEquipment()
		end
	end, SFX_PANEL)
	onToggle(arg_13_0, arg_13_0._materialToggle, function(arg_25_0)
		if arg_25_0 and arg_13_0.contextData.pageNum ~= var_0_0.PAGE.Material then
			arg_13_0.contextData.pageNum = var_0_0.PAGE.Material

			arg_13_0:activeResetExchange(arg_13_0.contextData.pageNum == var_0_0.PAGE.Property)
			arg_13_0:SortMaterials()
		end
	end, SFX_PANEL)
end

function var_0_0.setWorldFleet(arg_26_0, arg_26_1)
	arg_26_0.worldFleetList = arg_26_1
end

function var_0_0.setInventoryProxy(arg_27_0, arg_27_1)
	arg_27_0.inventoryProxy = arg_27_1

	arg_27_0.inventoryProxy:AddListener(WorldInventoryProxy.EventUpdateItem, arg_27_0.itemUpdateListenerFunc)
	arg_27_0:setItemList(arg_27_0.inventoryProxy:GetItemList())
end

function var_0_0.setItemList(arg_28_0, arg_28_1)
	arg_28_0.itemList = arg_28_1

	if arg_28_0.isInitItems then
		arg_28_0:sortItems()
	end
end

function var_0_0.initItems(arg_29_0)
	arg_29_0.isInitItems = true
	arg_29_0.itemRect = arg_29_0.itemView:GetComponent("LScrollRect")

	function arg_29_0.itemRect.onInitItem(arg_30_0)
		arg_29_0:initItem(arg_30_0)
	end

	function arg_29_0.itemRect.onUpdateItem(arg_31_0, arg_31_1)
		arg_29_0:updateItem(arg_31_0, arg_31_1)
	end

	function arg_29_0.itemRect.onReturnItem(arg_32_0, arg_32_1)
		arg_29_0:returnItem(arg_32_0, arg_32_1)
	end
end

function var_0_0.initItem(arg_33_0, arg_33_1)
	local var_33_0 = WSInventoryItem.New(arg_33_1)

	onButton(arg_33_0, var_33_0.go, function()
		local var_34_0 = var_33_0.itemVO:getWorldItemType()

		if var_34_0 == WorldItem.UsageBuff or var_34_0 == WorldItem.UsageHPRegenerate or var_34_0 == WorldItem.UsageHPRegenerateValue then
			arg_33_0:emit(WorldInventoryMediator.OnOpenAllocateLayer, {
				itemVO = var_33_0.itemVO,
				fleetList = arg_33_0.worldFleetList,
				fleetIndex = arg_33_0.contextData.currentFleetIndex,
				confirmCallback = function(arg_35_0, arg_35_1)
					arg_33_0:emit(WorldInventoryMediator.OnUseItem, arg_35_0, 1, arg_35_1)
				end,
				onResetInfo = function(arg_36_0)
					arg_33_0.itemResetPanel:Open(arg_36_0)
				end
			})
		elseif var_34_0 == WorldItem.UsageWorldMap then
			arg_33_0.itemUsagePanel:Open({
				item = var_33_0.itemVO,
				mode = ItemUsagePanel.SEE,
				onUse = function()
					arg_33_0:PlayOpenBox(var_33_0.itemVO:getWorldItemOpenDisplay(), function()
						arg_33_0:emit(WorldInventoryMediator.OnMap, var_33_0.itemVO.id)
						arg_33_0:closeView()
					end)
				end,
				onResetInfo = function(arg_39_0)
					arg_33_0.itemResetPanel:Open(arg_39_0)
				end
			})
		elseif var_34_0 == WorldItem.UsageDrop or var_34_0 == WorldItem.UsageRecoverAp or var_34_0 == WorldItem.UsageWorldItem or var_34_0 == WorldItem.UsageWorldBuff then
			arg_33_0.itemUsagePanel:Open({
				item = var_33_0.itemVO,
				mode = ItemUsagePanel.BATCH,
				onUseBatch = function(arg_40_0)
					arg_33_0:emit(WorldInventoryMediator.OnUseItem, var_33_0.itemVO.id, arg_40_0, {})
				end,
				onUseOne = function()
					arg_33_0:emit(WorldInventoryMediator.OnUseItem, var_33_0.itemVO.id, 1, {})
				end,
				onResetInfo = function(arg_42_0)
					arg_33_0.itemResetPanel:Open(arg_42_0)
				end
			})
		elseif var_34_0 == WorldItem.UsageLoot then
			arg_33_0.itemUsagePanel:Open({
				item = var_33_0.itemVO,
				mode = ItemUsagePanel.INFO,
				onResetInfo = function(arg_43_0)
					arg_33_0.itemResetPanel:Open(arg_43_0)
				end
			})
		elseif var_34_0 == WorldItem.UsageWorldClean or var_34_0 == WorldItem.UsageWorldFlag then
			arg_33_0.itemUsagePanel:Open({
				item = var_33_0.itemVO,
				onUse = function()
					arg_33_0:emit(WorldInventoryMediator.OnUseItem, var_33_0.itemVO.id, 1, {})
				end,
				onResetInfo = function(arg_45_0)
					arg_33_0.itemResetPanel:Open(arg_45_0)
				end
			})
		elseif var_34_0 == WorldItem.UsageDropAppointed then
			arg_33_0.assignedItemView:Load()
			arg_33_0.assignedItemView:ActionInvoke("update", var_33_0.itemVO)
			arg_33_0.assignedItemView:ActionInvoke("Show")
		end
	end, SFX_PANEL)

	arg_33_0.itemCards[arg_33_1] = var_33_0
end

function var_0_0.updateItem(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = arg_46_0.itemCards[arg_46_2]

	if not var_46_0 then
		arg_46_0:initItem(arg_46_2)

		var_46_0 = arg_46_0.itemCards[arg_46_2]
	end

	local var_46_1 = arg_46_0.itemList[arg_46_1 + 1]

	var_46_0:update(var_46_1)
end

function var_0_0.returnItem(arg_47_0, arg_47_1, arg_47_2)
	if arg_47_0.exited then
		return
	end

	local var_47_0 = arg_47_0.itemCards[arg_47_2]

	if var_47_0 then
		var_47_0:clear()
	end
end

function var_0_0.sortItems(arg_48_0)
	table.sort(arg_48_0.itemList, CompareFuncs({
		function(arg_49_0)
			return -arg_49_0:getConfig("sort_priority")
		end,
		function(arg_50_0)
			return arg_50_0:getConfig("id")
		end
	}))
	arg_48_0.itemRect:SetTotalCount(#arg_48_0.itemList, -1)
	arg_48_0:updateResetExchange()
end

function var_0_0.updateResetExchange(arg_51_0)
	local var_51_0 = arg_51_0.inventoryProxy:CalcResetExchangeResource()

	setText(arg_51_0.exchangeTips:Find("capcity/Text"), defaultValue(checkExist(var_51_0, {
		DROP_TYPE_RESOURCE
	}, {
		WorldConst.ResourceID
	}), 0))
end

function var_0_0.activeResetExchange(arg_52_0, arg_52_1)
	local var_52_0 = nowWorld():IsSystemOpen(WorldConst.SystemResetExchange)

	setActive(arg_52_0.exchangeTips, var_52_0 and arg_52_1)
end

function var_0_0.PlayOpenBox(arg_53_0, arg_53_1, arg_53_2)
	if not arg_53_1 or arg_53_1 == "" then
		arg_53_2()

		return
	end

	local function var_53_0()
		if arg_53_0.playing or not arg_53_0[arg_53_1] then
			return
		end

		arg_53_0.playing = true

		arg_53_0[arg_53_1]:SetActive(true)

		local var_54_0 = tf(arg_53_0[arg_53_1])

		var_54_0:SetParent(arg_53_0:findTF("adapt"), false)
		var_54_0:SetAsLastSibling()

		local var_54_1 = var_54_0:GetComponent("DftAniEvent")

		var_54_1:SetTriggerEvent(function(arg_55_0)
			arg_53_2()
		end)
		var_54_1:SetEndEvent(function(arg_56_0)
			if arg_53_0[arg_53_1] then
				SetActive(arg_53_0[arg_53_1], false)

				arg_53_0.playing = false
			end
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_EQUIPMENT_OPEN)
	end

	local var_53_1 = arg_53_0:findTF(arg_53_1 .. "(Clone)")

	if var_53_1 then
		arg_53_0[arg_53_1] = go(var_53_1)
	end

	if not arg_53_0[arg_53_1] then
		PoolMgr.GetInstance():GetPrefab("ui/" .. string.lower(arg_53_1), "", true, function(arg_57_0)
			arg_57_0:SetActive(true)

			arg_53_0[arg_53_1] = arg_57_0

			var_53_0()
		end)
	else
		var_53_0()
	end
end

function var_0_0.setEquipments(arg_58_0, arg_58_1)
	arg_58_0.equipmentVOs = arg_58_1
end

function var_0_0.setEquipment(arg_59_0, arg_59_1)
	local var_59_0 = #arg_59_0.equipmentVOs + 1

	for iter_59_0, iter_59_1 in ipairs(arg_59_0.equipmentVOs) do
		if not iter_59_1.shipId and iter_59_1.id == arg_59_1.id then
			var_59_0 = iter_59_0

			break
		end
	end

	if arg_59_1.count > 0 then
		arg_59_0.equipmentVOs[var_59_0] = arg_59_1
	else
		table.remove(arg_59_0.equipmentVOs, var_59_0)
	end

	if arg_59_0.contextData.pageNum == var_0_0.PAGE.Equipment then
		arg_59_0:filterEquipment()
	end
end

function var_0_0.initEquipments(arg_60_0)
	arg_60_0.isInitWeapons = true
	arg_60_0.equipmentRect = arg_60_0.equipmentView:GetComponent("LScrollRect")

	function arg_60_0.equipmentRect.onInitItem(arg_61_0)
		arg_60_0:initEquipment(arg_61_0)
	end

	function arg_60_0.equipmentRect.onUpdateItem(arg_62_0, arg_62_1)
		arg_60_0:updateEquipment(arg_62_0, arg_62_1)
	end

	function arg_60_0.equipmentRect.onReturnItem(arg_63_0, arg_63_1)
		arg_60_0:returnEquipment(arg_63_0, arg_63_1)
	end

	arg_60_0.equipmentRect.decelerationRate = 0.07
end

function var_0_0.initEquipment(arg_64_0, arg_64_1)
	local var_64_0 = EquipmentItem.New(arg_64_1)

	onButton(arg_64_0, var_64_0.go, function()
		if arg_64_0.equipmentRect.GetContentAnchoredPositionOriginal then
			arg_64_0.contextData.equipScrollPos = arg_64_0.equipmentRect:GetContentAnchoredPositionOriginal()
		end

		if var_64_0.equipmentVO == nil or var_64_0.equipmentVO.mask then
			return
		end

		local var_65_0 = arg_64_0.shipVO and {
			type = EquipmentInfoMediator.TYPE_REPLACE,
			equipmentId = var_64_0.equipmentVO.id,
			shipId = arg_64_0.contextData.shipId,
			pos = arg_64_0.contextData.pos,
			oldShipId = var_64_0.equipmentVO.shipId,
			oldPos = var_64_0.equipmentVO.shipPos
		} or var_64_0.equipmentVO.shipId and {
			type = EquipmentInfoMediator.TYPE_DISPLAY,
			equipmentId = var_64_0.equipmentVO.id,
			shipId = var_64_0.equipmentVO.shipId,
			pos = var_64_0.equipmentVO.shipPos
		} or {
			destroy = true,
			type = EquipmentInfoMediator.TYPE_DEFAULT,
			equipmentId = var_64_0.equipmentVO.id
		}

		arg_64_0:emit(var_0_0.ON_EQUIPMENT, var_65_0)
	end, SFX_PANEL)

	arg_64_0.equipmetItems[arg_64_1] = var_64_0
end

function var_0_0.updateEquipment(arg_66_0, arg_66_1, arg_66_2)
	local var_66_0 = arg_66_0.equipmetItems[arg_66_2]

	if not var_66_0 then
		arg_66_0:initEquipment(arg_66_2)

		var_66_0 = arg_66_0.equipmetItems[arg_66_2]
	end

	local var_66_1 = arg_66_0.loadEquipmentVOs[arg_66_1 + 1]

	var_66_0:update(var_66_1)
end

function var_0_0.returnEquipment(arg_67_0, arg_67_1, arg_67_2)
	if arg_67_0.exited then
		return
	end

	local var_67_0 = arg_67_0.equipmetItems[arg_67_2]

	if var_67_0 then
		var_67_0:clear()
	end
end

function var_0_0.filterEquipment(arg_68_0)
	local var_68_0 = arg_68_0.contextData.sortData

	arg_68_0.loadEquipmentVOs = arg_68_0.loadEquipmentVOs or {}

	table.clean(arg_68_0.loadEquipmentVOs)

	local var_68_1 = arg_68_0.loadEquipmentVOs
	local var_68_2 = {
		arg_68_0.contextData.indexDatas.equipPropertyIndex,
		arg_68_0.contextData.indexDatas.equipPropertyIndex2
	}

	for iter_68_0, iter_68_1 in pairs(arg_68_0.equipmentVOs) do
		if (not iter_68_1.shipId or arg_68_0:GetShowBusyFlag()) and not iter_68_1.isSkin and IndexConst.filterEquipByType(iter_68_1, arg_68_0.contextData.indexDatas.typeIndex) and IndexConst.filterEquipByProperty(iter_68_1, var_68_2) and IndexConst.filterEquipAmmo1(iter_68_1, arg_68_0.contextData.indexDatas.equipAmmoIndex1) and IndexConst.filterEquipAmmo2(iter_68_1, arg_68_0.contextData.indexDatas.equipAmmoIndex2) and IndexConst.filterEquipByCamp(iter_68_1, arg_68_0.contextData.indexDatas.equipCampIndex) and IndexConst.filterEquipByRarity(iter_68_1, arg_68_0.contextData.indexDatas.rarityIndex) and IndexConst.filterEquipByExtra(iter_68_1, arg_68_0.contextData.indexDatas.extraIndex) then
			table.insert(arg_68_0.loadEquipmentVOs, iter_68_1)
		end
	end

	if var_68_0 then
		local var_68_3 = arg_68_0.contextData.asc

		table.sort(var_68_1, CompareFuncs(var_0_1.sortFunc(var_68_0, var_68_3)))
	end

	arg_68_0:updateEquipmentCount()
	setImageSprite(arg_68_0:findTF("Image", arg_68_0.sortBtn), GetSpriteFromAtlas("ui/equipmentui_atlas", var_68_0.spr), true)
	setActive(arg_68_0.downOrderTF, not arg_68_0.contextData.asc)
	setActive(arg_68_0.upOrderTF, arg_68_0.contextData.asc)
end

function var_0_0.updateEquipmentCount(arg_69_0, arg_69_1)
	arg_69_0.equipmentRect:SetTotalCount(arg_69_1 or #arg_69_0.loadEquipmentVOs, -1)
	Canvas.ForceUpdateCanvases()
end

function var_0_0.Scroll2Equip(arg_70_0, arg_70_1)
	if arg_70_0.contextData.pageNum ~= var_0_0.PAGE.Equipment then
		return
	end

	for iter_70_0, iter_70_1 in ipairs(arg_70_0.loadEquipmentVOs) do
		if EquipmentProxy.SameEquip(iter_70_1, arg_70_1) then
			local var_70_0 = arg_70_0.equipmentView:Find("Viewport/moudle_grid"):GetComponent(typeof(GridLayoutGroup))
			local var_70_1 = (var_70_0.cellSize.y + var_70_0.spacing.y) * math.floor((iter_70_0 - 1) / var_70_0.constraintCount) + arg_70_0.equipmentRect.paddingFront + arg_70_0.equipmentView.rect.height * 0.5

			arg_70_0:ScrollEquipPos(var_70_1 - arg_70_0.equipmentRect.paddingFront)

			break
		end
	end
end

function var_0_0.ScrollEquipPos(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0.equipmentView:Find("Viewport/moudle_grid"):GetComponent(typeof(GridLayoutGroup))
	local var_71_1 = (var_71_0.cellSize.y + var_71_0.spacing.y) * math.ceil(#arg_71_0.loadEquipmentVOs / var_71_0.constraintCount) - var_71_0.spacing.y + arg_71_0.equipmentRect.paddingFront + arg_71_0.equipmentRect.paddingEnd
	local var_71_2 = var_71_1 - arg_71_0.equipmentView.rect.height

	var_71_2 = var_71_2 > 0 and var_71_2 or var_71_1

	local var_71_3 = (arg_71_1 - arg_71_0.equipmentView.rect.height * 0.5) / var_71_2

	arg_71_0.equipmentRect:ScrollTo(var_71_3)
end

function var_0_0.SetMaterials(arg_72_0, arg_72_1)
	arg_72_0.materials = arg_72_1

	if arg_72_0.isInitMaterials and arg_72_0.contextData.pageNum == var_0_0.PAGE.Material then
		arg_72_0:SortMaterials()
	end
end

function var_0_0.InitMaterials(arg_73_0)
	arg_73_0.isInitMaterials = true
	arg_73_0.materialRect = arg_73_0.materialtView:GetComponent("LScrollRect")

	function arg_73_0.materialRect.onInitItem(arg_74_0)
		arg_73_0:InitMaterial(arg_74_0)
	end

	function arg_73_0.materialRect.onUpdateItem(arg_75_0, arg_75_1)
		arg_73_0:UpdateMaterial(arg_75_0, arg_75_1)
	end

	function arg_73_0.materialRect.onReturnItem(arg_76_0, arg_76_1)
		arg_73_0:ReturnMaterial(arg_76_0, arg_76_1)
	end

	arg_73_0.materialRect.decelerationRate = 0.07
end

function var_0_0.SortMaterials(arg_77_0)
	table.sort(arg_77_0.materials, CompareFuncs({
		function(arg_78_0)
			return -arg_78_0:getConfig("rarity")
		end,
		function(arg_79_0)
			return arg_79_0.id
		end
	}))
	arg_77_0.materialRect:SetTotalCount(#arg_77_0.materials, -1)
	Canvas.ForceUpdateCanvases()
end

function var_0_0.InitMaterial(arg_80_0, arg_80_1)
	local var_80_0 = ItemCard.New(arg_80_1)

	onButton(arg_80_0, var_80_0.go, function()
		if var_80_0.itemVO == nil then
			return
		end

		if var_80_0.itemVO:getConfig("type") == Item.INVITATION_TYPE then
			arg_80_0:emit(EquipmentMediator.ITEM_GO_SCENE, SCENE.INVITATION, {
				itemVO = var_80_0.itemVO
			})
		else
			arg_80_0:emit(var_0_0.ON_ITEM, var_80_0.itemVO.id)
		end
	end, SFX_PANEL)

	arg_80_0.materialCards[arg_80_1] = var_80_0
end

function var_0_0.UpdateMaterial(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = arg_82_0.materialCards[arg_82_2]

	if not var_82_0 then
		arg_82_0:initItem(arg_82_2)

		var_82_0 = arg_82_0.materialCards[arg_82_2]
	end

	local var_82_1 = arg_82_0.materials[arg_82_1 + 1]

	var_82_0:update(var_82_1)
end

function var_0_0.ReturnMaterial(arg_83_0, arg_83_1, arg_83_2)
	if arg_83_0.exited then
		return
	end

	local var_83_0 = arg_83_0.materialCards[arg_83_2]

	if var_83_0 then
		var_83_0:clear()
	end
end

return var_0_0
