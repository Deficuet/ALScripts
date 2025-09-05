local var_0_0 = class("IslandShipDressUpPageNew", import("...base.IslandBasePage"))

var_0_0.CHANGE_SKIN = "IslandShipDressUpPage:CHANGE_SKIN"

function var_0_0.getUIName(arg_1_0)
	return "IslandShipDressUI"
end

local var_0_1 = {
	IslandShipDressHelperNew.DressType.Hair,
	IslandShipDressHelperNew.DressType.Face,
	IslandShipDressHelperNew.DressType.Body,
	[5] = IslandShipDressHelperNew.DressType.BackDecorate,
	[6] = IslandShipDressHelperNew.DressType.Flotage,
	[7] = IslandShipDressHelperNew.DressType.Footprint
}

var_0_0.SORT_DEFAULT = 1
var_0_0.SORT_RARITY = 2
var_0_0.SORT_CANSEND = 3
var_0_0.SORT_LIST = {
	var_0_0.SORT_DEFAULT,
	var_0_0.SORT_RARITY,
	var_0_0.SORT_CANSEND
}
var_0_0.SORTCN = {
	[var_0_0.SORT_DEFAULT] = i18n("word_default"),
	[var_0_0.SORT_RARITY] = i18n("word_rarity"),
	[var_0_0.SORT_CANSEND] = i18n("island_word_give")
}

function var_0_0.Sort2CN(arg_2_0)
	return var_0_0.SORTCN[arg_2_0]
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.rightPanel = arg_3_0:findTF("adapt/right_panel")
	arg_3_0.togglePanel = arg_3_0.rightPanel:Find("toggles/select_toggles")
	arg_3_0.saveBtn = arg_3_0:findTF("adapt/save")
	arg_3_0.restBtn = arg_3_0:findTF("adapt/reset")
	arg_3_0.toggles = {
		arg_3_0.togglePanel:Find("hair"),
		arg_3_0.togglePanel:Find("face"),
		arg_3_0.togglePanel:Find("body"),
		arg_3_0.togglePanel:Find("skin"),
		arg_3_0.togglePanel:Find("wing"),
		arg_3_0.togglePanel:Find("trailing"),
		arg_3_0.togglePanel:Find("footprint")
	}
	arg_3_0.dressCards = {}
	arg_3_0.skinCards = {}
	arg_3_0.dressTF = arg_3_0.rightPanel:Find("dress")
	arg_3_0.skinTF = arg_3_0.rightPanel:Find("skin")
	arg_3_0.dressRectTF = arg_3_0.dressTF:Find("dress_container")
	arg_3_0.dressRect = arg_3_0.dressTF:Find("dress_container/dress"):GetComponent("LScrollRect")
	arg_3_0.dressEmpty = arg_3_0.dressTF:Find("dressEmpty")
	arg_3_0.dressEmptyTips = arg_3_0.dressEmpty:Find("layout/empty_tips")
	arg_3_0.dressList = {}

	function arg_3_0.dressRect.onInitItem(arg_4_0)
		arg_3_0:OnDressInitItem(arg_4_0)
	end

	function arg_3_0.dressRect.onUpdateItem(arg_5_0, arg_5_1)
		arg_3_0:OnDressUpdateItem(arg_5_0, arg_5_1)
	end

	arg_3_0.skinRect = arg_3_0.skinTF:Find("dress_container/dress"):GetComponent("LScrollRect")
	arg_3_0.skinRectTF = arg_3_0.skinTF:Find("dress_container")
	arg_3_0.skinEmpty = arg_3_0.skinTF:Find("skinEmpty")

	function arg_3_0.skinRect.onInitItem(arg_6_0)
		arg_3_0:OnSkinInitItem(arg_6_0)
	end

	function arg_3_0.skinRect.onUpdateItem(arg_7_0, arg_7_1)
		arg_3_0:OnSkinUpdateItem(arg_7_0, arg_7_1)
	end

	arg_3_0.sortBtn = arg_3_0.dressTF:Find("order")
	arg_3_0.orderBtn = arg_3_0.sortBtn:Find("icon")
	arg_3_0.orderTxt = arg_3_0.sortBtn:Find("Text_1"):GetComponent(typeof(Text))
	arg_3_0.sortPage = IslandShipDressUpSortPage.New(arg_3_0._tf)
	arg_3_0.dressUpConfireBtn = arg_3_0:findTF("confire")
	arg_3_0.colorList = arg_3_0:findTF("adapt/left_color_panel/colorList")
	arg_3_0.colorItem = arg_3_0:findTF("adapt/left_color_panel/colorList/item")
	arg_3_0.color_listPanel = arg_3_0:findTF("adapt/left_color_panel")
	arg_3_0.color_bg_unlock = arg_3_0:findTF("adapt/left_color_panel/bg1")
	arg_3_0.color_bg_locked = arg_3_0:findTF("adapt/left_color_panel/bglocked")
	arg_3_0.color_lockedBtn = arg_3_0.color_bg_locked:Find("unlockedBtn")
	arg_3_0.color_cost_item_icon = arg_3_0.color_bg_locked:Find("itemcost")
	arg_3_0.color_cost_item_count = arg_3_0.color_bg_locked:Find("cost_num")

	setActive(arg_3_0.sortBtn, false)

	arg_3_0.colorItemUIList = UIItemList.New(arg_3_0.colorList, arg_3_0.colorItem)
	arg_3_0.hatTF = arg_3_0:findTF("adapt/hat")
	arg_3_0.hatOn = arg_3_0.hatTF:Find("hatOn")
	arg_3_0.hatOff = arg_3_0.hatTF:Find("hatOff")
end

