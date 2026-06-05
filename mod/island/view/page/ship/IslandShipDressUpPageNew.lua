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
	arg_3_0.hatTF = arg_3_0._tf:Find("adapt/btns/hat")
	arg_3_0.hatOn = arg_3_0.hatTF:Find("hatOn")
	arg_3_0.hatOff = arg_3_0.hatTF:Find("hatOff")
	arg_3_0.morphTF = arg_3_0._tf:Find("adapt/btns/morph")
	arg_3_0.morphBtn = arg_3_0.morphTF and arg_3_0.morphTF:Find("morphBtn")
	arg_3_0.morphBlocker = arg_3_0._tf:Find("adapt/morph_blocker")

	setActive(arg_3_0.morphBlocker, false)

	arg_3_0.dressDetailPopup = IslandShipDressDescBox.New(arg_3_0._tf, arg_3_0.event, arg_3_0.contextData)
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

	if arg_9_0.dressType == IslandShipDressHelperNew.DressType.Body then
		local var_9_9 = arg_9_0.dressUpAgency:GetTwinCurId(var_9_7)

		if var_9_9 and var_9_9 ~= 0 then
			var_9_7 = var_9_9
		end
	end

	arg_9_0.curDressTypeDataDic[arg_9_0.dressType] = var_9_7

	local var_9_10 = (function()
		local var_10_0 = 0

		if var_9_7 ~= 0 and arg_9_0.shipId == 0 then
			var_10_0 = arg_9_0.dressUpAgency:GetCurrentColorByDressId(var_9_7)
			arg_9_0.dressColorDic[var_9_7] = var_10_0
		end

		return var_10_0
	end)()

	arg_9_0.shipDressHelper:ChangeDressByType(arg_9_0.dressType, {
		id = var_9_7,
		colorId = var_9_10
	})

	local var_9_11 = #arg_9_0.dressList

	arg_9_0.dressRect:SetTotalCount(var_9_11)
	arg_9_0:CheckHatAutoTakeOff(var_9_7)
	arg_9_0:UpdateHatDisplay()
	arg_9_0:UpdateMorphDisplay()
	arg_9_0:UpdateColorList(true)
end

function var_0_0.CheckHatAutoTakeOff(arg_11_0, arg_11_1)
	if arg_11_0.dressType == IslandShipDressHelperNew.DressType.Body then
		local var_11_0 = arg_11_0.dressUpAgency:GetBodyHatDressId(arg_11_1)

		if not var_11_0 or var_11_0 == 0 then
			arg_11_0.curDressTypeDataDic[IslandShipDressHelperNew.DressType.Hat] = 0

			arg_11_0.shipDressHelper:ChangeDressByType(IslandShipDressHelperNew.DressType.Hat, {
				id = 0,
				colorId = 0
			})
		end
	end
end

function var_0_0.UpdateHatToggleDisplay(arg_12_0, arg_12_1)
	setActive(arg_12_0.hatOn, not arg_12_1)
	setActive(arg_12_0.hatOff, arg_12_1)
end

function var_0_0.UpdateHatDisplay(arg_13_0)
	if arg_13_0.dressType ~= IslandShipDressHelperNew.DressType.Body then
		setActive(arg_13_0.hatTF, false)

		return
	end

	local var_13_0 = arg_13_0.curDressTypeDataDic[arg_13_0.dressType]

	if not var_13_0 or var_13_0 == 0 then
		setActive(arg_13_0.hatTF, false)

		return
	end

	local var_13_1 = (pg.island_dress_template.get_id_list_by_related_dress[var_13_0] or {})[1]

	if not var_13_1 then
		setActive(arg_13_0.hatTF, false)

		return
	end

	setActive(arg_13_0.hatTF, true)

	local var_13_2 = pg.island_dress_template[var_13_1].type
	local var_13_3 = arg_13_0.dressUpAgency:GetBodyHatIsOn(var_13_0, var_13_1)

	arg_13_0.shipDressHelper:ChangeDressByType(var_13_2, {
		id = var_13_3 and var_13_1 or 0
	})

	arg_13_0.curDressTypeDataDic[var_13_2] = var_13_3 and var_13_1 or 0

	arg_13_0:UpdateHatToggleDisplay(var_13_3)

	if pg.island_dress_template[var_13_1].takeoff_btn_is_hide == 1 then
		setActive(arg_13_0.hatTF, false)
	end

	onButton(arg_13_0, arg_13_0.hatOn, function()
		if arg_13_0.curDressTypeDataDic[var_13_2] ~= var_13_1 then
			arg_13_0.curDressTypeDataDic[var_13_2] = var_13_1

			arg_13_0.shipDressHelper:ChangeDressByType(var_13_2, {
				id = var_13_1
			})
			arg_13_0:UpdateHatToggleDisplay(true)
		end
	end)
	onButton(arg_13_0, arg_13_0.hatOff, function()
		if arg_13_0.curDressTypeDataDic[var_13_2] ~= 0 then
			arg_13_0.curDressTypeDataDic[var_13_2] = 0

			arg_13_0.shipDressHelper:ChangeDressByType(var_13_2, {
				id = 0
			})
			arg_13_0:UpdateHatToggleDisplay(false)
		end
	end)
end

function var_0_0.OnDressInitItem(arg_16_0, arg_16_1)
	local var_16_0 = IslandDressCard.New(arg_16_1)

	arg_16_0.dressCards[arg_16_1] = var_16_0
end

function var_0_0.UpdateMorphDisplay(arg_17_0)
	if arg_17_0.dressType ~= IslandShipDressHelperNew.DressType.Body then
		setActive(arg_17_0.morphTF, false)

		return
	end

	local var_17_0 = arg_17_0.curDressTypeDataDic[arg_17_0.dressType]

	if not var_17_0 or var_17_0 == 0 then
		setActive(arg_17_0.morphTF, false)

		return
	end

	local var_17_1 = 0
	local var_17_2 = pg.island_dress_template[var_17_0].cloth_related

	if var_17_2 and var_17_2 ~= 0 then
		var_17_1 = var_17_2
	end

	if var_17_1 == 0 then
		setActive(arg_17_0.morphTF, false)

		return
	end

	setActive(arg_17_0.morphTF, true)
	onButton(arg_17_0, arg_17_0.morphBtn, function()
		arg_17_0:DoMorphSwitch(var_17_0, var_17_1)
	end)
end

