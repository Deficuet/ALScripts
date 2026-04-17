local var_0_0 = class("IslandCheaterTavernAgency", import(".IslandBaseAgency"))

function var_0_0.OnInit(arg_1_0, arg_1_1)
	return
end

function var_0_0.SetIsConnecting(arg_2_0, arg_2_1)
	arg_2_0.isConnecting = arg_2_1
end

function var_0_0.IsConnecting(arg_3_0)
	return arg_3_0.isConnecting
end

function var_0_0.SetUILoadOver(arg_4_0, arg_4_1)
	arg_4_0.isUILoadOver = arg_4_1

	if arg_4_1 then
		for iter_4_0, iter_4_1 in ipairs(arg_4_0.cacheFunc or {}) do
			iter_4_1()
		end
	end

	arg_4_0.cacheFunc = {}
end

function var_0_0.IsUILoadOver(arg_5_0)
	return arg_5_0.isUILoadOver
end

function var_0_0.AddCacheFunc(arg_6_0, arg_6_1)
	arg_6_0.cacheFunc = arg_6_0.cacheFunc or {}

	table.insert(arg_6_0.cacheFunc, arg_6_1)
end

function var_0_0.SetStartGameData(arg_7_0, arg_7_1)
	arg_7_0.player_dic = {}
	arg_7_0.roomType = arg_7_1.room_type
	arg_7_0.allPlayerNum = #arg_7_1.player_list
	arg_7_0.curPlayerSeat = 0

	for iter_7_0, iter_7_1 in ipairs(arg_7_1.player_list) do
		if iter_7_1.user_id == getProxy(PlayerProxy):getRawData().id then
			arg_7_0.curPlayerSeat = iter_7_1.seat
		end

		arg_7_0.player_dic[iter_7_1.user_id] = IslandCheaterPlayer.New(iter_7_1)
	end

	arg_7_0:SetMainPlayerCards(arg_7_1.card_list)
	arg_7_0:SetRealCard(arg_7_1.real_card)
end

function var_0_0.SetResetGameData(arg_8_0, arg_8_1)
	arg_8_0.player_dic = {}
	arg_8_0.roomType = arg_8_1.room_type
	arg_8_0.allPlayerNum = #arg_8_1.player_list + #arg_8_1.out_player_list
	arg_8_0.curPlayerSeat = 0

	for iter_8_0, iter_8_1 in ipairs(arg_8_1.player_list) do
		if iter_8_1.user_id == getProxy(PlayerProxy):getRawData().id then
			arg_8_0.curPlayerSeat = iter_8_1.seat
		end

		arg_8_0.player_dic[iter_8_1.user_id] = IslandCheaterPlayer.New(iter_8_1)
	end

	for iter_8_2, iter_8_3 in ipairs(arg_8_1.out_player_list) do
		if iter_8_3.user_id == getProxy(PlayerProxy):getRawData().id then
			arg_8_0.curPlayerSeat = iter_8_3.seat
		end

		iter_8_3.card_num = 0
		arg_8_0.player_dic[iter_8_3.user_id] = IslandCheaterPlayer.New(iter_8_3)

		arg_8_0.player_dic[iter_8_3.user_id]:SetOutState()
	end

	arg_8_0:SetMainPlayerCards(arg_8_1.card_list)
	arg_8_0:SetRealCard(arg_8_1.real_card)
end

function var_0_0.GetRoomType(arg_9_0)
	return arg_9_0.roomType
end

function var_0_0.UpdateGameDataEveryRound(arg_10_0, arg_10_1)
	arg_10_0:SetMainPlayerCards(arg_10_1.card_list)
	arg_10_0:SetRealCard(arg_10_1.real_card)

	for iter_10_0, iter_10_1 in pairs(arg_10_0.player_dic) do
		if iter_10_1.state == 0 then
			iter_10_1.card_num = IslandCheaterTavernConst.cardNumEveryRound
		end
	end
end

function var_0_0.SetMainPlayerCards(arg_11_0, arg_11_1)
	arg_11_0.cardList = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		table.insert(arg_11_0.cardList, IslandCheaterCard.New(iter_11_1))
	end
end

function var_0_0.GetMainPlayerCards(arg_12_0)
	table.sort(arg_12_0.cardList, function(arg_13_0, arg_13_1)
		return arg_13_0.key < arg_13_1.key
	end)

	return arg_12_0.cardList
