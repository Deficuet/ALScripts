local var_0_0 = class("DreamlandSpinePlayer")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.holdSpinePlayRecorder = {}
	arg_1_0.effects = {}
	arg_1_0.timers = {}
	arg_1_0.isPlayEffect = {}
end

function var_0_0.Play(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0.root = arg_2_1
	arg_2_0.spineAnimUIList = arg_2_3

	local var_2_0 = arg_2_3[arg_2_2.name]

	if arg_2_4.type == DreamlandData.EXPLORE_TYPE_HOLD then
		local var_2_1 = arg_2_0.holdSpinePlayRecorder[arg_2_2.name]

		arg_2_0:PlayInterActionAnimHold(arg_2_4.sub_type, var_2_0, var_2_1, arg_2_2)

		arg_2_0.holdSpinePlayRecorder[arg_2_2.name] = not defaultValue(var_2_1, false)
	else
		arg_2_0:PlayInterActionAnimOnce(arg_2_4.sub_type, var_2_0, arg_2_2)
	end
end

function var_0_0.PlayInterActionAnimHold(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	local var_3_0 = arg_3_1[1]

	if arg_3_3 then
		local var_3_1 = DreamlandUtil.GetSpineNormalAction(var_3_0)

		arg_3_2:SetAction(var_3_1, 0)

		if var_3_0 == DreamlandData.EXPLORE_SUBTYPE_EFFECT then
			arg_3_0:RemoveEffect(arg_3_1[2])
		end

		if var_3_0 == DreamlandData.EXPLORE_SUBTYPE_UNION then
			local var_3_2 = arg_3_0.spineAnimUIList[arg_3_1[2]]

			if var_3_2 then
				var_3_2:SetAction(var_3_1, 0)
			end
		end
	elseif var_3_0 == DreamlandData.EXPLORE_SUBTYPE_3SEC then
		arg_3_0:PlayAction(arg_3_2, "action", "normal2")
	elseif var_3_0 == DreamlandData.EXPLORE_SUBTYPE_EFFECT then
		arg_3_0:PlayerEffect(-1, arg_3_1[2])
	else
		local var_3_3 = DreamlandUtil.GetSpineInterAction(var_3_0)

		arg_3_2:SetAction(var_3_3, 0)

		if var_3_0 == DreamlandData.EXPLORE_SUBTYPE_UNION then
			local var_3_4 = arg_3_0.spineAnimUIList[arg_3_1[2]]

			if var_3_4 then
				var_3_4:SetAction(var_3_3, 0)
			end
		end
	end
end

function var_0_0.PlayInterActionAnimOnce(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = arg_4_1[1]

	if var_4_0 == DreamlandData.EXPLORE_SUBTYPE_EFFECT then
		arg_4_0:PlayerEffect(arg_4_1[3], arg_4_1[2])
	else
		local var_4_1 = DreamlandUtil.GetSpineInterAction(var_4_0)
		local var_4_2 = DreamlandUtil.GetSpineNormalAction(var_4_0)

		arg_4_0:PlayAction(arg_4_2, var_4_1, var_4_2)

		if var_4_0 == DreamlandData.EXPLORE_SUBTYPE_UNION then
			local var_4_3 = arg_4_0.spineAnimUIList[arg_4_1[2]]

			if var_4_3 then
				arg_4_0:PlayAction(var_4_3, var_4_1, var_4_2)
			end
		end
	end
end

function var_0_0.PlayerEffect(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0.isPlayEffect[arg_5_2] then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	arg_5_0:RemoveEffect(arg_5_2)
	PoolMgr.GetInstance():GetUI(arg_5_2, true, function(arg_6_0)
		arg_5_0.effects[arg_5_2] = arg_6_0

		setParent(arg_6_0, arg_5_0.root)
		setActive(arg_6_0, true)
		pg.UIMgr.GetInstance():LoadingOff()
	end)

	if arg_5_1 > 0 then
		arg_5_0:AddTimer(arg_5_2, arg_5_1)
	end
end

function var_0_0.AddTimer(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.isPlayEffect[arg_7_1] = true
	arg_7_0.timers[arg_7_1] = Timer.New(function()
		arg_7_0:RemoveEffect(arg_7_1)

		arg_7_0.isPlayEffect[arg_7_1] = false
	end, arg_7_2, 1)

	arg_7_0.timers[arg_7_1]:Start()
end

function var_0_0.RemoveTimer(arg_9_0, arg_9_1)
	if arg_9_0.timers[arg_9_1] then
		arg_9_0.timers[arg_9_1]:Stop()

		arg_9_0.timers[arg_9_1] = nil
	end
end

function var_0_0.RemoveEffect(arg_10_0, arg_10_1)
	arg_10_0:RemoveTimer()

	if arg_10_0.effects[arg_10_1] then
		local var_10_0 = arg_10_0.effects[arg_10_1]

		setActive(var_10_0, false)
		PoolMgr.GetInstance():ReturnUI(arg_10_1, var_10_0)

		arg_10_0.effects[arg_10_1] = nil
	end
end

function var_0_0.PlayAction(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local function var_11_0(arg_12_0)
		if arg_12_0 == "finish" then
			arg_11_1:SetActionCallBack(nil)
			arg_11_1:SetAction(arg_11_3, 0)

			if arg_11_4 then
				arg_11_4()
			end
		end
	end

	arg_11_1:SetActionCallBack(nil)
	arg_11_1:SetActionCallBack(var_11_0)
	arg_11_1:SetAction(arg_11_2, 0)
end

function var_0_0.ClearEffects(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.effects) do
		arg_13_0:RemoveEffect(iter_13_0)
	end
end

function var_0_0.Clear(arg_14_0)
	arg_14_0.holdSpinePlayRecorder = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_0.timers) do
		iter_14_1:Stop()
	end

	arg_14_0.timers = {}

	for iter_14_2, iter_14_3 in pairs(arg_14_0.effects) do
		PoolMgr.GetInstance():ReturnUI(iter_14_2, iter_14_3)
	end

	arg_14_0.effects = {}
	arg_14_0.isPlayEffect = {}
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0:Clear()
end

return var_0_0
