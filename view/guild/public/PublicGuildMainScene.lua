local var_0_0 = class("PublicGuildMainScene", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "PublicGuildMainUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"guildtechnology",
		"ui/guildrespanel",
		"ui/guildmainui_atlas",
		"guildpainting/guild_office_blue"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.OnUpdateDonateList(arg_3_0)
	if arg_3_0.page and isa(arg_3_0.page, PublicGuildOfficePage) and arg_3_0.page:GetLoaded() then
		arg_3_0.page:Flush()
	end
end

function var_0_0.OnPlayerUpdate(arg_4_0, arg_4_1)
	arg_4_0:SetPlayer(arg_4_1)

	if arg_4_0.resPage and arg_4_0.resPage:GetLoaded() then
		arg_4_0.resPage:Update(arg_4_1)
	end
end

function var_0_0.OnTechGroupUpdate(arg_5_0, arg_5_1)
	if arg_5_0.page and isa(arg_5_0.page, PublicGuildTechnologyPage) and arg_5_0.page:GetLoaded() then
		arg_5_0.page:OnTechGroupUpdate(arg_5_1)
	end
end

function var_0_0.RefreshAll(arg_6_0)
	if arg_6_0.page and arg_6_0.page:GetLoaded() then
		arg_6_0.page:Show(arg_6_0.publicGuild)
	end
end

function var_0_0.SetPublicGuild(arg_7_0, arg_7_1)
	arg_7_0.publicGuild = arg_7_1
end

function var_0_0.SetPlayer(arg_8_0, arg_8_1)
	arg_8_0.player = arg_8_1
end

function var_0_0.init(arg_9_0)
	arg_9_0._playerResOb = arg_9_0._tf:Find("blur_panel/adapt/top/res")
	arg_9_0.resPage = PublicGuildResPage.New(arg_9_0._playerResOb, arg_9_0.event)
	arg_9_0.backBtn = arg_9_0._tf:Find("blur_panel/adapt/top/back")
	arg_9_0.helpBtn = arg_9_0._tf:Find("blur_panel/adapt/left_length/frame/help")
	arg_9_0.toggles = {
		arg_9_0._tf:Find("blur_panel/adapt/left_length/frame/scroll_rect/tagRoot/office"),
		arg_9_0._tf:Find("blur_panel/adapt/left_length/frame/scroll_rect/tagRoot/technology")
	}

	local var_9_0 = arg_9_0._tf:Find("pages")

	arg_9_0.pages = {
		PublicGuildOfficePage.New(var_9_0, arg_9_0.event),
		PublicGuildTechnologyPage.New(var_9_0, arg_9_0.event)
	}
end

function var_0_0.didEnter(arg_10_0)
	pg.GuildPaintingMgr.GetInstance():Enter(arg_10_0._tf:Find("bg/painting"))
	arg_10_0.resPage:ExecuteAction("Update", arg_10_0.player)
	onButton(arg_10_0, arg_10_0.backBtn, function()
		arg_10_0:emit(var_0_0.ON_BACK)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.helpBtn, function()
		if isa(arg_10_0.page, PublicGuildOfficePage) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("guild_public_office_tip")
			})
		elseif isa(arg_10_0.page, PublicGuildTechnologyPage) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("guild_public_tech_tip")
			})
		end
	end, SFX_PANEL)

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.toggles) do
		onToggle(arg_10_0, iter_10_1, function(arg_13_0)
			if arg_13_0 then
				arg_10_0:SwitchPage(iter_10_0)
			end
		end, SFX_PANEL)

		if iter_10_0 == 1 then
			triggerToggle(iter_10_1, true)
		end
	end
end

function var_0_0.SwitchPage(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.pages[arg_14_1]

	if arg_14_0.page then
		arg_14_0.page:Hide()
	end

	var_14_0:ExecuteAction("Show", arg_14_0.publicGuild)

	arg_14_0.page = var_14_0
end

function var_0_0.willExit(arg_15_0)
	pg.GuildPaintingMgr.GetInstance():Exit()
	arg_15_0.resPage:Destroy()

	for iter_15_0, iter_15_1 in pairs(arg_15_0.pages) do
		iter_15_1:Destroy()
	end
end

return var_0_0
