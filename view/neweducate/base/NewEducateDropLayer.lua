local var_0_0 = class("NewEducateDropLayer", import("view.newEducate.base.NewEducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateDropUI"
end

function var_0_0.init(arg_2_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})

	arg_2_0.drops = arg_2_0.contextData.items or {}
	arg_2_0.awardWindow = arg_2_0._tf:Find("award_window")
	arg_2_0.anim = arg_2_0.awardWindow:GetComponent(typeof(Animation))
	arg_2_0.animEvent = arg_2_0.awardWindow:GetComponent(typeof(DftAniEvent))

	arg_2_0.animEvent:SetEndEvent(function()
		arg_2_0:emit(var_0_0.ON_CLOSE)
	end)

	arg_2_0.tipTF = arg_2_0.awardWindow:Find("tip")

	setText(arg_2_0.tipTF, i18n("child_close_tip"))

	arg_2_0.itemContainer = arg_2_0.awardWindow:Find("scroll/content")
	arg_2_0.itemTpl = arg_2_0.awardWindow:Find("tpl")

	setActive(arg_2_0.itemTpl, false)

	arg_2_0.favorWindow = arg_2_0._tf:Find("favor_window")
	arg_2_0.favorLvTF = arg_2_0.favorWindow:Find("gift/heart/level")

	setActive(arg_2_0.awardWindow, false)
	setActive(arg_2_0.favorWindow, false)
	arg_2_0._tf:SetAsLastSibling()
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0:findTF("close", arg_4_0.awardWindow), function()
		arg_4_0:_close()
	end, SFX_CANCEL)
	seriesAsync({
		function(arg_6_0)
			if arg_4_0.contextData.isFavor then
				setActive(arg_4_0.favorWindow, true)
				setText(arg_4_0.favorLvTF, arg_4_0.contextData.char:GetFavorInfo().lv)
				arg_4_0:managedTween(LeanTween.delayedCall, arg_6_0, 1, nil)
			else
				arg_6_0()
			end
		end
	}, function()
		arg_4_0:ShowAwardWindow()
	end)
end

function var_0_0.ShowAwardWindow(arg_8_0)
	setActive(arg_8_0.favorWindow, false)

	arg_8_0.inAnimPlaying = true

	setActive(arg_8_0.awardWindow, true)
	arg_8_0.anim:Play("anim_educate_dropaward_in")

	local var_8_0 = {}

	table.insert(var_8_0, function(arg_9_0)
		arg_8_0:managedTween(LeanTween.delayedCall, function()
			arg_9_0()
		end, 0.33, nil)
	end)

	for iter_8_0 = 1, #arg_8_0.drops do
		table.insert(var_8_0, function(arg_11_0)
			local var_11_0 = arg_8_0.drops[iter_8_0]
			local var_11_1 = cloneTplTo(arg_8_0.itemTpl, arg_8_0.itemContainer)

			NewEducateHelper.UpdateItem(var_11_1, var_11_0)
			onButton(arg_8_0, var_11_1, function()
				arg_8_0:emit(NewEducateBaseUI.ON_ITEM, {
					drop = var_11_0
				})
			end)
			arg_8_0:managedTween(LeanTween.delayedCall, function()
				arg_11_0()
			end, 0.066, nil)
		end)
	end

	seriesAsync(var_8_0, function()
		arg_8_0:managedTween(LeanTween.delayedCall, function()
			arg_8_0.inAnimPlaying = false
		end, 0.066, nil)
	end)
end

function var_0_0._close(arg_16_0)
	if pg.NewGuideMgr.GetInstance():IsBusy() then
		arg_16_0:emit(var_0_0.ON_CLOSE)

		return
	end

	if arg_16_0.inAnimPlaying or arg_16_0.isCloseAnim then
		return
	end

	arg_16_0.anim:Play("anim_educate_awardinfo_award_out")

	arg_16_0.isCloseAnim = true
end

function var_0_0.onBackPressed(arg_17_0)
	arg_17_0:_close()
end

function var_0_0.willExit(arg_18_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_18_0._tf)

	if arg_18_0.contextData.removeFunc then
		arg_18_0.contextData.removeFunc()

		arg_18_0.contextData.removeFunc = nil
	end
end

return var_0_0
