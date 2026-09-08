local var_0_0 = class("RefluxAnimationPlayer", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "RefluxAnimationUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.s1SpineAnim = arg_2_0._tf:Find("s1/spine"):GetComponent(typeof(SpineAnimUI))
	arg_2_0.s2SpineAnim = arg_2_0._tf:Find("s2/spine"):GetComponent(typeof(SpineAnimUI))
	arg_2_0.s3SpineAnim = arg_2_0._tf:Find("a4/Bg/spine/s3/spine"):GetComponent(typeof(SpineAnimUI))
	arg_2_0.a1Animation = arg_2_0._tf:Find("s1"):GetComponent(typeof(Animation))
	arg_2_0.a1AnimationDft = arg_2_0._tf:Find("s1"):GetComponent(typeof(DftAniEvent))
	arg_2_0.a1AnimationEffect = arg_2_0._tf:Find("s1/a1/VX_glow")
	arg_2_0.a2Animation = arg_2_0._tf:Find("a2"):GetComponent(typeof(Animation))
	arg_2_0.a2AnimationDft = arg_2_0._tf:Find("a2"):GetComponent(typeof(DftAniEvent))
	arg_2_0.a3Animation = arg_2_0._tf:Find("a3"):GetComponent(typeof(Animation))
	arg_2_0.a3AnimationDft = arg_2_0._tf:Find("a3"):GetComponent(typeof(DftAniEvent))
	arg_2_0.a4Animation = arg_2_0._tf:Find("a4"):GetComponent(typeof(Animation))
	arg_2_0.a4AnimationDft = arg_2_0._tf:Find("a4"):GetComponent(typeof(DftAniEvent))
	arg_2_0.a5Animation = arg_2_0._tf:Find("a5"):GetComponent(typeof(Animator))
	arg_2_0.a5AnimationDft = arg_2_0._tf:Find("a5"):GetComponent(typeof(DftAniEvent))
	arg_2_0.cGContainer = arg_2_0._tf:Find("a5/Bg/CG")
	arg_2_0.cgTpl = arg_2_0._tf:Find("a5/Bg/tpl")
	arg_2_0.s1ClickBtn = arg_2_0._tf:Find("s1/a1/click")
	arg_2_0.a3ReviewBtn = arg_2_0._tf:Find("a3/Bg/btn")
	arg_2_0.backBtn = arg_2_0._tf:Find("a3/Bg/bg")
	arg_2_0.a5bgAlpha = arg_2_0._tf:Find("a5/Bg"):GetComponent(typeof(CanvasGroup))
	arg_2_0.yearText = arg_2_0._tf:Find("a3/Bg/xinfen/bg_3/billboard/year")
	arg_2_0.monthText = arg_2_0._tf:Find("a3/Bg/xinfen/bg_3/billboard/month")
	arg_2_0.dateText = arg_2_0._tf:Find("a3/Bg/xinfen/bg_3/billboard/date")
	arg_2_0.daysText = arg_2_0._tf:Find("a3/Bg/xinfen/bg_3/billboard/days")
	arg_2_0.countText = arg_2_0._tf:Find("a3/Bg/xinfen/bg_3/billboard/count")

	arg_2_0:updateUI()
end

function var_0_0.updateUI(arg_3_0)
	local var_3_0 = getProxy(RefluxProxy)
	local var_3_1 = pg.TimeMgr.GetInstance()
	local var_3_2 = var_3_0.returnLastTimestamp
	local var_3_3 = var_3_0.returnTimestamp
	local var_3_4 = var_3_1:STimeDescS(var_3_2, "*t")

	setText(arg_3_0.yearText, var_3_4.year % 100)
	setText(arg_3_0.monthText, var_3_4.month)
	setText(arg_3_0.dateText, var_3_4.day)
	setText(arg_3_0.daysText, var_3_1:DiffDay(var_3_2, var_3_3))
	setText(arg_3_0.countText, var_3_0.returnShipNum)
end

function var_0_0.Play(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.bgs = arg_4_1

	seriesAsync({
		function(arg_5_0)
			arg_4_0:OnStart()
			arg_4_0:EnterAnimation(arg_5_0)
		end,
		function(arg_6_0)
			arg_4_0:EnterClickAnimation(arg_6_0)
		end,
		function(arg_7_0)
			arg_4_0:RegiserOpenClick(arg_7_0)
		end,
		function(arg_8_0)
			arg_4_0:OpenAnimation(arg_8_0)
		end,
		function(arg_9_0)
			arg_4_0:OpenDisplayAnimation(arg_9_0)
		end,
		function(arg_10_0)
			arg_4_0:ReigerReviewClick(arg_10_0)
			arg_4_0:ReigerBackClick(arg_10_0)
		end
	}, arg_4_2)
end

function var_0_0.Play4Review(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0:Show()

	arg_11_0.bgs = arg_11_1

	seriesAsync({
		function(arg_12_0)
			arg_11_0:OnStart()
			arg_11_0:OpenDisplayAnimation(arg_12_0)
		end,
		function(arg_13_0)
			arg_11_0:ReigerReviewClick(arg_13_0)
			arg_11_0:ReigerBackClick(arg_13_0)
		end
	}, arg_11_2)
end

function var_0_0.PlayNextStage(arg_14_0, arg_14_1)
	arg_14_0.a5bgAlpha.alpha = 1

	removeAllChildren(arg_14_0.cGContainer)
	seriesAsync({
		function(arg_15_0)
			arg_14_0:EnterCGAnimation(arg_15_0)
		end,
		function(arg_16_0)
			arg_14_0:StartCGAnimation(arg_16_0)
		end,
		function(arg_17_0)
			arg_14_0:PlayCGLoop(arg_14_0.bgs, arg_17_0)
		end,
		function(arg_18_0)
			arg_14_0:EndCGAnimation(arg_18_0)
		end,
		function(arg_19_0)
			arg_14_0:ExitCGAnimation(arg_19_0)
		end,
		function(arg_20_0)
			arg_14_0:OpenDisplayAnimation(arg_20_0)
		end,
		function(arg_21_0)
			arg_14_0:ReigerBackClick(arg_14_1)
			arg_14_0:ReigerReviewClick(arg_14_1)
		end
	})
end

function var_0_0.OnStart(arg_22_0)
	removeAllOnButton(arg_22_0.a3ReviewBtn)
	removeAllOnButton(arg_22_0.s1ClickBtn)
	eachChild(arg_22_0._tf, function(arg_23_0)
		if arg_23_0.name ~= "bg_low" then
			setActive(arg_23_0, false)
		end
	end)
	setActive(arg_22_0.a3ReviewBtn, #arg_22_0.bgs > 0)
end

function var_0_0.EnterAnimation(arg_24_0, arg_24_1)
	arg_24_0.s1SpineAnim:SetActionCallBack(nil)
	setActive(arg_24_0.s1SpineAnim.gameObject.transform.parent, true)
	arg_24_0.s1SpineAnim:SetActionCallBack(function(arg_25_0)
		if arg_25_0 == "finish" then
			arg_24_0.s1SpineAnim:SetActionCallBack(nil)
			arg_24_0.s1SpineAnim:SetAction("normal", 0)
			arg_24_1()
		end
	end)
	arg_24_0.s1SpineAnim:SetAction("action", 0)
end

function var_0_0.EnterClickAnimation(arg_26_0, arg_26_1)
	setActive(arg_26_0.a1AnimationEffect, false)
	setActive(go(arg_26_0.a1Animation).transform.parent, true)
	arg_26_0.a1AnimationDft:SetEndEvent(nil)
	arg_26_0.a1AnimationDft:SetEndEvent(function()
		arg_26_0.a1AnimationDft:SetEndEvent(nil)
		setActive(arg_26_0.a1AnimationEffect, true)
		arg_26_1()
	end)
	arg_26_0.a1Animation:Play("ShadowCityFramePage_in")
end

function var_0_0.RegiserOpenClick(arg_28_0, arg_28_1)
	onButton(arg_28_0, arg_28_0.s1ClickBtn, function()
		removeAllOnButton(arg_28_0.s1ClickBtn)
		arg_28_1()
	end, SFX_PANEL)
end

function var_0_0.ReigerBackClick(arg_30_0, arg_30_1)
	onButton(arg_30_0, arg_30_0.backBtn, function()
		removeAllOnButton(arg_30_0.a3ReviewBtn)
		removeAllOnButton(arg_30_0.backBtn)
		arg_30_1()
	end, SFX_PANEL)
end

function var_0_0.ReigerReviewClick(arg_32_0, arg_32_1)
	onButton(arg_32_0, arg_32_0.a3ReviewBtn, function()
		removeAllOnButton(arg_32_0.a3ReviewBtn)
		removeAllOnButton(arg_32_0.backBtn)
		arg_32_0:PlayNextStage(arg_32_1)
	end, SFX_PANEL)
end

function var_0_0.OpenAnimation(arg_34_0, arg_34_1)
	setActive(arg_34_0.s1SpineAnim.gameObject.transform.parent, false)
	setActive(tf(arg_34_0.a1Animation), false)
	parallelAsync({
		function(arg_35_0)
			arg_34_0:PlayOpenAnimation(arg_35_0)
		end,
		function(arg_36_0)
			arg_34_0:PlayOpenSpineAnimation(arg_36_0)
		end
	}, arg_34_1)
end

function var_0_0.PlayOpenAnimation(arg_37_0, arg_37_1)
	setActive(arg_37_0.a2Animation.gameObject, true)
	arg_37_0.a2AnimationDft:SetEndEvent(nil)
	arg_37_0.a2AnimationDft:SetEndEvent(function()
		arg_37_0.a2AnimationDft:SetEndEvent(nil)
		arg_37_1()
	end)
	arg_37_0.a2Animation:Play("ShadowCityFramePage_2_in")
end

function var_0_0.PlayOpenSpineAnimation(arg_39_0, arg_39_1)
	arg_39_0.s2SpineAnim:SetActionCallBack(nil)
	setActive(arg_39_0.s2SpineAnim.gameObject.transform.parent, true)
	arg_39_0.s2SpineAnim:SetActionCallBack(function(arg_40_0)
		if arg_40_0 == "finish" then
			arg_39_0.s2SpineAnim:SetActionCallBack(nil)
			arg_39_0.s2SpineAnim:SetAction("action2", 0)
			arg_39_1()
		end
	end)
	arg_39_0.s2SpineAnim:SetAction("action", 0)
end

function var_0_0.OpenDisplayAnimation(arg_41_0, arg_41_1)
	setActive(arg_41_0.s2SpineAnim.gameObject.transform.parent, false)
	setActive(arg_41_0.a3Animation.gameObject, true)
	setActive(arg_41_0.a4Animation.gameObject, false)
	arg_41_0.a3AnimationDft:SetEndEvent(nil)
	arg_41_0.a3AnimationDft:SetEndEvent(function()
		arg_41_0.a3AnimationDft:SetEndEvent(nil)
		arg_41_1()
	end)
	arg_41_0.a3AnimationDft:SetTriggerEvent(nil)
	arg_41_0.a3AnimationDft:SetTriggerEvent(function()
		setActive(arg_41_0.a2Animation.gameObject, false)
	end)
	arg_41_0.a3Animation:Play("ShadowCityFramePage_3_in")
end

function var_0_0.EnterCGAnimation(arg_44_0, arg_44_1)
	setActive(arg_44_0.a3Animation.gameObject, false)
	seriesAsync({
		function(arg_45_0)
			arg_44_0:PlayEnterCGAnimation(arg_45_0)
		end,
		function(arg_46_0)
			arg_44_0:PlayEnterCGSpineAnimation(arg_46_0)
		end
	}, arg_44_1)
end

function var_0_0.PlayEnterCGAnimation(arg_47_0, arg_47_1)
	setActive(arg_47_0.a4Animation.gameObject, true)
	arg_47_0.a4AnimationDft:SetEndEvent(nil)
	arg_47_0.a4AnimationDft:SetEndEvent(function()
		arg_47_0.a4AnimationDft:SetEndEvent(nil)
		arg_47_1()
	end)
	arg_47_0.a4Animation:Play("ShadowCityFramePage_4_in")
	arg_47_0.s3SpineAnim:SetActionCallBack(nil)
	arg_47_0.s3SpineAnim:SetAction("normal1", 0)
end

function var_0_0.PlayEnterCGSpineAnimation(arg_49_0, arg_49_1)
	arg_49_0.s3SpineAnim:SetActionCallBack(nil)
	setActive(arg_49_0.s3SpineAnim.gameObject.transform.parent, true)
	arg_49_0.s3SpineAnim:SetActionCallBack(function(arg_50_0)
		if arg_50_0 == "finish" then
			arg_49_0.s3SpineAnim:SetActionCallBack(nil)
			arg_49_0.s3SpineAnim:SetAction("normal2", 0)
			arg_49_1()
		end
	end)
	arg_49_0.s3SpineAnim:SetAction("action1", 0)
end

function var_0_0.ExitCGAnimation(arg_51_0, arg_51_1)
	setActive(arg_51_0.a3Animation.gameObject, false)
	seriesAsync({
		function(arg_52_0)
			arg_51_0:PlayExitCGAnimation(arg_52_0)
		end,
		function(arg_53_0)
			arg_51_0:PlayExitCGSpineAnimation(arg_53_0)
		end
	}, arg_51_1)
end

function var_0_0.PlayExitCGAnimation(arg_54_0, arg_54_1)
	setActive(arg_54_0.a4Animation.gameObject, true)
	arg_54_0.a4AnimationDft:SetEndEvent(nil)
	arg_54_0.a4AnimationDft:SetEndEvent(function()
		arg_54_0.a4AnimationDft:SetEndEvent(nil)
		arg_54_1()
	end)
	arg_54_0.a4Animation:Play("ShadowCityFramePage_4_out")
	arg_54_0.s3SpineAnim:SetActionCallBack(nil)
	arg_54_0.s3SpineAnim:SetAction("normal2", 0)
end

function var_0_0.PlayExitCGSpineAnimation(arg_56_0, arg_56_1)
	arg_56_0.s3SpineAnim:SetActionCallBack(nil)
	setActive(arg_56_0.s3SpineAnim.gameObject.transform.parent, true)
	arg_56_0.s3SpineAnim:SetActionCallBack(function(arg_57_0)
		if arg_57_0 == "finish" then
			arg_56_0.s3SpineAnim:SetActionCallBack(nil)
			arg_56_0.s3SpineAnim:SetAction("normal1", 0)
			arg_56_1()
		end
	end)
	arg_56_0.s3SpineAnim:SetAction("action2", 0)
end

function var_0_0.StartCGAnimation(arg_58_0, arg_58_1)
	setActive(arg_58_0.a5Animation.gameObject, true)
	arg_58_0.a5AnimationDft:SetEndEvent(nil)
	arg_58_0.a5AnimationDft:SetEndEvent(function()
		arg_58_0.a5AnimationDft:SetEndEvent(nil)
		arg_58_1()
	end)
	arg_58_0.a5AnimationDft:SetTriggerEvent(nil)
	arg_58_0.a5AnimationDft:SetTriggerEvent(function()
		arg_58_0.a5AnimationDft:SetTriggerEvent(nil)
		setActive(arg_58_0.a4Animation.gameObject, false)
	end)
	arg_58_0.a5Animation:SetTrigger("in")
end

local function var_0_1(arg_61_0, arg_61_1, arg_61_2, arg_61_3)
	local var_61_0 = LoadSprite("bg/" .. arg_61_2)
	local var_61_1 = arg_61_0:Find("root/cg")

	setImageSprite(var_61_1, var_61_0, false)
	setLocalPosition(var_61_1, Vector3(-10000, -10000, 0))

	var_61_1.sizeDelta = Vector3(1920, 1080)

	setActive(arg_61_0, true)

	local var_61_2 = "ShadowCityFramePage_photo_" .. arg_61_1
	local var_61_3 = arg_61_0:Find("root"):GetComponent(typeof(Animation))
	local var_61_4 = arg_61_0:Find("root"):GetComponent(typeof(DftAniEvent))

	var_61_4:SetEndEvent(nil)
	var_61_4:SetEndEvent(function()
		var_61_4:SetEndEvent(nil)
		arg_61_3()
	end)
	var_61_3:Play(var_61_2)
end

local function var_0_2(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = LoadSprite("bg/" .. arg_63_1)
	local var_63_1 = arg_63_0:Find("root/cg")

	setImageSprite(var_63_1, var_63_0, false)

	var_63_1.sizeDelta = Vector3(1920, 1080)

	setLocalPosition(var_63_1, Vector3(-10000, -10000, 0))

	var_63_1.sizeDelta = Vector3(1920, 1080)

	setActive(arg_63_0, true)

	local var_63_2 = "ShadowCityFramePage_photo"
	local var_63_3 = arg_63_0:Find("root"):GetComponent(typeof(Animation))
	local var_63_4 = arg_63_0:Find("root"):GetComponent(typeof(DftAniEvent))

	var_63_4:SetEndEvent(nil)
	var_63_4:SetEndEvent(function()
		var_63_4:SetEndEvent(nil)
		arg_63_2()
	end)
	var_63_3:Play(var_63_2)
end

function var_0_0.PlayCGLoop(arg_65_0, arg_65_1, arg_65_2)
	local var_65_0 = {}

	removeAllChildren(arg_65_0.cGContainer)

	local var_65_1 = cloneTplTo(arg_65_0.cgTpl, arg_65_0.cGContainer)

	for iter_65_0 = 2, #arg_65_1 do
		local var_65_2 = cloneTplTo(arg_65_0.cgTpl, arg_65_0.cGContainer)

		setActive(var_65_2, false)
		table.insert(var_65_0, var_65_2)
	end

	local var_65_3 = {}

	table.insert(var_65_3, function(arg_66_0)
		var_0_2(var_65_1, arg_65_1[1], arg_66_0)
	end)

	for iter_65_1, iter_65_2 in ipairs(var_65_0) do
		local var_65_4 = iter_65_1 % 4

		if var_65_4 == 0 then
			var_65_4 = 4
		end

		local var_65_5 = arg_65_1[iter_65_1 + 1]

		table.insert(var_65_3, function(arg_67_0)
			var_0_1(iter_65_2, var_65_4, var_65_5, arg_67_0)
		end)
	end

	seriesAsync(var_65_3, arg_65_2)
end

function var_0_0.EndCGAnimation(arg_68_0, arg_68_1)
	setActive(arg_68_0.a4Animation.gameObject, true)
	arg_68_0.a5AnimationDft:SetEndEvent(nil)
	arg_68_0.a5AnimationDft:SetEndEvent(function()
		arg_68_0.a5AnimationDft:SetEndEvent(nil)
		setActive(arg_68_0.a5Animation.gameObject, false)
		arg_68_1()
	end)
	arg_68_0.a5Animation:SetTrigger("out")
end

function var_0_0.OnDestroy(arg_70_0)
	arg_70_0.a1AnimationDft:SetEndEvent(nil)
	arg_70_0.a2AnimationDft:SetEndEvent(nil)
	arg_70_0.a3AnimationDft:SetEndEvent(nil)
	arg_70_0.a4AnimationDft:SetEndEvent(nil)
	arg_70_0.a5AnimationDft:SetEndEvent(nil)
	arg_70_0.a5AnimationDft:SetTriggerEvent(nil)
end

return var_0_0
