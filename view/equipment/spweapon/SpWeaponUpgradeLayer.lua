local var_0_0 = class("SpWeaponUpgradeLayer", import("view.base.BaseUI"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 3
local var_0_6 = {
	15015,
	15016,
	15017
}
local var_0_7 = {
	typeIndex = IndexConst.SpWeaponTypeAll,
	rarityIndex = IndexConst.SpWeaponRarityAll
}

function var_0_0.getUIName(arg_1_0)
	return "SpWeaponUpgradeUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"weaponframes",
		"shiptype",
		"ui/iconcolorful",
		"ui/CustomIndexUI",
		"ui/SkillInfoUI",
		"ui/MsgBox"
	}

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))

	return var_2_0
end

function var_0_0.init(arg_3_0)
	arg_3_0:InitUI()

	arg_3_0.consumeItems, arg_3_0.consumeSpweapons = {}, {}
	arg_3_0.loader = AutoLoader.New()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0.rightPanel = arg_4_0._tf:Find("Right")
	arg_4_0.leftPanel = arg_4_0._tf:Find("Left")
	arg_4_0.equipmentPanel = arg_4_0.rightPanel:Find("EquipmentPanel")
	arg_4_0.equipmentPanelTitleStrengthen = arg_4_0.equipmentPanel:Find("Title/Strengthen")
	arg_4_0.equipmentPanelTitleUpgrade = arg_4_0.equipmentPanel:Find("Title/Upgrade")
	arg_4_0.equipmentPanelTitleComposite = arg_4_0.equipmentPanel:Find("Title/Composite")
	arg_4_0.equipmentPanelIcon1 = arg_4_0.equipmentPanel:Find("Container/Equiptpl")
	arg_4_0.equipmentPanelIcon2 = arg_4_0.equipmentPanel:Find("Container/Equiptpl2")
	arg_4_0.equipmentPanelArrow = arg_4_0.equipmentPanel:Find("Container/Slot")
	arg_4_0.craftTargetCount = arg_4_0.equipmentPanel:Find("TotalCount")
	arg_4_0.materialPanel = arg_4_0.rightPanel:Find("MaterialPanel")
	arg_4_0.materialPanelAttrList = arg_4_0.materialPanel:Find("ScrollView/List")
	arg_4_0.materialPanelExpLv = arg_4_0.materialPanel:Find("ExpLv")
	arg_4_0.materialPanelExpLvText = arg_4_0.materialPanel:Find("ExpLv/Number")

	setActive(arg_4_0.materialPanelExpLvText, false)

	arg_4_0.materialPanelExpFullText = arg_4_0.materialPanel:Find("ExpFull")
	arg_4_0.materialPanelExpBar = arg_4_0.materialPanel:Find("ExpBar")
	arg_4_0.materialPanelExpBarFill = arg_4_0.materialPanel:Find("ExpBar/Fill")
	arg_4_0.materialPanelExpBarFull = arg_4_0.materialPanel:Find("ExpBar/Full")

	setText(arg_4_0.materialPanel:Find("ExpFull"), i18n("spweapon_ui_levelmax"))

	arg_4_0.materialPanelExpTotalText = arg_4_0.materialPanel:Find("ExpTotal")
	arg_4_0.materialPanelExpCurrentText = arg_4_0.materialPanel:Find("ExpTotal/ExpCurrent")
	arg_4_0.materialPanelMaterialList = arg_4_0.materialPanel:Find("Materials/List")
	arg_4_0.materialPanelMaterialListLimit = arg_4_0.materialPanel:Find("Materials/Limit")
	arg_4_0.materialPanelMaterialItems = CustomIndexLayer.Clone2Full(arg_4_0.materialPanelMaterialList, 3)

	setText(arg_4_0.materialPanel:Find("Materials/Title"), i18n("spweapon_ui_need_resource"))
	setText(arg_4_0.materialPanel:Find("Materials/Limit/text"), i18n("spweapon_ui_levelmax2"))

	arg_4_0.materialPanelCostText = arg_4_0.materialPanel:Find("Cost/Consume")
	arg_4_0.materialPanelButton = arg_4_0.materialPanel:Find("Button")
	arg_4_0.materialPanelButtonUpgrade = arg_4_0.materialPanel:Find("Button/Upgrade")
	arg_4_0.materialPanelButtonStrengthen = arg_4_0.materialPanel:Find("Button/Strengthen")
	arg_4_0.materialPanelButtonCreate = arg_4_0.materialPanel:Find("Button/Create")

	setText(arg_4_0.materialPanelButtonUpgrade, i18n("msgbox_text_breakthrough"))
	setText(arg_4_0.materialPanelButtonStrengthen, i18n("msgbox_text_noPos_intensify"))
	setText(arg_4_0.materialPanelButtonCreate, i18n("spweapon_ui_create_button"))

	arg_4_0.leftPanelAutoSelectButton = arg_4_0.leftPanel:Find("Title/AutoSelect")
	arg_4_0.leftPanelClearSelectButton = arg_4_0.leftPanel:Find("Title/ClearSelect")
	arg_4_0.leftPanelItem = arg_4_0.leftPanel:Find("Items")

	local var_4_0 = arg_4_0.leftPanel:Find("Items/Content")
	local var_4_1 = arg_4_0.leftPanel:Find("Items/EquipItem")

	arg_4_0.leftPanelItemRect = UIItemList.New(var_4_0, var_4_1)

	setText(arg_4_0.leftPanel:Find("Items/Top/TextName"), i18n("spweapon_ui_ptitem"))
	setText(arg_4_0.leftPanelAutoSelectButton:Find("On/Text"), i18n("spweapon_ui_autoselect"))
	setText(arg_4_0.leftPanelAutoSelectButton:Find("Off/Text"), i18n("spweapon_ui_autoselect"))
	setText(arg_4_0.leftPanelClearSelectButton:Find("On/Text"), i18n("spweapon_ui_cancelselect"))
	setText(arg_4_0.leftPanelClearSelectButton:Find("Off/Text"), i18n("spweapon_ui_cancelselect"))

	arg_4_0.LeftPanelEquip = arg_4_0.leftPanel:Find("Equips")
	arg_4_0.leftPanelEquipScrollComp = GetComponent(arg_4_0.leftPanel:Find("Equips/Scroll View"), "LScrollRect")

	setText(arg_4_0.leftPanel:Find("Equips/Top/TextName"), i18n("spweapon_ui_spweapon"))

	arg_4_0.leftPanelFilterButton = arg_4_0.leftPanel:Find("Equips/Top/Filter")

	setText(arg_4_0.leftPanel:Find("TipText"), i18n("spweapon_ui_helptext"))
	setText(arg_4_0.equipmentPanel:Find("Ship/Detail"), i18n("spweapon_tip_view"))
	setText(arg_4_0.equipmentPanel:Find("Ship/Title"), i18n("spweapon_tip_ship"))
	setText(arg_4_0.equipmentPanel:Find("ShipType/Title"), i18n("spweapon_tip_type"))
	setText(arg_4_0.craftTargetCount:Find("Tip"), i18n("spweapon_tip_owned", ""))
	Canvas.ForceUpdateCanvases()
