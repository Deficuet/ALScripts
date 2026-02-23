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

					if iter_11_1:GetConfigClientSetting("gift_tip")[arg_8_0.panelConfig.commodity.id][1] ~= "" then
						local var_11_8 = iter_11_1:GetConfigClientSetting("gift_tip")[arg_8_0.panelConfig.commodity.id][2]
						local var_11_9 = #pg.item_data_statistics[var_11_8].usage_arg[3]
						local var_11_10 = #underscore.filter(pg.item_data_statistics[var_11_8].usage_arg[3], function(arg_13_0)
							return getProxy(ShipSkinProxy):hasNonLimitSkin(arg_13_0)
						end)

						table.insert(var_11_0, function(arg_14_0)
							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n(iter_11_1:GetConfigClientSetting("gift_tip")[arg_8_0.panelConfig.commodity.id][1], var_11_10, var_11_9),
								onYes = arg_14_0
							})
						end)
					else
						table.insert(var_11_0, function(arg_15_0)
							arg_15_0()
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

function var_0_0.updatePanel(arg_17_0)
	local var_17_0 = arg_17_0.panelConfig.icon
	local var_17_1 = arg_17_0.panelConfig.name and arg_17_0.panelConfig.name or ""
	local var_17_2 = arg_17_0.panelConfig.tipBonus or ""
	local var_17_3 = arg_17_0.panelConfig.bonusItem
	local var_17_4 = arg_17_0.panelConfig.tipExtra and arg_17_0.panelConfig.tipExtra or ""
	local var_17_5 = arg_17_0.panelConfig.extraItems and arg_17_0.panelConfig.extraItems or {}
	local var_17_6 = arg_17_0.panelConfig.price and arg_17_0.panelConfig.price or 0
	local var_17_7 = arg_17_0.panelConfig.isChargeType
	local var_17_8 = arg_17_0.panelConfig.isLocalPrice
	local var_17_9 = arg_17_0.panelConfig.isMonthCard
	local var_17_10 = arg_17_0.panelConfig.tagType
	local var_17_11 = arg_17_0.panelConfig.normalTip
	local var_17_12 = arg_17_0.panelConfig.extraDrop
	local var_17_13 = arg_17_0.panelConfig.isForceGold
	local var_17_14 = arg_17_0.panelConfig.infoTip and arg_17_0.panelConfig.infoTip or ""

	if arg_17_0.detailNormalTip then
		setActive(arg_17_0.detailNormalTip, var_17_11)
	end

	if arg_17_0.detailContain then
		setActive(arg_17_0.detailContain, not var_17_11)
	end

	if var_17_11 then
		if arg_17_0.detailNormalTip:GetComponent("Text") then
			setText(arg_17_0.detailNormalTip, var_17_11)
		else
			setButtonText(arg_17_0.detailNormalTip, var_17_11)
		end
	end

	setActive(arg_17_0.detailTag, var_17_10 > 0)

	if var_17_10 > 0 then
		for iter_17_0, iter_17_1 in ipairs(arg_17_0.detailTags) do
			setActive(iter_17_1, iter_17_0 == var_17_10)
		end
	end

	GetImageSpriteFromAtlasAsync(var_17_0, "", arg_17_0.detailIcon, false)
	setScrollText(arg_17_0.detailName, var_17_1)

	if arg_17_0.detailExtraDrop then
		setActive(arg_17_0.detailExtraDrop, var_17_12)

		if var_17_12 then
			setText(arg_17_0.detailExtraDrop:Find("Text"), i18n("battlepass_pay_acquire") .. "\n" .. var_17_12.count .. "x")
			updateDrop(arg_17_0.detailExtraDrop:Find("item/IconTpl"), setmetatable({
				count = 1
			}, {
				__index = var_17_12
			}))
		end
	end

	if PLATFORM_CODE == PLATFORM_CHT then
		setActive(arg_17_0.detailRmb, var_17_7 and not var_17_8)
	else
		setActive(arg_17_0.detailRmb, var_17_7)
	end

	setActive(arg_17_0.detailGem, not var_17_7 and not var_17_13)
	setActive(arg_17_0.detailGold, not var_17_7 and not isActive(arg_17_0.detailRmb) and not isActive(arg_17_0.detailGem))
	setText(arg_17_0.detailPrice, var_17_6)

	if arg_17_0.extraDesc ~= nil then
		local var_17_15 = arg_17_0.panelConfig.descExtra or ""

		setActive(arg_17_0.extraDesc, #var_17_15 > 0)
		setText(arg_17_0.extraDesc, var_17_15)
	end

	if arg_17_0.detailContain then
		setActive(arg_17_0.normal, var_17_9)

		if var_17_9 then
			updateDrop(arg_17_0.detailItem, var_17_3)
			onButton(arg_17_0, arg_17_0.detailItem, function()
				return
			end, SFX_PANEL)

			local var_17_16, var_17_17 = contentWrap(var_17_3:getConfig("name"), 10, 2)

			if var_17_16 then
				var_17_17 = var_17_17 .. "..."
			end

			setText(arg_17_0.detailItem:Find("name"), var_17_17)
			setText(arg_17_0.detailTip, var_17_2)
		end

		setText(arg_17_0.extraTip, var_17_4)

		if arg_17_0:ExistSkinExperienceItem(var_17_5) then
			arg_17_0:UpdateSkinDiscountItemItems(var_17_5)
		else
			arg_17_0:UpdateItems(var_17_5)
		end
	end

	local var_17_18 = var_17_14 ~= ""

	setActive(arg_17_0.infoBtn, var_17_18)

	if var_17_18 then
		onButton(arg_17_0, arg_17_0.infoBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip[var_17_14].tip
			})
		end, SFX_PANEL)
	else
		removeOnButton(arg_17_0.infoBtn)
	end
