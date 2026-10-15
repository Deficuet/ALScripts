local var_0_0 = class("AwardInfoLayer", import("..base.BaseUI"))

var_0_0.TITLE = {
	COMMANDER = "commander",
	RYZA = "ryza",
	ITEM = "item",
	SHIP = "ship",
	REVERT = "revert",
	ESCORT = "escort"
}

local var_0_1 = 0.15
local var_0_2 = 340
local var_0_3 = 564

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {
		"ui/item_duang5"
	}

	table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))

	return var_1_0
end

function var_0_0.getUIName(arg_2_0)
	return "AwardInfoUI"
end

function var_0_0.init(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)

	arg_3_0.awards = _.select(arg_3_0.contextData.items or {}, function(arg_4_0)
		return arg_4_0.type ~= DROP_TYPE_ICON_FRAME and arg_4_0.type ~= DROP_TYPE_CHAT_FRAME and arg_4_0.type ~= DROP_TYPE_LIVINGAREA_COVER
	end)
	arg_3_0._itemsWindow = arg_3_0._tf:Find("items")
	arg_3_0.spriteMask = arg_3_0._itemsWindow:Find("SpriteMask")
	arg_3_0.title = arg_3_0.contextData.title or var_0_0.TITLE.ITEM

	for iter_3_0, iter_3_1 in pairs(var_0_0.TITLE) do
		setActive(arg_3_0._itemsWindow:Find("titles/title_" .. iter_3_1), arg_3_0.title == iter_3_1)
	end

	if arg_3_0.title == var_0_0.TITLE.COMMANDER then
		eachChild(arg_3_0._itemsWindow:Find("titles/title_commander"), function(arg_5_0)
			setActive(arg_5_0, arg_5_0.name == arg_3_0.contextData.titleExtra)
		end)
	end

	local var_3_0 = {
		items_scroll = arg_3_0._itemsWindow:Find("items_scroll/content"),
		ships = arg_3_0._itemsWindow:Find("ships")
	}

	if arg_3_0.title == var_0_0.TITLE.SHIP then
		arg_3_0.container = var_3_0.ships
	else
		arg_3_0.container = var_3_0.items_scroll

		scrollTo(arg_3_0.container, nil, 1)

		arg_3_0.windowLayout = arg_3_0._itemsWindow:Find("items_scroll"):GetComponent(typeof(LayoutElement))
	end

	GetOrAddComponent(arg_3_0.container, "CanvasGroup").alpha = 1

	for iter_3_2, iter_3_3 in pairs(var_3_0) do
		setActive(arg_3_0._itemsWindow:Find(iter_3_2), arg_3_0.container == iter_3_3)
	end

	setLocalScale(arg_3_0._itemsWindow, Vector3(0.5, 0.5, 0.5))

	arg_3_0.itemTpl = arg_3_0._itemsWindow:Find("item_tpl")
	arg_3_0.shipTpl = arg_3_0._itemsWindow:Find("ship_tpl")
	arg_3_0.extraBouns = arg_3_0._itemsWindow:Find("titles/extra_bouns")

	setActive(arg_3_0.extraBouns, arg_3_0.contextData.extraBonus)

	arg_3_0.continueBtn = arg_3_0._tf:Find("items/close")

	local var_3_1 = arg_3_0._tf:Find("decorations")

	if arg_3_0.title == var_0_0.TITLE.SHIP then
		setLocalScale(var_3_1, Vector3.New(1.25, 1.25, 1))
	else
		setLocalScale(var_3_1, Vector3.one)
	end

	arg_3_0.blinks = {}
	arg_3_0.tweenItems = {}
	arg_3_0.shipCardTpl = arg_3_0._tf:Find("ShipCardTpl")

	arg_3_0._tf:SetAsLastSibling()

	arg_3_0.metaRepeatAwardTF = arg_3_0._tf:Find("MetaShipRepeatAward")
end

function var_0_0.doAnim(arg_6_0, arg_6_1)
	LeanTween.scale(rtf(arg_6_0._itemsWindow), Vector3(1, 1, 1), 0.15):setEase(LeanTweenType.linear):setOnComplete(System.Action(function()
		if arg_6_0.exited then
			return
		end

		arg_6_1()
	end))
end

function var_0_0.playAnim(arg_8_0, arg_8_1)
	local var_8_0 = {}

	for iter_8_0 = 1, #arg_8_0.awards do
		table.insert(var_8_0, function(arg_9_0)
			setActive(arg_8_0.container:GetChild(iter_8_0 - 1), true)

			if arg_8_0.windowLayout then
				if iter_8_0 > 5 and arg_8_0.windowLayout.preferredHeight ~= var_0_3 then
					arg_8_0.windowLayout.preferredHeight = var_0_3

					arg_8_0:updateSpriteMaskScale()
				end

				if iter_8_0 % 5 == 1 then
					scrollTo(arg_8_0.container, nil, 0)
				end
			end

			arg_8_0.tweeningId = LeanTween.delayedCall(var_0_1, System.Action(arg_9_0)).uniqueId
		end)
	end

	seriesAsync(var_8_0, function()
		arg_8_0.tweeningId = nil

		if arg_8_1 then
			arg_8_1()
		end
	end)
