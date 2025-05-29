local var_0_0 = class("ChargeItemPanelLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	local var_1_0 = arg_1_0.contextData.panelConfig
	local var_1_1 = var_1_0.extraItems and var_1_0.extraItems or {}

	if arg_1_0:ExistSkinExperienceItem(var_1_1) then
		return "ChargeItem4SkinDiscountItemUI"
	else
		return "ChargeItemPanelUI"
	end
end

function var_0_0.init(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
	arg_2_0:initUIText()
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:updatePanel()
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.willExit(arg_4_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_4_0._tf)
end

function var_0_0.initData(arg_5_0)
	arg_5_0.panelConfig = arg_5_0.contextData.panelConfig
end

function var_0_0.initUIText(arg_6_0)
	local var_6_0 = arg_6_0:findTF("window/button_container/button_cancel/Image")
	local var_6_1 = arg_6_0:findTF("window/button_container/button_ok/Image")

	setText(var_6_0, i18n("text_cancel"))
	setText(var_6_1, i18n("text_buy"))
end

function var_0_0.findUI(arg_7_0)
	arg_7_0.bg = arg_7_0:findTF("back_sign")
	arg_7_0.detailWindow = arg_7_0:findTF("window")
	arg_7_0.cancelBtn = arg_7_0:findTF("button_container/button_cancel", arg_7_0.detailWindow)
	arg_7_0.confirmBtn = arg_7_0:findTF("button_container/button_ok", arg_7_0.detailWindow)
	arg_7_0.detailName = arg_7_0:findTF("goods/mask/name/Text", arg_7_0.detailWindow)
	arg_7_0.detailIcon = arg_7_0:findTF("goods/icon", arg_7_0.detailWindow)
	arg_7_0.detailExtraDrop = arg_7_0:findTF("goods/extra_drop", arg_7_0.detailWindow)
	arg_7_0.detailRmb = arg_7_0:findTF("prince_bg/contain/icon_rmb", arg_7_0.detailWindow)
	arg_7_0.detailGem = arg_7_0:findTF("prince_bg/contain/icon_gem", arg_7_0.detailWindow)
	arg_7_0.detailGold = arg_7_0:findTF("prince_bg/contain/icon_gold", arg_7_0.detailWindow)
	arg_7_0.detailPrice = arg_7_0:findTF("prince_bg/contain/Text", arg_7_0.detailWindow)
	arg_7_0.detailTag = arg_7_0:findTF("goods/tag", arg_7_0.detailWindow)
	arg_7_0.detailTags = {}

	table.insert(arg_7_0.detailTags, arg_7_0:findTF("hot", arg_7_0.detailTag))
	table.insert(arg_7_0.detailTags, arg_7_0:findTF("new", arg_7_0.detailTag))
	table.insert(arg_7_0.detailTags, arg_7_0:findTF("advice", arg_7_0.detailTag))
	table.insert(arg_7_0.detailTags, arg_7_0:findTF("double", arg_7_0.detailTag))
	table.insert(arg_7_0.detailTags, arg_7_0:findTF("discount", arg_7_0.detailTag))

	arg_7_0.detailTagAdviceTF = arg_7_0.detailTags[3]
	arg_7_0.detailTagDoubleTF = arg_7_0.detailTags[4]
	arg_7_0.detailContain = arg_7_0:findTF("container", arg_7_0.detailWindow)

	if arg_7_0.detailContain then
		arg_7_0.normal = arg_7_0:findTF("normal_items", arg_7_0.detailContain)
		arg_7_0.detailTip = arg_7_0:findTF("Text", arg_7_0.normal)
		arg_7_0.detailItem = arg_7_0:findTF("item_tpl", arg_7_0.normal)
		arg_7_0.extra = arg_7_0:findTF("items", arg_7_0.detailContain)
		arg_7_0.extraTip = arg_7_0:findTF("Text", arg_7_0.extra)
		arg_7_0.detailItemList = arg_7_0:findTF("scrollview/list", arg_7_0.extra)
		arg_7_0.extraDesc = arg_7_0:findTF("Text", arg_7_0.detailContain)
	end

	arg_7_0.detailNormalTip = arg_7_0:findTF("NormalTips", arg_7_0.detailWindow)
	arg_7_0.infoBtn = arg_7_0:findTF("prince_bg/info", arg_7_0.detailWindow)
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.bg, function()
		arg_8_0:closeView()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.cancelBtn, function()
		arg_8_0:closeView()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.confirmBtn, function()
		local function var_11_0()
			if arg_8_0.panelConfig.onYes then
				arg_8_0.panelConfig.onYes()
				arg_8_0:closeView()
			end
		end

		local var_11_1 = arg_8_0.panelConfig.limitArgs

		if var_11_1 and type(var_11_1) == "table" then
			local var_11_2 = var_11_1[1]

			if var_11_2 and type(var_11_2) == "table" and #var_11_2 >= 2 then
				local var_11_3 = var_11_2[1]
				local var_11_4 = var_11_2[2]
				local var_11_5 = getProxy(PlayerProxy):getRawData()

				if var_11_3 == "lv_70" and var_11_4 <= var_11_5.level then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("lv70_package_tip"),
						onYes = function()
							var_11_0()
						end
					})

					return
				end
			end
		end

		var_11_0()
	end, SFX_PANEL)