function var_0_0.ClickDressCardItem(arg_8_0, arg_8_1)
	local var_8_0 = table.contains(IslandShipDressHelperNew.CommanderCustom, arg_8_0.dressType)

	if arg_8_0.curDressTypeDataDic[arg_8_0.dressType] == arg_8_1 then
		if var_8_0 then
			return
		else
			arg_8_1 = 0
		end
	end

	arg_8_0.curDressTypeDataDic[arg_8_0.dressType] = arg_8_1

	local var_8_1 = getProxy(IslandProxy):GetIsland()
	local var_8_2 = (function()
		local var_9_0 = 0

		if arg_8_1 ~= 0 and arg_8_0.shipId == 0 then
			var_9_0 = var_8_1:GetDressUpAgency():GetCurrentColorByDressId(arg_8_1)
			arg_8_0.dressColorDic[arg_8_1] = var_9_0
		end

		return var_9_0
	end)()

	arg_8_0.shipDressHelper:ChangeDressByType(arg_8_0.dressType, {
		id = arg_8_1,
		colorId = var_8_2
	})

	local var_8_3 = #arg_8_0.dressList

	arg_8_0.dressRect:SetTotalCount(var_8_3, 0)
	arg_8_0:UpdateHatDisplay()
	arg_8_0:UpdateColorList(true)
end

function var_0_0.UpdateHatToggleDisplay(arg_10_0, arg_10_1)
	setActive(arg_10_0.hatOn, not arg_10_1)
	setActive(arg_10_0.hatOff, arg_10_1)
end

function var_0_0.UpdateHatDisplay(arg_11_0)
	if arg_11_0.dressType ~= IslandShipDressHelperNew.DressType.Body then
		setActive(arg_11_0.hatTF, false)

		return
	end

	local var_11_0 = arg_11_0.curDressTypeDataDic[arg_11_0.dressType]

	if not var_11_0 or var_11_0 == 0 then
		setActive(arg_11_0.hatTF, false)

		return
	end

	local var_11_1 = (pg.island_dress_template.get_id_list_by_related_dress[var_11_0] or {})[1]

	if not var_11_1 then
		setActive(arg_11_0.hatTF, false)

		return
	end

	setActive(arg_11_0.hatTF, true)

	local var_11_2 = pg.island_dress_template[var_11_1].type
	local var_11_3 = getProxy(IslandProxy):GetIsland():GetDressUpAgency():GetBodyHatIsOn(var_11_0, var_11_1)

	arg_11_0.shipDressHelper:ChangeDressByType(var_11_2, {
		id = var_11_3 and var_11_1 or 0
	})

	arg_11_0.curDressTypeDataDic[var_11_2] = var_11_3 and var_11_1 or 0

	arg_11_0:UpdateHatToggleDisplay(var_11_3)
	onButton(arg_11_0, arg_11_0.hatOn, function()
		if arg_11_0.curDressTypeDataDic[var_11_2] ~= var_11_1 then
			arg_11_0.curDressTypeDataDic[var_11_2] = var_11_1

			arg_11_0.shipDressHelper:ChangeDressByType(var_11_2, {
				id = var_11_1
			})
			arg_11_0:UpdateHatToggleDisplay(true)
		end
	end)
	onButton(arg_11_0, arg_11_0.hatOff, function()
		if arg_11_0.curDressTypeDataDic[var_11_2] ~= 0 then
			arg_11_0.curDressTypeDataDic[var_11_2] = 0

			arg_11_0.shipDressHelper:ChangeDressByType(var_11_2, {
				id = 0
			})
			arg_11_0:UpdateHatToggleDisplay(false)
		end
	end)
end

function var_0_0.OnDressInitItem(arg_14_0, arg_14_1)
	local var_14_0 = IslandDressCard.New(arg_14_1)

	arg_14_0.dressCards[arg_14_1] = var_14_0
end

function var_0_0.OnDressUpdateItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.dressCards[arg_15_2]

	if not var_15_0 then
		arg_15_0:OnDressInitItem(arg_15_2)

		var_15_0 = arg_15_0.dressCards[arg_15_2]
	end

	local var_15_1 = arg_15_0.dressList[arg_15_1 + 1]

	setActive(var_15_0.canSendTF, not var_15_1.hasSend)

	local var_15_2 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	setText(var_15_0.ownNum, string.format("×%d", var_15_2:GetOwnDressCountByDressId(var_15_1.id)))

	local var_15_3
	local var_15_4 = var_15_1.id
	local var_15_5 = tf(arg_15_2)

	if var_15_1.hasSend then
		onButton(arg_15_0, var_15_5, function()
			arg_15_0:ClickDressCardItem(var_15_4)
		end)

		var_15_3 = arg_15_0.curDressTypeDataDic[arg_15_0.dressType]
	else
		onButton(arg_15_0, var_15_5, function()
			if var_15_2:GetHasDressData(var_15_4).read == 0 then
				local var_17_0 = {
					var_15_4
				}

				pg.m02:sendNotification(GAME.ISLAND_SEND_ROLE_DRESS_READ, {
					dress_List = var_17_0
				})
			end

			arg_15_0:ShowMsgBox({
				content = "是否赠送？",
				type = IslandMsgBox.TYPE_SEND_DRESS,
				onYes = function()
					pg.m02:sendNotification(GAME.ISLAND_SEND_ROLE_DRESS, {
						ship_id = arg_15_0.shipId,
						dress_id = var_15_4
					})
				end,
				onNo = function()
					return
				end,
				configId = var_15_4
			})
		end)
	end

	local var_15_6 = var_15_3 ~= 0 and var_15_3 or nil

	var_15_0:Update(var_15_4, var_15_6, var_15_1.hasSend)
