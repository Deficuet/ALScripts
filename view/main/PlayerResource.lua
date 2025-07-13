local var_0_0 = class("PlayerResource", import("..base.BaseUI"))
local var_0_1 = 12

var_0_0.GO_MALL = "PlayerResource:GO_MALL"

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)
	PoolMgr.GetInstance():GetUI("ResPanel", false, function(arg_2_0)
		local var_2_0 = pg.UIMgr.GetInstance().UIMain

		arg_2_0.transform:SetParent(var_2_0.transform, false)
		arg_1_0:onUILoaded(arg_2_0)
	end)
end

function var_0_0.init(arg_3_0)
	arg_3_0.oilAddBtn = arg_3_0:findTF("oil")
	arg_3_0.goldAddBtn = arg_3_0:findTF("gold")
	arg_3_0.gemAddBtn = arg_3_0:findTF("gem")
	arg_3_0.goldMax = arg_3_0:findTF("gold/gold_max_value")
	arg_3_0.goldValue = arg_3_0:findTF("gold/gold_value")
	arg_3_0.oilMax = arg_3_0:findTF("oil/oil_max_value")
	arg_3_0.oilValue = arg_3_0:findTF("oil/oil_value")
	arg_3_0.gemValue = arg_3_0:findTF("gem/gem_value")

	local var_3_0 = pg.shop_template

	onButton(arg_3_0, arg_3_0.goldAddBtn, function()
		if not pg.goldExchangeMgr then
			pg.goldExchangeMgr = GoldExchangeView.New()
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.oilAddBtn, function()
		local var_5_0 = ShoppingStreet.getRiseShopId(ShopArgs.BuyOil, arg_3_0.player.buyOilCount)

		if not var_5_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_today_buy_limit"))

			return
		end

		local var_5_1 = pg.shop_template[var_5_0]
		local var_5_2 = var_5_1.num

		if var_5_1.num == -1 and var_5_1.genre == ShopArgs.BuyOil then
			var_5_2 = ShopArgs.getOilByLevel(arg_3_0.player.level)
		end

		if pg.gameset.buy_oil_limit.key_value > arg_3_0.player.buyOilCount then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_SINGLE_ITEM,
				windowSize = {
					y = 570
				},
				content = i18n("oil_buy_tip", var_5_1.resource_num, var_5_2, arg_3_0.player.buyOilCount),
				drop = {
					id = 2,
					type = DROP_TYPE_RESOURCE,
					count = var_5_2
				},
				onYes = function()
					pg.m02:sendNotification(GAME.SHOPPING, {
						count = 1,
						id = var_5_0
					})
				end,
				weight = LayerWeightConst.TOP_LAYER
			})
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("help_oil_buy_limit"),
				custom = {
					{
						text = "text_iknow",
						sound = SFX_CANCEL
					}
				}
			})
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.gemAddBtn, function()
		local function var_7_0()
			if not pg.m02:hasMediator(ChargeMediator.__cname) then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
					wrap = ChargeScene.TYPE_DIAMOND
				})
			else
				pg.m02:sendNotification(var_0_0.GO_MALL)
			end
		end

		if PLATFORM_CODE == PLATFORM_JP then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				fontSize = 32,
				yesText = "text_buy",
				content = i18n("word_diamond_tip", arg_3_0.player:getFreeGem(), arg_3_0.player:getChargeGem(), arg_3_0.player:getTotalGem()),
				onYes = var_7_0,
				alignment = TextAnchor.UpperLeft,
				weight = LayerWeightConst.TOP_LAYER
			})
		else
			var_7_0()
		end
	end, SFX_PANEL)
end

function var_0_0.setParent(arg_9_0, arg_9_1, arg_9_2)
	setParent(arg_9_0._go, arg_9_1, arg_9_2)
end

function var_0_0.setResources(arg_10_0, arg_10_1, arg_10_2)
	assert(isa(arg_10_1, Player), "should be an instance of Player")

	arg_10_0.player = arg_10_1

	local var_10_0 = arg_10_1:getLevelMaxGold()
	local var_10_1 = arg_10_1:getLevelMaxOil()

	setText(arg_10_0.goldMax, "MAX: " .. var_10_0)
	setText(arg_10_0.goldValue, arg_10_1.gold)
	setText(arg_10_0.oilMax, "MAX: " .. var_10_1)
	setText(arg_10_0.oilValue, arg_10_1.oil)
	setText(arg_10_0.gemValue, arg_10_1:getTotalGem())

	arg_10_2 = arg_10_2 or {
		true,
		true,
		true
	}

	setActive(arg_10_0.oilAddBtn, arg_10_2[1])
	setActive(arg_10_0.goldAddBtn, arg_10_2[2])
	setActive(arg_10_0.gemAddBtn, arg_10_2[3])
end

function var_0_0.willExit(arg_11_0)
	if pg.goldExchangeMgr then
		pg.goldExchangeMgr:exit()

		pg.goldExchangeMgr = nil
	end

	PoolMgr.GetInstance():ReturnUI("ResPanel", arg_11_0._go)
end

return var_0_0