end

function var_0_0.setItems(arg_5_0, arg_5_1)
	arg_5_0.itemVOs = arg_5_1
end

function var_0_0.updateRes(arg_6_0, arg_6_1)
	arg_6_0.playerVO = arg_6_1
end

function var_0_0.SetSpWeapon(arg_7_0, arg_7_1)
	arg_7_0.spWeaponVO = arg_7_1
end

function var_0_0.SetSpWeaponList(arg_8_0, arg_8_1)
	arg_8_0.spWeaponList = arg_8_1
end

function var_0_0.didEnter(arg_9_0)
	onButton(arg_9_0, arg_9_0._tf:Find("BG"), function()
		arg_9_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0.leftPanelFilterButton, function()
		local var_11_0 = {
			indexDatas = Clone(arg_9_0.contextData.indexDatas),
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
			callback = function(arg_12_0)
				arg_9_0.contextData.indexDatas.typeIndex = arg_12_0.typeIndex
				arg_9_0.contextData.indexDatas.rarityIndex = arg_12_0.rarityIndex

				arg_9_0:UpdateAll()
			end
		}

		arg_9_0:emit(SpWeaponUpgradeMediator.OPEN_EQUIPMENT_INDEX, var_11_0)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.leftPanelAutoSelectButton, function()
		arg_9_0:AutoSelectMaterials()
	end)
	onButton(arg_9_0, arg_9_0.leftPanelClearSelectButton, function()
		table.clear(arg_9_0.consumeItems)
		arg_9_0:UpdateAll(true)
	end, SFX_CANCEL)

	function arg_9_0.leftPanelEquipScrollComp.onInitItem(arg_15_0)
		ClearTweenItemAlphaAndWhite(arg_15_0.gameObject)
	end

	function arg_9_0.leftPanelEquipScrollComp.onUpdateItem(arg_16_0, arg_16_1)
		arg_9_0:UpdateEquipItemByIndex(arg_16_0, arg_16_1)
	end

	function arg_9_0.leftPanelEquipScrollComp.onReturnItem(arg_17_0, arg_17_1)
		ClearTweenItemAlphaAndWhite(go(arg_17_1))
	end

	arg_9_0.leftPanelItemRect:make(function(arg_18_0, arg_18_1, arg_18_2)
		arg_18_1 = arg_18_1 + 1

		if arg_18_0 == UIItemList.EventInit then
			pressPersistTrigger(arg_18_2:Find("IconTpl"), 0.5, function(arg_19_0)
				local var_19_0 = arg_9_0.candicateMaterials[arg_18_1].id
				local var_19_1 = arg_9_0:GetSelectMaterial(var_19_0)
				local var_19_2 = var_19_1 and var_19_1.count or 0
				local var_19_3 = arg_9_0.itemVOs[var_19_0] and arg_9_0.itemVOs[var_19_0].count or 0

				if arg_9_0.ptMax then
					pg.TipsMgr.GetInstance():ShowTips(i18n("spweapon_tip_upgrade"))
					arg_19_0()
				elseif var_19_2 == var_19_3 then
					arg_19_0()
				else
					if not var_19_1 then
						var_19_1 = Item.New({
							count = 0,
							id = var_19_0
						})

						table.insert(arg_9_0.consumeItems, var_19_1)
					end

					var_19_1.count = var_19_1.count + 1

					arg_9_0:UpdateAll(true)
				end
			end, nil, true, true, 0.15, SFX_PANEL)
			pressPersistTrigger(arg_18_2:Find("IconTpl/Reduce"), 0.5, function(arg_20_0)
				local var_20_0 = arg_9_0.candicateMaterials[arg_18_1].id
				local var_20_1 = arg_9_0:GetSelectMaterial(var_20_0)

				if (var_20_1 and var_20_1.count or 0) == 0 then
					arg_20_0()

					return
				end

				var_20_1.count = var_20_1.count - 1

				if var_20_1.count <= 0 then
					table.removebyvalue(arg_9_0.consumeItems, var_20_1)
				end

				arg_9_0:UpdateAll(true)
			end, nil, true, true, 0.15, SFX_PANEL)
		elseif arg_18_0 == UIItemList.EventUpdate then
			local var_18_0 = arg_9_0.candicateMaterials[arg_18_1]

			updateDrop(arg_18_2:Find("IconTpl"), Drop.New({
				type = DROP_TYPE_ITEM,
				id = var_18_0.id,
				count = var_18_0.count
			}))
			setScrollText(arg_18_2:Find("Mask/NameText"), var_18_0:getConfig("name"))

			local var_18_1 = arg_18_2:Find("IconTpl/icon_bg/count")

			setText(var_18_1, var_18_0.count)
			setActive(arg_18_2:Find("IconTpl/mask"), var_18_0.count == 0)

			local var_18_2 = arg_9_0:GetSelectMaterial(var_18_0.id)

			setActive(arg_18_2:Find("IconTpl/Reduce"), var_18_2 and var_18_2.count > 0)

			if var_18_2 then
				setText(arg_18_2:Find("IconTpl/Reduce/Text"), var_18_2.count)
			end
		end
	end)
	pg.UIMgr.GetInstance():BlurPanel(arg_9_0._tf)

	arg_9_0.contextData.indexDatas = arg_9_0.contextData.indexDatas or Clone(var_0_7)

	arg_9_0:UpdateAll()
