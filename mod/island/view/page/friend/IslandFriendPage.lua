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

function var_0_0.getUIName(arg_2_0)
	return "IslandFriendUI"
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.backBtn = arg_3_0:findTF("top/back")
	arg_3_0.giftTipTxt = arg_3_0:findTF("top/gift_tip/Text"):GetComponent(typeof(Text))
	arg_3_0.uiToggleList = UIItemList.New(arg_3_0._tf:Find("toggles/content"), arg_3_0._tf:Find("toggles/content/tpl"))
	arg_3_0.mainTr = arg_3_0._tf:Find("main")
	arg_3_0.pages = {
		[var_0_1] = IslandFriendListPage.New(arg_3_0.mainTr, arg_3_0.event),
		[var_0_2] = IslandFriendList4GuildPage.New(arg_3_0.mainTr, arg_3_0.event),
		[var_0_3] = IslandFriendCodePage.New(arg_3_0.mainTr, arg_3_0.event),
		[var_0_4] = IslandFriendSearchPage.New(arg_3_0.mainTr, arg_3_0.event),
		[var_0_5] = IslandFriendRequestPage.New(arg_3_0.mainTr, arg_3_0.event),
		[var_0_6] = IslandFriendWhiteListPage.New(arg_3_0.mainTr, arg_3_0.event),
		[var_0_7] = IslandFriendBlackListPage.New(arg_3_0.mainTr, arg_3_0.event),
		[var_0_8] = IslandFriendSettingPage.New(arg_3_0.mainTr, arg_3_0.event)
	}

	setText(arg_3_0:findTF("top/title/Text"), i18n("island_btn_label_visit"))
end

function var_0_0.AddListeners(arg_4_0)
	arg_4_0:AddListener(GAME.FRIEND_SEARCH_DONE, arg_4_0.OnSearch)
	arg_4_0:AddListener(GAME.ISLAND_REFRESH_INVITECODE_DONE, arg_4_0.OnRefreshInviteCode)
	arg_4_0:AddListener(GAME.ISLAND_ACCESS_OP_DONE, arg_4_0.OnAccessOp)
	arg_4_0:AddListener(GAME.FRIEND_DELETE_DONE, arg_4_0.OnDelFriend)
	arg_4_0:AddListener(var_0_0.EVENT_MSG, arg_4_0.OnShowMsg)
	arg_4_0:AddListener(IslandSignInAgency.OTHER_FETCH_CNT_UPDATE, arg_4_0.OnOtherFetchCntUpdate)
	arg_4_0:AddListener(NotificationProxy.FRIEND_REQUEST_REMOVED, arg_4_0.OnRequestChange)
	arg_4_0:AddListener(NotificationProxy.FRIEND_REQUEST_ADDED, arg_4_0.OnRequestChange)
end

function var_0_0.RemoveListeners(arg_5_0)
	arg_5_0:RemoveListener(GAME.FRIEND_SEARCH_DONE, arg_5_0.OnSearch)
	arg_5_0:RemoveListener(GAME.ISLAND_REFRESH_INVITECODE_DONE, arg_5_0.OnRefreshInviteCode)
	arg_5_0:RemoveListener(GAME.ISLAND_ACCESS_OP_DONE, arg_5_0.OnAccessOp)
	arg_5_0:RemoveListener(GAME.FRIEND_DELETE_DONE, arg_5_0.OnDelFriend)
	arg_5_0:RemoveListener(var_0_0.EVENT_MSG, arg_5_0.OnShowMsg)
	arg_5_0:RemoveListener(IslandSignInAgency.OTHER_FETCH_CNT_UPDATE, arg_5_0.OnOtherFetchCntUpdate)
	arg_5_0:RemoveListener(NotificationProxy.FRIEND_REQUEST_REMOVED, arg_5_0.OnRequestChange)
	arg_5_0:RemoveListener(NotificationProxy.FRIEND_REQUEST_ADDED, arg_5_0.OnRequestChange)
end

function var_0_0.OnRequestChange(arg_6_0)
	local var_6_0 = arg_6_0.pages[var_0_5]

	if var_6_0 and var_6_0:GetLoaded() and var_6_0:isShowing() then
		var_6_0:Flush()
	end

	arg_6_0:UpdateTip()