end

function var_0_0.updatePanel(arg_14_0)
	local var_14_0 = arg_14_0.panelConfig.icon
	local var_14_1 = arg_14_0.panelConfig.name and arg_14_0.panelConfig.name or ""
	local var_14_2 = arg_14_0.panelConfig.tipBonus or ""
	local var_14_3 = arg_14_0.panelConfig.bonusItem
	local var_14_4 = arg_14_0.panelConfig.tipExtra and arg_14_0.panelConfig.tipExtra or ""
	local var_14_5 = arg_14_0.panelConfig.extraItems and arg_14_0.panelConfig.extraItems or {}
	local var_14_6 = arg_14_0.panelConfig.price and arg_14_0.panelConfig.price or 0
	local var_14_7 = arg_14_0.panelConfig.isChargeType
	local var_14_8 = arg_14_0.panelConfig.isLocalPrice
	local var_14_9 = arg_14_0.panelConfig.isMonthCard
	local var_14_10 = arg_14_0.panelConfig.tagType
	local var_14_11 = arg_14_0.panelConfig.normalTip
	local var_14_12 = arg_14_0.panelConfig.extraDrop
	local var_14_13 = arg_14_0.panelConfig.isForceGold
	local var_14_14 = arg_14_0.panelConfig.infoTip and arg_14_0.panelConfig.infoTip or ""

	if arg_14_0.detailNormalTip then
		setActive(arg_14_0.detailNormalTip, var_14_11)
	end

	if arg_14_0.detailContain then
		setActive(arg_14_0.detailContain, not var_14_11)
	end

	if var_14_11 then
		if arg_14_0.detailNormalTip:GetComponent("Text") then
			setText(arg_14_0.detailNormalTip, var_14_11)
		else
			setButtonText(arg_14_0.detailNormalTip, var_14_11)
		end
	end

	setActive(arg_14_0.detailTag, var_14_10 > 0)

	if var_14_10 > 0 then
		for iter_14_0, iter_14_1 in ipairs(arg_14_0.detailTags) do
			setActive(iter_14_1, iter_14_0 == var_14_10)
		end
	end

	GetImageSpriteFromAtlasAsync(var_14_0, "", arg_14_0.detailIcon, false)
	setScrollText(arg_14_0.detailName, var_14_1)

	if arg_14_0.detailExtraDrop then
		setActive(arg_14_0.detailExtraDrop, var_14_12)

		if var_14_12 then
			setText(arg_14_0:findTF("Text", arg_14_0.detailExtraDrop), i18n("battlepass_pay_acquire") .. "\n" .. var_14_12.count .. "x")
			updateDrop(arg_14_0:findTF("item/IconTpl", arg_14_0.detailExtraDrop), setmetatable({
				count = 1
			}, {
				__index = var_14_12
			}))
		end
	end

	if PLATFORM_CODE == PLATFORM_CHT then
		setActive(arg_14_0.detailRmb, var_14_7 and not var_14_8)
	else
		setActive(arg_14_0.detailRmb, var_14_7)
	end

	setActive(arg_14_0.detailGem, not var_14_7 and not var_14_13)
	setActive(arg_14_0.detailGold, not var_14_7 and not isActive(arg_14_0.detailRmb) and not isActive(arg_14_0.detailGem))
	setText(arg_14_0.detailPrice, var_14_6)

	if arg_14_0.extraDesc ~= nil then
		local var_14_15 = arg_14_0.panelConfig.descExtra or ""

		setActive(arg_14_0.extraDesc, #var_14_15 > 0)
		setText(arg_14_0.extraDesc, var_14_15)
	end

	if arg_14_0.detailContain then
		setActive(arg_14_0.normal, var_14_9)

		if var_14_9 then
			updateDrop(arg_14_0.detailItem, var_14_3)
			onButton(arg_14_0, arg_14_0.detailItem, function()
				return
			end, SFX_PANEL)

			local var_14_16, var_14_17 = contentWrap(var_14_3:getConfig("name"), 10, 2)

			if var_14_16 then
				var_14_17 = var_14_17 .. "..."
			end

			setText(arg_14_0:findTF("name", arg_14_0.detailItem), var_14_17)
			setText(arg_14_0.detailTip, var_14_2)
		end

		setText(arg_14_0.extraTip, var_14_4)

		if arg_14_0:ExistSkinExperienceItem(var_14_5) then
			arg_14_0:UpdateSkinDiscountItemItems(var_14_5)
		else
			arg_14_0:UpdateItems(var_14_5)
		end
	end

	local var_14_18 = var_14_14 ~= ""

	setActive(arg_14_0.infoBtn, var_14_18)

	if var_14_18 then
		onButton(arg_14_0, arg_14_0.infoBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip[var_14_14].tip
			})
		end, SFX_PANEL)
	else
		removeOnButton(arg_14_0.infoBtn)
	end