end

function var_0_0.OnSkinInitItem(arg_20_0, arg_20_1)
	local var_20_0 = IslandSkinCard.New(arg_20_1)

	arg_20_0.skinCards[arg_20_1] = var_20_0
end

function var_0_0.OnSkinUpdateItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.skinCards[arg_21_2]

	if not var_21_0 then
		arg_21_0:OnSkinInitItem(arg_21_2)

		var_21_0 = arg_21_0.skinCards[arg_21_2]
	end

	local var_21_1 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
	local var_21_2 = arg_21_0.skinList[arg_21_1 + 1]
	local var_21_3 = tf(arg_21_2)
	local var_21_4 = #pg.island_skin_colordiff_template.get_id_list_by_skin_group[var_21_2] or {}

	setActive(var_21_3:Find("changeColor"), var_21_4 > 0)

	local var_21_5 = var_21_1:CheckSkinIsOwned(var_21_2)
	local var_21_6 = arg_21_0.curSkinId
	local var_21_7 = var_21_6 ~= 0 and var_21_6 or nil

	var_21_0:Update(var_21_2, var_21_7, var_21_5)
	onButton(arg_21_0, var_21_3, function()
		arg_21_0:ClickSkinCardItem(var_21_2)
	end)
	onButton(arg_21_0, var_21_0.buyTF, function()
		local var_23_0 = pg.island_skin_template[var_21_2]
		local var_23_1 = {
			{
				value2 = 1,
				key = var_23_0.shop_id,
				value1 = var_23_0.shop_goods_id
			}
		}
		local var_23_2 = pg.island_shop_goods[var_23_0.shop_goods_id]

		arg_21_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_COMMON,
			content = i18n("island_dress_skin_buy", "钻石x" .. var_23_2.resource_consume[3], var_23_0.name),
			onYes = function()
				arg_21_0:emit(IslandMediator.BUY_COMMODITY, var_23_1)
			end,
			onNo = function()
				return
			end
		})
	end)
end

function var_0_0.ChangeModelBySkinAndSkinColor(arg_26_0)
	local var_26_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_26_0.shipId):GetModelBySkinAndColorId(arg_26_0.curSkinId, arg_26_0.curskinColorId)

	arg_26_0.shipDressHelper:ChangeModelTransfromByUnitId(var_26_0)
end

function var_0_0.ClickSkinCardItem(arg_27_0, arg_27_1)
	if arg_27_1 == arg_27_0.curSkinId then
		arg_27_0.curSkinId = 0
	else
		arg_27_0.curSkinId = arg_27_1
	end

	arg_27_0:UpdateSkinList()

	if arg_27_0.curSkinId ~= 0 then
		arg_27_0.curskinColorId = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetCurrentSkinColorByShipId(arg_27_0.shipId, arg_27_0.curSkinId)
	end

	arg_27_0:ChangeModelBySkinAndSkinColor()
	arg_27_0:UpdateColorList()
	arg_27_0:UpdateHatDisplay()
end

function var_0_0.ClearSkinSelected(arg_28_0, arg_28_1)
	return
end

function var_0_0.AddListeners(arg_29_0)
	arg_29_0:AddListener(GAME.ISLAND_SEND_ROLE_DRESS_DONE, arg_29_0.OnSendRoleDressDone)
	arg_29_0:AddListener(GAME.ISLAND_SEND_ROLE_DRESS_READ_DONE, arg_29_0.OnSendRoleDressReadDone)
	arg_29_0:AddListener(GAME.ISLAND_BUY_ROLE_SKIN_COLOR_DONE, arg_29_0.OnBuyRoleSkinColorDone)
	arg_29_0:AddListener(GAME.ISLAND_BUY_ROLE_DRESS_COLOR_DONE, arg_29_0.OnBuyRoleDressColorDone)
	arg_29_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_29_0.GetBuySkindDone)
end

function var_0_0.RemoveListeners(arg_30_0)
	arg_30_0:RemoveListener(GAME.ISLAND_SEND_ROLE_DRESS_DONE, arg_30_0.OnSendRoleDressDone)
	arg_30_0:RemoveListener(GAME.ISLAND_SEND_ROLE_DRESS_READ_DONE, arg_30_0.OnSendRoleDressReadDone)
	arg_30_0:RemoveListener(GAME.ISLAND_BUY_ROLE_SKIN_COLOR_DONE, arg_30_0.OnBuyRoleSkinColorDone)
	arg_30_0:RemoveListener(GAME.ISLAND_BUY_ROLE_DRESS_COLOR_DONE, arg_30_0.OnBuyRoleDressColorDone)
	arg_30_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_30_0.GetBuySkindDone)
end

function var_0_0.OnClosePage(arg_31_0, arg_31_1)
	return
end

function var_0_0.OnInit(arg_32_0)
	onButton(arg_32_0, arg_32_0.saveBtn, function()
		if not arg_32_0:CheckDressIsDirty() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_save1"))

			return
		end

		arg_32_0:SaveDressUpDataHandle()
	end, SFX_PANEL)
	onButton(arg_32_0, arg_32_0.dressUpConfireBtn, function()
		arg_32_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_COMMON,
			content = i18n("island_dressup_tip"),
			onYes = function()
				arg_32_0:SaveDressUpDataHandle()
			end,
			onNo = function()
				return
			end
		})
	end, SFX_PANEL)
	onButton(arg_32_0, arg_32_0.restBtn, function()
		arg_32_0:ResetDressUp()
	end, SFX_PANEL)

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.toggles) do
		onToggle(arg_32_0, iter_32_1, function(arg_38_0)
			if arg_38_0 then
				arg_32_0:SwitchPage(iter_32_0)
			end
		end, SFX_PANEL)
	end

	onButton(arg_32_0, arg_32_0.sortBtn, function()
		arg_32_0.sortPage:ExecuteAction("Show", arg_32_0.indexData, function(arg_40_0)
			arg_32_0:OnSort(arg_40_0)
		end)
	end, SFX_PANEL)
	onButton(arg_32_0, arg_32_0.orderBtn, function()
		local var_41_0 = 1 - arg_32_0.indexData.order

		arg_32_0:OnOrder(var_41_0)
	end, SFX_PANEL)
