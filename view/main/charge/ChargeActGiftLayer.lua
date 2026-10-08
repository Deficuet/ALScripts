local var_0_0 = class("ChargeActGiftLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ChargeIActGiftUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(ActivityProxy):getActivityById(arg_2_0.contextData.actId)
	local var_2_1 = {}

	if var_2_0 and not var_2_0:isEnd() then
		arg_2_0.spriteDic = {
			name = {},
			icon = {}
		}

		for iter_2_0, iter_2_1 in ipairs(var_2_0:getConfig("config_data")[1]) do
			table.insert(var_2_1, function(arg_3_0)
				LoadSpriteAtlasAsync("actgiftpackages/skin_card_name_" .. iter_2_1, "", function(arg_4_0)
					arg_2_0.spriteDic.name[iter_2_1] = arg_4_0

					arg_3_0()
				end)
			end)
			table.insert(var_2_1, function(arg_5_0)
				LoadSpriteAtlasAsync("actgiftpackages/skin_card_" .. iter_2_1, "", function(arg_6_0)
					arg_2_0.spriteDic.icon[iter_2_1] = arg_6_0

					arg_5_0()
				end)
			end)
		end
	end

	parallelAsync(var_2_1, arg_2_1)
end

function var_0_0.getResource(arg_7_0)
	local var_7_0 = var_0_0.super.getResource(arg_7_0)
	local var_7_1 = {}

	local function var_7_2(arg_8_0)
		if noEmptyStr(arg_8_0) and not table.contains(var_7_1, arg_8_0) then
			table.insert(var_7_1, arg_8_0)
		end
	end

	local var_7_3 = getProxy(ActivityProxy):getActivityById(arg_7_0.contextData.actId)

	if var_7_3 and not var_7_3:isEnd() then
		for iter_7_0, iter_7_1 in ipairs(var_7_3:getConfig("config_data")[1] or {}) do
			var_7_2("actgiftpackages/skin_card_name_" .. iter_7_1)
			var_7_2("actgiftpackages/skin_card_" .. iter_7_1)
		end
	end

	for iter_7_2, iter_7_3 in ipairs(var_7_1) do
		if not table.contains(var_7_0, iter_7_3) then
			table.insert(var_7_0, iter_7_3)
		end
	end

	return var_7_0
end

function var_0_0.init(arg_9_0)
	setText(arg_9_0.rtTip:Find("Text"), i18n("black5_bundle_desc"))
	setText(arg_9_0.rtAward:Find("word/Text"), i18n("black5_bundle_tip"))
	setText(arg_9_0.btnPay:Find("Text"), i18n("black5_bundle_buy_all"))
	setText(arg_9_0.btnGet:Find("Text"), i18n("black5_bundle_receive"))
	arg_9_0:BlurPanel(arg_9_0._tf)
end

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0.rtBg, function()
		arg_10_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.rtTip, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("black5_bundle_help")
		})
	end, SFX_PANEL)

	local var_10_0 = getProxy(ActivityProxy):getActivityById(arg_10_0.contextData.actId)
	local var_10_1 = var_10_0:getConfig("config_data")[1]

	UIItemList.StaticAlign(arg_10_0.rtContainer, arg_10_0.rtSkinTpl, #var_10_1, function(arg_13_0, arg_13_1, arg_13_2)
		arg_13_1 = arg_13_1 + 1

		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = var_10_1[arg_13_1]

			setImageSprite(arg_13_2:Find("name"), arg_10_0.spriteDic.name[var_13_0])
			setImageSprite(arg_13_2, arg_10_0.spriteDic.icon[var_13_0])

			local var_13_1 = getProxy(ShipSkinProxy):hasNonLimitSkin(var_13_0)

			setActive(arg_13_2:Find("btn_skin"), not var_13_1)
			setActive(arg_13_2:Find("got"), var_13_1)

			if var_13_1 then
				setText(arg_13_2:Find("got/Text"), i18n("black5_bundle_purchased"))
			else
				local var_13_2 = Goods.Create({
					id = pg.ship_skin_template[var_13_0].shop_id
				}, Goods.TYPE_SKIN):getConfig("resource_num")

				setText(arg_13_2:Find("btn_skin/price/Text"), var_13_2)
				onButton(arg_10_0, arg_13_2:Find("btn_skin"), function()
					arg_10_0:emit(ChargeActGiftMediator.GO_SHOP, var_13_0)
				end, SFX_PANEL)
			end
		end
	end)

	local var_10_2 = Drop.Create(var_10_0:GetConfigClientSetting("drop"))

	updateDrop(arg_10_0.rtAward:Find("icon/bg/IconTpl"), var_10_2)
	onButton(arg_10_0, arg_10_0.rtAward:Find("icon"), function()
		arg_10_0:emit(BaseUI.ON_DROP, var_10_2)
	end, SFX_PANEL)

	local var_10_3, var_10_4, var_10_5 = GiftActCommodity.CalcPrice(var_10_0)

	setActive(arg_10_0.rtAward:Find("word"), var_10_3 > 0)
	setActive(arg_10_0.btnPay, var_10_3 > 0)
	setActive(arg_10_0.btnGet, var_10_3 == 0)

	if var_10_3 > 0 then
		setActive(arg_10_0.btnPay:Find("price/old"), var_10_3 < var_10_5)
		setText(arg_10_0.btnPay:Find("price/old"), string.format("<material=strike>%d</material>", var_10_5))
		setText(arg_10_0.btnPay:Find("price/price"), var_10_3)
		onButton(arg_10_0, arg_10_0.btnPay, function()
			local var_16_0 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = PlayerConst.ResDiamond,
				count = var_10_3
			})

			if var_16_0.count > var_16_0:getOwnedCount() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("temple_consume_not_enough"))

				return
			end

			local var_16_1 = Goods.Create({
				shop_id = var_10_0:GetConfigClientSetting("packageID")
			}, Goods.TYPE_GIFT_PACKAGE_ACT)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("black5_bundle_popup", var_16_0.count, var_16_1:GetName()),
				onYes = function()
					arg_10_0:emit(ChargeActGiftMediator.DO_PAY)
				end
			})
		end, SFX_CONFIRM)
	else
		onButton(arg_10_0, arg_10_0.btnGet, function()
			arg_10_0:emit(ChargeActGiftMediator.DO_PAY)
		end, SFX_CONFIRM)
	end
end

function var_0_0.willExit(arg_19_0)
	arg_19_0:UnOverlayPanel(arg_19_0._tf)
end

return var_0_0