function var_0_0.DoMorphSwitch(arg_19_0, arg_19_1, arg_19_2)
	if arg_19_0.morphing then
		return
	end

	arg_19_0:SetMorphBlock(true)

	if not arg_19_0.shipDressHelper then
		arg_19_0:DoSwitch(arg_19_2, function()
			arg_19_0:SetMorphBlock(false)
		end)

		return
	end

	arg_19_0.shipDressHelper:DoMorphSwitch(arg_19_1, arg_19_2, function()
		arg_19_0:DoSwitch(arg_19_2, function()
			arg_19_0:SetMorphBlock(false)
		end)
	end)
end

function var_0_0.SetMorphBlock(arg_23_0, arg_23_1)
	arg_23_0.morphing = arg_23_1

	setActive(arg_23_0.morphBlocker, arg_23_1)
end

function var_0_0.CanEsc(arg_24_0)
	if arg_24_0.morphing then
		return false
	end

	return true
end

function var_0_0.DoSwitch(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = IslandShipDressHelperNew.DressType.Body

	arg_25_0.curDressTypeDataDic[var_25_0] = arg_25_1

	arg_25_0.shipDressHelper:ChangeDressByType(var_25_0, {
		colorId = 0,
		id = arg_25_1
	}, arg_25_2)
	arg_25_0:CheckHatAutoTakeOff(arg_25_1)
	arg_25_0:UpdateHatDisplay()
	arg_25_0:UpdateMorphDisplay()
end

function var_0_0.AddLongPressListeners(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	arg_26_0.isLongPress = false

	local function var_26_0()
		if arg_26_0.isLongPress then
			arg_26_0.dressDetailPopup:ExecuteAction("Hide")

			arg_26_0.isLongPress = false
		end
	end

	local var_26_1 = GetOrAddComponent(arg_26_2, typeof(LongPressTrigger))

	var_26_1.onClick:RemoveAllListeners()
	var_26_1.onClick:AddListener(function()
		if arg_26_0.isLongPress then
			var_26_0()

			return
		end

		arg_26_4()
	end)
	var_26_1.onLongPressed:RemoveAllListeners()
	var_26_1.onLongPressed:AddListener(function()
		arg_26_0.isLongPress = true

		local var_29_0 = arg_26_0._tf:InverseTransformPoint(tf(arg_26_2).position)
		local var_29_1 = Vector2(var_29_0.x - tf(arg_26_2).sizeDelta.x / 2, var_29_0.y + tf(arg_26_2).sizeDelta.y / 2)

		arg_26_0.dressDetailPopup:ExecuteAction("Show", arg_26_1, arg_26_3, var_29_1)
	end)
	var_26_1.onReleased:RemoveAllListeners()
	var_26_1.onReleased:AddListener(var_26_0)
end

function var_0_0.OnDressUpdateItem(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_0.dressCards[arg_30_2]

	if not var_30_0 then
		arg_30_0:OnDressInitItem(arg_30_2)

		var_30_0 = arg_30_0.dressCards[arg_30_2]
	end

	local var_30_1 = arg_30_0.dressList[arg_30_1 + 1]

	setActive(var_30_0.canSendTF, false)

	local var_30_2 = var_30_1.ownCount ~= nil

	setActive(var_30_0.ownNumTF, var_30_2)

	if var_30_2 then
		setText(var_30_0.ownNumText, "×" .. var_30_1.ownCount)
	end

	local var_30_3 = var_30_1.holdedShipId ~= nil

	setActive(var_30_0.shipHoldTF, var_30_3)

	if var_30_3 then
		local var_30_4 = IslandShip.StaticGetPrefab(var_30_1.holdedShipId)

		GetImageSpriteFromAtlasAsync("island/IslandShipIcon/" .. var_30_4, "", var_30_0.shipIcon)
	end

	setActive(var_30_0.redDot, var_30_1.needRedDot)

	local var_30_5
	local var_30_6 = var_30_1.id
	local var_30_7 = tf(arg_30_2)

	arg_30_0:AddLongPressListeners(IslandShipDressDescBox.TYPE.DRESS, arg_30_2, var_30_6, function()
		arg_30_0:ClickDressCardItem(var_30_1)
	end)

	local var_30_8 = false

	if arg_30_0.shipId == 0 then
		local var_30_9 = arg_30_0.curDressTypeDataDic[arg_30_0.dressType]
		local var_30_10 = var_30_9 ~= 0 and var_30_9 or nil

		var_30_8 = var_30_10 == var_30_1.id or var_30_10 == var_30_1:getConfig("cloth_related")

		setActive(var_30_0.exclusionTF, false)
	else
		local var_30_11, var_30_12 = arg_30_0:CheckDressIsExclusive(var_30_1.id)
		local var_30_13 = var_30_11 or var_30_12

		setActive(var_30_0.exclusionTF, var_30_13)

		var_30_8 = arg_30_0.curShipDressTypeDataDic[arg_30_0.dressType]:CheckIsEqualByShipIdAndDressId(var_30_1.holdedShipId or 0, var_30_1.id)
	end

	var_30_0:Update(var_30_6, var_30_8)
end

function var_0_0.OnSkinInitItem(arg_32_0, arg_32_1)
	local var_32_0 = IslandSkinCard.New(arg_32_1)

	arg_32_0.skinCards[arg_32_1] = var_32_0
end

function var_0_0.OnSkinUpdateItem(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_0.skinCards[arg_33_2]

	if not var_33_0 then
		arg_33_0:OnSkinInitItem(arg_33_2)

		var_33_0 = arg_33_0.skinCards[arg_33_2]
	end

	local var_33_1 = arg_33_0.skinList[arg_33_1 + 1]
	local var_33_2 = tf(arg_33_2)

	setActive(var_33_2:Find("changeColor"), true)

	local var_33_3 = arg_33_0.curSkinId
	local var_33_4 = var_33_3 ~= 0 and var_33_3 or nil

	var_33_0:Update(var_33_1, var_33_4)
	arg_33_0:AddLongPressListeners(IslandShipDressDescBox.TYPE.SKIN, arg_33_2, var_33_1, function()
		arg_33_0:ClickSkinCardItem(var_33_1)
	end)
end

function var_0_0.ChangeModelBySkinAndSkinColor(arg_35_0)
	local var_35_0 = arg_35_0.characterAgency:GetShipById(arg_35_0.shipId)
	local var_35_1 = {}
	local var_35_2 = {
		IslandShipDressHelperNew.DressType.BackDecorate,
		IslandShipDressHelperNew.DressType.Flotage,
		IslandShipDressHelperNew.DressType.Footprint
	}

	for iter_35_0, iter_35_1 in ipairs(var_35_2) do
		local var_35_3 = arg_35_0.curShipDressTypeDataDic[iter_35_1]

		if var_35_3 and var_35_3.dress_id and var_35_3.dress_id ~= 0 then
			if arg_35_0.curSkinId ~= 0 then
				local var_35_4 = pg.island_dress_template[var_35_3.dress_id].exclusive_skin
				local var_35_5 = var_35_4 == "" and {} or var_35_4

				for iter_35_2, iter_35_3 in ipairs(var_35_5) do
					if iter_35_3 == arg_35_0.curSkinId then
						table.insert(var_35_1, var_35_3.dress_id)
						var_35_3:SetShipAndDressId(nil, nil)
					end
				end
			else
				local var_35_6 = pg.island_dress_template[var_35_3.dress_id].exclusive_default_skin
				local var_35_7 = var_35_6 == "" and {} or var_35_6

				for iter_35_4, iter_35_5 in ipairs(var_35_7) do
					if iter_35_5 == arg_35_0.shipId then
						table.insert(var_35_1, var_35_3.dress_id)
						var_35_3:SetShipAndDressId(nil, nil)
					end
				end
			end
		end
	end

	if #var_35_1 > 0 then
		local var_35_8 = ""

		for iter_35_6, iter_35_7 in ipairs(var_35_1) do
			local var_35_9 = pg.island_dress_template[iter_35_7].name

			if iter_35_6 > 1 then
				var_35_9 = "," .. var_35_9
			end

			var_35_8 = var_35_8 .. var_35_9
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_mutually_exclusive", var_35_8))
	end

	arg_35_0:emit(IslandShipMainPage.CLEAR_ITEM_ANIMATOR)

	local var_35_10 = var_35_0:GetModelBySkinAndColorId(arg_35_0.curSkinId, arg_35_0.curskinColorId)

	if #var_35_1 > 0 then
		arg_35_0.shipDressHelper:ChangeModelTransfromByUnitIdAndChangeDress(var_35_10, var_35_1, nil, nil, true)
	else
		arg_35_0.shipDressHelper:ChangeModelTransfromByUnitId(var_35_10, nil, true)
	end
end

function var_0_0.ClickSkinCardItem(arg_36_0, arg_36_1)
	if arg_36_1 == arg_36_0.curSkinId then
		arg_36_0.curSkinId = 0
	else
		arg_36_0.curSkinId = arg_36_1
	end

	arg_36_0:UpdateSkinList()

	if arg_36_0.curSkinId ~= 0 then
		arg_36_0.curskinColorId = arg_36_0.characterAgency:GetCurrentSkinColorByShipId(arg_36_0.shipId, arg_36_0.curSkinId)
	end

	arg_36_0:ChangeModelBySkinAndSkinColor()
	arg_36_0:UpdateColorList()
	arg_36_0:UpdateHatDisplay()
end

function var_0_0.ClearSkinSelected(arg_37_0, arg_37_1)
	return
end

function var_0_0.AddListeners(arg_38_0)
	arg_38_0:AddListener(GAME.ISLAND_CHANGE_ROLE_DRESS_DONE, arg_38_0.OnChangeRoleDressDone)
	arg_38_0:AddListener(GAME.ISLAND_SEND_ROLE_DRESS_READ_DONE, arg_38_0.OnSendRoleDressReadDone)
	arg_38_0:AddListener(GAME.ISLAND_SEND_COMMANDER_DRESS_READ_DONE, arg_38_0.OnSendRoleDressReadDone)
	arg_38_0:AddListener(GAME.ISLAND_BUY_ROLE_SKIN_COLOR_DONE, arg_38_0.OnBuyRoleSkinColorDone)
	arg_38_0:AddListener(GAME.ISLAND_BUY_ROLE_DRESS_COLOR_DONE, arg_38_0.OnBuyRoleDressColorDone)
	arg_38_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_38_0.GetBuySkindDone)
end

function var_0_0.RemoveListeners(arg_39_0)
	arg_39_0:RemoveListener(GAME.ISLAND_CHANGE_ROLE_DRESS_DONE, arg_39_0.OnChangeRoleDressDone)
	arg_39_0:RemoveListener(GAME.ISLAND_SEND_ROLE_DRESS_READ_DONE, arg_39_0.OnSendRoleDressReadDone)
	arg_39_0:RemoveListener(GAME.ISLAND_SEND_COMMANDER_DRESS_READ_DONE, arg_39_0.OnSendRoleDressReadDone)
	arg_39_0:RemoveListener(GAME.ISLAND_BUY_ROLE_SKIN_COLOR_DONE, arg_39_0.OnBuyRoleSkinColorDone)
	arg_39_0:RemoveListener(GAME.ISLAND_BUY_ROLE_DRESS_COLOR_DONE, arg_39_0.OnBuyRoleDressColorDone)
	arg_39_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_39_0.GetBuySkindDone)
end

function var_0_0.OnClosePage(arg_40_0, arg_40_1)
	return
end

function var_0_0.OnInit(arg_41_0)
	onButton(arg_41_0, arg_41_0.saveBtn, function()
		if not arg_41_0:CheckDressIsDirty() then
			if arg_41_0.changeDressType then
				pg.m02:sendNotification(GAME.ISLAND_CHEATER_CHANGE_VIEW_DRESSID, {
					type = arg_41_0.changeDressType,
					game_type = PlayRoomTools.GetGameTypeID(),
					ship_id = arg_41_0.shipId
				})
				pg.m02:sendNotification(GAME.PLAY_ROOM_REFRESH_ROOM_INFO)
			end

			pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_save1"))

			return
		end

		arg_41_0:SaveDressUpDataHandle()
	end, SFX_PANEL)
	onButton(arg_41_0, arg_41_0.dressUpConfireBtn, function()
		arg_41_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_COMMON,
			content = i18n("island_dressup_tip"),
			onYes = function()
				arg_41_0:SaveDressUpDataHandle()
			end,
			onNo = function()
				return
			end
		})
	end, SFX_PANEL)
	onButton(arg_41_0, arg_41_0.restBtn, function()
		arg_41_0:ResetDressUp()
	end, SFX_PANEL)

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.toggles) do
		onToggle(arg_41_0, iter_41_1, function(arg_47_0)
			if arg_47_0 then
				arg_41_0:SwitchPage(iter_41_0)
			end
		end, SFX_PANEL)
	end

	onButton(arg_41_0, arg_41_0.sortBtn, function()
		arg_41_0.sortPage:ExecuteAction("Show", arg_41_0.indexData, function(arg_49_0)
			arg_41_0:OnSort(arg_49_0)
		end)
	end, SFX_PANEL)
	onButton(arg_41_0, arg_41_0.orderBtn, function()
		local var_50_0 = 1 - arg_41_0.indexData.order

		arg_41_0:OnOrder(var_50_0)
	end, SFX_PANEL)
