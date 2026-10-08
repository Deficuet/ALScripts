local var_0_0 = class("ShipFashionView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ShipFashionView"
end

function var_0_0.getFashionResList(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1 = arg_2_0.isShareSkinFlag and arg_2_0:GetShareSkins(arg_2_1) or arg_2_0.shareData:GetGroupSkinList(arg_2_1.groupId)

	for iter_2_0, iter_2_1 in ipairs(var_2_1) do
		table.insertto(var_2_0, ResPathSupport.GetPaintingListByPaintingName(iter_2_1.painting))
	end

	return var_2_0
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:InitFashion()
end

function var_0_0.InitFashion(arg_4_0)
	arg_4_0.mainPanel = arg_4_0._parentTf.parent
	arg_4_0.stylePanel = arg_4_0._tf
	arg_4_0.styleScroll = arg_4_0.stylePanel:Find("style_scroll")
	arg_4_0.styleContainer = arg_4_0.styleScroll:Find("view_port")
	arg_4_0.styleCard = arg_4_0.styleContainer:GetChild(0)
	arg_4_0.hideObjToggleTF = findTF(arg_4_0._tf, "btns/hideObjToggle")

	setActive(arg_4_0.hideObjToggleTF, false)

	arg_4_0.hideObjToggle = GetComponent(arg_4_0.hideObjToggleTF, typeof(Toggle))

	setText(findTF(arg_4_0.hideObjToggleTF, "Label"), i18n("paint_hide_other_obj_tip"))

	arg_4_0.shareBtn = findTF(arg_4_0._tf, "share_btn")
	arg_4_0.phantomBtn = arg_4_0._tf:Find("phantom_btn")

	onButton(arg_4_0, arg_4_0.phantomBtn, function()
		local var_5_0 = getProxy(TechnologyProxy):getBluePrintById(arg_4_0:GetShipVO().groupId)

		arg_4_0:emit(ShipMainMediator.OPEN_PHANTOM_LAYER, var_5_0 and var_5_0:getConfig("blueprint_version") or nil)
	end, SFX_PANEL)
	setParent(arg_4_0.phantomBtn, arg_4_0._tf.parent)
	setActive(arg_4_0.stylePanel, true)
	setActive(arg_4_0.styleCard, false)

	arg_4_0.fashionSkins = {}
	arg_4_0.fashionCellMap = {}
	arg_4_0.fashionGroup = 0
	arg_4_0.fashionSkinId = 0
	arg_4_0.onSelected = false
	arg_4_0.isShareSkinFlag = false

	arg_4_0:RegisterShareToggle()
	arg_4_0:bind(ShipMainMediator.ON_NEXTSHIP_PREPARE, function(arg_6_0, arg_6_1)
		arg_4_0._lastSelectCard = nil

		if arg_4_0.isShareSkinFlag and arg_6_1 and #arg_4_0:GetShareSkins(arg_6_1) <= 0 then
			arg_4_0.isShareSkinFlag = false
		end
	end)
end

function var_0_0.SetShareData(arg_7_0, arg_7_1)
	arg_7_0.shareData = arg_7_1
end

function var_0_0.GetShipVO(arg_8_0)
	if arg_8_0.shareData and arg_8_0.shareData.shipVO then
		return arg_8_0.shareData.shipVO
	end

	return nil
end

function var_0_0.SetSkinList(arg_9_0, arg_9_1)
	arg_9_0.skinList = arg_9_1
end

function var_0_0.UpdateUI(arg_10_0)
	triggerToggle(arg_10_0.shareBtn, arg_10_0.isShareSkinFlag)

	local var_10_0 = arg_10_0:GetShareSkins(arg_10_0:GetShipVO())

	setActive(arg_10_0.shareBtn, #var_10_0 > 0)
	setActive(arg_10_0.phantomBtn, arg_10_0:GetShipVO():isBluePrintShip())
end

function var_0_0.OnSelected(arg_11_0, arg_11_1)
	if arg_11_1 then
		arg_11_0:OverlayPanel(arg_11_0._parentTf, {
			pbList = {
				arg_11_0.stylePanel:Find("style_desc"),
				arg_11_0.stylePanel:Find("frame")
			},
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
	else
		arg_11_0:UnOverlayPanel(arg_11_0._parentTf, arg_11_0.mainPanel)
	end

	arg_11_0.onSelected = arg_11_1
end

function var_0_0.GetShareSkins(arg_12_0, arg_12_1)
	local var_12_0 = getProxy(ShipSkinProxy):GetShareSkinsForShip(arg_12_1)

	return (_.map(var_12_0, function(arg_13_0)
		return pg.ship_skin_template[arg_13_0.id]
	end))
end

function var_0_0.UpdateAllFashion(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:GetShipVO()

	SplitPackConst.DownloadByLuaArr(arg_14_0:getFashionResList(var_14_0), function()
		if arg_14_0.exited then
			return
		end

		arg_14_0:updateAllFashion(arg_14_1)
	end)
end

function var_0_0.updateAllFashion(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0:GetShipVO()
	local var_16_1 = var_16_0.groupId

	arg_16_0.fashionSkins = arg_16_0.isShareSkinFlag and arg_16_0:GetShareSkins(var_16_0) or arg_16_0.shareData:GetGroupSkinList(var_16_1)

	if arg_16_0.fashionGroup ~= var_16_1 or arg_16_1 then
		arg_16_0.fashionGroup = var_16_1

		arg_16_0:ResetFashion()

		for iter_16_0 = arg_16_0.styleContainer.childCount, #arg_16_0.fashionSkins - 1 do
			cloneTplTo(arg_16_0.styleCard, arg_16_0.styleContainer)
		end

		for iter_16_1 = #arg_16_0.fashionSkins, arg_16_0.styleContainer.childCount - 1 do
			local var_16_2 = arg_16_0.styleContainer:GetChild(iter_16_1)

			if arg_16_0.fashionCellMap[var_16_2] then
				arg_16_0.fashionCellMap[var_16_2]:clear()
			end

			setActive(var_16_2, false)
		end

		for iter_16_2, iter_16_3 in ipairs(arg_16_0.fashionSkins) do
			local var_16_3 = iter_16_2
			local var_16_4 = arg_16_0.fashionSkins[iter_16_2]
			local var_16_5 = arg_16_0.styleContainer:GetChild(iter_16_2 - 1)
			local var_16_6 = arg_16_0.fashionCellMap[var_16_5]

			if not var_16_6 then
				var_16_6 = ShipSkinCard.New(var_16_5.gameObject)
				arg_16_0.fashionCellMap[var_16_5] = var_16_6
			end

			local var_16_7 = arg_16_0:GetShipVO():getRemouldSkinId() == var_16_4.id and arg_16_0:GetShipVO():isRemoulded()
			local var_16_8 = arg_16_0:GetShipVO():proposeSkinOwned(var_16_4) or table.contains(arg_16_0.skinList, var_16_4.id) or var_16_7 or var_16_4.skin_type == ShipSkin.SKIN_TYPE_OLD or getProxy(ShipSkinProxy):hasSkin(var_16_4.id)

			var_16_6:updateData(arg_16_0:GetShipVO(), var_16_4, var_16_8)

			local var_16_9 = arg_16_0:GetShipVO():useSkin(var_16_4.id)

			var_16_6:updateUsing(var_16_9)
			onButton(arg_16_0, var_16_6.changeSkinTF, function(arg_17_0)
				local var_17_0 = ShipSkin.GetChangeSkinNextId(var_16_4.id)

				if var_16_9 then
					ShipSkin.SetStoreChangeSkinId(var_17_0, var_16_0:GetShipPhantomMark())
					pg.m02:sendNotification(GAME.CHANGE_SKIN_UPDATE, arg_16_0:GetShipVO():GetShipPhantomMark())
				end
			end, SFX_PANEL)
			onButton(arg_16_0, var_16_5, function()
				arg_16_0:clickCell(var_16_6, var_16_4)

				arg_16_0._lastSelectCard = var_16_3
			end)
			setActive(var_16_5, true)
		end
	else
		for iter_16_4, iter_16_5 in ipairs(arg_16_0.fashionSkins) do
			local var_16_10 = arg_16_0.styleContainer:GetChild(iter_16_4 - 1)
			local var_16_11 = arg_16_0.fashionCellMap[var_16_10]
			local var_16_12 = arg_16_0:GetShipVO():getRemouldSkinId() == iter_16_5.id and arg_16_0:GetShipVO():isRemoulded()
			local var_16_13 = arg_16_0:GetShipVO():proposeSkinOwned(iter_16_5) or table.contains(arg_16_0.skinList, iter_16_5.id) or var_16_12 or iter_16_5.skin_type == ShipSkin.SKIN_TYPE_OLD or getProxy(ShipSkinProxy):hasSkin(iter_16_5.id)

			var_16_11:updateData(arg_16_0:GetShipVO(), iter_16_5, var_16_13)
		end
	end

	arg_16_0.fashionSkinId = arg_16_0:GetShipVO():getSkinId()

	local var_16_14 = arg_16_0.styleContainer:GetChild(0)

	for iter_16_6, iter_16_7 in ipairs(arg_16_0.fashionSkins) do
		if iter_16_7.id == arg_16_0.fashionSkinId then
			var_16_14 = arg_16_0.styleContainer:GetChild(iter_16_6 - 1)

			break
		end
	end

	if arg_16_0._lastSelectCard then
		var_16_14 = arg_16_0.styleContainer:GetChild(arg_16_0._lastSelectCard - 1)
		arg_16_0._lastSelectCard = nil
	end

	triggerButton(var_16_14)
end

function var_0_0.clickCell(arg_19_0, arg_19_1, arg_19_2)
	if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION then
		return
	end

	arg_19_0.clickCellTime = Time.realtimeSinceStartup
	arg_19_0.fashionSkinId = arg_19_2.id

	arg_19_0:UpdateFashionDetail(arg_19_2)
	arg_19_0:emit(ShipViewConst.LOAD_PAINTING, arg_19_2.painting)
	arg_19_0:emit(ShipViewConst.LOAD_PAINTING_BG, arg_19_0:GetShipVO():rarity2bgPrintForGet(), arg_19_0:GetShipVO():isBluePrintShip(), arg_19_0:GetShipVO():isMetaShip())

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.fashionSkins) do
		local var_19_0 = arg_19_0.styleContainer:GetChild(iter_19_0 - 1)
		local var_19_1 = arg_19_0.fashionCellMap[var_19_0]

		var_19_1:updateSelected(iter_19_1.id == arg_19_0.fashionSkinId)
		var_19_1:updateUsing(arg_19_0:GetShipVO():useSkin(iter_19_1.id))
	end

	local var_19_2 = arg_19_2.painting
	local var_19_3 = checkABExist("painting/" .. var_19_2 .. "_n")

	setActive(arg_19_0.hideObjToggle, var_19_3)

	if var_19_3 then
		arg_19_0.hideObjToggle.isOn = PlayerPrefs.GetInt("paint_hide_other_obj_" .. var_19_2, 0) ~= 0

		onToggle(arg_19_0, arg_19_0.hideObjToggleTF, function(arg_20_0)
			PlayerPrefs.SetInt("paint_hide_other_obj_" .. var_19_2, arg_20_0 and 1 or 0)
			arg_19_1:flushSkin()
			arg_19_0:emit(ShipViewConst.LOAD_PAINTING, var_19_2, true)
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateFashion(arg_21_0, arg_21_1)
	if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION or not arg_21_0.shareData:HasFashion() then
		return
	end

	arg_21_0:UpdateAllFashion(arg_21_1)
end

function var_0_0.ResetFashion(arg_22_0)
	arg_22_0.fashionSkinId = 0
end

function var_0_0.UpdateFashionDetail(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.fashionDetailWrapper

	if not var_23_0 then
		var_23_0 = {
			name = findTF(arg_23_0.stylePanel, "style_desc/name_bg/name"),
			descTxt = findTF(arg_23_0.stylePanel, "style_desc/desc_frame/desc/Text"),
			character = findTF(arg_23_0.stylePanel, "style_desc/character"),
			confirm = findTF(arg_23_0.stylePanel, "confirm_button"),
			cancel = findTF(arg_23_0.stylePanel, "cancel_button")
		}
		var_23_0.diamond = findTF(var_23_0.confirm, "diamond")
		var_23_0.using = findTF(var_23_0.confirm, "using")
		var_23_0.experience = findTF(var_23_0.confirm, "experience")
		var_23_0.change = findTF(var_23_0.confirm, "change")
		var_23_0.buy = findTF(var_23_0.confirm, "buy")
		var_23_0.activity = findTF(var_23_0.confirm, "activity")
		var_23_0.cantbuy = findTF(var_23_0.confirm, "cantbuy")
		var_23_0.prefab = "unknown"
		arg_23_0.fashionDetailWrapper = var_23_0
	end

	setText(var_23_0.name, arg_23_1.name)
	setText(var_23_0.descTxt, SwitchSpecialChar(arg_23_1.desc, true))

	local var_23_1 = var_23_0.descTxt:GetComponent(typeof(Text))

	if #var_23_1.text > 50 then
		var_23_1.alignment = TextAnchor.MiddleLeft
	else
		var_23_1.alignment = TextAnchor.MiddleCenter
	end

	if var_23_0.prefab ~= arg_23_1.prefab then
		local var_23_2 = var_23_0.character:Find(var_23_0.prefab)

		if not IsNil(var_23_2) then
			PoolMgr.GetInstance():ReturnSpineChar(var_23_0.prefab, var_23_2.gameObject)
		end

		var_23_0.prefab = arg_23_1.prefab

		local var_23_3 = var_23_0.prefab

		arg_23_0.spineChar = SpineAnimChar.New()

		arg_23_0.spineChar:SetPaint(var_23_3)
		arg_23_0.spineChar:Load(true, function(arg_24_0)
			if var_23_0.prefab ~= var_23_3 then
				arg_24_0:Dispose()
			else
				arg_24_0:SetName(var_23_3)
				arg_24_0:SetLocalPosition(Vector3.zero)
				arg_24_0:SetLocalScale(Vector3(0.5, 0.5, 1))
				arg_24_0:SetParent(var_23_0.character)
				arg_24_0:SetAction(arg_23_1.show_skin or "stand", 0)
			end
		end)
	end

	local var_23_4 = arg_23_0:GetShipVO():getRemouldSkinId() == arg_23_1.id and arg_23_0:GetShipVO():isRemoulded()
	local var_23_5 = (arg_23_0:GetShipVO():proposeSkinOwned(arg_23_1) or table.contains(arg_23_0.skinList, arg_23_1.id) or var_23_4) and 1 or 0
	local var_23_6 = arg_23_1.shop_id > 0 and ShopConst.GetShopConfig(arg_23_1.shop_id) or nil
	local var_23_7 = var_23_6 and not pg.TimeMgr.GetInstance():inTime(var_23_6.time)
	local var_23_8 = arg_23_1.id == arg_23_0:GetShipVO():getSkinId()
	local var_23_9 = arg_23_1.id == arg_23_0:GetShipVO():getConfig("skin_id") or var_23_5 >= 1 or arg_23_1.skin_type == ShipSkin.SKIN_TYPE_OLD or getProxy(ShipSkinProxy):hasSkin(arg_23_1.id)
	local var_23_10 = getProxy(ShipSkinProxy):getSkinById(arg_23_1.id)
	local var_23_11 = getProxy(ShipSkinProxy):InForbiddenSkinListAndShow(arg_23_1.id)
	local var_23_12 = var_23_8 and var_23_10 and var_23_10:isExpireType()

	setActive(var_23_0.using, false)
	setActive(var_23_0.change, false)
	setActive(var_23_0.buy, false)
	setActive(var_23_0.experience, false)

	if var_23_12 then
		setGray(var_23_0.confirm, false)
		setActive(var_23_0.experience, true)
	elseif var_23_8 then
		setGray(var_23_0.confirm, false)
		setActive(var_23_0.using, true)
	elseif var_23_9 and ShipSkin.IsShareSkin(arg_23_0:GetShipVO(), arg_23_1.id) and not ShipSkin.CanUseShareSkinForShip(arg_23_0:GetShipVO(), arg_23_1.id) then
		setActive(var_23_0.change, true)
		setGray(var_23_0.confirm, true)
	elseif var_23_9 then
		setActive(var_23_0.change, true)
		setGray(var_23_0.confirm, false)
	elseif var_23_6 then
		setActive(var_23_0.buy, true)
		setGray(var_23_0.confirm, var_23_7 or var_23_11)
	else
		setActive(var_23_0.change, true)
		setGray(var_23_0.confirm, true)
	end

	onButton(arg_23_0, var_23_0.confirm, function()
		if var_23_8 then
			if ShipSkin.IsChangeSkin(arg_23_1.id) then
				if arg_23_0.clickCellTime and Time.realtimeSinceStartup - arg_23_0.clickCellTime <= 0.35 then
					return
				end

				arg_23_0:SilentTriggerToggleFalse()
				arg_23_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.DETAIL)
			end
		elseif var_23_9 then
			if ShipSkin.IsShareSkin(arg_23_0:GetShipVO(), arg_23_1.id) and not ShipSkin.CanUseShareSkinForShip(arg_23_0:GetShipVO(), arg_23_1.id) then
				-- block empty
			else
				arg_23_0:emit(ShipMainMediator.CHANGE_SKIN, arg_23_0:GetShipVO().id, arg_23_1.id == arg_23_0:GetShipVO():getConfig("skin_id") and 0 or arg_23_1.id)
			end
		elseif var_23_6 then
			if var_23_7 or var_23_11 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
			else
				local var_25_0 = Goods.Create({
					shop_id = var_23_6.id
				}, Goods.TYPE_SKIN)

				if var_25_0:isDisCount() and var_25_0:IsItemDiscountType() then
					arg_23_0:emit(ShipMainMediator.BUY_ITEM_BY_ACT, var_23_6.id, 1)
				else
					local var_25_1 = var_25_0:GetPrice()
					local var_25_2 = i18n("text_buy_fashion_tip", var_25_1, arg_23_1.name)

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = var_25_2,
						onYes = function()
							arg_23_0:emit(ShipMainMediator.BUY_ITEM, var_23_6.id, 1)
						end
					})
				end
			end
		end
	end)
	onButton(arg_23_0, var_23_0.cancel, function()
		if arg_23_0.clickCellTime and Time.realtimeSinceStartup - arg_23_0.clickCellTime <= 0.35 then
			return
		end

		arg_23_0:SilentTriggerToggleFalse()
		arg_23_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.DETAIL)
	end)
end

function var_0_0.SilentTriggerToggleFalse(arg_28_0)
	arg_28_0.fashionGroup = false
	arg_28_0.isShareSkinFlag = false

	removeOnToggle(arg_28_0.shareBtn)
	triggerToggle(arg_28_0.shareBtn, false)
	arg_28_0:RegisterShareToggle()
end

function var_0_0.RegisterShareToggle(arg_29_0)
	onToggle(arg_29_0, arg_29_0.shareBtn, function(arg_30_0)
		arg_29_0.fashionGroup = false
		arg_29_0.isShareSkinFlag = arg_30_0

		arg_29_0:UpdateFashion()
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_31_0)
	setParent(arg_31_0.phantomBtn, arg_31_0._tf)

	if arg_31_0.fashionDetailWrapper then
		local var_31_0 = arg_31_0.fashionDetailWrapper

		if var_31_0.character:Find(var_31_0.prefab) and arg_31_0.spineChar then
			arg_31_0.spineChar:Dispose()

			arg_31_0.spineChar = nil
		end
	end

	arg_31_0.fashionDetailWrapper = nil

	for iter_31_0, iter_31_1 in pairs(arg_31_0.fashionCellMap) do
		iter_31_1:clear()
	end

	arg_31_0.fashionCellMap = {}
	arg_31_0.fashionSkins = {}
	arg_31_0.fashionGroup = 0
	arg_31_0.fashionSkinId = 0
	arg_31_0.shareData = nil
end

return var_0_0