end

function var_0_0.didEnter(arg_11_0)
	setActive(arg_11_0.spriteMask, true)
	onButton(arg_11_0, arg_11_0._tf, function()
		local function var_12_0()
			if arg_11_0.tweeningId then
				LeanTween.cancel(arg_11_0.tweeningId)

				arg_11_0.tweeningId = nil
			end

			arg_11_0:emit(var_0_0.ON_CLOSE)
		end

		arg_11_0:checkPaintingRes(var_12_0)
	end, SFX_CANCEL, {
		noShip = not arg_11_0.hasShip
	})
	onButton(arg_11_0, arg_11_0.continueBtn, function()
		triggerButton(arg_11_0._tf)
	end)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_GETITEM)

	local var_11_0 = {}

	table.insert(var_11_0, function(arg_15_0)
		arg_11_0:doAnim(arg_15_0)
	end)
	arg_11_0:displayAwards()

	if arg_11_0.contextData.animation then
		eachChild(arg_11_0.container, function(arg_16_0)
			setActive(arg_16_0, false)
		end)

		GetOrAddComponent(arg_11_0.container, "CanvasGroup").alpha = 0

		table.insert(var_11_0, function(arg_17_0)
			GetOrAddComponent(arg_11_0.container, "CanvasGroup").alpha = 1

			arg_11_0:playAnim(arg_17_0)
		end)
	end

	if arg_11_0.windowLayout then
		arg_11_0.windowLayout.preferredHeight = not arg_11_0.contextData.animation and #arg_11_0.awards > 5 and var_0_3 or var_0_2

		arg_11_0:updateSpriteMaskScale()
	end

	seriesAsync(var_11_0, function()
		if arg_11_0.exited then
			return
		end

		if arg_11_0.contextData.closeOnCompleted then
			triggerButton(arg_11_0._tf)
		end

		if arg_11_0.enterCallback then
			arg_11_0.enterCallback()

			arg_11_0.enterCallback = nil
		end
	end)

	if arg_11_0.contextData.auto then
		arg_11_0:AddCloseTimer()
	end
end

function var_0_0.RemoveCloseTimer(arg_19_0)
	if arg_19_0.closeTimer then
		arg_19_0.closeTimer:Stop()

		arg_19_0.closeTimer = nil
	end
end

function var_0_0.AddCloseTimer(arg_20_0)
	arg_20_0:RemoveCloseTimer()

	arg_20_0.closeTimer = Timer.New(function()
		arg_20_0:RemoveCloseTimer()
		triggerButton(arg_20_0._tf)
	end, arg_20_0.contextData.auto or 2, 1)

	arg_20_0.closeTimer:Start()
end

function var_0_0.onUIAnimEnd(arg_22_0, arg_22_1)
	arg_22_0.enterCallback = arg_22_1
end

function var_0_0.onBackPressed(arg_23_0)
	if LeanTween.isTweening(go(arg_23_0._itemsWindow)) then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(arg_23_0._tf)
end

local function var_0_4(arg_24_0, arg_24_1)
	local var_24_0 = pg.ship_data_statistics[arg_24_1.id]
	local var_24_1 = Ship.New({
		configId = arg_24_1.id
	})

	var_24_1.virgin = arg_24_1.virgin

	setScrollText(findTF(arg_24_0, "content/info/name_mask/name"), var_24_1:GetColorName())
	flushShipCard(arg_24_0, var_24_1)

	local var_24_2 = findTF(arg_24_0, "content/front/new")

	setActive(var_24_2, arg_24_1.virgin)
end

