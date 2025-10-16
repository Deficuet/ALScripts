local var_0_0 = class("IslandFriendPage", import("...base.IslandBasePage"))

var_0_0.EVENT_MSG = "IslandFriendPage:EVENT_MSG"

local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5 = 5
local var_0_6 = 6
local var_0_7 = 7
local var_0_8 = 8

local function var_0_9(arg_1_0)
	return ({
		i18n("island_friend"),
		i18n("island_guild"),
		i18n("island_code"),
		i18n("island_search"),
		i18n("island_request"),
		i18n("island_whiteList"),
		i18n("island_blackList"),
		i18n("island_settings")
	})[arg_1_0]
end

local function var_0_10(arg_2_0)
	return ({
		"tag_friend",
		"tag_guild",
		"tag_code",
		"tag_search",
		"tag_request",
		"tag_white",
		"tag_black",
		"tag_settings"
	})[arg_2_0]
end

function var_0_0.getUIName(arg_3_0)
	return "IslandFriendUI"
end

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0.backBtn = arg_4_0._tf:Find("top/back")
	arg_4_0.giftTipTxt = arg_4_0._tf:Find("top/gift_tip/Text"):GetComponent(typeof(Text))
	arg_4_0.uiToggleList = UIItemList.New(arg_4_0._tf:Find("adapt/toggles/content"), arg_4_0._tf:Find("adapt/toggles/content/tpl"))
	arg_4_0.mainTr = arg_4_0._tf:Find("adapt/main")
	arg_4_0.pages = {
		[var_0_1] = IslandFriendListPage.New(arg_4_0.mainTr, arg_4_0.event),
		[var_0_2] = IslandFriendList4GuildPage.New(arg_4_0.mainTr, arg_4_0.event),
		[var_0_3] = IslandFriendCodePage.New(arg_4_0.mainTr, arg_4_0.event),
		[var_0_4] = IslandFriendSearchPage.New(arg_4_0.mainTr, arg_4_0.event),
		[var_0_5] = IslandFriendRequestPage.New(arg_4_0.mainTr, arg_4_0.event),
		[var_0_6] = IslandFriendWhiteListPage.New(arg_4_0.mainTr, arg_4_0.event),
		[var_0_7] = IslandFriendBlackListPage.New(arg_4_0.mainTr, arg_4_0.event),
		[var_0_8] = IslandFriendSettingPage.New(arg_4_0.mainTr, arg_4_0.event)
	}

	setText(arg_4_0._tf:Find("top/title/Text"), i18n("island_btn_label_visit"))
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddListener(GAME.FRIEND_SEARCH_DONE, arg_5_0.OnSearch)
	arg_5_0:AddListener(GAME.ISLAND_REFRESH_INVITECODE_DONE, arg_5_0.OnRefreshInviteCode)
	arg_5_0:AddListener(GAME.ISLAND_ACCESS_OP_DONE, arg_5_0.OnAccessOp)
	arg_5_0:AddListener(GAME.FRIEND_DELETE_DONE, arg_5_0.OnDelFriend)
	arg_5_0:AddListener(var_0_0.EVENT_MSG, arg_5_0.OnShowMsg)
	arg_5_0:AddListener(IslandSignInAgency.OTHER_FETCH_CNT_UPDATE, arg_5_0.OnOtherFetchCntUpdate)
	arg_5_0:AddListener(NotificationProxy.FRIEND_REQUEST_REMOVED, arg_5_0.OnRequestChange)
	arg_5_0:AddListener(NotificationProxy.FRIEND_REQUEST_ADDED, arg_5_0.OnRequestChange)
	arg_5_0:AddListener(GAME.FRIEND_SEND_REQUEST_DONE, arg_5_0.OnAddFriendDone)
end

function var_0_0.RemoveListeners(arg_6_0)
	arg_6_0:RemoveListener(GAME.FRIEND_SEARCH_DONE, arg_6_0.OnSearch)
	arg_6_0:RemoveListener(GAME.ISLAND_REFRESH_INVITECODE_DONE, arg_6_0.OnRefreshInviteCode)
	arg_6_0:RemoveListener(GAME.ISLAND_ACCESS_OP_DONE, arg_6_0.OnAccessOp)
	arg_6_0:RemoveListener(GAME.FRIEND_DELETE_DONE, arg_6_0.OnDelFriend)
	arg_6_0:RemoveListener(var_0_0.EVENT_MSG, arg_6_0.OnShowMsg)
	arg_6_0:RemoveListener(IslandSignInAgency.OTHER_FETCH_CNT_UPDATE, arg_6_0.OnOtherFetchCntUpdate)
	arg_6_0:RemoveListener(NotificationProxy.FRIEND_REQUEST_REMOVED, arg_6_0.OnRequestChange)
	arg_6_0:RemoveListener(NotificationProxy.FRIEND_REQUEST_ADDED, arg_6_0.OnRequestChange)
	arg_6_0:RemoveListener(GAME.FRIEND_SEND_REQUEST_DONE, arg_6_0.OnAddFriendDone)
end

