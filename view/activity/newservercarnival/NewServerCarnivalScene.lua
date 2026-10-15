local var_0_0 = class("NewServerCarnivalScene", import("...base.BaseUI"))

var_0_0.TASK_PAGE = 1
var_0_0.SHOP_PAGE = 2
var_0_0.GIFT_PAGE = 3

function var_0_0.getUIName(arg_1_0)
	return "NewServerCarnivalUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/newservershopui_atlas",
		"ui/iconcolorful",
		"weaponframes",
		"chargeicon/1"
	}
	local var_2_1 = {}

	local function var_2_2(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_1, arg_3_0) then
			table.insert(var_2_1, arg_3_0)
		end
	end

	local var_2_3 = pg.newserver_shop_template

	if var_2_3 then
		for iter_2_0, iter_2_1 in ipairs(var_2_3.all or {}) do
			local var_2_4 = var_2_3[iter_2_1]

			if var_2_4 then
				var_2_2(var_2_4.goods_icon)

				if var_2_4.resource_category and var_2_4.resource_type then
					var_2_2(Drop.New({
						type = var_2_4.resource_category,
						id = var_2_4.resource_type
					}):getIcon())
				end

				var_2_2("chargeicon/" .. (var_2_4.picture or ""))
			end
		end
	end

	for iter_2_2, iter_2_3 in ipairs(var_2_1) do
		if not table.contains(var_2_0, iter_2_3) then
			table.insert(var_2_0, iter_2_3)
		end
	end

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))

	return var_2_0
end

function var_0_0.preload(arg_4_0, arg_4_1)
	local var_4_0 = {}

	table.insert(var_4_0, function(arg_5_0)
		pg.m02:sendNotification(GAME.GET_NEW_SERVER_SHOP, {
			callback = function(arg_6_0)
				arg_4_0:SetNewServerShop(arg_6_0)
				arg_5_0()
			end
		})
	end)
	parallelAsync(var_4_0, arg_4_1)
end

function var_0_0.SetNewServerShop(arg_7_0, arg_7_1)
	arg_7_0.newServerShop = arg_7_1
end

function var_0_0.setData(arg_8_0)
	local var_8_0 = getProxy(ActivityProxy)
	local var_8_1 = var_8_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_NEWSERVER_TASK)
	local var_8_2 = var_8_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_NEWSERVER_SHOP)
	local var_8_3 = var_8_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_NEWSERVER_GIFT)

	if var_8_1 and not var_8_1:isEnd() then
		arg_8_0.taskActivity = var_8_1
	else
		arg_8_0.taskActivity = nil
	end

	if var_8_2 and not var_8_2:isEnd() then
		arg_8_0.shopActivity = var_8_2
	else
		arg_8_0.shopActivity = nil
	end

	if var_8_3 and not var_8_3:isEnd() then
		arg_8_0.giftActivity = var_8_3
	else
		arg_8_0.giftActivity = nil
	end

	arg_8_0.player = getProxy(PlayerProxy):getData()
end

function var_0_0.init(arg_9_0)
	arg_9_0.blurPanel = arg_9_0._tf:Find("blur_panel")
	arg_9_0.top = arg_9_0.blurPanel:Find("adapt/top")
	arg_9_0.resPanel = arg_9_0.top:Find("res")
	arg_9_0.backBtn = arg_9_0.top:Find("back_btn")
	arg_9_0.helpBtn = arg_9_0.top:Find("help_btn")
	arg_9_0.leftPanel = arg_9_0._tf:Find("left")
	arg_9_0.timeTF = arg_9_0.leftPanel:Find("time")
	arg_9_0.toggles = {
		arg_9_0.leftPanel:Find("frame/toggle_group/task"),
		arg_9_0.leftPanel:Find("frame/toggle_group/shop"),
		arg_9_0.leftPanel:Find("frame/toggle_group/gift")
	}
	arg_9_0.main = arg_9_0._tf:Find("main")
	arg_9_0.pages = {
		arg_9_0.main:Find("task_container"),
		arg_9_0.main:Find("shop_container"),
		arg_9_0.main:Find("gift_container")
	}
	arg_9_0.newServerTaskPage = NewServerTaskPage.New(arg_9_0.pages[var_0_0.TASK_PAGE], arg_9_0.event, arg_9_0.contextData)
	arg_9_0.newServerShopPage = NewServerShopPage.New(arg_9_0.pages[var_0_0.SHOP_PAGE], arg_9_0.event, arg_9_0.contextData)

	arg_9_0.newServerShopPage:SetShop(arg_9_0.newServerShop)

	arg_9_0.newServerGiftPage = NewServerGiftPage.New(arg_9_0.pages[var_0_0.GIFT_PAGE], arg_9_0.event, arg_9_0.contextData)
	arg_9_0.pageDic = {
		[var_0_0.TASK_PAGE] = arg_9_0.newServerTaskPage,
		[var_0_0.SHOP_PAGE] = arg_9_0.newServerShopPage,
		[var_0_0.GIFT_PAGE] = arg_9_0.newServerGiftPage
	}
