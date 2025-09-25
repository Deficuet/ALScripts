local var_0_0 = class("IslandCoupleActionPlayer", import("..IslandBaseUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)
	arg_1_0:Init()
end

function var_0_0.Play(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if not arg_2_2 or not arg_2_1 then
		return
	end

	arg_2_0:EnableOrDisablePlayerOp(arg_2_2, arg_2_1, false)
	arg_2_0:EnableOrDisableUnitSyn(arg_2_2, arg_2_1, false)
	arg_2_0:SendStartEvent(arg_2_2, arg_2_1)

	local var_2_0 = false
	local var_2_1 = Vector3(0, 0, 0)

	seriesAsync({
		function(arg_3_0)
			var_2_0, var_2_1 = arg_2_0:NavigateToPoint(arg_2_2, arg_2_1, arg_2_3, arg_3_0)
		end,
		function(arg_4_0)
			onNextTick(arg_4_0)
		end,
		function(arg_5_0)
			arg_2_0:EnableOrDisablePlayerSyn(arg_2_1, false)

			if not var_2_0 then
				arg_5_0()

				return
			end

			arg_2_0:Face2Face(var_2_1, arg_2_2, arg_2_1, arg_5_0)
		end,
		function(arg_6_0)
			if not var_2_0 then
				arg_6_0()

				return
			end

			arg_2_0:PlayCoupleActions(arg_2_2, arg_2_1, arg_2_3, arg_6_0)
		end,
		function(arg_7_0)
			IslandTaskHelper.OnActionEnd(arg_2_3.id)
			arg_2_0:EnableOrDisablePlayerSyn(arg_2_1, true)
			arg_2_0:EnableOrDisableUnitSyn(arg_2_2, arg_2_1, true)
			arg_2_0:EnableOrDisablePlayerOp(arg_2_2, arg_2_1, true)
			arg_7_0()
		end
	}, function()
		arg_2_0:SendEndEvent(arg_2_2, arg_2_1)
	end)
end

function var_0_0.SendStartEvent(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0:GetView():IsPlayer(arg_9_1.id) or arg_9_0:GetView():IsPlayer(arg_9_2.id) then
		arg_9_0:NotifiyCore(ISLAND_EVT.START_COUPLE_ACTION)
	end
end

function var_0_0.SendEndEvent(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_0:GetView():IsPlayer(arg_10_1.id) or arg_10_0:GetView():IsPlayer(arg_10_2.id) then
		arg_10_0:NotifiyCore(ISLAND_EVT.END_COUPLE_ACTION)
	end
end

function var_0_0.NavigateToPoint(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = arg_11_3.respond_point and arg_11_3.respond_point ~= "" and BuildVector3(arg_11_3.respond_point) or Vector3(0, 0, 2)
	local var_11_1 = var_11_0.magnitude
	local var_11_2 = arg_11_1._go.transform.rotation * var_11_0
	local var_11_3 = arg_11_1._go.transform.position + var_11_2
	local var_11_4 = IslandCalcUtil.GetCanReachOptPoint(arg_11_2._go.transform.position, var_11_1, arg_11_1.agent, arg_11_1._tf.position, var_11_3, 36)

	if not var_11_4 then
		arg_11_4()

		if arg_11_0:GetView():IsPlayer(arg_11_1.id) or arg_11_0:GetView():IsPlayer(arg_11_2.id) then
			arg_11_0:OnNavigateToPointFailed()
		end

		return false
	end

	local var_11_5 = {
		speed = 5,
		waitUntilDone = true,
		hide = false,
		unitId = arg_11_2.id,
		unitType = arg_11_2.unitType,
		position = {
			var_11_4.x,
			var_11_4.y,
			var_11_4.z
		}
	}

	arg_11_0:NotifiyCore(ISLAND_EVT.GEN_PATH_FINDER, {
		navData = var_11_5,
		callback = arg_11_4
	})

	local var_11_6 = IslandCalcUtil.RotationOffset(arg_11_1._go.transform.position, var_11_3, var_11_4)

	return true, var_11_6
end

function var_0_0.OnNavigateToPointFailed(arg_12_0)
	pg.TipsMgr.GetInstance():ShowTips(i18n("island_no_position_to_reponse_action"))
end

function var_0_0.Face2Face(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	local var_13_0 = arg_13_3._go.transform
	local var_13_1 = arg_13_2._go.transform
	local var_13_2 = var_13_1.position - var_13_0.position
	local var_13_3 = Quaternion.LookRotation(var_13_2)

	var_13_0.rotation = Quaternion.Euler(0, var_13_3.eulerAngles.y, 0)
	var_13_1.rotation = arg_13_1 * var_13_1.rotation

	if isa(arg_13_3, IslandPlayerUnit) then
		arg_13_3.targetRotation = var_13_0.rotation
	end

	if isa(arg_13_2, IslandPlayerUnit) then
		arg_13_2.targetRotation = var_13_1.rotation
	end

	arg_13_4()
end

function var_0_0.PlayCoupleActions(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	parallelAsync({
		function(arg_15_0)
			arg_14_2:PlayAnimation(arg_14_3.responder_feedback, 0.25, arg_15_0)
		end,
		function(arg_16_0)
			arg_14_1:PlayAnimation(arg_14_3.resource .. "_end", 0.25, arg_16_0)
		end
	}, arg_14_4)
end

function var_0_0.EnableOrDisablePlayerSyn(arg_17_0, arg_17_1, arg_17_2)
	if isa(arg_17_1, IslandPlayerUnit) then
		arg_17_1:ActiveOrDisactive(arg_17_2)
	end
end

function var_0_0.EnableOrDisablePlayerOp(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if arg_18_0:GetView():IsPlayer(arg_18_1.id) or arg_18_0:GetView():IsPlayer(arg_18_2.id) then
		if arg_18_3 then
			arg_18_0:GetView():EnablePlayerOp()
		else
			arg_18_0:GetView():DisablePlayerOp()
			IslandCameraMgr.instance.gameObject:GetComponent(typeof(InputController)):EnablePlayerLook()
		end
	end
end

function var_0_0.EnableOrDisableUnitSyn(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local function var_19_0(arg_20_0, arg_20_1)
		if arg_20_1 then
			arg_20_0:WakeUp()
		else
			arg_20_0:Sleep()
		end
	end

	if isa(arg_19_1, IslandVisitorUnit) then
		var_19_0(arg_19_1, arg_19_3)
	end

	if isa(arg_19_2, IslandVisitorUnit) then
		var_19_0(arg_19_2, arg_19_3)
	end
end

return var_0_0
