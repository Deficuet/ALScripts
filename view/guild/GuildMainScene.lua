local var_0_0 = class("GuildMainScene", import("..base.BaseUI"))

function var_0_0.forceGC(arg_1_0)
	return true
end

function var_0_0.getUIName(arg_2_0)
	return "GuildMainUI"
end

function var_0_0.getGroupName(arg_3_0)
	return "group_GuildMainUI"
end

function var_0_0.setGuildVO(arg_4_0, arg_4_1)
	arg_4_0.guildVO = arg_4_1

	if arg_4_0.guildRes and arg_4_0.guildRes:GetLoaded() then
		arg_4_0.guildRes:Update(arg_4_0.playerVO, arg_4_1)
	end

	if arg_4_0.themePage and arg_4_0.themePage:GetLoaded() then
		arg_4_0.themePage:UpdateGuild(arg_4_0.guildVO)
	end
end

function var_0_0.setPlayerVO(arg_5_0, arg_5_1)
	arg_5_0.playerVO = arg_5_1
end

function var_0_0.setChatMsgs(arg_6_0, arg_6_1)
	arg_6_0.chatMsgs = arg_6_1
end

function var_0_0.setActivity(arg_7_0, arg_7_1)
	arg_7_0.activity = arg_7_1
end

function var_0_0.setGuildEvent(arg_8_0, arg_8_1)
	arg_8_0.guildEvent = arg_8_1
end

function var_0_0.UpdateRes(arg_9_0)
	if arg_9_0.guildRes and arg_9_0.guildRes:GetLoaded() then
		arg_9_0.guildRes:Update(arg_9_0.playerVO, arg_9_0.guildVO)
	end
end

function var_0_0.OnReportUpdated(arg_10_0)
	if arg_10_0.themePage and arg_10_0.themePage:GetLoaded() then
		arg_10_0.themePage:RefreshReportBtn()
	end
end

local var_0_1 = "main"
local var_0_2 = "member"
local var_0_3 = "apply"
local var_0_4 = "office"
local var_0_5 = "technology"
local var_0_6 = "battle"

var_0_0.TOGGLE_TAG = {
	var_0_1,
	var_0_2,
	var_0_3,
	var_0_4,
	var_0_5,
	var_0_6
}
var_0_0.NOTIFY_TYPE_ALL = 0
var_0_0.NOTIFY_TYPE_MAIN = 1
var_0_0.NOTIFY_TYPE_APPLY = 2
var_0_0.NOTIFY_TYPE_OFFICE = 3
var_0_0.NOTIFY_TYPE_BATTLE = 4
var_0_0.NOTIFY_TYPE_TECH = 5

function var_0_0.init(arg_11_0)
	arg_11_0._bg = arg_11_0._tf:Find("bg")

	pg.GuildPaintingMgr.GetInstance():Enter(arg_11_0._bg:Find("painting"))

	arg_11_0._playerResOb = arg_11_0._tf:Find("blur_panel/adapt/top/res")
	arg_11_0.guildRes = GuildResPage.New(arg_11_0._playerResOb, arg_11_0.event)
	arg_11_0.toggleRoot = arg_11_0._tf:Find("blur_panel/adapt/left_length/frame/scroll_rect/tagRoot")
	arg_11_0.mainTip = arg_11_0.toggleRoot:Find("main/tip")
	arg_11_0.applyTip = arg_11_0.toggleRoot:Find("apply/tip")
	arg_11_0.officeTip = arg_11_0.toggleRoot:Find("office/tip")
	arg_11_0.techTip = arg_11_0.toggleRoot:Find("technology/tip")
	arg_11_0.battleTip = arg_11_0.toggleRoot:Find("battle/tip")
	arg_11_0.back = arg_11_0._tf:Find("blur_panel/adapt/top/back")
	arg_11_0.blurPanel = arg_11_0._tf:Find("blur_panel")
	arg_11_0.mainTF = arg_11_0._tf:Find("main")
	arg_11_0.eyeTF = arg_11_0._tf:Find("blur_panel/adapt/eye")
	arg_11_0._leftLength = findTF(arg_11_0.blurPanel, "adapt/left_length")
	arg_11_0._topPanel = findTF(arg_11_0.blurPanel, "adapt/top")
	arg_11_0.topBg = arg_11_0._tf:Find("blur_panel/top_bg")
	arg_11_0.topBgWidth = arg_11_0.topBg.rect.height
	arg_11_0.topWidth = arg_11_0._topPanel.rect.height
	arg_11_0.letfWidth = -1 * (arg_11_0._leftLength.rect.width + 300)
	arg_11_0.logPage = GuildOfficeLogPage.New(arg_11_0._tf, arg_11_0.event)
	arg_11_0.dynamicBg = GuildDynamicBG.New(arg_11_0._tf:Find("dynamic_bg"))
	Input.multiTouchEnabled = false
