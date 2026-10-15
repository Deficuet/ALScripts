local var_0_0 = class("SpWeaponDesignLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "SpWeaponDesignUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/SpWeaponDesignUI",
		"bg/equipment_bg_1",
		"bg/equipment_bg_2",
		"bg/equipment_bg_3",
		"bg/equipment_bg_4",
		"bg/equipment_bg_5",
		"bg/equipment_bg_6",
		"ui/equipmentdesignui_atlas",
		"ui/share/index_atlas",
		"weaponframes"
	}
	local var_2_1 = {}

	_.each(pg.spweapon_data_statistics.all, function(arg_3_0)
		local var_3_0 = SpWeapon.New({
			id = arg_3_0
		})

		if var_3_0:IsCraftable() then
			local var_3_1 = var_3_0:GetIconPath()

			table.insert(var_2_1, var_3_1)
		end
	end)

	return ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_2_0), var_2_0, var_2_1)
end

function var_0_0.SetCraftList(arg_4_0, arg_4_1)
	arg_4_0.craftList = arg_4_1
end

function var_0_0.SetSpWeapons(arg_5_0, arg_5_1)
	assert(arg_5_0.craftList)

	if arg_5_0.craftList then
		_.each(arg_5_0.craftList, function(arg_6_0)
			arg_6_0.owned = arg_6_0:IsUnique() and table.Find(arg_5_1, function(arg_7_0, arg_7_1)
				return arg_7_1:GetOriginID() == arg_6_0:GetConfigID()
			end) and true or false
		end)
	end
end

function var_0_0.setItems(arg_8_0, arg_8_1)
	arg_8_0.itemVOs = arg_8_1
end

function var_0_0.setPlayer(arg_9_0, arg_9_1)
	arg_9_0.player = arg_9_1
end

function var_0_0.init(arg_10_0)
	arg_10_0.designScrollView = arg_10_0._tf:Find("equipment_scrollview")
	arg_10_0.equipmentTpl = arg_10_0._tf:Find("Template")

	setActive(arg_10_0.equipmentTpl, false)

	arg_10_0.equipmentContainer = arg_10_0.designScrollView:Find("equipment_grid")

	local var_10_0

	if NotchAdapt.CheckNotchRatio == 2 or not getProxy(SettingsProxy):CheckLargeScreen() then
		var_10_0 = arg_10_0.designScrollView.rect.width > 2000
	else
		var_10_0 = NotchAdapt.CheckNotchRatio >= 2
	end

	arg_10_0.equipmentContainer:GetComponent(typeof(GridLayoutGroup)).constraintCount = var_10_0 and 8 or 7
	arg_10_0.top = arg_10_0._tf:Find("top")
	arg_10_0.toggleOwned = arg_10_0._tf:Find("toggle_owned")
	arg_10_0.sortBtn = arg_10_0.top:Find("sort_button")
	arg_10_0.indexBtn = arg_10_0.top:Find("index_button")
	arg_10_0.decBtn = arg_10_0.sortBtn:Find("dec_btn")
	arg_10_0.sortImgAsc = arg_10_0.decBtn:Find("desc")
	arg_10_0.sortImgDec = arg_10_0.decBtn:Find("asc")
	arg_10_0.indexPanel = arg_10_0._tf:Find("index")
	arg_10_0.tagContainer = arg_10_0.indexPanel:Find("adapt/mask/panel")
	arg_10_0.tagTpl = arg_10_0.tagContainer:Find("tpl")
	arg_10_0.listEmptyTF = arg_10_0._tf:Find("empty")

	setActive(arg_10_0.listEmptyTF, false)

	arg_10_0.listEmptyTxt = arg_10_0.listEmptyTF:Find("Text")

	setText(arg_10_0.listEmptyTxt, i18n("list_empty_tip_equipmentdesignui"))
	arg_10_0:OverlayPanel(arg_10_0.indexPanel)
end

function var_0_0.SetParentTF(arg_11_0, arg_11_1)
	arg_11_0.parentTF = arg_11_1
	arg_11_0.equipmentView = arg_11_0.parentTF:Find("adapt/equipment_scrollview")

	setActive(arg_11_0.equipmentView, false)
end

