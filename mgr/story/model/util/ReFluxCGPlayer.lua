local var_0_0 = class("ReFluxCGPlayer", import("..animation.StoryAnimtion"))
local var_0_1 = "anim_CG_1_show"
local var_0_2 = "anim_CG_1"
local var_0_3 = "anim_CG_2"
local var_0_4 = "anim_CG_1_hide"
local var_0_5 = "anim_CG_textfx"

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.topBox = arg_1_0._tf:Find("CGbox_top")
	arg_1_0.bottomBox = arg_1_0._tf:Find("CGbox_bottom")
	arg_1_0.topDft = arg_1_0.topBox:GetComponent(typeof(DftAniEvent))
	arg_1_0.topAnim = arg_1_0.topBox:GetComponent(typeof(Animation))
	arg_1_0.bottomDft = arg_1_0.bottomBox:GetComponent(typeof(DftAniEvent))
	arg_1_0.bottomAnim = arg_1_0.bottomBox:GetComponent(typeof(Animation))
	arg_1_0.topBg = arg_1_0.topBox:Find("1/mask/CG1"):GetComponent(typeof(Image))
	arg_1_0.bottomBg = arg_1_0.bottomBox:Find("2/CG2"):GetComponent(typeof(Image))
	arg_1_0.blurSize = pg.UIMgr.GetInstance().cameraBlurs[pg.UIMgr.CameraUI][1].blurSize
	arg_1_0.title = arg_1_0.topBox:Find("text")
	arg_1_0.titleAnim = arg_1_0.title:GetComponent(typeof(Animation))
	arg_1_0.titleDft = arg_1_0.title:GetComponent(typeof(DftAniEvent))
	arg_1_0.titleTxt = arg_1_0.title:Find("animroot/text"):GetComponent(typeof(Text))
end

