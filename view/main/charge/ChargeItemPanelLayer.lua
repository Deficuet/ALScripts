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
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf)
end

function var_0_0.initData(arg_5_0)
	arg_5_0.panelConfig = arg_5_0.contextData.panelConfig
end

function var_0_0.initUIText(arg_6_0)
	local var_6_0 = arg_6_0._tf:Find("window/button_container/button_cancel/Image")
	local var_6_1 = arg_6_0._tf:Find("window/button_container/button_ok/Image")

	setText(var_6_0, i18n("text_cancel"))
	setText(var_6_1, i18n("text_buy"))
end

function var_0_0.findUI(arg_7_0)
	arg_7_0.bg = arg_7_0._tf:Find("back_sign")
	arg_7_0.detailWindow = arg_7_0._tf:Find("window")
	arg_7_0.cancelBtn = arg_7_0.detailWindow:Find("button_container/button_cancel")
	arg_7_0.confirmBtn = arg_7_0.detailWindow:Find("button_container/button_ok")
	arg_7_0.detailName = arg_7_0.detailWindow:Find("goods/mask/name/Text")
	arg_7_0.detailIcon = arg_7_0.detailWindow:Find("goods/icon")
	arg_7_0.detailExtraDrop = arg_7_0.detailWindow:Find("goods/extra_drop")
	arg_7_0.detailRmb = arg_7_0.detailWindow:Find("prince_bg/contain/icon_rmb")
	arg_7_0.detailGem = arg_7_0.detailWindow:Find("prince_bg/contain/icon_gem")
	arg_7_0.detailGold = arg_7_0.detailWindow:Find("prince_bg/contain/icon_gold")
	arg_7_0.detailPrice = arg_7_0.detailWindow:Find("prince_bg/contain/Text")
	arg_7_0.detailTag = arg_7_0.detailWindow:Find("goods/tag")
	arg_7_0.detailTags = {}

	table.insert(arg_7_0.detailTags, arg_7_0.detailTag:Find("hot"))
	table.insert(arg_7_0.detailTags, arg_7_0.detailTag:Find("new"))
	table.insert(arg_7_0.detailTags, arg_7_0.detailTag:Find("advice"))
	table.insert(arg_7_0.detailTags, arg_7_0.detailTag:Find("double"))
	table.insert(arg_7_0.detailTags, arg_7_0.detailTag:Find("discount"))

	arg_7_0.detailTagAdviceTF = arg_7_0.detailTags[3]
	arg_7_0.detailTagDoubleTF = arg_7_0.detailTags[4]
	arg_7_0.detailContain = arg_7_0.detailWindow:Find("container")

	if arg_7_0.detailContain then
		arg_7_0.normal = arg_7_0.detailContain:Find("normal_items")
		arg_7_0.detailTip = arg_7_0.normal:Find("Text")
		arg_7_0.detailItem = arg_7_0.normal:Find("item_tpl")
		arg_7_0.extra = arg_7_0.detailContain:Find("items")
		arg_7_0.extraTip = arg_7_0.extra:Find("Text")
		arg_7_0.detailItemList = arg_7_0.extra:Find("scrollview/list")
		arg_7_0.extraDesc = arg_7_0.detailContain:Find("Text")
	end

	arg_7_0.detailNormalTip = arg_7_0.detailWindow:Find("NormalTips")
	arg_7_0.infoBtn = arg_7_0.detailWindow:Find("prince_bg/info")
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.bg, function()
		arg_8_0:closeView()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.cancelBtn, function()
		arg_8_0:closeView()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.confirmBtn, function()
		local var_11_0 = {}
		local var_11_1 = arg_8_0.panelConfig.limitArgs

		if var_11_1 and type(var_11_1) == "table" then
			local var_11_2 = var_11_1[1]

			if var_11_2 and type(var_11_2) == "table" and #var_11_2 >= 2 then
				local var_11_3, var_11_4 = unpack(var_11_2)
				local var_11_5 = getProxy(PlayerProxy):getRawData()

				if var_11_3 == "lv_70" and var_11_4 <= var_11_5.level then
					table.insert(var_11_0, function(arg_12_0)
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("lv70_package_tip"),
							onYes = arg_12_0
						})
					end)
				end
			end
		end

		for iter_11_0, iter_11_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING)) do
			if not arg_8_0.panelConfig.isChargeType then
				break
			end

			if not iter_11_1:isEnd() and table.contains(iter_11_1:getConfig("config_data")[1], arg_8_0.panelConfig.commodity.id) then
				local var_11_6 = Drop.New({
					type = DROP_TYPE_VITEM,
					id = iter_11_1:GetConfigClientSetting("item_id")
				})
				local var_11_7 = getProxy(ActivityProxy):getActivityById(var_11_6:getConfig("link_id"))

				if var_11_7 and not var_11_7:isEnd() then
					assert(var_11_7:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SKIN_COUPON)

					local var_11_8, var_11_9 = var_11_7:GetOwnCount()

					table.insert(var_11_0, function(arg_13_0)
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n(iter_11_1:GetConfigClientSetting("gift_tip")[arg_8_0.panelConfig.commodity.id], var_11_8, var_11_9),
							onYes = arg_13_0
						})
					end)

					if var_11_7:GetCanUsageCnt() + iter_11_1:getData1() + 1 > var_11_9 - var_11_8 - 1 then
						table.insert(var_11_0, function(arg_14_0)
							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("SkinDiscount_Last_Coupon"),
								onYes = arg_14_0
							})
						end)
					end
				end
			end
		end

		seriesAsync(var_11_0, function()
			existCall(arg_8_0.panelConfig.onYes)
			arg_8_0:closeView()
		end)
	end, SFX_PANEL)
