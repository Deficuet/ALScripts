local var_0_0 = class("InstagramMainUI", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "InstagramMainUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/InstagramChatBackgrounds_atlas"
	}

	for iter_2_0, iter_2_1 in ipairs(getProxy(InstagramChatProxy):GetChatList()) do
		if iter_2_1.type == 1 then
			local var_2_1 = "unknown"

			if iter_2_1.skinId == 0 then
				var_2_1 = iter_2_1:GetPainting()
			else
				for iter_2_2, iter_2_3 in ipairs(iter_2_1.skins) do
					if iter_2_3.id == iter_2_1.skinId then
						var_2_1 = iter_2_3.painting
					end
				end
			end

			table.insert(var_2_0, "painting/" .. var_2_1)
			table.insert(var_2_0, "paintingface/" .. var_2_1)
		end
	end

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))

	return var_2_0
end

function var_0_0.preload(arg_3_0, arg_3_1)
	pg.m02:sendNotification(GAME.REQ_OLD_INSTAGRAM_DATA, {
		callback = function()
			arg_3_1()
		end
	})
end

function var_0_0.init(arg_5_0)
	arg_5_0.bg = arg_5_0._tf:Find("bg")
	arg_5_0.helpBtn = arg_5_0._tf:Find("mainPanel/helpBtn")
	arg_5_0.chatBtn = arg_5_0._tf:Find("mainPanel/left/chatBtn")
	arg_5_0.juusBtn = arg_5_0._tf:Find("mainPanel/left/juusBtn")
	arg_5_0.musicPlayerView = MainMusicPlayerView.New(arg_5_0._tf, arg_5_0.event)

	arg_5_0.musicPlayerView:Load(arg_5_0._tf:Find("MusicPlayer").gameObject)
	arg_5_0.musicPlayerView:ActionInvoke("Hide")
	arg_5_0:ChangeChatTip()
	arg_5_0:ChangeJuusTip()
	arg_5_0:BlurPanel(arg_5_0._tf)
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:SetUp()
	arg_6_0:FlushMusicPlayer()

	if arg_6_0.contextData.current then
		SetActive(arg_6_0.chatBtn:Find("choose"), arg_6_0.contextData.current == "chat")
		SetActive(arg_6_0.juusBtn:Find("choose"), arg_6_0.contextData.current == "juus")
	else
		triggerButton(arg_6_0.chatBtn)
	end
end

function var_0_0.FlushMusicPlayer(arg_7_0)
	local var_7_0 = pg.BgmMgr.GetInstance():GetNow() == "MainMusicPlayer"

	if tobool(arg_7_0.musicPlayerView:isShowing()) ~= var_7_0 then
		if var_7_0 then
			arg_7_0.musicPlayerView:ExecuteAction("Show", false)
		else
			arg_7_0.musicPlayerView:ExecuteAction("Hide")
		end
	end
end

function var_0_0.SetUp(arg_8_0)
	onButton(arg_8_0, arg_8_0.bg, function()
		arg_8_0:OnClose()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.music_juus.tip
		})
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.chatBtn, function()
		arg_8_0.contextData.current = "chat"

		if isActive(arg_8_0.juusBtn:Find("choose")) then
			arg_8_0:emit(InstagramMainMediator.CLOSE_JUUS_DETAIL)
		end

		SetActive(arg_8_0.chatBtn:Find("choose"), arg_8_0.contextData.current == "chat")
		SetActive(arg_8_0.juusBtn:Find("choose"), arg_8_0.contextData.current == "juus")
		arg_8_0:emit(InstagramMainMediator.OPEN_CHAT)
		arg_8_0:emit(InstagramMainMediator.CLOSE_JUUS)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.juusBtn, function()
		arg_8_0.contextData.current = "juus"

		SetActive(arg_8_0.chatBtn:Find("choose"), arg_8_0.contextData.current == "chat")
		SetActive(arg_8_0.juusBtn:Find("choose"), arg_8_0.contextData.current == "juus")
		arg_8_0:emit(InstagramMainMediator.OPEN_JUUS)
		arg_8_0:emit(InstagramMainMediator.CLOSE_CHAT)
	end, SFX_PANEL)
end

function var_0_0.OnClose(arg_13_0)
	if isActive(arg_13_0.juusBtn:Find("choose")) then
		arg_13_0:emit(InstagramMainMediator.INS_BACK_PRESSED)
	else
		arg_13_0:emit(InstagramMainMediator.JUUS_BACK_PRESSED)
	end
end

function var_0_0.ChangeJuusTip(arg_14_0)
	local var_14_0 = getProxy(InstagramProxy)

	SetActive(arg_14_0.juusBtn:Find("tip"), var_14_0:ShouldShowTip())
end

function var_0_0.ChangeChatTip(arg_15_0)
	local var_15_0 = getProxy(InstagramChatProxy)

	SetActive(arg_15_0.chatBtn:Find("tip"), var_15_0:ShouldShowTip() and getProxy(InstagramProxy):ShouldShowOfficialAccountsTip())
end

function var_0_0.willExit(arg_16_0)
	arg_16_0.musicPlayerView:Destroy()
end

return var_0_0