end

function var_0_0.OnSort(arg_42_0, arg_42_1)
	arg_42_0.indexData.sortKey = arg_42_1

	arg_42_0:UpdateOrderTxt()
	arg_42_0:UpdateDressUpList()
end

function var_0_0.OnOrder(arg_43_0, arg_43_1)
	arg_43_0.indexData.order = arg_43_1
	arg_43_0.orderBtn.localScale = Vector3(1, arg_43_1 == 1 and 1 or -1, 1)

	arg_43_0:UpdateDressUpList()
end

function var_0_0.UpdateOrderTxt(arg_44_0)
	arg_44_0.orderTxt.text = var_0_0.SORTCN[arg_44_0.indexData.sortKey]
end

function var_0_0.SwitchPage(arg_45_0, arg_45_1)
	arg_45_0.currentToggleIndex = arg_45_1

	if arg_45_0.currentToggleIndex == 4 then
		setActive(arg_45_0.dressTF, false)
		setActive(arg_45_0.skinTF, true)
		arg_45_0:GetSkinList()
		arg_45_0:UpdateSkinList()
		arg_45_0:UpdateColorList()
	else
		arg_45_0.dressType = var_0_1[arg_45_0.currentToggleIndex]

		if arg_45_0.SmoothFunc then
			if arg_45_0.dressType == IslandShipDressHelperNew.DressType.BackDecorate then
				arg_45_0.SmoothFunc(Quaternion.Euler(0, 0, 0))
			else
				arg_45_0.SmoothFunc(Quaternion.Euler(0, 180, 0))
			end
		end

		setActive(arg_45_0.dressTF, true)
		setActive(arg_45_0.skinTF, false)
		arg_45_0:GetDressUpList()
		arg_45_0:UpdateDressUpList()
		arg_45_0:UpdateHatDisplay()
		arg_45_0:UpdateOrderTxt()
		arg_45_0:UpdateColorList(true)
	end
end

function var_0_0.GetDressUpList(arg_46_0)
	local var_46_0 = getProxy(IslandProxy):GetIsland()

	arg_46_0.dressList = {}

	if arg_46_0.shipId == 0 then
		local var_46_1 = var_46_0:GetDressUpAgency()

		for iter_46_0, iter_46_1 in ipairs(var_46_1:GetHasDressByType(arg_46_0.dressType)) do
			table.insert(arg_46_0.dressList, IslandDressItem.New({
				hasSend = true,
				id = iter_46_1.id
			}))
		end
	else
		local var_46_2 = var_46_0:GetCharacterAgency():GetShipById(arg_46_0.shipId)
		local var_46_3 = var_46_2:GetAllOwnDressList()
		local var_46_4 = var_46_2:GetALLHasSendToShipDress()

		for iter_46_2, iter_46_3 in ipairs(var_46_3) do
			if pg.island_dress_template[iter_46_3].type == arg_46_0.dressType then
				table.insert(arg_46_0.dressList, IslandDressItem.New({
					hasSend = false,
					id = iter_46_3
				}))
			end
		end

		for iter_46_4, iter_46_5 in ipairs(var_46_4) do
			if pg.island_dress_template[iter_46_5].type == arg_46_0.dressType then
				table.insert(arg_46_0.dressList, IslandDressItem.New({
					hasSend = true,
					id = iter_46_5
				}))
			end
		end
	end

	local var_46_5

	if arg_46_0.indexData.sortKey == var_0_0.SORT_DEFAULT then
		var_46_5 = {
			function(arg_47_0)
				return arg_47_0.id
			end
		}
	else
		var_46_5 = {
			function(arg_48_0)
				return arg_48_0:GetSortValue(arg_46_0.indexData.sortKey, arg_46_0.indexData.order)
			end
		}
	end

	table.sort(arg_46_0.dressList, CompareFuncs(var_46_5))
end

function var_0_0.GetSkinList(arg_49_0)
	if arg_49_0.shipId ~= 0 then
		local var_49_0 = getProxy(IslandProxy):GetIsland()

		arg_49_0.skinList = pg.island_skin_template.get_id_list_by_ship_group[arg_49_0.shipId] or {}
	end
end

function var_0_0.UpdateSkinList(arg_50_0)
	local var_50_0 = #arg_50_0.skinList

	setActive(arg_50_0.skinRectTF, var_50_0 ~= 0)
	setActive(arg_50_0.skinEmpty, var_50_0 == 0)
	arg_50_0.skinRect:SetTotalCount(var_50_0)
end

function var_0_0.UpdateDressUpList(arg_51_0)
	local var_51_0 = #arg_51_0.dressList

	setActive(arg_51_0.dressRectTF, var_51_0 ~= 0)
	setActive(arg_51_0.dressEmpty, var_51_0 == 0)
	setText(arg_51_0.dressEmptyTips, i18n("island_dress_no_item"))
	setActive(arg_51_0.sortBtn, false)

	if var_51_0 ~= 0 then
		arg_51_0.dressRect:SetTotalCount(var_51_0, 0)
	end
end

