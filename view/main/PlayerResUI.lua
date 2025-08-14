local var_0_0 = class("PlayerResUI", pm.Mediator)

var_0_0.GO_MALL = "PlayerResUI:GO_MALL"
var_0_0.CHANGE_TOUCH_ABLE = "PlayerResUI:CHANGE_TOUCH_ABLE"
var_0_0.HIDE = "PlayerResUI:HIDE"
var_0_0.SHOW = "PlayerResUI:SHOW"

local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4

var_0_0.TYPE_OIL = 2
var_0_0.TYPE_GOLD = 4
var_0_0.TYPE_GEM = 8
var_0_0.TYPE_ALL = bit.bor(2, 4, 8)
var_0_0.DEFAULT_MODE = {
	showType = var_0_0.TYPE_ALL
}

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)
	pg.DelegateInfo.New(arg_1_0)
	pg.m02:registerMediator(arg_1_0)

	arg_1_0.state = var_0_1
	arg_1_0.settingsStack = {}
end

function var_0_0.GetPlayer(arg_2_0)
	return getProxy(PlayerProxy):getRawData()
end

function var_0_0.IsLoaded(arg_3_0)
	return arg_3_0.state > var_0_2
end

function var_0_0.IsEnable(arg_4_0)
	return arg_4_0.state == var_0_4
end

function var_0_0.Load(arg_5_0, arg_5_1)
	if arg_5_0.state ~= var_0_1 then
		return
	end

	arg_5_0.state = var_0_2

	PoolMgr.GetInstance():GetUI("ResPanel", true, arg_5_1)
end

function var_0_0.Init(arg_6_0, arg_6_1)
	arg_6_0._go = arg_6_1
	arg_6_0.oilAddBtn = findTF(arg_6_0._go, "oil")
	arg_6_0.goldAddBtn = findTF(arg_6_0._go, "gold")
	arg_6_0.gemAddBtn = findTF(arg_6_0._go, "gem")
	arg_6_0.goldMax = findTF(arg_6_0._go, "gold/gold_max_value"):GetComponent(typeof(Text))
	arg_6_0.goldValue = findTF(arg_6_0._go, "gold/gold_value"):GetComponent(typeof(Text))
	arg_6_0.oilMax = findTF(arg_6_0._go, "oil/oil_max_value"):GetComponent(typeof(Text))
	arg_6_0.oilValue = findTF(arg_6_0._go, "oil/oil_value"):GetComponent(typeof(Text))
	arg_6_0.gemValue = findTF(arg_6_0._go, "gem/gem_value"):GetComponent(typeof(Text))
	arg_6_0.animation = arg_6_0._go:GetComponent(typeof(Animation))
	arg_6_0.gemPos = arg_6_0.gemAddBtn.anchoredPosition
	arg_6_0.oilPos = arg_6_0.oilAddBtn.anchoredPosition
	arg_6_0.foldableHelper = MainFoldableHelper.New(arg_6_0._go.transform, Vector2(0, 1))

	onButton(arg_6_0, arg_6_0.goldAddBtn, function()
		arg_6_0:ClickGold()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.oilAddBtn, function()
		arg_6_0:ClickOil()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.gemAddBtn, function()
		arg_6_0:ClickGem()
	end, SFX_PANEL)

	arg_6_0.position = tf(arg_6_0._go).anchoredPosition

	setActive(arg_6_0._go, true)
end

function var_0_0.SetActive(arg_10_0, arg_10_1)
	if arg_10_1.active then
		table.insert(arg_10_0.settingsStack, arg_10_1)
		arg_10_0:Enable(arg_10_1)
	else
		if arg_10_1.clear then
			arg_10_0.settingsStack = {}
		else
			table.remove(arg_10_0.settingsStack)
		end

		arg_10_0:Disable()
	end
end

