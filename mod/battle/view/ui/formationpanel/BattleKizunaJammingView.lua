ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleDataFunction
local var_0_2 = class("BattleKizunaJammingView")

var_0_0.Battle.BattleKizunaJammingView = var_0_2
var_0_2.__name = "BattleKizunaJammingView"
var_0_2.COUNT = 3
var_0_2.EXPAND_DURATION = 5

function var_0_2.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0._hitCount = 0
end

function var_0_2.ConfigCallback(arg_2_0, arg_2_1)
	arg_2_0._callback = arg_2_1

	arg_2_0:init()
end

function var_0_2.init(arg_3_0)
	arg_3_0.eventTriggers = {}
	arg_3_0._blocker = arg_3_0._tf:Find("KizunaAiBlocker")

	local var_3_0 = GetOrAddComponent(arg_3_0._blocker, "EventTriggerListener")

	arg_3_0.eventTriggers[var_3_0] = true

	var_3_0:AddPointDownFunc(function()
		arg_3_0._hitCount = arg_3_0._hitCount + 1

		if arg_3_0._hitCount >= var_0_2.COUNT then
			arg_3_0:Eliminate(true)
		else
			setActive(arg_3_0._blocker:Find("normal"), false)
			setActive(arg_3_0._blocker:Find("hitted"), true)
			LeanTween.cancel(go(arg_3_0._blocker))
			arg_3_0:ClickEase()
		end
	end)
	var_3_0:AddPointUpFunc(function()
		if arg_3_0._hitCount < var_0_2.COUNT then
			setActive(arg_3_0._blocker:Find("normal"), true)
			setActive(arg_3_0._blocker:Find("hitted"), false)
		end
	end)
end

function var_0_2.Active(arg_6_0)
	local var_6_0 = (1 - arg_6_0._blocker.localScale.x) * var_0_2.EXPAND_DURATION

	LeanTween.scale(arg_6_0._blocker, Vector3(1, 1, 0), var_6_0)
end

function var_0_2.Pause(arg_7_0)
	LeanTween.cancel(go(arg_7_0._blocker))
end

function var_0_2.ClickEase(arg_8_0)
	local var_8_0 = arg_8_0._blocker.localScale.x - 0.05

	LeanTween.scale(arg_8_0._blocker, Vector3(var_8_0, var_8_0, 0), 0.03):setOnComplete(System.Action(function()
		arg_8_0:Active()
	end))
end

function var_0_2.Eliminate(arg_10_0, arg_10_1)
	LeanTween.cancel(go(arg_10_0._blocker))
	setActive(arg_10_0._blocker:Find("normal"), not arg_10_1)
	setActive(arg_10_0._blocker:Find("hitted"), arg_10_1)
	LeanTween.scale(arg_10_0._blocker, Vector3(0, 0, 0), 0.1):setOnComplete(System.Action(function()
		arg_10_0._callback()
	end))
end

function var_0_2.Dispose(arg_12_0)
	if arg_12_0.eventTriggers then
		for iter_12_0, iter_12_1 in pairs(arg_12_0.eventTriggers) do
			ClearEventTrigger(iter_12_0)
		end

		arg_12_0.eventTriggers = nil
	end

	LeanTween.cancel(go(arg_12_0._blocker))
end
