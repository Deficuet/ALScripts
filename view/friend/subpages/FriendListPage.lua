local var_0_0 = class("FriendListPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "FriendListUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.friendPanel = arg_2_0._tf:Find("friend_panel")
	arg_2_0.friendTopTF = arg_2_0._tf:Find("friend_view_top")
	arg_2_0.friendCountTF = arg_2_0.friendTopTF:Find("friend_count/Text")
	arg_2_0.friendIndexBtn = arg_2_0.friendTopTF:Find("index_button")
	arg_2_0.friendSortBtn = arg_2_0.friendTopTF:Find("sort_button")
	arg_2_0.sortImgAsc = arg_2_0.friendSortBtn:Find("asc")
	arg_2_0.sortImgDec = arg_2_0.friendSortBtn:Find("desc")
	arg_2_0.sortPanel = arg_2_0._tf:Find("friend_sort_panel")
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.dec = false
	arg_3_0.sortdata = {}

	onButton(arg_3_0, arg_3_0.friendSortBtn, function()
		arg_3_0.dec = not arg_3_0.dec
		arg_3_0.contextData.sortData = {
			data = arg_3_0.sortdata,
			dec = arg_3_0.dec
		}

		arg_3_0:sortFriends()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.friendIndexBtn, function()
		arg_3_0:openFriendsSortPanel()
	end, SFX_PANEL)
end

function var_0_0.UpdateData(arg_6_0, arg_6_1)
	arg_6_0.friendVOs = arg_6_1.friendVOs or {}

	if not arg_6_0.isInit then
		arg_6_0.isInit = true

		arg_6_0:initFriendsPage()
		arg_6_0:initFriendsSortPanel()
	else
		arg_6_0:sortFriends()
	end

	arg_6_0:updateFriendCount()
end

function var_0_0.initFriendsPage(arg_7_0)
	arg_7_0.friendItems = {}
	arg_7_0.friendRect = arg_7_0.friendPanel:Find("mask/view"):GetComponent("LScrollRect")

	function arg_7_0.friendRect.onInitItem(arg_8_0)
		arg_7_0:onInitItem(arg_8_0)
	end

	function arg_7_0.friendRect.onUpdateItem(arg_9_0, arg_9_1)
		arg_7_0:onUpdateItem(arg_9_0, arg_9_1)
	end
end

function var_0_0.onInitItem(arg_10_0, arg_10_1)
	local var_10_0 = FriendListCard.New(arg_10_1)

	onButton(arg_10_0, var_10_0.occuptBtn, function()
		arg_10_0:emit(FriendMediator.OPEN_CHATROOM, var_10_0.friendVO)
	end, SFX_PANEL)
	onButton(arg_10_0, var_10_0.deleteBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("remove_friend_tip"),
			onYes = function()
				arg_10_0:emit(FriendMediator.DELETE_FRIEND, var_10_0.friendVO.id)
			end
		})
	end, SFX_PANEL)
	onButton(arg_10_0, var_10_0.resumeBtn, function()
		arg_10_0:emit(FriendMediator.OPEN_RESUME, var_10_0.friendVO.id)
	end, SFX_PANEL)
	onButton(arg_10_0, var_10_0.backYardBtn, function()
		arg_10_0:emit(FriendMediator.VISIT_BACKYARD, var_10_0.friendVO.id)
	end, SFX_PANEL)

	arg_10_0.friendItems[arg_10_1] = var_10_0
end

function var_0_0.onUpdateItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.friendItems[arg_16_2]

	if not var_16_0 then
		arg_16_0:onInitItem(arg_16_2)

		var_16_0 = arg_16_0.friendItems[arg_16_2]
	end

	local var_16_1 = arg_16_0.friendVOs[arg_16_1 + 1]

	var_16_0:update(var_16_1)
end

function var_0_0.sortFriends(arg_17_0)
	if arg_17_0.contextData.sortData then
		arg_17_0.contextData.sortData.data.func(arg_17_0.friendVOs, arg_17_0.dec)
		setImageSprite(arg_17_0.friendIndexBtn:Find("icon"), GetSpriteFromAtlas("ui/friendsui_atlas", arg_17_0.contextData.sortData.data.spr), true)
		setActive(arg_17_0.sortImgAsc, arg_17_0.dec)
		setActive(arg_17_0.sortImgDec, not arg_17_0.dec)
	end

	arg_17_0.friendRect:SetTotalCount(#arg_17_0.friendVOs, -1)
end

function var_0_0.updateFriendCount(arg_18_0)
	setText(arg_18_0.friendCountTF, #arg_18_0.friendVOs .. "/" .. MAX_FRIEND_COUNT)
end

function var_0_0.initFriendsSortPanel(arg_19_0)
	local var_19_0 = arg_19_0.sortPanel:Find("mask/content")
	local var_19_1 = arg_19_0:getTpl("tpl", var_19_0)

	arg_19_0.friendSortCfg = require("view.friend.FriendSortCfg")

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.friendSortCfg.SORT_TAG) do
		local var_19_2 = cloneTplTo(var_19_1, var_19_0)
		local var_19_3 = var_19_2:Find("arr")

		setImageSprite(var_19_2:Find("Image"), GetSpriteFromAtlas("ui/friendsui_atlas", iter_19_1.spr), true)
		onToggle(arg_19_0, var_19_2, function(arg_20_0)
			if arg_20_0 then
				arg_19_0.sortdata = iter_19_1
				arg_19_0.contextData.sortData = {
					data = arg_19_0.sortdata,
					dec = arg_19_0.dec
				}

				arg_19_0:sortFriends()
				triggerButton(arg_19_0.sortPanel)
			end
		end, SFX_PANEL)

		if iter_19_0 == 1 then
			triggerToggle(var_19_2, true)
		end
	end

	onButton(arg_19_0, arg_19_0.sortPanel, function()
		arg_19_0:closeFriendsSortPanel()
	end, SFX_PANEL)
end

function var_0_0.openFriendsSortPanel(arg_22_0)
	if arg_22_0.contextData.sortData then
		setImageSprite(arg_22_0.sortPanel:Find("index_button/icon"), GetSpriteFromAtlas("ui/friendsui_atlas", arg_22_0.contextData.sortData.data.spr), true)
	end

	setActive(arg_22_0.sortPanel, true)
end

function var_0_0.closeFriendsSortPanel(arg_23_0)
	setActive(arg_23_0.sortPanel, false)
end

function var_0_0.OnDestroy(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(arg_24_0.friendItems or {}) do
		iter_24_1:dispose()
	end
end

return var_0_0
