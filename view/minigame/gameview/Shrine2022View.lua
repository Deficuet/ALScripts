local var_0_0 = class("Shrine2022View", import("..BaseMiniGameView"))

function var_0_0.getUIName(arg_1_0)
	return "Shrine2022UI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:initData()
	arg_3_0:updateDataView()
	arg_3_0:updateCardList()
	arg_3_0:updateCardBuffTag()
	arg_3_0:updateCommanderBuff()
end

function var_0_0.onBackPressed(arg_4_0)
	if arg_4_0.shrineSelectShipView and arg_4_0.shrineSelectShipView:CheckState(BaseSubView.STATES.INITED) then
		arg_4_0.shrineSelectShipView:closeSelf()
	elseif arg_4_0.shrineSelectBuffView and arg_4_0.shrineSelectBuffView:CheckState(BaseSubView.STATES.INITED) then
		arg_4_0.shrineSelectBuffView:closeMySelf()
	elseif arg_4_0.shrineShipWordView and arg_4_0.shrineShipWordView:CheckState(BaseSubView.STATES.INITED) then
		arg_4_0.shrineShipWordView:closeMySelf()
	else
		arg_4_0:emit(var_0_0.ON_BACK_PRESSED)
	end
end

function var_0_0.OnSendMiniGameOPDone(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.argList
	local var_5_1 = var_5_0[1]
	local var_5_2 = var_5_0[2]

	arg_5_0:PrintLog("后端返回,游戏ID,操作类型", var_5_1, var_5_2)

	if var_5_1 == arg_5_0.commanderGameID then
		if var_5_2 == 1 then
			arg_5_0:updateDataView()
			arg_5_0:updateCommanderBuff()
		elseif var_5_2 == 2 then
			local var_5_3 = arg_5_0.playerProxy:getData()

			var_5_3:consume({
				gold = arg_5_0:GetMGData():getConfig("config_data")[1]
			})
			arg_5_0.playerProxy:updatePlayer(var_5_3)
			arg_5_0:updateDataView()
			arg_5_0:updateCommanderBuff(true)
		elseif var_5_2 == 3 then
			local var_5_4 = arg_5_0.playerProxy:getData()

			var_5_4:consume({
				gold = arg_5_0:GetMGData():getConfig("config_data")[1]
			})
			arg_5_0.playerProxy:updatePlayer(var_5_4)
		end
	elseif var_5_1 == arg_5_0.shipGameID then
		if var_5_2 == 1 then
			arg_5_0:updateDataView()
			arg_5_0:updateCommanderBuff()
		elseif var_5_2 == 2 then
			local var_5_5 = arg_5_0.playerProxy:getData()

			var_5_5:consume({
				gold = arg_5_0:getShipGameData():getConfig("config_data")[1]
			})
			arg_5_0.playerProxy:updatePlayer(var_5_5)

			local var_5_6 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SHRINE)

			if var_5_6 and not var_5_6:isEnd() then
				var_5_6.data2 = var_5_6.data2 + 1

				getProxy(ActivityProxy):updateActivity(var_5_6)
			end

			arg_5_0:SendOperator(MiniGameOPCommand.CMD_SPECIAL_GAME, {
				arg_5_0.commanderGameID,
				1
			})
			arg_5_0:updateCardList()
			arg_5_0:updateCardBuffTag()
			arg_5_0:openFakeDrop(function()
				local var_6_0 = var_5_0[5]

				arg_5_0:openShipWordView(var_6_0)
			end)
		end
	end
end

function var_0_0.OnModifyMiniGameDataDone(arg_7_0, arg_7_1)
	return
end

function var_0_0.willExit(arg_8_0)
	if arg_8_0.shrineSelectShipView and arg_8_0.shrineSelectShipView:CheckState(BaseSubView.STATES.INITED) then
		arg_8_0.shrineSelectShipView:Destroy()
	elseif arg_8_0.shrineSelectBuffView and arg_8_0.shrineSelectBuffView:CheckState(BaseSubView.STATES.INITED) then
		arg_8_0.shrineSelectBuffView:Destroy()
	elseif arg_8_0.shrineShipWordView and arg_8_0.shrineShipWordView:CheckState(BaseSubView.STATES.INITED) then
		arg_8_0.shrineShipWordView:Destroy()
	end

	arg_8_0:cleanManagedTween()
end