end

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0.backBtn, function()
		arg_10_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.newserver_activity_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.resPanel:Find("gem/add_btn"), function()
		local function var_13_0()
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
				content = i18n("word_diamond_tip", arg_10_0.player:getFreeGem(), arg_10_0.player:getChargeGem(), arg_10_0.player:getTotalGem()),
				onYes = var_13_0,
				alignment = TextAnchor.UpperLeft
			})
		else
			var_13_0()
		end
	end, SFX_PANEL)
	arg_10_0:updateTime()
	setText(arg_10_0.resPanel:Find("gem/gem_value"), arg_10_0.player:getTotalGem())

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.toggles) do
		onToggle(arg_10_0, iter_10_1, function(arg_15_0)
			arg_10_0:updateLocalRedDotData(iter_10_0)
			arg_10_0:updatePages(iter_10_0, arg_15_0)
			setActive(arg_10_0.resPanel, arg_15_0 and iter_10_0 == var_0_0.GIFT_PAGE)
		end)
	end

	setActive(arg_10_0.toggles[var_0_0.TASK_PAGE], arg_10_0.taskActivity)
	setActive(arg_10_0.toggles[var_0_0.SHOP_PAGE], arg_10_0.shopActivity)
	setActive(arg_10_0.toggles[var_0_0.GIFT_PAGE], arg_10_0.giftActivity)

	arg_10_0.page = arg_10_0.contextData.page or arg_10_0.taskActivity and var_0_0.TASK_PAGE or var_0_0.SHOP_PAGE

	triggerToggle(arg_10_0.toggles[arg_10_0.page], true)
end

function var_0_0.updateShopDedDot(arg_16_0)
	setActive(arg_16_0.toggles[var_0_0.SHOP_PAGE]:Find("tip"), arg_16_0.newServerShopPage:isTip())
end

function var_0_0.updatePages(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0.pageDic[arg_17_1]:isShowing() ~= arg_17_2 then
		if arg_17_2 then
			if arg_17_1 == var_0_0.SHOP_PAGE then
				arg_17_0.pageDic[arg_17_1]:ExecuteAction("Flush")
			else
				arg_17_0.pageDic[arg_17_1]:ExecuteAction("Show")
			end
		else
			arg_17_0.pageDic[arg_17_1]:ExecuteAction("Hide")
		end
	end
end

function var_0_0.updateTips(arg_18_0)
	if arg_18_0.taskActivity then
		setActive(arg_18_0.toggles[var_0_0.TASK_PAGE]:Find("tip"), arg_18_0.newServerTaskPage:isTip())
	end

	if arg_18_0.shopActivity then
		setActive(arg_18_0.toggles[var_0_0.SHOP_PAGE]:Find("tip"), arg_18_0.newServerShopPage:isTip())
	end

	if arg_18_0.giftActivity then
		setActive(arg_18_0.toggles[var_0_0.GIFT_PAGE]:Find("tip"), arg_18_0.newServerGiftPage:isTip())
	end
end

function var_0_0.updateLocalRedDotData(arg_19_0, arg_19_1)
	if arg_19_1 == var_0_0.SHOP_PAGE then
		if arg_19_0.newServerShopPage:isTip() and PlayerPrefs.GetInt("newserver_shop_first_" .. arg_19_0.player.id) == 0 then
			PlayerPrefs.SetInt("newserver_shop_first_" .. arg_19_0.player.id, 1)
		end
	elseif arg_19_1 == var_0_0.GIFT_PAGE and arg_19_0.newServerGiftPage:isTip() then
		PlayerPrefs.SetInt("newserver_gift_first_" .. arg_19_0.player.id, 1)
	end
end

function var_0_0.updateTime(arg_20_0)
	local var_20_0 = pg.TimeMgr.GetInstance()
	local var_20_1 = (arg_20_0.taskActivity and arg_20_0.taskActivity.stopTime or arg_20_0.shopActivity.stopTime) - var_20_0:GetServerTime()
	local var_20_2 = math.floor(var_20_1 / 86400)
	local var_20_3 = math.floor((var_20_1 - var_20_2 * 86400) / 3600)

	setText(arg_20_0.timeTF, i18n("newserver_time", var_20_2, var_20_3))
	setActive(arg_20_0.timeTF:Find("title_activity"), arg_20_0.taskActivity)
	setActive(arg_20_0.timeTF:Find("title_shop"), not arg_20_0.taskActivity)
end

function var_0_0.onUpdateTask(arg_21_0)
	arg_21_0.newServerTaskPage:ActionInvoke("onUpdateTask")
	arg_21_0.newServerShopPage:ActionInvoke("UpdateRes")
	arg_21_0:updateTips()
end

function var_0_0.onUpdatePlayer(arg_22_0, arg_22_1)
	arg_22_0.player = arg_22_1

	setText(arg_22_0.resPanel:Find("gem/gem_value"), arg_22_0.player:getTotalGem())
	arg_22_0.newServerGiftPage:onUpdatePlayer(arg_22_1)
end

function var_0_0.onUpdateGift(arg_23_0)
	arg_23_0.newServerGiftPage:ActionInvoke("onUpdateGift")
	arg_23_0:updateTips()
end

function var_0_0.willExit(arg_24_0)
	arg_24_0.newServerTaskPage:Destroy()
	arg_24_0.newServerShopPage:Destroy()
	arg_24_0.newServerGiftPage:Destroy()
end

function var_0_0.isShow()
	local var_25_0 = getProxy(ActivityProxy)
	local var_25_1 = var_25_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_NEWSERVER_TASK)
	local var_25_2 = var_25_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_NEWSERVER_SHOP)
	local var_25_3 = var_25_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_NEWSERVER_GIFT)

	return var_25_1 and not var_25_1:isEnd() or var_25_2 and not var_25_2:isEnd() or var_25_3 and not var_25_3:isEnd()
end

function var_0_0.isTip()
	return false
end

return var_0_0
