local var_0_0 = class("Dorm3dInsPhoneLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dInsPhoneUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.bg = arg_2_0._tf:Find("bg")
	arg_2_0.btnBack = arg_2_0.bg:Find("top/back")
	arg_2_0.voiceListContainer = arg_2_0.bg:Find("main/voice/scroll/mask/list")
	arg_2_0.voiceItemList = UIItemList.New(arg_2_0.voiceListContainer, arg_2_0.voiceListContainer:Find("tpl"))

	arg_2_0.voiceItemList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateVoiceItem(arg_3_1, arg_3_2)
		end
	end)

	arg_2_0.data = getProxy(Dorm3dInsProxy):GetPhoneListByGroup(arg_2_0.contextData.groupId) or {}

	if arg_2_0.contextData.tf then
		SetParent(arg_2_0._tf, arg_2_0.contextData.tf)
	end

	arg_2_0.player = VoiceChatLoader.New(arg_2_0._tf)
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0.btnBack, function()
		arg_4_0:closeView()
	end)
	setText(arg_4_0.voiceListContainer:Find("tpl/bg/uncheck/Text"), i18n("dorm3d_privatechat_telephone_noviewed"))
	setText(arg_4_0.bg:Find("top/title"), i18n("dorm3d_privatechat_telephone_calllog"))
	setText(arg_4_0.bg:Find("main/voice/title/Text"), i18n("dorm3d_privatechat_telephone_call"))
	arg_4_0:Flush()
end

function var_0_0.Flush(arg_6_0)
	arg_6_0.voiceItemList:align(#arg_6_0.data)
end

function var_0_0.UpdateVoiceItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.data[arg_7_1 + 1]
	local var_7_1 = var_7_0:IsLock()

	setText(arg_7_2:Find("bg/name"), var_7_0:GetName())
	setActive(arg_7_2:Find("bg/day"), not var_7_1)
	setActive(arg_7_2:Find("bg/lock"), var_7_1)
	setActive(arg_7_2:Find("bg/uncheck"), var_7_0:ShouldTip())

	if var_7_1 then
		setText(arg_7_2:Find("bg/lock/info"), var_7_0:GetDesc())
	else
		setText(arg_7_2:Find("bg/day"), var_7_0:GetDay())
	end

	onButton(arg_7_0, arg_7_2, function()
		if var_7_1 then
			return
		end

		if var_7_0:GetType() == 1 then
			arg_7_0:emit(Dorm3dInsPhoneMediator.ON_DORM, var_7_0:GetVideoData())
		elseif var_7_0:GetType() == 2 then
			arg_7_0.player:ExecuteAction("Play", var_7_0:GetContent())
		end

		if var_7_0:ShouldTip() then
			arg_7_0:emit(Dorm3dInsPhoneMediator.MARK_READ, {
				groupId = arg_7_0.contextData.groupId,
				id = var_7_0.id
			})
		end

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataPhone(arg_7_0.contextData.groupId, var_7_0:GetType(), var_7_0.id))
	end)
end

function var_0_0.willExit(arg_9_0)
	arg_9_0.player:Destroy()
end

return var_0_0
