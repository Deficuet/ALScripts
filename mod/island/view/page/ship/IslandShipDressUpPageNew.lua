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
	arg_3_0.rightPanel = arg_3_0._tf:Find("adapt/right_panel")
	arg_3_0.togglePanel = arg_3_0.rightPanel:Find("toggles/select_toggles")
	arg_3_0.saveBtn = arg_3_0._tf:Find("adapt/save")
	arg_3_0.restBtn = arg_3_0._tf:Find("adapt/reset")

	setText(arg_3_0.saveBtn:Find("Text"), i18n("word_save"))
	setText(arg_3_0.restBtn:Find("Text"), i18n("island_word_reset"))

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
	arg_3_0.skinEmptyTips = arg_3_0.skinEmpty:Find("layout/empty_tips")

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
	arg_3_0.dressUpConfireBtn = arg_3_0._tf:Find("adapt/confire")
	arg_3_0.dressUpConfireText = arg_3_0._tf:Find("adapt/confire/Text")

	setText(arg_3_0.dressUpConfireText, i18n("island_dress_initial_makesure"))

	arg_3_0.colorList = arg_3_0._tf:Find("adapt/left_color_panel/colorList")
	arg_3_0.colorItem = arg_3_0._tf:Find("adapt/left_color_panel/colorList/item")
	arg_3_0.color_listPanel = arg_3_0._tf:Find("adapt/left_color_panel")
	arg_3_0.color_bg_unlock = arg_3_0._tf:Find("adapt/left_color_panel/bg1")
	arg_3_0.color_bg_locked = arg_3_0._tf:Find("adapt/left_color_panel/bglocked")
	arg_3_0.color_lockedBtn = arg_3_0.color_bg_locked:Find("unlockedBtn")
	arg_3_0.color_cost_item_icon = arg_3_0.color_bg_locked:Find("itemcost")
	arg_3_0.color_cost_item_count = arg_3_0.color_bg_locked:Find("cost_num")

	setActive(arg_3_0.sortBtn, false)
	setText(arg_3_0.color_bg_locked:Find("tips"), i18n("island_dresscolorunlock_tips"))
	setText(arg_3_0.color_lockedBtn:Find("Text"), i18n("island_dresscolorunlock"))

	arg_3_0.colorItemUIList = UIItemList.New(arg_3_0.colorList, arg_3_0.colorItem)
	arg_3_0.hatTF = arg_3_0._tf:Find("adapt/hat")
	arg_3_0.hatOn = arg_3_0.hatTF:Find("hatOn")
	arg_3_0.hatOff = arg_3_0.hatTF:Find("hatOff")
end

function var_0_0.CheckDressIsExclusive(arg_8_0, arg_8_1)
	local var_8_0 = pg.island_dress_template[arg_8_1]
	local var_8_1 = var_8_0.exclusive_skin

	if var_8_1 ~= "" then
		for iter_8_0, iter_8_1 in ipairs(var_8_1) do
			if iter_8_1 == arg_8_0.curSkinId then
				return false, true
			end
		end
	end

	local var_8_2 = var_8_0.exclusive_default_skin
	local var_8_3 = arg_8_0.curSkinId == nil or arg_8_0.curSkinId == 0

	if var_8_2 ~= "" and var_8_3 then
		for iter_8_2, iter_8_3 in ipairs(var_8_2) do
			if iter_8_3 == arg_8_0.shipId then
				return true, false
			end
		end
	end

	return false, false
end

function var_0_0.ClickDressCardItem(arg_9_0, arg_9_1)
	if arg_9_0.shipId ~= 0 then
		if arg_9_1.needRedDot then
			local var_9_0 = {}

			table.insert(var_9_0, arg_9_1.id)
			pg.m02:sendNotification(GAME.ISLAND_SEND_ROLE_DRESS_READ, {
				dress_List = var_9_0
			})
		end

		local var_9_1, var_9_2 = arg_9_0:CheckDressIsExclusive(arg_9_1.id)

		if var_9_2 or var_9_1 then
			local var_9_3 = pg.island_dress_template[arg_9_1.id]

			if var_9_1 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_mutually_exclusive1", var_9_3.name))

				return
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_mutually_exclusive1", var_9_3.name))

				return
			end
		end

		local var_9_4 = arg_9_0.curShipDressTypeDataDic[arg_9_0.dressType]

		if var_9_4:CheckIsEqualByShipIdAndDressId(arg_9_1.holdedShipId or 0, arg_9_1.id) then
			var_9_4:SetShipAndDressId(nil, nil)
		else
			var_9_4:SetShipAndDressId(arg_9_1.holdedShipId or 0, arg_9_1.id)
		end

		arg_9_0.shipDressHelper:ChangeDressByType(arg_9_0.dressType, {
			colorId = 0,
			id = var_9_4.dress_id or 0
		})

		local var_9_5 = #arg_9_0.dressList

		arg_9_0.dressRect:SetTotalCount(var_9_5)

		return
	end

	if arg_9_1.needRedDot then
		local var_9_6 = {}

		table.insert(var_9_6, arg_9_1.id)
		pg.m02:sendNotification(GAME.ISLAND_SEND_COMMANDER_DRESS_READ, {
			dress_List = var_9_6
		})
	end

	local var_9_7 = arg_9_1.id
	local var_9_8 = table.contains(IslandShipDressHelperNew.CommanderCustom, arg_9_0.dressType)

	if arg_9_0.curDressTypeDataDic[arg_9_0.dressType] == var_9_7 then
		if var_9_8 then
			return
		else
			var_9_7 = 0
		end
	end

	arg_9_0.curDressTypeDataDic[arg_9_0.dressType] = var_9_7

	local var_9_9 = (function()
		local var_10_0 = 0

		if var_9_7 ~= 0 and arg_9_0.shipId == 0 then
			var_10_0 = arg_9_0.dressUpAgency:GetCurrentColorByDressId(var_9_7)
			arg_9_0.dressColorDic[var_9_7] = var_10_0
		end

		return var_10_0
	end)()

	arg_9_0.shipDressHelper:ChangeDressByType(arg_9_0.dressType, {
		id = var_9_7,
		colorId = var_9_9
	})

	local var_9_10 = #arg_9_0.dressList

	arg_9_0.dressRect:SetTotalCount(var_9_10)
	arg_9_0:UpdateHatDisplay()
	arg_9_0:UpdateColorList(true)
