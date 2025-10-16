local var_0_0 = class("IslandCoupleActionPlayer", import("..IslandBaseUnit"))
local var_0_1 = 0
local var_0_2 = 1
local var_0_3 = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.playing = false
	arg_1_0.phase = var_0_1

	arg_1_0:Init()
end

function var_0_0.IsPlaying(arg_2_0)
	return arg_2_0.playing
end

function var_0_0.Stop(arg_3_0)
	if not arg_3_0:IsPlaying() then
		return
	end

	if arg_3_0.phase == var_0_1 then
		return
	end

	if arg_3_0.phase == var_0_2 and arg_3_0.playData then
		local var_3_0 = arg_3_0.playData[2]

		arg_3_0:NotifiyCore(ISLAND_EVT.REMOVE_PATH_FINDER, {
			unitId = var_3_0.id,
			unitType = var_3_0.unitType
		})
		arg_3_0:ResetAnimation()
	elseif arg_3_0.phase == var_0_3 and arg_3_0.playData then
		arg_3_0:ResetAnimation()
	end

	arg_3_0:WillExit(arg_3_0.playData[2], arg_3_0.playData[1])
	arg_3_0:Exit(arg_3_0.playData[2], arg_3_0.playData[1])
end

function var_0_0.ResetAnimation(arg_4_0)
	local var_4_0 = arg_4_0.playData[1]
	local var_4_1 = arg_4_0.playData[2]
	local var_4_2 = arg_4_0:GetView():GetUnitModuleWithType(var_4_0.unitType, var_4_0.id)

	if var_4_2 then
		var_4_2:CheckMovement()
	end

	local var_4_3 = arg_4_0:GetView():GetUnitModuleWithType(var_4_1.unitType, var_4_1.id)

	if var_4_3 then
		var_4_3:CheckMovement()
	end
end

