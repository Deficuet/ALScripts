local var_0_0 = class("MainReFluxSequence")

var_0_0.GUIDE_FLAG = false

local var_0_1 = {
	{
		id = "Reflux",
		condition = function()
			return true
		end,
		args = function()
			return {}
		end
	}
}

function var_0_0.Execute(arg_3_0, arg_3_1)
	if var_0_0.GUIDE_FLAG then
		MainGuideSequence.New():DoAction(var_0_1, arg_3_1, true)

		var_0_0.GUIDE_FLAG = false

		return
	end

	if not arg_3_0:ShouldHandleReflux() then
		arg_3_1()

		return
	end

	seriesAsync({
		function(arg_4_0)
			arg_3_0:PlayReFluxCG(arg_4_0)
		end,
		function(arg_5_0)
			arg_3_0:SkipToReFluxActivity()
			arg_5_0()
		end
	})
end

function var_0_0.ShouldHandleReflux(arg_6_0)
	local var_6_0 = getProxy(RefluxProxy)

	return var_6_0:isCanSign() and var_6_0:isInRefluxTime()
end

function var_0_0.PlayReFluxCG(arg_7_0, arg_7_1)
	local var_7_0 = getProxy(RefluxProxy)
	local var_7_1 = var_7_0:GetRefluxBgs()

	if #var_7_1 < 4 then
		arg_7_1()

		return
	end

	if var_7_0.signCount ~= 0 then
		arg_7_1()

		return
	end

	var_0_0.GUIDE_FLAG = true

	local var_7_2 = RefluxAnimationPlayer.New(pg.UIMgr.GetInstance().OverlayUITop)

	pg.m02:sendNotification(GAME.START_REFLUX_CG)
	var_7_2:ExecuteAction("Play", var_7_1, function()
		if arg_7_0.player then
			var_7_2:Destroy()

			arg_7_0.player = nil
		end

		pg.m02:sendNotification(GAME.END_REFLUX_CG)
		arg_7_1()
	end)

	arg_7_0.player = var_7_2
end

function var_0_0.SkipToReFluxActivity(arg_9_0)
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.REFLUX)
end

function var_0_0.Dispose(arg_10_0)
	if arg_10_0.player and arg_10_0.player:GetLoaded() then
		arg_10_0.player:Destroy()

		arg_10_0.player = nil
	end
end

return var_0_0