end

function var_0_0.UpdateItems(arg_20_0, arg_20_1)
	for iter_20_0 = #arg_20_1, arg_20_0.detailItemList.childCount - 1 do
		Destroy(arg_20_0.detailItemList:GetChild(iter_20_0))
	end

	for iter_20_1 = arg_20_0.detailItemList.childCount, #arg_20_1 - 1 do
		cloneTplTo(arg_20_0.detailItem, arg_20_0.detailItemList)
	end

	for iter_20_2 = 1, #arg_20_1 do
		local var_20_0 = arg_20_0.detailItemList:GetChild(iter_20_2 - 1)

		updateDrop(var_20_0, arg_20_1[iter_20_2])

		local var_20_1, var_20_2 = contentWrap(arg_20_1[iter_20_2]:getConfig("name"), 8, 2)

		if var_20_1 then
			var_20_2 = var_20_2 .. "..."
		end

		setText(var_20_0:Find("name"), var_20_2)
		onButton(arg_20_0, var_20_0, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = arg_20_1[iter_20_2]
			})
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateSkinDiscountItemItems(arg_22_0, arg_22_1)
	local var_22_0, var_22_1 = arg_22_0:SplitItemAndSkinExperienceItem(arg_22_1)

	arg_22_0:UpdateItems(var_22_0)

	local var_22_2 = UIItemList.New(arg_22_0._tf:Find("window/container/bonus_gift/bg/scrollview/list"), arg_22_0._tf:Find("window/container/normal_items/item_tpl"))

	var_22_2:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			arg_22_0:UpdateItem(var_22_1[arg_23_1 + 1], arg_23_2)
		end
	end)
	var_22_2:align(#var_22_1)
	setText(arg_22_0._tf:Find("window/container/bonus_gift/bg/Text"), i18n("skin_discount_item_return_tip"))
	setText(arg_22_0._tf:Find("window/container/bonus_gift/bg/label"), i18n("skin_discount_item_extra_bounds"))
end

function var_0_0.UpdateItem(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = Drop.Create({
		DROP_TYPE_ITEM,
		arg_24_1.id,
		arg_24_1.count
	})

	updateDrop(arg_24_2, var_24_0)
	setText(arg_24_2:Find("name"), shortenString(var_24_0:getName(), 4))
	onButton(arg_24_0, arg_24_2, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = var_24_0
		})
	end, SFX_PANEL)
end

function var_0_0.SplitItemAndSkinExperienceItem(arg_26_0, arg_26_1)
	local var_26_0 = {}
	local var_26_1 = {}

	for iter_26_0, iter_26_1 in ipairs(arg_26_1) do
		if var_0_0.IsSkinExperienceItem(iter_26_1) then
			table.insert(var_26_1, iter_26_1)
		else
			table.insert(var_26_0, iter_26_1)
		end
	end

	return var_26_0, var_26_1
end

function var_0_0.IsSkinExperienceItem(arg_27_0)
	local var_27_0

	if not isa(arg_27_0, Drop) then
		arg_27_0 = Drop.New(arg_27_0)
	end

	local var_27_1 = arg_27_0:getConfigTable()

	return var_27_1 and var_27_1.usage == ItemUsage.USAGE_SKIN_EXP
end

function var_0_0.ExistSkinExperienceItem(arg_28_0, arg_28_1)
	return _.any(arg_28_1, function(arg_29_0)
		return var_0_0.IsSkinExperienceItem(arg_29_0)
	end)
end

return var_0_0
