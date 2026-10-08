local var_0_0 = class("CarWashPhase2Page", import("view.dorm3d.Game.Dorm3dGameBaseSubView"))

function var_0_0.Init(arg_1_0)
	arg_1_0:InitConfig()
	arg_1_0:InitUI()
	arg_1_0:BindEvent()
	arg_1_0:Hide()
end

function var_0_0.InitConfig(arg_2_0)
	arg_2_0.posConfig = pg.dorm3d_carwash_pos[arg_2_0.contextData.gameConfig.pos_phase2]

	assert(arg_2_0.posConfig, "CarWash phase2 pos config not found: " .. tostring(arg_2_0.contextData.gameConfig.pos_phase2))

	arg_2_0.tipInfos = {}
	arg_2_0.displayTipInfos = {}
	arg_2_0.carTipInfo = nil
	arg_2_0.clickedTips = {}
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0.tipContainer = arg_3_0._tf:Find("tips")
	arg_3_0.tipList = UIItemList.New(arg_3_0.tipContainer, arg_3_0._tf:Find("tips/tpl"))

	arg_3_0.tipList:make(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_1 = arg_4_1 + 1

		if arg_4_0 == UIItemList.EventInit then
			onButton(arg_3_0, arg_4_2, function()
				local var_5_0 = arg_3_0.displayTipInfos[arg_4_1]

				if not var_5_0 then
					return
				end

				if var_5_0.isCar then
					arg_3_0:emit(CarWashCarSystem.PLAY_PHASE2_REACTION)

					return
				end

				if arg_3_0.clickedTips[var_5_0.animId] then
					return
				end

				arg_3_0:emit(CarWashGameFlowSystem.PLAY_PHASE2_REACTION, {
					animId = var_5_0.animId
				})
			end)
		elseif arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateTipItem(arg_4_1, arg_4_2)
		end
	end)
end

function var_0_0.BindEvent(arg_6_0)
	arg_6_0:bind(CarWashGameFlowSystem.UPDATE_GAME_STATE, function(arg_7_0, arg_7_1)
		if arg_7_1.newValue == CarWashConst.GAME_STATE.PHASE_2 then
			arg_6_0:Show()
			arg_6_0:ResetTips()
			arg_6_0:Flush()
		elseif arg_7_1.newValue == CarWashConst.GAME_STATE.PHASE_1 or arg_7_1.newValue == CarWashConst.GAME_STATE.END then
			arg_6_0:Hide()
		end
	end)
	arg_6_0:bind(CarWashLadySystem.UPDATE_PHASE2_TIPS, function(arg_8_0, arg_8_1)
		if arg_6_0.contextData.gameStatus.currentState ~= CarWashConst.GAME_STATE.PHASE_2 then
			return
		end

		arg_6_0.tipInfos = arg_8_1 or {}

		arg_6_0:Flush()
	end)
	arg_6_0:bind(CarWashCarSystem.UPDATE_PHASE2_TIP, function(arg_9_0, arg_9_1)
		if arg_6_0.contextData.gameStatus.currentState ~= CarWashConst.GAME_STATE.PHASE_2 then
			return
		end

		arg_6_0.carTipInfo = arg_9_1

		arg_6_0:Flush()
	end)
	arg_6_0:bind(CarWashGameFlowSystem.UPDATE_PHASE2_REACTION_PROGRESS, function(arg_10_0, arg_10_1)
		arg_6_0.clickedTips[arg_10_1.animId] = true

		arg_6_0:Flush()
	end)
end

function var_0_0.Flush(arg_11_0)
	arg_11_0.displayTipInfos = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.tipInfos) do
		table.insert(arg_11_0.displayTipInfos, iter_11_1)
	end

	if arg_11_0.carTipInfo then
		table.insert(arg_11_0.displayTipInfos, arg_11_0.carTipInfo)
	end

	arg_11_0.tipList:align(#arg_11_0.displayTipInfos)
end

function var_0_0.UpdateTipItem(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.displayTipInfos[arg_12_1]

	assert(var_12_0, "CarWash phase2 tip info not found: " .. tostring(arg_12_1))
	setActive(arg_12_2, var_12_0.visible)

	if var_12_0.visible then
		setLocalPosition(arg_12_2, LuaHelper.ScreenToLocal(arg_12_0.tipContainer, var_12_0.screenPosition, pg.UIMgr.GetInstance().uiCameraComp))
	end
end

function var_0_0.ResetTips(arg_13_0)
	arg_13_0.tipInfos = {}
	arg_13_0.displayTipInfos = {}
	arg_13_0.carTipInfo = nil
	arg_13_0.clickedTips = {}
end

return var_0_0
