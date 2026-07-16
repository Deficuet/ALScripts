local var_0_0 = class("AuctionGameTaskItem", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiGoBtn, function()
		local var_3_0 = arg_2_0.taskVO:getConfig("scene")

		if var_3_0 and #var_3_0 > 0 and var_3_0[2] and var_3_0[2].unlockActivityID and var_3_0[1] == "AUCTION_GAME_ENTRANCE" and getProxy(ContextProxy):getContextByMediator(AuctionGameEntranceMediator) then
			arg_2_0:emit(BaseUI.ON_CLOSE)

			return
		end

		arg_2_0:emit(AuctionGameTaskMediator.ON_TASK_GO, arg_2_0.taskVO)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiGetBtn, function()
		arg_2_0:emit(AuctionGameTaskMediator.ON_TASK_SUBMIT, arg_2_0.taskVO)
	end, SFX_PANEL)

	arg_2_0.rewardList = UIItemList.New(arg_2_0.uiRewardList, arg_2_0.uiRewardItem)

	arg_2_0.rewardList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = arg_5_1 + 1
			local var_5_1 = arg_2_0.taskVO:getConfig("award_display")
			local var_5_2 = Drop.Create(var_5_1[var_5_0])

			updateDrop(arg_5_2, var_5_2)
			onButton(arg_2_0, arg_5_2, function()
				arg_2_0:emit(BaseUI.ON_DROP, var_5_2)
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.didEnter(arg_7_0)
	return
end

function var_0_0.willExit(arg_8_0)
	arg_8_0:detach()
end

function var_0_0.SetData(arg_9_0, arg_9_1)
	arg_9_0.taskVO = arg_9_1

	setText(arg_9_0.uiDescText, arg_9_1:getConfig("desc"))

	local var_9_0 = arg_9_1:getConfig("target_num")
	local var_9_1 = arg_9_1:getProgress()

	if arg_9_1:getConfig("sub_type") == TASK_SUB_TYPE_REPEATABLE then
		var_9_0 = 1
	end

	if var_9_0 < var_9_1 then
		var_9_1 = var_9_0
	end

	setText(arg_9_0.uiProgressText, string.format("%s/%s", var_9_1, var_9_0))

	arg_9_0.uiSlider.value = var_9_1 / var_9_0

	if arg_9_1:isReceive() then
		setActive(arg_9_0.uiGoBtn, false)
		setActive(arg_9_0.uiGetBtn, false)
		setActive(arg_9_0.uiGotBtn, true)
	else
		setActive(arg_9_0.uiGotBtn, false)

		if arg_9_1:isFinish() then
			setActive(arg_9_0.uiGoBtn, false)
			setActive(arg_9_0.uiGetBtn, true)
		else
			setActive(arg_9_0.uiGoBtn, true)
			setActive(arg_9_0.uiGetBtn, false)
		end
	end

	local var_9_2 = arg_9_1:getConfig("award_display")

	arg_9_0.rewardList:align(#var_9_2)

	local var_9_3 = arg_9_1:getConfig("type") == Task.TYPE_REPEATABLE

	setActive(arg_9_0.uiRepeatableGo, var_9_3)
end

return var_0_0
