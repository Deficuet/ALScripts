local var_0_0 = class("FaxiV4FramePage", import(".TemplatePage.NewFrameTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.bar = arg_1_0._tf:Find("AD/switcher/phase2/barContent")
	arg_1_0.cur = arg_1_0._tf:Find("AD/switcher/phase2/progress/step")
	arg_1_0.target = arg_1_0._tf:Find("AD/switcher/phase2/progress/all")
	arg_1_0.gotTag = arg_1_0._tf:Find("AD/switcher/phase2/got")
	arg_1_0.titles = {
		arg_1_0.switchBtn:Find("2"),
		arg_1_0.switchBtn:Find("1")
	}
end

function var_0_0.OnUpdateFlush(arg_2_0)
	local var_2_0 = arg_2_0.activity.data1
	local var_2_1 = arg_2_0.avatarConfig.target

	var_2_0 = var_2_1 < var_2_0 and var_2_1 or var_2_0

	local var_2_2 = var_2_0 / var_2_1

	setText(arg_2_0.cur, var_2_2 >= 1 and setColorStr(var_2_0, COLOR_GREEN) or var_2_0)
	setText(arg_2_0.target, "/" .. var_2_1)
	setSlider(arg_2_0.bar, 0, var_2_1, var_2_0)

	local var_2_3 = var_2_1 <= var_2_0
	local var_2_4 = arg_2_0.activity.data2 >= 1

	setActive(arg_2_0.battleBtn, arg_2_0.inPhase2 and not var_2_3)
	setActive(arg_2_0.getBtn, arg_2_0.inPhase2 and not var_2_4 and var_2_3)
	setActive(arg_2_0.gotBtn, arg_2_0.inPhase2 and var_2_4)
	setActive(arg_2_0.gotTag, arg_2_0.inPhase2 and var_2_4)
	setActive(arg_2_0._tf:Find("AD/switcher/phase2/progress"), not var_2_4)
end

function var_0_0.Switch(arg_3_0, arg_3_1)
	arg_3_0.isSwitching = true

	setToggleEnabled(arg_3_0.switchBtn, false)

	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs({
		arg_3_0.phases,
		arg_3_0.titles
	}) do
		local var_3_1, var_3_2 = unpack(iter_3_1)

		if arg_3_1 then
			var_3_1, var_3_2 = var_3_2, var_3_1
		end

		LeanTween.cancel(go(var_3_1))

		local var_3_3 = GetOrAddComponent(var_3_1, "CanvasGroup")

		var_3_3.alpha = 0

		table.insert(var_3_0, function(arg_4_0)
			LeanTween.alphaCanvas(var_3_3, 1, 0.4):setOnComplete(System.Action(arg_4_0))
		end)
		LeanTween.cancel(go(var_3_2))

		local var_3_4 = GetOrAddComponent(var_3_2, "CanvasGroup")

		var_3_4.alpha = 1

		table.insert(var_3_0, function(arg_5_0)
			LeanTween.alphaCanvas(var_3_4, 0, 0.4):setOnComplete(System.Action(arg_5_0))
		end)
	end

	parallelAsync(var_3_0, function()
		arg_3_0.isSwitching = nil

		setToggleEnabled(arg_3_0.switchBtn, true)
	end)
end

return var_0_0
