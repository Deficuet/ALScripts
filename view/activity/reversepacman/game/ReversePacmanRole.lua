local var_0_0 = class("ReversePacmanRole")

var_0_0.MAX_SPEED = 400
var_0_0.MOVE_TYPE = {
	INTERVAL = 4,
	TURN = 2,
	STATIC = 3,
	STRAIGHT = 1
}
var_0_0.SPEED_STATE = {
	SLOW_DOWN = "slowDown",
	STATIC = "static",
	NORMAL = "normal",
	SPEED_UP = "speedUp"
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.binder = arg_1_1
	arg_1_0._tf = arg_1_2
	arg_1_0.type = arg_1_3.type
	arg_1_0.id = arg_1_3.id
	arg_1_0.nodeId = arg_1_3.nodeId
	arg_1_0.iconTF = arg_1_0._tf:Find("Image")
	arg_1_0.speedUpTF = arg_1_0._tf:Find("speedUp")
	arg_1_0.slowDownTF = arg_1_0._tf:Find("slowDown")
	arg_1_0.staticTF = arg_1_0._tf:Find("static")

	if arg_1_0.type == ReversePacmanConst.ROLE.SHIP then
		LoadImageSpriteAsync(arg_1_0:GetConfig("sd_avatar"), arg_1_0.iconTF)
	end

	setText(arg_1_0._tf:Find("Text"), arg_1_0.id)
	setActive(arg_1_0._tf:Find("Text"), false)

	arg_1_0.x = arg_1_0._tf.localPosition.x
	arg_1_0.y = arg_1_0._tf.localPosition.y
	arg_1_0.alive = true
	arg_1_0.isNeedResetPath = true

	arg_1_0:ClearPath()

	arg_1_0.baseSpeed = arg_1_0:GetConfig("base_speed")
	arg_1_0.buffMul = 1
	arg_1_0.eduMul = arg_1_3.eduBuffMul or 1
	arg_1_0.moveType = arg_1_0:GetConfig("movement_trait_type")
	arg_1_0.moveAgr1 = arg_1_0:GetConfig("movement_trait_param_1")
	arg_1_0.moveAgr2 = tonumber(arg_1_0:GetConfig("movement_trait_param_2"))
	arg_1_0.moveMul = 1
	arg_1_0._lastSegDir = nil
	arg_1_0._straightCount = 0
	arg_1_0._intervalTimer = 0
	arg_1_0._intervalMoving = true
	arg_1_0._intervalMul = 1

	if arg_1_0.moveType == var_0_0.MOVE_TYPE.STATIC then
		arg_1_0.moveMul = 0
	end

	arg_1_0.baseRadius = ReversePacmanConst.ROLE_RADIUS[arg_1_0.type]
	arg_1_0.buffRadiusMul = 1

	arg_1_0:InitWords()
	arg_1_0:RefreshSpeedState()
end

function var_0_0.NeedResetPath(arg_2_0)
	return arg_2_0.isNeedResetPath
end

function var_0_0.RequestReplan(arg_3_0)
	arg_3_0._pendingReplan = true
end

function var_0_0.GetConfig(arg_4_0, arg_4_1)
	return pg.activity_chasing_character[arg_4_0.id][arg_4_1]
end

function var_0_0.SetPath(arg_5_0, arg_5_1)
	arg_5_0.path = arg_5_1 or {}
	arg_5_0.pathIndex = 1
	arg_5_0.isNeedResetPath = false
end

function var_0_0.ClearPath(arg_6_0)
	arg_6_0.path = {}
	arg_6_0.pathIndex = 1
end

function var_0_0.GetCurrentNodeId(arg_7_0, arg_7_1)
	return arg_7_1:GetNodeIdByLocalPos({
		x = arg_7_0.x,
		y = arg_7_0.y
	})
end

function var_0_0.GetCurrentDir(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.path[arg_8_0.pathIndex]

	if not var_8_0 then
		return {
			x = 0,
			y = 0
		}
	end

	local var_8_1 = arg_8_1:GetNodeById(var_8_0)

	if not var_8_1 then
		return {
			x = 0,
			y = 0
		}
	end

	local var_8_2 = var_8_1.pos.x - arg_8_0.x
	local var_8_3 = var_8_1.pos.y - arg_8_0.y
	local var_8_4 = math.sqrt(var_8_2 * var_8_2 + var_8_3 * var_8_3)

	if var_8_4 == 0 then
		return {
			x = 0,
			y = 0
		}
	end

	return {
		x = var_8_2 / var_8_4,
		y = var_8_3 / var_8_4
	}
end

function var_0_0.GetSpeedLimit(arg_9_0)
	local var_9_0 = tonumber(arg_9_0:GetConfig("max_speed"))

	if var_9_0 and var_9_0 > 0 then
		return var_9_0
	end

	return var_0_0.MAX_SPEED
end

function var_0_0.GetSpeed(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1:GetNodeById(arg_10_0.nodeId).tag
	local var_10_1 = ReversePacmanConst.TAG_SPEED_FACTOR[var_10_0]
	local var_10_2 = arg_10_0.baseSpeed * var_10_1 * arg_10_0.buffMul * arg_10_0.eduMul * arg_10_0.moveMul * arg_10_0._intervalMul

	return math.min(arg_10_0:GetSpeedLimit(), var_10_2)
end

function var_0_0.GetSpeedState(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1 and arg_11_0.nodeId and arg_11_0:GetSpeed(arg_11_1) or math.min(arg_11_0:GetSpeedLimit(), arg_11_0.baseSpeed * arg_11_0.buffMul * arg_11_0.eduMul * arg_11_0.moveMul * arg_11_0._intervalMul)

	if var_11_0 <= 0.01 or arg_11_0.moveMul <= 0 or arg_11_0._intervalMul <= 0 then
		return var_0_0.SPEED_STATE.STATIC
	end

	if var_11_0 > arg_11_0.baseSpeed + 0.01 then
		return var_0_0.SPEED_STATE.SPEED_UP
	end

	if var_11_0 < arg_11_0.baseSpeed - 0.01 then
		return var_0_0.SPEED_STATE.SLOW_DOWN
	end

	return var_0_0.SPEED_STATE.NORMAL
end

function var_0_0.ApplySpeedState(arg_12_0, arg_12_1)
	if arg_12_0.speedState == arg_12_1 then
		return
	end

	arg_12_0.speedState = arg_12_1

	setActive(arg_12_0.speedUpTF, arg_12_1 == var_0_0.SPEED_STATE.SPEED_UP)
	setActive(arg_12_0.slowDownTF, arg_12_1 == var_0_0.SPEED_STATE.SLOW_DOWN)
	setActive(arg_12_0.staticTF, arg_12_1 == var_0_0.SPEED_STATE.STATIC)
end

function var_0_0.RefreshSpeedState(arg_13_0, arg_13_1)
	arg_13_0:ApplySpeedState(arg_13_0:GetSpeedState(arg_13_1 or arg_13_0._lastGraph))
end

function var_0_0.GetCaptureRadius(arg_14_0)
	return arg_14_0.baseRadius * arg_14_0.buffRadiusMul
end

function var_0_0.GetPerformanceRange(arg_15_0, arg_15_1)
	return tonumber(arg_15_0:GetConfig("performance_range_" .. arg_15_1)) or ReversePacmanConst.SHIP_PERFORMANCE_RANGE[arg_15_1] or 0
end

function var_0_0.IsOccupyingNode(arg_16_0, arg_16_1)
	if arg_16_0.nodeId == arg_16_1 then
		return true
	end

	return arg_16_0.path and arg_16_0.path[arg_16_0.pathIndex] == arg_16_1
end

function var_0_0.MoveAlongPath(arg_17_0, arg_17_1, arg_17_2)
	if not arg_17_0.alive or not arg_17_2 then
		return
	end

	if not arg_17_0.path or arg_17_0.pathIndex > #arg_17_0.path then
		arg_17_0.isNeedResetPath = true

		return
	end

	local var_17_0 = arg_17_0.path[arg_17_0.pathIndex]
	local var_17_1 = arg_17_2:GetRouteGraph()

	arg_17_0._lastGraph = var_17_1

	if var_17_1:IsBuffBlockById(var_17_0) then
		local var_17_2 = var_17_1:GetNodeById(arg_17_0.nodeId)

		arg_17_0.x = var_17_2.pos.x
		arg_17_0.y = var_17_2.pos.y
		arg_17_0.path = {
			arg_17_0.nodeId
		}
		arg_17_0.pathIndex = 1
		arg_17_0.isNeedResetPath = true
		arg_17_0._prevNodeId = nil

		setLocalPosition(arg_17_0._tf, {
			x = arg_17_0.x,
			y = arg_17_0.y
		})
		arg_17_0:RefreshSpeedState(var_17_1)

		return
	end

	local var_17_3 = var_17_1:GetNodeById(var_17_0)
	local var_17_4 = arg_17_0:GetCurrentDir(var_17_1)
	local var_17_5 = var_17_3.pos.x
	local var_17_6 = var_17_3.pos.y
	local var_17_7 = var_17_5 - arg_17_0.x
	local var_17_8 = var_17_6 - arg_17_0.y
	local var_17_9 = math.sqrt(var_17_7 * var_17_7 + var_17_8 * var_17_8)
	local var_17_10 = arg_17_0:GetSpeed(var_17_1) * arg_17_1
	local var_17_11
	local var_17_12

	if var_17_9 <= var_17_10 then
		arg_17_0.x = var_17_5
		arg_17_0.y = var_17_6
		arg_17_0.pathIndex = arg_17_0.pathIndex + 1

		if arg_17_0.nodeId ~= var_17_0 then
			var_17_11 = var_17_0
			var_17_12 = var_17_3
		end
	else
		arg_17_0.x = arg_17_0.x + var_17_4.x * var_17_10
		arg_17_0.y = arg_17_0.y + var_17_4.y * var_17_10
	end

	if var_17_11 and var_17_12 then
		arg_17_0._prevNodeId = arg_17_0.nodeId
		arg_17_0.nodeId = var_17_11

		arg_17_0:_OnArriveNewCell(var_17_4)

		local var_17_13

		if arg_17_0.type == ReversePacmanConst.ROLE.MONSTER then
			var_17_13 = var_17_12.tag == ReversePacmanConst.TAG.JUNCTION
		else
			var_17_13 = var_17_12.tag ~= ReversePacmanConst.TAG.CORRIDOR
		end

		if arg_17_0._pendingReplan or var_17_13 or arg_17_0:HasBlockedInRemainingPath(var_17_1) then
			arg_17_0.path = {
				arg_17_0.nodeId
			}
			arg_17_0.pathIndex = 1
			arg_17_0.isNeedResetPath = true
		elseif arg_17_0.pathIndex > #arg_17_0.path then
			arg_17_0.isNeedResetPath = true
		end

		arg_17_0._pendingReplan = false
	end

	setLocalPosition(arg_17_0._tf, {
		x = arg_17_0.x,
		y = arg_17_0.y
	})
	arg_17_0:RefreshSpeedState(var_17_1)
end

function var_0_0._OnArriveNewCell(arg_18_0, arg_18_1)
	if arg_18_0.moveType == var_0_0.MOVE_TYPE.STRAIGHT then
		if arg_18_0._lastSegDir and arg_18_0._lastSegDir.x == arg_18_1.x and arg_18_0._lastSegDir.y == arg_18_1.y then
			arg_18_0._straightCount = arg_18_0._straightCount + 1
		else
			arg_18_0._straightCount = 1
		end

		if arg_18_0._straightCount >= (arg_18_0.moveAgr1 or math.huge) then
			arg_18_0.moveMul = arg_18_0.moveMul * (arg_18_0.moveAgr2 or 1)
			arg_18_0._straightCount = 0
		end
	elseif arg_18_0.moveType == var_0_0.MOVE_TYPE.TURN and arg_18_0._lastSegDir then
		local var_18_0 = arg_18_0._lastSegDir.x * arg_18_1.x + arg_18_0._lastSegDir.y * arg_18_1.y

		if (var_18_0 == 1 and 0 or var_18_0 == -1 and 180 or 90) == arg_18_0.moveAgr1 then
			arg_18_0.moveMul = arg_18_0.moveMul * (arg_18_0.moveAgr2 or 1)
		end
	end

	arg_18_0._lastSegDir = arg_18_1
end

function var_0_0.HasBlockedInRemainingPath(arg_19_0, arg_19_1)
	for iter_19_0 = arg_19_0.pathIndex, #arg_19_0.path do
		if arg_19_1:IsBuffBlockById(arg_19_0.path[iter_19_0]) then
			return true
		end
	end

	return false
end

function var_0_0.GetPredictNodeId(arg_20_0, arg_20_1)
	return arg_20_0.path[arg_20_0.pathIndex + arg_20_1]
end

function var_0_0.GetInterceptNodeId(arg_21_0, arg_21_1)
	return arg_21_0.path[arg_21_0.pathIndex + arg_21_1]
end

function var_0_0.InitWords(arg_22_0)
	arg_22_0.words = {}

	for iter_22_0, iter_22_1 in ipairs(arg_22_0:GetConfig("operation_word")) do
		local var_22_0 = iter_22_1[1]

		if not arg_22_0.words[var_22_0] then
			arg_22_0.words[var_22_0] = {}
		end

		for iter_22_2 = 2, #iter_22_1 do
			table.insert(arg_22_0.words[var_22_0], i18n(iter_22_1[iter_22_2]))
		end
	end
end

function var_0_0.GetWordByType(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.words[arg_23_1] or {}

	if #var_23_0 == 0 then
		return string.format("no word config, id:%s type:%s", arg_23_0.id, arg_23_1)
	end

	return var_23_0[math.random(1, #var_23_0)]
end

function var_0_0.IsAlive(arg_24_0)
	return arg_24_0.alive
end

function var_0_0.Kill(arg_25_0)
	arg_25_0.alive = false
	arg_25_0.nodeId = nil
	arg_25_0.path = {}
	arg_25_0.pathIndex = 1
	arg_25_0.speedState = nil

	setActive(arg_25_0._tf, false)
end

function var_0_0.AddBuff(arg_26_0, arg_26_1)
	setImageAlpha(arg_26_0.iconTF, 1)
	blinkAni(go(arg_26_0.iconTF), 0.2, 1)

	local var_26_0 = pg.activity_chasing_skill[arg_26_1].param
	local var_26_1 = tonumber(var_26_0) or 1

	if arg_26_1 == ReversePacmanConst.BUFF.SPEED then
		arg_26_0.buffMul = arg_26_0.buffMul * var_26_1
	elseif arg_26_1 == ReversePacmanConst.BUFF.GIANT then
		arg_26_0.buffRadiusMul = arg_26_0.buffRadiusMul * var_26_1

		setLocalScale(arg_26_0._tf, Vector3(arg_26_0.buffRadiusMul, arg_26_0.buffRadiusMul, arg_26_0.buffRadiusMul))
	end

	arg_26_0:RefreshSpeedState()
end

function var_0_0.SetEffectsScale(arg_27_0, arg_27_1)
	local var_27_0 = {
		arg_27_0.speedUpTF,
		arg_27_0.slowDownTF,
		arg_27_0.staticTF
	}

	for iter_27_0, iter_27_1 in ipairs(var_27_0) do
		eachChild(iter_27_1, function(arg_28_0)
			local var_28_0 = arg_28_0:GetComponent(typeof(ParticleSystem))

			if not IsNil(var_28_0) then
				setLocalScale(arg_28_0, Vector3(arg_27_1, arg_27_1, arg_27_1))
			end
		end)
	end
end

function var_0_0.ShowEffects(arg_29_0)
	setActive(arg_29_0.speedUpTF, true)
	setActive(arg_29_0.slowDownTF, true)
	setActive(arg_29_0.staticTF, true)
end

function var_0_0.HideEffects(arg_30_0)
	setActive(arg_30_0.speedUpTF, false)
	setActive(arg_30_0.slowDownTF, false)
	setActive(arg_30_0.staticTF, false)
end

function var_0_0.Hide(arg_31_0)
	setActive(arg_31_0._tf, false)
end

function var_0_0.Update(arg_32_0, arg_32_1)
	if not arg_32_0.alive then
		return
	end

	if arg_32_0.moveType == var_0_0.MOVE_TYPE.INTERVAL then
		arg_32_0._intervalTimer = arg_32_0._intervalTimer + arg_32_1

		if arg_32_0._intervalMoving then
			if arg_32_0._intervalTimer >= (arg_32_0.moveAgr1 or 0) then
				arg_32_0._intervalTimer = 0
				arg_32_0._intervalMoving = false
				arg_32_0._intervalMul = 0
			end
		elseif arg_32_0._intervalTimer >= (arg_32_0.moveAgr2 or 0) then
			arg_32_0._intervalTimer = 0
			arg_32_0._intervalMoving = true
			arg_32_0._intervalMul = 1
		end
	end

	arg_32_0:RefreshSpeedState()
end

function var_0_0.Dispose(arg_33_0)
	return
end

return var_0_0
