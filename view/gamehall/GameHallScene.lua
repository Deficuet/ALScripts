local var_0_0 = class("GameHallScene", import("..base.BaseUI"))

var_0_0.open_with_list = false

function var_0_0.getUIName(arg_1_0)
	return "GameHallUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"char/mingshi",
		"weaponframes"
	}

	local function var_2_1(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	if not arg_2_0.charController then
		arg_2_0:initContainer()
	end

	local var_2_2 = arg_2_0.charController.shipNames or {}

	for iter_2_0, iter_2_1 in pairs(var_2_2) do
		var_2_1("char/" .. iter_2_1)
	end

	local var_2_3 = pg.TimeMgr.GetInstance():GetServerTime()

	for iter_2_2, iter_2_3 in ipairs(pg.game_room_template.all) do
		local var_2_4 = pg.game_room_template[iter_2_3]
		local var_2_5 = var_2_4.unlock_time

		if var_2_3 > pg.TimeMgr.GetInstance():Table2ServerTime({
			year = var_2_5[1][1],
			month = var_2_5[1][2],
			day = var_2_5[1][3],
			hour = var_2_5[2][1],
			min = var_2_5[2][2],
			sec = var_2_5[2][3]
		}) then
			var_2_1("gamehallicon/" .. var_2_4.icon)
		end
	end

	local var_2_6 = pg.player_resource[GameRoomProxy.coin_res_id].itemid
	local var_2_7 = Item.getConfigData(var_2_6)

	if var_2_7 then
		var_2_1(var_2_7.icon)
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.init(arg_4_0)
	arg_4_0:initContainer()
end

function var_0_0.initContainer(arg_5_0)
	if not arg_5_0.charController then
		arg_5_0.charController = GameHallContainerUI.New()
	end
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:initTopUI()
	arg_6_0:initHomeUI()

	local var_6_0 = findTF(arg_6_0._tf, "ad/container")

	arg_6_0.charController:InitUI(var_6_0)

	arg_6_0.freeCoinTf = findTF(var_6_0, "content/top/free")

	onButton(arg_6_0, arg_6_0.freeCoinTf, function()
		local var_7_0 = getProxy(GameRoomProxy):getCoin()
		local var_7_1 = pg.gameset.game_coin_max.key_value - var_7_0
		local var_7_2 = pg.gameset.game_coin_initial.key_value

		if var_7_1 == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("game_icon_max_full"))
		elseif var_7_1 < var_7_2 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("game_icon_max"),
				onYes = function()
					arg_6_0:emit(GameHallMediator.GET_WEEKLY_COIN)
				end,
				onNo = function()
					return
				end
			})
		else
			arg_6_0:emit(GameHallMediator.GET_WEEKLY_COIN)
		end
	end, SFX_CONFIRM)

	arg_6_0.listPanelTf = findTF(arg_6_0._tf, "ad/listPanel")
	arg_6_0.listPanel = GameHallListPanel.New(arg_6_0.listPanelTf, arg_6_0)

	arg_6_0.listPanel:setVisible(GameHallScene.open_with_list)

	GameHallScene.open_with_list = false
	arg_6_0.exchangePanelTf = findTF(arg_6_0._tf, "ad/exchangePanel")
	arg_6_0.parentTf = findTF(arg_6_0._tf, "ad")
	arg_6_0.exchangePanel = GameHallExchangePanel.New(arg_6_0.exchangePanelTf, arg_6_0.parentTf, arg_6_0)

	arg_6_0:openExchangePanel(false)
	arg_6_0:changeTitle(false)

	local var_6_1 = Application.targetFrameRate or 60

	if var_6_1 > 60 then
		var_6_1 = 60
	end

	arg_6_0.timer = Timer.New(function()
		arg_6_0:onTimer()
	end, 1 / var_6_1, -1)

	arg_6_0.timer:Start()
	arg_6_0:updateUI()
end

