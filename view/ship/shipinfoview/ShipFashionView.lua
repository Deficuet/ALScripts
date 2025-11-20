local var_0_0 = class("ShipFashionView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ShipFashionView"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:InitFashion()
end

function var_0_0.InitFashion(arg_3_0)
	arg_3_0.mainPanel = arg_3_0._parentTf.parent
	arg_3_0.stylePanel = arg_3_0._tf
	arg_3_0.styleScroll = arg_3_0.stylePanel:Find("style_scroll")
	arg_3_0.styleContainer = arg_3_0.styleScroll:Find("view_port")
	arg_3_0.styleCard = arg_3_0._tf:GetComponent(typeof(ItemList)).prefabItem[0]
	arg_3_0.hideObjToggleTF = findTF(arg_3_0._tf, "btns/hideObjToggle")

	setActive(arg_3_0.hideObjToggleTF, false)

	arg_3_0.hideObjToggle = GetComponent(arg_3_0.hideObjToggleTF, typeof(Toggle))

	setText(findTF(arg_3_0.hideObjToggleTF, "Label"), i18n("paint_hide_other_obj_tip"))

	arg_3_0.shareBtn = findTF(arg_3_0._tf, "share_btn")
	arg_3_0.phantomBtn = arg_3_0._tf:Find("phantom_btn")

	onButton(arg_3_0, arg_3_0.phantomBtn, function()
		local var_4_0 = getProxy(TechnologyProxy):getBluePrintById(arg_3_0:GetShipVO().groupId)

		arg_3_0:emit(ShipMainMediator.OPEN_PHANTOM_LAYER, var_4_0 and var_4_0:getConfig("blueprint_version") or nil)
	end, SFX_PANEL)
	setParent(arg_3_0.phantomBtn, arg_3_0._tf.parent)
	setActive(arg_3_0.stylePanel, true)
	setActive(arg_3_0.styleCard, false)

	arg_3_0.fashionSkins = {}
	arg_3_0.fashionCellMap = {}
	arg_3_0.fashionGroup = 0
	arg_3_0.fashionSkinId = 0
	arg_3_0.onSelected = false
	arg_3_0.isShareSkinFlag = false

	arg_3_0:RegisterShareToggle()
	arg_3_0:bind(ShipMainMediator.ON_NEXTSHIP_PREPARE, function(arg_5_0, arg_5_1)
		arg_3_0._lastSelectCard = nil

		if arg_3_0.isShareSkinFlag and arg_5_1 and #arg_3_0:GetShareSkins(arg_5_1) <= 0 then
			arg_3_0.isShareSkinFlag = false
		end
	end)
end

function var_0_0.SetShareData(arg_6_0, arg_6_1)
	arg_6_0.shareData = arg_6_1
end

function var_0_0.GetShipVO(arg_7_0)
	if arg_7_0.shareData and arg_7_0.shareData.shipVO then
		return arg_7_0.shareData.shipVO
	end

	return nil
end

function var_0_0.SetSkinList(arg_8_0, arg_8_1)
	arg_8_0.skinList = arg_8_1
end

function var_0_0.UpdateUI(arg_9_0)
	triggerToggle(arg_9_0.shareBtn, arg_9_0.isShareSkinFlag)

	local var_9_0 = arg_9_0:GetShareSkins(arg_9_0:GetShipVO())

	setActive(arg_9_0.shareBtn, #var_9_0 > 0)
	setActive(arg_9_0.phantomBtn, arg_9_0:GetShipVO():isBluePrintShip())
end

function var_0_0.OnSelected(arg_10_0, arg_10_1)
	if arg_10_1 then
		arg_10_0:OverlayPanel(arg_10_0._parentTf, {
			pbList = {
				arg_10_0.stylePanel:Find("style_desc"),
				arg_10_0.stylePanel:Find("frame")
			},
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
	else
		arg_10_0:UnOverlayPanel(arg_10_0._parentTf, arg_10_0.mainPanel)
	end

	arg_10_0.onSelected = arg_10_1
end

function var_0_0.GetShareSkins(arg_11_0, arg_11_1)
	local var_11_0 = getProxy(ShipSkinProxy):GetShareSkinsForShip(arg_11_1)

	return (_.map(var_11_0, function(arg_12_0)
		return pg.ship_skin_template[arg_12_0.id]
	end))
end

function var_0_0.UpdateAllFashion(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:GetShipVO()
	local var_13_1 = var_13_0.groupId

	arg_13_0.fashionSkins = arg_13_0.isShareSkinFlag and arg_13_0:GetShareSkins(var_13_0) or arg_13_0.shareData:GetGroupSkinList(var_13_1)

	if arg_13_0.fashionGroup ~= var_13_1 or arg_13_1 then
		arg_13_0.fashionGroup = var_13_1

		arg_13_0:ResetFashion()

		for iter_13_0 = arg_13_0.styleContainer.childCount, #arg_13_0.fashionSkins - 1 do
			cloneTplTo(arg_13_0.styleCard, arg_13_0.styleContainer)
		end

		for iter_13_1 = #arg_13_0.fashionSkins, arg_13_0.styleContainer.childCount - 1 do
			local var_13_2 = arg_13_0.styleContainer:GetChild(iter_13_1)

			if arg_13_0.fashionCellMap[var_13_2] then
				arg_13_0.fashionCellMap[var_13_2]:clear()
			end

			setActive(var_13_2, false)
		end

		for iter_13_2, iter_13_3 in ipairs(arg_13_0.fashionSkins) do
			local var_13_3 = iter_13_2
			local var_13_4 = arg_13_0.fashionSkins[iter_13_2]
			local var_13_5 = arg_13_0.styleContainer:GetChild(iter_13_2 - 1)
			local var_13_6 = arg_13_0.fashionCellMap[var_13_5]

			if not var_13_6 then
				var_13_6 = ShipSkinCard.New(var_13_5.gameObject)
				arg_13_0.fashionCellMap[var_13_5] = var_13_6
			end

			local var_13_7 = arg_13_0:GetShipVO():getRemouldSkinId() == var_13_4.id and arg_13_0:GetShipVO():isRemoulded()
			local var_13_8 = arg_13_0:GetShipVO():proposeSkinOwned(var_13_4) or table.contains(arg_13_0.skinList, var_13_4.id) or var_13_7 or var_13_4.skin_type == ShipSkin.SKIN_TYPE_OLD or getProxy(ShipSkinProxy):hasSkin(var_13_4.id)

			var_13_6:updateData(arg_13_0:GetShipVO(), var_13_4, var_13_8)

			local var_13_9 = arg_13_0:GetShipVO():useSkin(var_13_4.id)

			var_13_6:updateUsing(var_13_9)
			onButton(arg_13_0, var_13_6.changeSkinTF, function(arg_14_0)
				local var_14_0 = ShipSkin.GetChangeSkinNextId(var_13_4.id)

				ShipSkin.SetStoreChangeSkinId(var_14_0, var_13_0:GetShipPhantomMark())

				if var_13_9 then
					pg.m02:sendNotification(GAME.CHANGE_SKIN_UPDATE, arg_13_0:GetShipVO():GetShipPhantomMark())
				end
			end, SFX_PANEL)
			onButton(arg_13_0, var_13_5, function()
				arg_13_0:clickCell(var_13_6, var_13_4)

				arg_13_0._lastSelectCard = var_13_3
			end)
			setActive(var_13_5, true)
		end
	else
		for iter_13_4, iter_13_5 in ipairs(arg_13_0.fashionSkins) do
			local var_13_10 = arg_13_0.styleContainer:GetChild(iter_13_4 - 1)
			local var_13_11 = arg_13_0.fashionCellMap[var_13_10]
			local var_13_12 = arg_13_0:GetShipVO():getRemouldSkinId() == iter_13_5.id and arg_13_0:GetShipVO():isRemoulded()
			local var_13_13 = arg_13_0:GetShipVO():proposeSkinOwned(iter_13_5) or table.contains(arg_13_0.skinList, iter_13_5.id) or var_13_12 or iter_13_5.skin_type == ShipSkin.SKIN_TYPE_OLD or getProxy(ShipSkinProxy):hasSkin(iter_13_5.id)

			var_13_11:updateData(arg_13_0:GetShipVO(), iter_13_5, var_13_13)
		end
	end

	arg_13_0.fashionSkinId = arg_13_0:GetShipVO():getSkinId()

	local var_13_14 = arg_13_0.styleContainer:GetChild(0)

	for iter_13_6, iter_13_7 in ipairs(arg_13_0.fashionSkins) do
		if iter_13_7.id == arg_13_0.fashionSkinId then
			var_13_14 = arg_13_0.styleContainer:GetChild(iter_13_6 - 1)

			break
		end
	end

	if arg_13_0._lastSelectCard then
		var_13_14 = arg_13_0.styleContainer:GetChild(arg_13_0._lastSelectCard - 1)
		arg_13_0._lastSelectCard = nil
	end

	triggerButton(var_13_14)
end

function var_0_0.clickCell(arg_16_0, arg_16_1, arg_16_2)
	if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION then
		return
	end

	arg_16_0.clickCellTime = Time.realtimeSinceStartup
	arg_16_0.fashionSkinId = arg_16_2.id

	arg_16_0:UpdateFashionDetail(arg_16_2)
	arg_16_0:emit(ShipViewConst.LOAD_PAINTING, arg_16_2.painting)
	arg_16_0:emit(ShipViewConst.LOAD_PAINTING_BG, arg_16_0:GetShipVO():rarity2bgPrintForGet(), arg_16_0:GetShipVO():isBluePrintShip(), arg_16_0:GetShipVO():isMetaShip())

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.fashionSkins) do
		local var_16_0 = arg_16_0.styleContainer:GetChild(iter_16_0 - 1)
		local var_16_1 = arg_16_0.fashionCellMap[var_16_0]

		var_16_1:updateSelected(iter_16_1.id == arg_16_0.fashionSkinId)
		var_16_1:updateUsing(arg_16_0:GetShipVO():getSkinId() == iter_16_1.id)
	end

	local var_16_2 = arg_16_2.painting
	local var_16_3 = checkABExist("painting/" .. var_16_2 .. "_n")

	setActive(arg_16_0.hideObjToggle, var_16_3)

	if var_16_3 then
		arg_16_0.hideObjToggle.isOn = PlayerPrefs.GetInt("paint_hide_other_obj_" .. var_16_2, 0) ~= 0

		onToggle(arg_16_0, arg_16_0.hideObjToggleTF, function(arg_17_0)
			PlayerPrefs.SetInt("paint_hide_other_obj_" .. var_16_2, arg_17_0 and 1 or 0)
			arg_16_1:flushSkin()
			arg_16_0:emit(ShipViewConst.LOAD_PAINTING, var_16_2, true)
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateFashion(arg_18_0, arg_18_1)
	if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION or not arg_18_0.shareData:HasFashion() then
		return
	end

	arg_18_0:UpdateAllFashion(arg_18_1)
end

function var_0_0.ResetFashion(arg_19_0)
	arg_19_0.fashionSkinId = 0
end

function var_0_0.UpdateFashionDetail(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.fashionDetailWrapper

	if not var_20_0 then
		var_20_0 = {
			name = findTF(arg_20_0.stylePanel, "style_desc/name_bg/name"),
			descTxt = findTF(arg_20_0.stylePanel, "style_desc/desc_frame/desc/Text"),
			character = findTF(arg_20_0.stylePanel, "style_desc/character"),
			confirm = findTF(arg_20_0.stylePanel, "confirm_button"),
			cancel = findTF(arg_20_0.stylePanel, "cancel_button")
		}
		var_20_0.diamond = findTF(var_20_0.confirm, "diamond")
		var_20_0.using = findTF(var_20_0.confirm, "using")
		var_20_0.experience = findTF(var_20_0.confirm, "experience")
		var_20_0.change = findTF(var_20_0.confirm, "change")
		var_20_0.buy = findTF(var_20_0.confirm, "buy")
		var_20_0.activity = findTF(var_20_0.confirm, "activity")
		var_20_0.cantbuy = findTF(var_20_0.confirm, "cantbuy")
		var_20_0.prefab = "unknown"
		arg_20_0.fashionDetailWrapper = var_20_0
	end

	setText(var_20_0.name, arg_20_1.name)
	setText(var_20_0.descTxt, SwitchSpecialChar(arg_20_1.desc, true))

	local var_20_1 = var_20_0.descTxt:GetComponent(typeof(Text))

	if #var_20_1.text > 50 then
		var_20_1.alignment = TextAnchor.MiddleLeft
	else
		var_20_1.alignment = TextAnchor.MiddleCenter
	end

	if var_20_0.prefab ~= arg_20_1.prefab then
		local var_20_2 = var_20_0.character:Find(var_20_0.prefab)

		if not IsNil(var_20_2) then
			PoolMgr.GetInstance():ReturnSpineChar(var_20_0.prefab, var_20_2.gameObject)
		end

		var_20_0.prefab = arg_20_1.prefab

		local var_20_3 = var_20_0.prefab

		arg_20_0.spineChar = SpineAnimChar.New()

		arg_20_0.spineChar:SetPaint(var_20_3)
		arg_20_0.spineChar:Load(true, function(arg_21_0)
			if var_20_0.prefab ~= var_20_3 then
				arg_21_0:Dispose()
			else
				arg_21_0:SetName(var_20_3)
				arg_21_0:SetLocalPosition(Vector3.zero)
				arg_21_0:SetLocalScale(Vector3(0.5, 0.5, 1))
				arg_21_0:SetParent(var_20_0.character)
				arg_21_0:SetAction(arg_20_1.show_skin or "stand", 0)
			end
		end)
	end

	local var_20_4 = arg_20_0:GetShipVO():getRemouldSkinId() == arg_20_1.id and arg_20_0:GetShipVO():isRemoulded()
	local var_20_5 = (arg_20_0:GetShipVO():proposeSkinOwned(arg_20_1) or table.contains(arg_20_0.skinList, arg_20_1.id) or var_20_4) and 1 or 0
	local var_20_6 = arg_20_1.shop_id > 0 and pg.shop_template[arg_20_1.shop_id] or nil
	local var_20_7 = var_20_6 and not pg.TimeMgr.GetInstance():inTime(var_20_6.time)
	local var_20_8 = arg_20_1.id == arg_20_0:GetShipVO():getSkinId()
	local var_20_9 = arg_20_1.id == arg_20_0:GetShipVO():getConfig("skin_id") or var_20_5 >= 1 or arg_20_1.skin_type == ShipSkin.SKIN_TYPE_OLD or getProxy(ShipSkinProxy):hasSkin(arg_20_1.id)
	local var_20_10 = getProxy(ShipSkinProxy):getSkinById(arg_20_1.id)
	local var_20_11 = getProxy(ShipSkinProxy):InForbiddenSkinListAndShow(arg_20_1.id)
	local var_20_12 = var_20_8 and var_20_10 and var_20_10:isExpireType()

	setActive(var_20_0.using, false)
	setActive(var_20_0.change, false)
	setActive(var_20_0.buy, false)
	setActive(var_20_0.experience, false)

	if var_20_12 then
		setGray(var_20_0.confirm, false)
		setActive(var_20_0.experience, true)
	elseif var_20_8 then
		setGray(var_20_0.confirm, false)
		setActive(var_20_0.using, true)
	elseif var_20_9 and ShipSkin.IsShareSkin(arg_20_0:GetShipVO(), arg_20_1.id) and not ShipSkin.CanUseShareSkinForShip(arg_20_0:GetShipVO(), arg_20_1.id) then
		setActive(var_20_0.change, true)
		setGray(var_20_0.confirm, true)
	elseif var_20_9 then
		setActive(var_20_0.change, true)
		setGray(var_20_0.confirm, false)
	elseif var_20_6 then
		setActive(var_20_0.buy, true)
		setGray(var_20_0.confirm, var_20_7 or var_20_11)
	else
		setActive(var_20_0.change, true)
		setGray(var_20_0.confirm, true)
	end

	onButton(arg_20_0, var_20_0.confirm, function()
		if var_20_8 then
			if ShipSkin.IsChangeSkin(arg_20_1.id) then
				if arg_20_0.clickCellTime and Time.realtimeSinceStartup - arg_20_0.clickCellTime <= 0.35 then
					return
				end

				arg_20_0:SilentTriggerToggleFalse()
				arg_20_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.DETAIL)
			end
		elseif var_20_9 then
			if ShipSkin.IsShareSkin(arg_20_0:GetShipVO(), arg_20_1.id) and not ShipSkin.CanUseShareSkinForShip(arg_20_0:GetShipVO(), arg_20_1.id) then
				-- block empty
			else
				arg_20_0:emit(ShipMainMediator.CHANGE_SKIN, arg_20_0:GetShipVO().id, arg_20_1.id == arg_20_0:GetShipVO():getConfig("skin_id") and 0 or arg_20_1.id)
			end
		elseif var_20_6 then
			if var_20_7 or var_20_11 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
			else
				local var_22_0 = Goods.Create({
					shop_id = var_20_6.id
				}, Goods.TYPE_SKIN)

				if var_22_0:isDisCount() and var_22_0:IsItemDiscountType() then
					arg_20_0:emit(ShipMainMediator.BUY_ITEM_BY_ACT, var_20_6.id, 1)
				else
					local var_22_1 = var_22_0:GetPrice()
					local var_22_2 = i18n("text_buy_fashion_tip", var_22_1, arg_20_1.name)

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = var_22_2,
						onYes = function()
							arg_20_0:emit(ShipMainMediator.BUY_ITEM, var_20_6.id, 1)
						end
					})
				end
			end
		end
	end)
	onButton(arg_20_0, var_20_0.cancel, function()
		if arg_20_0.clickCellTime and Time.realtimeSinceStartup - arg_20_0.clickCellTime <= 0.35 then
			return
		end

		arg_20_0:SilentTriggerToggleFalse()
		arg_20_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.DETAIL)
	end)
end

function var_0_0.SilentTriggerToggleFalse(arg_25_0)
	arg_25_0.fashionGroup = false
	arg_25_0.isShareSkinFlag = false

	removeOnToggle(arg_25_0.shareBtn)
	triggerToggle(arg_25_0.shareBtn, false)
	arg_25_0:RegisterShareToggle()
end

function var_0_0.RegisterShareToggle(arg_26_0)
	onToggle(arg_26_0, arg_26_0.shareBtn, function(arg_27_0)
		arg_26_0.fashionGroup = false
		arg_26_0.isShareSkinFlag = arg_27_0

		arg_26_0:UpdateFashion()
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_28_0)
	setParent(arg_28_0.phantomBtn, arg_28_0._tf)

	if arg_28_0.fashionDetailWrapper then
		local var_28_0 = arg_28_0.fashionDetailWrapper

		if var_28_0.character:Find(var_28_0.prefab) and arg_28_0.spineChar then
			arg_28_0.spineChar:Dispose()

			arg_28_0.spineChar = nil
		end
	end

	arg_28_0.fashionDetailWrapper = nil

	for iter_28_0, iter_28_1 in pairs(arg_28_0.fashionCellMap) do
		iter_28_1:clear()
	end

	arg_28_0.fashionCellMap = {}
	arg_28_0.fashionSkins = {}
	arg_28_0.fashionGroup = 0
	arg_28_0.fashionSkinId = 0
	arg_28_0.shareData = nil
end

return var_0_0