end

function var_0_0.UpdateEquipItemByIndex(arg_21_0, arg_21_1, arg_21_2)
	arg_21_1 = arg_21_1 + 1

	TweenItemAlphaAndWhite(arg_21_2)

	local var_21_0 = arg_21_0.candicateSpweapons[arg_21_1]

	arg_21_0:UpdateEquipItem(var_21_0, arg_21_2)
end

function var_0_0.UpdateEquipItem(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = tf(arg_22_2)

	onButton(arg_22_0, var_22_0, function()
		if arg_22_0:GetSelectSpWeapon(arg_22_1) then
			return
		end

		if arg_22_0.ptMax then
			pg.TipsMgr.GetInstance():ShowTips(i18n("spweapon_tip_upgrade"))

			return
		end

		seriesAsync({
			function(arg_24_0)
				if not arg_22_1:IsImportant() then
					return arg_24_0()
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					type = MSGBOX_TYPE_CONFIRM_DELETE,
					title = pg.MsgboxMgr.TITLE_INFORMATION,
					onYes = arg_24_0,
					data = {
						name = arg_22_1:GetName()
					}
				})
			end,
			function()
				table.insert(arg_22_0.consumeSpweapons, arg_22_1)
				arg_22_0:UpdateAll(true)
				arg_22_0:UpdateEquipItem(arg_22_1, arg_22_2)
			end
		})
	end)
	onButton(arg_22_0, var_22_0:Find("IconTpl/Reduce"), function()
		local var_26_0 = arg_22_0:GetSelectSpWeapon(arg_22_1)

		if not var_26_0 then
			return
		end

		table.removebyvalue(arg_22_0.consumeSpweapons, var_26_0)
		arg_22_0:UpdateEquipItem(arg_22_1, arg_22_2)
		arg_22_0:UpdateAll(true)
	end)
	updateSpWeapon(var_22_0:Find("IconTpl"), arg_22_1)
	setScrollText(var_22_0:Find("Mask/NameText"), arg_22_1:GetName())

	local var_22_1 = arg_22_1:GetShipId()

	setActive(var_22_0:Find("EquipShip"), var_22_1)

	if var_22_1 and var_22_1 > 0 then
		local var_22_2 = getProxy(BayProxy):getShipById(var_22_1)

		setImageSprite(var_22_0:Find("EquipShip/Image"), LoadSprite("qicon/" .. var_22_2:getPainting()))
	end

	local var_22_3 = arg_22_0:GetSelectSpWeapon(arg_22_1)

	setActive(var_22_0:Find("IconTpl/Reduce"), var_22_3)

	if var_22_3 then
		setText(var_22_0:Find("IconTpl/Reduce/Text"), 1)
	end
end