end

function var_0_0.preload(arg_12_0, arg_12_1)
	seriesAsync({
		function(arg_13_0)
			pg.m02:sendNotification(GAME.GET_GUILD_REPORT, {
				callback = arg_13_0
			})
		end,
		function(arg_14_0)
			local var_14_0 = getProxy(GuildProxy):getRawData():GetActiveEvent()

			if not var_14_0 then
				pg.m02:sendNotification(GAME.GUILD_GET_ACTIVATION_EVENT, {
					force = false,
					callback = arg_14_0
				})
			elseif var_14_0 and var_14_0:IsExpired() then
				pg.m02:sendNotification(GAME.GUILD_GET_ACTIVATION_EVENT, {
					force = true,
					callback = arg_14_0
				})
			else
				arg_14_0()
			end
		end
	}, arg_12_1)
end

function var_0_0.getResource(arg_15_0)
	local var_15_0 = var_0_0.super.getResource(arg_15_0)
	local var_15_1 = {
		"ui/GuildResPanel",
		"furnitrues/guild/chair",
		"furnitrues/guild/chair1",
		"ui/guildmainui_atlas",
		"dutyicon",
		"guildpainting/guild_office_blue",
		"guildpainting/guild_office_red",
		"guildpainting/guild_event_boss_2",
		"guildpainting/guild_event_boss_3",
		"guildpainting/guild_event_boss_4",
		"guildtechnology",
		"ui/guildtechnologyredui_atlas",
		"ui/guildtechnologyblueui_atlas",
		"ui/guildtechnologyui_atlas",
		"commonbg/guild_event_bg",
		"guildevent/1",
		"guildevent/2",
		"guildevent/3",
		"guildevent/4",
		"guildevent/5",
		"guildevent/0_0",
		"guildevent/0",
		"guildevent/i_1",
		"guildevent/i_2",
		"guildevent/i_3",
		"guildevent/i_4",
		"guildevent/i_5",
		"ui/guildeventui_atlas",
		"guildeventicon",
		"ui/guildmissionui_atlas",
		"guildmission/midway",
		"guildmission/1_4"
	}

	local function var_15_2(arg_16_0)
		if noEmptyStr(arg_16_0) and not table.contains(var_15_1, arg_16_0) then
			table.insert(var_15_1, arg_16_0)
		end
	end

	local var_15_3 = getProxy(GuildProxy):getRawData()

	if var_15_3 then
		var_15_2(var_15_3:getBgName())

		local var_15_4 = getProxy(SettingsProxy):IsMellowStyle()
		local var_15_5 = var_15_3:getFaction()

		if var_15_5 == GuildConst.FACTION_TYPE_BLHX then
			var_15_2(var_15_4 and "ui/GuildThemeBlueUI4Mellow" or "ui/GuildThemeBlueUI")
		elseif var_15_5 == GuildConst.FACTION_TYPE_CSZZ then
			var_15_2(var_15_4 and "ui/GuildThemeRedUI4Mellow" or "ui/GuildThemeRedUI")
		end
	end

	local var_15_6 = pg.item_data_frame.all

	for iter_15_0, iter_15_1 in ipairs(var_15_6) do
		local var_15_7 = pg.item_data_frame[iter_15_1]

		var_15_2("iconframe/" .. var_15_7.id)
	end

	if not arg_15_0.memberShips then
		arg_15_0.memberShips = getProxy(GuildProxy):getData():GetMemberShips(GuildConst.MAX_DISPLAY_MEMBER_SHIP)
	end

	if arg_15_0.memberShips and #arg_15_0.memberShips > 0 then
		for iter_15_2, iter_15_3 in ipairs(arg_15_0.memberShips) do
			var_15_2("char/" .. iter_15_3:getPainting())
		end
	end

	for iter_15_4, iter_15_5 in ipairs(var_15_1) do
		if not table.contains(var_15_0, iter_15_5) then
			table.insert(var_15_0, iter_15_5)
		end
	end

	return var_15_0