end

function var_0_0.OnSort(arg_51_0, arg_51_1)
	arg_51_0.indexData.sortKey = arg_51_1

	arg_51_0:UpdateOrderTxt()
	arg_51_0:UpdateDressUpList()
end

function var_0_0.OnOrder(arg_52_0, arg_52_1)
	arg_52_0.indexData.order = arg_52_1
	arg_52_0.orderBtn.localScale = Vector3(1, arg_52_1 == 1 and 1 or -1, 1)

	arg_52_0:UpdateDressUpList()
end

function var_0_0.UpdateOrderTxt(arg_53_0)
	arg_53_0.orderTxt.text = var_0_0.SORTCN[arg_53_0.indexData.sortKey]
end

function var_0_0.SwitchPage(arg_54_0, arg_54_1)
	arg_54_0.currentToggleIndex = arg_54_1

	if arg_54_0.currentToggleIndex == 4 then
		setActive(arg_54_0.dressTF, false)
		setActive(arg_54_0.skinTF, true)
		setActive(arg_54_0.hatTF, false)
		arg_54_0:GetSkinList()
		arg_54_0:UpdateSkinList()
		arg_54_0:UpdateColorList()
	else
		arg_54_0.dressType = var_0_1[arg_54_0.currentToggleIndex]

		if arg_54_0.SmoothFunc then
			if arg_54_0.dressType == IslandShipDressHelperNew.DressType.BackDecorate then
				arg_54_0.SmoothFunc(Quaternion.Euler(0, 0, 0))
			else
				arg_54_0.SmoothFunc(Quaternion.Euler(0, 180, 0))
			end
		end

		setActive(arg_54_0.dressTF, true)
		setActive(arg_54_0.skinTF, false)
		arg_54_0:GetDressUpList()
		arg_54_0:UpdateDressUpList()
		arg_54_0:UpdateHatDisplay()
		arg_54_0:UpdateMorphDisplay()
		arg_54_0:UpdateOrderTxt()
		arg_54_0:UpdateColorList(true)
	end
