local var_0_0 = class("BoatAdBg")
local var_0_1

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_1 = BoatAdGameVo
	arg_1_0._tf = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0._tf = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0._moveAnimator = GetComponent(arg_1_0._tf, typeof(Animator))
	arg_1_0._moveDftEvent = GetComponent(arg_1_0._tf, typeof(DftAniEvent))
	arg_1_0.spineTf = findTF(arg_1_0._tf, "ad/img/spine")

	arg_1_0._moveDftEvent:SetEndEvent(function()
		arg_1_0:setRemoveFlag(true)
	end)
end

function var_0_0.setData(arg_3_0, arg_3_1)
	arg_3_0._data = arg_3_1
end

function var_0_0.setSpeed(arg_4_0, arg_4_1)
	arg_4_0._moveAnimator.speed = arg_4_1
end

function var_0_0.getMoveCount(arg_5_0)
	return arg_5_0.moveCount
end

function var_0_0.setRemoveFlag(arg_6_0, arg_6_1)
	arg_6_0._removeFlag = arg_6_1
end

function var_0_0.getRemoveFlag(arg_7_0)
	return arg_7_0._removeFlag
end

function var_0_0.getId(arg_8_0)
	return arg_8_0:getConfig("id")
end

function var_0_0.getConfig(arg_9_0, arg_9_1)
	return arg_9_0._data[arg_9_1]
end

function var_0_0.setMoveCount(arg_10_0, arg_10_1)
	arg_10_0.moveCount = arg_10_1

	arg_10_0:setVisible(false)
	arg_10_0:setVisible(true)
	arg_10_0:setSpeed(1)
	arg_10_0:setInteger(arg_10_0._moveAnimator, "move_count", arg_10_1)
	arg_10_0:setTrigger(arg_10_0._moveAnimator, "bg")
end

function var_0_0.setInteger(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_1:SetInteger(arg_11_2, arg_11_3)
end

function var_0_0.setTrigger(arg_12_0, arg_12_1, arg_12_2)
	arg_12_1:SetTrigger(arg_12_2)
end

function var_0_0.setContent(arg_13_0, arg_13_1)
	arg_13_0._content = arg_13_1

	SetParent(arg_13_0._tf, arg_13_1)
end

function var_0_0.setVisible(arg_14_0, arg_14_1)
	setActive(arg_14_0._tf, arg_14_1)
end

function var_0_0.getPosition(arg_15_0)
	return arg_15_0._tf.anchoredPosition
end

function var_0_0.start(arg_16_0)
	arg_16_0._removeFlag = false
end

function var_0_0.step(arg_17_0)
	return
end

function var_0_0.checkEmptyGrid(arg_18_0)
	return
end

function var_0_0.stop(arg_19_0)
	return
end

function var_0_0.clear(arg_20_0)
	return
end

function var_0_0.dispose(arg_21_0)
	return
end

return var_0_0
