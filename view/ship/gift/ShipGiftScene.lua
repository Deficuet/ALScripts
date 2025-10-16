local var_0_0 = class("ShipGiftScene", import("view.base.BaseUI"))
local var_0_1 = 0.3
local var_0_2 = 3

function var_0_0.getUIName(arg_1_0)
	return "ShipGiftUI"
end

function var_0_0.ResUISettings(arg_2_0)
	return true
end

function var_0_0.init(arg_3_0)
	arg_3_0.adapt = arg_3_0._tf:Find("adapt")
	arg_3_0.topPanel = arg_3_0._tf:Find("adapt/top")
	arg_3_0.backBtn = arg_3_0._tf:Find("adapt/top/back_btn")
	arg_3_0.homeBtn = arg_3_0._tf:Find("adapt/top/option")
	arg_3_0.bgTf = arg_3_0._tf:Find("bgGo")
	arg_3_0.imageGrass = arg_3_0._tf:Find("bgGo/ImageGrass")
	arg_3_0.character = arg_3_0._tf:Find("adapt/content")
	arg_3_0.chat = arg_3_0._tf:Find("adapt/content/chat")
	arg_3_0.chatBg = arg_3_0._tf:Find("adapt/content/chat/chatbgtop")
	arg_3_0.chatText = arg_3_0._tf:Find("adapt/content/chat/Text")
	rtf(arg_3_0.chat).localScale = Vector3.New(0, 0, 1)
	arg_3_0.initChatBgH = arg_3_0.chatBg.sizeDelta.y
	arg_3_0.initChatTextH = arg_3_0.chatText.sizeDelta.y
	arg_3_0.initfontSize = arg_3_0.chatText:GetComponent(typeof(Text)).fontSize
	arg_3_0.namePanel = arg_3_0._tf:Find("adapt/name")
	arg_3_0.shipName = arg_3_0._tf:Find("adapt/name/nameRect/name_mask/Text")
	arg_3_0.shipNameEn = arg_3_0._tf:Find("adapt/name/english_name")
	arg_3_0.starts = arg_3_0._tf:Find("adapt/name/stars")
	arg_3_0.shipInfoStarTpl = arg_3_0._tf:Find("adapt/name/star_tpl")
	arg_3_0.shipType = arg_3_0._tf:Find("adapt/name/type")
	arg_3_0.intimacyIcon = arg_3_0._tf:Find("adapt/intimacy/icon")
	arg_3_0.intimacyValueText = arg_3_0._tf:Find("adapt/intimacy/value")
	arg_3_0.intimacyAddValueText = GetComponent(arg_3_0._tf:Find("adapt/intimacy/addValue"), typeof(RectTransform))
	arg_3_0.painting = arg_3_0.adapt:Find("content/paint/fitter")
	arg_3_0.l2dParent = arg_3_0.adapt:Find("content/paint/live2d")
	arg_3_0.spineParent = arg_3_0.adapt:Find("content/paint/spinePainting")
	arg_3_0.effectParent = arg_3_0.adapt:Find("content/paint/effect")
	arg_3_0.intimacyAddValuePos = arg_3_0.intimacyAddValueText.localPosition
	arg_3_0.rightPanel = arg_3_0._tf:Find("adapt/right")
	arg_3_0.scrollRect = GetComponent(arg_3_0._tf:Find("adapt/right/scrollRect"), "LScrollRect")
	arg_3_0.giftBtn = arg_3_0._tf:Find("adapt/right/giftBtn")

	setText(arg_3_0._tf:Find("adapt/right/titlePanel/title/text"), i18n("ship_gift"))
	setText(arg_3_0.giftBtn:Find("label"), i18n("ship_gift2"))
	setActive(arg_3_0.intimacyAddValueText, false)

	arg_3_0.giftItemList = {}
	arg_3_0.anim = arg_3_0._tf:GetComponent(typeof(Animation))
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0._tf:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_5_0)
		arg_4_0:closeView()
	end)
	onButton(arg_4_0, arg_4_0.backBtn, function()
		arg_4_0.anim:Play("anim_ShipGiftUI_out")
	end, SFX_CANEL)
	onButton(arg_4_0, arg_4_0.homeBtn, function()
		arg_4_0:emit(var_0_0.ON_HOME)
	end, SFX_CANEL)
	onButton(arg_4_0, arg_4_0.giftBtn, function()
		if arg_4_0.selectIndex == nil then
			pg.TipsMgr.GetInstance():ShowTips(i18n("shipyard_gift_non_existent"))

			return
		end

		local var_8_0 = ShipGiftTools.GetShipNeedIntimacyValue(arg_4_0.shipVO)

		if var_8_0 == 0 then
			if arg_4_0.shipVO.propose then
				pg.TipsMgr.GetInstance():ShowTips(i18n("shipyard_favorability_max"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("shipyard_favorability_threshold"))
			end

			return
		end

		if arg_4_0.selectCnt == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("shipyard_gift_non_existent"))

			return
		end

		local var_8_1 = arg_4_0.selectCnt
		local var_8_2 = arg_4_0.giftList[arg_4_0.selectIndex + 1]
		local var_8_3 = var_8_2.id
		local var_8_4 = ShipGiftTools.GetItemIntimacyValue(arg_4_0.shipVO, var_8_2) * var_8_1 - var_8_0

		if var_8_4 > 0 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("shipyard_favorability_exceed", math.floor(var_8_4 / 100)),
				onYes = function()
					arg_4_0:emit(ShipGiftMediator.SHIP_GIFT, var_8_3, var_8_1, arg_4_0.shipVO.id)
				end
			})
		else
			arg_4_0:emit(ShipGiftMediator.SHIP_GIFT, var_8_3, var_8_1, arg_4_0.shipVO.id)
		end
	end, SFX_PANEL)

	arg_4_0.scrollRect.onInitItem = handler(arg_4_0, arg_4_0.ScrollInit)
	arg_4_0.scrollRect.onUpdateItem = handler(arg_4_0, arg_4_0.ScrollUpdate)
	arg_4_0.scrollRect.onReturnItem = handler(arg_4_0, arg_4_0.ScrollReturn)

	local var_4_0 = arg_4_0.contextData.shipID

	arg_4_0.shipVO = getProxy(BayProxy):getShipById(var_4_0)
	arg_4_0.giftList = ShipGiftTools.GetGiftList(arg_4_0.shipVO)
	arg_4_0.shipLoadClass = ShipLoad.New(function(arg_10_0)
		setParent(arg_10_0.transform, arg_4_0.painting)
	end)

	arg_4_0.shipLoadClass:LoadShip(var_4_0)
	arg_4_0:updatePreference()
	arg_4_0:RefreshUI()
	arg_4_0:OverlayPanel(arg_4_0.bgTf, {
		pbList = {
			arg_4_0.imageGrass
		}
	})
	arg_4_0:OverlayPanel(arg_4_0.adapt)

	arg_4_0.selectIndex = nil
	arg_4_0.eventList = {
		arg_4_0:bind(ShipGiftItem.SELECT_ITEM, handler(arg_4_0, arg_4_0.OnSelectItem)),
		arg_4_0:bind(ShipGiftItem.REFRESH_USE_ITEM_CNT, handler(arg_4_0, arg_4_0.OnRefreshUseItemCnt))
	}
