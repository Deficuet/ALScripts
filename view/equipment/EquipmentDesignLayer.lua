local var_0_0 = class("EquipmentDesignLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EquipmentDesignUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/equipmentdesignui",
		"ui/equipmentdesignui_atlas",
		"ui/equipmenttransformui_atlas",
		"equiptype",
		"bg/equipment_bg_1",
		"bg/equipment_bg_2",
		"bg/equipment_bg_3",
		"bg/equipment_bg_4",
		"bg/equipment_bg_5",
		"bg/equipment_bg_6"
	}

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))

	return var_2_0
end

function var_0_0.setItems(arg_3_0, arg_3_1)
	arg_3_0.itemVOs = arg_3_1
end

function var_0_0.setPlayer(arg_4_0, arg_4_1)
	arg_4_0.player = arg_4_1
end

function var_0_0.setCapacity(arg_5_0, arg_5_1)
	arg_5_0.capacity = arg_5_1
end

function var_0_0.init(arg_6_0)
	arg_6_0.designScrollView = arg_6_0._tf:Find("equipment_scrollview")
	arg_6_0.equipmentTpl = arg_6_0._tf:Find("equipment_tpl")
	arg_6_0.equipmentContainer = arg_6_0.designScrollView:Find("equipment_grid")
	arg_6_0.msgBoxTF = arg_6_0._tf:Find("msg_panel")

	setActive(arg_6_0.msgBoxTF, false)

	arg_6_0.top = arg_6_0._tf:Find("top")
	arg_6_0.sortBtn = arg_6_0.top:Find("sort_button")
	arg_6_0.indexBtn = arg_6_0.top:Find("index_button")
	arg_6_0.decBtn = arg_6_0.sortBtn:Find("dec_btn")
	arg_6_0.sortImgAsc = arg_6_0.decBtn:Find("asc")
	arg_6_0.sortImgDec = arg_6_0.decBtn:Find("desc")
	arg_6_0.indexPanel = arg_6_0._tf:Find("index")
	arg_6_0.tagContainer = arg_6_0.indexPanel:Find("adapt/mask/panel")
	arg_6_0.tagTpl = arg_6_0.tagContainer:Find("tpl")
	arg_6_0.listEmptyTF = arg_6_0._tf:Find("empty")

	setActive(arg_6_0.listEmptyTF, false)

	arg_6_0.listEmptyTxt = arg_6_0.listEmptyTF:Find("Text")

	setText(arg_6_0.listEmptyTxt, i18n("list_empty_tip_equipmentdesignui"))
	arg_6_0:OverlayPanel(arg_6_0.indexPanel)

	arg_6_0.obtainWayPage = EquipmentDesignObtainWayPage.New(arg_6_0._tf, arg_6_0.event)

	arg_6_0.obtainWayPage:RegisterView(arg_6_0)
end

function var_0_0.SetParentTF(arg_7_0, arg_7_1)
	arg_7_0.parentTF = arg_7_1
	arg_7_0.equipmentView = arg_7_0.parentTF:Find("adapt/equipment_scrollview")

	setActive(arg_7_0.equipmentView, false)
end

function var_0_0.SetTopContainer(arg_8_0, arg_8_1)
	arg_8_0.topPanel = arg_8_1
end

local var_0_1 = {
	"sort_default",
	"sort_rarity",
	"sort_count"
}

