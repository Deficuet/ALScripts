local var_0_0 = class("IslandCheaterTavernAgency", import(".IslandBaseAgency"))

function var_0_0.OnInit(arg_1_0, arg_1_1)
	return
end

function var_0_0.SetIsConnecting(arg_2_0)
	arg_2_0.isConnecting = true
end

function var_0_0.IsConnecting(arg_3_0)
	return arg_3_0.isConnecting
end

function var_0_0.SetStartGameData(arg_4_0, arg_4_1)
	arg_4_0.player_dic = {}
	arg_4_0.roomType = arg_4_1.room_type
	arg_4_0.allPlayerNum = #arg_4_1.player_list
	arg_4_0.curPlayerSeat = 0

	for iter_4_0, iter_4_1 in ipairs(arg_4_1.player_list) do
		if iter_4_1.user_id == getProxy(PlayerProxy):getRawData().id then
			arg_4_0.curPlayerSeat = iter_4_1.seat
		end

		arg_4_0.player_dic[iter_4_1.user_id] = IslandCheaterPlayer.New(iter_4_1)
	end

	arg_4_0:SetMainPlayerCards(arg_4_1.card_list)
	arg_4_0:SetRealCard(arg_4_1.real_card)
end

function var_0_0.SetResetGameData(arg_5_0, arg_5_1)
	arg_5_0.player_dic = {}
	arg_5_0.roomType = arg_5_1.room_type
	arg_5_0.allPlayerNum = #arg_5_1.player_list
	arg_5_0.curPlayerSeat = 0

	for iter_5_0, iter_5_1 in ipairs(arg_5_1.player_list) do
		if iter_5_1.user_id == getProxy(PlayerProxy):getRawData().id then
			arg_5_0.curPlayerSeat = iter_5_1.seat
		end

		arg_5_0.player_dic[iter_5_1.user_id] = IslandCheaterPlayer.New(iter_5_1)
	end

	arg_5_0:SetMainPlayerCards(arg_5_1.card_list)
	arg_5_0:SetRealCard(arg_5_1.real_card)
end

function var_0_0.GetRoomType(arg_6_0)
	return arg_6_0.roomType
end

function var_0_0.UpdateGameDataEveryRound(arg_7_0, arg_7_1)
	arg_7_0:SetMainPlayerCards(arg_7_1.card_list)
	arg_7_0:SetRealCard(arg_7_1.real_card)

	for iter_7_0, iter_7_1 in pairs(arg_7_0.player_dic) do
		if iter_7_1.state == 0 then
			iter_7_1.card_num = IslandCheaterTavernConst.cardNumEveryRound
		end
	end
end

function var_0_0.SetMainPlayerCards(arg_8_0, arg_8_1)
	arg_8_0.cardList = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		table.insert(arg_8_0.cardList, IslandCheaterCard.New(iter_8_1))
	end
end

function var_0_0.GetMainPlayerCards(arg_9_0)
	table.sort(arg_9_0.cardList, function(arg_10_0, arg_10_1)
		return arg_10_0.key < arg_10_1.key
	end)

	return arg_9_0.cardList
end

function var_0_0.MainPlayerPutCard(arg_11_0, arg_11_1)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_1 or {}) do
		for iter_11_2, iter_11_3 in ipairs(arg_11_0.cardList) do
			if iter_11_3.key == iter_11_1 then
				table.insert(var_11_0, iter_11_2)
			end
		end
	end

	table.sort(var_11_0, function(arg_12_0, arg_12_1)
		return arg_12_1 < arg_12_0
	end)

	for iter_11_4, iter_11_5 in ipairs(var_11_0) do
		table.remove(arg_11_0.cardList, iter_11_5)
	end
end

function var_0_0.GetMainPlayerAutoPutCard(arg_13_0, arg_13_1)
	local var_13_0 = {}
	local var_13_1 = arg_13_0:GetMainPlayerCards()

	for iter_13_0 = 1, arg_13_1 do
		table.insert(var_13_0, var_13_1[iter_13_0].key)
	end

	return var_13_0
end

function var_0_0.SetRealCard(arg_14_0, arg_14_1)
	arg_14_0.real_card = arg_14_1
end

function var_0_0.GetRealCard(arg_15_0)
	return arg_15_0.real_card
end

function var_0_0.ReducePlayerCardNum(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.player_dic[arg_16_1]

	if var_16_0 then
		var_16_0:ReduceCardNum(arg_16_2)
	end
end

function var_0_0.GetPlayerCardNum(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.player_dic[arg_17_1]

	return var_17_0 and var_17_0:GetCardNum() or 0
end

function var_0_0.UpdatePlayerBombState(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_0.player_dic[arg_18_1]

	if var_18_0 then
		var_18_0:UpdateBombState(arg_18_2)

		if arg_18_3 == 1 then
			var_18_0:SetOutState()
		end
	end
end

function var_0_0.UpdatePlayerDelegateState(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.player_dic[arg_19_1]

	if var_19_0 then
		var_19_0:UpdateDelegateState(arg_19_2)
	end
end

function var_0_0.GetPlayerCurrentAndAllHp(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.player_dic[arg_20_1]

	if var_20_0 then
		return var_20_0:GetCurrentAndAllHp()
	end

	return 0, 0
end

function var_0_0.GetMainPlayer(arg_21_0)
	local var_21_0 = getProxy(PlayerProxy):getRawData().id

	return arg_21_0.player_dic[var_21_0]
end

function var_0_0.GetPlayerData(arg_22_0, arg_22_1)
	return arg_22_0.player_dic[arg_22_1]
end

function var_0_0.GetPlayerList(arg_23_0)
	local var_23_0 = {}
	local var_23_1 = {}

	for iter_23_0, iter_23_1 in pairs(arg_23_0.player_dic) do
		local var_23_2 = iter_23_1.seat

		if iter_23_1.user_id ~= getProxy(PlayerProxy):getRawData().id then
			local var_23_3 = (iter_23_1.seat - arg_23_0.curPlayerSeat + arg_23_0.allPlayerNum) % arg_23_0.allPlayerNum

			var_23_0[var_23_3] = iter_23_1
			var_23_1[iter_23_1.user_id] = var_23_3
		end
	end

	return var_23_0, var_23_1
end

function var_0_0.CheckCanOnlyQurey(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(arg_24_0.player_dic) do
		if iter_24_1.user_id ~= getProxy(PlayerProxy):getRawData().id and not iter_24_1:IsOut() and iter_24_1:GetCardNum() ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.GetCurrentPtNum(arg_25_0)
	return 0
end

function var_0_0.CheckWinerUserId(arg_26_0)
	local var_26_0
	local var_26_1 = 0

	for iter_26_0, iter_26_1 in pairs(arg_26_0.player_dic) do
		if not iter_26_1:IsOut() then
			var_26_0 = iter_26_1.user_id
			var_26_1 = var_26_1 + 1
		end
	end

	if var_26_1 == 1 then
		return var_26_0
	end
end

return var_0_0