end

function var_0_0.UpdateHatToggleDisplay(arg_11_0, arg_11_1)
	setActive(arg_11_0.hatOn, not arg_11_1)
	setActive(arg_11_0.hatOff, arg_11_1)
end

function var_0_0.UpdateHatDisplay(arg_12_0)
	if arg_12_0.dressType ~= IslandShipDressHelperNew.DressType.Body then
		setActive(arg_12_0.hatTF, false)

		return
	end

	local var_12_0 = arg_12_0.curDressTypeDataDic[arg_12_0.dressType]

	if not var_12_0 or var_12_0 == 0 then
		setActive(arg_12_0.hatTF, false)

		return
	end

	local var_12_1 = (pg.island_dress_template.get_id_list_by_related_dress[var_12_0] or {})[1]

	if not var_12_1 then
		setActive(arg_12_0.hatTF, false)

		return
	end

	setActive(arg_12_0.hatTF, true)

	local var_12_2 = pg.island_dress_template[var_12_1].type
	local var_12_3 = arg_12_0.dressUpAgency:GetBodyHatIsOn(var_12_0, var_12_1)

	arg_12_0.shipDressHelper:ChangeDressByType(var_12_2, {
		id = var_12_3 and var_12_1 or 0
	})

	arg_12_0.curDressTypeDataDic[var_12_2] = var_12_3 and var_12_1 or 0

	arg_12_0:UpdateHatToggleDisplay(var_12_3)
	onButton(arg_12_0, arg_12_0.hatOn, function()
		if arg_12_0.curDressTypeDataDic[var_12_2] ~= var_12_1 then
			arg_12_0.curDressTypeDataDic[var_12_2] = var_12_1

			arg_12_0.shipDressHelper:ChangeDressByType(var_12_2, {
				id = var_12_1
			})
			arg_12_0:UpdateHatToggleDisplay(true)
		end
	end)
	onButton(arg_12_0, arg_12_0.hatOff, function()
		if arg_12_0.curDressTypeDataDic[var_12_2] ~= 0 then
			arg_12_0.curDressTypeDataDic[var_12_2] = 0

			arg_12_0.shipDressHelper:ChangeDressByType(var_12_2, {
				id = 0
			})
			arg_12_0:UpdateHatToggleDisplay(false)
		end
	end)
end

function var_0_0.OnDressInitItem(arg_15_0, arg_15_1)
	local var_15_0 = IslandDressCard.New(arg_15_1)

	arg_15_0.dressCards[arg_15_1] = var_15_0
end

function var_0_0.OnDressUpdateItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.dressCards[arg_16_2]

	if not var_16_0 then
		arg_16_0:OnDressInitItem(arg_16_2)

		var_16_0 = arg_16_0.dressCards[arg_16_2]
	end

	local var_16_1 = arg_16_0.dressList[arg_16_1 + 1]

	setActive(var_16_0.canSendTF, false)

	local var_16_2 = var_16_1.ownCount ~= nil

	setActive(var_16_0.ownNumTF, var_16_2)

	if var_16_2 then
		setText(var_16_0.ownNumText, "×" .. var_16_1.ownCount)
	end

	local var_16_3 = var_16_1.holdedShipId ~= nil

	setActive(var_16_0.shipHoldTF, var_16_3)

	if var_16_3 then
		local var_16_4 = IslandShip.StaticGetPrefab(var_16_1.holdedShipId)

		GetImageSpriteFromAtlasAsync("island/IslandShipIcon/" .. var_16_4, "", var_16_0.shipIcon)
	end

	setActive(var_16_0.redDot, var_16_1.needRedDot)

	local var_16_5
	local var_16_6 = var_16_1.id
	local var_16_7 = tf(arg_16_2)

	onButton(arg_16_0, var_16_7, function()
		arg_16_0:ClickDressCardItem(var_16_1)
	end)

	local var_16_8 = false

	if arg_16_0.shipId == 0 then
		local var_16_9 = arg_16_0.curDressTypeDataDic[arg_16_0.dressType]

		var_16_8 = (var_16_9 ~= 0 and var_16_9 or nil) == var_16_1.id

		setActive(var_16_0.exclusionTF, false)
	else
		local var_16_10, var_16_11 = arg_16_0:CheckDressIsExclusive(var_16_1.id)
		local var_16_12 = var_16_10 or var_16_11

		setActive(var_16_0.exclusionTF, var_16_12)

		var_16_8 = arg_16_0.curShipDressTypeDataDic[arg_16_0.dressType]:CheckIsEqualByShipIdAndDressId(var_16_1.holdedShipId or 0, var_16_1.id)
	end

	var_16_0:Update(var_16_6, var_16_8)
