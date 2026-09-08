local var_0_0 = class("CourtYardReversePacmanController", import(".CourtYardController"))

function var_0_0.SetUp(arg_1_0)
	var_0_0.super.SetUp(arg_1_0)
	arg_1_0:AddChatTimer()
end

function var_0_0.Dispose(arg_2_0)
	arg_2_0:RemoveChatTimer()
	var_0_0.super.Dispose(arg_2_0)
end

function var_0_0.AddChatTimer(arg_3_0)
	local var_3_0 = math.random(CourtYardConst.REVERSE_PACMAN_CHAT_TIME[1], CourtYardConst.REVERSE_PACMAN_CHAT_TIME[2])

	arg_3_0.chatTimer = Timer.New(function()
		local var_4_0 = arg_3_0:GetShipChat()

		if var_4_0 == 0 then
			return
		end

		local var_4_1 = pg.activity_chasing_character[var_4_0]
		local var_4_2 = ShipGroup.getDefaultShipConfig(pg.ship_skin_template[var_4_1.skin_id].ship_group).id
		local var_4_3 = arg_3_0.storey:GetShip(var_4_2)

		if var_4_3 then
			var_4_3:ShowChatBubble()
		end
	end, var_3_0, -1)

	arg_3_0.chatTimer:Start()
end

function var_0_0.GetShipChat(arg_5_0)
	local var_5_0 = {}
	local var_5_1 = ReversePacmanTools.GetActivity()

	for iter_5_0, iter_5_1 in pairs(var_5_1:GetFavorabilityList()) do
		table.insert(var_5_0, iter_5_0)
	end

	if #var_5_0 <= 0 then
		return 0
	end

	return var_5_0[math.random(1, #var_5_0)]
end

function var_0_0.RemoveChatTimer(arg_6_0)
	if arg_6_0.chatTimer then
		arg_6_0.chatTimer:Stop()

		arg_6_0.chatTimer = nil
	end
end

return var_0_0