end

function var_0_0.OnOtherFetchCntUpdate(arg_7_0)
	arg_7_0:UpdateGiftTxt()
end

function var_0_0.OnDelFriend(arg_8_0)
	local var_8_0 = arg_8_0.pages[var_0_1]

	if var_8_0 and var_8_0:GetLoaded() and var_8_0:isShowing() then
		var_8_0:Flush()
	end
end

function var_0_0.OnAccessOp(arg_9_0)
	local var_9_0 = arg_9_0.pages[var_0_6]

	if var_9_0 and var_9_0:GetLoaded() and var_9_0:isShowing() then
		var_9_0:Flush()
	end

	local var_9_1 = arg_9_0.pages[var_0_7]

	if var_9_1 and var_9_1:GetLoaded() and var_9_1:isShowing() then
		var_9_1:Flush()
	end

	local var_9_2 = arg_9_0.pages[var_0_4]

	if var_9_2 and var_9_2:GetLoaded() and var_9_2:isShowing() then
		var_9_2:Flush()
	end
end

function var_0_0.OnRefreshInviteCode(arg_10_0)
	local var_10_0 = arg_10_0.pages[var_0_8]

	if var_10_0 and var_10_0:GetLoaded() and var_10_0:isShowing() then
		var_10_0:OnRefreshInviteCode()
	end
end

function var_0_0.OnSearch(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.pages[var_0_4]

	if var_11_0 and var_11_0:GetLoaded() and var_11_0:isShowing() then
		var_11_0:OnSearch(arg_11_1)
	end
end

function var_0_0.OnShowMsg(arg_12_0, arg_12_1)
	arg_12_0:ShowMsgBox({
		content = arg_12_1,
		type = IslandMsgBox.TYPE_WHITOUT_BTN
	})
end

function var_0_0.OnInit(arg_13_0)
	onButton(arg_13_0, arg_13_0.backBtn, function()
		arg_13_0:Hide()
	end, SFX_PANEL)

	arg_13_0.toggles = {}

	arg_13_0.uiToggleList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			onToggle(arg_13_0, arg_15_2, function(arg_16_0)
				if arg_16_0 then
					arg_13_0:SwitchPage(arg_15_1 + 1)
				end
			end, SF_PANEL)
			setText(arg_15_2:Find("unsel"), var_0_9(arg_15_1 + 1))
			setText(arg_15_2:Find("sel/content/Text"), var_0_9(arg_15_1 + 1))
			table.insert(arg_13_0.toggles, arg_15_2)
		end
	end)
	arg_13_0.uiToggleList:align(#arg_13_0.pages)
	arg_13_0:UpdateTip()
end

function var_0_0.UpdateTip(arg_17_0)
	local var_17_0 = arg_17_0.toggles[var_0_5]

	setActive(var_17_0:Find("tip"), getProxy(NotificationProxy):getRequestCount() > 0)
end

function var_0_0.SwitchPage(arg_18_0, arg_18_1)
	if arg_18_0.page then
		arg_18_0.page:ExecuteAction("Hide")

		arg_18_0.page = nil
	end

	local var_18_0 = arg_18_0.pages[arg_18_1]

	var_18_0:ExecuteAction("Show")

	arg_18_0.page = var_18_0
end

function var_0_0.OnShow(arg_19_0)
	arg_19_0:UpdateGiftTxt()
	triggerToggle(arg_19_0.toggles[var_0_1], true)
	arg_19_0:BlurPanel()
end

function var_0_0.UpdateGiftTxt(arg_20_0)
	local var_20_0 = getProxy(IslandProxy):GetIsland():GetSignInAgency()
	local var_20_1 = var_20_0:GetLeftOtherFetchCnt()
	local var_20_2 = var_20_0:GetMaxOtheFetchcnt()

	arg_20_0.giftTipTxt.text = i18n("island_git_cnt_tip") .. var_20_1 .. "/" .. var_20_2
end

function var_0_0.OnHide(arg_21_0)
	arg_21_0:UnBlurPanel()
end

function var_0_0.OnDestroy(arg_22_0)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0.pages) do
		iter_22_1:Destroy()
	end

	arg_22_0.pages = nil
end

return var_0_0