end

function var_0_0.updatePanel(arg_16_0)
	local var_16_0 = arg_16_0.panelConfig.icon
	local var_16_1 = arg_16_0.panelConfig.name and arg_16_0.panelConfig.name or ""
	local var_16_2 = arg_16_0.panelConfig.tipBonus or ""
	local var_16_3 = arg_16_0.panelConfig.bonusItem
	local var_16_4 = arg_16_0.panelConfig.tipExtra and arg_16_0.panelConfig.tipExtra or ""
	local var_16_5 = arg_16_0.panelConfig.extraItems and arg_16_0.panelConfig.extraItems or {}
	local var_16_6 = arg_16_0.panelConfig.price and arg_16_0.panelConfig.price or 0
	local var_16_7 = arg_16_0.panelConfig.isChargeType
	local var_16_8 = arg_16_0.panelConfig.isLocalPrice
	local var_16_9 = arg_16_0.panelConfig.isMonthCard
	local var_16_10 = arg_16_0.panelConfig.tagType
	local var_16_11 = arg_16_0.panelConfig.normalTip
	local var_16_12 = arg_16_0.panelConfig.extraDrop
	local var_16_13 = arg_16_0.panelConfig.isForceGold
	local var_16_14 = arg_16_0.panelConfig.infoTip and arg_16_0.panelConfig.infoTip or ""

	if arg_16_0.detailNormalTip then
		setActive(arg_16_0.detailNormalTip, var_16_11)
	end

	if arg_16_0.detailContain then
		setActive(arg_16_0.detailContain, not var_16_11)
	end

	if var_16_11 then
		if arg_16_0.detailNormalTip:GetComponent("Text") then
			setText(arg_16_0.detailNormalTip, var_16_11)
		else
			setButtonText(arg_16_0.detailNormalTip, var_16_11)
		end
	end

	setActive(arg_16_0.detailTag, var_16_10 > 0)

	if var_16_10 > 0 then
		for iter_16_0, iter_16_1 in ipairs(arg_16_0.detailTags) do
			setActive(iter_16_1, iter_16_0 == var_16_10)
		end
	end

	GetImageSpriteFromAtlasAsync(var_16_0, "", arg_16_0.detailIcon, false)
	setScrollText(arg_16_0.detailName, var_16_1)

	if arg_16_0.detailExtraDrop then
		setActive(arg_16_0.detailExtraDrop, var_16_12)

		if var_16_12 then
			setText(arg_16_0.detailExtraDrop:Find("Text"), i18n("battlepass_pay_acquire") .. "\n" .. var_16_12.count .. "x")
			updateDrop(arg_16_0.detailExtraDrop:Find("item/IconTpl"), setmetatable({
				count = 1
			}, {
				__index = var_16_12
			}))
		end
	end

	if PLATFORM_CODE == PLATFORM_CHT then
		setActive(arg_16_0.detailRmb, var_16_7 and not var_16_8)
	else
		setActive(arg_16_0.detailRmb, var_16_7)
	end

	setActive(arg_16_0.detailGem, not var_16_7 and not var_16_13)
	setActive(arg_16_0.detailGold, not var_16_7 and not isActive(arg_16_0.detailRmb) and not isActive(arg_16_0.detailGem))
	setText(arg_16_0.detailPrice, var_16_6)

	if arg_16_0.extraDesc ~= nil then
		local var_16_15 = arg_16_0.panelConfig.descExtra or ""

		setActive(arg_16_0.extraDesc, #var_16_15 > 0)
		setText(arg_16_0.extraDesc, var_16_15)
	end

	if arg_16_0.detailContain then
		setActive(arg_16_0.normal, var_16_9)

		if var_16_9 then
			updateDrop(arg_16_0.detailItem, var_16_3)
			onButton(arg_16_0, arg_16_0.detailItem, function()
				return
			end, SFX_PANEL)

			local var_16_16, var_16_17 = contentWrap(var_16_3:getConfig("name"), 10, 2)

			if var_16_16 then
				var_16_17 = var_16_17 .. "..."
			end

			setText(arg_16_0.detailItem:Find("name"), var_16_17)
			setText(arg_16_0.detailTip, var_16_2)
		end

		setText(arg_16_0.extraTip, var_16_4)

		if arg_16_0:ExistSkinExperienceItem(var_16_5) then
			arg_16_0:UpdateSkinDiscountItemItems(var_16_5)
		else
			arg_16_0:UpdateItems(var_16_5)
		end
	end

	local var_16_18 = var_16_14 ~= ""

	setActive(arg_16_0.infoBtn, var_16_18)

	if var_16_18 then
		onButton(arg_16_0, arg_16_0.infoBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip[var_16_14].tip
			})
		end, SFX_PANEL)
	else
		removeOnButton(arg_16_0.infoBtn)
	end