end

function var_0_0.willExit(arg_11_0)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.eventList) do
		arg_11_0:disconnect(iter_11_1)
	end

	arg_11_0.eventList = nil

	arg_11_0:StopWaitClickTimer()
	arg_11_0:StopAutoClickTimer()
	ClearLScrollrect(arg_11_0.scrollRect)

	for iter_11_2, iter_11_3 in pairs(arg_11_0.giftItemList) do
		iter_11_3:willExit()
	end

	arg_11_0.giftItemList = nil

	arg_11_0.shipLoadClass:Dispose()

	arg_11_0.shipLoadClass = nil

	arg_11_0:UnOverlayPanel(arg_11_0.bgTf, arg_11_0._tf)
	arg_11_0:UnOverlayPanel(arg_11_0.adapt, arg_11_0._tf)
end

function var_0_0.ScrollInit(arg_12_0, arg_12_1)
	arg_12_0.giftItemList[arg_12_1] = ShipGiftItem.New(arg_12_1, arg_12_0)
end

function var_0_0.ScrollUpdate(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.giftItemList[arg_13_2] or ShipGiftItem.New(arg_13_2, arg_13_0)
	local var_13_1 = arg_13_0.giftList[arg_13_1 + 1]

	var_13_0:didEnter(arg_13_0.shipVO, var_13_1, arg_13_1, arg_13_0.selectCnt, arg_13_0.selectIndex)
end

function var_0_0.ScrollReturn(arg_14_0, arg_14_1, arg_14_2)
	(arg_14_0.giftItemList[arg_14_2] or ShipGiftItem.New(arg_14_2, arg_14_0)):willExit()
end

function var_0_0.RefreshScroll(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.giftItemList) do
		iter_15_1:RefreshUI(arg_15_0.selectIndex, arg_15_0.selectCnt)
	end
end

function var_0_0.RefreshUI(arg_16_0)
	setImageSprite(arg_16_0.intimacyIcon, GetSpriteFromAtlas("energy", arg_16_0.shipVO:getIntimacyIcon()), true)

	local var_16_0, var_16_1 = arg_16_0.shipVO:getIntimacyDetail()

	setText(arg_16_0.intimacyValueText, var_16_1)
	arg_16_0.scrollRect:SetTotalCount(#arg_16_0.giftList)
end

function var_0_0.updatePreference(arg_17_0)
	local var_17_0 = arg_17_0.shipVO
	local var_17_1 = var_17_0:getConfigTable()
	local var_17_2 = arg_17_0.shipVO:getName()

	setScrollText(arg_17_0.shipName, var_17_2)
	setText(arg_17_0.shipNameEn, var_17_1.english_name)

	local var_17_3 = arg_17_0.starts

	removeAllChildren(var_17_3)

	local var_17_4 = var_17_0:getStar()
	local var_17_5 = var_17_0:getMaxStar()

	for iter_17_0 = 1, var_17_5 do
		local var_17_6 = cloneTplTo(arg_17_0.shipInfoStarTpl, var_17_3, "star_" .. iter_17_0)

		setActive(var_17_6:Find("star_tpl"), iter_17_0 <= var_17_4)
		setActive(var_17_6:Find("empty_star_tpl"), true)
	end

	local var_17_7 = GetSpriteFromAtlas("shiptype", var_17_0:getShipType())

	setImageSprite(arg_17_0.shipType, var_17_7, true)
end

function var_0_0.OnGiftSuccess(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.giftList[arg_18_0.selectIndex + 1]
	local var_18_1 = ShipGiftTools.GetItemFavoriteState(arg_18_0.shipVO, var_18_0)
	local var_18_2 = ""

	if var_18_1 == ShipGiftConst.GIFT_FAVORITE_STATE.HATE then
		arg_18_0:displayShipWord("gift_dislike", true)
		ShipExpressionHelper.SetExpression(arg_18_0.painting:GetChild(0), arg_18_0.shipVO:getPainting(), "gift_dislike")
	else
		arg_18_0:displayShipWord("gift_prefer", true)
		ShipExpressionHelper.SetExpression(arg_18_0.painting:GetChild(0), arg_18_0.shipVO:getPainting(), "gift_prefer")
	end

	local var_18_3 = (arg_18_0.selectCnt - arg_18_1) * ShipGiftTools.GetItemIntimacyValue(arg_18_0.shipVO, var_18_0)

	if var_18_3 > 0 then
		setText(arg_18_0.intimacyAddValueText, string.format("+%s", var_18_3 / 100))
		arg_18_0:PlayAddValueAnimation()
		setActive(arg_18_0.intimacyAddValueText, true)
	else
		setActive(arg_18_0.intimacyAddValueText, false)
	end

	arg_18_0:StopWaitClickTimer()

	arg_18_0.waitClickTimer = FrameTimer.New(function()
		if Input.anyKeyDown then
			arg_18_0:ClickBackGift()
		end
	end, 1, -1)

	arg_18_0.waitClickTimer:Start()
	arg_18_0:StopAutoClickTimer()

	arg_18_0.autoClickTimer = Timer.New(function()
		arg_18_0:ClickBackGift()
	end, 1.5, 1)

	arg_18_0.autoClickTimer:Start()

	if var_18_3 > 0 then
		arg_18_0:emit(ShipGiftMediator.ADD_SHIP_INTIMACY, arg_18_0.shipVO, var_18_3)
	end

	local var_18_4 = arg_18_0.contextData.shipID

	arg_18_0.shipVO = getProxy(BayProxy):getShipById(var_18_4)
	arg_18_0.giftList = ShipGiftTools.GetGiftList(arg_18_0.shipVO)
	arg_18_0.selectIndex = nil
	arg_18_0.selectCnt = 0

	arg_18_0:RefreshUI()
	arg_18_0.anim:Play("anim_ShipGiftUI_success")
end

function var_0_0.displayShipWord(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_2 or not arg_21_0.chatFlag then
		arg_21_0.chatFlag = true
		arg_21_0.chat.localScale = Vector3.zero

		setActive(arg_21_0.chat, true)

		local var_21_0 = arg_21_0.shipVO:getCVIntimacy()
		local var_21_1, var_21_2, var_21_3 = ShipWordHelper.GetWordAndCV(arg_21_0.shipVO:getSkinId(), arg_21_1, nil, nil, var_21_0)

		if var_21_3 == "" then
			if arg_21_1 == "gift_dislike" then
				var_21_3 = arg_21_0.shipVO:getName() .. i18n("gift_giving_dislike")
			else
				var_21_3 = arg_21_0.shipVO:getName() .. i18n("gift_giving_prefer")
			end
		end

		local var_21_4 = arg_21_0.chatText:GetComponent(typeof(Text))

		if PLATFORM_CODE ~= PLATFORM_US then
			setText(arg_21_0.chatText, SwitchSpecialChar(var_21_3))
		else
			var_21_4.fontSize = arg_21_0.initfontSize

			setTextEN(arg_21_0.chatText, var_21_3)

			while var_21_4.preferredHeight > arg_21_0.initChatTextH do
				var_21_4.fontSize = var_21_4.fontSize - 2

				setTextEN(arg_21_0.chatText, var_21_3)

				if var_21_4.fontSize < 20 then
					break
				end
			end
		end

		if #var_21_4.text > CHAT_POP_STR_LEN then
			var_21_4.alignment = TextAnchor.MiddleLeft
		else
			var_21_4.alignment = TextAnchor.MiddleCenter
		end

		local var_21_5 = var_21_4.preferredHeight + 120

		if var_21_5 > arg_21_0.initChatBgH then
			arg_21_0.chatBg.sizeDelta = Vector2.New(arg_21_0.chatBg.sizeDelta.x, var_21_5)
		else
			arg_21_0.chatBg.sizeDelta = Vector2.New(arg_21_0.chatBg.sizeDelta.x, arg_21_0.initChatBgH)
		end

		local var_21_6 = var_0_2

		local function var_21_7()
			if arg_21_0.chatFlag then
				if arg_21_0.chatani1Id then
					LeanTween.cancel(arg_21_0.chatani1Id)
				end

				if arg_21_0.chatani2Id then
					LeanTween.cancel(arg_21_0.chatani2Id)
				end
			end

			arg_21_0.chatani1Id = LeanTween.scale(rtf(arg_21_0.chat.gameObject), Vector3.New(1, 1, 1), var_0_1):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
				arg_21_0.chatani2Id = LeanTween.scale(rtf(arg_21_0.chat.gameObject), Vector3.New(0, 0, 1), var_0_1):setEase(LeanTweenType.easeInBack):setDelay(var_0_1 + var_21_6):setOnComplete(System.Action(function()
					arg_21_0.chatFlag = nil
				end)).uniqueId
			end)).uniqueId
		end

		if var_21_2 then
			arg_21_0:StopPreVoice()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_21_2, function(arg_25_0)
				if arg_25_0 then
					var_21_6 = arg_25_0:GetLength() * 0.001
				end

				var_21_7()
			end)

			arg_21_0.preVoiceContent = var_21_2
		else
			var_21_7()
		end
	end
end

function var_0_0.ShowPanel(arg_26_0)
	arg_26_0.anim:Play("anim_ShipGiftUI_success_re")
end

function var_0_0.PlayAddValueAnimation(arg_27_0)
	setActive(arg_27_0.intimacyAddValueText, true)

	arg_27_0.intimacyAddValueText.localPosition = Vector2(arg_27_0.intimacyAddValuePos.x, arg_27_0.intimacyAddValuePos.y)

	arg_27_0:managedTween(LeanTween.moveY, nil, arg_27_0.intimacyAddValueText, arg_27_0.intimacyAddValuePos.y + 20, 0.35):setOnComplete(System.Action(function()
		setActive(arg_27_0.intimacyAddValueText, false)
	end))
end

function var_0_0.ClickBackGift(arg_29_0)
	arg_29_0:StopWaitClickTimer()
	arg_29_0:StopAutoClickTimer()
	arg_29_0:ShowPanel()
	ShipExpressionHelper.SetExpression(arg_29_0.painting:GetChild(0), arg_29_0.shipVO:getPainting())
end

function var_0_0.StopWaitClickTimer(arg_30_0)
	if arg_30_0.waitClickTimer then
		arg_30_0.waitClickTimer:Stop()

		arg_30_0.waitClickTimer = nil
	end
end

function var_0_0.StopAutoClickTimer(arg_31_0)
	if arg_31_0.autoClickTimer then
		arg_31_0.autoClickTimer:Stop()

		arg_31_0.autoClickTimer = nil
	end
end

function var_0_0.OnSelectItem(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0.selectIndex = arg_32_2

	local var_32_0 = arg_32_0.giftList[arg_32_2 + 1]

	arg_32_0.selectCnt = ShipGiftTools.GetNeedMinCnt(arg_32_0.shipVO, var_32_0)

	arg_32_0:RefreshScroll()
end

function var_0_0.OnRefreshUseItemCnt(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0.selectCnt = arg_33_2
end

function var_0_0.onBackPressed(arg_34_0)
	if arg_34_0.waitClickTimer then
		arg_34_0:ClickBackGift()

		return
	end

	var_0_0.super.onBackPressed(arg_34_0)
end

return var_0_0
