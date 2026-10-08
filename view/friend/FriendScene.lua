local var_0_0 = class("FriendScene", import("..base.BaseUI"))

var_0_0.FRIEND_PAGE = 1
var_0_0.SEARCH_PAGE = 2
var_0_0.REQUEST_PAGE = 3
var_0_0.BLACKLIST_PAGE = 4

function var_0_0.getUIName(arg_1_0)
	return "FriendUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/friendsui_atlas"
	}
	local var_2_1 = {}

	local function var_2_2(arg_3_0)
		if not arg_3_0 then
			return
		end

		local var_3_0 = AttireFrame.attireFrameRes(arg_3_0, arg_3_0.id == getProxy(PlayerProxy):getRawData().id, AttireConst.TYPE_ICON_FRAME, arg_3_0.propose)

		if var_3_0 and var_3_0 ~= "" then
			table.insert(var_2_1, "IconFrame/" .. var_3_0)
		end

		if arg_3_0.score and arg_3_0.rank then
			local var_3_1 = SeasonInfo.getEmblem(arg_3_0.score, arg_3_0.rank)

			table.insert(var_2_1, "emblem/" .. var_3_1)
			table.insert(var_2_1, "emblem/n_" .. var_3_1)
		end
	end

	for iter_2_0, iter_2_1 in ipairs(getProxy(FriendProxy):getAllFriends() or {}) do
		var_2_2(iter_2_1)
	end

	for iter_2_2, iter_2_3 in ipairs(getProxy(NotificationProxy):getRequests() or {}) do
		var_2_2(iter_2_3.player)
	end

	for iter_2_4, iter_2_5 in pairs(getProxy(FriendProxy):getBlackList() or {}) do
		var_2_2(iter_2_5)
	end

	return ResPathSupport.UniqueLuaArr(ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_2_0, arg_2_1), var_2_0, var_2_1))
end

function var_0_0.setFriendVOs(arg_4_0, arg_4_1)
	arg_4_0.friendVOs = arg_4_1
end

function var_0_0.setPlayer(arg_5_0, arg_5_1)
	arg_5_0.playerVO = arg_5_1
end

function var_0_0.setRequests(arg_6_0, arg_6_1)
	arg_6_0.requestVOs = arg_6_1
end

function var_0_0.setSearchResult(arg_7_0, arg_7_1)
	arg_7_0.searchResultVOs = arg_7_1
end

function var_0_0.removeSearchResult(arg_8_0, arg_8_1)
	local var_8_0 = _.select(arg_8_0.searchResultVOs, function(arg_9_0)
		return arg_9_0.id ~= arg_8_1
	end)

	arg_8_0:setSearchResult(var_8_0)
end

function var_0_0.setBlackList(arg_10_0, arg_10_1)
	if arg_10_1 then
		arg_10_0.blackVOs = {}

		for iter_10_0, iter_10_1 in pairs(arg_10_1 or {}) do
			table.insert(arg_10_0.blackVOs, iter_10_1)
		end
	end
end

function var_0_0.init(arg_11_0)
	arg_11_0.pages = arg_11_0._tf:Find("pages")
	arg_11_0.togglesTF = arg_11_0._tf:Find("blur_panel/adapt/left_length/frame/tagRoot")
	arg_11_0.pages = {
		FriendListPage.New(arg_11_0.pages, arg_11_0.event, arg_11_0.contextData),
		FriendSearchPage.New(arg_11_0.pages, arg_11_0.event),
		FriendRequestPage.New(arg_11_0.pages, arg_11_0.event),
		FriendBlackListPage.New(arg_11_0.pages, arg_11_0.event)
	}
	arg_11_0.toggles = {}

	for iter_11_0 = 1, arg_11_0.togglesTF.childCount do
		arg_11_0.toggles[iter_11_0] = arg_11_0.togglesTF:GetChild(iter_11_0 - 1)

		onToggle(arg_11_0, arg_11_0.toggles[iter_11_0], function(arg_12_0)
			if arg_12_0 then
				arg_11_0:switchPage(iter_11_0)
			end
		end, SFX_PANEL)
	end

	arg_11_0.chatTipContainer = arg_11_0.toggles[1]:Find("count")
	arg_11_0.chatTip = arg_11_0.toggles[1]:Find("count/Text"):GetComponent(typeof(Text))
	arg_11_0.listEmptyTF = arg_11_0._tf:Find("empty")

	setActive(arg_11_0.listEmptyTF, false)

	arg_11_0.listEmptyTxt = arg_11_0.listEmptyTF:Find("Text")