end

function var_0_0.OnSkinInitItem(arg_18_0, arg_18_1)
	local var_18_0 = IslandSkinCard.New(arg_18_1)

	arg_18_0.skinCards[arg_18_1] = var_18_0
end

function var_0_0.OnSkinUpdateItem(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.skinCards[arg_19_2]

	if not var_19_0 then
		arg_19_0:OnSkinInitItem(arg_19_2)

		var_19_0 = arg_19_0.skinCards[arg_19_2]
	end

	local var_19_1 = arg_19_0.skinList[arg_19_1 + 1]
	local var_19_2 = tf(arg_19_2)

	setActive(var_19_2:Find("changeColor"), true)

	local var_19_3 = arg_19_0.curSkinId
	local var_19_4 = var_19_3 ~= 0 and var_19_3 or nil

	var_19_0:Update(var_19_1, var_19_4)
	onButton(arg_19_0, var_19_2, function()
		arg_19_0:ClickSkinCardItem(var_19_1)
	end)
end

function var_0_0.ChangeModelBySkinAndSkinColor(arg_21_0)
	local var_21_0 = arg_21_0.characterAgency:GetShipById(arg_21_0.shipId)
	local var_21_1 = {}
	local var_21_2 = {
		IslandShipDressHelperNew.DressType.BackDecorate,
		IslandShipDressHelperNew.DressType.Flotage,
		IslandShipDressHelperNew.DressType.Footprint
	}

	for iter_21_0, iter_21_1 in ipairs(var_21_2) do
		local var_21_3 = arg_21_0.curShipDressTypeDataDic[iter_21_1]

		if var_21_3 and var_21_3.dress_id and var_21_3.dress_id ~= 0 then
			if arg_21_0.curSkinId ~= 0 then
				local var_21_4 = pg.island_dress_template[var_21_3.dress_id].exclusive_skin
				local var_21_5 = var_21_4 == "" and {} or var_21_4

				for iter_21_2, iter_21_3 in ipairs(var_21_5) do
					if iter_21_3 == arg_21_0.curSkinId then
						table.insert(var_21_1, var_21_3.dress_id)
						var_21_3:SetShipAndDressId(nil, nil)
					end
				end
			else
				local var_21_6 = pg.island_dress_template[var_21_3.dress_id].exclusive_default_skin
				local var_21_7 = var_21_6 == "" and {} or var_21_6

				for iter_21_4, iter_21_5 in ipairs(var_21_7) do
					if iter_21_5 == arg_21_0.shipId then
						table.insert(var_21_1, var_21_3.dress_id)
						var_21_3:SetShipAndDressId(nil, nil)
					end
				end
			end
		end
	end

	if #var_21_1 > 0 then
		local var_21_8 = ""

		for iter_21_6, iter_21_7 in ipairs(var_21_1) do
			local var_21_9 = pg.island_dress_template[iter_21_7].name

			if iter_21_6 > 1 then
				var_21_9 = "," .. var_21_9
			end

			var_21_8 = var_21_8 .. var_21_9
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_mutually_exclusive", var_21_8))
	end

	arg_21_0:emit(IslandShipMainPage.CLEAR_ITEM_ANIMATOR)

	local var_21_10 = var_21_0:GetModelBySkinAndColorId(arg_21_0.curSkinId, arg_21_0.curskinColorId)

	if #var_21_1 > 0 then
		arg_21_0.shipDressHelper:ChangeModelTransfromByUnitIdAndChangeDress(var_21_10, var_21_1, nil, nil, true)
	else
		arg_21_0.shipDressHelper:ChangeModelTransfromByUnitId(var_21_10, nil, true)
	end
end

function var_0_0.ClickSkinCardItem(arg_22_0, arg_22_1)
	if arg_22_1 == arg_22_0.curSkinId then
		arg_22_0.curSkinId = 0
	else
		arg_22_0.curSkinId = arg_22_1
	end

	arg_22_0:UpdateSkinList()

	if arg_22_0.curSkinId ~= 0 then
		arg_22_0.curskinColorId = arg_22_0.characterAgency:GetCurrentSkinColorByShipId(arg_22_0.shipId, arg_22_0.curSkinId)
	end

	arg_22_0:ChangeModelBySkinAndSkinColor()
	arg_22_0:UpdateColorList()
	arg_22_0:UpdateHatDisplay()
end

function var_0_0.ClearSkinSelected(arg_23_0, arg_23_1)
	return
end

function var_0_0.AddListeners(arg_24_0)
	arg_24_0:AddListener(GAME.ISLAND_CHANGE_ROLE_DRESS_DONE, arg_24_0.OnChangeRoleDressDone)
	arg_24_0:AddListener(GAME.ISLAND_SEND_ROLE_DRESS_READ_DONE, arg_24_0.OnSendRoleDressReadDone)
	arg_24_0:AddListener(GAME.ISLAND_SEND_COMMANDER_DRESS_READ_DONE, arg_24_0.OnSendRoleDressReadDone)
	arg_24_0:AddListener(GAME.ISLAND_BUY_ROLE_SKIN_COLOR_DONE, arg_24_0.OnBuyRoleSkinColorDone)
	arg_24_0:AddListener(GAME.ISLAND_BUY_ROLE_DRESS_COLOR_DONE, arg_24_0.OnBuyRoleDressColorDone)
	arg_24_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_24_0.GetBuySkindDone)
end