function var_0_0.Play(arg_2_0, arg_2_1, arg_2_2)
	assert(#arg_2_1 >= 3, "bgs can not be empty")
	arg_2_0:UpdateLayout(arg_2_1[1], arg_2_1[2])

	local var_2_0 = {}

	table.insert(var_2_0, function(arg_3_0)
		arg_2_0:PlayEnterAnimation(arg_3_0)
	end)

	local var_2_1 = #arg_2_1 - 2

	arg_2_0.speed = 1

	for iter_2_0 = 3, #arg_2_1 do
		local var_2_2 = arg_2_1[iter_2_0]

		if iter_2_0 == var_2_1 then
			table.insert(var_2_0, function(arg_4_0)
				arg_2_0:PlayTitleAniamtion(arg_4_0)
			end)
		end

		table.insert(var_2_0, function(arg_5_0)
			arg_2_0:PlayTurnAnimation(arg_2_0.speed, arg_5_0)
		end)
		table.insert(var_2_0, function(arg_6_0)
			arg_2_0:ReplaceGC(var_2_2, arg_6_0)
		end)
	end

	parallelAsync({
		function(arg_7_0)
			seriesAsync(var_2_0, arg_7_0)
		end,
		function(arg_8_0)
			arg_2_0.titleAnimCallback = arg_8_0
		end
	}, function()
		seriesAsync({
			function(arg_10_0)
				arg_2_0:PlayExitAnimation(arg_10_0)
			end,
			function(arg_11_0)
				arg_2_0:ResetCG(arg_11_0)
			end
		}, arg_2_2)
	end)
end

function var_0_0.ResetCG(arg_12_0, arg_12_1)
	arg_12_0:ResetLayout()
	arg_12_0:ResetBlurSize()
	arg_12_1()
end

function var_0_0.UpdateSpeed(arg_13_0)
	arg_13_0.speed = arg_13_0.speed + 0.2
	arg_13_0.speed = math.clamp(arg_13_0.speed, 1, 2)
end

function var_0_0.UpdateLayout(arg_14_0, arg_14_1, arg_14_2)
	setActive(arg_14_0.title, false)
	pg.UIMgr.GetInstance():BlurPanel(arg_14_0.topBox)
	setParent(arg_14_0.bottomBox, pg.UIMgr.GetInstance().UIOrigin)

	arg_14_0.topBg.sprite = LoadSprite("bg/" .. arg_14_1)
	arg_14_0.bottomBg.sprite = LoadSprite("bg/" .. arg_14_2)
end

function var_0_0.ResetLayout(arg_15_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_15_0.topBox, arg_15_0._tf)
	setParent(arg_15_0.bottomBox, arg_15_0._tf)
end

function var_0_0.PlayTitleAniamtion(arg_16_0, arg_16_1)
	arg_16_0.titleAnim:Stop()

	arg_16_0.titleTxt.text = ""

	arg_16_0:SetTriggerEvent(arg_16_0.titleDft, function()
		arg_16_0.titleTxt.text = i18n("refux_cg_title")
	end)
	arg_16_0:SetEndEvent(arg_16_0.titleDft, function()
		if arg_16_0.titleAnimCallback then
			arg_16_0.titleAnimCallback()

			arg_16_0.titleAnimCallback = nil
		end
	end)
	arg_16_0.titleAnim:Play(var_0_5)
	setActive(arg_16_0.title, true)
	arg_16_1()
end

function var_0_0.PlayEnterAnimation(arg_19_0, arg_19_1)
	arg_19_0:SetEndEvent(arg_19_0.topDft, arg_19_1)
	arg_19_0.topAnim:Play(var_0_1)
end

function var_0_0.PlayExitAnimation(arg_20_0, arg_20_1)
	setActive(arg_20_0.bottomBox, false)
	arg_20_0:SetEndEvent(arg_20_0.topDft, arg_20_1)
	arg_20_0.topAnim:Play(var_0_4)
end

function var_0_0.PlayTurnAnimation(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0:StopAniamtion(arg_21_0.topAnim, var_0_2)
	arg_21_0:StopAniamtion(arg_21_0.bottomAnim, var_0_3)
	parallelAsync({
		function(arg_22_0)
			arg_21_0:SetEndEvent(arg_21_0.topDft, arg_22_0)
			arg_21_0:PlayAniamtion(arg_21_0.topAnim, arg_21_1, var_0_2)
		end,
		function(arg_23_0)
			arg_21_0:SetEndEvent(arg_21_0.bottomDft, arg_23_0)
			arg_21_0:PlayAniamtion(arg_21_0.bottomAnim, arg_21_1, var_0_3)
		end,
		function(arg_24_0)
			arg_21_0:UpdateBlurSize(3, 0, 0.35 / arg_21_1, arg_24_0)
		end
	}, arg_21_2)
end

function var_0_0.UpdateBlurSize(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	local var_25_0 = pg.UIMgr.GetInstance().cameraBlurs[pg.UIMgr.CameraUI][1]

	arg_25_0:TweenValue(arg_25_0._tf, arg_25_1, arg_25_2, arg_25_3, 0, function(arg_26_0)
		var_25_0.blurSize = arg_26_0
	end, arg_25_4)
end

function var_0_0.ResetBlurSize(arg_27_0)
	pg.UIMgr.GetInstance().cameraBlurs[pg.UIMgr.CameraUI][1].blurSize = arg_27_0.blurSize
end

function var_0_0.ReplaceGC(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0:UpdateSpeed()
	arg_28_0:StopAniamtion(arg_28_0.topAnim, var_0_2)
	arg_28_0:StopAniamtion(arg_28_0.bottomAnim, var_0_3)

	local var_28_0 = arg_28_0.bottomBg.sprite

	arg_28_0.topBg.sprite = var_28_0
	arg_28_0.bottomBg.sprite = LoadSprite("bg/" .. arg_28_1)

	arg_28_2()
end

function var_0_0.SetEndEvent(arg_29_0, arg_29_1, arg_29_2)
	arg_29_1:SetEndEvent(nil)
	arg_29_1:SetEndEvent(function()
		arg_29_1:SetEndEvent(nil)
		arg_29_2()
	end)
end

function var_0_0.SetTriggerEvent(arg_31_0, arg_31_1, arg_31_2)
	arg_31_1:SetTriggerEvent(nil)
	arg_31_1:SetTriggerEvent(function()
		arg_31_1:SetTriggerEvent(nil)
		arg_31_2()
	end)
end

function var_0_0.PlayAniamtion(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	arg_33_1:get_Item(arg_33_3).speed = arg_33_2

	arg_33_1:Play(arg_33_3)
end

function var_0_0.StopAniamtion(arg_34_0, arg_34_1, arg_34_2)
	arg_34_1:get_Item(arg_34_2).speed = 1
	arg_34_1:get_Item(arg_34_2).time = 0

	arg_34_1:Rewind(arg_34_2)
	arg_34_1:Sample()
end

function var_0_0.Dispose(arg_35_0)
	arg_35_0.topDft:SetEndEvent(nil)
	arg_35_0.bottomDft:SetEndEvent(nil)
	arg_35_0.titleDft:SetEndEvent(nil)
	arg_35_0.titleDft:SetTriggerEvent(nil)
	arg_35_0:ResetLayout()

	arg_35_0._go = nil
	arg_35_0._tf = nil
	arg_35_0.topBox = nil
	arg_35_0.bottomBox = nil
	arg_35_0.topDft = nil

	arg_35_0:ClearAnimation()
end

return var_0_0
