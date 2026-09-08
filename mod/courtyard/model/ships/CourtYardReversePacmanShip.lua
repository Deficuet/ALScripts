local var_0_0 = class("CourtYardReversePacmanShip", import(".CourtYardShip"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)

	arg_1_0.roleID = arg_1_2.roleID
end

function var_0_0.GetShipType(arg_2_0)
	return CourtYardConst.SHIP_TYPE_REVERSE_PACMAN
end

function var_0_0.ShowChatBubble(arg_3_0)
	arg_3_0:DispatchEvent(CourtYardEvent.REVERSE_PACMAN_CHAT_BUBBLE, roleID)
end

return var_0_0