function var_0_0.SetTopContainer(arg_12_0, arg_12_1)
	arg_12_0.topPanel = arg_12_1
end

function var_0_0.SetTopItems(arg_13_0, arg_13_1)
	arg_13_0.topItems = arg_13_1
end

local var_0_1 = {
	"sort_rarity"
}

function var_0_0.didEnter(arg_14_0)
	setParent(arg_14_0._tf, arg_14_0.parentTF)

	local var_14_0 = arg_14_0.equipmentView:GetSiblingIndex()

	arg_14_0._tf:SetSiblingIndex(var_14_0)

	arg_14_0.contextData.indexDatas = arg_14_0.contextData.indexDatas or {}
	arg_14_0.contextData.index = arg_14_0.contextData.index or 1

	setParent(arg_14_0.top, arg_14_0.topPanel)
	setParent(arg_14_0.toggleOwned, arg_14_0.topItems:Find("adapt/bottom_back"))
	arg_14_0:initDesigns()
	onToggle(arg_14_0, arg_14_0.sortBtn, function(arg_15_0)
		setActive(arg_14_0.indexPanel, arg_15_0)
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.indexPanel, function()
		triggerToggle(arg_14_0.sortBtn, false)
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.indexBtn, function()
		local var_17_0 = {
			indexDatas = Clone(arg_14_0.contextData.indexDatas),
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
			callback = function(arg_18_0)
				if not isActive(arg_14_0._tf) then
					return
				end

				arg_14_0.contextData.indexDatas.typeIndex = arg_18_0.typeIndex
				arg_14_0.contextData.indexDatas.rarityIndex = arg_18_0.rarityIndex

				arg_14_0:filter()
			end
		}

		arg_14_0:emit(SpWeaponDesignMediator.OPEN_EQUIPMENTDESIGN_INDEX, var_17_0)
	end, SFX_PANEL)

	arg_14_0.contextData.showOwned = defaultValue(arg_14_0.contextData.showOwned, false)

	triggerToggle(arg_14_0.toggleOwned, arg_14_0.contextData.showOwned)
	onToggle(arg_14_0, arg_14_0.toggleOwned, function(arg_19_0)
		arg_14_0.contextData.showOwned = arg_19_0

		arg_14_0:filter()
	end)
	arg_14_0:initTags()
end

function var_0_0.isDefaultStatus(arg_20_0)
	return (not arg_20_0.contextData.indexDatas.typeIndex or arg_20_0.contextData.indexDatas.typeIndex == IndexConst.SpWeaponTypeAll) and (not arg_20_0.contextData.indexDatas.rarityIndex or arg_20_0.contextData.indexDatas.rarityIndex == IndexConst.SpWeaponRarityAll)
end

function var_0_0.initTags(arg_21_0)
	onButton(arg_21_0, arg_21_0.decBtn, function()
		arg_21_0.contextData.asc = not arg_21_0.contextData.asc

		arg_21_0:filter()
	end)

	arg_21_0.tagTFs = {}

	eachChild(arg_21_0.tagContainer, function(arg_23_0)
		setActive(arg_23_0, false)
	end)

	for iter_21_0, iter_21_1 in ipairs(var_0_1) do
		local var_21_0 = iter_21_0 <= arg_21_0.tagContainer.childCount and arg_21_0.tagContainer:GetChild(iter_21_0 - 1) or cloneTplTo(arg_21_0.tagTpl, arg_21_0.tagContainer)

		setActive(var_21_0, true)
		setImageSprite(findTF(var_21_0, "Image"), GetSpriteFromAtlas("ui/equipmentdesignui_atlas", iter_21_1))
		onToggle(arg_21_0, var_21_0, function(arg_24_0)
			if arg_24_0 then
				arg_21_0.contextData.index = iter_21_0

				arg_21_0:filter()
			end

			triggerButton(arg_21_0.indexPanel)
		end, SFX_PANEL)
		table.insert(arg_21_0.tagTFs, var_21_0)
	end

	triggerToggle(arg_21_0.tagTFs[arg_21_0.contextData.index], true)
end