function var_0_0.OnShow(arg_52_0, arg_52_1, arg_52_2, arg_52_3, arg_52_4)
	arg_52_0.SmoothFunc = arg_52_4
	arg_52_0.isFirstDressUp = arg_52_2

	setActive(arg_52_0.color_listPanel, false)
	setActive(arg_52_0.saveBtn, not arg_52_2)
	setActive(arg_52_0.restBtn, not arg_52_2)

	arg_52_0.shipDressHelper = arg_52_3
	arg_52_0.shipId = arg_52_1
	arg_52_0.indexData = {
		order = 1,
		sortKey = var_0_0.SORT_DEFAULT
	}
	arg_52_0.smothObj = smothObj

	arg_52_0:InitCurDressData()
	setActive(arg_52_0.dressUpConfireBtn, arg_52_2)

	if arg_52_1 == 0 then
		setActive(arg_52_0.toggles[4], false)
		setActive(arg_52_0.toggles[5], not arg_52_2)
		setActive(arg_52_0.toggles[6], not arg_52_2)
		setActive(arg_52_0.toggles[7], not arg_52_2)
		triggerToggle(arg_52_0.toggles[1], true)
	else
		setActive(arg_52_0.toggles[4], true)
		triggerToggle(arg_52_0.toggles[4], true)
	end

	setActive(arg_52_0.toggles[1], arg_52_1 == 0)
	setActive(arg_52_0.toggles[2], arg_52_1 == 0)
	setActive(arg_52_0.toggles[3], arg_52_1 == 0)
	arg_52_0:UpdateRightReddot()
end

function var_0_0.InitCurDressData(arg_53_0)
	arg_53_0.curDressTypeDataDic = {}
	arg_53_0.dressColorDic = {}

	local var_53_0 = getProxy(IslandProxy):GetIsland()

	if arg_53_0.shipId == 0 then
		local var_53_1 = var_53_0:GetDressUpAgency()
		local var_53_2 = arg_53_0.isFirstDressUp and IslandShipDressHelperNew.CommanderCustom or IslandShipDressHelperNew.DressType

		for iter_53_0, iter_53_1 in pairs(var_53_2) do
			local var_53_3 = arg_53_0.isFirstDressUp and IslandShipDressHelperNew.GetInitDressByType(iter_53_1) or var_53_1:GetDressByType(iter_53_1)

			arg_53_0.curDressTypeDataDic[iter_53_1] = var_53_3

			if var_53_3 then
				arg_53_0.dressColorDic[var_53_3] = var_53_1:GetCurrentColorByDressId(var_53_3)
			end
		end

		print(123)
	else
		local var_53_4 = var_53_0:GetCharacterAgency()
		local var_53_5 = var_53_4:GetShipById(arg_53_0.shipId)

		arg_53_0.curSkinId = var_53_5:GetCurSkinId()

		if arg_53_0.curSkinId == 0 then
			arg_53_0.curskinColorId = 0
		else
			arg_53_0.curskinColorId = var_53_4:GetCurrentSkinColorByShipId(arg_53_0.shipId, arg_53_0.curSkinId)
		end

		for iter_53_2, iter_53_3 in pairs(IslandShipDressHelperNew.DressType) do
			arg_53_0.curDressTypeDataDic[iter_53_3] = var_53_5:GetDressByType(iter_53_3)
		end
	end
end

function var_0_0.CheckDressIsDirty(arg_54_0)
	local var_54_0 = getProxy(IslandProxy):GetIsland()

	if arg_54_0.shipId == 0 then
		local var_54_1 = var_54_0:GetDressUpAgency()

		for iter_54_0, iter_54_1 in pairs(arg_54_0.curDressTypeDataDic) do
			if (var_54_1:GetDressByType(iter_54_0) or 0) ~= iter_54_1 then
				return true
			end

			if iter_54_1 ~= 0 and var_54_1:GetCurrentColorByDressId(iter_54_1) ~= (arg_54_0.dressColorDic[iter_54_1] or 0) then
				return true
			end
		end

		return false
	else
		local var_54_2 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
		local var_54_3 = var_54_2:GetShipById(arg_54_0.shipId)
		local var_54_4 = var_54_3:GetCurSkinId()
		local var_54_5 = var_54_2:GetCurrentSkinColorByShipId(arg_54_0.shipId, var_54_4)

		if var_54_4 ~= arg_54_0.curSkinId or var_54_5 ~= arg_54_0.curskinColorId then
			return true
		end

		for iter_54_2, iter_54_3 in pairs(arg_54_0.curDressTypeDataDic) do
			if (var_54_3:GetDressByType(iter_54_2) or 0) ~= iter_54_3 then
				return true
			end
		end

		return false
	end
end