function var_0_0.RemoveListeners(arg_25_0)
	arg_25_0:RemoveListener(GAME.ISLAND_CHANGE_ROLE_DRESS_DONE, arg_25_0.OnChangeRoleDressDone)
	arg_25_0:RemoveListener(GAME.ISLAND_SEND_ROLE_DRESS_READ_DONE, arg_25_0.OnSendRoleDressReadDone)
	arg_25_0:RemoveListener(GAME.ISLAND_SEND_COMMANDER_DRESS_READ_DONE, arg_25_0.OnSendRoleDressReadDone)
	arg_25_0:RemoveListener(GAME.ISLAND_BUY_ROLE_SKIN_COLOR_DONE, arg_25_0.OnBuyRoleSkinColorDone)
	arg_25_0:RemoveListener(GAME.ISLAND_BUY_ROLE_DRESS_COLOR_DONE, arg_25_0.OnBuyRoleDressColorDone)
	arg_25_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_25_0.GetBuySkindDone)
end

function var_0_0.OnClosePage(arg_26_0, arg_26_1)
	return
end

function var_0_0.OnInit(arg_27_0)
	onButton(arg_27_0, arg_27_0.saveBtn, function()
		if not arg_27_0:CheckDressIsDirty() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_save1"))

			return
		end

		arg_27_0:SaveDressUpDataHandle()
	end, SFX_PANEL)
	onButton(arg_27_0, arg_27_0.dressUpConfireBtn, function()
		arg_27_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_COMMON,
			content = i18n("island_dressup_tip"),
			onYes = function()
				arg_27_0:SaveDressUpDataHandle()
			end,
			onNo = function()
				return
			end
		})
	end, SFX_PANEL)
	onButton(arg_27_0, arg_27_0.restBtn, function()
		arg_27_0:ResetDressUp()
	end, SFX_PANEL)

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.toggles) do
		onToggle(arg_27_0, iter_27_1, function(arg_33_0)
			if arg_33_0 then
				arg_27_0:SwitchPage(iter_27_0)
			end
		end, SFX_PANEL)
	end

	onButton(arg_27_0, arg_27_0.sortBtn, function()
		arg_27_0.sortPage:ExecuteAction("Show", arg_27_0.indexData, function(arg_35_0)
			arg_27_0:OnSort(arg_35_0)
		end)
	end, SFX_PANEL)
	onButton(arg_27_0, arg_27_0.orderBtn, function()
		local var_36_0 = 1 - arg_27_0.indexData.order

		arg_27_0:OnOrder(var_36_0)
	end, SFX_PANEL)
end

function var_0_0.OnSort(arg_37_0, arg_37_1)
	arg_37_0.indexData.sortKey = arg_37_1

	arg_37_0:UpdateOrderTxt()
	arg_37_0:UpdateDressUpList()
end

function var_0_0.OnOrder(arg_38_0, arg_38_1)
	arg_38_0.indexData.order = arg_38_1
	arg_38_0.orderBtn.localScale = Vector3(1, arg_38_1 == 1 and 1 or -1, 1)

	arg_38_0:UpdateDressUpList()
end

function var_0_0.UpdateOrderTxt(arg_39_0)
	arg_39_0.orderTxt.text = var_0_0.SORTCN[arg_39_0.indexData.sortKey]
end

function var_0_0.SwitchPage(arg_40_0, arg_40_1)
	arg_40_0.currentToggleIndex = arg_40_1

	if arg_40_0.currentToggleIndex == 4 then
		setActive(arg_40_0.dressTF, false)
		setActive(arg_40_0.skinTF, true)
		setActive(arg_40_0.hatTF, false)
		arg_40_0:GetSkinList()
		arg_40_0:UpdateSkinList()
		arg_40_0:UpdateColorList()
	else
		arg_40_0.dressType = var_0_1[arg_40_0.currentToggleIndex]

		if arg_40_0.SmoothFunc then
			if arg_40_0.dressType == IslandShipDressHelperNew.DressType.BackDecorate then
				arg_40_0.SmoothFunc(Quaternion.Euler(0, 0, 0))
			else
				arg_40_0.SmoothFunc(Quaternion.Euler(0, 180, 0))
			end
		end

		setActive(arg_40_0.dressTF, true)
		setActive(arg_40_0.skinTF, false)
		arg_40_0:GetDressUpList()
		arg_40_0:UpdateDressUpList()
		arg_40_0:UpdateHatDisplay()
		arg_40_0:UpdateOrderTxt()
		arg_40_0:UpdateColorList(true)
	end
end