end

function var_0_0.didEnter(arg_13_0)
	onButton(arg_13_0, arg_13_0._tf:Find("blur_panel/adapt/top/back_btn"), function()
		arg_13_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)

	local var_13_0 = arg_13_0.contextData.initPage or 1

	triggerToggle(arg_13_0.toggles[var_13_0], true)
	arg_13_0:updateRequestTip()
end

function var_0_0.wrapData(arg_15_0)
	return {
		friendVOs = arg_15_0.friendVOs,
		requestVOs = arg_15_0.requestVOs,
		searchResults = arg_15_0.searchResultVOs,
		blackVOs = arg_15_0.blackVOs,
		playerVO = arg_15_0.playerVO
	}
end

function var_0_0.updateEmpty(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = {}
	local var_16_1 = ""

	if arg_16_1 == var_0_0.FRIEND_PAGE then
		var_16_0 = arg_16_2.friendVOs
		var_16_1 = i18n("list_empty_tip_friendui")
	elseif arg_16_1 == var_0_0.SEARCH_PAGE then
		var_16_0 = arg_16_2.searchResults
		var_16_1 = i18n("list_empty_tip_friendui_search")
	elseif arg_16_1 == var_0_0.REQUEST_PAGE then
		var_16_0 = arg_16_2.requestVOs
		var_16_1 = i18n("list_empty_tip_friendui_request")
	elseif arg_16_1 == var_0_0.BLACKLIST_PAGE then
		var_16_0 = arg_16_2.blackVOs
		var_16_1 = i18n("list_empty_tip_friendui_black")
	end

	setActive(arg_16_0.listEmptyTF, not var_16_0 or #var_16_0 <= 0)
	setText(arg_16_0.listEmptyTxt, var_16_1)
end

function var_0_0.switchPage(arg_17_0, arg_17_1)
	if arg_17_0.page then
		arg_17_0.page:ExecuteAction("Hide")
	end

	local var_17_0 = arg_17_0.pages[arg_17_1]
	local var_17_1 = arg_17_0:wrapData()

	var_17_0:ExecuteAction("Show")
	var_17_0:ExecuteAction("UpdateData", var_17_1)

	arg_17_0.page = var_17_0

	arg_17_0:updateEmpty(arg_17_1, var_17_1)
end

function var_0_0.updatePage(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.pages[arg_18_1]

	if arg_18_0.page and var_18_0 == arg_18_0.page then
		local var_18_1 = arg_18_0:wrapData()

		arg_18_0.page:ExecuteAction("UpdateData", var_18_1)
		arg_18_0:updateEmpty(arg_18_1, var_18_1)
	end
end

function var_0_0.updateChatNotification(arg_19_0, arg_19_1)
	setActive(arg_19_0.chatTipContainer, arg_19_1 > 0)

	arg_19_0.chatTip.text = arg_19_1
end

function var_0_0.updateRequestTip(arg_20_0)
	setActive(arg_20_0.toggles[3]:Find("tip"), #arg_20_0.requestVOs > 0)
end

function var_0_0.closeInfromPanel(arg_21_0)
	if not arg_21_0.pages[3] then
		return
	end

	arg_21_0.pages[3]:closeInfromPanel()
end

function var_0_0.willExit(arg_22_0)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0.pages) do
		iter_22_1:Destroy()
	end
end

return var_0_0
