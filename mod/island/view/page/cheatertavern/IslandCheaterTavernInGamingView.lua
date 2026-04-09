local var_0_0 = class("IslandCheaterTavernInGamingView", import(".IslandCheaterTavernBaseView"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)
end

local var_0_1 = {
	129,
	-52
}
local var_0_2 = {
	{
		-406,
		205
	},
	{
		243,
		356
	},
	{
		406,
		152
	}
}
local var_0_3 = {
	{
		-741,
		197
	},
	{
		-209.9,
		400
	},
	{
		680,
		300
	}
}

function var_0_0.Init(arg_2_0)
	arg_2_0.super.Init(arg_2_0)

	arg_2_0.playerHudTFDic = {}
	arg_2_0.uiplayerHudInfoList = UIItemList.New(arg_2_0.uiplayerInfoList, arg_2_0.uiplayerInfoItem)

	arg_2_0.uiplayerHudInfoList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventInit then
			arg_2_0:OnInitPlayerHudInfoItem(arg_3_1, arg_3_2)
		elseif arg_3_0 == UIItemList.EventUpdate then
			arg_2_0:OnUpdatePlayerHudInfoItem(arg_3_1, arg_3_2)
		end
	end)
	arg_2_0.uiplayerHudInfoList:each(function(arg_4_0, arg_4_1)
		arg_2_0:OnInitPlayerHudInfoItem(arg_4_0, arg_4_1)
	end)

	local var_2_0 = pg.gameset.bar_punishment_limit.key_value

	setText(arg_2_0.uicurHpNum, string.format("%s/%s", var_2_0, var_2_0))
	onButton(arg_2_0, arg_2_0.uiqueryBtn, function()
		arg_2_0:emit(IslandMediator.CHEATER_TAVERN_OPERATE, IslandCheaterTavernConst.PlayerOperateType.Query)
	end)

	local var_2_1 = GetOrAddComponent(arg_2_0.uishootBtn, "EventTriggerListener")
	local var_2_2 = 10

	var_2_1:AddPointDownFunc(function(arg_6_0, arg_6_1)
		startPos = arg_6_1.position
		hasTriggered = false
	end)
	var_2_1:AddDragFunc(function(arg_7_0, arg_7_1)
		if hasTriggered or not startPos then
			return
		end

		if (arg_7_1.position - startPos).magnitude >= var_2_2 then
			hasTriggered = true

			arg_2_0:emit(IslandMediator.CHEATER_TAVERN_OPERATE, IslandCheaterTavernConst.PlayerOperateType.Shoot)
		end
	end)
	var_2_1:AddPointUpFunc(function(arg_8_0, arg_8_1)
		startPos = nil
	end)
	onButton(arg_2_0, arg_2_0.uiDelegate, function()
		arg_2_0:emit(IslandMediator.CHEATER_TAVERN_CANCEL_DELEGATE)
	end)
	onButton(arg_2_0, arg_2_0.uiputCardBtn, function()
		local var_10_0 = arg_2_0.cardViewManager:GetSelectCardKeyList()

		if IslandCheaterTavernConst.putCardTest then
			arg_2_0.cardViewManager:PutDownMainCard(var_10_0)

			return
		end

		local var_10_1 = #var_10_0

		if var_10_1 == 0 or var_10_1 > IslandCheaterTavernConst.putCountMax then
			return
		end

		arg_2_0:emit(IslandMediator.CHEATER_TAVERN_OPERATE, IslandCheaterTavernConst.PlayerOperateType.PutCard, var_10_0)
	end)

	arg_2_0.timeMgr = pg.TimeMgr.GetInstance()
	arg_2_0.cardViewManager = IslandCheaterTavernCardViewManager.New(arg_2_0.uicardList)

	local var_2_3 = PlayRoomTools.GetPtScrore(PlayRoomTools.GetGameTypeID())

	setText(arg_2_0.uiScoreNum, var_2_3)
	setText(arg_2_0.uireakCardbgText, i18n("bar_ui_start2"))
	setText(arg_2_0.uireakCardTipText, i18n("bar_ui_start1"))
	setText(arg_2_0.uiScoreTitle, i18n("bar_ui_game3"))
	setText(arg_2_0.uishootText, i18n("bar_ui_game4"))
	setText(arg_2_0.uiOutText, i18n("bar_ui_game1"))
	setActive(arg_2_0.uiTipsTf, false)
	setParent(arg_2_0.uiTipsTf, pg.UIMgr.GetInstance().OverlayToast)
