local var_0_0 = class("BossRushVerZenkerPassedLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "BossRushVerZenkerPassedUI"
end

function var_0_0.didEnter(arg_2_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_2_0._tf)

	local var_2_0 = {
		word = true,
		glow = true
	}

	eachChild(arg_2_0._tf:Find("main"), function(arg_3_0, arg_3_1)
		setActive(arg_3_0, var_2_0[arg_3_0.name] or arg_3_0.name == tostring(BossRushVerZenkerPassedLayer.seriesId))
	end)
	eachChild(arg_2_0._tf:Find("Image/content"), function(arg_4_0, arg_4_1)
		setActive(arg_4_0, arg_4_1 < arg_2_0.contextData.maxIndex)
	end)
	seriesAsync({
		function(arg_5_0)
			triggerToggle(arg_2_0._tf:Find("Image/content"):GetChild(arg_2_0.contextData.curIndex - 1), true)
			onDelayTick(arg_5_0, 1.5)
		end,
		function(arg_6_0)
			triggerToggle(arg_2_0._tf:Find("Image/content"):GetChild(arg_2_0.contextData.curIndex), true)
			onDelayTick(arg_6_0, 1.5)
		end
	}, function()
		arg_2_0:closeView()
	end)
end

function var_0_0.willExit(arg_8_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_8_0._tf)
end

return var_0_0
