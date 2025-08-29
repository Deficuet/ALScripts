local var_0_0 = class("IslandFriendSettingPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandFriendAccessUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.toggle = arg_2_0:findTF("frame/toggle")
	arg_2_0.friendToggle = arg_2_0:findTF("frame/on_panel/friend")
	arg_2_0.guildToggle = arg_2_0:findTF("frame/on_panel/guild")
	arg_2_0.codeToggle = arg_2_0:findTF("frame/on_panel/code")
	arg_2_0.codeTxt = arg_2_0:findTF("frame/code_panel/id/Text"):GetComponent(typeof(Text))
	arg_2_0.codeMask = arg_2_0:findTF("frame/code_panel/mask")
	arg_2_0.codeRefreshBtn = arg_2_0:findTF("frame/code_panel/refresh")
	arg_2_0.codeRefreshTxt = arg_2_0:findTF("frame/code_panel/refresh/Text"):GetComponent(typeof(Text))
	arg_2_0.codeCopyBtn = arg_2_0:findTF("frame/code_panel/copy")
	arg_2_0.tipBtn = arg_2_0:findTF("frame/tip")

	setText(arg_2_0:findTF("frame/title/Text"), i18n("island_open_settings"))
	setText(arg_2_0:findTF("frame/on_panel/friend/Text"), i18n("island_friend"))
	setText(arg_2_0:findTF("frame/on_panel/guild/Text"), i18n("island_guild"))
	setText(arg_2_0:findTF("frame/on_panel/code/Text"), i18n("island_code"))
	setText(arg_2_0:findTF("frame/on_tip/Text"), i18n("island_open_settings_tip1"))
	setText(arg_2_0:findTF("frame/off_tip/Text"), i18n("island_open_settings_tip2"))
	setText(arg_2_0:findTF("frame/code_panel/copy/Text"), i18n("island_btn_label_copy"))
	setText(arg_2_0:findTF("frame/toggle/on/Text"), i18n("island_visit_on"))
	setText(arg_2_0:findTF("frame/toggle/off/Text_1"), i18n("island_visit_on"))
	setText(arg_2_0:findTF("frame/toggle/on/Text_2"), i18n("island_visit_off"))
	setText(arg_2_0:findTF("frame/toggle/off/Text"), i18n("island_visit_off"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.codeRefreshBtn, function()
		arg_3_0:emit(IslandMediator.REFRESH_INVITECODE, false)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.tipBtn, function()
		arg_3_0:emit(IslandFriendPage.EVENT_MSG, i18n("island_open_settings_tip3"))
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.codeCopyBtn, function()
		UniPasteBoard.SetClipBoardString(arg_3_0.inviteCode)
		pg.TipsMgr.GetInstance():ShowTips(i18n("friend_id_copy_ok"))
	end, SFX_PANEL)
end

function var_0_0.OnRefreshInviteCode(arg_7_0)
	arg_7_0.inviteCode = getProxy(IslandProxy):GetIsland():GetAccessAgency():GetInviteCode()

	arg_7_0:InitInviteCode(true)
	arg_7_0:UpdateRefreshBtn()
end

function var_0_0.Show(arg_8_0)
	var_0_0.super.Show(arg_8_0)

	local var_8_0 = getProxy(IslandProxy):GetIsland():GetAccessAgency()

	arg_8_0.openFlags = var_8_0:GetOpenFlag()
	arg_8_0.inviteCode = var_8_0:GetInviteCode()

	arg_8_0:InitToggles()
end

function var_0_0.InitInviteCode(arg_9_0, arg_9_1)
	if arg_9_1 then
		arg_9_0.codeTxt.text = arg_9_0.inviteCode
	else
		arg_9_0.codeTxt.text = ""
	end
end

function var_0_0.InitToggles(arg_10_0)
	triggerToggle(arg_10_0.toggle, table.contains(arg_10_0.openFlags, IslandConst.OPEN_ALL))
	triggerToggle(arg_10_0.friendToggle, not table.contains(arg_10_0.openFlags, IslandConst.OPEN_FRIEND))
	triggerToggle(arg_10_0.guildToggle, not table.contains(arg_10_0.openFlags, IslandConst.OPEN_GUILD))
	triggerToggle(arg_10_0.codeToggle, table.contains(arg_10_0.openFlags, IslandConst.OPEN_CODE))
	arg_10_0:InitCodePanenl(table.contains(arg_10_0.openFlags, IslandConst.OPEN_CODE))
	onToggle(arg_10_0, arg_10_0.toggle, function(arg_11_0)
		if arg_11_0 then
			table.insert(arg_10_0.openFlags, IslandConst.OPEN_ALL)
			arg_10_0:Send()
		else
			table.removebyvalue(arg_10_0.openFlags, IslandConst.OPEN_ALL)
			arg_10_0:Send()
		end
	end)
	onToggle(arg_10_0, arg_10_0.friendToggle, function(arg_12_0)
		if arg_12_0 then
			table.removebyvalue(arg_10_0.openFlags, IslandConst.OPEN_FRIEND)
		else
			table.insert(arg_10_0.openFlags, IslandConst.OPEN_FRIEND)
		end

		arg_10_0:Send()
	end, SFX_PANEl)
	onToggle(arg_10_0, arg_10_0.guildToggle, function(arg_13_0)
		if arg_13_0 then
			table.removebyvalue(arg_10_0.openFlags, IslandConst.OPEN_GUILD)
		else
			table.insert(arg_10_0.openFlags, IslandConst.OPEN_GUILD)
		end

		arg_10_0:Send()
	end, SFX_PANEl)
	onToggle(arg_10_0, arg_10_0.codeToggle, function(arg_14_0)
		if arg_14_0 then
			table.insert(arg_10_0.openFlags, IslandConst.OPEN_CODE)

			if not arg_10_0.inviteCode or arg_10_0.inviteCode == "" then
				arg_10_0:emit(IslandMediator.REFRESH_INVITECODE, true)
			end
		else
			table.removebyvalue(arg_10_0.openFlags, IslandConst.OPEN_CODE)
		end

		arg_10_0:InitCodePanenl(arg_14_0)
		arg_10_0:Send()
	end, SFX_PANEl)
	arg_10_0:UpdateRefreshBtn()
end

function var_0_0.UpdateRefreshBtn(arg_15_0)
	local var_15_0 = getProxy(IslandProxy):GetIsland():GetAccessAgency():isFreshInviteCode() and "0" or "1"

	arg_15_0.codeRefreshTxt.text = i18n("island_code_refresh_cnt", var_15_0)
end

function var_0_0.InitCodePanenl(arg_16_0, arg_16_1)
	setActive(arg_16_0.codeMask, not arg_16_1)
	arg_16_0:InitInviteCode(arg_16_1)
end

function var_0_0.Send(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = {}
	local var_17_2 = getProxy(IslandProxy):GetIsland():GetAccessAgency():GetOpenFlag()
	local var_17_3 = arg_17_0.openFlags

	for iter_17_0, iter_17_1 in ipairs(var_17_3) do
		if not table.contains(var_17_2, iter_17_1) then
			table.insert(var_17_0, iter_17_1)
		end
	end

	for iter_17_2, iter_17_3 in ipairs(var_17_2) do
		if not table.contains(var_17_3, iter_17_3) then
			table.insert(var_17_1, iter_17_3)
		end
	end

	if #var_17_0 > 0 or #var_17_1 > 0 then
		arg_17_0:emit(IslandMediator.SET_ACCESS_FLAG, var_17_0, var_17_1)
	end
end

function var_0_0.Hide(arg_18_0)
	var_0_0.super.Hide(arg_18_0)
	removeOnToggle(arg_18_0.toggle)
	removeOnToggle(arg_18_0.friendToggle)
	removeOnToggle(arg_18_0.guildToggle)
	removeOnToggle(arg_18_0.codeToggle)
end

function var_0_0.OnDestroy(arg_19_0)
	if arg_19_0:isShowing() then
		arg_19_0:Hide()
	end
end

return var_0_0