end

function var_0_0.GetDressUpList(arg_55_0)
	arg_55_0.dressList = {}

	if arg_55_0.shipId == 0 then
		for iter_55_0, iter_55_1 in ipairs(arg_55_0.dressUpAgency:GetHasDressByType(arg_55_0.dressType)) do
			local var_55_0 = pg.island_dress_template[iter_55_1.id]

			if var_55_0.is_hide ~= 1 then
				local var_55_1 = var_55_0.quality

				table.insert(arg_55_0.dressList, IslandDressItem.New({
					id = iter_55_1.id,
					quality = var_55_1,
					needRedDot = iter_55_1.state == 0
				}))
			end
		end
	else
		for iter_55_2, iter_55_3 in pairs(arg_55_0.characterAgency:GetAllOwnDressDic()) do
			if iter_55_3:getConfigTable().type == arg_55_0.dressType and iter_55_3.num > 0 and iter_55_3:getConfigTable().is_hide ~= 1 then
				local var_55_2 = pg.island_dress_template[iter_55_3.id].quality

				table.insert(arg_55_0.dressList, IslandDressItem.New({
					id = iter_55_3.id,
					ownCount = iter_55_3.num,
					needRedDot = iter_55_3.read == 0,
					quality = var_55_2
				}))
			end
		end

		for iter_55_4, iter_55_5 in pairs(arg_55_0.characterAgency:GetShipHoldedDressDic()) do
			for iter_55_6, iter_55_7 in ipairs(iter_55_5) do
				if iter_55_7:getConfigTable().type == arg_55_0.dressType and iter_55_7:getConfigTable().is_hide ~= 1 then
					local var_55_3 = pg.island_dress_template[iter_55_7.dress_id].quality

					table.insert(arg_55_0.dressList, IslandDressItem.New({
						id = iter_55_7.dress_id,
						holdedShipId = iter_55_7.ship_id,
						quality = var_55_3
					}))
				end
			end
		end
	end

	local var_55_4

	if arg_55_0.indexData.sortKey == var_0_0.SORT_DEFAULT then
		var_55_4 = {
			function(arg_56_0)
				return arg_56_0.holdedShipId and 0 or 1
			end,
			function(arg_57_0)
				return arg_57_0.needRedDot and 0 or 1
			end,
			function(arg_58_0)
				return -arg_58_0.quality
			end,
			function(arg_59_0)
				return -arg_59_0.id
			end
		}
	end

	table.sort(arg_55_0.dressList, CompareFuncs(var_55_4))
end

function var_0_0.GetSkinList(arg_60_0)
	if arg_60_0.shipId ~= 0 then
		arg_60_0.skinList = {}

		for iter_60_0, iter_60_1 in ipairs(pg.island_skin_template.get_id_list_by_ship_group[arg_60_0.shipId] or {}) do
			if arg_60_0.characterAgency:CheckSkinIsOwned(iter_60_1) then
				table.insert(arg_60_0.skinList, iter_60_1)
			end
		end
	end
end

function var_0_0.UpdateSkinList(arg_61_0)
	local var_61_0 = #arg_61_0.skinList

	setActive(arg_61_0.skinRectTF, var_61_0 ~= 0)
	setActive(arg_61_0.skinEmpty, var_61_0 == 0)
	arg_61_0.skinRect:SetTotalCount(var_61_0)
	setText(arg_61_0.skinEmptyTips, i18n("island_dress_no_item"))
end

function var_0_0.UpdateDressUpList(arg_62_0)
	if arg_62_0.currentToggleIndex == 4 then
		return
	end

	local var_62_0 = #arg_62_0.dressList

	setActive(arg_62_0.dressRectTF, var_62_0 ~= 0)
	setActive(arg_62_0.dressEmpty, var_62_0 == 0)
	setText(arg_62_0.dressEmptyTips, i18n("island_dress_no_item"))
	setActive(arg_62_0.sortBtn, false)

	if var_62_0 ~= 0 then
		arg_62_0.dressRect:SetTotalCount(var_62_0)
	end
end