end

function var_0_0.UpdateItems(arg_17_0, arg_17_1)
	for iter_17_0 = #arg_17_1, arg_17_0.detailItemList.childCount - 1 do
		Destroy(arg_17_0.detailItemList:GetChild(iter_17_0))
	end

	for iter_17_1 = arg_17_0.detailItemList.childCount, #arg_17_1 - 1 do
		cloneTplTo(arg_17_0.detailItem, arg_17_0.detailItemList)
	end

	for iter_17_2 = 1, #arg_17_1 do
		local var_17_0 = arg_17_0.detailItemList:GetChild(iter_17_2 - 1)

		updateDrop(var_17_0, arg_17_1[iter_17_2])

		local var_17_1, var_17_2 = contentWrap(arg_17_1[iter_17_2]:getConfig("name"), 8, 2)

		if var_17_1 then
			var_17_2 = var_17_2 .. "..."
		end

		setText(arg_17_0:findTF("name", var_17_0), var_17_2)
		onButton(arg_17_0, var_17_0, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = arg_17_1[iter_17_2]
			})
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateSkinDiscountItemItems(arg_19_0, arg_19_1)
	local var_19_0, var_19_1 = arg_19_0:SplitItemAndSkinExperienceItem(arg_19_1)

	arg_19_0:UpdateItems(var_19_0)

	local var_19_2 = UIItemList.New(arg_19_0:findTF("window/container/bonus_gift/bg/scrollview/list"), arg_19_0:findTF("window/container/normal_items/item_tpl"))

	var_19_2:make(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == UIItemList.EventUpdate then
			arg_19_0:UpdateItem(var_19_1[arg_20_1 + 1], arg_20_2)
		end
	end)
	var_19_2:align(#var_19_1)
	setText(arg_19_0:findTF("window/container/bonus_gift/bg/Text"), i18n("skin_discount_item_return_tip"))
	setText(arg_19_0:findTF("window/container/bonus_gift/bg/label"), i18n("skin_discount_item_extra_bounds"))
end

function var_0_0.UpdateItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = Drop.Create({
		DROP_TYPE_ITEM,
		arg_21_1.id,
		arg_21_1.count
	})

	updateDrop(arg_21_2, var_21_0)
	setText(arg_21_0:findTF("name", arg_21_2), shortenString(var_21_0:getName(), 4))
	onButton(arg_21_0, arg_21_2, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = var_21_0
		})
	end, SFX_PANEL)
end

function var_0_0.SplitItemAndSkinExperienceItem(arg_23_0, arg_23_1)
	local var_23_0 = {}
	local var_23_1 = {}

	for iter_23_0, iter_23_1 in ipairs(arg_23_1) do
		if var_0_0.IsSkinExperienceItem(iter_23_1) then
			table.insert(var_23_1, iter_23_1)
		else
			table.insert(var_23_0, iter_23_1)
		end
	end

	return var_23_0, var_23_1
end

function var_0_0.IsSkinExperienceItem(arg_24_0)
	local var_24_0

	if not isa(arg_24_0, Drop) then
		arg_24_0 = Drop.New(arg_24_0)
	end

	local var_24_1 = arg_24_0:getConfigTable()

	return var_24_1 and var_24_1.usage == ItemUsage.USAGE_SKIN_EXP
end

function var_0_0.ExistSkinExperienceItem(arg_25_0, arg_25_1)
	return _.any(arg_25_1, function(arg_26_0)
		return var_0_0.IsSkinExperienceItem(arg_26_0)
	end)
end

return var_0_0
