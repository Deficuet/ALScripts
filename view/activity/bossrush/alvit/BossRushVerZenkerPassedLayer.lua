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

	local function var_2_1()
		seriesAsync({
			function(arg_6_0)
				triggerToggle(arg_2_0._tf:Find("Image/content"):GetChild(arg_2_0.contextData.curIndex - 1), true)
				onDelayTick(arg_6_0, 1.5)
			end,
			function(arg_7_0)
				triggerToggle(arg_2_0._tf:Find("Image/content"):GetChild(arg_2_0.contextData.curIndex), true)
				onDelayTick(arg_7_0, 1.5)
			end
		}, function()
			arg_2_0:emit(ChallengePassedCombatLoadMediator.FINISH, arg_2_0._loadObs)
		end)
	end

	arg_2_0:combatPreload(var_2_1)
end

function var_0_0.combatPreload(arg_9_0, arg_9_1)
	PoolMgr.GetInstance():DestroyAllSprite()

	arg_9_0._loadObs = {}

	ys.Battle.BattleFXPool.GetInstance():Init()

	local var_9_0 = ys.Battle.BattleResourceManager.GetInstance()

	var_9_0:Init()

	local var_9_1, var_9_2 = CombatLoadUI.GetTotalResourceList(arg_9_0.contextData)

	for iter_9_0, iter_9_1 in ipairs(var_9_1) do
		var_9_0:AddPreloadResource(iter_9_1)
	end

	for iter_9_2, iter_9_3 in ipairs(var_9_2) do
		var_9_0:AddPreloadCV(iter_9_3)
	end

	local function var_9_3()
		arg_9_1()
	end

	local var_9_4 = 0

	local function var_9_5(arg_11_0)
		return
	end

	local var_9_6 = pg.UIMgr.GetInstance():GetMainCamera()

	setActive(var_9_6, true)

	local var_9_7 = var_9_0:StartPreload(var_9_3, var_9_5)
end

function var_0_0.willExit(arg_12_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_12_0._tf)
end

return var_0_0