function var_0_0.ResetDressUp(arg_55_0)
	local var_55_0 = getProxy(IslandProxy):GetIsland()

	if arg_55_0.shipId == 0 then
		local var_55_1 = var_55_0:GetDressUpAgency()

		for iter_55_0, iter_55_1 in pairs(IslandShipDressHelperNew.DressType) do
			local var_55_2 = var_55_1:GetDressByType(iter_55_1) or 0
			local var_55_3 = var_55_1:GetCurrentColorByDressId(var_55_2)
			local var_55_4 = arg_55_0.curDressTypeDataDic[iter_55_1]
			local var_55_5 = arg_55_0.dressColorDic[var_55_4]

			if var_55_2 == var_55_4 and var_55_5 ~= var_55_3 then
				arg_55_0.shipDressHelper:ChangeCommanderPartColor(iter_55_1, var_55_3)

				return
			end

			arg_55_0.shipDressHelper:ChangeDressByType(iter_55_1, {
				id = var_55_2,
				colorId = var_55_3
			})

			arg_55_0.curDressTypeDataDic[iter_55_1] = var_55_2
			arg_55_0.dressColorDic[var_55_2] = var_55_3
		end

		local var_55_6 = arg_55_0.curDressTypeDataDic[IslandShipDressHelperNew.DressType.Body]
		local var_55_7 = var_55_1:GetBodyHatIsOn(var_55_6)

		arg_55_0:UpdateHatToggleDisplay(var_55_7)
		arg_55_0:UpdateDressUpList()
	else
		local var_55_8 = var_55_0:GetCharacterAgency()
		local var_55_9 = var_55_8:GetShipById(arg_55_0.shipId)

		if (function()
			local var_56_0 = var_55_9:GetCurSkinId()
			local var_56_1 = var_55_8:GetCurrentSkinColorByShipId(arg_55_0.shipId, var_56_0)

			if var_56_0 ~= arg_55_0.curSkinId or var_56_1 ~= arg_55_0.curskinColorId then
				arg_55_0.curSkinId = var_56_0
				arg_55_0.curskinColorId = var_56_1

				return true
			end

			return false
		end)() then
			local var_55_10 = var_55_9:GetModelBySkinAndColorId(arg_55_0.curSkinId, arg_55_0.curskinColorId)

			arg_55_0.shipDressHelper:ChangeModelTransfromByUnitId(var_55_10)
			arg_55_0:UpdateSkinList()
			arg_55_0:UpdateColorList()
		end

		local var_55_11 = {
			IslandShipDressHelperNew.DressType.BackDecorate,
			IslandShipDressHelperNew.DressType.Flotage,
			IslandShipDressHelperNew.DressType.Footprint
		}

		for iter_55_2, iter_55_3 in ipairs(var_55_11) do
			local var_55_12 = var_55_9:GetDressByType(iter_55_3) or 0
			local var_55_13 = 0

			if var_55_12 ~= 0 then
				local var_55_14 = dressUpAgency:GetCurrentColorByDressId(var_55_12)

				var_55_13 = arg_55_0.dressColorDic[var_55_12] or 0
			end

			arg_55_0.shipDressHelper:ChangeDressByType(iter_55_3, {
				id = var_55_13,
				colorId = var_55_13
			})

			arg_55_0.curDressTypeDataDic[iter_55_3] = var_55_12
			arg_55_0.dressColorDic[var_55_12] = var_55_13
		end

		arg_55_0:UpdateDressUpList()
	end
end

function var_0_0.CheckShipCanSave(arg_57_0)
	local var_57_0 = true
	local var_57_1 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	if not var_57_1:CheckSkinIsOwned(arg_57_0.curSkinId) then
		arg_57_0.curSkinId = var_57_1:GetShipById(arg_57_0.shipId):GetCurSkinId()
		var_57_0 = false
	end

	if arg_57_0.curSkinId ~= 0 and not var_57_1:CheckSkinColorIsOwned(arg_57_0.curSkinId, arg_57_0.curskinColorId) then
		arg_57_0.curskinColorId = var_57_1:GetCurrentSkinColorByShipId(arg_57_0.shipId, arg_57_0.curSkinId)
		var_57_0 = false
	end

	return var_57_0
end

function var_0_0.SaveDressUpDataHandle(arg_58_0)
	if arg_58_0.shipId == 0 then
		arg_58_0:SaveDressUpData()
	else
		if not arg_58_0:CheckShipCanSave() then
			local var_58_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_58_0.shipId):GetModelBySkinAndColorId(arg_58_0.curSkinId, arg_58_0.curskinColorId)

			arg_58_0.shipDressHelper:ChangeModelTransfromByUnitId(var_58_0)
			arg_58_0:UpdateSkinList()
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_save2"))

			return
		end

		arg_58_0:SaveDressUpData()
	end
end

function var_0_0.SaveDressUpData(arg_59_0)
	local var_59_0 = getProxy(IslandProxy):GetIsland()

	local function var_59_1()
		local var_60_0 = {}
		local var_60_1 = {}
		local var_60_2 = var_59_0:GetDressUpAgency()

		for iter_60_0, iter_60_1 in pairs(arg_59_0.curDressTypeDataDic) do
			local var_60_3 = var_60_2:GetDressByType(iter_60_0)
			local var_60_4 = false

			if iter_60_1 ~= var_60_3 then
				var_60_4 = true
			end

			if iter_60_0 == IslandShipDressHelperNew.DressType.Hat and iter_60_1 == 0 then
				var_60_4 = true
			end

			if var_60_4 then
				table.insert(var_60_0, {
					type = iter_60_0,
					id = iter_60_1
				})
			end

			local var_60_5 = arg_59_0.dressColorDic[iter_60_1] or 0

			if var_60_2:GetCurrentColorByDressId(iter_60_1) ~= var_60_5 then
				table.insert(var_60_1, {
					id = iter_60_1,
					color = var_60_5
				})
			end
		end

		return var_60_0, var_60_1
	end

	if arg_59_0.shipId == 0 then
		local var_59_2, var_59_3 = var_59_1()

		pg.m02:sendNotification(GAME.ISLAND_CHANGE_COMMANDER_DRESS, {
			dress_List = var_59_2,
			color_list = var_59_3,
			island_id = var_59_0.id
		})
	else
		local var_59_4 = var_59_1()
		local var_59_5 = {}

		pg.m02:sendNotification(GAME.ISLAND_CHANGE_DRESS, {
			dress_List = var_59_4,
			color_list = var_59_5,
			ship_id = arg_59_0.shipId,
			skin_id = arg_59_0.curSkinId,
			color_id = arg_59_0.curskinColorId
		})
	end
end