function var_0_0.initTopUI(arg_11_0)
	arg_11_0.btnBack = findTF(arg_11_0._tf, "ad/topPanel/btnBack")
	arg_11_0.btnHome = findTF(arg_11_0._tf, "ad/topPanel/btnHome")
	arg_11_0.btnHelp = findTF(arg_11_0._tf, "ad/topPanel/btnHelp")
	arg_11_0.btnCoin = findTF(arg_11_0._tf, "ad/topPanel/coin")
	arg_11_0.textCoin = findTF(arg_11_0._tf, "ad/topPanel/coin/text")
	arg_11_0.coinMax = pg.gameset.game_coin_max.key_value
	arg_11_0.textCoinMaxTF = findTF(arg_11_0._tf, "ad/topPanel/coin/max")

	setText(arg_11_0.textCoinMaxTF, "MAX:" .. arg_11_0.coinMax)
	onButton(arg_11_0, arg_11_0.btnCoin, function()
		arg_11_0:openExchangePanel(true)
	end)
	onButton(arg_11_0, arg_11_0.btnBack, function()
		if arg_11_0.listPanel:getVisible() then
			arg_11_0.listPanel:setVisible(false)
			arg_11_0:changeTitle(false)
			pg.SystemGuideMgr.GetInstance():Play(arg_11_0)

			return
		end

		arg_11_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.btnHome, function()
		arg_11_0:quickExitFunc()
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.game_room_help.tip
		})
	end, SFX_CANCEL)
end

function var_0_0.openExchangePanel(arg_16_0, arg_16_1)
	arg_16_0.exchangePanel:setVisible(arg_16_1)
end

function var_0_0.ResUISettings(arg_17_0)
	return {
		showType = bit.bor(PlayerResUI.TYPE_OIL, PlayerResUI.TYPE_GOLD)
	}
end

function var_0_0.initHomeUI(arg_18_0)
	arg_18_0.btnShop = findTF(arg_18_0._tf, "ad/btnShop")
	arg_18_0.btnPlay = findTF(arg_18_0._tf, "ad/btnPlay")

	onButton(arg_18_0, arg_18_0.btnPlay, function()
		arg_18_0.listPanel:setVisible(true)
		arg_18_0:changeTitle(true)
	end, SFX_CANCEL)
	onButton(arg_18_0, arg_18_0.btnShop, function()
		arg_18_0:emit(GameHallMediator.OPEN_GAME_SHOP)
	end, SFX_CANCEL)

	arg_18_0.topShop = findTF(arg_18_0._tf, "ad/container/content/top/btnShop")
	arg_18_0.topGame = findTF(arg_18_0._tf, "ad/container/content/top/btnGameList")

	onButton(arg_18_0, arg_18_0.topGame, function()
		arg_18_0.listPanel:setVisible(true)
		arg_18_0:changeTitle(true)
	end, SFX_CANCEL)
	onButton(arg_18_0, arg_18_0.topShop, function()
		arg_18_0:emit(GameHallMediator.OPEN_GAME_SHOP)
	end, SFX_CANCEL)
end

function var_0_0.updateUI(arg_23_0)
	local var_23_0 = getProxy(GameRoomProxy):getWeekly()

	setActive(arg_23_0.freeCoinTf, var_23_0)

	local var_23_1 = getProxy(GameRoomProxy):getCoin()

	setText(arg_23_0.textCoin, var_23_1)
end

function var_0_0.onTimer(arg_24_0)
	arg_24_0.charController:step()
end

function var_0_0.changeTitle(arg_25_0, arg_25_1)
	setActive(findTF(arg_25_0._tf, "ad/topPanel/title_list"), arg_25_1)
	setActive(findTF(arg_25_0._tf, "ad/topPanel/title_main"), not arg_25_1)
end

function var_0_0.onBackPressed(arg_26_0)
	if arg_26_0.listPanel:getVisible() then
		arg_26_0.listPanel:setVisible(false)
		arg_26_0:changeTitle(false)

		return
	end

	if arg_26_0.exchangePanel:getVisible() then
		arg_26_0.exchangePanel:setVisible(false)

		return
	end

	arg_26_0:emit(var_0_0.ON_BACK_PRESSED)
end

function var_0_0.willExit(arg_27_0)
	arg_27_0.charController:Dispose()

	if arg_27_0.timer then
		arg_27_0.timer:Stop()

		arg_27_0.timer = nil
	end

	if arg_27_0.listPanel:getVisible() then
		GameHallScene.open_with_list = true
	end

	arg_27_0.exchangePanel:dispose()
	arg_27_0.listPanel:dispose()
end

return var_0_0
