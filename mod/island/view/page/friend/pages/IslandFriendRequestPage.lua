local var_0_0 = class("IslandFriendRequestPage", import(".IslandFriendListPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandFriendRequestUI"
end

function var_0_0.CreateCard(arg_2_0, arg_2_1)
	return IslandFriendRequestCard.New(arg_2_1)
end

function var_0_0.OnInitItem(arg_3_0, arg_3_1)
	var_0_0.super.OnInitItem(arg_3_0, arg_3_1)

	local var_3_0 = arg_3_0.cards[arg_3_1]

	onButton(arg_3_0, var_3_0.agreeBtn, function()
		arg_3_0:emit(IslandMediator.ACCEPT_REQUEST, var_3_0.player.id)
	end, SFX_PANEL)
	onButton(arg_3_0, var_3_0.refuseBtn, function()
		arg_3_0:emit(IslandMediator.REFUSE_REQUEST, var_3_0.player.id, false)
	end, SFX_PANEL)
end

function var_0_0.GetData(arg_6_0, arg_6_1)
	local var_6_0 = getProxy(NotificationProxy):getRequests()

	if #var_6_0 <= 0 then
		return arg_6_1({})
	end

	arg_6_1(var_6_0)
end

return var_0_0