function var_0_0.initData(arg_9_0)
	arg_9_0.playerProxy = getProxy(PlayerProxy)
	arg_9_0.miniGameProxy = getProxy(MiniGameProxy)
	arg_9_0.commanderGameID = arg_9_0.contextData.miniGameId
	arg_9_0.shipGameID = pg.mini_game[arg_9_0.commanderGameID].simple_config_data.shipGameID
	arg_9_0.cardPosList = {
		{
			x = -447,
			y = 205
		},
		{
			x = -154,
			y = 205
		},
		{
			x = 145,
			y = 205
		},
		{
			x = 445,
			y = 205
		},
		{
			x = -299,
			y = -160
		},
		{
			x = 0,
			y = -160
		},
		{
			x = 302,
			y = -160
		}
	}

	if not arg_9_0:isInitedShipGameData() then
		arg_9_0:PrintLog("请求舰娘游戏数据", arg_9_0.shipGameID)
		arg_9_0:SendOperator(MiniGameOPCommand.CMD_SPECIAL_GAME, {
			arg_9_0.shipGameID,
			1
		})
	end

	if not arg_9_0:isInitedCommanderGameData() then
		arg_9_0:PrintLog("请求指挥官游戏数据", arg_9_0.commanderGameID)
		arg_9_0:SendOperator(MiniGameOPCommand.CMD_SPECIAL_GAME, {
			arg_9_0.commanderGameID,
			1
		})
	end
end

function var_0_0.findUI(arg_10_0)
	local var_10_0 = arg_10_0._tf:Find("Res")
	local var_10_1 = getImageSprite(var_10_0:Find("CurBuff1"))
	local var_10_2 = getImageSprite(var_10_0:Find("CurBuff2"))
	local var_10_3 = getImageSprite(var_10_0:Find("CurBuff3"))

	arg_10_0.curBuffSpriteList = {
		var_10_1,
		var_10_2,
		var_10_3
	}

	local var_10_4 = arg_10_0._tf:Find("Adapt")

	arg_10_0.tipGoldTF = var_10_4:Find("TipGold")
	arg_10_0.backBtn = var_10_4:Find("BackBtn")
	arg_10_0.helpBtn = var_10_4:Find("HelpBtn")

	local var_10_5 = arg_10_0._tf:Find("Data")

	arg_10_0.countText = var_10_5:Find("Count")
	arg_10_0.goldText = var_10_5:Find("Gold")
	arg_10_0.countText2 = var_10_5:Find("Count2")
	arg_10_0.cardTpl = arg_10_0._tf:Find("CardTpl")
	arg_10_0.cardContainer = arg_10_0._tf:Find("CardContainer")
	arg_10_0.cardUIItemList = UIItemList.New(arg_10_0.cardContainer, arg_10_0.cardTpl)
	arg_10_0.selectBuffBtn = arg_10_0._tf:Find("SelectBuffBtn")
	arg_10_0.selectBuffLight = arg_10_0._tf:Find("SelectBuffLight")
	arg_10_0.curBuffTF = arg_10_0._tf:Find("CurBuff")
	arg_10_0.curBuffImg = arg_10_0.curBuffTF:Find("BuffImg")
end

function var_0_0.addListener(arg_11_0)
	onButton(arg_11_0, arg_11_0.backBtn, function()
		arg_11_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.Pray_activity_tips1.tip
		})
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.selectBuffBtn, function()
		arg_11_0:openSelectBuffView()
	end, SFX_PANEL)
end

function var_0_0.updateDataView(arg_15_0)
	if not arg_15_0:isInitedCommanderGameData() then
		arg_15_0:PrintLog("无指挥官数据,返回")

		return
	end

	arg_15_0:PrintLog("刷新指挥官次数与金币")

	local var_15_0 = arg_15_0:GetMGData():GetRuntimeData("count")

	setText(arg_15_0.countText, var_15_0)

	local var_15_1 = arg_15_0:getShipGameData():GetRuntimeData("count")

	setText(arg_15_0.countText2, var_15_1)

	local var_15_2 = arg_15_0.playerProxy:getData().gold

	setText(arg_15_0.goldText, var_15_2)

	local var_15_3 = arg_15_0:isHaveCommanderBuff()

	setActive(arg_15_0.selectBuffLight, var_15_0 > 0 and not var_15_3)
end