end

function var_0_0.UpdateItems(arg_19_0, arg_19_1)
	for iter_19_0 = #arg_19_1, arg_19_0.detailItemList.childCount - 1 do
		Destroy(arg_19_0.detailItemList:GetChild(iter_19_0))
	end

	for iter_19_1 = arg_19_0.detailItemList.childCount, #arg_19_1 - 1 do
		cloneTplTo(arg_19_0.detailItem, arg_19_0.detailItemList)
	end

	for iter_19_2 = 1, #arg_19_1 do
		local var_19_0 = arg_19_0.detailItemList:GetChild(iter_19_2 - 1)

		updateDrop(var_19_0, arg_19_1[iter_19_2])

		local var_19_1, var_19_2 = contentWrap(arg_19_1[iter_19_2]:getConfig("name"), 8, 2)

		if var_19_1 then
			var_19_2 = var_19_2 .. "..."
		end

		setText(var_19_0:Find("name"), var_19_2)
		onButton(arg_19_0, var_19_0, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = arg_19_1[iter_19_2]
			})
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateSkinDiscountItemItems(arg_21_0, arg_21_1)
	local var_21_0, var_21_1 = arg_21_0:SplitItemAndSkinExperienceItem(arg_21_1)

	arg_21_0:UpdateItems(var_21_0)

	local var_21_2 = UIItemList.New(arg_21_0._tf:Find("window/container/bonus_gift/bg/scrollview/list"), arg_21_0._tf:Find("window/container/normal_items/item_tpl"))

	var_21_2:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			arg_21_0:UpdateItem(var_21_1[arg_22_1 + 1], arg_22_2)
		end
	end)
	var_21_2:align(#var_21_1)
	setText(arg_21_0._tf:Find("window/container/bonus_gift/bg/Text"), i18n("skin_discount_item_return_tip"))
	setText(arg_21_0._tf:Find("window/container/bonus_gift/bg/label"), i18n("skin_discount_item_extra_bounds"))
end

function var_0_0.UpdateItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = Drop.Create({
		DROP_TYPE_ITEM,
		arg_23_1.id,
		arg_23_1.count
	})

	updateDrop(arg_23_2, var_23_0)
	setText(arg_23_2:Find("name"), shortenString(var_23_0:getName(), 4))
	onButton(arg_23_0, arg_23_2, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = var_23_0
		})
	end, SFX_PANEL)
end

function var_0_0.SplitItemAndSkinExperienceItem(arg_25_0, arg_25_1)
	local var_25_0 = {}
	local var_25_1 = {}

	for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
		if var_0_0.IsSkinExperienceItem(iter_25_1) then
			table.insert(var_25_1, iter_25_1)
		else
			table.insert(var_25_0, iter_25_1)
		end
	end

	return var_25_0, var_25_1
end

function var_0_0.IsSkinExperienceItem(arg_26_0)
	local var_26_0

	if not isa(arg_26_0, Drop) then
		arg_26_0 = Drop.New(arg_26_0)
	end

	local var_26_1 = arg_26_0:getConfigTable()

	return var_26_1 and var_26_1.usage == ItemUsage.USAGE_SKIN_EXP
end

function var_0_0.ExistSkinExperienceItem(arg_27_0, arg_27_1)
	return _.any(arg_27_1, function(arg_28_0)
		return var_0_0.IsSkinExperienceItem(arg_28_0)
	end)
end

return var_0_0
