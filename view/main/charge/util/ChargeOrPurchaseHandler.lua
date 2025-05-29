local var_0_0 = class("ChargeOrPurchaseHandler", pm.Mediator)

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)
	pg.m02:registerMediator(arg_1_0)
end

function var_0_0.ChargeOrPurchaseAsyn(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0

	seriesAsync({
		function(arg_3_0)
			arg_2_0:FetchFirstChargeIds(arg_2_1, function(arg_4_0)
				var_2_0 = arg_4_0

				arg_3_0()
			end)
		end,
		function(arg_5_0)
			arg_2_0:ChargeOrPurchase(var_2_0, arg_2_1)
			arg_5_0()
		end
	}, arg_2_2)
end

function var_0_0.FetchFirstChargeIds(arg_6_0, arg_6_1, arg_6_2)
	if not arg_6_1:isChargeType() then
		arg_6_2()

		return
	end

	local var_6_0 = getProxy(ShopsProxy)

	local function var_6_1()
		local var_7_0 = var_6_0:getFirstChargeList()

		arg_6_2(var_7_0)
	end

	if var_6_0:ShouldRefreshChargeList() then
		pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
			callback = var_6_1
		})
	else
		var_6_1()
	end
end

function var_0_0.ChargeOrPurchase(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_2:isChargeType() then
		if arg_8_2:isMonthCard() or arg_8_2:isGiftBox() or arg_8_2:isItemBox() or arg_8_2:isPassItem() then
			return arg_8_0:ChargeMonthCardAndGiftPack(arg_8_1, arg_8_2)
		elseif arg_8_2:isGem() then
			return arg_8_0:ChargeGem(arg_8_1, arg_8_2)
		end
	else
		arg_8_0:PurchaseItem(arg_8_2)
	end
end

function var_0_0.PurchaseItem(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1:getDropInfo()

	assert(var_9_0.type == DROP_TYPE_ITEM)

	local var_9_1 = Item.getConfigData(var_9_0.id)
	local var_9_2 = {
		isMonthCard = false,
		isChargeType = false,
		isLocalPrice = false,
		icon = var_9_1.icon,
		name = var_9_1.name,
		tipExtra = i18n("charge_title_getitem"),
		extraItems = arg_9_1:GetDropList(),
		price = arg_9_1:getConfig("resource_num"),
		tagType = arg_9_1:getConfig("tag"),
		onYes = function()
			arg_9_0:Purchase(var_9_1.name, arg_9_1)
		end
	}

	arg_9_0:ShowMsgBox(var_9_2)
end

function var_0_0.ChargeMonthCardAndGiftPack(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_2:GetExtraServiceItem()
	local var_11_1 = arg_11_2:GetExtraDrop()
	local var_11_2 = arg_11_2:GetGemCnt()
	local var_11_3 = arg_11_2:GetBonusItem()
	local var_11_4, var_11_5 = arg_11_2:GetChargeTip()
	local var_11_6 = "chargeicon/" .. arg_11_2:getConfig("picture")
	local var_11_7 = arg_11_2:getConfig("name_display")
	local var_11_8 = arg_11_2:getConfig("money")
	local var_11_9 = arg_11_2:IsLocalPrice()
	local var_11_10 = arg_11_2:isMonthCard()
	local var_11_11 = arg_11_2:getConfig("descrip_extra")
	local var_11_12 = not table.contains(arg_11_1, arg_11_2.id) and arg_11_2:firstPayDouble() and 4 or arg_11_2:getConfig("tag")
	local var_11_13 = {
		isChargeType = true,
		infoTip = arg_11_2:GetInfoTip(),
		icon = var_11_6,
		name = var_11_7,
		tipExtra = var_11_4,
		extraItems = var_11_0,
		price = var_11_8,
		isLocalPrice = var_11_9,
		tagType = var_11_12,
		isMonthCard = var_11_10,
		tipBonus = var_11_5,
		bonusItem = var_11_3,
		extraDrop = var_11_1,
		descExtra = var_11_11,
		onYes = function()
			arg_11_0:Charge(arg_11_2)
		end
	}

	arg_11_0:ShowMsgBox(var_11_13)
end

function var_0_0.ChargeGem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_2:getConfig("money")
	local var_13_1 = arg_13_2:getConfig("gem")
	local var_13_2 = not table.contains(arg_13_1, arg_13_2.id) and arg_13_2:firstPayDouble()
	local var_13_3 = var_13_2 and 4 or arg_13_2:getConfig("tag")

	if var_13_2 then
		var_13_1 = var_13_1 + arg_13_2:getConfig("gem")
	else
		var_13_1 = var_13_1 + arg_13_2:getConfig("extra_gem")
	end

	local var_13_4 = "chargeicon/" .. arg_13_2:getConfig("picture")
	local var_13_5 = arg_13_2:getConfig("name_display")
	local var_13_6 = arg_13_2:getConfig("money")
	local var_13_7 = arg_13_2:IsLocalPrice()
	local var_13_8 = i18n("charge_start_tip", var_13_0, var_13_1)
	local var_13_9 = {
		isChargeType = true,
		infoTip = arg_13_2:GetInfoTip(),
		icon = var_13_4,
		name = var_13_5,
		price = var_13_6,
		isLocalPrice = var_13_7,
		tagType = var_13_3,
		normalTip = var_13_8,
		onYes = function()
			arg_13_0:Charge(arg_13_2)
		end
	}

	arg_13_0:ShowMsgBox(var_13_9)
end

function var_0_0.ShowMsgBox(arg_15_0, arg_15_1)
	arg_15_0:addSubLayers(Context.New({
		mediator = ChargeItemPanelMediator,
		viewComponent = ChargeItemPanelLayer,
		data = {
			panelConfig = arg_15_1
		}
	}))
end

function var_0_0.Purchase(arg_16_0, arg_16_1, arg_16_2)
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("charge_scene_buy_confirm", arg_16_2:getConfig("resource_num"), arg_16_1),
		onYes = function()
			pg.m02:sendNotification(GAME.SHOPPING, {
				count = 1,
				id = arg_16_2.id
			})
		end
	})
end

function var_0_0.Charge(arg_18_0, arg_18_1)
	if ChargeConst.isNeedSetBirth() then
		arg_18_0:addSubLayers(Context.New({
			mediator = ChargeBirthdayMediator,
			viewComponent = ChargeBirthdayLayer,
			data = {}
		}))
	else
		pg.m02:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = arg_18_1.id
		})
	end
end

function var_0_0.addSubLayers(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	assert(isa(arg_19_1, Context), "should be an instance of Context")

	local var_19_0 = getProxy(ContextProxy):getCurrentContext()

	if arg_19_2 then
		while var_19_0.parent do
			var_19_0 = var_19_0.parent
		end
	end

	arg_19_0:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = var_19_0,
		context = arg_19_1,
		callback = arg_19_3
	})
end

function var_0_0.Dispose(arg_20_0)
	pg.m02:removeMediator(arg_20_0.__cname)
end

return var_0_0
