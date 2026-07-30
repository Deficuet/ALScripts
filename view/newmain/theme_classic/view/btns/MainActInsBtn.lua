local var_0_0 = class("MainActInsBtn", import(".MainBaseSpcailActBtn"))

function var_0_0.GetContainer(arg_1_0)
	return arg_1_0.root
end

function var_0_0.InShowTime(arg_2_0)
	return true
end

function var_0_0.GetUIName(arg_3_0)
	return "MainUIInsBtn"
end

function var_0_0.OnClick(arg_4_0)
	arg_4_0.event:emit(NewMainMediator.SKIP_INS)
end

function var_0_0.OnRegister(arg_5_0)
	arg_5_0.initX = getAnchoredPosition(arg_5_0._tf).x
end

function var_0_0.OnInit(arg_6_0)
	arg_6_0.animator = arg_6_0._tf:Find("icon"):GetComponent(typeof(Animator))

	local var_6_0 = getProxy(InstagramProxy):ShouldShowTip() or getProxy(InstagramChatProxy):ShouldShowTip() or getProxy(InstagramProxy):ShouldShowTip()

	arg_6_0.animator.enabled = var_6_0

	setActive(arg_6_0._tf:Find("Tip"), var_6_0)

	arg_6_0._tf.localScale = arg_6_0.isScale and Vector3(0.85, 0.85, 1) or Vector3(1, 1, 1)

	local var_6_1 = arg_6_0.isOverflow and arg_6_0.initX - 200 or arg_6_0.initX

	setAnchoredPosition(arg_6_0._tf, {
		x = var_6_1,
		y = arg_6_0.isScale and -950 or -752.5
	})
end

return var_0_0