function var_0_0.UpdateSelectPt(arg_27_0)
	arg_27_0.nextSpWeaponVO = nil
	arg_27_0.upgradeType = nil
	arg_27_0.upgradeMaxLevel = false
	arg_27_0.ptMax = false

	local var_27_0 = arg_27_0.spWeaponVO:GetPt() + SpWeapon.CalculateHistoryPt(arg_27_0.consumeItems, arg_27_0.consumeSpweapons)
	local var_27_1 = arg_27_0.spWeaponVO:GetConfigID()
	local var_27_2 = 0
	local var_27_3 = 0
	local var_27_4 = 0
	local var_27_5 = 0
	local var_27_6 = {}

	local function var_27_7(arg_28_0)
		for iter_28_0, iter_28_1 in ipairs(arg_28_0) do
			local var_28_0 = iter_28_1[1]
			local var_28_1 = underscore.detect(var_27_6, function(arg_29_0)
				return arg_29_0.id == var_28_0
			end)

			if not var_28_1 then
				var_28_1 = Item.New({
					id = var_28_0
				})
				var_28_1.count = 0

				table.insert(var_27_6, var_28_1)
			end

			var_28_1.count = var_28_1.count + iter_28_1[2]
		end
	end

	if arg_27_0.craftMode == var_0_1 then
		local var_27_8 = SpWeapon.New({
			id = var_27_1
		}):GetUpgradeConfig()

		var_27_3 = var_27_3 + var_27_8.create_use_pt

		var_27_7(var_27_8.create_use_item)

		var_27_5 = var_27_5 + var_27_8.create_use_gold
		arg_27_0.upgradeType = var_0_3
	end

	if var_27_3 <= var_27_0 then
		arg_27_0.upgradeType = var_0_4

		repeat
			local var_27_9 = SpWeapon.New({
				id = var_27_1
			})
			local var_27_10 = var_27_9:GetNextUpgradeID()

			if var_27_10 == 0 then
				break
			end

			local var_27_11 = var_27_9:GetUpgradeConfig()

			var_27_2 = var_27_3
			var_27_3 = var_27_3 + var_27_11.upgrade_use_pt

			local var_27_12 = SpWeapon.New({
				id = var_27_10
			})

			if var_27_4 > 0 and var_27_12:GetRarity() > var_27_9:GetRarity() then
				break
			end

			if var_27_12:GetRarity() > var_27_9:GetRarity() then
				arg_27_0.upgradeType = var_0_5
			end

			if var_27_0 < var_27_3 then
				break
			end

			var_27_7(var_27_11.upgrade_use_item)

			var_27_5 = var_27_5 + var_27_11.upgrade_use_gold
			var_27_4 = var_27_4 + 1
			var_27_1 = var_27_10
		until var_27_12:GetRarity() > var_27_9:GetRarity()
	end

	arg_27_0.ptMax = var_27_3 <= var_27_0

	local var_27_13 = math.min(var_27_0, var_27_3)

	arg_27_0.upgradeLevel = var_27_4
	arg_27_0.upgradePtOrigin = var_27_2
	arg_27_0.upgradePtTotal = var_27_13
	arg_27_0.upgradePtMax = var_27_3
	arg_27_0.upgradNeedMaterials = var_27_6
	arg_27_0.upgradNeedGold = var_27_5
	arg_27_0.nextSpWeaponVO = arg_27_0.spWeaponVO:MigrateTo(var_27_1)

	if arg_27_0.craftMode == var_0_2 then
		arg_27_0.upgradeMaxLevel = arg_27_0.spWeaponVO:GetNextUpgradeID() == 0
	end
end

function var_0_0.AutoSelectMaterials(arg_30_0)
	local var_30_0 = arg_30_0.spWeaponVO:GetPt() + SpWeapon.CalculateHistoryPt(arg_30_0.consumeItems, arg_30_0.consumeSpweapons)
	local var_30_1 = arg_30_0.spWeaponVO:GetConfigID()
	local var_30_2 = 0

	if arg_30_0.craftMode == var_0_1 then
		var_30_2 = SpWeapon.New({
			id = var_30_1
		}):GetUpgradeConfig().create_use_pt
	end

	while true do
		local var_30_3 = SpWeapon.New({
			id = var_30_1
		})
		local var_30_4 = var_30_3:GetNextUpgradeID()

		if var_30_4 == 0 then
			break
		end

		var_30_2 = var_30_2 + var_30_3:GetUpgradeConfig().upgrade_use_pt

		if SpWeapon.New({
			id = var_30_4
		}):GetRarity() > arg_30_0.spWeaponVO:GetRarity() then
			break
		end

		var_30_1 = var_30_4
	end

	if var_30_2 <= var_30_0 then
		return
	end

	local var_30_5 = _.values(_.map(arg_30_0.candicateMaterials, function(arg_31_0)
		local var_31_0 = arg_30_0:GetSelectMaterial(arg_31_0.id)
		local var_31_1 = arg_31_0.count - (var_31_0 and var_31_0.count or 0)

		return var_31_1 > 0 and Item.New({
			id = arg_31_0.id,
			count = var_31_1
		}) or nil
	end))

	local function var_30_6(arg_32_0)
		return Item.getConfigData(arg_32_0.id).usage_arg[1]
	end

	table.sort(var_30_5, function(arg_33_0, arg_33_1)
		return var_30_6(arg_33_0) > var_30_6(arg_33_1)
	end)

	local var_30_7 = var_30_2 - var_30_0
	local var_30_8

	local function var_30_9(arg_34_0, arg_34_1, arg_34_2)
		local var_34_0 = var_30_5[arg_34_0]

		if not var_34_0 then
			return false
		end

		local var_34_1 = var_30_6(var_34_0)
		local var_34_2 = math.min(math.ceil(arg_34_1 / var_34_1), var_34_0.count)
		local var_34_3 = arg_34_1 - var_34_1 * var_34_2

		arg_34_2 = Clone(arg_34_2)

		if var_34_3 == 0 then
			table.insert(arg_34_2, {
				id = var_34_0.id,
				count = var_34_2
			})

			return true, arg_34_2
		elseif var_34_3 > 0 then
			local var_34_4, var_34_5 = var_30_9(arg_34_0 + 1, var_34_3, {})

			if var_34_4 then
				table.insert(arg_34_2, {
					id = var_34_0.id,
					count = var_34_2
				})
				table.insertto(arg_34_2, var_34_5)

				return true, arg_34_2
			else
				return false
			end
		elseif var_34_3 < 0 then
			local var_34_6 = var_34_3 + var_34_1
			local var_34_7, var_34_8 = var_30_9(arg_34_0 + 1, var_34_6, {})

			if var_34_7 then
				table.insert(arg_34_2, {
					id = var_34_0.id,
					count = math.max(var_34_2 - 1, 0)
				})
				table.insertto(arg_34_2, var_34_8)

				return true, arg_34_2
			else
				table.insert(arg_34_2, {
					id = var_34_0.id,
					count = math.max(var_34_2, 0)
				})

				return true, arg_34_2
			end
		end
	end

	local var_30_10, var_30_11 = var_30_9(1, var_30_7, {})

	var_30_11 = var_30_10 and var_30_11 or var_30_5

	_.each(var_30_11, function(arg_35_0)
		arg_30_0:UpdateSelectMaterial(arg_35_0.id, arg_35_0.count)
		arg_30_0:UpdateAll(true)
	end)