function var_0_0.CheckInReturn(arg_61_0, arg_61_1)
	if not arg_61_0:CheckDressIsDirty() then
		if arg_61_1 then
			arg_61_1()
		end

		return
	end

	local var_61_0 = getProxy(IslandProxy):GetIsland()

	if not arg_61_0:CheckShipCanSave() then
		if arg_61_1 then
			arg_61_1()
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_exit2"))

		return
	end

	arg_61_0:ShowMsgBox({
		type = IslandMsgBox.TYPE_COMMON,
		content = i18n("island_dressup_tip_1"),
		onYes = function()
			arg_61_0:SaveDressUpDataHandle()

			if arg_61_1 then
				arg_61_1()
			end
		end,
		onNo = function()
			if arg_61_1 then
				arg_61_1()
			end
		end
	})
end

function var_0_0.OnSendRoleDressDone(arg_64_0, arg_64_1)
	local var_64_0 = pg.island_dress_template[arg_64_1.dress_id]

	arg_64_0.shipDressHelper:ChangeDressByType(var_64_0.type, arg_64_1.dress_id)
	arg_64_0:GetDressUpList()
	arg_64_0:UpdateDressUpList()
end

function var_0_0.OnSendRoleDressReadDone(arg_65_0)
	arg_65_0:UpdateDressUpList()
	arg_65_0:UpdateRightReddot()
end

function var_0_0.OnBuyRoleSkinColorDone(arg_66_0)
	arg_66_0:UpdateColorList()
end

function var_0_0.OnBuyRoleDressColorDone(arg_67_0)
	arg_67_0:UpdateColorList(true)
end

function var_0_0.GetBuySkindDone(arg_68_0)
	arg_68_0:UpdateSkinList()
end

function var_0_0.UpdateRightReddot(arg_69_0)
	local var_69_0 = {
		5,
		6,
		7
	}

	for iter_69_0, iter_69_1 in ipairs(var_69_0) do
		local var_69_1 = arg_69_0.toggles[iter_69_1]:Find("red_dot")

		if arg_69_0.shipId == 0 then
			setActive(var_69_1, false)
		else
			local var_69_2 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():CheckRedDotByDressType(arg_69_0.dressType)

			setActive(var_69_1, var_69_2)
		end
	end
end

function var_0_0.UpdateColorPanel(arg_70_0)
	if not (function()
		if arg_70_0.isDressColor then
			local var_71_0 = arg_70_0.curDressTypeDataDic[arg_70_0.dressType]

			if not var_71_0 or var_71_0 == 0 then
				return false
			end

			return #(pg.island_dress_colordiff_template.get_id_list_by_belongto_dress[var_71_0] or {}) > 0
		end

		if not (arg_70_0.curSkinId ~= 0 and arg_70_0.curSkinId or nil) then
			return false
		end

		return true
	end)() then
		setActive(arg_70_0.color_listPanel, false)

		return
	end

	setActive(arg_70_0.color_listPanel, true)
end

function var_0_0.UpdateColorUnlockState(arg_72_0)
	local var_72_0
	local var_72_1
	local var_72_2

	if arg_72_0.isDressColor then
		var_72_2 = arg_72_0.curDressTypeDataDic[arg_72_0.dressType]

		if not var_72_2 or var_72_2 == 0 then
			return true
		end

		var_72_1 = arg_72_0.dressColorDic[var_72_2] or 0
		var_72_0 = pg.island_dress_colordiff_template[var_72_1]
	else
		var_72_0 = pg.island_skin_colordiff_template[arg_72_0.curskinColorId]
	end

	local var_72_3, var_72_4 = (function()
		local var_73_0 = getProxy(IslandProxy):GetIsland()

		if arg_72_0.isDressColor then
			if arg_72_0.shipId == 0 and var_73_0:GetDressUpAgency():CheckDressColorIsOwned(var_72_2, var_72_1) then
				return true
			end

			return false, true
		else
			if not arg_72_0.curskinColorId or arg_72_0.curskinColorId == 0 then
				return true
			end

			local var_73_1 = var_73_0:GetCharacterAgency()

			if var_73_1:CheckSkinColorIsOwned(arg_72_0.curSkinId, arg_72_0.curskinColorId) then
				return true
			end

			local var_73_2 = var_73_1:CheckSkinIsOwned(arg_72_0.curSkinId)

			return false, var_73_2
		end
	end)()

	if var_72_3 then
		setActive(arg_72_0.color_bg_unlock, true)
		setActive(arg_72_0.color_bg_locked, false)
	else
		setActive(arg_72_0.color_bg_unlock, false)
		setActive(arg_72_0.color_bg_locked, true)

		local var_72_5 = pg.island_item_data_template[var_72_0.cost[1][1]]

		GetImageSpriteFromAtlasAsync("island/" .. var_72_5.icon, "", arg_72_0.color_cost_item_icon)

		local var_72_6 = var_72_0.cost[1][2]

		setText(arg_72_0.color_cost_item_count, "×" .. var_72_6)
		setActive(arg_72_0.color_lockedBtn, var_72_4)
	end

	onButton(arg_72_0, arg_72_0.color_lockedBtn, function()
		local function var_74_0()
			if arg_72_0.isDressColor then
				pg.m02:sendNotification(GAME.ISLAND_BUY_ROLE_DRESS_COLOR, {
					id = arg_72_0.shipId,
					dress_id = var_72_2,
					color_id = var_72_1
				})
			else
				pg.m02:sendNotification(GAME.ISLAND_BUY_ROLE_SKIN_COLOR, {
					ship_id = arg_72_0.shipId,
					skin_id = selectSkinId,
					color_id = currentColorId
				})
			end
		end

		local var_74_1 = pg.island_item_data_template[var_72_0.cost[1][1]]
		local var_74_2 = i18n("island_dress_color_buy", var_74_1.name .. "x" .. var_72_0.cost[1][2])

		arg_72_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_COMMON,
			content = var_74_2,
			onYes = function()
				if not (function(arg_77_0)
					local var_77_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

					for iter_77_0, iter_77_1 in ipairs(arg_77_0) do
						local var_77_1 = iter_77_1[1]

						if iter_77_1[2] > var_77_0:GetOwnCount(var_77_1) then
							return false
						end
					end

					return true
				end)(var_72_0.cost) then
					pg.TipsMgr.GetInstance():ShowTips("消耗不够")

					return
				end

				var_74_0()
			end,
			onNo = function()
				return
			end
		})
	end)