function var_0_0.Play(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if not arg_5_2 or not arg_5_1 then
		return
	end

	arg_5_0.playData = {
		arg_5_2,
		arg_5_1
	}

	arg_5_0:EnableOrDisablePlayerOp(arg_5_2, arg_5_1, false)
	arg_5_0:EnableOrDisableUnitSyn(arg_5_2, arg_5_1, false)

	arg_5_0.playing = true

	arg_5_0:SendStartEvent(arg_5_2, arg_5_1)
	arg_5_0:ShowOrHideCancelableBtn(arg_5_2, arg_5_1, true)

	local var_5_0 = false
	local var_5_1 = Vector3(0, 0, 0)

	seriesAsync({
		function(arg_6_0)
			var_5_0, var_5_1 = arg_5_0:NavigateToPoint(arg_5_2, arg_5_1, arg_5_3, arg_6_0)
		end,
		function(arg_7_0)
			onNextTick(arg_7_0)
		end,
		function(arg_8_0)
			if not arg_5_0.playing then
				return
			end

			arg_5_0:EnableOrDisablePlayerSyn(arg_5_1, false)

			if not var_5_0 then
				arg_8_0()

				return
			end

			arg_5_0:Face2Face(var_5_1, arg_5_2, arg_5_1, arg_8_0)
		end,
		function(arg_9_0)
			if not arg_5_0.playing then
				return
			end

			if not var_5_0 then
				arg_9_0()

				return
			end

			arg_5_0:PlayCoupleActions(arg_5_2, arg_5_1, arg_5_3, arg_9_0)
		end,
		function(arg_10_0)
			if not arg_5_0.playing then
				return
			end

			IslandTaskHelper.OnActionEnd(arg_5_3.id)
			arg_5_0:WillExit(arg_5_1, arg_5_2)
			arg_10_0()
		end
	}, function()
		arg_5_0:Exit(arg_5_1, arg_5_2, arg_5_3)
	end)
end

function var_0_0.WillExit(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_1 then
		arg_12_0:EnableOrDisablePlayerSyn(arg_12_1, true)
	end

	if arg_12_2 and arg_12_1 then
		arg_12_0:EnableOrDisableUnitSyn(arg_12_2, arg_12_1, true)
		arg_12_0:EnableOrDisablePlayerOp(arg_12_2, arg_12_1, true)
	end
end

function var_0_0.Exit(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_2 and arg_13_1 then
		arg_13_0:ShowOrHideCancelableBtn(arg_13_2, arg_13_1, false)
		arg_13_0:SendEndEvent(arg_13_2, arg_13_1)
	end

	arg_13_0.playing = false
	arg_13_0.phase = var_0_1
	arg_13_0.playData = nil
end

function var_0_0.ShowOrHideCancelableBtn(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if not (arg_14_0:GetView():IsPlayer(arg_14_1.id) or arg_14_0:GetView():IsPlayer(arg_14_2.id)) then
		return
	end

	if arg_14_3 then
		arg_14_0:NotifiyCore(ISLAND_EVT.START_DO_COUPLE_ACTION)
	else
		arg_14_0:NotifiyCore(ISLAND_EVT.END_DO_COUPLE_ACTION)
	end
end

function var_0_0.SendStartEvent(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_0:GetView():IsPlayer(arg_15_1.id) or arg_15_0:GetView():IsPlayer(arg_15_2.id) then
		arg_15_0:NotifiyCore(ISLAND_EVT.START_COUPLE_ACTION)
	end
end

function var_0_0.SendEndEvent(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_0:GetView():IsPlayer(arg_16_1.id) or arg_16_0:GetView():IsPlayer(arg_16_2.id) then
		arg_16_0:NotifiyCore(ISLAND_EVT.END_COUPLE_ACTION)
	end
end

function var_0_0.NavigateToPoint(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	arg_17_0.phase = var_0_2

	local var_17_0 = arg_17_3.respond_point and arg_17_3.respond_point ~= "" and BuildVector3(arg_17_3.respond_point) or Vector3(0, 0, 2)
	local var_17_1 = var_17_0.magnitude
	local var_17_2 = arg_17_1._go.transform.rotation * var_17_0
	local var_17_3 = arg_17_1._go.transform.position + var_17_2
	local var_17_4 = IslandCalcUtil.GetCanReachOptPoint(arg_17_2._go.transform.position, var_17_1, arg_17_1.agent, arg_17_1._tf.position, var_17_3, 36)

	if not var_17_4 then
		arg_17_4()

		if arg_17_0:GetView():IsPlayer(arg_17_1.id) or arg_17_0:GetView():IsPlayer(arg_17_2.id) then
			arg_17_0:OnNavigateToPointFailed()
		end

		return false
	end

	local var_17_5 = {
		speed = 5,
		waitUntilDone = true,
		hide = false,
		unitId = arg_17_2.id,
		unitType = arg_17_2.unitType,
		position = {
			var_17_4.x,
			var_17_4.y,
			var_17_4.z
		}
	}

	arg_17_0:NotifiyCore(ISLAND_EVT.GEN_PATH_FINDER, {
		navData = var_17_5,
		callback = arg_17_4
	})

	local var_17_6 = IslandCalcUtil.RotationOffset(arg_17_1._go.transform.position, var_17_3, var_17_4)

	return true, var_17_6
end

function var_0_0.OnNavigateToPointFailed(arg_18_0)
	pg.TipsMgr.GetInstance():ShowTips(i18n("island_no_position_to_reponse_action"))
end

function var_0_0.Face2Face(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	local var_19_0 = arg_19_3._go.transform
	local var_19_1 = arg_19_2._go.transform
	local var_19_2 = var_19_1.position - var_19_0.position
	local var_19_3 = Quaternion.LookRotation(var_19_2)

	var_19_0.rotation = Quaternion.Euler(0, var_19_3.eulerAngles.y, 0)
	var_19_1.rotation = arg_19_1 * var_19_1.rotation

	if isa(arg_19_3, IslandPlayerUnit) then
		arg_19_3.targetRotation = var_19_0.rotation
	end

	if isa(arg_19_2, IslandPlayerUnit) then
		arg_19_2.targetRotation = var_19_1.rotation
	end

	arg_19_4()
end

function var_0_0.PlayCoupleActions(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	arg_20_0.phase = var_0_3

	parallelAsync({
		function(arg_21_0)
			arg_20_2:PlayAnimation(arg_20_3.responder_feedback, 0.25, arg_21_0)
		end,
		function(arg_22_0)
			arg_20_1:PlayAnimation(arg_20_3.resource .. "_end", 0.25, arg_22_0)
		end
	}, arg_20_4)
end

function var_0_0.EnableOrDisablePlayerSyn(arg_23_0, arg_23_1, arg_23_2)
	if isa(arg_23_1, IslandPlayerUnit) then
		arg_23_1:ActiveOrDisactive(arg_23_2)
	end
end

function var_0_0.EnableOrDisablePlayerOp(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	if arg_24_0:GetView():IsPlayer(arg_24_1.id) or arg_24_0:GetView():IsPlayer(arg_24_2.id) then
		if arg_24_3 then
			arg_24_0:GetView():EnablePlayerOp()
		else
			arg_24_0:GetView():DisablePlayerOp()
			IslandCameraMgr.instance.gameObject:GetComponent(typeof(InputController)):EnablePlayerLook()
		end
	end
end

function var_0_0.EnableOrDisableUnitSyn(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	local function var_25_0(arg_26_0, arg_26_1)
		if arg_26_1 then
			arg_26_0:WakeUp()
		else
			arg_26_0:Sleep()
		end
	end

	if isa(arg_25_1, IslandVisitorUnit) then
		var_25_0(arg_25_1, arg_25_3)
	end

	if isa(arg_25_2, IslandVisitorUnit) then
		var_25_0(arg_25_2, arg_25_3)
	end
end

return var_0_0