function var_0_0.OnAddFriendDone(arg_7_0)
	local var_7_0 = arg_7_0.pages[var_0_4]

	if var_7_0 and var_7_0:GetLoaded() and var_7_0:isShowing() then
		var_7_0:HideRequestBox()
	end
end

function var_0_0.OnRequestChange(arg_8_0)
	local var_8_0 = arg_8_0.pages[var_0_5]

	if var_8_0 and var_8_0:GetLoaded() and var_8_0:isShowing() then
		var_8_0:Flush()
	end

	arg_8_0:UpdateTip()
end

function var_0_0.OnOtherFetchCntUpdate(arg_9_0)
	arg_9_0:UpdateGiftTxt()
end

function var_0_0.OnDelFriend(arg_10_0)
	local var_10_0 = arg_10_0.pages[var_0_1]

	if var_10_0 and var_10_0:GetLoaded() and var_10_0:isShowing() then
		var_10_0:Flush()
	end
end

function var_0_0.OnAccessOp(arg_11_0)
	local var_11_0 = arg_11_0.pages[var_0_6]

	if var_11_0 and var_11_0:GetLoaded() and var_11_0:isShowing() then
		var_11_0:Flush()
	end

	local var_11_1 = arg_11_0.pages[var_0_7]

	if var_11_1 and var_11_1:GetLoaded() and var_11_1:isShowing() then
		var_11_1:Flush()
	end

	local var_11_2 = arg_11_0.pages[var_0_4]

	if var_11_2 and var_11_2:GetLoaded() and var_11_2:isShowing() then
		var_11_2:Flush()
	end
end

function var_0_0.OnRefreshInviteCode(arg_12_0)
	local var_12_0 = arg_12_0.pages[var_0_8]

	if var_12_0 and var_12_0:GetLoaded() and var_12_0:isShowing() then
		var_12_0:OnRefreshInviteCode()
	end
end

function var_0_0.OnSearch(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.pages[var_0_4]

	if var_13_0 and var_13_0:GetLoaded() and var_13_0:isShowing() then
		var_13_0:OnSearch(arg_13_1)
	end
end

function var_0_0.OnShowMsg(arg_14_0, arg_14_1)
	arg_14_0:ShowMsgBox({
		content = arg_14_1,
		type = IslandMsgBox.TYPE_WHITOUT_BTN
	})
end

function var_0_0.OnInit(arg_15_0)
	onButton(arg_15_0, arg_15_0._tf:Find("top/title/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_friends.tip
		})
	end, SFX_PANEL)
	onButton(arg_15_0, arg_15_0.backBtn, function()
		arg_15_0:Hide()
	end, SFX_PANEL)

	arg_15_0.toggles = {}

	arg_15_0.uiToggleList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			onToggle(arg_15_0, arg_18_2, function(arg_19_0)
				if arg_19_0 then
					arg_15_0:SwitchPage(arg_18_1 + 1)
				end
			end, SF_PANEL)
			setText(arg_18_2:Find("unsel"), var_0_9(arg_18_1 + 1))
			setText(arg_18_2:Find("sel/content/Text"), var_0_9(arg_18_1 + 1))

			local var_18_0 = GetSpriteFromAtlas("ui/IslandFriendUI_atlas", var_0_10(arg_18_1 + 1))

			setImageSprite(arg_18_2:Find("sel/content/Image"), var_18_0, true)
			table.insert(arg_15_0.toggles, arg_18_2)
		end
	end)
	arg_15_0.uiToggleList:align(#arg_15_0.pages)
	arg_15_0:UpdateTip()
end

function var_0_0.UpdateTip(arg_20_0)
	local var_20_0 = arg_20_0.toggles[var_0_5]

	setActive(var_20_0:Find("tip"), getProxy(NotificationProxy):getRequestCount() > 0)
end

function var_0_0.SwitchPage(arg_21_0, arg_21_1)
	if arg_21_0.page then
		arg_21_0.page:ExecuteAction("Hide")

		arg_21_0.page = nil
	end

	local var_21_0 = arg_21_0.pages[arg_21_1]

	var_21_0:ExecuteAction("Show")

	arg_21_0.page = var_21_0
end

function var_0_0.OnShow(arg_22_0)
	arg_22_0:UpdateGiftTxt()
	triggerToggle(arg_22_0.toggles[var_0_1], true)
	arg_22_0:BlurPanel()
end

function var_0_0.UpdateGiftTxt(arg_23_0)
	local var_23_0 = getProxy(IslandProxy):GetIsland():GetSignInAgency()
	local var_23_1 = var_23_0:GetLeftOtherFetchCnt()
	local var_23_2 = var_23_0:GetMaxOtheFetchcnt()

	arg_23_0.giftTipTxt.text = i18n("island_git_cnt_tip") .. var_23_1 .. "/" .. var_23_2
end

function var_0_0.OnHide(arg_24_0)
	arg_24_0:UnBlurPanel()
end

function var_0_0.OnDestroy(arg_25_0)
	arg_25_0:UnBlurPanel()

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.pages) do
		iter_25_1:Destroy()
	end

	arg_25_0.pages = nil
end

return var_0_0