function var_0_0.GetDressUpList(arg_41_0)
	arg_41_0.dressList = {}

	if arg_41_0.shipId == 0 then
		for iter_41_0, iter_41_1 in ipairs(arg_41_0.dressUpAgency:GetHasDressByType(arg_41_0.dressType)) do
			local var_41_0 = pg.island_dress_template[iter_41_1.id].quality

			table.insert(arg_41_0.dressList, IslandDressItem.New({
				id = iter_41_1.id,
				quality = var_41_0,
				needRedDot = iter_41_1.state == 0
			}))
		end
	else
		for iter_41_2, iter_41_3 in pairs(arg_41_0.characterAgency:GetAllOwnDressDic()) do
			if iter_41_3:getConfigTable().type == arg_41_0.dressType and iter_41_3.num > 0 then
				local var_41_1 = pg.island_dress_template[iter_41_3.id].quality

				table.insert(arg_41_0.dressList, IslandDressItem.New({
					id = iter_41_3.id,
					ownCount = iter_41_3.num,
					needRedDot = iter_41_3.read == 0,
					quality = var_41_1
				}))
			end
		end

		for iter_41_4, iter_41_5 in pairs(arg_41_0.characterAgency:GetShipHoldedDressDic()) do
			for iter_41_6, iter_41_7 in ipairs(iter_41_5) do
				if iter_41_7:getConfigTable().type == arg_41_0.dressType then
					local var_41_2 = pg.island_dress_template[iter_41_7.dress_id].quality

					table.insert(arg_41_0.dressList, IslandDressItem.New({
						id = iter_41_7.dress_id,
						holdedShipId = iter_41_7.ship_id,
						quality = var_41_2
					}))
				end
			end
		end
	end

	local var_41_3

	if arg_41_0.indexData.sortKey == var_0_0.SORT_DEFAULT then
		var_41_3 = {
			function(arg_42_0)
				return arg_42_0.holdedShipId and 0 or 1
			end,
			function(arg_43_0)
				return arg_43_0.needRedDot and 0 or 1
			end,
			function(arg_44_0)
				return -arg_44_0.quality
			end,
			function(arg_45_0)
				return -arg_45_0.id
			end
		}
	end

	table.sort(arg_41_0.dressList, CompareFuncs(var_41_3))
end

function var_0_0.GetSkinList(arg_46_0)
	if arg_46_0.shipId ~= 0 then
		arg_46_0.skinList = {}

		for iter_46_0, iter_46_1 in ipairs(pg.island_skin_template.get_id_list_by_ship_group[arg_46_0.shipId] or {}) do
			if arg_46_0.characterAgency:CheckSkinIsOwned(iter_46_1) then
				table.insert(arg_46_0.skinList, iter_46_1)
			end
		end
	end
end

function var_0_0.UpdateSkinList(arg_47_0)
	local var_47_0 = #arg_47_0.skinList

	setActive(arg_47_0.skinRectTF, var_47_0 ~= 0)
	setActive(arg_47_0.skinEmpty, var_47_0 == 0)
	arg_47_0.skinRect:SetTotalCount(var_47_0)
	setText(arg_47_0.skinEmptyTips, i18n("island_dress_no_item"))
end

function var_0_0.UpdateDressUpList(arg_48_0)
	if arg_48_0.currentToggleIndex == 4 then
		return
	end

	local var_48_0 = #arg_48_0.dressList

	setActive(arg_48_0.dressRectTF, var_48_0 ~= 0)
	setActive(arg_48_0.dressEmpty, var_48_0 == 0)
	setText(arg_48_0.dressEmptyTips, i18n("island_dress_no_item"))
	setActive(arg_48_0.sortBtn, false)

	if var_48_0 ~= 0 then
		arg_48_0.dressRect:SetTotalCount(var_48_0)
	end
end

function var_0_0.OnShow(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4)
	arg_49_0.SmoothFunc = arg_49_4
	arg_49_0.isFirstDressUp = arg_49_2

	setActive(arg_49_0.color_listPanel, false)
	setActive(arg_49_0.saveBtn, not arg_49_2)
	setActive(arg_49_0.restBtn, not arg_49_2)

	arg_49_0.shipDressHelper = arg_49_3
	arg_49_0.island = getProxy(IslandProxy):GetIsland()
	arg_49_0.characterAgency = arg_49_0.island:GetCharacterAgency()
	arg_49_0.dressUpAgency = arg_49_0.island:GetDressUpAgency()
	arg_49_0.shipId = arg_49_1
	arg_49_0.indexData = {
		order = 1,
		sortKey = var_0_0.SORT_DEFAULT
	}
	arg_49_0.smothObj = smothObj

	arg_49_0:InitCurDressData()
	setActive(arg_49_0.dressUpConfireBtn, arg_49_2)

	if arg_49_1 == 0 then
		setActive(arg_49_0.toggles[4], false)
		setActive(arg_49_0.toggles[5], not arg_49_2)
		setActive(arg_49_0.toggles[6], not arg_49_2)
		setActive(arg_49_0.toggles[7], not arg_49_2)
		triggerToggle(arg_49_0.toggles[1], true)
	else
		setActive(arg_49_0.toggles[4], true)
		triggerToggle(arg_49_0.toggles[4], true)
	end

	setActive(arg_49_0.toggles[1], arg_49_1 == 0)
	setActive(arg_49_0.toggles[2], arg_49_1 == 0)
	setActive(arg_49_0.toggles[3], arg_49_1 == 0)
	arg_49_0:UpdateRightReddot()
end

function var_0_0.InitCurDressData(arg_50_0)
	arg_50_0.curDressTypeDataDic = {}
	arg_50_0.curShipDressTypeDataDic = {}
	arg_50_0.dressColorDic = {}

	if arg_50_0.shipId == 0 then
		local var_50_0 = arg_50_0.isFirstDressUp and IslandShipDressHelperNew.CommanderCustom or IslandShipDressHelperNew.DressType

		for iter_50_0, iter_50_1 in pairs(var_50_0) do
			local var_50_1 = arg_50_0.isFirstDressUp and IslandShipDressHelperNew.GetInitDressByType(iter_50_1) or arg_50_0.dressUpAgency:GetDressByType(iter_50_1)

			arg_50_0.curDressTypeDataDic[iter_50_1] = var_50_1

			if var_50_1 then
				arg_50_0.dressColorDic[var_50_1] = arg_50_0.dressUpAgency:GetCurrentColorByDressId(var_50_1)
			end
		end
	else
		arg_50_0.curSkinId = arg_50_0.characterAgency:GetShipById(arg_50_0.shipId):GetCurSkinId()

		if arg_50_0.curSkinId == 0 then
			arg_50_0.curskinColorId = 0
		else
			arg_50_0.curskinColorId = arg_50_0.characterAgency:GetCurrentSkinColorByShipId(arg_50_0.shipId, arg_50_0.curSkinId)
		end

		for iter_50_2, iter_50_3 in pairs(IslandShipDressHelperNew.ExtraDressType) do
			local var_50_2 = arg_50_0.characterAgency:GetCurDressIdByShipId(arg_50_0.shipId, iter_50_3) or {}

			arg_50_0.curShipDressTypeDataDic[iter_50_3] = IslandShipDressItem.New(var_50_2)
		end
	end
