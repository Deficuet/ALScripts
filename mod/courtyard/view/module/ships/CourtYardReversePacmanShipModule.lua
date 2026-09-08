local var_0_0 = class("CourtYardReversePacmanShipModule", import(".CourtYardShipModule"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.chatBubble = arg_1_0._tf:Find("reversePacmanAttachments/chat")
	arg_1_0.chatBubbleTxt = arg_1_0._tf:Find("reversePacmanAttachments/chat/Text"):GetComponent(typeof(Text))

	setActive(arg_1_0.chatBubble, false)
end

function var_0_0.AddListeners(arg_2_0)
	var_0_0.super.AddListeners(arg_2_0)
	arg_2_0:AddListener(CourtYardEvent.REVERSE_PACMAN_CHAT_BUBBLE, arg_2_0.OnShowText)
end

function var_0_0.RemoveListeners(arg_3_0)
	var_0_0.super.RemoveListeners(arg_3_0)
	arg_3_0:RemoveListener(CourtYardEvent.REVERSE_PACMAN_CHAT_BUBBLE, arg_3_0.OnShowText)
end

function var_0_0.OnShowText(arg_4_0, arg_4_1)
	local var_4_0 = pg.activity_chasing_character[arg_4_0.data.roleID]

	if var_4_0.random_talk[1] == nil then
		return
	end

	setActive(arg_4_0.chatBubble, true)

	local var_4_1 = math.random(1, #var_4_0.random_talk[2])

	setText(arg_4_0.chatBubbleTxt, ShipWordHelper.GetShipWord(var_4_0.random_talk[1], var_4_0.random_talk[2][var_4_1], {}))
	arg_4_0:DisappearTimer()
end

function var_0_0.DisappearTimer(arg_5_0)
	arg_5_0.disappearTimer = Timer.New(function()
		setActive(arg_5_0.chatBubble, false)
		arg_5_0:RemoveDisappearTimer()
	end, CourtYardConst.REVERSE_PACMAN_CHAT_SHOW_TIME, 1)

	arg_5_0.disappearTimer:Start()
end

function var_0_0.RemoveDisappearTimer(arg_7_0)
	if arg_7_0.disappearTimer then
		arg_7_0.disappearTimer:Stop()

		arg_7_0.disappearTimer = nil
	end
end

function var_0_0.OnDispose(arg_8_0)
	arg_8_0:RemoveDisappearTimer()
	var_0_0.super.OnDispose(arg_8_0)
end

return var_0_0