end

function var_0_0.UpdateColorItemList(arg_79_0)
	(function()
		local var_80_0 = getProxy(IslandProxy):GetIsland()

		arg_79_0.colorItemList = {}

		if arg_79_0.isDressColor then
			local var_80_1 = var_80_0:GetDressUpAgency()
			local var_80_2 = arg_79_0.curDressTypeDataDic[arg_79_0.dressType]
			local var_80_3 = arg_79_0.dressColorDic[var_80_2]
			local var_80_4 = pg.island_dress_colordiff_template.get_id_list_by_belongto_dress[var_80_2] or {}

			if #var_80_4 > 0 then
				local var_80_5 = var_80_3 == 0
				local var_80_6 = true

				table.insert(arg_79_0.colorItemList, {
					itemId = 0,
					selected = var_80_5,
					owned = var_80_6
				})

				for iter_80_0, iter_80_1 in ipairs(var_80_4) do
					local var_80_7 = var_80_3 == iter_80_1
					local var_80_8 = var_80_1:CheckDressColorIsOwned(var_80_2, iter_80_1)

					table.insert(arg_79_0.colorItemList, {
						itemId = iter_80_1,
						selected = var_80_7,
						owned = var_80_8,
						costItemIcon = pg.island_dress_colordiff_template[iter_80_1].color_icon
					})
				end
			end
		else
			local var_80_9 = var_80_0:GetCharacterAgency()
			local var_80_10 = pg.island_skin_colordiff_template.get_id_list_by_skin_group[arg_79_0.curSkinId] or {}

			if #var_80_10 > 0 then
				local var_80_11 = arg_79_0.curskinColorId == 0
				local var_80_12 = var_80_9:CheckSkinIsOwned(arg_79_0.curSkinId)

				table.insert(arg_79_0.colorItemList, {
					itemId = 0,
					selected = var_80_11,
					owned = var_80_12
				})

				for iter_80_2, iter_80_3 in ipairs(var_80_10) do
					local var_80_13 = arg_79_0.curskinColorId == iter_80_3
					local var_80_14 = var_80_9:CheckSkinColorIsOwned(arg_79_0.curSkinId, iter_80_3)

					table.insert(arg_79_0.colorItemList, {
						itemId = iter_80_3,
						selected = var_80_13,
						owned = var_80_14,
						costItemIcon = pg.island_skin_colordiff_template[iter_80_3].color_icon
					})
				end
			end
		end
	end)()
	arg_79_0.colorItemUIList:make(function(arg_81_0, arg_81_1, arg_81_2)
		if arg_81_0 == UIItemList.EventUpdate then
			arg_81_1 = arg_81_1 + 1

			local var_81_0 = arg_79_0.colorItemList[arg_81_1]

			setActive(arg_81_2:Find("select"), var_81_0.selected)

			local var_81_1 = var_81_0.itemId

			setActive(arg_81_2:Find("orginName"), var_81_1 == 0)
			setActive(arg_81_2:Find("locked"), var_81_1 == 0)
			setText(arg_81_2:Find("orginName"), i18n("island_skin_original_desc"))
			setActive(arg_81_2:Find("icon"), false)

			if var_81_0.costItemIcon then
				setActive(arg_81_2:Find("icon"), true)
				GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. pg.island_dress_colordiff_template[var_81_1].color_icon, "", arg_81_2:Find("icon"))
			end

			setActive(arg_81_2:Find("locked"), not var_81_0.owned)
			onButton(arg_79_0, arg_81_2, function()
				if arg_79_0.isDressColor then
					local var_82_0 = arg_79_0.curDressTypeDataDic[arg_79_0.dressType]
					local var_82_1 = arg_79_0.dressColorDic[dressColorId]

					if var_81_1 == var_82_1 then
						return
					end

					arg_79_0.dressColorDic[var_82_0] = var_81_1

					arg_79_0.shipDressHelper:ChangeCommanderPartColor(arg_79_0.dressType, var_81_1)
				else
					if var_81_1 == arg_79_0.curskinColorId then
						return
					end

					arg_79_0.curskinColorId = var_81_1

					arg_79_0:ChangeModelBySkinAndSkinColor()
				end

				arg_79_0:UpdateColorList(arg_79_0.isDressColor)
			end)
		end
	end)
	arg_79_0.colorItemUIList:align(#arg_79_0.colorItemList)
end

function var_0_0.UpdateColorList(arg_83_0, arg_83_1)
	arg_83_0.isDressColor = arg_83_1

	arg_83_0:UpdateColorPanel()
	arg_83_0:UpdateColorUnlockState()
	arg_83_0:UpdateColorItemList()
end

function var_0_0.OnHide(arg_84_0)
	return
end

function var_0_0.OnDestroy(arg_85_0)
	for iter_85_0, iter_85_1 in pairs(arg_85_0.dressCards or {}) do
		-- block empty
	end

	arg_85_0.dressCards = nil
end

return var_0_0