function var_0_0.displayAwards(arg_25_0)
	assert(#arg_25_0.awards ~= 0, "items数量不能为0")
	removeAllChildren(arg_25_0.container)

	for iter_25_0 = 1, #arg_25_0.awards do
		if arg_25_0.title ~= var_0_0.TITLE.SHIP then
			cloneTplTo(arg_25_0.itemTpl, arg_25_0.container)
		else
			local var_25_0 = cloneTplTo(arg_25_0.shipTpl, arg_25_0.container)

			setActive(cloneTplTo(arg_25_0.shipCardTpl, var_25_0, "ship_tpl"), true)
		end
	end

	if arg_25_0.title ~= var_0_0.TITLE.SHIP then
		for iter_25_1 = 1, #arg_25_0.awards do
			local var_25_1 = arg_25_0.container:GetChild(iter_25_1 - 1):Find("bg")
			local var_25_2 = arg_25_0.awards[iter_25_1]

			if var_25_2.type == DROP_TYPE_SHIP then
				arg_25_0.hasShip = true
			end

			updateDrop(var_25_1, var_25_2, {
				fromAwardLayer = true
			})
			setActive(findTF(var_25_1, "icon_bg/bonus"), var_25_2.riraty)
			setActive(findTF(var_25_1, "icon_bg/bonus_catchup"), var_25_2.catchupTag)
			setActive(findTF(var_25_1, "icon_bg/bonus_event"), var_25_2.catchupActTag)

			local var_25_3 = findTF(var_25_1, "name")
			local var_25_4 = findTF(var_25_1, "name_mask")

			setActive(var_25_3, false)
			setActive(var_25_4, true)
			setScrollText(findTF(var_25_1, "name_mask/name"), var_25_2.name or getText(var_25_3))
			onButton(arg_25_0, var_25_1, function()
				if arg_25_0.tweeningId then
					return
				end

				arg_25_0:emit(AwardInfoMediator.ON_DROP, var_25_2)
			end, SFX_PANEL)
		end
	else
		for iter_25_2 = 1, #arg_25_0.awards do
			local var_25_5 = arg_25_0.container:GetChild(iter_25_2 - 1):Find("ship_tpl")
			local var_25_6 = arg_25_0.awards[iter_25_2]

			var_0_4(var_25_5, var_25_6)

			local var_25_7 = var_25_6.reMetaSpecialItemVO

			if var_25_7 then
				local var_25_8 = cloneTplTo(arg_25_0.metaRepeatAwardTF, var_25_5)

				setLocalPosition(var_25_8, Vector3.zero)
				setLocalScale(var_25_8, Vector3.zero)

				local var_25_9 = var_25_8:Find("item_tpl/bg")

				updateDrop(var_25_9, var_25_7)
				setActive(var_25_9:Find("name"), false)
				setActive(var_25_9:Find("name_mask"), true)
				var_25_9:Find("name_mask/name"):GetComponent("ScrollText"):SetText(var_25_7.cfg.name)

				local function var_25_10()
					arg_25_0:managedTween(LeanTween.value, nil, go(var_25_8), 0, 1, 0.3):setOnUpdate(System.Action_float(function(arg_28_0)
						setLocalScale(var_25_8, {
							x = arg_28_0,
							y = arg_28_0
						})
					end)):setOnComplete(System.Action(function()
						setLocalScale(var_25_8, Vector3.one)
					end))
				end

				arg_25_0:managedTween(LeanTween.delayedCall, var_25_10, 0.3, nil)
			end

			if #arg_25_0.awards > 5 then
				if iter_25_2 <= 5 then
					var_25_5.anchoredPosition = Vector2.New(-50, 0)
				else
					var_25_5.anchoredPosition = Vector2.New(50, 0)
				end
			end
		end
	end
end

function var_0_0.ShowOrHideSpriteMask(arg_30_0, arg_30_1)
	if isActive(arg_30_0.spriteMask) == arg_30_1 then
		return
	end

	setActive(arg_30_0.spriteMask, arg_30_1)
end

function var_0_0.willExit(arg_31_0)
	arg_31_0:RemoveCloseTimer()
	setActive(arg_31_0.spriteMask, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_31_0._tf)

	if arg_31_0.title ~= var_0_0.TITLE.SHIP then
		for iter_31_0 = 0, arg_31_0.container.childCount - 1 do
			clearDrop(arg_31_0.container:GetChild(iter_31_0):Find("bg"))
		end
	end

	if arg_31_0.blinks and #arg_31_0.blinks > 0 then
		for iter_31_1, iter_31_2 in pairs(arg_31_0.blinks) do
			if not IsNil(iter_31_2) then
				Destroy(iter_31_2)
			end
		end
	end

	if arg_31_0.contextData.removeFunc then
		arg_31_0.contextData.removeFunc()

		arg_31_0.contextData.removeFunc = nil
	end
end

function var_0_0.updateSpriteMaskScale(arg_32_0)
	onNextTick(function()
		if arg_32_0.exited then
			return
		end

		setLocalScale(arg_32_0.spriteMask, Vector3(arg_32_0.spriteMask.rect.width / WHITE_DOT_SIZE * PIXEL_PER_UNIT, arg_32_0.spriteMask.rect.height / WHITE_DOT_SIZE * PIXEL_PER_UNIT, 1))
	end)
end

function var_0_0.checkPaintingRes(arg_34_0, arg_34_1)
	local var_34_0 = PaintingGroupConst.GetPaintingNameListForAwardList(arg_34_0.awards)
	local var_34_1 = {
		isShowBox = false,
		paintingNameList = var_34_0,
		finishFunc = arg_34_1
	}

	PaintingGroupConst.PaintingDownload(var_34_1)
end

return var_0_0