end

function var_0_0.OnCheaterOperateDone(arg_11_0, arg_11_1)
	if arg_11_1.type == IslandCheaterTavernConst.PlayerOperateType.PutCard then
		setActive(arg_11_0.uiopBtn, false)
		arg_11_0:PutMainCardDone(arg_11_1.arg_list)
	elseif arg_11_1.type == IslandCheaterTavernConst.PlayerOperateType.Shoot then
		setActive(arg_11_0.uishootOp, false)
	else
		setActive(arg_11_0.uiopBtn, false)
	end
end

function var_0_0.PutMainCardDone(arg_12_0, arg_12_1)
	arg_12_0.cardViewManager:PutDownMainCard(arg_12_1)

	arg_12_0.cardDataList = arg_12_0.cheaterTavernAgency:GetMainPlayerCards()

	arg_12_0.cardViewManager:RefreshMainCard(arg_12_0.cardDataList)
end

function var_0_0.StartLastBountPerformTimer(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_1 <= 0 then
		existCall(arg_13_2)

		return
	end

	arg_13_0.lastBountPerformTimer = Timer.New(function()
		existCall(arg_13_2)
	end, arg_13_1, 1)

	arg_13_0.lastBountPerformTimer:Start()
end

function var_0_0.StopLastBountPerformTimer(arg_15_0)
	if arg_15_0.lastBountPerformTimer then
		arg_15_0.lastBountPerformTimer:Stop()

		arg_15_0.lastBountPerformTimer = nil
	end
end

function var_0_0.HideCurrentBoutCoundDown(arg_16_0)
	setActive(arg_16_0.uicountDown, false)
	arg_16_0:StopRoundCoundDown()
end

function var_0_0.UpdataLastBoutDisplay(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_1.user_id
	local var_17_1 = 0
	local var_17_2
	local var_17_3 = var_17_0 == getProxy(PlayerProxy):getRawData().id
	local var_17_4 = var_17_3 and arg_17_0.cheaterTavernAgency:GetMainPlayer() or arg_17_0.cheaterTavernAgency:GetPlayerData(var_17_0)
	local var_17_5 = getProxy(PlayerProxy):getRawData().id

	local function var_17_6()
		if var_17_3 then
			setActive(arg_17_0.uiopBtn, false)
		end
	end

	switch(arg_17_1.type, {
		[IslandCheaterTavernConst.PlayerOperateType.PutCard] = function()
			var_17_6()
			arg_17_0.cardViewManager:ClearTableCard()

			if var_17_3 then
				if arg_17_2 then
					arg_17_0.cardViewManager:PutDownMainCard(arg_17_2)

					arg_17_0.cardDataList = arg_17_0.cheaterTavernAgency:GetMainPlayerCards()

					arg_17_0.cardViewManager:RefreshMainCard(arg_17_0.cardDataList)
				end
			else
				local var_19_0 = arg_17_1.return_list[2]

				arg_17_0.cardViewManager:OtherPlayerPutCard(var_17_0, var_19_0)
			end

			arg_17_0.tableCardNum = arg_17_1.return_list[2]
		end,
		[IslandCheaterTavernConst.PlayerOperateType.Query] = function()
			var_17_6()

			arg_17_0.tableCardNum = 0
			arg_17_0.deskCardList = {}

			local var_20_0 = arg_17_1.return_list[1]

			setActive(arg_17_0.uiqueryEffect, true)

			local var_20_1

			if var_17_3 then
				setAnchoredPosition(arg_17_0.uiqueryEffect, Vector2(var_0_1[1], var_0_1[2]))
			else
				local var_20_2 = arg_17_0.playerUserIndexDic[var_17_0]

				setAnchoredPosition(arg_17_0.uiqueryEffect, Vector2(var_0_2[var_20_2][1], var_0_2[var_20_2][2]))
			end

			local var_20_3

			if var_17_3 then
				var_20_3 = var_17_4.seat

				local var_20_4 = "questSeet0" .. var_20_3

				CheatTavernCameraMgr.instance:ActiveVirtualCamera(var_20_4)
				onNextTick(function()
					arg_17_0:UpdatePlayerHudInfo()
				end)
			else
				arg_17_0.cardViewManager:PlayerCardSetActive(var_17_0, false)
			end

			arg_17_0.parent:emitCore(CheaterTavernEvent.PLAYER_QUESTION_ANIMATION, var_17_0, var_17_3, var_20_3)

			local function var_20_5()
				if var_17_3 then
					local var_22_0 = "lookSeet0" .. var_20_3

					CheatTavernCameraMgr.instance:ActiveVirtualCamera(var_22_0)
					onNextTick(function()
						arg_17_0:UpdatePlayerHudInfo()
					end)
				else
					arg_17_0.cardViewManager:PlayerCardSetActive(var_17_0, true)
				end

				setActive(arg_17_0.uiqueryEffect, false)

				local var_22_1 = arg_17_0.cheaterTavernAgency:GetMainPlayer().seat
				local var_22_2 = "shootSeet0" .. var_22_1

				CheatTavernCameraMgr.instance:ActiveVirtualCamera(var_22_2)
				arg_17_0.cardViewManager:PlayerCardSetActive(var_17_5, false)

				local var_22_3 = {}
				local var_22_4 = #arg_17_1.return_list

				for iter_22_0 = 2, var_22_4 do
					table.insert(var_22_3, arg_17_1.return_list[iter_22_0])
				end

				arg_17_0.cardViewManager:FlipTableCard(var_22_3)
			end

			local function var_20_6()
				local var_24_0 = var_20_0 == 1 and "bar_tips_game1" or "bar_tips_game2"
				local var_24_1 = arg_17_0.cheaterTavernAgency:GetPlayerData(var_17_0):GetName()
				local var_24_2 = arg_17_0.cheaterTavernAgency:GetPlayerData(arg_17_1.next_user_id):GetName()

				arg_17_0:ShowTips(i18n(var_24_0, var_24_1), i18n("bar_tips_game5", var_20_0 == 1 and var_24_2 or var_24_1))
			end

			if arg_17_0.questionTimer then
				arg_17_0.questionTimer:Stop()
			end

			arg_17_0.questionTimer = Timer.New(function()
				var_20_5()
			end, 2, 1)

			if arg_17_0.tipsTimer then
				arg_17_0.tipsTimer:Stop()
			end

			arg_17_0.tipsTimer = Timer.New(function()
				var_20_6()
			end, 3.5, 1)

			arg_17_0.questionTimer:Start()
			arg_17_0.tipsTimer:Start()

			var_17_1 = pg.gameset.bar_question_time.key_value

			function var_17_2()
				setActive(arg_17_0.uiTipsTf, false)
			end
		end,
		[IslandCheaterTavernConst.PlayerOperateType.Shoot] = function()
			var_17_6()

			if var_17_3 then
				setActive(arg_17_0.uishootOp, false)
			end

			arg_17_0.cardViewManager:ClearTableCard()

			local var_28_0 = arg_17_1.return_list[2]
			local var_28_1 = arg_17_0.cheaterTavernAgency:GetMainPlayer().seat
			local var_28_2, var_28_3 = var_17_4:GetCurrentBombId()
			local var_28_4 = var_17_4.seat

			arg_17_0.parent:emitCore(CheaterTavernEvent.SHOOT_AND_TURN_TABLE, var_17_3, var_28_4, var_28_2, var_28_3, var_28_0 == 1)

			var_17_1 = pg.gameset.bar_punishment_turntable_time.key_value

			function var_17_2()
				local var_29_0 = "lookSeet0" .. var_28_1

				CheatTavernCameraMgr.instance:ActiveVirtualCamera(var_29_0)
				arg_17_0.cardViewManager:PlayerCardSetActive(var_17_5, true)

				local var_29_1 = var_17_4:GetName()
				local var_29_2 = var_28_0 == 1 and "bar_tips_game3" or "bar_tips_game4"

				arg_17_0:ShowTips(i18n(var_29_2, var_29_1))

				if var_28_0 == 1 then
					if var_17_3 then
						arg_17_0.cardViewManager:DestroyMainCard()
					else
						arg_17_0.cardViewManager:OtherPlayerCardDestroy(var_17_0)
					end

					local var_29_3 = var_17_4.seat

					arg_17_0.parent:emitCore(CheaterTavernEvent.PLAYER_OUT_ANIMATION, var_17_0, var_29_3, var_17_0 == getProxy(PlayerProxy):getRawData().id)
				end

				local var_29_4 = arg_17_0.playerUserIndexDic[var_17_0]

				if var_29_4 then
					local var_29_5 = arg_17_0.playerHudTFDic[var_29_4]

					if var_28_0 == 1 then
						local var_29_6 = arg_17_0.playerList[var_29_4]:IsOut()

						setActive(var_29_5:Find("out"), var_29_6)
					end
				end

				onNextTick(function()
					arg_17_0:UpdatePlayerHudInfo()
				end)
			end
		end
	}, function()
		return
	end)

	return var_17_1, var_17_2
end

function var_0_0.UpdateCurrentBoutDisplay(arg_32_0, arg_32_1)
	local var_32_0 = {
		user_id = arg_32_1.next_user_id
	}

	if var_32_0.user_id == 0 then
		return
	end

	local var_32_1

	if arg_32_1.next_type == 1 then
		var_32_1 = IslandCheaterTavernConst.PlayerCurrentOperateType.PutCardOrQuery
	elseif arg_32_1.next_type == 2 then
		var_32_1 = IslandCheaterTavernConst.PlayerCurrentOperateType.ShootByOther
	else
		var_32_1 = IslandCheaterTavernConst.PlayerCurrentOperateType.ShootByOwn
	end

	if var_32_1 >= IslandCheaterTavernConst.PlayerCurrentOperateType.ShootByOther then
		local var_32_2, var_32_3 = arg_32_0.cheaterTavernAgency:GetPlayerData(var_32_0.user_id):GetCurrentAndAllHp()

		if var_32_2 ~= var_32_3 then
			return
		end
	end

	var_32_0.operationType = var_32_1
	var_32_0.auto_time = arg_32_1.auto_time

	arg_32_0:UpdateOneBout(var_32_0)
end

function var_0_0.OnCheaterOperateDoneNotify(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_1.data
	local var_33_1 = arg_33_1.putCard

	arg_33_0:HideCurrentBoutCoundDown()

	local var_33_2, var_33_3 = arg_33_0:UpdataLastBoutDisplay(var_33_0, var_33_1)

	local function var_33_4()
		existCall(var_33_3)
		arg_33_0:UpdateCurrentBoutDisplay(var_33_0)
	end

	arg_33_0:StopLastBountPerformTimer()
	arg_33_0:StartLastBountPerformTimer(var_33_2, var_33_4)
end

function var_0_0.Show(arg_35_0)
	return
end

function var_0_0.OnInitPlayerHudInfoItem(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = tf(arg_36_2)

	arg_36_0.playerHudTFDic[arg_36_1 + 1] = var_36_0

	setActive(var_36_0:Find("out"), false)
	setText(var_36_0:Find("out/outText"), i18n("bar_ui_game1"))

	local var_36_1 = pg.gameset.bar_punishment_limit.key_value

	setText(var_36_0:Find("hp/hpNum"), string.format("%s/%s", var_36_1, var_36_1))
	setActive(arg_36_0.uiOutGo, false)
	setActive(arg_36_0.uiHpGo, true)
end

function var_0_0.OnUpdatePlayerHudInfoItem(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = tf(arg_37_2)
	local var_37_1 = arg_37_1 + 1
	local var_37_2 = arg_37_0.playerList[var_37_1]
	local var_37_3 = var_37_2.seat
	local var_37_4 = 10110000 + var_37_3
	local var_37_5 = pg.island_world_objects[var_37_4]
	local var_37_6 = var_37_5.param.position[1]
	local var_37_7 = var_37_5.param.position[3]
	local var_37_8 = {
		1,
		0,
		-1,
		0
	}
	local var_37_9 = {
		0,
		-1,
		0,
		1
	}
	local var_37_10 = 2
	local var_37_11 = var_37_6 + var_37_8[var_37_3] * var_37_10
	local var_37_12 = var_37_7 + var_37_9[var_37_3] * var_37_10
	local var_37_13 = arg_37_0.cheaterTavernAgency:GetMainPlayer().seat
	local var_37_14 = 0

	if math.abs(var_37_13 - var_37_3) == 2 then
		var_37_14 = 0.3
	end

	local var_37_15 = Vector3(var_37_11, IslandCheaterTavernConst.hudHeight + var_37_14, var_37_12)

	var_37_0.localPosition = arg_37_0:WorldPosition2LocalPosition(arg_37_0.uiplayerInfoList, var_37_15)

	setText(var_37_0:Find("adapt/name"), tostring(var_37_2.player_info.name))

	local var_37_16, var_37_17 = var_37_2:GetCurrentAndAllHp()

	setText(var_37_0:Find("hp/hpNum"), var_37_16 .. "/" .. var_37_17)

	local var_37_18 = arg_37_0.operation and arg_37_0.operation.user_id == var_37_2.user_id

	setActive(var_37_0:Find("in_process"), var_37_18)

	local var_37_19 = var_37_2:IsOut()

	setActive(var_37_0:Find("hp"), not var_37_19)
	setActive(var_37_0:Find("adapt/delegate"), var_37_2:IsDelegate())
end

function var_0_0.StartRounCountDown(arg_38_0, arg_38_1)
	arg_38_0:StopRoundCoundDown()

	arg_38_0.randCoundDownTimer = Timer.New(function()
		local var_39_0 = arg_38_1 - arg_38_0.timeMgr:GetServerTime()

		setActive(arg_38_0.uiFirstTimeImg, true)
		setActive(arg_38_0.uiSecondTimeImg, true)

		if var_39_0 < 0 then
			var_39_0 = 0

			setImageSprite(arg_38_0.uiFirstTimeImg, arg_38_0.parent:GetNumSpriteByIndex(0), true)
			setImageSprite(arg_38_0.uiSecondTimeImg, arg_38_0.parent:GetNumSpriteByIndex(0), true)
			arg_38_0:StopRoundCoundDown()

			return
		end

		local var_39_1 = math.floor(var_39_0 % 60)
		local var_39_2 = math.floor(var_39_1 / 10)
		local var_39_3 = var_39_1 % 10

		if var_39_2 <= 0 then
			setActive(arg_38_0.uiFirstTimeImg, false)
			setImageSprite(arg_38_0.uiSecondTimeImg, arg_38_0.parent:GetNumSpriteByIndex(var_39_3), true)

			return
		end

		setImageSprite(arg_38_0.uiFirstTimeImg, arg_38_0.parent:GetNumSpriteByIndex(var_39_2), true)
		setImageSprite(arg_38_0.uiSecondTimeImg, arg_38_0.parent:GetNumSpriteByIndex(var_39_3), true)
	end, 1, -1)

	arg_38_0.randCoundDownTimer.func()
	arg_38_0.randCoundDownTimer:Start()
end

function var_0_0.StopRoundCoundDown(arg_40_0)
	if arg_40_0.randCoundDownTimer then
		arg_40_0.randCoundDownTimer:Stop()
	end
end

function var_0_0.RemoveRealCardTipShowTime(arg_41_0)
	if arg_41_0.realCardTipShowTimer then
		arg_41_0.realCardTipShowTimer:Stop()
	end
end

function var_0_0.OnCheaterEveryRoundStart(arg_42_0)
	arg_42_0.tableCardNum = 0

	local var_42_0 = arg_42_0.cheaterTavernAgency:GetMainPlayer()

	arg_42_0.cardViewManager:SetMainPlayerSeat(var_42_0.seat)
	arg_42_0:SetActiveState(false)
	setActive(arg_42_0.uiRondRealCardTips, false)
	setActive(arg_42_0.uiputCardDestList, false)
	setActive(arg_42_0.uiqueryEffect, false)
	setActive(arg_42_0.uicountDown, false)
	setActive(arg_42_0.uiDelegate, false)
	arg_42_0:StopLastBountPerformTimer()
end

function var_0_0.OnCheaterEveryRoundStartDone(arg_43_0, arg_43_1)
	arg_43_0:HideCurrentBoutCoundDown()
	arg_43_0:SetActiveState(true)
	setActive(arg_43_0.uiRondRealCardTips, true)

	local var_43_0 = arg_43_0.cheaterTavernAgency:GetRealCard()
	local var_43_1 = pg.bar_card[var_43_0]

	GetImageSpriteFromAtlasAsync("Island/IslandCheaterTavernIcon/" .. var_43_1.card_res, "", arg_43_0.uirealCard)
	GetImageSpriteFromAtlasAsync("Island/IslandCheaterTavernIcon/" .. var_43_1.card_res, "", arg_43_0.uirealCardTip)
	arg_43_0:RemoveRealCardTipShowTime()

	local var_43_2 = pg.gameset.bar_refreshcard_time.key_value

	arg_43_0.realCardTipShowTimer = Timer.New(function()
		setActive(arg_43_0.uiRondRealCardTips, false)
		arg_43_0:UpdateOneBout(arg_43_1)
	end, var_43_2, 1)

	arg_43_0.realCardTipShowTimer:Start()
	arg_43_0:ResetBountOp()
	arg_43_0:InitPlayerHudInfo()
	arg_43_0:InitMainCard()
	arg_43_0:InitOtherPlayerCard()
	arg_43_0:UpdateDelegateState()
end

function var_0_0.OnCheaterReconected(arg_45_0, arg_45_1)
	setActive(arg_45_0.uiRondRealCardTips, false)

	arg_45_0.tableCardNum = 0

	local var_45_0 = arg_45_0.cheaterTavernAgency:GetMainPlayer()

	arg_45_0.cardViewManager:SetMainPlayerSeat(var_45_0.seat)
	arg_45_0:SetActiveState(true)
	arg_45_0:HideCurrentBoutCoundDown()

	local var_45_1 = arg_45_0.cheaterTavernAgency:GetRealCard()
	local var_45_2 = pg.bar_card[var_45_1]

	GetImageSpriteFromAtlasAsync("Island/IslandCheaterTavernIcon/" .. var_45_2.card_res, "", arg_45_0.uirealCard)
	GetImageSpriteFromAtlasAsync("Island/IslandCheaterTavernIcon/" .. var_45_2.card_res, "", arg_45_0.uirealCardTip)
	arg_45_0:ResetBountOp()
	arg_45_0:InitPlayerHudInfo()
	arg_45_0:InitMainCard()
	arg_45_0:InitOtherPlayerCard()
	arg_45_0:UpdateDelegateState()
	arg_45_0:UpdateOneBout(arg_45_1)
end

function var_0_0.InitMainCard(arg_46_0)
	arg_46_0.cardDataList = arg_46_0.cheaterTavernAgency:GetMainPlayerCards()

	arg_46_0.cardViewManager:DestroyMainCard()
	arg_46_0.cardViewManager:InitMainCard(arg_46_0.cardDataList)
end

function var_0_0.InitPlayerHudInfo(arg_47_0)
	arg_47_0.playerList, arg_47_0.playerUserIndexDic = arg_47_0.cheaterTavernAgency:GetPlayerList()
end

function var_0_0.InitOtherPlayerCard(arg_48_0)
	arg_48_0.cardViewManager:InitOtherPlayerCard(arg_48_0.playerList)
end

function var_0_0.UpdatePlayerHudInfo(arg_49_0)
	arg_49_0.uiplayerHudInfoList:align(#arg_49_0.playerList)
end

function var_0_0.ResetBountOp(arg_50_0)
	setActive(arg_50_0.uiopBtn, false)
	setActive(arg_50_0.uishootOp, false)
end

function var_0_0.UpdateOneBout(arg_51_0, arg_51_1)
	setActive(arg_51_0.uiopBtn, false)
	setActive(arg_51_0.uishootOp, false)

	arg_51_0.operation = arg_51_1

	arg_51_0:UpdatePlayerHudInfo()
	arg_51_0:UpdataHp()

	if IslandCheaterTavernConst.putCardTest then
		setActive(arg_51_0.uiopBtn, true)
		setActive(arg_51_0.uiopBtn:Find("putCard"), true)

		return
	end

	setActive(arg_51_0.uicountDown, true)
	arg_51_0:StartRounCountDown(arg_51_1.auto_time)

	if not arg_51_0:IsSelf(arg_51_1.user_id) then
		return
	end

	if arg_51_1.operationType >= IslandCheaterTavernConst.PlayerCurrentOperateType.ShootByOther then
		local var_51_0 = arg_51_0.cheaterTavernAgency:GetMainPlayer()
		local var_51_1, var_51_2 = var_51_0:GetCurrentAndAllHp()

		if var_51_1 == var_51_2 then
			arg_51_0.cardViewManager:ClearTableCard()
			setActive(arg_51_0.uishootOp, true)
			arg_51_0.parent:emitCore(CheaterTavernEvent.FIRST_TAKE_SHOOT_TIPS, var_51_0.seat)
		end

		return
	end

	setActive(arg_51_0.uiopBtn, true)
	IslandCheaterTavernRecordTools.StartPutCardTime()

	local var_51_3 = arg_51_0.cheaterTavernAgency:CheckCanOnlyQurey()

	setActive(arg_51_0.uiopBtn:Find("putCard"), not var_51_3)
	setActive(arg_51_0.uiopBtn:Find("query"), arg_51_0.tableCardNum > 0)
end

function var_0_0.UpdataHp(arg_52_0)
	local var_52_0 = arg_52_0.cheaterTavernAgency:GetMainPlayer()

	if var_52_0:IsOut() then
		setActive(arg_52_0.uiOutGo, true)
		setActive(arg_52_0.uiHpGo, false)
	else
		setActive(arg_52_0.uiOutGo, false)
		setActive(arg_52_0.uiHpGo, true)

		local var_52_1, var_52_2 = var_52_0:GetCurrentAndAllHp()

		setText(arg_52_0.uicurHpNum, var_52_1 .. "/" .. var_52_2)
	end
end

function var_0_0.OnInit(arg_53_0)
	return
end

function var_0_0.OnHide(arg_54_0)
	setParent(arg_54_0.uiTipsTf, arg_54_0._tf)

	if arg_54_0.cardViewManager then
		arg_54_0.cardViewManager:Destroy()

		arg_54_0.cardViewManager = nil
	end

	arg_54_0:StopRoundCoundDown()
	arg_54_0:RemoveRealCardTipShowTime()
	arg_54_0:StopLastBountPerformTimer()

	if arg_54_0.questionTimer then
		arg_54_0.questionTimer:Stop()

		arg_54_0.questionTimer = nil
	end

	if arg_54_0.tipsTimer then
		arg_54_0.tipsTimer:Stop()

		arg_54_0.tipsTimer = nil
	end

	arg_54_0:StopHideTipsTimer()
end

function var_0_0.WorldPosition2LocalPosition(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = pg.UIMgr.GetInstance().overlayCameraComp
	local var_55_1 = CheatTavernCameraMgr.instance._mainCamera:WorldToViewportPoint(arg_55_2)
	local var_55_2 = var_55_0:ViewportToScreenPoint(var_55_1)
	local var_55_3 = arg_55_1:GetComponent("RectTransform")

	return (LuaHelper.ScreenToLocal(var_55_3, var_55_2, var_55_0))
end

function var_0_0.UpdateDelegateState(arg_56_0)
	local var_56_0 = arg_56_0.cheaterTavernAgency:GetMainPlayer()

	setActive(arg_56_0.uiDelegate, var_56_0:IsDelegate())
	arg_56_0:UpdatePlayerHudInfo()
end

function var_0_0.DestroyMainCard(arg_57_0)
	if arg_57_0.cardViewManager then
		arg_57_0.cardViewManager:DestroyMainCard()
	end
end

function var_0_0.ShowTips(arg_58_0, arg_58_1, arg_58_2)
	if arg_58_2 == nil then
		setText(arg_58_0.uiResultText, arg_58_1)
		setActive(arg_58_0.uiResultText, true)
		setActive(arg_58_0.uiQueryText, false)
		setActive(arg_58_0.uiPunishmentText, false)
	else
		setText(arg_58_0.uiQueryText, arg_58_1)
		setText(arg_58_0.uiPunishmentText, arg_58_2)
		setActive(arg_58_0.uiResultText, false)
		setActive(arg_58_0.uiQueryText, true)
		setActive(arg_58_0.uiPunishmentText, true)
	end

	arg_58_0:StopHideTipsTimer()
	setActive(arg_58_0.uiTipsTf, false)
	setActive(arg_58_0.uiTipsTf, true)

	arg_58_0.hideTipsTimer = Timer.New(function()
		arg_58_0.uiTipsAnimator:SetTrigger("hide")
	end, 2, 1)

	arg_58_0.hideTipsTimer:Start()
end

function var_0_0.StopHideTipsTimer(arg_60_0)
	if arg_60_0.hideTipsTimer then
		arg_60_0.hideTipsTimer:Stop()

		arg_60_0.hideTipsTimer = nil
	end
end

return var_0_0