end

function var_0_0.UpdateAll(arg_36_0, arg_36_1)
	arg_36_0.craftMode = not arg_36_0.spWeaponVO:IsReal() and var_0_1 or var_0_2

	arg_36_0:UpdateSelectPt()

	local var_36_0 = arg_36_0.craftMode == var_0_2 and arg_36_0.nextSpWeaponVO:GetConfigID() ~= arg_36_0.spWeaponVO:GetConfigID()

	setActive(arg_36_0.equipmentPanelIcon2, var_36_0)
	setActive(arg_36_0.equipmentPanelArrow, var_36_0)

	if var_36_0 then
		updateSpWeapon(arg_36_0.equipmentPanelIcon1, arg_36_0.spWeaponVO)
		updateSpWeapon(arg_36_0.equipmentPanelIcon2, arg_36_0.nextSpWeaponVO)
		arg_36_0:UpdateAttrs(arg_36_0.materialPanelAttrList, arg_36_0.spWeaponVO, arg_36_0.nextSpWeaponVO)
	else
		updateSpWeapon(arg_36_0.equipmentPanelIcon1, arg_36_0.nextSpWeaponVO)
		arg_36_0:UpdateAttrs(arg_36_0.materialPanelAttrList, arg_36_0.nextSpWeaponVO)
	end

	setText(arg_36_0.equipmentPanel:Find("Name"), arg_36_0.nextSpWeaponVO:GetName())

	local var_36_1 = arg_36_0.nextSpWeaponVO:IsUnique()

	setActive(arg_36_0.equipmentPanel:Find("ShipType"), not var_36_1)
	setActive(arg_36_0.equipmentPanel:Find("Ship"), var_36_1)

	if var_36_1 then
		local var_36_2 = ShipGroup.getDefaultShipConfig(arg_36_0.nextSpWeaponVO:GetUniqueGroup())
		local var_36_3 = var_36_2 and var_36_2.id or nil

		assert(var_36_3 and var_36_3 > 0)

		if var_36_3 and var_36_3 > 0 then
			local var_36_4 = Ship.New({
				configId = var_36_3
			})

			arg_36_0.loader:GetSprite("qicon/" .. var_36_4:getPainting(), nil, arg_36_0.equipmentPanel:Find("Ship/Icon/Image"))

			local function var_36_5()
				arg_36_0:emit(BaseUI.ON_DROP, {
					type = DROP_TYPE_SHIP,
					id = var_36_3
				})
			end

			arg_36_0.equipmentPanel:Find("Ship/Detail"):GetComponent("RichText"):AddListener(var_36_5)
			onButton(arg_36_0, arg_36_0.equipmentPanel:Find("Ship/Icon"), var_36_5)
		end
	else
		local var_36_6 = arg_36_0.nextSpWeaponVO:GetWearableShipTypes()
		local var_36_7 = _.filter(var_36_6, function(arg_38_0)
			return table.contains(ShipType.AllShipType, arg_38_0)
		end)
		local var_36_8 = ShipType.FilterOverQuZhuType(var_36_7)

		CustomIndexLayer.Clone2Full(arg_36_0.equipmentPanel:Find("ShipType/List"), #var_36_8)

		for iter_36_0, iter_36_1 in ipairs(var_36_8) do
			local var_36_9 = arg_36_0.equipmentPanel:Find("ShipType/List"):GetChild(iter_36_0 - 1)

			arg_36_0.loader:GetSprite("shiptype", ShipType.Type2CNLabel(iter_36_1), var_36_9)
		end
	end

	arg_36_0:UpdateExpBar()
	arg_36_0:UpdateMaterials()
	arg_36_0:UpdatePtMaterials(arg_36_1)
	arg_36_0:UpdateCraftTargetCount()
end

function var_0_0.UpdateCraftTargetCount(arg_39_0)
	setActive(arg_39_0.craftTargetCount, arg_39_0.craftMode == var_0_1)

	if not arg_39_0.craftMode == var_0_1 then
		return
	end

	local var_39_0 = _.reduce(arg_39_0.spWeaponList, 0, function(arg_40_0, arg_40_1)
		if arg_39_0.nextSpWeaponVO:GetOriginID() == arg_40_1:GetOriginID() then
			arg_40_0 = arg_40_0 + 1
		end

		return arg_40_0
	end)

	setText(arg_39_0.craftTargetCount:Find("Text"), var_39_0)
end

function var_0_0.UpdateAttrs(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	local var_41_0
	local var_41_1

	if arg_41_0.craftMode == var_0_1 then
		var_41_0 = SpWeaponHelper.TransformCompositeInfo(arg_41_2)
		var_41_1 = arg_41_2:GetSkillGroup()
		arg_41_3 = arg_41_2
	elseif arg_41_0.craftMode == var_0_2 then
		arg_41_3 = arg_41_3 or arg_41_2
		var_41_0 = SpWeaponHelper.TransformUpgradeInfo(arg_41_2, arg_41_3)
		var_41_1 = arg_41_3:GetSkillGroup()
	end

	arg_41_0:UpdateSpWeaponUpgradeInfo(arg_41_1, var_41_0, var_41_1, arg_41_3)
end

function var_0_0.UpdateSpWeaponUpgradeInfo(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4)
	local var_42_0 = arg_42_1:Find("attr_tpl")

	removeAllChildren(arg_42_1:Find("attrs"))

	local function var_42_1(arg_43_0, arg_43_1)
		local var_43_0 = arg_43_0:Find("base")
		local var_43_1 = arg_43_1.name
		local var_43_2 = arg_43_1.value

		setText(var_43_0:Find("name"), var_43_1)
		setActive(var_43_0:Find("value"), true)
		setText(var_43_0:Find("value"), var_43_2)
		setActive(var_43_0:Find("effect"), false)
		setActive(var_43_0:Find("value/up"), arg_43_1.compare and arg_43_1.compare > 0)
		setActive(var_43_0:Find("value/down"), arg_43_1.compare and arg_43_1.compare < 0)
		triggerToggle(var_43_0, arg_43_1.lock_open)

		if not arg_43_1.lock_open and arg_43_1.sub and #arg_43_1.sub > 0 then
			GetComponent(var_43_0, typeof(Toggle)).enabled = true
		else
			setActive(var_43_0:Find("name/close"), false)
			setActive(var_43_0:Find("name/open"), false)

			GetComponent(var_43_0, typeof(Toggle)).enabled = false
		end
	end

	;(function(arg_44_0, arg_44_1, arg_44_2)
		for iter_44_0, iter_44_1 in ipairs(arg_44_2) do
			local var_44_0 = cloneTplTo(arg_44_1, arg_44_0)

			var_42_1(var_44_0, iter_44_1)
		end
	end)(arg_42_1:Find("attrs"), var_42_0, arg_42_2)

	local var_42_2 = {}

	if arg_42_3[1].skillId > 0 then
		table.insert(var_42_2, {
			name = i18n("spweapon_attr_effect"),
			effect = arg_42_3[1]
		})
	end

	for iter_42_0, iter_42_1 in ipairs(arg_42_3[2]) do
		table.insert(var_42_2, {
			isSkill = true,
			name = i18n("spweapon_attr_skillupgrade"),
			effect = iter_42_1
		})
	end

	local function var_42_3(arg_45_0, arg_45_1)
		local var_45_0 = arg_45_0:Find("base")
		local var_45_1 = arg_45_1.name
		local var_45_2 = arg_45_1.effect

		setText(var_45_0:Find("name"), var_45_1)
		setActive(var_45_0:Find("value"), false)
		setActive(var_45_0:Find("effect"), true)

		local var_45_3 = getSkillName(var_45_2.skillId)

		if not var_45_2.unlock then
			var_45_3 = setColorStr(var_45_3, "#a2a2a2")

			setTextColor(var_45_0:Find("effect"), SummerFeastScene.TransformColor("a2a2a2"))
		else
			setTextColor(var_45_0:Find("effect"), SummerFeastScene.TransformColor("FFDE00"))
		end

		local var_45_4 = "<material=underline event=displaySkill>" .. var_45_3 .. "</material>"

		var_45_0:Find("effect"):GetComponent("RichText"):AddListener(function(arg_46_0, arg_46_1)
			if arg_46_0 == "displaySkill" then
				local var_46_0 = getSkillDesc(var_45_2.skillId, var_45_2.lv)

				if not var_45_2.unlock then
					var_46_0 = setColorStr(i18n("spweapon_tip_skill_locked") .. var_46_0, "#a2a2a2")
				end

				if not arg_45_1.isSkill then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_SPWEAPON,
							id = arg_42_4:GetConfigID()
						},
						name = var_45_3,
						content = var_46_0
					})
				else
					arg_42_0:emit(SpWeaponUpgradeMediator.ON_SKILLINFO, var_45_2.skillId, var_45_2.unlock, 10)
				end
			end
		end)
		setText(var_45_0:Find("effect"), var_45_4)
		setActive(var_45_0:Find("value/up"), false)
		setActive(var_45_0:Find("value/down"), false)
		triggerToggle(var_45_0, false)
		setActive(var_45_0:Find("name/close"), false)
		setActive(var_45_0:Find("name/open"), false)

		GetComponent(var_45_0, typeof(Toggle)).enabled = false
	end

	;(function(arg_47_0, arg_47_1, arg_47_2)
		for iter_47_0, iter_47_1 in ipairs(arg_47_2) do
			local var_47_0 = cloneTplTo(arg_47_1, arg_47_0)

			var_42_3(var_47_0, iter_47_1)
		end
	end)(arg_42_1:Find("attrs"), var_42_0, var_42_2)
