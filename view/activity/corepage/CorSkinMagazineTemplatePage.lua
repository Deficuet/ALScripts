local var_0_0 = class("SkinMagazineTemplatePage", import("view.activity.CorePage.CoreActivityPage"))

var_0_0.EXPAND_WIDTH = 839
var_0_0.CLOSE_WIDTH = 146
var_0_0.DURATION_PARAMETER = 1500
var_0_0.TIP_KEY = "SkinMagazinePage2_tip"

function var_0_0.OnInit(arg_1_0)
	arg_1_0.items = arg_1_0._tf:Find("AD/items")
	arg_1_0.countTf = arg_1_0._tf:Find("AD/task/count")
	arg_1_0.awardTf = arg_1_0._tf:Find("AD/task/IconTpl")
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskList = arg_2_0.activity:getConfig("config_data")
	arg_2_0.totalCnt = #arg_2_0.taskList
end

function var_0_0.RefreshData(arg_3_0)
	local var_3_0 = pg.TimeMgr.GetInstance()

	arg_3_0.unlockCnt = (var_3_0:DiffDay(arg_3_0.activity:getStartTime(), var_3_0:GetServerTime()) + 1) * arg_3_0.activity:getConfig("config_id")
	arg_3_0.unlockCnt = math.min(arg_3_0.unlockCnt, arg_3_0.totalCnt)
	arg_3_0.remainCnt = arg_3_0.usedCnt >= arg_3_0.totalCnt and 0 or arg_3_0.unlockCnt - arg_3_0.usedCnt
end

function var_0_0.OnFirstFlush(arg_4_0)
	arg_4_0.usedCnt = arg_4_0.activity:getData1()

	arg_4_0:RefreshData()
	setText(arg_4_0.awardTf:Find("get/tip/Text"), i18n(arg_4_0.TIP_KEY))

	arg_4_0.index = #arg_4_0.taskList

	for iter_4_0 = 1, #arg_4_0.taskList do
		warning(arg_4_0.taskList[iter_4_0])

		if not arg_4_0.taskProxy:getTaskVO(arg_4_0.taskList[iter_4_0]):isReceive() then
			arg_4_0.index = iter_4_0

			break
		end
	end

	for iter_4_1 = 1, arg_4_0.items.childCount do
		local var_4_0 = arg_4_0.items:GetChild(iter_4_1 - 1)

		var_4_0:GetComponent(typeof(LayoutElement)).preferredWidth = iter_4_1 == arg_4_0.index and arg_4_0.EXPAND_WIDTH or arg_4_0.CLOSE_WIDTH

		setImageAlpha(var_4_0:Find("close"), iter_4_1 == arg_4_0.index and 0 or 1)
		onButton(arg_4_0, var_4_0, function()
			arg_4_0:SelectItem(iter_4_1)
		end, SFX_PANEL)
	end

	arg_4_0:UpdateDrop()

	local var_4_1 = arg_4_0.activity:getConfig("config_client").firstStory

	if var_4_1 then
		playStory(var_4_1)
	end
end

function var_0_0.OnUpdateFlush(arg_6_0)
	local var_6_0 = 0
	local var_6_1 = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.taskList) do
		var_6_1[iter_6_1] = tobool(arg_6_0.taskProxy:getFinishTaskById(iter_6_1))

		if var_6_1[iter_6_1] then
			var_6_0 = var_6_0 + 1
		end

		setActive(arg_6_0.items:GetChild(iter_6_0 - 1):Find("got"), var_6_1[iter_6_1])
	end

	if arg_6_0.usedCnt ~= var_6_0 then
		arg_6_0.usedCnt = var_6_0

		local var_6_2 = arg_6_0.activity

		var_6_2.data1 = arg_6_0.usedCnt

		getProxy(ActivityProxy):updateActivity(var_6_2)
	end

	arg_6_0:RefreshData()
	setText(arg_6_0.countTf, arg_6_0.remainCnt)

	local var_6_3 = var_6_1[arg_6_0.taskList[arg_6_0.index]]

	setActive(arg_6_0.awardTf:Find("got"), var_6_3)
	setActive(arg_6_0.awardTf:Find("get"), arg_6_0.remainCnt > 0 and not var_6_3)

	local var_6_4 = arg_6_0.activity:getConfig("config_client").story

	for iter_6_2, iter_6_3 in ipairs(arg_6_0.taskList) do
		if arg_6_0.taskProxy:getFinishTaskById(iter_6_3) and checkExist(var_6_4, {
			iter_6_2
		}, {
			1
		}) then
			playStory(var_6_4[iter_6_2][1])
		end
	end
end

function var_0_0.SelectItem(arg_7_0, arg_7_1)
	if arg_7_0.index == arg_7_1 then
		return
	end

	arg_7_0.index = arg_7_1

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.LTList or {}) do
		LeanTween.cancel(iter_7_1)
	end

	arg_7_0.LTList = {}

	for iter_7_2 = 1, arg_7_0.items.childCount do
		local var_7_0 = arg_7_0.items:GetChild(iter_7_2 - 1)
		local var_7_1 = var_7_0:GetComponent(typeof(LayoutElement))
		local var_7_2 = var_7_1.preferredWidth
		local var_7_3 = iter_7_2 == arg_7_1 and arg_7_0.EXPAND_WIDTH or arg_7_0.CLOSE_WIDTH

		if var_7_2 ~= var_7_3 then
			local var_7_4 = math.abs(var_7_3 - var_7_2) / arg_7_0.DURATION_PARAMETER

			table.insert(arg_7_0.LTList, LeanTween.value(go(var_7_0), var_7_2, var_7_3, var_7_4):setEase(LeanTweenType.easeOutSine):setOnUpdate(System.Action_float(function(arg_8_0)
				var_7_1.preferredWidth = arg_8_0
			end)).uniqueId)
			table.insert(arg_7_0.LTList, LeanTween.alpha(var_7_0:Find("close"), iter_7_2 == arg_7_1 and 0 or 1, var_7_4):setEase(LeanTweenType.easeOutSine).uniqueId)
		end
	end

	arg_7_0:UpdateDrop()
end

function var_0_0.UpdateDrop(arg_9_0)
	local var_9_0 = arg_9_0.taskProxy:getTaskVO(arg_9_0.taskList[arg_9_0.index])
	local var_9_1 = Drop.Create(var_9_0:getConfig("award_display")[1])

	updateDrop(arg_9_0.awardTf, var_9_1)
	onButton(arg_9_0, arg_9_0.awardTf:Find("get"), function()
		arg_9_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_9_0)
	end, SFX_CONFIRM)
	onButton(arg_9_0, arg_9_0.awardTf, function()
		arg_9_0:emit(BaseUI.ON_DROP, var_9_1)
	end)

	local var_9_2 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.taskList) do
		var_9_2[iter_9_1] = tobool(arg_9_0.taskProxy:getFinishTaskById(iter_9_1))
	end

	local var_9_3 = var_9_2[arg_9_0.taskList[arg_9_0.index]]

	setActive(arg_9_0.awardTf:Find("got"), var_9_3)
	setActive(arg_9_0.awardTf:Find("get"), arg_9_0.remainCnt > 0 and not var_9_3)
end

function var_0_0.OnDestroy(arg_12_0)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0.LTList or {}) do
		LeanTween.cancel(iter_12_1)
	end
end

return var_0_0
