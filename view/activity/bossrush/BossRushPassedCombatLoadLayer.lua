local var_0_0 = class("BossRushPassedCombatLoadLayer", import(".BossRushPassedLayer"))

var_0_0.GROW_TIME = 0.55

function var_0_0.getUIName(arg_1_0)
	return "BossRushPassedUI"
end

function var_0_0.didEnter(arg_2_0)
	arg_2_0.tweenObjs = {}

	pg.UIMgr.GetInstance():OverlayPanel(arg_2_0._tf)
	arg_2_0:updateSlider(arg_2_0.curIndex)
	arg_2_0:initSliderArea(arg_2_0.curIndex)

	arg_2_0._tf:GetComponent("Animator").enabled = false

	arg_2_0:combatPreload()
end

function var_0_0.willExit(arg_3_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_3_0._tf)

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.tweenObjs) do
		LeanTween.cancel(iter_3_1)
	end

	arg_3_0.tweenObjs = {}
end

function var_0_0.onBackPressed(arg_4_0)
	return
end

function var_0_0.initData(arg_5_0)
	arg_5_0.curIndex = arg_5_0.contextData.curIndex
end

function var_0_0.combatPreload(arg_6_0)
	PoolMgr.GetInstance():DestroyAllSprite()

	arg_6_0._loadObs = {}

	ys.Battle.BattleFXPool.GetInstance():Init()

	local var_6_0 = ys.Battle.BattleResourceManager.GetInstance()

	var_6_0:Init()

	local var_6_1, var_6_2 = CombatLoadUI.GetTotalResourceList(arg_6_0.contextData)

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		var_6_0:AddPreloadResource(iter_6_1)
	end

	for iter_6_2, iter_6_3 in ipairs(var_6_2) do
		var_6_0:AddPreloadCV(iter_6_3)
	end

	local function var_6_3()
		arg_6_0:updateSlider(arg_6_0.curIndex + 1)
		arg_6_0:emit(ChallengePassedCombatLoadMediator.FINISH, arg_6_0._loadObs)
	end

	local var_6_4 = 0

	local function var_6_5(arg_8_0)
		local var_8_0
		local var_8_1 = var_6_4 == 0 and 0 or arg_8_0 / var_6_4

		arg_6_0:moveSlider(var_8_1)
	end

	local var_6_6 = pg.UIMgr.GetInstance():GetMainCamera()

	setActive(var_6_6, true)

	var_6_4 = var_6_0:StartPreload(var_6_3, var_6_5)
end

function var_0_0.initSliderArea(arg_9_0)
	local var_9_0 = arg_9_0.curIndex
	local var_9_1 = arg_9_0.contextData.maxIndex

	if var_9_1 < var_9_0 then
		var_9_0 = var_9_0 % var_9_1 == 0 and var_9_1 or var_9_0 % var_9_1
	end

	local var_9_2 = 1 / (var_9_1 - 1)

	arg_9_0.curpercent = (var_9_0 - 1) * var_9_2
	arg_9_0.nextprecent = var_9_0 * var_9_2
	arg_9_0.deltaPercent = arg_9_0.nextprecent - arg_9_0.curpercent
end

function var_0_0.moveSlider(arg_10_0, arg_10_1)
	arg_10_0.sliderSC.value = arg_10_0.curpercent + arg_10_0.deltaPercent * arg_10_1
end

return var_0_0