function var_0_0.updateCardList(arg_16_0)
	if not arg_16_0:isInitedShipGameData() then
		arg_16_0:PrintLog("无舰娘数据,返回")

		return
	end

	arg_16_0:PrintLog("刷新舰娘显示")

	arg_16_0.cardTFList = {}

	arg_16_0.cardUIItemList:make(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == UIItemList.EventUpdate then
			local var_17_0 = arg_17_1 + 1

			arg_16_0.cardTFList[var_17_0] = arg_17_2

			arg_16_0:updateCardImg(var_17_0)
			setLocalPosition(arg_17_2, arg_16_0.cardPosList[var_17_0])

			local var_17_1 = arg_17_2:Find("Empty")

			onButton(arg_16_0, var_17_1, function()
				arg_16_0:openSelectShipView(var_17_0)
			end, SFX_PANEL)

			local var_17_2 = arg_17_2:Find("Ship")

			onButton(arg_16_0, var_17_2, function()
				local var_19_0 = arg_16_0:getSelectedShipByCardIndex(var_17_0)

				arg_16_0:openShipWordView(var_19_0)
			end, SFX_PANEL)
		end
	end)

	local var_16_0 = arg_16_0:getShipGameData():GetRuntimeData("count")
	local var_16_1 = arg_16_0:getSelectedShipCount()
	local var_16_2 = #arg_16_0:getShipGameData():getConfig("config_data")[2]
	local var_16_3 = var_16_2 < var_16_0 + var_16_1 and var_16_2 or var_16_0 + var_16_1

	arg_16_0:PrintLog("舰娘次数相关", var_16_0, var_16_1, var_16_3)
	arg_16_0.cardUIItemList:align(var_16_3)
end