function var_0_0.didEnter(arg_9_0)
	setParent(arg_9_0._tf, arg_9_0.parentTF)

	local var_9_0 = arg_9_0.equipmentView:GetSiblingIndex()

	arg_9_0._tf:SetSiblingIndex(var_9_0)

	arg_9_0.contextData.indexDatas = arg_9_0.contextData.indexDatas or {}

	setParent(arg_9_0.top, arg_9_0.topPanel)
	arg_9_0:initDesigns()
	onToggle(arg_9_0, arg_9_0.sortBtn, function(arg_10_0)
		if arg_10_0 then
			setActive(arg_9_0.indexPanel, true)
		else
			setActive(arg_9_0.indexPanel, false)
		end
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.indexPanel, function()
		triggerToggle(arg_9_0.sortBtn, false)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.indexBtn, function()
		local var_12_0 = {
			indexDatas = Clone(arg_9_0.contextData.indexDatas),
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
			callback = function(arg_13_0)
				if not isActive(arg_9_0._tf) then
					return
				end

				arg_9_0.contextData.indexDatas.typeIndex = arg_13_0.typeIndex
				arg_9_0.contextData.indexDatas.equipPropertyIndex = arg_13_0.equipPropertyIndex
				arg_9_0.contextData.indexDatas.equipPropertyIndex2 = arg_13_0.equipPropertyIndex2
				arg_9_0.contextData.indexDatas.equipAmmoIndex1 = arg_13_0.equipAmmoIndex1
				arg_9_0.contextData.indexDatas.equipAmmoIndex2 = arg_13_0.equipAmmoIndex2
				arg_9_0.contextData.indexDatas.equipCampIndex = arg_13_0.equipCampIndex
				arg_9_0.contextData.indexDatas.rarityIndex = arg_13_0.rarityIndex

				arg_9_0:filter(arg_9_0.contextData.index or 1)
			end
		}

		arg_9_0:emit(EquipmentDesignMediator.OPEN_EQUIPMENTDESIGN_INDEX, var_12_0)
	end, SFX_PANEL)
	arg_9_0:initTags()
end

function var_0_0.isDefaultStatus(arg_14_0)
	return (not arg_14_0.contextData.indexDatas.typeIndex or arg_14_0.contextData.indexDatas.typeIndex == IndexConst.EquipmentTypeAll) and (not arg_14_0.contextData.indexDatas.equipPropertyIndex or arg_14_0.contextData.indexDatas.equipPropertyIndex == IndexConst.EquipPropertyAll) and (not arg_14_0.contextData.indexDatas.equipPropertyIndex2 or arg_14_0.contextData.indexDatas.equipPropertyIndex2 == IndexConst.EquipPropertyAll) and (not arg_14_0.contextData.indexDatas.equipAmmoIndex1 or arg_14_0.contextData.indexDatas.equipAmmoIndex1 == IndexConst.EquipAmmoAll_1) and (not arg_14_0.contextData.indexDatas.equipAmmoIndex2 or arg_14_0.contextData.indexDatas.equipAmmoIndex2 == IndexConst.EquipAmmoAll_2) and (not arg_14_0.contextData.indexDatas.equipCampIndex or arg_14_0.contextData.indexDatas.equipCampIndex == IndexConst.EquipCampAll) and (not arg_14_0.contextData.indexDatas.rarityIndex or arg_14_0.contextData.indexDatas.rarityIndex == IndexConst.EquipmentRarityAll)
end

function var_0_0.initTags(arg_15_0)
	onButton(arg_15_0, arg_15_0.decBtn, function()
		arg_15_0.asc = not arg_15_0.asc
		arg_15_0.contextData.asc = arg_15_0.asc

		arg_15_0:filter(arg_15_0.contextData.index or 1)
	end)

	arg_15_0.tagTFs = {}

	eachChild(arg_15_0.tagContainer, function(arg_17_0)
		setActive(arg_17_0, false)
	end)

	for iter_15_0, iter_15_1 in ipairs(var_0_1) do
		local var_15_0 = iter_15_0 <= arg_15_0.tagContainer.childCount and arg_15_0.tagContainer:GetChild(iter_15_0 - 1) or cloneTplTo(arg_15_0.tagTpl, arg_15_0.tagContainer)

		setActive(var_15_0, true)
		setImageSprite(findTF(var_15_0, "Image"), GetSpriteFromAtlas("ui/equipmentdesignui_atlas", iter_15_1))
		onToggle(arg_15_0, var_15_0, function(arg_18_0)
			if arg_18_0 then
				arg_15_0:filter(iter_15_0)
				triggerButton(arg_15_0.indexPanel)

				arg_15_0.contextData.index = iter_15_0
			else
				triggerButton(arg_15_0.indexPanel)
			end
		end, SFX_PANEL)
		table.insert(arg_15_0.tagTFs, var_15_0)

		if not arg_15_0.contextData.index then
			arg_15_0.contextData.index = iter_15_0
		end
	end

	triggerToggle(arg_15_0.tagTFs[arg_15_0.contextData.index], true)
