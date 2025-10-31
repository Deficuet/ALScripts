local var_0_0 = class("TowerClimbingGameView", import("..BaseMiniGameView"))

function var_0_0.getUIName(arg_1_0)
	return "TowerClimbingUI"
end

function var_0_0.GetMGData(arg_2_0)
	local var_2_0 = arg_2_0.contextData.miniGameId

	return getProxy(MiniGameProxy):GetMiniGameData(var_2_0):clone()
end

function var_0_0.GetMGHubData(arg_3_0)
	local var_3_0 = arg_3_0.contextData.miniGameId

	return getProxy(MiniGameProxy):GetHubByGameId(var_3_0)
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf:Find("overview/back"), function()
		arg_4_0:emit(var_0_0.ON_BACK)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0._tf:Find("overview/collection"), function()
		arg_4_0:emit(TowerClimbingMediator.ON_COLLECTION)
	end, SFX_PANEL)

	if LOCK_TOWERCLIMBING_AWARD then
		setActive(arg_4_0._tf:Find("overview/collection"), false)
	end
end

function var_0_0.UpdateTip(arg_7_0)
	local var_7_0 = arg_7_0:GetMGData()
	local var_7_1 = TowerClimbingCollectionLayer.New()

	var_7_1:SetData(var_7_0)

	local var_7_2 = _.any({
		1,
		2,
		3
	}, function(arg_8_0)
		return var_7_1:GetAwardState(arg_8_0) == 1
	end)

	setActive(arg_7_0._tf:Find("overview/collection/tip"), var_7_2)
end

function var_0_0.Start(arg_9_0)
	arg_9_0.controller = TowerClimbingController.New()

	arg_9_0.controller.view:SetUI(arg_9_0._go)

	local function var_9_0(arg_10_0, arg_10_1, arg_10_2)
		arg_9_0:emit(TowerClimbingMediator.ON_FINISH, arg_10_0, arg_10_2, arg_10_1)
	end

	local function var_9_1(arg_11_0, arg_11_1)
		print("record map score:", arg_11_0, arg_11_1)
		arg_9_0:emit(TowerClimbingMediator.ON_RECORD_MAP_SCORE, arg_11_0, arg_11_1)
	end

	arg_9_0.controller:SetCallBack(var_9_0, var_9_1)

	local var_9_2 = arg_9_0:PackData()

	arg_9_0.controller:SetUp(var_9_2)
	arg_9_0:UpdateTip()
end

function var_0_0.OnSendMiniGameOPDone(arg_12_0, arg_12_1)
	if arg_12_1.hubid == 9 and arg_12_1.cmd == MiniGameOPCommand.CMD_SPECIAL_GAME and arg_12_1.argList[1] == MiniGameDataCreator.TowerClimbingGameID and arg_12_1.argList[2] == 1 then
		arg_12_0:Start()
	elseif arg_12_1.hubid == 9 and arg_12_1.cmd == MiniGameOPCommand.CMD_COMPLETE or arg_12_1.hubid == 9 and arg_12_1.cmd == MiniGameOPCommand.CMD_SPECIAL_GAME and (arg_12_1.argList[2] == 3 or arg_12_1.argList[2] == 4) then
		local var_12_0 = arg_12_0:PackData()

		arg_12_0.controller:NetUpdateData(var_12_0)
		arg_12_0:UpdateTip()
	end
end

function var_0_0.GetTowerClimbingPageAndScore(arg_13_0)
	local var_13_0 = arg_13_0[1] or {}
	local var_13_1 = 3

	for iter_13_0 = #var_13_0 + 1, var_13_1 do
		table.insert(var_13_0, {
			value = 0,
			value2 = 0,
			key = iter_13_0
		})
	end

	table.sort(var_13_0, function(arg_14_0, arg_14_1)
		return arg_14_0.key < arg_14_1.key
	end)

	local var_13_2 = var_0_0.GetAwardScores()
	local var_13_3 = 0
	local var_13_4 = 1

	for iter_13_1, iter_13_2 in ipairs(var_13_0) do
		local var_13_5 = var_13_2[iter_13_2.key]
		local var_13_6 = var_13_5[#var_13_5]

		if var_13_6 > iter_13_2.value2 or iter_13_1 == #var_13_0 and var_13_6 <= iter_13_2.value2 then
			var_13_3 = iter_13_2.value2
			var_13_4 = iter_13_2.key

			break
		end
	end

	local var_13_7 = {}
	local var_13_8 = arg_13_0[2] or {}
	local var_13_9 = 3

	for iter_13_3 = #var_13_8 + 1, var_13_9 do
		table.insert(var_13_8, {
			value = 0,
			key = iter_13_3
		})
	end

	table.sort(var_13_8, function(arg_15_0, arg_15_1)
		return arg_15_0.key < arg_15_1.key
	end)

	for iter_13_4, iter_13_5 in ipairs(var_13_8) do
		var_13_7[iter_13_5.key] = iter_13_5.value
	end

	return var_13_3, var_13_4, var_13_7
end

function var_0_0.GetAwardScores()
	local var_16_0 = pg.mini_game[MiniGameDataCreator.TowerClimbingGameID].simple_config_data

	return (_.map(var_16_0, function(arg_17_0)
		return arg_17_0[1]
	end))
end

function var_0_0.PackData(arg_18_0)
	local var_18_0 = arg_18_0._tf.rect.width
	local var_18_1 = arg_18_0._tf.rect.height
	local var_18_2 = arg_18_0:GetMGData():GetRuntimeData("kvpElements")
	local var_18_3, var_18_4, var_18_5 = var_0_0.GetTowerClimbingPageAndScore(var_18_2)

	print(var_18_3, "-", var_18_4)

	local var_18_6 = var_0_0.GetAwardScores()

	return {
		shipId = 107031,
		npcName = "TowerClimbingManjuu",
		life = 3,
		screenWidth = var_18_0,
		screenHeight = var_18_1,
		higestscore = var_18_3,
		pageIndex = var_18_4,
		mapScores = var_18_5,
		awards = var_18_6
	}
end

function var_0_0.onBackPressed(arg_19_0)
	if arg_19_0.controller:onBackPressed() then
		return
	end

	arg_19_0:emit(var_0_0.ON_BACK)
end

function var_0_0.willExit(arg_20_0)
	arg_20_0.controller:Dispose()
end

return var_0_0