function var_0_0.initDesigns(arg_25_0)
	arg_25_0.scollRect = arg_25_0.designScrollView:GetComponent("LScrollRect")
	arg_25_0.scollRect.decelerationRate = 0.07

	function arg_25_0.scollRect.onInitItem(arg_26_0)
		arg_25_0:initDesign(arg_26_0)
	end

	function arg_25_0.scollRect.onUpdateItem(arg_27_0, arg_27_1)
		arg_25_0:updateDesign(arg_27_0, arg_27_1)
	end

	function arg_25_0.scollRect.onReturnItem(arg_28_0, arg_28_1)
		arg_25_0:returnDesign(arg_28_0, arg_28_1)
	end

	arg_25_0.desgins = {}
end

function var_0_0.initDesign(arg_29_0, arg_29_1)
	local var_29_0 = SpWeaponItemView.New(arg_29_1)

	onButton(arg_29_0, var_29_0.go, function()
		arg_29_0:emit(SpWeaponDesignMediator.ON_COMPOSITE, var_29_0.spWeaponVO:GetConfigID())
	end)

	arg_29_0.desgins[arg_29_1] = var_29_0
end

function var_0_0.updateDesign(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_0.desgins[arg_31_2]

	if not var_31_0 then
		arg_31_0:initDesign(arg_31_2)

		var_31_0 = arg_31_0.desgins[arg_31_2]
	end

	local var_31_1 = arg_31_0.filterCraftList[arg_31_1 + 1]

	var_31_0:update(var_31_1)
end

function var_0_0.returnDesign(arg_32_0, arg_32_1, arg_32_2)
	if arg_32_0.exited then
		return
	end

	local var_32_0 = arg_32_0.desgins[arg_32_2]

	if var_32_0 then
		var_32_0:clear()
	end
end

function var_0_0.getDesignVO(arg_33_0, arg_33_1)
	return arg_33_1
end

local var_0_2 = require("view.equipment.SpWeaponSortCfg")

function var_0_0.filter(arg_34_0)
	local var_34_0 = arg_34_0:isDefaultStatus() and "shaixuan_off" or "shaixuan_on"

	GetSpriteFromAtlasAsync("ui/share/index_atlas", var_34_0, function(arg_35_0)
		setImageSprite(arg_34_0.indexBtn, arg_35_0, true)
	end)

	local var_34_1 = {}

	for iter_34_0, iter_34_1 in pairs(arg_34_0.craftList) do
		if IndexConst.filterSpWeaponByType(iter_34_1, arg_34_0.contextData.indexDatas.typeIndex) and IndexConst.filterSpWeaponByRarity(iter_34_1, arg_34_0.contextData.indexDatas.rarityIndex) and (arg_34_0.contextData.showOwned or not iter_34_1.owned) then
			table.insert(var_34_1, iter_34_1)
		end
	end

	local var_34_2 = arg_34_0.contextData.asc
	local var_34_3 = arg_34_0.contextData.index or 1

	table.sort(var_34_1, CompareFuncs(var_0_2.sortFunc(var_0_2.sort[1], var_34_2)))

	arg_34_0.filterCraftList = var_34_1

	arg_34_0:UpdateCraftList()

	local var_34_4 = GetSpriteFromAtlas("ui/equipmentdesignui_atlas", var_0_1[var_34_3])

	setImageSprite(arg_34_0.sortBtn:Find("Image"), var_34_4)
	setActive(arg_34_0.sortImgAsc, arg_34_0.contextData.asc)
	setActive(arg_34_0.sortImgDec, not arg_34_0.contextData.asc)
end

function var_0_0.UpdateCraftList(arg_36_0)
	arg_36_0.scollRect:SetTotalCount(#arg_36_0.filterCraftList)
	setActive(arg_36_0.listEmptyTF, #arg_36_0.filterCraftList <= 0)
	Canvas.ForceUpdateCanvases()
end

function var_0_0.onBackPressed(arg_37_0)
	if isActive(arg_37_0.indexPanel) then
		triggerButton(arg_37_0.indexPanel)

		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	arg_37_0:emit(var_0_0.ON_BACK)
end

function var_0_0.willExit(arg_38_0)
	arg_38_0:UnOverlayPanel(arg_38_0.indexPanel, arg_38_0._tf)
	setParent(arg_38_0.toggleOwned, arg_38_0._tf)
	setParent(arg_38_0.top, arg_38_0._tf)
end

return var_0_0