end

function var_0_0.CheckDressIsDirty(arg_51_0)
	if arg_51_0.shipId == 0 then
		for iter_51_0, iter_51_1 in pairs(arg_51_0.curDressTypeDataDic) do
			if (arg_51_0.dressUpAgency:GetDressByType(iter_51_0) or 0) ~= iter_51_1 then
				return true
			end

			if iter_51_1 ~= 0 and arg_51_0.dressUpAgency:GetCurrentColorByDressId(iter_51_1) ~= (arg_51_0.dressColorDic[iter_51_1] or 0) then
				return true
			end
		end

		return false
	else
		local var_51_0 = arg_51_0.characterAgency:GetShipById(arg_51_0.shipId):GetCurSkinId()
		local var_51_1 = arg_51_0.characterAgency:GetCurrentSkinColorByShipId(arg_51_0.shipId, var_51_0)

		if var_51_0 ~= arg_51_0.curSkinId or var_51_1 ~= arg_51_0.curskinColorId then
			return true
		end

		for iter_51_2, iter_51_3 in pairs(arg_51_0.curShipDressTypeDataDic) do
			local var_51_2 = arg_51_0.characterAgency:GetCurDressIdByShipId(arg_51_0.shipId, iter_51_2) or {}

			if not iter_51_3:CheckIsEqualByShipDressItem(var_51_2) then
				return true
			end
		end

		return false
	end
end

function var_0_0.ResetDressUp(arg_52_0)
	if arg_52_0.shipId == 0 then
		for iter_52_0, iter_52_1 in pairs(IslandShipDressHelperNew.DressType) do
			local var_52_0 = arg_52_0.dressUpAgency:GetDressByType(iter_52_1) or 0
			local var_52_1 = arg_52_0.dressUpAgency:GetCurrentColorByDressId(var_52_0)
			local var_52_2 = arg_52_0.curDressTypeDataDic[iter_52_1]
			local var_52_3 = arg_52_0.dressColorDic[var_52_2]

			if var_52_0 == var_52_2 and var_52_3 ~= var_52_1 then
				arg_52_0.shipDressHelper:ChangeCommanderPartColor(iter_52_1, var_52_1)

				return
			end

			arg_52_0.shipDressHelper:ChangeDressByType(iter_52_1, {
				id = var_52_0,
				colorId = var_52_1
			})

			arg_52_0.curDressTypeDataDic[iter_52_1] = var_52_0
			arg_52_0.dressColorDic[var_52_0] = var_52_1
		end

		local var_52_4 = arg_52_0.curDressTypeDataDic[IslandShipDressHelperNew.DressType.Body]
		local var_52_5 = arg_52_0.dressUpAgency:GetBodyHatIsOn(var_52_4)

		arg_52_0:UpdateHatToggleDisplay(var_52_5)
		arg_52_0:UpdateDressUpList()
	else
		local var_52_6 = arg_52_0.characterAgency:GetShipById(arg_52_0.shipId)

		if (function()
			local var_53_0 = var_52_6:GetCurSkinId()
			local var_53_1 = arg_52_0.characterAgency:GetCurrentSkinColorByShipId(arg_52_0.shipId, var_53_0)

			if var_53_0 ~= arg_52_0.curSkinId or var_53_1 ~= arg_52_0.curskinColorId then
				arg_52_0.curSkinId = var_53_0
				arg_52_0.curskinColorId = var_53_1

				return true
			end

			return false
		end)() then
			local var_52_7 = var_52_6:GetModelBySkinAndColorId(arg_52_0.curSkinId, arg_52_0.curskinColorId)

			arg_52_0.shipDressHelper:ChangeModelTransfromByUnitId(var_52_7)
			arg_52_0:UpdateSkinList()
			arg_52_0:UpdateColorList()
		end

		local var_52_8 = {
			IslandShipDressHelperNew.DressType.BackDecorate,
			IslandShipDressHelperNew.DressType.Flotage,
			IslandShipDressHelperNew.DressType.Footprint
		}

		for iter_52_2, iter_52_3 in ipairs(var_52_8) do
			local var_52_9 = arg_52_0.characterAgency:GetCurDressIdByShipId(arg_52_0.shipId, iter_52_3) or {}

			arg_52_0.shipDressHelper:ChangeDressByType(iter_52_3, {
				colorId = 0,
				id = var_52_9.dress_id or 0
			})

			arg_52_0.curShipDressTypeDataDic[iter_52_3] = IslandShipDressItem.New(var_52_9)
		end

		arg_52_0:UpdateDressUpList()
	end
end