end

function var_0_0.UpdateExpBar(arg_48_0)
	local var_48_0 = arg_48_0.upgradeMaxLevel

	setActive(arg_48_0.materialPanelExpLv, not var_48_0)
	setActive(arg_48_0.materialPanelExpFullText, var_48_0)
	setActive(arg_48_0.materialPanelExpBarFull, var_48_0)

	if not var_48_0 then
		setSlider(arg_48_0.materialPanelExpBar, 0, 1, (arg_48_0.upgradePtTotal - arg_48_0.upgradePtOrigin) / (arg_48_0.upgradePtMax - arg_48_0.upgradePtOrigin))

		if arg_48_0.upgradeType == var_0_3 then
			setText(arg_48_0.materialPanelExpLv, i18n("spweapon_ui_create_exp"))
		elseif arg_48_0.upgradeType == var_0_4 then
			setText(arg_48_0.materialPanelExpLv, i18n("spweapon_ui_upgrade_exp"))
		elseif arg_48_0.upgradeType == var_0_5 then
			setText(arg_48_0.materialPanelExpLv, i18n("spweapon_ui_breakout_exp"))
		end

		setText(arg_48_0.materialPanelExpCurrentText, arg_48_0.upgradePtTotal - arg_48_0.upgradePtOrigin)
		setText(arg_48_0.materialPanelExpTotalText, arg_48_0.upgradePtMax - arg_48_0.upgradePtOrigin)
	else
		setText(arg_48_0.materialPanelExpCurrentText, 0)
		setText(arg_48_0.materialPanelExpTotalText, 0)
	end
