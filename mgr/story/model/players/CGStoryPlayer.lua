local var_0_0 = class("CGStoryPlayer", import(".StoryPlayer"))

function var_0_0.OnReset(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	setActive(arg_1_0.frontTr, false)

	arg_1_0.color = arg_1_0.mainImg.color
	arg_1_0.mainImg.color = Color.New(1, 1, 1, 0)

	arg_1_3()
end

function var_0_0.OnInit(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	seriesAsync({
		function(arg_3_0)
			gcAll(true)
			onNextTick(arg_3_0)
		end,
		function(arg_4_0)
			arg_2_0:LoadCGUI(arg_4_0)
		end,
		function(arg_5_0)
			arg_2_0:PlayCGAnimation(arg_2_1, arg_5_0)
		end,
		function(arg_6_0)
			arg_2_0:ClearCGUI()
			arg_6_0()
		end
	}, arg_2_3)
end

function var_0_0.LoadCGUI(arg_7_0, arg_7_1)
	if arg_7_0.cgUI and not IsNil(arg_7_0.cgUI) then
		arg_7_1()

		return
	end

	LoadAndInstantiateAsync("ui", "StoryCGPlayerUI", function(arg_8_0)
		arg_7_0.cgUI = arg_8_0
		arg_7_0.cgTF = arg_8_0.transform

		arg_7_0.cgTF:SetParent(arg_7_0._tf, false)

		arg_7_0.cgPlayer = ReFluxCGPlayer.New(arg_8_0)

		arg_7_1()
	end, true, true)
end

function var_0_0.PlayCGAnimation(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.cgPlayer:Play(arg_9_1:GetBgs(), arg_9_2)
end

function var_0_0.RegisetEvent(arg_10_0, arg_10_1, arg_10_2)
	var_0_0.super.RegisetEvent(arg_10_0, arg_10_1, arg_10_2)
	triggerButton(arg_10_0._go)
end

function var_0_0.ClearCGUI(arg_11_0)
	if arg_11_0.cgUI == nil then
		return
	end

	if arg_11_0.cgUI and not IsNil(arg_11_0.cgUI) then
		Object.Destroy(arg_11_0.cgUI)
	end

	if arg_11_0.cgPlayer then
		arg_11_0.cgPlayer:Dispose()

		arg_11_0.cgPlayer = nil
	end

	arg_11_0.cgUI = nil
	arg_11_0.cgTF = nil
	arg_11_0.mainImg.color = arg_11_0.color

	gcAll()
end

function var_0_0.OnClear(arg_12_0)
	arg_12_0:ClearCGUI()
end

function var_0_0.OnEnd(arg_13_0)
	arg_13_0:ClearCGUI()
end

return var_0_0
