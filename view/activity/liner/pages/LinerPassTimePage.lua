local var_0_0 = class("LinerPassTimePage", import("view.base.BaseSubView"))

var_0_0.ANIM_TIME = 0.75
var_0_0.DELAY_TIME = 0.5

function var_0_0.getUIName(arg_1_0)
	return "LinerPassTimePage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.rotateTF = arg_2_0:findTF("progress/Image")
	arg_2_0.dayTF = arg_2_0:findTF("time/day")

	setText(arg_2_0.dayTF, "DAY")

	arg_2_0.beforeDay = arg_2_0:findTF("time/day_1")
	arg_2_0.afterDay = arg_2_0:findTF("time/day_2")
	arg_2_0.pointTF = arg_2_0:findTF("time/point")
	arg_2_0.pointAfterTF = arg_2_0:findTF("time/point_after")
	arg_2_0.timeAnim = arg_2_0:findTF("time"):GetComponent(typeof(Animation))
	arg_2_0.anim = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.animEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	arg_2_0.animEvent:SetEndEvent(function()
		arg_2_0:Hide()
	end)
end

function var_0_0.OnInit(arg_4_0)
	return
end

function var_0_0.ShowAnim(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	local var_5_0 = arg_5_1:GetDayByIdx(arg_5_3)
	local var_5_1 = arg_5_1:GetTimeByIdx(arg_5_2)
	local var_5_2 = arg_5_1:GetTimeByIdx(arg_5_3)
	local var_5_3 = var_5_1:GetType() == LinerTime.TYPE.STORY and var_5_0 - 1 or var_5_0

	setText(arg_5_0.beforeDay, string.format("%02d", var_5_3))
	setText(arg_5_0.afterDay, string.format("%02d", var_5_3))
	setText(arg_5_0.pointTF, var_5_1:GetStartTimeDesc())
	setText(arg_5_0.pointAfterTF, var_5_1:GetStartTimeDesc())

	local var_5_4 = var_5_1:GetTime()[1]
	local var_5_5 = var_5_2:GetTime()[1]
	local var_5_6 = var_5_3 == var_5_0 and "anim_passtime_change" or "anim_passtime_change1"
	local var_5_7 = var_5_4 > 3 and var_5_4 or var_5_4 + 24
	local var_5_8 = var_5_5 > 3 and var_5_5 or var_5_5 + 24
	local var_5_9 = var_5_7 - 8
	local var_5_10 = var_5_8 - 8
	local var_5_11 = math.floor(var_5_9 * 180 / 19)
	local var_5_12 = math.floor(var_5_10 * 180 / 19)

	setLocalEulerAngles(arg_5_0.rotateTF, {
		z = -var_5_11
	})
	arg_5_0:Show()
	seriesAsync({
		function(arg_6_0)
			arg_5_0:managedTween(LeanTween.delayedCall, function()
				arg_6_0()
			end, 0.4, nil)
		end,
		function(arg_8_0)
			if var_5_11 > var_5_12 then
				arg_5_0:managedTween(LeanTween.delayedCall, function()
					setLocalEulerAngles(arg_5_0.rotateTF, {
						z = -var_5_12
					})
					arg_8_0()
					setText(arg_5_0.afterDay, string.format("%02d", var_5_0))
					setText(arg_5_0.pointAfterTF, var_5_2:GetStartTimeDesc())
					arg_5_0.timeAnim:Play(var_5_6)
				end, var_0_0.ANIM_TIME, nil)
			else
				arg_5_0:managedTween(LeanTween.value, nil, go(arg_5_0.rotateTF), var_5_11, var_5_12, var_0_0.ANIM_TIME):setOnUpdate(System.Action_float(function(arg_10_0)
					setLocalEulerAngles(arg_5_0.rotateTF, {
						z = -arg_10_0
					})
				end)):setEase(LeanTweenType.easeInOutCubic):setOnComplete(System.Action(function()
					arg_8_0()
				end))
				setText(arg_5_0.afterDay, string.format("%02d", var_5_0))
				setText(arg_5_0.pointAfterTF, var_5_2:GetStartTimeDesc())
				arg_5_0.timeAnim:Play(var_5_6)
			end
		end,
		function(arg_12_0)
			arg_5_0:managedTween(LeanTween.delayedCall, function()
				arg_12_0()
			end, var_0_0.DELAY_TIME, nil)
		end
	}, function()
		if arg_5_4 then
			arg_5_4()
		end

		arg_5_0.anim:Play("anim_passtime_out")
	end)
end

function var_0_0.Show(arg_15_0)
	var_0_0.super.Show(arg_15_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_15_0._tf)
end

function var_0_0.Hide(arg_16_0)
	var_0_0.super.Hide(arg_16_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_16_0._tf)
end

function var_0_0.OnDestroy(arg_17_0)
	return
end

return var_0_0