end

function var_0_0.initDesigns(arg_19_0)
	arg_19_0.scollRect = arg_19_0.designScrollView:GetComponent("LScrollRect")
	arg_19_0.scollRect.decelerationRate = 0.07

	function arg_19_0.scollRect.onInitItem(arg_20_0)
		arg_19_0:initDesign(arg_20_0)
	end

	function arg_19_0.scollRect.onUpdateItem(arg_21_0, arg_21_1)
		arg_19_0:updateDesign(arg_21_0, arg_21_1)
	end

	function arg_19_0.scollRect.onReturnItem(arg_22_0, arg_22_1)
		arg_19_0:returnDesign(arg_22_0, arg_22_1)
	end

	arg_19_0.desgins = {}
end

local function var_0_2(arg_23_0, arg_23_1)
	local var_23_0 = findTF(arg_23_0, "attrs")

	setImageSprite(findTF(arg_23_0, "name_bg/tag"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(arg_23_1:getConfig("type"))))
	eachChild(var_23_0, function(arg_24_0)
		setActive(arg_24_0, false)
	end)

	local var_23_1 = arg_23_1:GetPropertiesInfo().attrs
	local var_23_2 = underscore.filter(var_23_1, function(arg_25_0)
		return not arg_25_0.type or arg_25_0.type ~= AttributeType.AntiSiren
	end)
	local var_23_3 = arg_23_1:getConfig("skill_id")
	local var_23_4 = var_23_3[1] and var_23_3[1][1]
	local var_23_5 = var_23_4 and arg_23_1:isDevice() and {
		1,
		2,
		5
	} or {
		1,
		4,
		2,
		3
	}

	for iter_23_0, iter_23_1 in ipairs(var_23_5) do
		local var_23_6 = var_23_0:Find("attr_" .. iter_23_1)

		setActive(var_23_6, true)

		if iter_23_1 == 5 then
			setText(var_23_6:Find("value"), getSkillName(var_23_4))
		else
			local var_23_7 = ""
			local var_23_8 = ""

			if #var_23_2 > 0 then
				local var_23_9 = table.remove(var_23_2, 1)

				var_23_7, var_23_8 = Equipment.GetInfoTrans(var_23_9)
			end

			setText(var_23_6:Find("tag"), var_23_7)
			setText(var_23_6:Find("value"), var_23_8)
		end
	end
end

