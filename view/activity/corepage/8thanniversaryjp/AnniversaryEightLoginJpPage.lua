local var_0_0 = class("AnniversaryEightLoginJpPage", import("view.activity.CorePage.templatePage.CoreLoginSignTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.item = arg_1_0:findTF("item", arg_1_0.bg)
	arg_1_0.items = arg_1_0:findTF("items/items", arg_1_0.bg)
	arg_1_0.itemList = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.signBtn = arg_1_0:findTF("signBtn", arg_1_0.bg)
	arg_1_0.signRedTip = arg_1_0:findTF("signBtn/tip", arg_1_0.bg)
end

function var_0_0.OnFirstFlush(arg_2_0)
	arg_2_0.enterFlag = true

	setActive(arg_2_0.item, false)

	arg_2_0.playedAnimationList = {}

	for iter_2_0 = 1, arg_2_0.activity.data1 do
		table.insert(arg_2_0.playedAnimationList, iter_2_0 - 1)
	end

	arg_2_0.itemList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			local var_3_0 = arg_2_0:findTF("item", arg_3_2)
			local var_3_1 = arg_2_0.config.front_drops[arg_3_1 + 1]
			local var_3_2 = {
				type = var_3_1[1],
				id = var_3_1[2],
				count = var_3_1[3]
			}

			updateDrop(var_3_0, var_3_2)
			onButton(arg_2_0, arg_3_2, function()
				arg_2_0:emit(BaseUI.ON_DROP, var_3_2)
			end, SFX_PANEL)

			local var_3_3 = arg_2_0:findTF("got", arg_3_2)

			setActive(var_3_3, arg_3_1 < arg_2_0.nday)
			setActive(arg_2_0:findTF("getEffect", arg_3_2), arg_2_0.activity.data1 == arg_3_1 and arg_2_0.activity:readyToAchieve())

			if table.contains(arg_2_0.playedAnimationList, arg_3_1) and arg_3_1 == arg_2_0.nday - 1 then
				GetComponent(arg_3_2, typeof(Animation)):Play("anim_AnniversaryEightLoginJPPage_tpl_get")
			end
		end
	end)
	onButton(arg_2_0, arg_2_0.signBtn, function()
		if arg_2_0.activity:readyToAchieve() == false then
			return
		end

		arg_2_0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = arg_2_0.activity.id
		})
	end, SFX_CONFIRM)
end

function var_0_0.ShowOrHide(arg_6_0, arg_6_1)
	var_0_0.super.ShowOrHide(arg_6_0, arg_6_1)

	if arg_6_1 == true then
		setActive(arg_6_0.items, false)

		arg_6_0.showTimer = Timer.New(function()
			arg_6_0.enterFlag = false

			setActive(arg_6_0.items, true)
			arg_6_0:StopTimer()
		end, 0.396, 1)

		arg_6_0.showTimer:Start()
	else
		arg_6_0.enterFlag = true
	end
end

function var_0_0.StopTimer(arg_8_0)
	if arg_8_0.showTimer then
		arg_8_0.showTimer:Stop()

		arg_8_0.showTimer = nil
	end
end

function var_0_0.OnUpdateFlush(arg_9_0)
	arg_9_0.nday = arg_9_0.activity.data1

	for iter_9_0 = 1, arg_9_0.activity.data1 do
		table.insert(arg_9_0.playedAnimationList, iter_9_0 - 1)
	end

	arg_9_0.itemList:align(arg_9_0.Day, arg_9_0.enterFlag and 0.1 or 0)
	setText(arg_9_0.bg:Find("items/Root/image_05/Text"), arg_9_0.nday .. "/" .. arg_9_0.Day)

	local var_9_0 = arg_9_0.activity:readyToAchieve()

	setActive(arg_9_0.signRedTip, var_9_0)
	setGray(arg_9_0.signBtn, not var_9_0)
end

function var_0_0.OnDestroy(arg_10_0)
	arg_10_0:StopTimer()
	arg_10_0.itemList:Dispose()
	var_0_0.super.OnDestroy(arg_10_0)
end

return var_0_0