function var_0_0.Enable(arg_11_0, arg_11_1)
	if not arg_11_0:IsLoaded() then
		arg_11_0:Load(function(arg_12_0)
			arg_11_0._tf = arg_12_0.transform
			arg_11_0.state = var_0_4

			arg_11_0:Init(arg_11_0._tf:Find("frame").gameObject)
			arg_11_0:CustomSetting(arg_11_1)
			arg_11_0:Flush()
		end)
	elseif arg_11_0.state == var_0_4 then
		arg_11_0:CustomSetting(arg_11_1)
	else
		arg_11_0.state = var_0_4

		arg_11_0:CustomSetting(arg_11_1)
		setActive(arg_11_0._go, true)

		if arg_11_0:IsDirty() then
			arg_11_0:Flush()
		end
	end
end

function var_0_0.Disable(arg_13_0)
	if pg.goldExchangeMgr then
		pg.goldExchangeMgr:exit()

		pg.goldExchangeMgr = nil
	end

	if #arg_13_0.settingsStack > 0 then
		local var_13_0 = arg_13_0.settingsStack[#arg_13_0.settingsStack]

		var_13_0.anim = false

		arg_13_0:Enable(var_13_0)
	elseif arg_13_0:IsLoaded() then
		if arg_13_0:IsLoaded() then
			setActive(arg_13_0._go, false)
		end

		arg_13_0.state = var_0_3
	end
end

function var_0_0.CustomSetting(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1.showType

	setActive(arg_14_0.oilAddBtn, bit.band(var_14_0, var_0_0.TYPE_OIL) > 0)
	setActive(arg_14_0.goldAddBtn, bit.band(var_14_0, var_0_0.TYPE_GOLD) > 0)
	setActive(arg_14_0.gemAddBtn, bit.band(var_14_0, var_0_0.TYPE_GEM) > 0)
	arg_14_0._go.transform:SetAsLastSibling()

	if arg_14_1.anim then
		arg_14_0:DoAnimation()
	end

	local var_14_1 = arg_14_1.gemOffsetX or 0

	arg_14_0.gemAddBtn.anchoredPosition3D = Vector3(arg_14_0.gemPos.x + var_14_1, arg_14_0.gemPos.y, 1)
	arg_14_0.oilAddBtn.anchoredPosition3D = Vector3(arg_14_0.oilPos.x + var_14_1, arg_14_0.oilPos.y, 1)

	NotchAdapt.AdjustUI()
	setCanvasOverrideSorting(arg_14_0._tf, tobool(arg_14_1.canvasOrder))

	if arg_14_1.canvasOrder then
		GetComponent(arg_14_0._tf, typeof(Canvas)).sortingOrder = arg_14_1.canvasOrder
	end

	pg.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_OVERLAY_FOREVER, arg_14_0._tf, {
		weight = arg_14_1.weight,
		groupName = arg_14_1.groupName
	})
end

function var_0_0.DoAnimation(arg_15_0)
	arg_15_0.foldableHelper:Fold(true, 0)
	arg_15_0.foldableHelper:Fold(false, 0.5)
end

function var_0_0.ClickGem(arg_16_0)
	local var_16_0 = arg_16_0:GetPlayer()

	local function var_16_1()
		if not pg.m02:hasMediator(NewShopMainMediator.__cname) then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
				wrap = ChargeScene.TYPE_DIAMOND
			})
		else
			pg.m02:sendNotification(var_0_0.GO_MALL)
		end
	end

	if PLATFORM_CODE == PLATFORM_JP then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			fontSize = 23,
			yesText = "text_buy",
			content = i18n("word_diamond_tip", var_16_0:getFreeGem(), var_16_0:getChargeGem(), var_16_0:getTotalGem()),
			onYes = var_16_1,
			alignment = TextAnchor.UpperLeft,
			weight = LayerWeightConst.TOP_LAYER
		})
	else
		var_16_1()
	end
end

function var_0_0.ClickGold(arg_18_0)
	if not pg.goldExchangeMgr then
		pg.goldExchangeMgr = GoldExchangeView.New()
	end
end