function var_0_0.createDesign(arg_26_0, arg_26_1)
	arg_26_1 = tf(arg_26_1)

	local var_26_0 = findTF(arg_26_1, "info/count")
	local var_26_1 = findTF(arg_26_1, "mask")
	local var_26_2 = arg_26_1:Find("name_bg/mask/name")
	local var_26_3 = {
		go = arg_26_1,
		nameTxt = var_26_2
	}

	ClearTweenItemAlphaAndWhite(var_26_3.go)

	function var_26_3.getItemById(arg_27_0, arg_27_1)
		return arg_27_0.itemVOs[arg_27_1] or Item.New({
			count = 0,
			id = arg_27_1
		})
	end

	function var_26_3.update(arg_28_0, arg_28_1, arg_28_2)
		arg_28_0.designId = arg_28_1
		arg_28_0.itemVOs = arg_28_2

		local var_28_0 = pg.compose_data_template[arg_28_1]

		assert(var_28_0, "必须存在配置" .. arg_28_1)

		local var_28_1 = var_28_0.equip_id

		TweenItemAlphaAndWhite(arg_28_0.go)

		local var_28_2 = Equipment.getConfigData(var_28_1)

		assert(var_28_2, "必须存在装备" .. var_28_1)
		setText(arg_28_0.nameTxt, shortenString(var_28_2.name, 6))

		local var_28_3 = Equipment.New({
			id = var_28_1
		})
		local var_28_4 = findTF(arg_26_1, "equipment/bg")

		updateEquipment(var_28_4, var_28_3)

		local function var_28_5()
			local var_29_0 = arg_28_0.itemVOs[var_28_0.material_id] or Item.New({
				count = 0,
				id = var_28_0.material_id
			})
			local var_29_1 = var_29_0.count .. "/" .. var_28_0.material_num

			var_29_1 = var_29_0.count >= var_28_0.material_num and setColorStr(var_29_1, COLOR_WHITE) or setColorStr(var_29_1, COLOR_RED)

			setText(var_26_0, var_29_1)
			setActive(var_26_1, var_29_0.count < var_28_0.material_num)
		end

		var_0_2(arg_26_1, var_28_3)
		var_28_5()
	end

	function var_26_3.clear(arg_30_0)
		ClearTweenItemAlphaAndWhite(arg_30_0.go)
	end

	return var_26_3
end

