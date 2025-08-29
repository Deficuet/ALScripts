local var_0_0 = class("IslandTargetTracker")
local var_0_1 = {
	200,
	180
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._tf = arg_1_1
	arg_1_0.distanceTr = findTF(arg_1_0._tf, "distance")

	setActive(arg_1_0.distanceTr, true)

	arg_1_0.cg = GetOrAddComponent(arg_1_0.distanceTr, typeof(CanvasGroup))
	arg_1_0.cg.alpha = 0
	arg_1_0.arrTr = findTF(arg_1_0.distanceTr, "arr")
	arg_1_0.distanceTxt = arg_1_0.distanceTr:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.screenSize = Vector2(Screen.width, Screen.height)
	arg_1_0.screenCenter = Vector2(arg_1_0.screenSize.x * 0.5, arg_1_0.screenSize.y * 0.5)
	arg_1_0.radiusOfEllipse = Vector2(var_0_1[1], var_0_1[2])
	arg_1_0.lines = {}
	arg_1_0.targetosition = Vector3.zero
	arg_1_0.lerpSpeed = 25
	arg_1_0.showHudDic = {}
end

function var_0_0.Tracking(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0:SetUp(arg_2_1, arg_2_2, arg_2_3)
end

function var_0_0.UnTracking(arg_3_0)
	arg_3_0:Clear()
end

function var_0_0.Update(arg_4_0)
	if arg_4_0.cg.alpha == 0 then
		return
	end

	arg_4_0.distanceTr.localPosition = Vector3.Lerp(arg_4_0.distanceTr.localPosition, arg_4_0.targetosition, Time.deltaTime * arg_4_0.lerpSpeed)
end

function var_0_0.Disable(arg_5_0)
	arg_5_0.isDisable = true
	arg_5_0.cg.alpha = 0
end

function var_0_0.Enable(arg_6_0)
	arg_6_0.isDisable = false
end

function var_0_0.OnShowHud(arg_7_0, arg_7_1)
	arg_7_0.showHudDic[arg_7_1] = true
end

function var_0_0.OnHideHud(arg_8_0, arg_8_1)
	arg_8_0.showHudDic[arg_8_1] = nil
end

function var_0_0.SetUp(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_0:ShutDown()

	arg_9_0.trackId = arg_9_3
	arg_9_0.timer = Timer.New(function()
		if IsNil(arg_9_2) then
			arg_9_0.cg.alpha = 0

			return
		end

		local var_10_0 = arg_9_2.transform.position
		local var_10_1 = IslandCalcUtil.IsInViewport(var_10_0)
		local var_10_2 = not arg_9_0.isDisable and (not var_10_1 or not arg_9_0.showHudDic[arg_9_0.trackId])

		arg_9_0.cg.alpha = var_10_2 and 1 or 0

		if not var_10_2 then
			return
		end

		local var_10_3 = Vector3.Distance(var_10_0, arg_9_1.transform.position)

		arg_9_0.distanceTxt.text = math.ceil(var_10_3) .. "M"

		local var_10_4, var_10_5 = arg_9_0:CalcPosition(arg_9_2.transform)

		arg_9_0.targetosition = Vector3(var_10_4.x, var_10_4.y, 0)
		arg_9_0.arrTr.localEulerAngles = Vector3(0, 0, var_10_5)
	end, Time.deltaTime, -1)

	arg_9_0.timer:Start()
end

function var_0_0.CalcPosition(arg_11_0, arg_11_1)
	local var_11_0 = IslandCameraMgr.instance._mainCamera
	local var_11_1 = var_11_0:WorldToScreenPoint(arg_11_1.transform.position)
	local var_11_2 = var_11_0.gameObject.transform.forward
	local var_11_3 = (arg_11_1.transform.position - var_11_0.gameObject.transform.position).normalized

	if Vector3.Dot(var_11_2, var_11_3) <= 0 then
		local var_11_4 = arg_11_0.screenSize.x - var_11_1.x
		local var_11_5 = arg_11_0.screenSize.y - var_11_1.y

		var_11_1 = Vector3(var_11_4, var_11_5, 0)
	end

	local var_11_6 = Vector2(var_11_1.x, var_11_1.y) - arg_11_0.screenCenter

	if math.pow(var_11_6.x / arg_11_0.radiusOfEllipse.x, 2) + math.pow(var_11_6.y / arg_11_0.radiusOfEllipse.y, 2) > 1 then
		local var_11_7 = var_11_6.y / (var_11_6.x + 1e-07)
		local var_11_8 = Mathf.Pow(arg_11_0.radiusOfEllipse.x * arg_11_0.radiusOfEllipse.y, 2)
		local var_11_9 = Mathf.Pow(arg_11_0.radiusOfEllipse.y, 2) + Mathf.Pow(var_11_7, 2) * Mathf.Pow(arg_11_0.radiusOfEllipse.x, 2)
		local var_11_10 = math.sqrt(var_11_8 / var_11_9)

		if math.sign(var_11_10) ~= math.sign(var_11_6.x) then
			var_11_10 = -1 * var_11_10
		end

		local var_11_11 = var_11_10 * var_11_7

		return Vector2(var_11_10, var_11_11), IslandCalcUtil.SignedAngle(Vector2.up, Vector2(var_11_6.x, var_11_6.y))
	else
		return var_11_6, IslandCalcUtil.SignedAngle(Vector2.up, Vector2(var_11_6.x, var_11_6.y))
	end
end

function var_0_0.DrawLine(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = IslandCalcUtil.GetNavPath(arg_12_1, arg_12_2)

	local function var_12_1(arg_13_0, arg_13_1)
		local var_13_0 = 1
		local var_13_1 = var_12_0[arg_13_1 + 1] or arg_12_2
		local var_13_2 = var_12_0[arg_13_1]
		local var_13_3 = (var_13_1 - var_13_2).normalized
		local var_13_4 = Quaternion.FromToRotation(arg_13_0.transform.right * -1, var_13_3)
		local var_13_5 = Vector3.Distance(var_13_1, var_13_2)

		return var_13_4, var_13_5
	end

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		local var_12_2 = Object.Instantiate(arg_12_0.lineTpl)
		local var_12_3, var_12_4 = var_12_1(var_12_2, iter_12_0)

		var_12_2.transform.rotation = var_12_2.transform.rotation * var_12_3
		var_12_2.transform.localScale = Vector3(var_12_4, 1, 1)

		local var_12_5 = var_12_2.transform.right * -1 * (var_12_4 * 0.5)

		var_12_2.transform.position = iter_12_1 + var_12_5

		table.insert(arg_12_0.lines, var_12_2)
	end
end

function var_0_0.ClearLine(arg_14_0)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.lines) do
		Object.Destroy(iter_14_1.gameObject)
	end

	arg_14_0.lines = {}
end

function var_0_0.ShutDown(arg_15_0)
	if arg_15_0.timer then
		arg_15_0.timer:Stop()

		arg_15_0.timer = nil
	end

	arg_15_0.cg.alpha = 0
	arg_15_0.trackId = nil

	arg_15_0:ClearLine()
end

function var_0_0.Clear(arg_16_0)
	arg_16_0:ShutDown()
end

function var_0_0.Dispose(arg_17_0)
	arg_17_0.showHudDic = nil

	arg_17_0:Clear()
end

return var_0_0