function var_0_0.OnShow(arg_63_0, arg_63_1, arg_63_2, arg_63_3, arg_63_4, arg_63_5)
	arg_63_0.changeDressType = arg_63_5
	arg_63_0.SmoothFunc = arg_63_4
	arg_63_0.isFirstDressUp = arg_63_2

	setActive(arg_63_0.color_listPanel, false)
	setActive(arg_63_0.saveBtn, not arg_63_2)
	setActive(arg_63_0.restBtn, not arg_63_2)

	arg_63_0.shipDressHelper = arg_63_3
	arg_63_0.island = getProxy(IslandProxy):GetIsland()
	arg_63_0.characterAgency = arg_63_0.island:GetCharacterAgency()
	arg_63_0.dressUpAgency = arg_63_0.island:GetDressUpAgency()
	arg_63_0.shipId = arg_63_1
	arg_63_0.indexData = {
		order = 1,
		sortKey = var_0_0.SORT_DEFAULT
	}
	arg_63_0.smothObj = smothObj

	arg_63_0:InitCurDressData()
	setActive(arg_63_0.dressUpConfireBtn, arg_63_2)

	if arg_63_1 == 0 then
		setActive(arg_63_0.toggles[4], false)
		setActive(arg_63_0.toggles[5], not arg_63_2)
		setActive(arg_63_0.toggles[6], not arg_63_2)
		setActive(arg_63_0.toggles[7], not arg_63_2)
		triggerToggle(arg_63_0.toggles[1], true)
	else
		setActive(arg_63_0.toggles[4], true)
		triggerToggle(arg_63_0.toggles[4], true)
	end

	if arg_63_0.changeDressType then
		for iter_63_0, iter_63_1 in ipairs(pg.gameset.bar_not_display_dress_type.description) do
			for iter_63_2, iter_63_3 in pairs(var_0_1) do
				if iter_63_3 == iter_63_1 then
					setActive(arg_63_0.toggles[iter_63_2], false)
				end
			end
		end
	end

	setActive(arg_63_0.toggles[1], arg_63_1 == 0)
	setActive(arg_63_0.toggles[2], arg_63_1 == 0)
	setActive(arg_63_0.toggles[3], arg_63_1 == 0)
	arg_63_0:UpdateRightReddot()
end

function var_0_0.InitCurDressData(arg_64_0)
	arg_64_0.curDressTypeDataDic = {}
	arg_64_0.curShipDressTypeDataDic = {}
	arg_64_0.dressColorDic = {}

	if arg_64_0.shipId == 0 then
		local var_64_0 = arg_64_0.isFirstDressUp and IslandShipDressHelperNew.CommanderCustom or IslandShipDressHelperNew.DressType

		for iter_64_0, iter_64_1 in pairs(var_64_0) do
			local var_64_1 = arg_64_0.isFirstDressUp and IslandShipDressHelperNew.GetInitDressByType(iter_64_1) or arg_64_0.dressUpAgency:GetDressByType(iter_64_1)

			arg_64_0.curDressTypeDataDic[iter_64_1] = var_64_1

			if var_64_1 then
				arg_64_0.dressColorDic[var_64_1] = arg_64_0.dressUpAgency:GetCurrentColorByDressId(var_64_1)
			end
		end
	else
		arg_64_0.curSkinId = arg_64_0.characterAgency:GetShipById(arg_64_0.shipId):GetCurSkinId()

		if arg_64_0.curSkinId == 0 then
			arg_64_0.curskinColorId = 0
		else
			arg_64_0.curskinColorId = arg_64_0.characterAgency:GetCurrentSkinColorByShipId(arg_64_0.shipId, arg_64_0.curSkinId)
		end

		for iter_64_2, iter_64_3 in pairs(IslandShipDressHelperNew.ExtraDressType) do
			local var_64_2 = arg_64_0.characterAgency:GetCurDressIdByShipId(arg_64_0.shipId, iter_64_3) or {}

			arg_64_0.curShipDressTypeDataDic[iter_64_3] = IslandShipDressItem.New(var_64_2)
		end
	end
end

function var_0_0.CheckDressIsDirty(arg_65_0)
	if arg_65_0.shipId == 0 then
		for iter_65_0, iter_65_1 in pairs(arg_65_0.curDressTypeDataDic) do
			if (arg_65_0.dressUpAgency:GetDressByType(iter_65_0) or 0) ~= iter_65_1 then
				return true
			end

			if iter_65_1 ~= 0 and arg_65_0.dressUpAgency:GetCurrentColorByDressId(iter_65_1) ~= (arg_65_0.dressColorDic[iter_65_1] or 0) then
				return true
			end
		end

		return false
	else
		local var_65_0 = arg_65_0.characterAgency:GetShipById(arg_65_0.shipId):GetCurSkinId()
		local var_65_1 = arg_65_0.characterAgency:GetCurrentSkinColorByShipId(arg_65_0.shipId, var_65_0)

		if var_65_0 ~= arg_65_0.curSkinId or var_65_1 ~= arg_65_0.curskinColorId then
			return true
		end

		for iter_65_2, iter_65_3 in pairs(arg_65_0.curShipDressTypeDataDic) do
			local var_65_2 = arg_65_0.characterAgency:GetCurDressIdByShipId(arg_65_0.shipId, iter_65_2) or {}

			if not iter_65_3:CheckIsEqualByShipDressItem(var_65_2) then
				return true
			end
		end

		return false
	end
end