function var_0_0.CheckShipCanSave(arg_54_0)
	local var_54_0 = true

	if not arg_54_0.characterAgency:CheckSkinIsOwned(arg_54_0.curSkinId) then
		arg_54_0.curSkinId = arg_54_0.characterAgency:GetShipById(arg_54_0.shipId):GetCurSkinId()
		var_54_0 = false
	end

	if arg_54_0.curSkinId ~= 0 and not arg_54_0.characterAgency:CheckSkinColorIsOwned(arg_54_0.curSkinId, arg_54_0.curskinColorId) then
		arg_54_0.curskinColorId = arg_54_0.characterAgency:GetCurrentSkinColorByShipId(arg_54_0.shipId, arg_54_0.curSkinId)
		var_54_0 = false
	end

	return var_54_0
end

function var_0_0.SaveDressUpDataHandle(arg_55_0, arg_55_1)
	if arg_55_0.shipId == 0 then
		arg_55_0:SaveDressUpData(arg_55_1)
	else
		if not arg_55_0:CheckShipCanSave() then
			local var_55_0 = arg_55_0.characterAgency:GetShipById(arg_55_0.shipId):GetModelBySkinAndColorId(arg_55_0.curSkinId, arg_55_0.curskinColorId)

			arg_55_0.shipDressHelper:ChangeModelTransfromByUnitId(var_55_0)
			arg_55_0:UpdateSkinList()
			arg_55_0:UpdateColorList()
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_save2"))
			existCall(arg_55_1)

			return
		end

		arg_55_0:SaveDressUpData(arg_55_1)
	end
end

function var_0_0.SaveDressUpData(arg_56_0, arg_56_1)
	if arg_56_0.shipId == 0 then
		local var_56_0, var_56_1 = (function()
			local var_57_0 = {}
			local var_57_1 = {}

			for iter_57_0, iter_57_1 in pairs(arg_56_0.curDressTypeDataDic) do
				local var_57_2 = arg_56_0.dressUpAgency:GetDressByType(iter_57_0)
				local var_57_3 = false

				if iter_57_1 ~= var_57_2 then
					var_57_3 = true
				end

				if iter_57_0 == IslandShipDressHelperNew.DressType.Hat and iter_57_1 == 0 then
					var_57_3 = true
				end

				if var_57_3 then
					table.insert(var_57_0, {
						type = iter_57_0,
						id = iter_57_1
					})
				end

				local var_57_4 = arg_56_0.dressColorDic[iter_57_1] or 0

				if arg_56_0.dressUpAgency:GetCurrentColorByDressId(iter_57_1) ~= var_57_4 then
					table.insert(var_57_1, {
						id = iter_57_1,
						color = var_57_4
					})
				end
			end

			return var_57_0, var_57_1
		end)()

		pg.m02:sendNotification(GAME.ISLAND_CHANGE_COMMANDER_DRESS, {
			dress_List = var_56_0,
			color_list = var_56_1,
			island_id = arg_56_0.island.id
		})
		existCall(arg_56_1)
	else
		local var_56_2 = {}
		local var_56_3 = {}
		local var_56_4 = {}
		local var_56_5 = {}

		for iter_56_0, iter_56_1 in pairs(arg_56_0.curShipDressTypeDataDic) do
			local var_56_6 = arg_56_0.characterAgency:GetCurDressIdByShipId(arg_56_0.shipId, iter_56_0) or {}

			if not iter_56_1:CheckIsEqualByShipDressItem(var_56_6) then
				if not iter_56_1.dress_id then
					table.insert(var_56_3, var_56_6.dress_id)
				elseif iter_56_1.ship_id ~= 0 then
					if var_56_6.dress_id then
						table.insert(var_56_5, var_56_6.dress_id)
					end

					table.insert(var_56_4, {
						ship_id = iter_56_1.ship_id,
						dress_id = iter_56_1.dress_id
					})
				else
					if var_56_6.dress_id then
						table.insert(var_56_3, var_56_6.dress_id)
					end

					table.insert(var_56_2, {
						ship_id = iter_56_1.ship_id,
						dress_id = iter_56_1.dress_id
					})
				end
			end
		end

		local function var_56_7()
			pg.m02:sendNotification(GAME.ISLAND_CHANGE_DRESS, {
				dress_List = var_56_2,
				unload_dress = var_56_3,
				ship_id = arg_56_0.shipId,
				skin_id = arg_56_0.curSkinId,
				color_id = arg_56_0.curskinColorId
			})
		end

		if #var_56_4 == 0 then
			var_56_7()
			existCall(arg_56_1)

			return
		end

		arg_56_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_DRESS_WEAR_CONFIRE,
			content = i18n("island_dress_replace_tip"),
			needconfirmDressList = var_56_4,
			onYes = function()
				for iter_59_0, iter_59_1 in ipairs(var_56_4) do
					table.insert(var_56_2, iter_59_1)
				end

				for iter_59_2, iter_59_3 in ipairs(var_56_5) do
					table.insert(var_56_3, iter_59_3)
				end

				var_56_7()
				existCall(arg_56_1)
			end,
			onNo = function()
				existCall(arg_56_1)
			end
		})
	end
end

function var_0_0.CheckInReturn(arg_61_0, arg_61_1)
	if not arg_61_0:CheckDressIsDirty() then
		existCall(arg_61_1)

		return
	end

	if not arg_61_0:CheckShipCanSave() then
		existCall(arg_61_1)
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_exit2"))

		return
	end

	arg_61_0:ShowMsgBox({
		type = IslandMsgBox.TYPE_COMMON,
		content = i18n("island_dressup_tip_1"),
		onYes = function()
			arg_61_0:SaveDressUpDataHandle(arg_61_1)
		end,
		onNo = function()
			existCall(arg_61_1)
		end
	})
end

