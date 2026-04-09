local var_0_0 = class("IslandCheaterTavernTableUnit", import(".IslandSceneUnit"))
local var_0_1 = 180

function var_0_0.OnAttach(arg_1_0, arg_1_1)
	var_0_0.super.OnAttach(arg_1_0, arg_1_1)

	arg_1_0.tf = tf(arg_1_1)
	arg_1_0.animator = arg_1_0.tf:GetComponent(typeof(UnityEngine.Animator))

	local var_1_0 = arg_1_0.tf:GetComponent(typeof(ItemList))

	arg_1_0.turntabletf = var_1_0.prefabItem[0].transform
	arg_1_0.decorationtf = var_1_0.prefabItem[1].transform
	arg_1_0.tableRoot = var_1_0.prefabItem[3].transform
	arg_1_0.decorationAnimator = arg_1_0.decorationtf:GetComponent(typeof(UnityEngine.Animator))
	arg_1_0.trunTalbeTip = var_1_0.prefabItem[4].transform

	setActive(arg_1_0.trunTalbeTip, false)

	arg_1_0.noGotShoot = var_1_0.prefabItem[5].transform
	arg_1_0.boomShoot = var_1_0.prefabItem[6].transform
	arg_1_0.centerRoot = var_1_0.prefabItem[7].transform

	setActive(arg_1_0.boomShoot, false)

	local var_1_1 = 8

	for iter_1_0 = var_1_1, 13 do
		arg_1_0["bombId" .. tostring(iter_1_0 - var_1_1 + 1)] = var_1_0.prefabItem[iter_1_0].transform
	end
end

function var_0_0.OnDetach(arg_2_0)
	var_0_0.super.OnDetach(arg_2_0)
end

function var_0_0.OnFirstTakeShootTip(arg_3_0, arg_3_1)
	setActive(arg_3_0.trunTalbeTip, true)
	arg_3_0.animator:SetTrigger("open")
	arg_3_0.decorationAnimator:SetTrigger("open")
	arg_3_0:InitRotationBySeat(arg_3_1)
	arg_3_0:InitBombId({})
end