function var_0_0.ResetDressUp(arg_66_0)
	if arg_66_0.shipId == 0 then
		for iter_66_0, iter_66_1 in pairs(IslandShipDressHelperNew.DressType) do
			local var_66_0 = arg_66_0.dressUpAgency:GetDressByType(iter_66_1) or 0
			local var_66_1 = arg_66_0.dressUpAgency:GetCurrentColorByDressId(var_66_0)
			local var_66_2 = arg_66_0.curDressTypeDataDic[iter_66_1]
			local var_66_3 = arg_66_0.dressColorDic[var_66_2]

			if var_66_0 == var_66_2 and var_66_3 ~= var_66_1 then
				arg_66_0.shipDressHelper:ChangeCommanderPartColor(iter_66_1, var_66_1)

				return
			end

			arg_66_0.shipDressHelper:ChangeDressByType(iter_66_1, {
				id = var_66_0,
				colorId = var_66_1
			})

			arg_66_0.curDressTypeDataDic[iter_66_1] = var_66_0
			arg_66_0.dressColorDic[var_66_0] = var_66_1
		end

		arg_66_0:UpdateDressUpList()
		arg_66_0:UpdateHatDisplay()
		arg_66_0:UpdateMorphDisplay()
	else
		local var_66_4 = arg_66_0.characterAgency:GetShipById(arg_66_0.shipId)

		if (function()
			local var_67_0 = var_66_4:GetCurSkinId()
			local var_67_1 = arg_66_0.characterAgency:GetCurrentSkinColorByShipId(arg_66_0.shipId, var_67_0)

			if var_67_0 ~= arg_66_0.curSkinId or var_67_1 ~= arg_66_0.curskinColorId then
				arg_66_0.curSkinId = var_67_0
				arg_66_0.curskinColorId = var_67_1

				return true
			end

			return false
		end)() then
			local var_66_5 = var_66_4:GetModelBySkinAndColorId(arg_66_0.curSkinId, arg_66_0.curskinColorId)

			arg_66_0.shipDressHelper:ChangeModelTransfromByUnitId(var_66_5)
			arg_66_0:UpdateSkinList()
			arg_66_0:UpdateColorList()
		end

		local var_66_6 = {
			IslandShipDressHelperNew.DressType.BackDecorate,
			IslandShipDressHelperNew.DressType.Flotage,
			IslandShipDressHelperNew.DressType.Footprint
		}

		for iter_66_2, iter_66_3 in ipairs(var_66_6) do
			local var_66_7 = arg_66_0.characterAgency:GetCurDressIdByShipId(arg_66_0.shipId, iter_66_3) or {}

			arg_66_0.shipDressHelper:ChangeDressByType(iter_66_3, {
				colorId = 0,
				id = var_66_7.dress_id or 0
			})

			arg_66_0.curShipDressTypeDataDic[iter_66_3] = IslandShipDressItem.New(var_66_7)
		end

		arg_66_0:UpdateDressUpList()
	end
end

function var_0_0.CheckShipCanSave(arg_68_0)
	local var_68_0 = true

	if not arg_68_0.characterAgency:CheckSkinIsOwned(arg_68_0.curSkinId) then
		arg_68_0.curSkinId = arg_68_0.characterAgency:GetShipById(arg_68_0.shipId):GetCurSkinId()
		var_68_0 = false
	end

	if arg_68_0.curSkinId ~= 0 and not arg_68_0.characterAgency:CheckSkinColorIsOwned(arg_68_0.curSkinId, arg_68_0.curskinColorId) then
		arg_68_0.curskinColorId = arg_68_0.characterAgency:GetCurrentSkinColorByShipId(arg_68_0.shipId, arg_68_0.curSkinId)
		var_68_0 = false
	end

	return var_68_0
end

function var_0_0.SaveDressUpDataHandle(arg_69_0, arg_69_1)
	if arg_69_0.shipId == 0 then
		arg_69_0:SaveDressUpData(arg_69_1)
	else
		if not arg_69_0:CheckShipCanSave() then
			local var_69_0 = arg_69_0.characterAgency:GetShipById(arg_69_0.shipId):GetModelBySkinAndColorId(arg_69_0.curSkinId, arg_69_0.curskinColorId)

			arg_69_0.shipDressHelper:ChangeModelTransfromByUnitId(var_69_0)
			arg_69_0:UpdateSkinList()
			arg_69_0:UpdateColorList()
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_save2"))
			existCall(arg_69_1)

			return
		end

		arg_69_0:SaveDressUpData(arg_69_1)
	end
end

function var_0_0.SaveDressUpData(arg_70_0, arg_70_1)
	if arg_70_0.shipId == 0 then
		local var_70_0, var_70_1 = (function()
			local var_71_0 = {}
			local var_71_1 = {}

			for iter_71_0, iter_71_1 in pairs(arg_70_0.curDressTypeDataDic) do
				local var_71_2 = arg_70_0.dressUpAgency:GetDressByType(iter_71_0)
				local var_71_3 = false

				if iter_71_1 ~= var_71_2 then
					var_71_3 = true
				end

				if iter_71_0 == IslandShipDressHelperNew.DressType.Hat and iter_71_1 == 0 then
					var_71_3 = true
				end

				if var_71_3 then
					table.insert(var_71_0, {
						type = iter_71_0,
						id = iter_71_1
					})
				end

				local var_71_4 = arg_70_0.dressColorDic[iter_71_1] or 0

				if arg_70_0.dressUpAgency:GetCurrentColorByDressId(iter_71_1) ~= var_71_4 then
					table.insert(var_71_1, {
						id = iter_71_1,
						color = var_71_4
					})
				end
			end

			return var_71_0, var_71_1
		end)()

		pg.m02:sendNotification(GAME.ISLAND_CHANGE_COMMANDER_DRESS, {
			dress_List = var_70_0,
			color_list = var_70_1,
			island_id = arg_70_0.island.id
		})
		existCall(arg_70_1)
	else
		local var_70_2 = {}
		local var_70_3 = {}
		local var_70_4 = {}
		local var_70_5 = {}

		for iter_70_0, iter_70_1 in pairs(arg_70_0.curShipDressTypeDataDic) do
			local var_70_6 = arg_70_0.characterAgency:GetCurDressIdByShipId(arg_70_0.shipId, iter_70_0) or {}

			if not iter_70_1:CheckIsEqualByShipDressItem(var_70_6) then
				if not iter_70_1.dress_id then
					table.insert(var_70_3, var_70_6.dress_id)
				elseif iter_70_1.ship_id ~= 0 then
					if var_70_6.dress_id then
						table.insert(var_70_5, var_70_6.dress_id)
					end

					table.insert(var_70_4, {
						ship_id = iter_70_1.ship_id,
						dress_id = iter_70_1.dress_id
					})
				else
					if var_70_6.dress_id then
						table.insert(var_70_3, var_70_6.dress_id)
					end

					table.insert(var_70_2, {
						ship_id = iter_70_1.ship_id,
						dress_id = iter_70_1.dress_id
					})
				end
			end
		end

		local function var_70_7()
			pg.m02:sendNotification(GAME.ISLAND_CHANGE_DRESS, {
				dress_List = var_70_2,
				unload_dress = var_70_3,
				ship_id = arg_70_0.shipId,
				skin_id = arg_70_0.curSkinId,
				color_id = arg_70_0.curskinColorId
			})

			if arg_70_0.changeDressType then
				pg.m02:sendNotification(GAME.ISLAND_CHEATER_CHANGE_VIEW_DRESSID, {
					type = arg_70_0.changeDressType,
					game_type = PlayRoomTools.GetGameTypeID(),
					ship_id = arg_70_0.shipId
				})
			end
		end

		if #var_70_4 == 0 then
			var_70_7()
			existCall(arg_70_1)

			return
		end

		arg_70_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_DRESS_WEAR_CONFIRE,
			content = i18n("island_dress_replace_tip"),
			needconfirmDressList = var_70_4,
			onYes = function()
				for iter_73_0, iter_73_1 in ipairs(var_70_4) do
					table.insert(var_70_2, iter_73_1)
				end

				for iter_73_2, iter_73_3 in ipairs(var_70_5) do
					table.insert(var_70_3, iter_73_3)
				end

				var_70_7()
				existCall(arg_70_1)
			end,
			onNo = function()
				existCall(arg_70_1)
			end
		})
	end
