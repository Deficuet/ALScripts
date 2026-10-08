local var_0_0 = class("CarWashGamePage", import("view.dorm3d.Game.Dorm3dGameBaseSubView"))

var_0_0.GUN_COUNT = 3

function var_0_0.Init(arg_1_0)
	arg_1_0:InitConfig()
	arg_1_0:InitUI()
	arg_1_0:BindEvent()
end

function var_0_0.InitConfig(arg_2_0)
	arg_2_0.posConfig = _.map(arg_2_0.contextData.gameConfig.pos, function(arg_3_0)
		return pg.dorm3d_carwash_pos[arg_3_0]
	end)
	arg_2_0.selectPosIndex = 1
	arg_2_0.posUnlock = _.map(arg_2_0.posConfig, function(arg_4_0)
		return arg_4_0.mood_value <= arg_2_0.contextData.gameStatus.heartBeatValue
	end)
	arg_2_0.heartBeatDotVals = _.map(arg_2_0.posConfig, function(arg_5_0)
		return arg_5_0.mood_value
	end)

	table.insert(arg_2_0.heartBeatDotVals, 100)
end

function var_0_0.InitUI(arg_6_0)
	onButton(arg_6_0, arg_6_0._tf:Find("bottom/btn_shoot"), function()
		arg_6_0:emit(CarWashGameFlowSystem.SWITCH_SHOOTING)
	end)

	arg_6_0.gunList = UIItemList.New(arg_6_0._tf:Find("bottom/guns"), arg_6_0._tf:Find("bottom/guns/gun1"))

	arg_6_0.gunList:make(function(arg_8_0, arg_8_1, arg_8_2)
		arg_8_1 = arg_8_1 + 1

		if arg_8_0 == UIItemList.EventInit then
			onButton(arg_6_0, arg_8_2, function()
				if arg_6_0.contextData.gameStatus.isShooting then
					return
				end

				if arg_6_0.contextData.gameStatus.currentGunType == arg_8_1 then
					return
				end

				arg_6_0:emit(CarWashGameFlowSystem.SWITCH_GUN_TYPE, arg_8_1)
			end)
		elseif arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = arg_6_0.contextData.gameStatus.currentGunType == arg_8_1

			setActive(arg_8_2:Find("select"), var_8_0)
			setActive(arg_8_2:Find("unselect"), not var_8_0)
		end
	end)
	arg_6_0.gunList:align(var_0_0.GUN_COUNT)

	arg_6_0.camsList = UIItemList.New(arg_6_0._tf:Find("left/cams"), arg_6_0._tf:Find("left/cams/camTpl"))

	arg_6_0.camsList:make(function(arg_10_0, arg_10_1, arg_10_2)
		arg_10_1 = arg_10_1 + 1

		if arg_10_0 == UIItemList.EventInit then
			onButton(arg_6_0, arg_10_2, function()
				if arg_6_0.posUnlock[arg_10_1] and arg_6_0.selectPosIndex ~= arg_10_1 then
					arg_6_0.selectPosIndex = arg_10_1

					arg_6_0:Flush()
					arg_6_0:emit(CarWashTimelineSystem.PLAY_TRANSITION, {
						waitHold = true,
						type = CarWashTimelineSystem.TRANSITION.BLACK,
						onHold = function(arg_12_0, arg_12_1)
							arg_6_0:emit(CarWashGameFlowSystem.SWITCH_LADY_POS, arg_6_0.posConfig[arg_6_0.selectPosIndex].id)
							arg_12_0()
						end
					})
				end
			end)
		elseif arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_6_0.posUnlock[arg_10_1]
			local var_10_1 = arg_6_0.selectPosIndex == arg_10_1

			setActive(arg_10_2:Find("lock"), not var_10_0)
			setActive(arg_10_2:Find("normal"), var_10_0 and not var_10_1)
			setActive(arg_10_2:Find("select"), var_10_1)
		end
	end)
	arg_6_0.camsList:align(#arg_6_0.posConfig)

	arg_6_0.favorList = UIItemList.New(arg_6_0._tf:Find("left/favor/bar_root"), arg_6_0._tf:Find("left/favor/bar_root/bar"))

	arg_6_0.favorList:make(function(arg_13_0, arg_13_1, arg_13_2)
		arg_13_1 = arg_13_1 + 2

		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = arg_6_0.heartBeatDotVals[arg_13_1]
			local var_13_1 = arg_6_0.heartBeatDotVals[arg_13_1 - 1]
			local var_13_2 = var_13_0 - var_13_1
			local var_13_3 = math.max(0, math.min(arg_6_0.contextData.gameStatus.heartBeatValue - var_13_1, var_13_2))
			local var_13_4 = var_13_3 / var_13_2

			arg_13_2:GetComponent(typeof(Slider)).value = var_13_4

			setActive(arg_13_2:Find("dot/fill"), var_13_3 == var_13_2)
			setActive(arg_13_2:Find("mask/Vx_bar"), var_13_4 > 0 and var_13_4 < 1)
		end
	end)
	arg_6_0.favorList:align(#arg_6_0.heartBeatDotVals - 1)

	arg_6_0.cleanPersentText = arg_6_0._tf:Find("top/clean/clean_rate")
	arg_6_0.cleanRank = arg_6_0._tf:Find("top/clean/rank")
	arg_6_0.timeText = arg_6_0._tf:Find("top/clean/time")

	arg_6_0:UpdateTimeText(CarWashConst.GAME_DURATION)
	setText(arg_6_0._tf:Find("left/favor/text"), i18n("dorm3d_carwash_mood"))
	setText(arg_6_0._tf:Find("top/clean/clean_text"), i18n("dorm3d_carwash_clean"))
end

function var_0_0.BindEvent(arg_14_0)
	arg_14_0:bind(CarWashGameFlowSystem.GAME_RESET, function()
		arg_14_0:InitConfig()
		arg_14_0:Flush()

		arg_14_0.needsRelock = true
	end)
	arg_14_0:bind(CarWashGameFlowSystem.UPDATE_IS_SHOOTING, function()
		arg_14_0:FlushShooting()
	end)
	arg_14_0:bind(CarWashGameFlowSystem.UPDATE_COUNTDOWN, function(arg_17_0, arg_17_1)
		arg_14_0:UpdateTimeText(arg_17_1.remainingSeconds)
	end)
	arg_14_0:bind(CarWashGameFlowSystem.UPDATE_HEART_BEAT_VALUE, function(arg_18_0, arg_18_1)
		for iter_18_0, iter_18_1 in ipairs(arg_14_0.posConfig) do
			if not arg_14_0.posUnlock[iter_18_0] and iter_18_1.mood_value <= arg_18_1.newValue then
				arg_14_0.posUnlock[iter_18_0] = true

				local var_18_0 = arg_14_0._tf:Find("left/cams"):GetChild(iter_18_0 - 1)

				triggerButton(var_18_0)
				var_18_0:GetComponent(typeof(Animation)):Play("anim_Dorm3dCarWashUI_lock_out")
			end
		end

		arg_14_0:Flush()
	end)
	arg_14_0:bind(CarWashGameFlowSystem.UPDATE_STAINS_COUNT, function(arg_19_0, arg_19_1)
		arg_14_0:FlushCleanPersent()
	end)
	arg_14_0:bind(CarWashGameFlowSystem.UPDATE_CURRENT_GUN_TYPE, function(arg_20_0, arg_20_1)
		arg_14_0:Flush()
	end)
	arg_14_0:bind(CarWashGameFlowSystem.UPDATE_GAME_STATE, function(arg_21_0, arg_21_1)
		if arg_21_1.newValue == CarWashConst.GAME_STATE.PHASE_1 then
			arg_14_0:Show()

			if arg_14_0.needsRelock then
				arg_14_0.needsRelock = false

				arg_14_0:PlayRelockAnim()
			end
		elseif arg_21_1.newValue == CarWashConst.GAME_STATE.PHASE_2 or arg_21_1.newValue == CarWashConst.GAME_STATE.END then
			arg_14_0:Hide()
		end
	end)
end

function var_0_0.PlayRelockAnim(arg_22_0)
	local var_22_0 = arg_22_0._tf:Find("left/cams")

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.posUnlock) do
		if not iter_22_1 then
			var_22_0:GetChild(iter_22_0 - 1):GetComponent(typeof(Animation)):Play("anim_Dorm3dCarWashUI_relock")
		end
	end
end

function var_0_0.UpdateTimeText(arg_23_0, arg_23_1)
	setText(arg_23_0.timeText, arg_23_0:FormatTime(arg_23_1))
end

function var_0_0.FormatTime(arg_24_0, arg_24_1)
	arg_24_1 = math.max(arg_24_1 or 0, 0)

	local var_24_0 = math.floor(arg_24_1 / 60)
	local var_24_1 = arg_24_1 % 60

	return string.format("%02d:%02d", var_24_0, var_24_1)
end

function var_0_0.FlushShooting(arg_25_0)
	setActive(arg_25_0._tf:Find("bottom/btn_shoot/on"), arg_25_0.contextData.gameStatus.isShooting)
	setActive(arg_25_0._tf:Find("bottom/btn_shoot/off"), not arg_25_0.contextData.gameStatus.isShooting)
end

function var_0_0.Flush(arg_26_0)
	arg_26_0:FlushShooting()
	arg_26_0.gunList:align(var_0_0.GUN_COUNT)
	arg_26_0.camsList:align(#arg_26_0.posConfig)
	arg_26_0.favorList:align(#arg_26_0.heartBeatDotVals - 1)
	arg_26_0:FlushCleanPersent()
end

function var_0_0.FlushCleanPersent(arg_27_0)
	local var_27_0 = arg_27_0:GetCleanPersent()
	local var_27_1 = arg_27_0:GetRank(var_27_0)

	setText(arg_27_0.cleanPersentText, var_27_0 .. "%")
	eachChild(arg_27_0.cleanRank, function(arg_28_0)
		setActive(arg_28_0, arg_28_0.name == var_27_1)
	end)
end

function var_0_0.GetCleanPersent(arg_29_0)
	if arg_29_0.contextData.gameStatus.stainsCountMax == 0 then
		return 0
	end

	local var_29_0 = 1 - arg_29_0.contextData.gameStatus.stainsCount / arg_29_0.contextData.gameStatus.stainsCountMax

	return (math.floor(var_29_0 * 100))
end

function var_0_0.GetRank(arg_30_0, arg_30_1)
	return CarWashConst.GetScoreRank(arg_30_1)
end

return var_0_0