function var_0_0.InitBombId(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		for iter_5_0, iter_5_1 in ipairs(arg_4_1) do
			if iter_5_1 == arg_5_0 then
				return true
			end
		end

		return false
	end

	for iter_4_0 = 1, 6 do
		local var_4_1 = var_4_0(iter_4_0)

		setActive(arg_4_0["bombId" .. tostring(iter_4_0)], var_4_1)
	end
end

function var_0_0.GetPrevIds(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = {}

	for iter_6_0 = 1, arg_6_3 do
		local var_6_1 = (arg_6_2 - iter_6_0 - 1) % arg_6_1 + 1

		var_6_0[#var_6_0 + 1] = var_6_1
	end

	return var_6_0
end

function var_0_0.InitRotationBySeat(arg_7_0, arg_7_1)
	local var_7_0 = IslandCheaterTavernConst.seatRotatonY[arg_7_1] - 90

	arg_7_0.tableRoot.transform.localEulerAngles = Vector3(0, var_7_0, 0)
	arg_7_0.centerRoot.localEulerAngles = Vector3(0, IslandCheaterTavernConst.seatRotatonY[arg_7_1], 0)
end

function var_0_0.OnShoot(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5)
	if arg_8_1 and arg_8_4 == 1 then
		setActive(arg_8_0.trunTalbeTip, false)

		arg_8_0.firstTakeShoot = true
	else
		arg_8_0.animator:SetTrigger("open")
		arg_8_0.decorationAnimator:SetTrigger("open")

		arg_8_0.shootOpenTime = 0

		arg_8_0:InitRotationBySeat(arg_8_2)

		local var_8_0 = arg_8_0:GetPrevIds(6, arg_8_3, arg_8_4 - 1)

		arg_8_0:InitBombId(var_8_0)
	end

	arg_8_0.curBombId = arg_8_3
	arg_8_0.hasBombCount = arg_8_4
	arg_8_0.gotShoot = arg_8_5

	if arg_8_0.hasBombCount == 1 then
		arg_8_0.rotateDuration = IslandCheaterTavernConst.firstTurnTime
		arg_8_0.turntabletf.localEulerAngles = Vector3(0, 0, 0)
		arg_8_0.endRotationY = -60 * (arg_8_0.curBombId - 1)
		arg_8_0.rotateTotalAngle = IslandCheaterTavernConst.turnCircleCount * 360 + arg_8_0.endRotationY
		arg_8_0.rotateStartEuler = arg_8_0.turntabletf.localEulerAngles
	else
		local var_8_1 = arg_8_0.curBombId - 1

		var_8_1 = var_8_1 == 0 and 6 or var_8_1

		local var_8_2 = -60 * (var_8_1 - 1)

		arg_8_0.turntabletf.localEulerAngles = Vector3(0, var_8_2, 0)
		arg_8_0.rotateDuration = IslandCheaterTavernConst.afterTurnTime
		arg_8_0.stepStartY = arg_8_0.turntabletf.localEulerAngles.y
		arg_8_0.stepTargetY = arg_8_0.stepStartY - 60
	end
end

function var_0_0.OnUpdate(arg_9_0)
	local var_9_0 = false

	if arg_9_0.shootOpenTime ~= nil then
		arg_9_0.shootOpenTime = arg_9_0.shootOpenTime + Time.deltaTime

		if arg_9_0.shootOpenTime >= 0.2 then
			var_9_0 = true
			arg_9_0.shootOpenTime = nil
		end
	end

	if arg_9_0.firstTakeShoot then
		var_9_0 = true
		arg_9_0.firstTakeShoot = false
	end

	if var_9_0 then
		arg_9_0.rotateTime = 0

		if arg_9_0.hasBombCount == 1 then
			arg_9_0.isRotating = true
		else
			arg_9_0.trunToNextBomb = true
		end
	end

	if arg_9_0.isRotating then
		arg_9_0.rotateTime = arg_9_0.rotateTime + Time.deltaTime

		local var_9_1 = Mathf.Clamp01(arg_9_0.rotateTime / arg_9_0.rotateDuration)
		local var_9_2 = Mathf.SmoothStep(0, 1, var_9_1)
		local var_9_3 = arg_9_0.rotateStartEuler.y + arg_9_0.rotateTotalAngle * var_9_2

		arg_9_0.turntabletf.localEulerAngles = Vector3(arg_9_0.rotateStartEuler.x, var_9_3, arg_9_0.rotateStartEuler.z)

		if var_9_1 >= 1 then
			arg_9_0.isRotating = false
			arg_9_0.turntabletf.localEulerAngles = Vector3(arg_9_0.rotateStartEuler.x, arg_9_0.rotateStartEuler.y + arg_9_0.endRotationY, arg_9_0.rotateStartEuler.z)

			if arg_9_0.gotShoot then
				setActive(arg_9_0.boomShoot, true)
				onDelayTick(function()
					setActive(arg_9_0.boomShoot, false)
					arg_9_0.animator:SetTrigger("close")
					arg_9_0.decorationAnimator:SetTrigger("close")
				end, 1)
			else
				setActive(arg_9_0.noGotShoot, true)
				setActive(arg_9_0["bombId" .. tostring(arg_9_0.curBombId)], true)
				onDelayTick(function()
					setActive(arg_9_0.noGotShoot, false)
					arg_9_0.animator:SetTrigger("close")
					arg_9_0.decorationAnimator:SetTrigger("close")
				end, 1)
			end
		end
	end

	if arg_9_0.trunToNextBomb then
		arg_9_0.rotateTime = arg_9_0.rotateTime + Time.deltaTime

		local var_9_4 = Mathf.Clamp01(arg_9_0.rotateTime / arg_9_0.rotateDuration)
		local var_9_5 = Mathf.SmoothStep(0, 1, var_9_4)
		local var_9_6 = Mathf.LerpAngle(arg_9_0.stepStartY, arg_9_0.stepTargetY, var_9_5)

		arg_9_0.turntabletf.localEulerAngles = Vector3(0, var_9_6, 0)

		if var_9_4 >= 1 then
			arg_9_0.turntabletf.localEulerAngles = Vector3(0, arg_9_0.stepTargetY, 0)

			if arg_9_0.gotShoot then
				setActive(arg_9_0.boomShoot, true)
				onDelayTick(function()
					setActive(arg_9_0.boomShoot, false)
					arg_9_0.animator:SetTrigger("close")
					arg_9_0.decorationAnimator:SetTrigger("close")
				end, 1)
			else
				setActive(arg_9_0.noGotShoot, true)
				setActive(arg_9_0["bombId" .. tostring(arg_9_0.curBombId)], true)
				onDelayTick(function()
					setActive(arg_9_0.noGotShoot, false)
					arg_9_0.animator:SetTrigger("close")
					arg_9_0.decorationAnimator:SetTrigger("close")
				end, 1)
			end

			arg_9_0.trunToNextBomb = false
		end
	end
end

return var_0_0
