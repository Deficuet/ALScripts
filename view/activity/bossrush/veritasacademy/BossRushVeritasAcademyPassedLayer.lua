local var_0_0 = class("BossRushVeritasAcademyPassedLayer", import("view.activity.BossRush.EscapeManor.BossRushEscapeManorPassedLayer"))

function var_0_0.getUIName(arg_1_0)
	return "BossRushVeritasAcademyPassedUI"
end

function var_0_0.didEnter(arg_2_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_2_0._tf)

	local var_2_0 = {
		glow = true
	}

	eachChild(arg_2_0._tf:Find("Main"), function(arg_3_0, arg_3_1)
		setActive(arg_3_0, var_2_0[arg_3_0.name] or arg_3_0.name == tostring(BossRushVeritasAcademyPassedLayer.seriesId))
	end)

	local function var_2_1(arg_4_0, arg_4_1)
		setActive(arg_4_0:Find("UnFinished"), arg_4_1 > 0)
		setActive(arg_4_0:Find("Challengeing"), arg_4_1 == 0)
		setActive(arg_4_0:Find("Finished"), arg_4_1 < 0)
	end

	local function var_2_2(arg_5_0, arg_5_1)
		setSlider(arg_2_0.rtSlider, 0, arg_5_1 - 1, arg_5_0 - 1)
		UIItemList.StaticAlign(arg_2_0.rtContent, arg_2_0.rtTpl, arg_5_1 - 1, function(arg_6_0, arg_6_1, arg_6_2)
			arg_6_1 = arg_6_1 + 1

			if arg_6_0 == UIItemList.EventUpdate then
				var_2_1(arg_6_2:Find("left"), arg_6_1 - arg_5_0)
				var_2_1(arg_6_2:Find("right"), arg_6_1 + 1 - arg_5_0)
			end
		end)
	end

	seriesAsync({
		function(arg_7_0)
			var_2_2(arg_2_0.contextData.curIndex, arg_2_0.contextData.maxIndex)
			onDelayTick(arg_7_0, 0.5)
		end
	}, function()
		local var_8_0 = arg_2_0.contextData.curIndex
		local var_8_1 = arg_2_0.contextData.maxIndex

		var_2_1(arg_2_0.rtContent:GetChild(var_8_0 - 1):Find("left"), -1)

		if var_8_0 > 1 then
			var_2_1(arg_2_0.rtContent:GetChild(var_8_0 - 2):Find("right"), -1)
		end

		local function var_8_2()
			seriesAsync({
				function(arg_10_0)
					var_2_2(arg_2_0.contextData.curIndex + 1, arg_2_0.contextData.maxIndex)
					onDelayTick(arg_10_0, 1.5)
				end
			}, function()
				arg_2_0:emit(ChallengePassedCombatLoadMediator.FINISH, arg_2_0._loadObs)
			end)
		end

		arg_2_0:combatPreload(var_8_2)
	end)
end

return var_0_0