function var_0_0.ClickOil(arg_19_0)
	local var_19_0 = arg_19_0:GetPlayer()
	local var_19_1 = pg.shop_template
	local var_19_2 = ShoppingStreet.getRiseShopId(ShopArgs.BuyOil, var_19_0.buyOilCount)

	if not var_19_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_today_buy_limit"))

		return
	end

	local var_19_3 = pg.shop_template[var_19_2]
	local var_19_4 = var_19_3.num

	if var_19_3.num == -1 and var_19_3.genre == ShopArgs.BuyOil then
		var_19_4 = ShopArgs.getOilByLevel(var_19_0.level)
	end

	if pg.gameset.buy_oil_limit.key_value > var_19_0.buyOilCount then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_SINGLE_ITEM,
			windowSize = {
				y = 570
			},
			content = i18n("oil_buy_tip", var_19_3.resource_num, var_19_4, var_19_0.buyOilCount),
			drop = {
				id = 2,
				type = DROP_TYPE_RESOURCE,
				count = var_19_4
			},
			onYes = function()
				pg.m02:sendNotification(GAME.SHOPPING, {
					isQuickShopping = true,
					count = 1,
					id = var_19_2
				})
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_PAY_OIL)
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
end

function var_0_0.Flush(arg_21_0)
	local var_21_0 = arg_21_0:GetPlayer()

	var_0_0.StaticFlush(var_21_0, arg_21_0.goldMax, arg_21_0.goldValue, arg_21_0.oilMax, arg_21_0.oilValue, arg_21_0.gemValue)
	arg_21_0:SetDirty(false)
end

function var_0_0.StaticFlush(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5)
	local var_22_0 = arg_22_0:getLevelMaxGold()
	local var_22_1 = arg_22_0:getLevelMaxOil()

	arg_22_1.text = "MAX: " .. var_22_0
	arg_22_2.text = arg_22_0.gold
	arg_22_3.text = "MAX: " .. var_22_1
	arg_22_4.text = arg_22_0.oil
	arg_22_5.text = arg_22_0:getTotalGem()
end

function var_0_0.Dispose(arg_23_0)
	pg.DelegateInfo.Dispose(arg_23_0)
	arg_23_0:Disable()
	pg.m02:removeMediator(arg_23_0.__cname)
	PoolMgr.GetInstance():ReturnUI("ResPanel", arg_23_0._go)

	arg_23_0.state = var_0_1
end

function var_0_0.SetDirty(arg_24_0, arg_24_1)
	arg_24_0.dirty = arg_24_1
end

function var_0_0.IsDirty(arg_25_0)
	return arg_25_0.dirty
end

function var_0_0.Fold(arg_26_0, arg_26_1, arg_26_2)
	if not arg_26_0:IsLoaded() then
		return
	end

	arg_26_0.foldableHelper:Fold(arg_26_1, arg_26_2)
end

function var_0_0.listNotificationInterests(arg_27_0)
	return {
		PlayerProxy.UPDATED,
		GAME.GUILD_GET_USER_INFO_DONE,
		GAME.GET_PUBLIC_GUILD_USER_DATA_DONE,
		PlayerResUI.CHANGE_TOUCH_ABLE,
		var_0_0.HIDE,
		var_0_0.SHOW
	}
end

function var_0_0.handleNotification(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1:getName()

	if var_28_0 == PlayerResUI.CHANGE_TOUCH_ABLE then
		local var_28_1 = arg_28_1:getBody()
		local var_28_2 = GetComponent(tf(arg_28_0._go), typeof(CanvasGroup))

		var_28_2.interactable = var_28_1
		var_28_2.blocksRaycasts = var_28_1

		return
	end

	arg_28_0:updateResPanel(var_28_0)
end

function var_0_0.updateResPanel(arg_29_0, arg_29_1)
	if not arg_29_0:IsEnable() then
		arg_29_0:SetDirty(true)

		return
	end

	if arg_29_1 == PlayerProxy.UPDATED or arg_29_1 == GAME.GUILD_GET_USER_INFO_DONE or arg_29_1 == GAME.GET_PUBLIC_GUILD_USER_DATA_DONE then
		arg_29_0:Flush()
	end
end

function var_0_0.checkBackPressed(arg_30_0)
	if pg.goldExchangeMgr then
		pg.goldExchangeMgr:exit()

		pg.goldExchangeMgr = nil

		return true
	else
		return false
	end
end

return var_0_0
