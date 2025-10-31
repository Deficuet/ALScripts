local var_0_0 = class("NewYearSkinShowPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0:findUI()
	arg_1_0:initData()
end

function var_0_0.findUI(arg_2_0)
	arg_2_0.paintBackTF = arg_2_0._tf:Find("Paints/PaintBack")
	arg_2_0.paintFrontTF = arg_2_0._tf:Find("Paints/PaintFront")
	arg_2_0.skinShopBtn = arg_2_0._tf:Find("BtnShop")
	arg_2_0.goBtn = arg_2_0._tf:Find("BtnGO")

	onButton(arg_2_0, arg_2_0.skinShopBtn, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.SKINSHOP)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.goBtn, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.NEWYEAR_BACKHILL)
	end, SFX_PANEL)
end

function var_0_0.initData(arg_5_0)
	arg_5_0.paintCount = 20
	arg_5_0.curPaintIndex = 1
	arg_5_0.paintSwitchTime = 1
	arg_5_0.paintStaticTime = 3.5
	arg_5_0.paintStaticCountValue = 0
	arg_5_0.paintPathPrefix = "NewYearSkinShowPage/"
	arg_5_0.paintNamePrefix = "NewYearA"
end

function var_0_0.switchNextPaint(arg_6_0)
	arg_6_0.frameTimer:Stop()

	local var_6_0 = arg_6_0.curPaintIndex % arg_6_0.paintCount + 1
	local var_6_1 = arg_6_0.paintNamePrefix .. var_6_0
	local var_6_2 = arg_6_0.paintPathPrefix .. var_6_1

	setImageSprite(arg_6_0.paintBackTF, LoadSprite(var_6_2, var_6_1))
	LeanTween.value(go(arg_6_0.paintFrontTF), 1, 0, arg_6_0.paintSwitchTime):setOnUpdate(System.Action_float(function(arg_7_0)
		setImageAlpha(arg_6_0.paintFrontTF, arg_7_0)
		setImageAlpha(arg_6_0.paintBackTF, 1 - arg_7_0)
	end)):setOnComplete(System.Action(function()
		setImageFromImage(arg_6_0.paintFrontTF, arg_6_0.paintBackTF)
		setImageAlpha(arg_6_0.paintFrontTF, 1)
		setImageAlpha(arg_6_0.paintBackTF, 0)

		arg_6_0.curPaintIndex = var_6_0

		arg_6_0.frameTimer:Start()
	end))
end

function var_0_0.OnFirstFlush(arg_9_0)
	arg_9_0:initPaint()
	arg_9_0:initTimer()
end

function var_0_0.initPaint(arg_10_0)
	local var_10_0 = arg_10_0.curPaintIndex
	local var_10_1 = (var_10_0 - 1) % arg_10_0.paintCount + 1
	local var_10_2 = arg_10_0.paintNamePrefix .. var_10_0
	local var_10_3 = arg_10_0.paintPathPrefix .. var_10_2

	setImageSprite(arg_10_0.paintFrontTF, LoadSprite(var_10_3, var_10_2))

	local var_10_4 = arg_10_0.paintNamePrefix .. var_10_1
	local var_10_5 = arg_10_0.paintPathPrefix .. var_10_4

	setImageSprite(arg_10_0.paintBackTF, LoadSprite(var_10_5, var_10_4))
end

function var_0_0.initTimer(arg_11_0)
	local var_11_0 = 0.016666666666666666

	arg_11_0.paintStaticCountValue = 0
	arg_11_0.frameTimer = Timer.New(function()
		arg_11_0.paintStaticCountValue = arg_11_0.paintStaticCountValue + var_11_0

		if arg_11_0.paintStaticCountValue >= arg_11_0.paintStaticTime then
			arg_11_0.paintStaticCountValue = 0

			arg_11_0:switchNextPaint()
		end
	end, var_11_0, -1, false)

	arg_11_0.frameTimer:Start()
end

function var_0_0.OnDestroy(arg_13_0)
	if arg_13_0.frameTimer then
		arg_13_0.frameTimer:Stop()

		arg_13_0.frameTimer = nil
	end
end

return var_0_0
