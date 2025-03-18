local var_0_0 = class("KindergartenScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "KindergartenUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.mainAnim = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.topUI = arg_2_0:findTF("ui/top")

	local var_2_0 = arg_2_0:findTF("title/title_kinder", arg_2_0.topUI)

	var_2_0:GetComponent(typeof(Image)):SetNativeSize()

	arg_2_0:findTF("FX/textmask", var_2_0).localScale = {
		x = var_2_0.rect.width,
		y = var_2_0.rect.height
	}
	arg_2_0.bottomUI = arg_2_0:findTF("ui/bottom")
	arg_2_0.paradiseBtn = arg_2_0:findTF("paradise", arg_2_0.bottomUI)
	arg_2_0.paradiseValue = arg_2_0:findTF("value/Text", arg_2_0.paradiseBtn)
	arg_2_0.adventureBtn = arg_2_0:findTF("adventure", arg_2_0.bottomUI)
	arg_2_0.rightUI = arg_2_0:findTF("ui/right")
	arg_2_0.ptBtn = arg_2_0:findTF("pt", arg_2_0.rightUI)
	arg_2_0.ptValue = arg_2_0:findTF("value/Text", arg_2_0.ptBtn)
	arg_2_0.ptTip = arg_2_0:findTF("tip", arg_2_0.ptBtn)
	arg_2_0.rankBtn = arg_2_0:findTF("rank", arg_2_0.rightUI)
	arg_2_0.taskBtn = arg_2_0:findTF("task", arg_2_0.rightUI)
	arg_2_0.taskTip = arg_2_0:findTF("tip", arg_2_0.taskBtn)
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0:findTF("back", arg_3_0.topUI), function()
		arg_3_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("home", arg_3_0.topUI), function()
		arg_3_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("help", arg_3_0.topUI), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip["202406_main_help"].tip
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.paradiseBtn, function()
		arg_3_0:emit(KindergartenMediator.GO_SUBLAYER, Context.New({
			mediator = TongXinSpringMediator,
			viewComponent = TongXinSpringLayer
		}))
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.adventureBtn, function()
		arg_3_0:emit(KindergartenMediator.GO_SCENE, SCENE.BOSSRUSH_MAIN)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.ptBtn, function()
		arg_3_0:emit(KindergartenMediator.GO_SUBLAYER, Context.New({
			mediator = ChildishnessSchoolPtMediator,
			viewComponent = ChildishnessSchoolPtPage
		}))
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.rankBtn, function()
		arg_3_0:emit(KindergartenMediator.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.taskBtn, function()
		arg_3_0:emit(KindergartenMediator.GO_SUBLAYER, Context.New({
			mediator = ChildishnessSchoolTaskMediator,
			viewComponent = ChildishnessSchoolTaskPage
		}))
	end, SFX_PANEL)

	local var_3_0 = arg_3_0.contextData.isBack and "anim_kinder_main_show" or "anim_kinder_main_in"

	arg_3_0.mainAnim:Play(var_3_0)
	arg_3_0:UpdateView()
end

function var_0_0.UpdateView(arg_12_0)
	arg_12_0:UpdatePt()
	arg_12_0:UpdateTask()
end

function var_0_0.UpdatePt(arg_13_0)
	local var_13_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.ALVIT_PT_ACT_ID)

	if var_13_0 and not var_13_0:isEnd() then
		setActive(arg_13_0.ptBtn, true)
		setActive(arg_13_0.ptTip, var_0_0.ShowPtTip(var_13_0))
		setText(arg_13_0.ptValue, var_13_0.data1)
	else
		setActive(arg_13_0.ptBtn, false)
	end
end

function var_0_0.UpdateTask(arg_14_0)
	local var_14_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.ALVIT_TASK_ACT_ID)

	if var_14_0 and not var_14_0:isEnd() then
		setActive(arg_14_0.taskBtn, true)
		setActive(arg_14_0.taskTip, var_0_0.ShowTaskTip(var_14_0))
	else
		setActive(arg_14_0.taskBtn, false)
	end
end

function var_0_0.UpdateParadise(arg_15_0)
	local var_15_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_HOTSPRING)

	if var_15_0 and not var_15_0:isEnd() then
		setActive(arg_15_0.paradiseBtn, true)

		local var_15_1 = #var_15_0:GetAvaliableShipIds()
		local var_15_2 = var_15_0:GetTotalSlotCount()

		setText(arg_15_0.paradiseValue, string.format("(%d/%d)", var_15_1, var_15_2))
	else
		setActive(arg_15_0.paradiseBtn, false)
	end
end

function var_0_0.onBackPressed(arg_16_0)
	arg_16_0:quickExitFunc()
end

function var_0_0.ShowPtTip(arg_17_0)
	local var_17_0 = arg_17_0 or getProxy(ActivityProxy):getActivityById(ActivityConst.ALVIT_PT_ACT_ID)

	return Activity.IsActivityReady(var_17_0)
end

function var_0_0.ShowTaskTip(arg_18_0)
	local var_18_0 = arg_18_0 or getProxy(ActivityProxy):getActivityById(ActivityConst.ALVIT_TASK_ACT_ID)

	return Activity.IsActivityReady(var_18_0)
end

function var_0_0.IsShowMainTip()
	return var_0_0.ShowPtTip() or var_0_0.ShowTaskTip()
end

return var_0_0
