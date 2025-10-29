local var_0_0 = class("Shrine2022ShipWordView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "Shrine2022ShipWordUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf)
	arg_2_0:Show()
	arg_2_0:playEnterAni(true)
end

function var_0_0.OnDestroy(arg_3_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_3_0._tf)
	arg_3_0:cleanManagedTween()
end

function var_0_0.initData(arg_4_0)
	arg_4_0.curSelectShip = arg_4_0.contextData.curSelectShip
end

function var_0_0.initUI(arg_5_0)
	arg_5_0.bg = arg_5_0._tf:Find("BG")
	arg_5_0.wordImg = arg_5_0._tf:Find("Word")
	arg_5_0.cloud1 = arg_5_0._tf:Find("Cloud1")
	arg_5_0.cloud2 = arg_5_0._tf:Find("Cloud2")

	local var_5_0 = "shipword_" .. arg_5_0.curSelectShip
	local var_5_1 = "Shrine2022/" .. var_5_0

	setImageSprite(arg_5_0.wordImg, LoadSprite(var_5_1, var_5_0), true)
	onButton(arg_5_0, arg_5_0.bg, function()
		arg_5_0:closeMySelf()
	end, SFX_PANEL)
end

function var_0_0.playEnterAni(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1 and 1000 or 0
	local var_7_1 = arg_7_1 and 0 or 1000
	local var_7_2 = {
		x = var_7_0,
		y = rtf(arg_7_0.cloud1).anchoredPosition.y
	}
	local var_7_3 = arg_7_1 and -1000 or 0
	local var_7_4 = arg_7_1 and 0 or -1000
	local var_7_5 = {
		x = var_7_3,
		y = rtf(arg_7_0.cloud2).anchoredPosition.y
	}
	local var_7_6 = arg_7_1 and 0 or 1
	local var_7_7 = arg_7_1 and 1 or 0
	local var_7_8 = {
		x = var_7_6,
		y = var_7_6
	}
	local var_7_9 = 0.3

	arg_7_0.isPlaying = true

	arg_7_0:managedTween(LeanTween.value, nil, go(arg_7_0.cloud1), 0, 1, var_7_9):setOnUpdate(System.Action_float(function(arg_8_0)
		local var_8_0 = var_7_0 + (var_7_1 - var_7_0) * arg_8_0
		local var_8_1 = var_7_3 + (var_7_4 - var_7_3) * arg_8_0
		local var_8_2 = var_7_6 + (var_7_7 - var_7_6) * arg_8_0

		var_7_2.x = var_8_0

		setAnchoredPosition(arg_7_0.cloud1, var_7_2)

		var_7_5.x = var_8_1

		setAnchoredPosition(arg_7_0.cloud2, var_7_5)

		var_7_8.x = var_8_2
		var_7_8.y = var_8_2

		setLocalScale(arg_7_0.wordImg, var_7_8)
	end)):setOnComplete(System.Action(function()
		arg_7_0.isPlaying = false

		if arg_7_2 then
			arg_7_2()
		end
	end))
end

function var_0_0.closeMySelf(arg_10_0)
	if arg_10_0.isPlaying then
		return
	end

	arg_10_0:playEnterAni(false, function()
		arg_10_0:Destroy()
	end)
end

return var_0_0
