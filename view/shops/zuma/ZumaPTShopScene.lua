local var_0_0 = class("ZumaPTShopScene", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ZumaPTShopUI"
end

function var_0_0.getBGM(arg_2_0)
	return "cw-story"
end

function var_0_0.init(arg_3_0)
	arg_3_0:initData()
	arg_3_0:findUI()
	arg_3_0:addListener()
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:updatePTPanel()
	arg_4_0:updateGoodPanel()
end

function var_0_0.onBackPressed(arg_5_0)
	arg_5_0:closeView()
end

function var_0_0.willExit(arg_6_0)
	return
end

function var_0_0.initData(arg_7_0)
	arg_7_0.actID = ActivityConst.MINIGAME_ZUMA_PT_SHOP_ID
	arg_7_0.ptID = LaunchBallActivityMgr.GetGamePtId(ActivityConst.MINIGAME_ZUMA)
	arg_7_0.ptItemID = id2ItemId(arg_7_0.ptID)
	arg_7_0.actShopVO = nil
	arg_7_0.goodVOListForShow = nil
	arg_7_0.goodIDList = pg.activity_template[arg_7_0.actID].config_data
	arg_7_0.goodTFList = {}

	arg_7_0:updateData()
end

function var_0_0.findUI(arg_8_0)
	arg_8_0.tpl = arg_8_0:findTF("Tpl")
	arg_8_0.containerTF = arg_8_0:findTF("Shop/Panel/ScrollView/Viewport/Content")
	arg_8_0.backBtn = arg_8_0:findTF("Adapt/Back")
	arg_8_0.helpBtn = arg_8_0:findTF("Adapt/Help")
	arg_8_0.ptInfoIcon = arg_8_0:findTF("Shop/PTInfo/Icon")
	arg_8_0.ptInfoCountText = arg_8_0:findTF("Shop/PTInfo/Count")

	setText(arg_8_0:findTF("Tip", arg_8_0.tpl), i18n("islandshop_tips2"))
end

function var_0_0.addListener(arg_9_0)
	onButton(arg_9_0, arg_9_0.backBtn, function()
		arg_9_0:closeView()
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("card_pairs_help_tip")
		})
	end, SFX_PANEL)

	arg_9_0.goodUIItemList = UIItemList.New(arg_9_0.containerTF, arg_9_0.tpl)

	arg_9_0.goodUIItemList:make(function(arg_12_0, arg_12_1, arg_12_2)
		arg_12_1 = arg_12_1 + 1

		if arg_12_0 == UIItemList.EventInit then
			arg_9_0.goodTFList[arg_12_1] = arg_12_2

			onButton(arg_9_0, arg_12_2, function()
				if not isActive(arg_9_0:findTF("Mask", arg_12_2)) then
					arg_9_0:emit(ZumaPTShopMediator.OPEN_ZUMA_PT_SHOP_BUY_WINDOW, arg_9_0:getGoodVOByIndex(arg_12_1))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("launchball_minigame_shop"))
				end
			end, SFX_PANEL)
		elseif arg_12_0 == UIItemList.EventUpdate then
			arg_9_0:updateTpl(arg_12_1, arg_12_2)
		end
	end)
end

function var_0_0.updateData(arg_14_0)
	local var_14_0 = getProxy(ActivityProxy):getActivityById(arg_14_0.actID)

	arg_14_0.actShopVO = ActivityShop.New(var_14_0)
	arg_14_0.goodVOListForShow = arg_14_0.actShopVO:getSortGoods()
end

function var_0_0.getGoodVOByIndex(arg_15_0, arg_15_1)
	return arg_15_0.goodVOListForShow[arg_15_1]
end

function var_0_0.updatePTPanel(arg_16_0)
	local var_16_0 = Drop.New({
		type = 1,
		id = arg_16_0.ptID
	}):getOwnedCount()

	setText(arg_16_0.ptInfoCountText, var_16_0)
end

function var_0_0.updateGoodPanel(arg_17_0)
	arg_17_0.goodUIItemList:align(#arg_17_0.goodVOListForShow)
end

function var_0_0.updateTpl(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0:findTF("Item", arg_18_2)
	local var_18_1 = arg_18_0:findTF("Name/Name", arg_18_2)
	local var_18_2 = arg_18_0:findTF("PTCount", arg_18_2)
	local var_18_3 = arg_18_0:findTF("BuyCount", arg_18_2)
	local var_18_4 = arg_18_0.goodVOListForShow[arg_18_1]
	local var_18_5 = Drop.New({
		type = var_18_4:getConfig("commodity_type"),
		id = var_18_4:getConfig("commodity_id"),
		count = var_18_4:getConfig("num")
	})

	updateDrop(var_18_0, var_18_5)
	setScrollText(var_18_1, var_18_5:getName())

	local var_18_6 = var_18_4:getConfig("resource_num")

	setText(var_18_2, var_18_6)

	local var_18_7 = var_18_4:getConfig("num_limit")

	if var_18_7 == 0 then
		setText(var_18_3, i18n("common_no_limit"))
	else
		setText(var_18_3, math.max(var_18_4:GetPurchasableCnt(), 0) .. "/" .. var_18_7)
	end

	local var_18_8 = arg_18_0:findTF("Mask", arg_18_2)
	local var_18_9 = arg_18_0:findTF("Lock", var_18_8)
	local var_18_10 = arg_18_0:findTF("SellOut", var_18_8)
	local var_18_11 = var_18_7 > 0 and var_18_4:GetPurchasableCnt() <= 0

	setActive(var_18_8, var_18_11)
	setActive(var_18_10, var_18_11)
	setActive(var_18_9, false)
end

function var_0_0.updateTplByGoodID(arg_19_0, arg_19_1)
	local var_19_0 = 0

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.goodVOListForShow) do
		if iter_19_1.id == arg_19_1 then
			var_19_0 = iter_19_0
		end
	end

	local var_19_1 = arg_19_0.goodTFList[var_19_0]

	arg_19_0:updateTpl(var_19_0, var_19_1)
end

return var_0_0
