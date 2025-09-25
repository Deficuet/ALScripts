local var_0_0 = class("InstagramMainUI", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "InstagramMainUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.bg = arg_2_0:findTF("bg")
	arg_2_0.helpBtn = arg_2_0:findTF("mainPanel/helpBtn")
	arg_2_0.chatBtn = arg_2_0:findTF("mainPanel/left/chatBtn")
	arg_2_0.juusBtn = arg_2_0:findTF("mainPanel/left/juusBtn")
	arg_2_0.musicPlayerView = MainMusicPlayerView.New(arg_2_0._tf, arg_2_0.event)

	arg_2_0.musicPlayerView:Load(arg_2_0._tf:Find("MusicPlayer").gameObject)
	arg_2_0:ChangeChatTip()
	arg_2_0:ChangeJuusTip()
	arg_2_0:BlurPanel(arg_2_0._tf)
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:SetUp()
	arg_3_0:FlushMusicPlayer()

	if arg_3_0.contextData.current then
		SetActive(arg_3_0:findTF("choose", arg_3_0.chatBtn), arg_3_0.contextData.current == "chat")
		SetActive(arg_3_0:findTF("choose", arg_3_0.juusBtn), arg_3_0.contextData.current == "juus")
	else
		triggerButton(arg_3_0.chatBtn)
	end
end

function var_0_0.FlushMusicPlayer(arg_4_0)
	local var_4_0 = pg.BgmMgr.GetInstance():GetNow() == "MainMusicPlayer"

	if tobool(arg_4_0.musicPlayerView:isShowing()) ~= var_4_0 then
		if var_4_0 then
			arg_4_0.musicPlayerView:ExecuteAction("Show", false)
		else
			arg_4_0.musicPlayerView:ExecuteAction("Hide")
		end
	end
end

function var_0_0.SetUp(arg_5_0)
	onButton(arg_5_0, arg_5_0.bg, function()
		arg_5_0:OnClose()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.music_juus.tip
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.chatBtn, function()
		arg_5_0.contextData.current = "chat"

		if isActive(arg_5_0:findTF("choose", arg_5_0.juusBtn)) then
			arg_5_0:emit(InstagramMainMediator.CLOSE_JUUS_DETAIL)
		end

		SetActive(arg_5_0:findTF("choose", arg_5_0.chatBtn), arg_5_0.contextData.current == "chat")
		SetActive(arg_5_0:findTF("choose", arg_5_0.juusBtn), arg_5_0.contextData.current == "juus")
		arg_5_0:emit(InstagramMainMediator.OPEN_CHAT)
		arg_5_0:emit(InstagramMainMediator.CLOSE_JUUS)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.juusBtn, function()
		arg_5_0.contextData.current = "juus"

		SetActive(arg_5_0:findTF("choose", arg_5_0.chatBtn), arg_5_0.contextData.current == "chat")
		SetActive(arg_5_0:findTF("choose", arg_5_0.juusBtn), arg_5_0.contextData.current == "juus")
		arg_5_0:emit(InstagramMainMediator.OPEN_JUUS)
		arg_5_0:emit(InstagramMainMediator.CLOSE_CHAT)
	end, SFX_PANEL)
end

function var_0_0.OnClose(arg_10_0)
	if isActive(arg_10_0:findTF("choose", arg_10_0.juusBtn)) then
		arg_10_0:emit(InstagramMainMediator.JUUS_BACK_PRESSED)
	else
		arg_10_0:closeView()
	end
end

function var_0_0.ChangeJuusTip(arg_11_0)
	local var_11_0 = getProxy(InstagramProxy)

	SetActive(arg_11_0:findTF("tip", arg_11_0.juusBtn), var_11_0:ShouldShowTip())
end

function var_0_0.ChangeChatTip(arg_12_0)
	local var_12_0 = getProxy(InstagramChatProxy)

	SetActive(arg_12_0:findTF("tip", arg_12_0.chatBtn), var_12_0:ShouldShowTip())
end

function var_0_0.willExit(arg_13_0)
	arg_13_0.musicPlayerView:Destroy()
end

return var_0_0