end

function var_0_0.didEnter(arg_17_0)
	onButton(arg_17_0, arg_17_0.back, function()
		arg_17_0:emit(GuildMainMediator.ON_BACK)
	end, SOUND_BACK)

	arg_17_0.hideFlag = false

	onButton(arg_17_0, arg_17_0.eyeTF, function()
		arg_17_0.hideFlag = not arg_17_0.hideFlag

		arg_17_0:EnterOrExitPreView()
	end, SFX_PANEL)
	arg_17_0.guildRes:ExecuteAction("Update", arg_17_0.playerVO, arg_17_0.guildVO)
	arg_17_0:initToggles()
	arg_17_0:UpdateRes()
	pg.GuildLayerMgr.GetInstance():BlurTopPanel(arg_17_0.blurPanel)

	if arg_17_0.guildVO:shouldRefreshCaptial() then
		arg_17_0:emit(GuildMainMediator.ON_FETCH_CAPITAL)
	end

	if not arg_17_0.memberShips then
		arg_17_0.memberShips = arg_17_0.guildVO:GetMemberShips(GuildConst.MAX_DISPLAY_MEMBER_SHIP)
	end

	arg_17_0.dynamicBg:Init(arg_17_0.memberShips)
	arg_17_0:UpdateNotices(var_0_0.NOTIFY_TYPE_ALL)
end