function var_0_0.updateCardImg(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.cardTFList[arg_20_1]
	local var_20_1 = var_20_0:Find("Empty")
	local var_20_2 = var_20_0:Find("Ship")
	local var_20_3 = arg_20_0:getSelectedShipByCardIndex(arg_20_1)

	if var_20_3 > 0 then
		local var_20_4 = "shipcard_" .. var_20_3
		local var_20_5 = "Shrine2022/" .. var_20_4

		setImageSprite(var_20_2, LoadSprite(var_20_5, var_20_4), true)
	end

	setActive(var_20_1, var_20_3 == 0)
	setActive(var_20_2, var_20_3 > 0)
end

function var_0_0.updateCardSelecting(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.cardTFList[arg_21_1]:Find("Selecting")

	setActive(var_21_0, arg_21_2)
end

function var_0_0.updateCardBuffTag(arg_22_0)
	if not arg_22_0:isInitedShipGameData() then
		arg_22_0:PrintLog("无舰娘数据,返回")

		return
	end

	arg_22_0:PrintLog("刷新舰娘BuffTtag")

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.cardTFList) do
		local var_22_0 = iter_22_1:Find("Ship/Buff")

		setActive(var_22_0, false)
	end

	local var_22_1 = arg_22_0.playerProxy:getData().buff_list
	local var_22_2 = arg_22_0:getShipGameData():getConfig("config_data")[2]
	local var_22_3

	for iter_22_2, iter_22_3 in ipairs(var_22_1) do
		local var_22_4 = table.indexof(var_22_2, iter_22_3.id, 1)

		if var_22_4 then
			if pg.TimeMgr.GetInstance():GetServerTime() < iter_22_3.timestamp then
				local var_22_5 = arg_22_0:getCardIndexByShip(var_22_4)
				local var_22_6 = arg_22_0.cardTFList[var_22_5]:Find("Ship/Buff")

				setActive(var_22_6, true)

				break
			end

			local var_22_7

			break
		end
	end
end

function var_0_0.updateCommanderBuff(arg_23_0, arg_23_1)
	if not arg_23_0:isInitedCommanderGameData() then
		arg_23_0:PrintLog("无指挥官数据,返回")

		return
	end

	arg_23_0:PrintLog("刷新指挥官Buff")

	local var_23_0 = arg_23_0.playerProxy:getData().buff_list
	local var_23_1 = arg_23_0:GetMGData():getConfig("config_data")[2]
	local var_23_2

	for iter_23_0, iter_23_1 in ipairs(var_23_0) do
		var_23_2 = table.indexof(var_23_1, iter_23_1.id, 1)

		if var_23_2 then
			if pg.TimeMgr.GetInstance():GetServerTime() < iter_23_1.timestamp then
				setImageSprite(arg_23_0.curBuffImg, arg_23_0.curBuffSpriteList[var_23_2])
				setActive(arg_23_0.curBuffTF, true)

				break
			end

			var_23_2 = nil

			break
		end
	end

	if not var_23_2 then
		setActive(arg_23_0.curBuffTF, false)
	elseif arg_23_1 then
		local var_23_3 = 160
		local var_23_4 = -70
		local var_23_5 = 0.5
		local var_23_6 = {
			x = rtf(arg_23_0.curBuffTF).localPosition.x,
			y = var_23_3
		}

		setLocalPosition(arg_23_0.curBuffTF, var_23_6)
		arg_23_0:managedTween(LeanTween.value, nil, go(arg_23_0.curBuffTF), 0, 1, var_23_5):setEase(LeanTweenType.easeOutBack):setOnUpdate(System.Action_float(function(arg_24_0)
			local var_24_0 = var_23_3 + (var_23_4 - var_23_3) * arg_24_0

			var_23_6.y = var_24_0

			setAnchoredPosition(arg_23_0.curBuffTF, var_23_6)
		end))
	end
end

function var_0_0.openSelectShipView(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.playerProxy:getData()

	if arg_25_0:getShipGameData():getConfig("config_data")[1] > var_25_0.gold then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	arg_25_0:updateCardSelecting(arg_25_1, true)
	setActive(arg_25_0.tipGoldTF, false)

	local var_25_1 = {
		shipGameID = arg_25_0.shipGameID,
		selectingCardIndex = arg_25_1,
		onClose = function()
			arg_25_0:updateCardSelecting(arg_25_1, false)
			setActive(arg_25_0.tipGoldTF, true)

			local var_26_0 = arg_25_0.cardTFList[arg_25_1]
			local var_26_1 = var_26_0:Find("Empty")
			local var_26_2 = var_26_0:Find("Ship")

			setActive(var_26_1, true)
			setActive(var_26_2, false)
		end,
		onSelect = function(arg_27_0)
			local var_27_0 = arg_25_0.cardTFList[arg_25_1]
			local var_27_1 = var_27_0:Find("Empty")
			local var_27_2 = var_27_0:Find("Ship")
			local var_27_3 = "shipcard_" .. arg_27_0
			local var_27_4 = "Shrine2022/" .. var_27_3

			setImageSprite(var_27_2, LoadSprite(var_27_4, var_27_3), true)
			setActive(var_27_1, false)
			setActive(var_27_2, true)
		end,
		onConfirm = function(arg_28_0)
			local var_28_0 = arg_25_0:getShipGameData()

			if var_28_0:GetRuntimeData("count") <= 0 then
				arg_25_0:PrintLog("Error, count <= 0")
			else
				local var_28_1 = var_28_0:getConfig("config_data")[2][arg_28_0]

				arg_25_0:PrintLog("发送选船操作", arg_25_0.shipGameID, 2, var_28_1, arg_25_1, arg_28_0)
				arg_25_0:SendOperator(MiniGameOPCommand.CMD_SPECIAL_GAME, {
					arg_25_0.shipGameID,
					2,
					var_28_1,
					arg_25_1,
					arg_28_0
				})
			end
		end
	}

	arg_25_0.shrineSelectShipView = Shrine2022SelectShipView.New(arg_25_0._tf.parent, arg_25_0.event, var_25_1)

	arg_25_0.shrineSelectShipView:Reset()
	arg_25_0.shrineSelectShipView:Load()
end

function var_0_0.openSelectBuffView(arg_29_0)
	local var_29_0 = arg_29_0.playerProxy:getData()

	if arg_29_0:GetMGData():getConfig("config_data")[1] > var_29_0.gold then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	if arg_29_0:GetMGData():GetRuntimeData("count") <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("pray_cant_tips"))

		return
	end

	local var_29_1 = {
		onClose = function()
			return
		end,
		onSelect = function(arg_31_0)
			local var_31_0 = arg_29_0:GetMGData()

			if var_31_0:GetRuntimeData("count") <= 0 then
				arg_29_0:PrintLog("Error, count <= 0")
			else
				local var_31_1 = var_31_0:getConfig("config_data")[2][arg_31_0]

				arg_29_0:PrintLog("发送选Buff操作", arg_29_0.commanderGameID, 2, var_31_1)
				arg_29_0:SendOperator(MiniGameOPCommand.CMD_SPECIAL_GAME, {
					arg_29_0.commanderGameID,
					2,
					var_31_1
				})
			end
		end
	}

	arg_29_0.shrineSelectBuffView = Shrine2022SelectBuffView.New(arg_29_0._tf.parent, arg_29_0.event, var_29_1)

	arg_29_0.shrineSelectBuffView:Reset()
	arg_29_0.shrineSelectBuffView:Load()
end

function var_0_0.openShipWordView(arg_32_0, arg_32_1)
	local var_32_0 = {
		curSelectShip = arg_32_1
	}

	arg_32_0.shrineShipWordView = Shrine2022ShipWordView.New(arg_32_0._tf, arg_32_0.event, var_32_0)

	arg_32_0.shrineShipWordView:Reset()
	arg_32_0.shrineShipWordView:Load()
end

function var_0_0.openFakeDrop(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0:getShipGameData():getConfig("simple_config_data")
	local var_33_1 = {
		type = var_33_0[1],
		id = var_33_0[2],
		count = var_33_0[3]
	}

	LoadContextCommand.LoadLayerOnTopContext(Context.New({
		mediator = AwardInfoMediator,
		viewComponent = AwardInfoLayer,
		data = {
			items = {
				var_33_1
			}
		},
		onRemoved = function()
			if arg_33_1 then
				arg_33_1()
			end
		end
	}))
end

function var_0_0.isInitedCommanderGameData(arg_35_0)
	if not arg_35_0:GetMGData():GetRuntimeData("isInited") then
		return false
	else
		return true
	end
end

function var_0_0.isInitedShipGameData(arg_36_0)
	if not arg_36_0:getShipGameData():GetRuntimeData("isInited") then
		return false
	else
		return true
	end
end

function var_0_0.isHaveCommanderBuff(arg_37_0)
	local var_37_0 = arg_37_0.playerProxy:getData().buff_list
	local var_37_1 = arg_37_0:GetMGData():getConfig("config_data")[2]
	local var_37_2

	for iter_37_0, iter_37_1 in ipairs(var_37_0) do
		var_37_2 = table.indexof(var_37_1, iter_37_1.id, 1)

		if var_37_2 then
			if pg.TimeMgr.GetInstance():GetServerTime() < iter_37_1.timestamp then
				return var_37_2
			else
				return nil
			end
		end
	end

	return var_37_2
end

function var_0_0.getSelectedShipByCardIndex(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0:getShipGameData():GetRuntimeData("kvpElements")[1]

	for iter_38_0, iter_38_1 in ipairs(var_38_0) do
		if iter_38_1.key == arg_38_1 then
			return iter_38_1.value
		end
	end

	return 0
end

function var_0_0.getCardIndexByShip(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0:getShipGameData():GetRuntimeData("kvpElements")[1]

	for iter_39_0, iter_39_1 in ipairs(var_39_0) do
		if iter_39_1.value == arg_39_1 then
			return iter_39_1.key
		end
	end

	return 0
end

function var_0_0.getSelectedShipCount(arg_40_0)
	local var_40_0 = 0

	return #arg_40_0:getShipGameData():GetRuntimeData("kvpElements")[1]
end

function var_0_0.getShipGameData(arg_41_0)
	return arg_41_0.miniGameProxy:GetMiniGameData(arg_41_0.shipGameID)
end

function var_0_0.PrintLog(arg_42_0, ...)
	if IsUnityEditor then
		print(...)
	end
end

function var_0_0.IsNeedShowTipWithoutActivityFinalReward()
	local var_43_0 = false
	local var_43_1 = getProxy(MiniGameProxy):GetMiniGameDataByType(MiniGameConst.MG_TYPE_3)

	if var_43_1 then
		var_43_0 = (var_43_1:GetRuntimeData("count") or 0) > 0
	end

	local var_43_2
	local var_43_3 = getProxy(MiniGameProxy):GetMiniGameDataByType(MiniGameConst.MG_TYPE_3)

	if var_43_3 then
		local var_43_4 = getProxy(PlayerProxy):getData()
		local var_43_5 = var_43_3:getConfig("config_data")[2]

		for iter_43_0, iter_43_1 in ipairs(var_43_4.buff_list) do
			var_43_2 = table.indexof(var_43_5, iter_43_1.id, 1)

			if var_43_2 then
				if pg.TimeMgr.GetInstance():GetServerTime() > iter_43_1.timestamp then
					var_43_2 = nil
				end

				break
			end
		end
	end

	if var_43_2 then
		var_43_0 = false
	end

	local var_43_6 = false
	local var_43_7 = getProxy(MiniGameProxy):GetMiniGameDataByType(MiniGameConst.MG_TYPE_5)

	if var_43_7 then
		var_43_6 = (var_43_7:GetRuntimeData("count") or 0) > 0
	end

	local var_43_8
	local var_43_9 = getProxy(MiniGameProxy):GetMiniGameDataByType(MiniGameConst.MG_TYPE_5)

	if var_43_9 then
		local var_43_10 = getProxy(PlayerProxy):getData()
		local var_43_11 = var_43_9:getConfig("config_data")[2]

		for iter_43_2, iter_43_3 in ipairs(var_43_10.buff_list) do
			var_43_8 = table.indexof(var_43_11, iter_43_3.id, 1)

			if var_43_8 then
				if pg.TimeMgr.GetInstance():GetServerTime() > iter_43_3.timestamp then
					var_43_8 = nil
				end

				break
			end
		end
	end

	if var_43_8 then
		var_43_6 = false
	end

	return var_43_0 or var_43_6
end

return var_0_0