end

function var_0_0.CheckInReturn(arg_75_0, arg_75_1)
	if arg_75_0.morphing then
		return
	end

	if not arg_75_0:CheckDressIsDirty() then
		existCall(arg_75_1)

		return
	end

	if not arg_75_0:CheckShipCanSave() then
		existCall(arg_75_1)
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_exit2"))

		return
	end

	arg_75_0:ShowMsgBox({
		type = IslandMsgBox.TYPE_COMMON,
		content = i18n("island_dressup_tip_1"),
		onYes = function()
			arg_75_0:SaveDressUpDataHandle(arg_75_1)
		end,
		onNo = function()
			existCall(arg_75_1)
		end
	})
end

function var_0_0.OnChangeRoleDressDone(arg_78_0)
	for iter_78_0, iter_78_1 in pairs(arg_78_0.curShipDressTypeDataDic) do
		local var_78_0 = arg_78_0.characterAgency:GetCurDressIdByShipId(arg_78_0.shipId, iter_78_0) or {}

		arg_78_0.curShipDressTypeDataDic[iter_78_0] = IslandShipDressItem.New(var_78_0)
	end

	arg_78_0:GetDressUpList()
	arg_78_0:UpdateDressUpList()
end

function var_0_0.OnSendRoleDressReadDone(arg_79_0, arg_79_1)
	for iter_79_0, iter_79_1 in ipairs(arg_79_1) do
		for iter_79_2, iter_79_3 in ipairs(arg_79_0.dressList) do
			if iter_79_3.id == iter_79_1 and iter_79_3.needRedDot then
				iter_79_3.needRedDot = false
			end
		end
	end

	arg_79_0:UpdateDressUpList()
	arg_79_0:UpdateRightReddot()
end

function var_0_0.OnBuyRoleSkinColorDone(arg_80_0)
	arg_80_0:UpdateColorList()
end

function var_0_0.OnBuyRoleDressColorDone(arg_81_0)
	arg_81_0:UpdateColorList(true)
end

function var_0_0.GetBuySkindDone(arg_82_0)
	arg_82_0:UpdateSkinList()
end

function var_0_0.UpdateRightReddot(arg_83_0)
	local var_83_0 = arg_83_0.shipId == 0 and {
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

	for iter_83_0, iter_83_1 in ipairs(var_83_0) do
		local var_83_1 = arg_83_0.toggles[iter_83_1]:Find("red_dot")
		local var_83_2 = false
		local var_83_3 = var_0_1[iter_83_1]

		if arg_83_0.shipId == 0 then
			var_83_2 = arg_83_0.dressUpAgency:CheckRedDotByDressType(var_83_3)
		else
			var_83_2 = arg_83_0.characterAgency:CheckRedDotByDressType(var_83_3)
		end

		setActive(var_83_1, var_83_2)
	end
end

function var_0_0.UpdateColorPanel(arg_84_0)
	if not (function()
		if arg_84_0.isDressColor then
			local var_85_0 = arg_84_0.curDressTypeDataDic[arg_84_0.dressType]

			if not var_85_0 or var_85_0 == 0 then
				return false
			end

			return #(pg.island_dress_colordiff_template.get_id_list_by_belongto_dress[var_85_0] or {}) > 0
		end

		if not (arg_84_0.curSkinId ~= 0 and arg_84_0.curSkinId or nil) then
			return false
		end

		return true
	end)() then
		setActive(arg_84_0.color_listPanel, false)

		return
	end

	setActive(arg_84_0.color_listPanel, true)
end

function var_0_0.UpdateColorUnlockState(arg_86_0)
	local var_86_0
	local var_86_1
	local var_86_2

	if arg_86_0.isDressColor then
		var_86_2 = arg_86_0.curDressTypeDataDic[arg_86_0.dressType]

		if not var_86_2 or var_86_2 == 0 then
			return true
		end

		var_86_1 = arg_86_0.dressColorDic[var_86_2] or 0
		var_86_0 = pg.island_dress_colordiff_template[var_86_1]
	else
		var_86_0 = pg.island_skin_colordiff_template[arg_86_0.curskinColorId]
	end

	local var_86_3, var_86_4 = (function()
		if arg_86_0.isDressColor then
			if arg_86_0.shipId == 0 then
				if arg_86_0.dressUpAgency:CheckDressColorIsOwned(var_86_2, var_86_1) then
					return true
				end
			else
				return true
			end

			return false, true
		else
			if not arg_86_0.curskinColorId or arg_86_0.curskinColorId == 0 then
				return true
			end

			if arg_86_0.characterAgency:CheckSkinColorIsOwned(arg_86_0.curSkinId, arg_86_0.curskinColorId) then
				return true
			end

			local var_87_0 = arg_86_0.characterAgency:CheckSkinIsOwned(arg_86_0.curSkinId)

			return false, var_87_0
		end
	end)()

	if var_86_3 then
		setActive(arg_86_0.color_bg_unlock, true)
		setActive(arg_86_0.color_bg_locked, false)
	else
		setActive(arg_86_0.color_bg_unlock, false)
		setActive(arg_86_0.color_bg_locked, true)

		local var_86_5 = pg.island_item_data_template[var_86_0.cost[1][1]]

		GetImageSpriteFromAtlasAsync("island/" .. var_86_5.icon, "", arg_86_0.color_cost_item_icon)

		local var_86_6 = var_86_0.cost[1][2]

		setText(arg_86_0.color_cost_item_count, "×" .. var_86_6)
		setActive(arg_86_0.color_lockedBtn, var_86_4)
	end

	onButton(arg_86_0, arg_86_0.color_lockedBtn, function()
		local function var_88_0()
			if arg_86_0.isDressColor then
				pg.m02:sendNotification(GAME.ISLAND_BUY_ROLE_DRESS_COLOR, {
					id = arg_86_0.shipId,
					dress_id = var_86_2,
					color_id = var_86_1
				})
			else
				pg.m02:sendNotification(GAME.ISLAND_BUY_ROLE_SKIN_COLOR, {
					ship_id = arg_86_0.shipId,
					skin_id = arg_86_0.curSkinId,
					color_id = arg_86_0.curskinColorId
				})
			end
		end

		local var_88_1 = pg.island_item_data_template[var_86_0.cost[1][1]]
		local var_88_2 = i18n("island_dress_color_buy", var_88_1.name .. "x" .. var_86_0.cost[1][2])

		arg_86_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_COMMON,
			content = var_88_2,
			onYes = function()
				if not (function(arg_91_0)
					local var_91_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

					for iter_91_0, iter_91_1 in ipairs(arg_91_0) do
						local var_91_1 = iter_91_1[1]

						if iter_91_1[2] > var_91_0:GetOwnCount(var_91_1) then
							return false
						end
					end

					return true
				end)(var_86_0.cost) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

					return
				end

				var_88_0()
			end,
			onNo = function()
				return
			end
		})
	end)