end

function var_0_0.ClearMainPlayerCards(arg_14_0)
	arg_14_0.cardList = {}
end

function var_0_0.MainPlayerPutCard(arg_15_0, arg_15_1)
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_1 or {}) do
		for iter_15_2, iter_15_3 in ipairs(arg_15_0.cardList) do
			if iter_15_3.key == iter_15_1 then
				table.insert(var_15_0, iter_15_2)
			end
		end
	end

	table.sort(var_15_0, function(arg_16_0, arg_16_1)
		return arg_16_1 < arg_16_0
	end)

	for iter_15_4, iter_15_5 in ipairs(var_15_0) do
		table.remove(arg_15_0.cardList, iter_15_5)
	end
end

function var_0_0.GetMainPlayerAutoPutCard(arg_17_0, arg_17_1)
	local var_17_0 = {}
	local var_17_1 = arg_17_0:GetMainPlayerCards()

	for iter_17_0 = 1, arg_17_1 do
		table.insert(var_17_0, var_17_1[iter_17_0].key)
	end

	return var_17_0
end

function var_0_0.SetRealCard(arg_18_0, arg_18_1)
	arg_18_0.real_card = arg_18_1
end

function var_0_0.GetRealCard(arg_19_0)
	return arg_19_0.real_card
end

function var_0_0.ReducePlayerCardNum(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.player_dic[arg_20_1]

	if var_20_0 then
		var_20_0:ReduceCardNum(arg_20_2)
	end
end

function var_0_0.GetPlayerCardNum(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.player_dic[arg_21_1]

	return var_21_0 and var_21_0:GetCardNum() or 0
end

function var_0_0.UpdatePlayerBombState(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = arg_22_0.player_dic[arg_22_1]

	if var_22_0 then
		var_22_0:UpdateBombState(arg_22_2)

		if arg_22_3 == 1 then
			var_22_0:SetOutState()

			if arg_22_1 == getProxy(PlayerProxy):getRawData().id then
				arg_22_0:ClearMainPlayerCards()
			end
		end
	end
end

function var_0_0.UpdatePlayerDelegateState(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.player_dic[arg_23_1]

	if var_23_0 then
		var_23_0:UpdateDelegateState(arg_23_2)
	end
end

function var_0_0.GetPlayerCurrentAndAllHp(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.player_dic[arg_24_1]

	if var_24_0 then
		return var_24_0:GetCurrentAndAllHp()
	end

	return 0, 0
end

function var_0_0.GetMainPlayer(arg_25_0)
	local var_25_0 = getProxy(PlayerProxy):getRawData().id

	return arg_25_0.player_dic[var_25_0]
end

function var_0_0.GetPlayerData(arg_26_0, arg_26_1)
	return arg_26_0.player_dic[arg_26_1]
end

function var_0_0.GetPlayerList(arg_27_0)
	local var_27_0 = {}
	local var_27_1 = {}

	for iter_27_0, iter_27_1 in pairs(arg_27_0.player_dic) do
		local var_27_2 = iter_27_1.seat

		if iter_27_1.user_id ~= getProxy(PlayerProxy):getRawData().id then
			local var_27_3 = (iter_27_1.seat - arg_27_0.curPlayerSeat + arg_27_0.allPlayerNum) % arg_27_0.allPlayerNum

			var_27_0[var_27_3] = iter_27_1
			var_27_1[iter_27_1.user_id] = var_27_3
		end
	end

	return var_27_0, var_27_1
end

function var_0_0.CheckCanOnlyQurey(arg_28_0)
	for iter_28_0, iter_28_1 in pairs(arg_28_0.player_dic) do
		if iter_28_1.user_id ~= getProxy(PlayerProxy):getRawData().id and not iter_28_1:IsOut() and iter_28_1:GetCardNum() ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.GetCurrentPtNum(arg_29_0)
	return 0
end

function var_0_0.CheckWinerUserId(arg_30_0)
	local var_30_0
	local var_30_1 = 0

	for iter_30_0, iter_30_1 in pairs(arg_30_0.player_dic) do
		if not iter_30_1:IsOut() then
			var_30_0 = iter_30_1.user_id
			var_30_1 = var_30_1 + 1
		end
	end

	if var_30_1 == 1 then
		return var_30_0
	end
end

return var_0_0
