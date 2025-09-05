local var_0_0 = class("IslandFriendSearchPage", import(".IslandFriendListPage"))
local var_0_1 = 10

function var_0_0.getUIName(arg_1_0)
	return "IslandFriendSearchUI"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.idTxt = arg_2_0:findTF("top/id/Text"):GetComponent(typeof(Text))
	arg_2_0.copyBtn = arg_2_0:findTF("top/id/copy")
	arg_2_0.saerchBtn = arg_2_0:findTF("top/search/copy")
	arg_2_0.searchBar = arg_2_0:findTF("top/search/input")
	arg_2_0.displays = {}

	setText(arg_2_0:findTF("top/id/copy/Text"), i18n("island_btn_label_copy"))
	setText(arg_2_0:findTF("top/search/copy/Text"), i18n("island_search"))
	setText(arg_2_0:findTF("top/search/input/Text"), i18n("island_input_my_id"))
	setText(arg_2_0:findTF("top/id/label"), i18n("island_my_id"))
end

function var_0_0.OnSearch(arg_3_0, arg_3_1)
	arg_3_0.displays = arg_3_1.list

	arg_3_0:InitList()
end

function var_0_0.CreateCard(arg_4_0, arg_4_1)
	return IslandFriendSearchCard.New(arg_4_1)
end

function var_0_0.OnInitItem(arg_5_0, arg_5_1)
	var_0_0.super.OnInitItem(arg_5_0, arg_5_1)

	local var_5_0 = arg_5_0.cards[arg_5_1]

	onButton(arg_5_0, var_5_0.addBtn, function()
		arg_5_0:emit(IslandMediator.ADD_FRIEND, var_5_0.player.id, "")
	end, SFX_PANEL)
end

function var_0_0.InitMoreBtns(arg_7_0, arg_7_1)
	onButton(arg_7_0, arg_7_0.whiteBtn, function()
		arg_7_0:emit(IslandMediator.ADD_WHITE_LIST, arg_7_1.id)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.blackBtn, function()
		arg_7_0:emit(IslandMediator.ADD_BLACK_LIST, arg_7_1.id)
	end, SFX_PANEL)
end

function var_0_0.GetData(arg_10_0, arg_10_1)
	arg_10_1(arg_10_0.displays)
end

function var_0_0.OnInit(arg_11_0)
	var_0_0.super.OnInit(arg_11_0)

	arg_11_0.player = getProxy(PlayerProxy):getRawData()
	arg_11_0.idTxt.text = arg_11_0.player.id

	onButton(arg_11_0, arg_11_0.copyBtn, function()
		UniPasteBoard.SetClipBoardString(arg_11_0.player.id)
		pg.TipsMgr.GetInstance():ShowTips(i18n("friend_id_copy_ok"))
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.saerchBtn, function()
		local var_13_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if arg_11_0.waitTimer and arg_11_0.waitTimer - var_13_0 > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("friend_searchFriend_wait_time", arg_11_0.waitTimer - var_13_0))

			return
		end

		arg_11_0.waitTimer = var_13_0 + var_0_1

		local var_13_1 = getInputText(arg_11_0.searchBar)

		if not var_13_1 or var_13_1 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("friend_inpout_key_tip"))

			return
		end

		arg_11_0:emit(IslandMediator.SEARCH_FRIEND, 3, var_13_1)
	end, SFX_PANEL)
end

return var_0_0