end

function var_0_0.UpdateColorItemList(arg_93_0)
	(function()
		arg_93_0.colorItemList = {}

		if arg_93_0.isDressColor then
			local var_94_0 = arg_93_0.curDressTypeDataDic[arg_93_0.dressType]
			local var_94_1 = arg_93_0.dressColorDic[var_94_0]
			local var_94_2 = pg.island_dress_colordiff_template.get_id_list_by_belongto_dress[var_94_0] or {}

			if #var_94_2 > 0 then
				local var_94_3 = var_94_1 == 0
				local var_94_4 = true

				table.insert(arg_93_0.colorItemList, {
					itemId = 0,
					selected = var_94_3,
					owned = var_94_4
				})

				for iter_94_0, iter_94_1 in ipairs(var_94_2) do
					local var_94_5 = var_94_1 == iter_94_1
					local var_94_6 = arg_93_0.dressUpAgency:CheckDressColorIsOwned(var_94_0, iter_94_1)

					table.insert(arg_93_0.colorItemList, {
						itemId = iter_94_1,
						selected = var_94_5,
						owned = var_94_6,
						costItemIcon = pg.island_dress_colordiff_template[iter_94_1].color_icon
					})
				end
			end
		else
			local var_94_7 = pg.island_skin_colordiff_template.get_id_list_by_skin_group[arg_93_0.curSkinId] or {}
			local var_94_8 = arg_93_0.curskinColorId == 0
			local var_94_9 = arg_93_0.characterAgency:CheckSkinIsOwned(arg_93_0.curSkinId)

			table.insert(arg_93_0.colorItemList, {
				itemId = 0,
				selected = var_94_8,
				owned = var_94_9
			})

			for iter_94_2, iter_94_3 in ipairs(var_94_7) do
				local var_94_10 = arg_93_0.curskinColorId == iter_94_3
				local var_94_11 = arg_93_0.characterAgency:CheckSkinColorIsOwned(arg_93_0.curSkinId, iter_94_3)

				table.insert(arg_93_0.colorItemList, {
					itemId = iter_94_3,
					selected = var_94_10,
					owned = var_94_11,
					costItemIcon = pg.island_skin_colordiff_template[iter_94_3].color_icon
				})
			end
		end
	end)()
	arg_93_0.colorItemUIList:make(function(arg_95_0, arg_95_1, arg_95_2)
		if arg_95_0 == UIItemList.EventUpdate then
			arg_95_1 = arg_95_1 + 1

			local var_95_0 = arg_93_0.colorItemList[arg_95_1]

			setActive(arg_95_2:Find("select"), var_95_0.selected)

			local var_95_1 = var_95_0.itemId

			setActive(arg_95_2:Find("orginName"), var_95_1 == 0)
			setActive(arg_95_2:Find("locked"), var_95_1 == 0)
			setActive(arg_95_2:Find("icon"), false)

			if var_95_0.costItemIcon then
				setActive(arg_95_2:Find("icon"), true)
				GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. var_95_0.costItemIcon, "", arg_95_2:Find("icon"))
			end

			setActive(arg_95_2:Find("locked"), not var_95_0.owned)
			onButton(arg_93_0, arg_95_2, function()
				if arg_93_0.isDressColor then
					local var_96_0 = arg_93_0.curDressTypeDataDic[arg_93_0.dressType]
					local var_96_1 = arg_93_0.dressColorDic[var_96_0]

					if var_95_1 == var_96_1 then
						return
					end

					arg_93_0.dressColorDic[var_96_0] = var_95_1

					arg_93_0.shipDressHelper:ChangeCommanderPartColor(arg_93_0.dressType, var_95_1)
				else
					if var_95_1 == arg_93_0.curskinColorId then
						return
					end

					arg_93_0.curskinColorId = var_95_1

					arg_93_0:ChangeModelBySkinAndSkinColor()
				end

				arg_93_0:UpdateColorList(arg_93_0.isDressColor)
			end)
		end
	end)
	arg_93_0.colorItemUIList:align(#arg_93_0.colorItemList)
end

function var_0_0.UpdateColorList(arg_97_0, arg_97_1)
	arg_97_0.isDressColor = arg_97_1

	arg_97_0:UpdateColorPanel()
	arg_97_0:UpdateColorUnlockState()
	arg_97_0:UpdateColorItemList()
end

function var_0_0.OnHide(arg_98_0)
	return
end

function var_0_0.OnDestroy(arg_99_0)
	if arg_99_0.shipDressHelper then
		arg_99_0.shipDressHelper:StopMorphSwitch()
	end

	arg_99_0:SetMorphBlock(false)
	ClearLScrollrect(arg_99_0.dressRect)
	ClearLScrollrect(arg_99_0.skinRect)

	for iter_99_0, iter_99_1 in pairs(arg_99_0.dressCards or {}) do
		iter_99_1:Dispose()
	end

	arg_99_0.dressCards = nil

	for iter_99_2, iter_99_3 in pairs(arg_99_0.skinCards or {}) do
		iter_99_3:Dispose()
	end

	arg_99_0.skinCards = nil

	if arg_99_0.dressDetailPopup then
		arg_99_0.dressDetailPopup:Destroy()

		arg_99_0.dressDetailPopup = nil
	end
end

return var_0_0