function var_0_0.OnDeleteMember(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1:GetShip()

	arg_20_0.dynamicBg:ExitShip(var_20_0.name)
end

function var_0_0.OnAddMember(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1:GetShip()

	arg_21_0.dynamicBg:AddShip(var_21_0, function()
		return
	end)
end

function var_0_0.EnterOrExitPreView(arg_23_0)
	if LeanTween.isTweening(go(arg_23_0._topPanel)) or LeanTween.isTweening(go(arg_23_0._leftLength)) or LeanTween.isTweening(go(arg_23_0.topBg)) then
		return
	end

	if arg_23_0.themePage and arg_23_0.themePage:GetLoaded() then
		arg_23_0.themePage:EnterOrExitPreView(arg_23_0.hideFlag)
	end

	local var_23_0 = arg_23_0.hideFlag and {
		0,
		arg_23_0.topWidth
	} or {
		arg_23_0.topWidth,
		0
	}

	LeanTween.value(go(arg_23_0._topPanel), var_23_0[1], var_23_0[2], 0.3):setOnUpdate(System.Action_float(function(arg_24_0)
		setAnchoredPosition(arg_23_0._topPanel, {
			y = arg_24_0
		})
	end))

	local var_23_1 = arg_23_0.hideFlag and {
		0,
		arg_23_0.letfWidth
	} or {
		arg_23_0.letfWidth,
		0
	}

	LeanTween.value(go(arg_23_0._leftLength), var_23_1[1], var_23_1[2], 0.3):setOnUpdate(System.Action_float(function(arg_25_0)
		setAnchoredPosition(arg_23_0._leftLength, {
			x = arg_25_0
		})
	end))

	local var_23_2 = arg_23_0.hideFlag and {
		0,
		arg_23_0.topBgWidth
	} or {
		arg_23_0.topBgWidth,
		0
	}

	LeanTween.value(go(arg_23_0.topBg), var_23_2[1], var_23_2[2], 0.3):setOnUpdate(System.Action_float(function(arg_26_0)
		setAnchoredPosition(arg_23_0.topBg, {
			y = arg_26_0
		})
	end))
end

function var_0_0.UpdateBg(arg_27_0)
	local var_27_0 = arg_27_0.guildVO:getBgName()

	if arg_27_0.bgName ~= var_27_0 then
		GetSpriteFromAtlasAsync(var_27_0, "", function(arg_28_0)
			if not IsNil(arg_27_0._tf) then
				setImageSprite(arg_27_0._bg, arg_28_0, false)
			end
		end)

		arg_27_0.bgName = var_27_0
	end
end

function var_0_0.UpdateNotices(arg_29_0, arg_29_1)
	local var_29_0 = getProxy(GuildProxy)
	local var_29_1 = arg_29_0.guildVO

	if arg_29_1 == var_0_0.NOTIFY_TYPE_ALL or arg_29_1 == var_0_0.NOTIFY_TYPE_MAIN then
		setActive(arg_29_0.mainTip, var_29_0:ShouldShowMainTip())
	end

	if arg_29_1 == var_0_0.NOTIFY_TYPE_ALL or arg_29_1 == var_0_0.NOTIFY_TYPE_APPLY then
		setActive(arg_29_0.applyTip, var_29_0:ShouldShowApplyTip())
	end

	if arg_29_1 == var_0_0.NOTIFY_TYPE_ALL or arg_29_1 == var_0_0.NOTIFY_TYPE_OFFICE then
		setActive(arg_29_0.officeTip, var_29_1:ShouldShowOfficeTip())
	end

	if arg_29_1 == var_0_0.NOTIFY_TYPE_ALL or arg_29_1 == var_0_0.NOTIFY_TYPE_BATTLE then
		setActive(arg_29_0.battleTip, var_29_0:ShouldShowBattleTip())
	end

	if arg_29_1 == var_0_0.NOTIFY_TYPE_ALL or arg_29_1 == var_0_0.NOTIFY_TYPE_TECH then
		setActive(arg_29_0.techTip, var_29_1:ShouldShowTechTip())
	end
end

function var_0_0.initTheme(arg_30_0)
	local var_30_0 = arg_30_0.guildVO:getFaction()

	if not arg_30_0.faction or arg_30_0.faction ~= var_30_0 then
		if arg_30_0.themePage then
			arg_30_0.themePage:Destroy()
		end

		arg_30_0.themePage = GuildThemePage.New(arg_30_0.mainTF, arg_30_0.event, arg_30_0.contextData)

		arg_30_0.themePage:ExecuteAction("Update", arg_30_0.guildVO, arg_30_0.playerVO, arg_30_0.chatMsgs)

		arg_30_0.faction = var_30_0
	else
		arg_30_0.themePage:ActionInvoke("Update", arg_30_0.guildVO, arg_30_0.playerVO, arg_30_0.chatMsgs)
	end
end

function var_0_0.OpenMainPage(arg_31_0)
	if not arg_31_0.themePage or not arg_31_0.themePage:GetLoaded() then
		arg_31_0:initTheme()
	else
		arg_31_0.themePage:Show()
	end
end

function var_0_0.initToggles(arg_32_0)
	arg_32_0.contextData.toggles = {}

	for iter_32_0, iter_32_1 in ipairs(var_0_0.TOGGLE_TAG) do
		arg_32_0.contextData.toggles[iter_32_1] = arg_32_0.toggleRoot:Find(iter_32_1)

		assert(arg_32_0.contextData.toggles[iter_32_1], "transform canot be nil" .. iter_32_1)
		onToggle(arg_32_0, arg_32_0.contextData.toggles[iter_32_1], function(arg_33_0)
			if arg_33_0 then
				arg_32_0:openPage(iter_32_1)
				setActive(arg_32_0._bg, iter_32_1 ~= var_0_1)
			else
				arg_32_0:closePage(iter_32_1)
			end
		end, SFX_PANEL)
	end

	if LOCK_GUILD_BATTLE then
		setActive(arg_32_0.contextData.toggles[var_0_6], false)
	end

	local var_32_0 = arg_32_0.guildVO:getDutyByMemberId(arg_32_0.playerVO.id)

	setActive(arg_32_0.contextData.toggles[var_0_3], var_32_0 == GuildConst.DUTY_COMMANDER or var_32_0 == GuildConst.DUTY_DEPUTY_COMMANDER)

	local var_32_1 = arg_32_0.contextData.page or var_0_1

	arg_32_0.contextData.page = nil

	assert(arg_32_0.contextData.toggles[var_32_1])
	triggerToggle(arg_32_0.contextData.toggles[var_32_1], true)
end

function var_0_0.TriggerOfficePage(arg_34_0)
	triggerToggle(arg_34_0.contextData.toggles[var_0_4], true)
end

function var_0_0.openPage(arg_35_0, arg_35_1)
	setActive(arg_35_0.eyeTF, arg_35_1 == var_0_1)

	if arg_35_1 == var_0_4 or arg_35_1 == var_0_5 then
		arg_35_0.guildRes:Show()
	elseif arg_35_1 == var_0_6 or arg_35_1 == var_0_3 or arg_35_1 == var_0_2 then
		arg_35_0.guildRes:Hide()
	else
		arg_35_0.guildRes:Hide()
	end

	if arg_35_0.themePage and arg_35_0.themePage:GetLoaded() and arg_35_0.themePage.isShowChatWindow then
		arg_35_0.themePage:ShowOrHideChatWindow(false)
	end

	if arg_35_0.contextData.page == arg_35_1 then
		return
	end

	if arg_35_1 == var_0_1 then
		arg_35_0:OpenMainPage()
		arg_35_0:emit(GuildMainMediator.OPEN_MAIN)
	elseif arg_35_1 == var_0_2 then
		arg_35_0:emit(GuildMainMediator.OPEN_MEMBER)
	elseif arg_35_1 == var_0_3 then
		arg_35_0:emit(GuildMainMediator.OPEN_APPLY)
	elseif arg_35_1 == var_0_4 then
		arg_35_0:emit(GuildMainMediator.OPEN_OFFICE)
	elseif arg_35_1 == var_0_5 then
		arg_35_0:emit(GuildMainMediator.OPEN_TECH)
	elseif arg_35_1 == var_0_6 then
		arg_35_0:emit(GuildMainMediator.OPEN_BATTLE)
	end

	arg_35_0:UpdateBg()

	arg_35_0.contextData.page = arg_35_1
end

function var_0_0.closePage(arg_36_0, arg_36_1)
	if arg_36_1 == var_0_1 then
		if arg_36_0.themePage then
			arg_36_0.themePage:ExecuteAction("Hide")
		end
	elseif arg_36_1 == var_0_2 then
		arg_36_0:emit(GuildMainMediator.CLOSE_MEMBER)
	elseif arg_36_1 == var_0_3 then
		arg_36_0:emit(GuildMainMediator.CLOSE_APPLY)
	elseif arg_36_1 == var_0_4 then
		arg_36_0:emit(GuildMainMediator.CLOSE_OFFICE)
	elseif arg_36_1 == var_0_5 then
		arg_36_0:emit(GuildMainMediator.CLOSE_TECH)
	elseif arg_36_1 == var_0_6 then
		arg_36_0:emit(GuildMainMediator.CLOSE_BATTLE)
	end
end

function var_0_0.BlurView(arg_37_0, arg_37_1)
	pg.UIMgr.GetInstance():OverlayPanel(arg_37_1, {
		pbList = {
			arg_37_1:Find("Image1/Image1")
		}
	})
end

function var_0_0.UnBlurView(arg_38_0, arg_38_1, arg_38_2)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_38_1, arg_38_2)
end

function var_0_0.Append(arg_39_0, arg_39_1, arg_39_2)
	if arg_39_0.themePage and arg_39_0.themePage:GetLoaded() then
		arg_39_0.themePage:Append(arg_39_1, arg_39_2)
	end
end

function var_0_0.UpdateAllChat(arg_40_0, arg_40_1)
	if arg_40_0.themePage and arg_40_0.themePage:GetLoaded() then
		arg_40_0.themePage:UpdateAllChat(arg_40_1)
	end
end

function var_0_0.UpdateAllLog(arg_41_0, arg_41_1)
	if arg_41_0.themePage and arg_41_0.themePage:GetLoaded() then
		arg_41_0.themePage:UpdateAllChat(arg_41_1)
	end
end

function var_0_0.AppendLog(arg_42_0, arg_42_1, arg_42_2)
	if arg_42_0.themePage and arg_42_0.themePage:GetLoaded() then
		arg_42_0.themePage:AppendLog(arg_42_1, arg_42_2)
	end
end

function var_0_0.openResourceLog(arg_43_0)
	arg_43_0.logPage:ExecuteAction("Show", arg_43_0.guildVO)
end

function var_0_0.willExit(arg_44_0)
	arg_44_0.dynamicBg:Dispose()
	arg_44_0.logPage:Destroy()
	arg_44_0.guildRes:Destroy()

	if arg_44_0.themePage then
		arg_44_0.themePage:Destroy()
	end

	pg.GuildLayerMgr.GetInstance():Clear()
	pg.GuildPaintingMgr.GetInstance():Exit()

	if arg_44_0.contextData.page then
		arg_44_0:closePage(arg_44_0.contextData.page)
	end

	Input.multiTouchEnabled = true
end

function var_0_0.insertEmojiToInputText(arg_45_0, arg_45_1)
	if arg_45_0.themePage then
		arg_45_0.themePage:InsertEmojiToInputText(arg_45_1)
	end
end

return var_0_0