function var_0_0.OnChangeRoleDressDone(arg_64_0)
	for iter_64_0, iter_64_1 in pairs(arg_64_0.curShipDressTypeDataDic) do
		local var_64_0 = arg_64_0.characterAgency:GetCurDressIdByShipId(arg_64_0.shipId, iter_64_0) or {}

		arg_64_0.curShipDressTypeDataDic[iter_64_0] = IslandShipDressItem.New(var_64_0)
	end

	arg_64_0:GetDressUpList()
	arg_64_0:UpdateDressUpList()
end

function var_0_0.OnSendRoleDressReadDone(arg_65_0, arg_65_1)
	for iter_65_0, iter_65_1 in ipairs(arg_65_1) do
		for iter_65_2, iter_65_3 in ipairs(arg_65_0.dressList) do
			if iter_65_3.id == iter_65_1 and iter_65_3.needRedDot then
				iter_65_3.needRedDot = false
			end
		end
	end

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
	local var_69_0 = arg_69_0.shipId == 0 and {
		1,
		2,
		3,
		5,
		6,
		7
	} or {
		5,
		6,
		7
	}

	for iter_69_0, iter_69_1 in ipairs(var_69_0) do
		local var_69_1 = arg_69_0.toggles[iter_69_1]:Find("red_dot")
		local var_69_2 = false
		local var_69_3 = var_0_1[iter_69_1]

		if arg_69_0.shipId == 0 then
			var_69_2 = arg_69_0.dressUpAgency:CheckRedDotByDressType(var_69_3)
		else
			var_69_2 = arg_69_0.characterAgency:CheckRedDotByDressType(var_69_3)
		end

		setActive(var_69_1, var_69_2)
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
		if arg_72_0.isDressColor then
			if arg_72_0.shipId == 0 then
				if arg_72_0.dressUpAgency:CheckDressColorIsOwned(var_72_2, var_72_1) then
					return true
				end
			else
				return true
			end

			return false, true
		else
			if not arg_72_0.curskinColorId or arg_72_0.curskinColorId == 0 then
				return true
			end

			if arg_72_0.characterAgency:CheckSkinColorIsOwned(arg_72_0.curSkinId, arg_72_0.curskinColorId) then
				return true
			end

			local var_73_0 = arg_72_0.characterAgency:CheckSkinIsOwned(arg_72_0.curSkinId)

			return false, var_73_0
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
					skin_id = arg_72_0.curSkinId,
					color_id = arg_72_0.curskinColorId
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
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

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
		arg_79_0.colorItemList = {}

		if arg_79_0.isDressColor then
			local var_80_0 = arg_79_0.curDressTypeDataDic[arg_79_0.dressType]
			local var_80_1 = arg_79_0.dressColorDic[var_80_0]
			local var_80_2 = pg.island_dress_colordiff_template.get_id_list_by_belongto_dress[var_80_0] or {}

			if #var_80_2 > 0 then
				local var_80_3 = var_80_1 == 0
				local var_80_4 = true

				table.insert(arg_79_0.colorItemList, {
					itemId = 0,
					selected = var_80_3,
					owned = var_80_4
				})

				for iter_80_0, iter_80_1 in ipairs(var_80_2) do
					local var_80_5 = var_80_1 == iter_80_1
					local var_80_6 = arg_79_0.dressUpAgency:CheckDressColorIsOwned(var_80_0, iter_80_1)

					table.insert(arg_79_0.colorItemList, {
						itemId = iter_80_1,
						selected = var_80_5,
						owned = var_80_6,
						costItemIcon = pg.island_dress_colordiff_template[iter_80_1].color_icon
					})
				end
			end
		else
			local var_80_7 = pg.island_skin_colordiff_template.get_id_list_by_skin_group[arg_79_0.curSkinId] or {}
			local var_80_8 = arg_79_0.curskinColorId == 0
			local var_80_9 = arg_79_0.characterAgency:CheckSkinIsOwned(arg_79_0.curSkinId)

			table.insert(arg_79_0.colorItemList, {
				itemId = 0,
				selected = var_80_8,
				owned = var_80_9
			})

			for iter_80_2, iter_80_3 in ipairs(var_80_7) do
				local var_80_10 = arg_79_0.curskinColorId == iter_80_3
				local var_80_11 = arg_79_0.characterAgency:CheckSkinColorIsOwned(arg_79_0.curSkinId, iter_80_3)

				table.insert(arg_79_0.colorItemList, {
					itemId = iter_80_3,
					selected = var_80_10,
					owned = var_80_11,
					costItemIcon = pg.island_skin_colordiff_template[iter_80_3].color_icon
				})
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
			setActive(arg_81_2:Find("icon"), false)

			if var_81_0.costItemIcon then
				setActive(arg_81_2:Find("icon"), true)
				GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. var_81_0.costItemIcon, "", arg_81_2:Find("icon"))
			end

			setActive(arg_81_2:Find("locked"), not var_81_0.owned)
			onButton(arg_79_0, arg_81_2, function()
				if arg_79_0.isDressColor then
					local var_82_0 = arg_79_0.curDressTypeDataDic[arg_79_0.dressType]
					local var_82_1 = arg_79_0.dressColorDic[var_82_0]

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
	ClearLScrollrect(arg_85_0.dressRect)
	ClearLScrollrect(arg_85_0.skinRect)

	for iter_85_0, iter_85_1 in pairs(arg_85_0.dressCards or {}) do
		iter_85_1:Dispose()
	end

	arg_85_0.dressCards = nil
end

return var_0_0
