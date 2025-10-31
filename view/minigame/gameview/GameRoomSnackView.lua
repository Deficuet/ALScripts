local var_0_0 = class("GameRoomSnackView", import(".GameRoomBaseSnackView"))

function var_0_0.getUIName(arg_1_0)
	return "GameRoomSnackUI"
end

function var_0_0.OnSendMiniGameOPDone(arg_2_0)
	arg_2_0:updateCount()
end

function var_0_0.OnGetAwardDone(arg_3_0)
	if arg_3_0.coinLayerVisible then
		arg_3_0:openCoinLayer(true)
	end
end

function var_0_0.addListener(arg_4_0)
	var_0_0.super.addListener(arg_4_0)

	if arg_4_0:getGameRoomData() then
		arg_4_0.gameHelpTip = arg_4_0:getGameRoomData().game_help
	end

	onButton(arg_4_0, arg_4_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = arg_4_0.gameHelpTip
		})
	end, SFX_PANEL)
end

function var_0_0.updateSDModel(arg_6_0)
	local var_6_0 = getProxy(PlayerProxy):getData()
	local var_6_1 = getProxy(BayProxy)
	local var_6_2 = "Z28"

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetSpineChar(var_6_2, true, function(arg_7_0)
		pg.UIMgr.GetInstance():LoadingOff()

		arg_6_0.prefab = var_6_2
		arg_6_0.model = arg_7_0
		tf(arg_7_0).localScale = Vector3(1, 1, 1)

		arg_7_0:GetComponent("SpineAnimUI"):SetAction("stand2", 0)
		setParent(arg_7_0, arg_6_0.spineCharContainer)
	end)
end

function var_0_0.updateSelectedList(arg_8_0, arg_8_1)
	arg_8_1 = arg_8_1 or {}

	for iter_8_0 = 1, var_0_0.Order_Num do
		local var_8_0 = arg_8_0.selectedContainer:GetChild(iter_8_0 - 1)
		local var_8_1 = var_8_0:Find("Empty")
		local var_8_2 = var_8_0:Find("Full")
		local var_8_3 = var_8_2:Find("SnackImg")

		arg_8_0.selectedTFList[iter_8_0] = var_8_0

		local var_8_4 = arg_8_1[iter_8_0]

		setActive(var_8_2, var_8_4)
		setActive(var_8_1, not var_8_4)

		if var_8_4 then
			setImageSprite(var_8_3, GetSpriteFromAtlas("ui/minigameui/newyearsnackui_atlas", "snack_" .. var_8_4))
		end
	end
end

function var_0_0.updateSnackList(arg_9_0, arg_9_1)
	for iter_9_0 = 1, var_0_0.Snack_Num do
		local var_9_0 = arg_9_0.snackContainer:GetChild(iter_9_0 - 1)
		local var_9_1 = var_9_0:Find("SnackImg")
		local var_9_2 = arg_9_1[iter_9_0]

		setImageSprite(var_9_1, GetSpriteFromAtlas("ui/minigameui/newyearsnackui_atlas", "snack_" .. var_9_2))

		local var_9_3 = var_9_0:Find("SelectedTag")

		setActive(var_9_3, false)

		arg_9_0.snackTFList[iter_9_0] = var_9_0
		iter_9_0 = iter_9_0 + 1
	end
end

function var_0_0.updateSelectedOrderTag(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.selectedSnackTFList) do
		local var_10_0 = iter_10_1:Find("SelectedTag")

		if arg_10_1 then
			setActive(var_10_0, false)
		else
			local var_10_1 = table.indexof(arg_10_0.selectedIDList, iter_10_0, 1)

			setImageSprite(var_10_0, GetSpriteFromAtlas("ui/minigameui/newyearsnackui_atlas", "order_" .. var_10_1))
		end
	end
end

function var_0_0.openResultView(arg_11_0)
	arg_11_0.packageData = {
		orderIDList = arg_11_0.orderIDList,
		selectedIDList = arg_11_0.selectedIDList,
		countTime = arg_11_0.countTime,
		score = arg_11_0.score,
		correctNumToEXValue = arg_11_0:GetMGData():getConfig("simple_config_data").correct_value,
		scoreLevel = arg_11_0:GetMGData():getConfig("simple_config_data").score_level,
		onSubmit = function(arg_12_0)
			arg_11_0:SendSuccess(arg_11_0.packageData.score and arg_11_0.packageData.score or 0)

			arg_11_0.score = 0
			arg_11_0.countTime = nil
			arg_11_0.leftTime = arg_11_0.orginSelectTime
			arg_11_0.orderIDList = {}
			arg_11_0.selectedIDList = {}
			arg_11_0.snackIDList = {}

			arg_11_0:updateSelectedOrderTag(true)

			arg_11_0.selectedSnackTFList = {}

			arg_11_0:openCoinLayer(true)
			arg_11_0.animtor:SetBool("AniSwitch", var_0_0.Ani_Open_2_Close)
			arg_11_0:setState(var_0_0.States_Before)
		end,
		onContinue = function()
			arg_11_0.score = arg_11_0.packageData.score
			arg_11_0.leftTime = arg_11_0.packageData.countTime
			arg_11_0.orderIDList = {}
			arg_11_0.selectedIDList = {}
			arg_11_0.snackIDList = {}
			arg_11_0.selectedSnackTFList = {}

			arg_11_0.animtor:SetBool("AniSwitch", var_0_0.Ani_Open_2_Close)
			arg_11_0:setState(var_0_0.States_Memory)
		end
	}
	arg_11_0.snackResultView = NewYearSnackResultView.New(arg_11_0._tf, arg_11_0.event, arg_11_0.packageData)

	arg_11_0.snackResultView:Reset()
	arg_11_0.snackResultView:Load()
end

return var_0_0