function var_0_0.initDesign(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0:createDesign(arg_31_1)

	onButton(arg_31_0, tf(var_31_0.go):Find("info/make_btn"), function()
		arg_31_0:showDesignDesc(var_31_0.designId)
	end, SFX_PANEL)
	onButton(arg_31_0, tf(var_31_0.go):Find("look"), function()
		arg_31_0.obtainWayPage:ExecuteAction("Show", var_31_0.designId)
	end, SFX_PANEL)

	arg_31_0.desgins[arg_31_1] = var_31_0
end

function var_0_0.updateDesign(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_0.desgins[arg_34_2]

	if not var_34_0 then
		arg_34_0:initDesign(arg_34_2)

		var_34_0 = arg_34_0.desgins[arg_34_2]
	end

	local var_34_1 = arg_34_0.desginIds[arg_34_1 + 1]

	var_34_0:update(var_34_1, arg_34_0.itemVOs)
end

function var_0_0.returnDesign(arg_35_0, arg_35_1, arg_35_2)
	if arg_35_0.exited then
		return
	end

	local var_35_0 = arg_35_0.desgins[arg_35_2]

	if var_35_0 then
		var_35_0:clear()
	end
end

function var_0_0.getDesignVO(arg_36_0, arg_36_1)
	local var_36_0 = {}
	local var_36_1 = pg.compose_data_template

	var_36_0.equipmentCfg = Equipment.getConfigData(var_36_1[arg_36_1].equip_id)
	var_36_0.designCfg = var_36_1[arg_36_1]
	var_36_0.id = arg_36_1

	local var_36_2 = arg_36_0:getItemById(var_36_1[arg_36_1].material_id).count

	var_36_0.itemCount = var_36_2
	var_36_0.canMakeCount = math.floor(var_36_2 / var_36_1[arg_36_1].material_num)
	var_36_0.canMake = math.min(var_36_0.canMakeCount, 1)

	local var_36_3 = var_36_1[arg_36_1].equip_id
	local var_36_4 = Equipment.getConfigData(var_36_3)

	assert(var_36_4, "equip config not exist: " .. var_36_3)

	var_36_0.config = var_36_4

	function var_36_0.getNation(arg_37_0)
		return var_36_4.nationality
	end

	function var_36_0.getConfig(arg_38_0, arg_38_1)
		return var_36_4[arg_38_1]
	end

	return var_36_0
end

function var_0_0.filter(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_0:isDefaultStatus() and "shaixuan_off" or "shaixuan_on"

	GetSpriteFromAtlasAsync("ui/share/index_atlas", var_39_0, function(arg_40_0)
		setImageSprite(arg_39_0.indexBtn, arg_40_0, true)
	end)

	local var_39_1 = pg.compose_data_template
	local var_39_2 = {}
	local var_39_3 = arg_39_0.asc
	local var_39_4 = getProxy(EquipmentProxy)

	for iter_39_0, iter_39_1 in ipairs(var_39_1.all) do
		local var_39_5 = pg.compose_data_template[iter_39_1]

		if arg_39_0:getItemById(var_39_5.material_id).count > 0 or arg_39_0.contextData.isShowAllDesign and var_39_4:ShouldShowEquipmentDesignObtainWay(iter_39_1) then
			table.insert(var_39_2, iter_39_1)
		end
	end

	local var_39_6 = {}
	local var_39_7 = table.mergeArray({}, {
		arg_39_0.contextData.indexDatas.equipPropertyIndex,
		arg_39_0.contextData.indexDatas.equipPropertyIndex2
	}, true)

	for iter_39_2, iter_39_3 in pairs(var_39_2) do
		local var_39_8 = arg_39_0:getDesignVO(iter_39_3)

		if IndexConst.filterEquipByType(var_39_8, arg_39_0.contextData.indexDatas.typeIndex) and IndexConst.filterEquipByProperty(var_39_8, var_39_7) and IndexConst.filterEquipAmmo1(var_39_8, arg_39_0.contextData.indexDatas.equipAmmoIndex1) and IndexConst.filterEquipAmmo2(var_39_8, arg_39_0.contextData.indexDatas.equipAmmoIndex2) and IndexConst.filterEquipByCamp(var_39_8, arg_39_0.contextData.indexDatas.equipCampIndex) and IndexConst.filterEquipByRarity(var_39_8, arg_39_0.contextData.indexDatas.rarityIndex) then
			table.insert(var_39_6, iter_39_3)
		end
	end

	if arg_39_1 == 1 then
		if var_39_3 then
			table.sort(var_39_6, function(arg_41_0, arg_41_1)
				local var_41_0 = arg_39_0:getDesignVO(arg_41_0)
				local var_41_1 = arg_39_0:getDesignVO(arg_41_1)

				if var_41_0.canMake == var_41_1.canMake then
					if var_41_0.equipmentCfg.rarity == var_41_1.equipmentCfg.rarity then
						return var_41_0.equipmentCfg.id < var_41_1.equipmentCfg.id
					else
						return var_41_0.equipmentCfg.rarity > var_41_1.equipmentCfg.rarity
					end
				else
					return var_41_0.canMake < var_41_1.canMake
				end
			end)
		else
			table.sort(var_39_6, function(arg_42_0, arg_42_1)
				local var_42_0 = arg_39_0:getDesignVO(arg_42_0)
				local var_42_1 = arg_39_0:getDesignVO(arg_42_1)

				if var_42_0.canMake == var_42_1.canMake then
					if var_42_0.equipmentCfg.rarity == var_42_1.equipmentCfg.rarity then
						return var_42_0.equipmentCfg.id < var_42_1.equipmentCfg.id
					else
						return var_42_0.equipmentCfg.rarity > var_42_1.equipmentCfg.rarity
					end
				else
					return var_42_0.canMake > var_42_1.canMake
				end
			end)
		end
	elseif arg_39_1 == 2 then
		if arg_39_0.asc then
			table.sort(var_39_6, function(arg_43_0, arg_43_1)
				local var_43_0 = arg_39_0:getDesignVO(arg_43_0)
				local var_43_1 = arg_39_0:getDesignVO(arg_43_1)

				if var_43_0.equipmentCfg.rarity == var_43_1.equipmentCfg.rarity then
					return var_43_0.equipmentCfg.id < var_43_0.equipmentCfg.id
				end

				return var_43_0.equipmentCfg.rarity < var_43_1.equipmentCfg.rarity
			end)
		else
			table.sort(var_39_6, function(arg_44_0, arg_44_1)
				local var_44_0 = arg_39_0:getDesignVO(arg_44_0)
				local var_44_1 = arg_39_0:getDesignVO(arg_44_1)

				if var_44_0.equipmentCfg.rarity == var_44_1.equipmentCfg.rarity then
					return var_44_0.equipmentCfg.id < var_44_0.equipmentCfg.id
				end

				return var_44_0.equipmentCfg.rarity > var_44_1.equipmentCfg.rarity
			end)
		end
	elseif arg_39_1 == 3 then
		if arg_39_0.asc then
			table.sort(var_39_6, function(arg_45_0, arg_45_1)
				local var_45_0 = arg_39_0:getDesignVO(arg_45_0)
				local var_45_1 = arg_39_0:getDesignVO(arg_45_1)

				if var_45_0.itemCount == var_45_1.itemCount then
					return var_45_0.equipmentCfg.id < var_45_1.equipmentCfg.id
				end

				return var_45_0.itemCount < var_45_1.itemCount
			end)
		else
			table.sort(var_39_6, function(arg_46_0, arg_46_1)
				local var_46_0 = arg_39_0:getDesignVO(arg_46_0)
				local var_46_1 = arg_39_0:getDesignVO(arg_46_1)

				if var_46_0.itemCount == var_46_1.itemCount then
					return var_46_0.equipmentCfg.id < var_46_1.equipmentCfg.id
				end

				return var_46_0.itemCount > var_46_1.itemCount
			end)
		end
	end

	arg_39_0.desginIds = var_39_6

	arg_39_0.scollRect:SetTotalCount(#var_39_6, arg_39_2 and -1 or 0)
	setActive(arg_39_0.listEmptyTF, #var_39_6 <= 0)
	Canvas.ForceUpdateCanvases()

	local var_39_9 = GetSpriteFromAtlas("ui/equipmentdesignui_atlas", var_0_1[arg_39_1])

	setImageSprite(arg_39_0.sortBtn:Find("Image"), var_39_9)
	setActive(arg_39_0.sortImgAsc, arg_39_0.asc)
	setActive(arg_39_0.sortImgDec, not arg_39_0.asc)
end

function var_0_0.getItemById(arg_47_0, arg_47_1)
	return arg_47_0.itemVOs[arg_47_1] or Item.New({
		count = 0,
		id = arg_47_1
	})
end

function var_0_0.showDesignDesc(arg_48_0, arg_48_1)
	arg_48_0.isShowDesc = true

	if IsNil(arg_48_0.msgBoxTF) then
		return
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_48_0.msgBoxTF)
	setActive(arg_48_0.msgBoxTF, true)

	local var_48_0 = arg_48_0.msgBoxTF
	local var_48_1 = pg.compose_data_template[arg_48_1]
	local var_48_2 = var_48_1.equip_id
	local var_48_3 = Equipment.New({
		id = var_48_2
	})

	updateEquipInfo(var_48_0:Find("bg/attrs/content"), var_48_3:GetPropertiesInfo(), var_48_3:GetSkill())

	local var_48_4 = var_48_0:Find("bg/frame/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. var_48_3:getConfig("icon"), "", var_48_4)
	changeToScrollText(var_48_0:Find("bg/name"), var_48_3:getConfig("name"))
	UIItemList.New(var_48_0:Find("bg/frame/stars"), var_48_0:Find("bg/frame/stars/sarttpl")):align(var_48_3:getConfig("rarity"))
	setImageSprite(findTF(var_48_0, "bg/frame/type"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(var_48_3:getConfig("type"))))
	setText(var_48_0:Find("bg/frame/speciality/Text"), var_48_3:getConfig("speciality") ~= "无" and var_48_3:getConfig("speciality") or i18n1("—"))

	local var_48_5 = LoadSprite("bg/equipment_bg_" .. var_48_3:getConfig("rarity"))

	var_48_0:Find("bg/frame"):GetComponent(typeof(Image)).sprite = var_48_5

	local var_48_6 = findTF(var_48_0, "bg/frame/numbers")
	local var_48_7 = var_48_3:getConfig("tech") or 1

	for iter_48_0 = 0, var_48_6.childCount - 1 do
		local var_48_8 = var_48_6:GetChild(iter_48_0)

		setActive(var_48_8, iter_48_0 == var_48_7)
	end

	local var_48_9 = arg_48_0:getItemById(var_48_1.material_id)
	local var_48_10 = math.floor(var_48_9.count / var_48_1.material_num)
	local var_48_11 = 1
	local var_48_12 = var_48_0:Find("bg/calc/values/Text")
	local var_48_13 = var_48_1.gold_num
	local var_48_14 = var_48_0:Find("bg/calc/gold/Text")

	local function var_48_15(arg_49_0)
		setText(var_48_12, arg_49_0)
		setText(var_48_14, arg_49_0 * var_48_13)
	end

	var_48_15(var_48_11)
	pressPersistTrigger(findTF(var_48_0, "bg/calc/minus"), 0.5, function(arg_50_0)
		if var_48_11 <= 1 then
			arg_50_0()

			return
		end

		var_48_11 = var_48_11 - 1

		var_48_15(var_48_11)
	end, nil, true, true, 0.1, SFX_PANEL)
	pressPersistTrigger(findTF(var_48_0, "bg/calc/add"), 0.5, function(arg_51_0)
		if var_48_11 == var_48_10 then
			arg_51_0()

			return
		end

		var_48_11 = var_48_11 + 1

		var_48_15(var_48_11)
	end, nil, true, true, 0.1, SFX_PANEL)
	onButton(arg_48_0, findTF(var_48_0, "bg/calc/max"), function()
		if var_48_11 == var_48_10 then
			return
		end

		local var_52_0 = arg_48_0.player:getMaxEquipmentBag() - arg_48_0.capacity

		var_48_11 = math.max(math.min(var_48_10, var_52_0), 1)

		var_48_15(var_48_11)
	end, SFX_PANEL)
	onButton(arg_48_0, findTF(var_48_0, "bg/cancel_btn"), function()
		arg_48_0:hideMsgBox()
	end, SFX_CANCEL)
	onButton(arg_48_0, findTF(var_48_0, "bg/confirm_btn"), function()
		arg_48_0:emit(EquipmentDesignMediator.MAKE_EQUIPMENT, arg_48_1, var_48_11)
		arg_48_0:hideMsgBox()
	end, SFX_CONFIRM)
	onButton(arg_48_0, var_48_0, function()
		arg_48_0:hideMsgBox()
	end, SFX_CANCEL)
end

function var_0_0.hideMsgBox(arg_56_0)
	if not IsNil(arg_56_0.msgBoxTF) then
		arg_56_0.isShowDesc = nil

		pg.UIMgr.GetInstance():UnOverlayPanel(arg_56_0.msgBoxTF, arg_56_0._tf)
		setActive(arg_56_0.msgBoxTF, false)
	end
end

function var_0_0.onBackPressed(arg_57_0)
	if isActive(arg_57_0.indexPanel) then
		triggerButton(arg_57_0.indexPanel)

		return
	end

	if arg_57_0.isShowDesc then
		arg_57_0:hideMsgBox()
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		arg_57_0:emit(var_0_0.ON_BACK)
	end
end

function var_0_0.willExit(arg_58_0)
	arg_58_0:UnOverlayPanel(arg_58_0.indexPanel, arg_58_0._tf)

	if arg_58_0.leftEventTrigger then
		ClearEventTrigger(arg_58_0.leftEventTrigger)
	end

	if arg_58_0.rightEventTrigger then
		ClearEventTrigger(arg_58_0.rightEventTrigger)
	end

	setParent(arg_58_0.sortBtn.parent, arg_58_0._tf)

	if arg_58_0.obtainWayPage then
		arg_58_0.obtainWayPage:Destroy()
	end

	arg_58_0.obtainWayPage = nil
end

return var_0_0