end

function var_0_0.UpdateMaterials(arg_49_0)
	local var_49_0 = arg_49_0.upgradNeedMaterials
	local var_49_1 = arg_49_0.upgradNeedGold
	local var_49_2 = arg_49_0.spWeaponVO:GetNextUpgradeID() == 0

	setActive(arg_49_0.materialPanelMaterialList, not var_49_2)
	setActive(arg_49_0.materialPanelMaterialListLimit, var_49_2)

	local var_49_3
	local var_49_4 = true

	for iter_49_0 = 1, #arg_49_0.materialPanelMaterialItems do
		local var_49_5 = arg_49_0.materialPanelMaterialItems[iter_49_0]

		setActive(findTF(var_49_5, "off"), not var_49_0[iter_49_0])
		setActive(findTF(var_49_5, "Icon"), var_49_0[iter_49_0])

		if var_49_0[iter_49_0] then
			local var_49_6 = var_49_0[iter_49_0]
			local var_49_7 = var_49_6.id
			local var_49_8 = findTF(var_49_5, "Icon")
			local var_49_9 = {
				type = DROP_TYPE_ITEM,
				id = var_49_6.id,
				count = var_49_6.count
			}

			updateDrop(var_49_8, var_49_9)
			onButton(arg_49_0, var_49_8, function()
				arg_49_0:emit(BaseUI.ON_DROP, var_49_9)
			end)

			local var_49_10 = defaultValue(arg_49_0.itemVOs[var_49_7], {
				count = 0
			})
			local var_49_11 = var_49_6.count .. "/" .. var_49_10.count

			if var_49_10.count < var_49_6.count then
				var_49_11 = setColorStr(var_49_10.count, COLOR_RED) .. "/" .. var_49_6.count
				var_49_4 = false
				var_49_3 = var_49_6.id
			end

			local var_49_12 = findTF(var_49_8, "icon_bg/count")

			setActive(var_49_12, true)
			setText(var_49_12, var_49_11)

			local var_49_13 = var_49_8:Find("Click")

			setActive(var_49_13, not arg_49_0.confirmUpgrade and arg_49_0.upgradeType == var_0_5)
			onButton(arg_49_0, var_49_13, function()
				arg_49_0.confirmUpgrade = true

				setActive(var_49_13, not arg_49_0.confirmUpgrade)
			end)
		end
	end

	setText(arg_49_0.materialPanelCostText, var_49_1)
	setActive(arg_49_0.materialPanelButtonCreate, arg_49_0.craftMode == var_0_1)
	setActive(arg_49_0.materialPanelButtonUpgrade, arg_49_0.craftMode == var_0_2 and arg_49_0.upgradeType == var_0_5)
	setActive(arg_49_0.materialPanelButtonStrengthen, arg_49_0.craftMode == var_0_2 and arg_49_0.upgradeType == var_0_4)
	setActive(arg_49_0.equipmentPanelTitleComposite, arg_49_0.craftMode == var_0_1)
	setActive(arg_49_0.equipmentPanelTitleUpgrade, arg_49_0.craftMode == var_0_2 and arg_49_0.upgradeType == var_0_5)
	setActive(arg_49_0.equipmentPanelTitleStrengthen, arg_49_0.craftMode == var_0_2 and arg_49_0.upgradeType == var_0_4)
	onButton(arg_49_0, arg_49_0.materialPanelButton, function()
		if not var_49_4 then
			if not ItemTipPanel.ShowItemTipbyID(var_49_3) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("spweapon_tip_materal_no_enough"))
			end

			return
		end

		if arg_49_0.playerVO.gold < var_49_1 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					var_49_1 - arg_49_0.playerVO.gold,
					var_49_1
				}
			})

			return
		end

		if not arg_49_0.confirmUpgrade and arg_49_0.upgradeType == var_0_5 and #arg_49_0.upgradNeedMaterials > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("spweapon_tip_breakout_materal_check"))

			return
		end

		if arg_49_0.craftMode == var_0_1 then
			arg_49_0:emit(SpWeaponUpgradeMediator.EQUIPMENT_COMPOSITE, arg_49_0.spWeaponVO:GetConfigID(), arg_49_0.consumeItems, arg_49_0.consumeSpweapons)
		elseif arg_49_0.craftMode == var_0_2 then
			arg_49_0:emit(SpWeaponUpgradeMediator.EQUIPMENT_UPGRADE, arg_49_0.spWeaponVO:GetUID(), arg_49_0.consumeItems, arg_49_0.consumeSpweapons)
		end
	end, SFX_UI_DOCKYARD_REINFORCE)
	setGray(arg_49_0.materialPanelButton, arg_49_0.upgradeMaxLevel)
	setButtonEnabled(arg_49_0.materialPanelButton, not arg_49_0.upgradeMaxLevel)
end

function var_0_0.UpdatePtMaterials(arg_53_0, arg_53_1)
	arg_53_0.candicateMaterials = _.map(var_0_6, function(arg_54_0)
		return arg_53_0.itemVOs[arg_54_0] or Item.New({
			count = 0,
			id = arg_54_0
		})
	end)

	table.sort(arg_53_0.candicateMaterials, function(arg_55_0, arg_55_1)
		return arg_55_0.id < arg_55_1.id
	end)

	local var_53_0 = table.equal(arg_53_0.contextData.indexDatas, var_0_7)

	setActive(arg_53_0.leftPanelFilterButton:Find("Off"), var_53_0)
	setActive(arg_53_0.leftPanelFilterButton:Find("On"), not var_53_0)

	arg_53_0.candicateSpweapons = {}

	for iter_53_0, iter_53_1 in pairs(arg_53_0.spWeaponList) do
		if iter_53_1:GetUID() ~= arg_53_0.spWeaponVO:GetUID() and not iter_53_1:IsUnCraftable() and not iter_53_1:GetShipId() and IndexConst.filterSpWeaponByType(iter_53_1, arg_53_0.contextData.indexDatas.typeIndex) and IndexConst.filterSpWeaponByRarity(iter_53_1, arg_53_0.contextData.indexDatas.rarityIndex) then
			table.insert(arg_53_0.candicateSpweapons, iter_53_1)
		end
	end

	local var_53_1 = SpWeaponSortCfg
	local var_53_2 = true

	table.sort(arg_53_0.candicateSpweapons, CompareFuncs(var_53_1.sortFunc(var_53_1.sort[1], var_53_2)))
	arg_53_0.leftPanelItemRect:align(#arg_53_0.candicateMaterials)

	if not arg_53_1 then
		arg_53_0.leftPanelEquipScrollComp:SetTotalCount(#arg_53_0.candicateSpweapons)
	end

	setActive(arg_53_0.leftPanelAutoSelectButton:Find("On"), not arg_53_0.ptMax)
	setActive(arg_53_0.leftPanelAutoSelectButton:Find("Off"), arg_53_0.ptMax)
	setButtonEnabled(arg_53_0.leftPanelAutoSelectButton, not arg_53_0.ptMax)

	local var_53_3 = #arg_53_0.consumeItems > 0

	setActive(arg_53_0.leftPanelClearSelectButton:Find("On"), var_53_3)
	setActive(arg_53_0.leftPanelClearSelectButton:Find("Off"), not var_53_3)
	setButtonEnabled(arg_53_0.leftPanelClearSelectButton, var_53_3)
end

function var_0_0.UpdateSelectMaterial(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = arg_56_0:GetSelectMaterial(arg_56_1)
	local var_56_1 = var_56_0 and var_56_0.count or 0
	local var_56_2 = arg_56_0.itemVOs[arg_56_1] and arg_56_0.itemVOs[arg_56_1].count or 0

	if arg_56_2 > 0 then
		if arg_56_0.ptMax then
			pg.TipsMgr.GetInstance():ShowTips(i18n("spweapon_tip_upgrade"))

			return true
		end

		local var_56_3 = math.max(var_56_2 - var_56_1, 0)

		arg_56_2 = math.min(arg_56_2, var_56_3)

		if arg_56_2 > 0 then
			if not var_56_0 then
				var_56_0 = Item.New({
					count = 0,
					id = arg_56_1
				})

				table.insert(arg_56_0.consumeItems, var_56_0)
			end

			var_56_0.count = var_56_0.count + arg_56_2
		end

		if var_56_2 <= var_56_1 + arg_56_2 then
			return true
		end
	elseif arg_56_2 < 0 then
		local var_56_4 = -var_56_1

		arg_56_2 = math.max(arg_56_2, var_56_4)

		if arg_56_2 < 0 and var_56_0 then
			var_56_0.count = var_56_0.count + arg_56_2

			if var_56_0.count <= 0 then
				table.removebyvalue(arg_56_0.consumeItems, var_56_0)
			end
		end

		if var_56_1 + arg_56_2 <= 0 then
			return true
		end
	end
end

function var_0_0.GetSelectMaterial(arg_57_0, arg_57_1)
	return _.detect(arg_57_0.consumeItems, function(arg_58_0)
		return arg_58_0.id == arg_57_1
	end)
end

function var_0_0.GetSelectSpWeapon(arg_59_0, arg_59_1)
	if table.contains(arg_59_0.consumeSpweapons, arg_59_1) then
		return arg_59_1
	end
end

function var_0_0.ClearSelectMaterials(arg_60_0)
	table.clear(arg_60_0.consumeItems)
	table.clear(arg_60_0.consumeSpweapons)
end

function var_0_0.willExit(arg_61_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_61_0._tf)
	ClearLScrollrect(arg_61_0.leftPanelEquipScrollComp)
	arg_61_0.loader:Clear()
end

return var_0_0
