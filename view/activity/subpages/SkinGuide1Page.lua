local var_0_0 = class("SkinGuide1Page", import("...base.BaseActivityPage"))
local var_0_1 = "ui/activityuipage/skinguide1page_atlas"
local var_0_2 = {
	"xiafei",
	"weiyan",
	"kuersike",
	"deliyasite",
	"fuluoxiluofu"
}

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD/mask")
	arg_1_0.countTF = arg_1_0.bg:Find("rightPanel/count")
	arg_1_0.itemTpl = arg_1_0.bg:Find("itemTpl")

	setActive(arg_1_0.itemTpl, false)

	arg_1_0.items = arg_1_0.bg:Find("rightPanel/items")
	arg_1_0.countImg = arg_1_0.bg:Find("countImg")
	arg_1_0.paintings = arg_1_0.bg:Find("paintings")
	arg_1_0.paintingsSelected = arg_1_0.bg:Find("paintingsSelected")
	arg_1_0.descTf = arg_1_0.bg:Find("rightPanel/desc")
	arg_1_0.rightPanel = arg_1_0.bg:Find("rightPanel")
	arg_1_0.itemTfs = {}
	arg_1_0.selectedIndex = 1
	arg_1_0.paintingTfs = {}
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskList = arg_2_0.activity:getConfig("config_data")
	arg_2_0.totalCnt = #arg_2_0.taskList
end

function var_0_0.OnFirstFlush(arg_3_0)
	arg_3_0.usedCnt = arg_3_0.activity:getData1()
	arg_3_0.unlockCnt = pg.TimeMgr.GetInstance():DiffDay(arg_3_0.activity:getStartTime(), pg.TimeMgr.GetInstance():GetServerTime()) + 1
	arg_3_0.unlockCnt = arg_3_0.unlockCnt * tonumber(arg_3_0.activity:getConfig("config_id"))
	arg_3_0.unlockCnt = arg_3_0.unlockCnt > arg_3_0.totalCnt and arg_3_0.totalCnt or arg_3_0.unlockCnt
	arg_3_0.remainCnt = arg_3_0.usedCnt >= arg_3_0.totalCnt and 0 or arg_3_0.unlockCnt - arg_3_0.usedCnt

	local var_3_0 = 1

	for iter_3_0 = 1, #arg_3_0.taskList do
		local var_3_1 = iter_3_0
		local var_3_2 = tf(instantiate(arg_3_0.itemTpl))

		setParent(var_3_2, arg_3_0.items)

		var_3_2.anchoredPosition = Vector2(0, 0)

		setActive(var_3_2, false)

		local var_3_3 = arg_3_0.taskList[iter_3_0]
		local var_3_4 = arg_3_0.taskProxy:getTaskById(var_3_3) or arg_3_0.taskProxy:getFinishTaskById(var_3_3)
		local var_3_5 = var_3_4:getConfig("award_display")[1]
		local var_3_6 = {
			type = var_3_5[1],
			id = var_3_5[2],
			count = var_3_5[3]
		}

		updateDrop(findTF(var_3_2, "item"), var_3_6)
		onButton(arg_3_0, var_3_2, function()
			arg_3_0:emit(BaseUI.ON_DROP, var_3_6)
		end, SFX_PANEL)
		table.insert(arg_3_0.itemTfs, var_3_2)

		local var_3_7 = var_3_2:Find("get")

		onButton(arg_3_0, var_3_7, function()
			arg_3_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_3_4)
		end, SFX_PANEL)

		local var_3_8 = findTF(arg_3_0.paintings, var_0_2[iter_3_0])

		table.insert(arg_3_0.paintingTfs, var_3_8)

		GetComponent(findTF(var_3_8, "normal"), typeof(Image)).alphaHitTestMinimumThreshold = 0.5

		onButton(arg_3_0, findTF(var_3_8, "normal"), function()
			arg_3_0:selectedChange(var_3_1)
		end, SFX_PANEL)

		if var_3_4:getTaskStatus() == 1 and arg_3_0.remainCnt > 0 then
			var_3_0 = iter_3_0
		end
	end

	arg_3_0:updateUI()
	arg_3_0:selectedChange(var_3_0)
end

function var_0_0.selectedChange(arg_7_0, arg_7_1)
	for iter_7_0 = 1, #arg_7_0.itemTfs do
		setActive(arg_7_0.itemTfs[iter_7_0], iter_7_0 == arg_7_1)

		local var_7_0 = arg_7_0.paintingTfs[iter_7_0]

		setActive(findTF(var_7_0, "name"), iter_7_0 == arg_7_1)
		setActive(findTF(var_7_0, "selected"), iter_7_0 == arg_7_1)
		setActive(findTF(var_7_0, "normal"), iter_7_0 ~= arg_7_1)

		local var_7_1 = arg_7_0.taskList[iter_7_0]
		local var_7_2 = (arg_7_0.taskProxy:getTaskById(var_7_1) or arg_7_0.taskProxy:getFinishTaskById(var_7_1)):getTaskStatus() == 2

		setActive(findTF(var_7_0, "mask"), not var_7_2 or arg_7_1 == iter_7_0)

		if iter_7_0 == arg_7_1 then
			setParent(var_7_0, arg_7_0.paintingsSelected)
			var_7_0:SetAsLastSibling()
		else
			setParent(var_7_0, arg_7_0.paintings)
		end
	end

	if arg_7_0.selectedIndex ~= arg_7_1 then
		setActive(arg_7_0.rightPanel, false)
		setActive(arg_7_0.rightPanel, true)
	end

	arg_7_0.selectedIndex = arg_7_1
end

function var_0_0.OnUpdateFlush(arg_8_0)
	local var_8_0 = 0

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.taskList) do
		if arg_8_0.taskProxy:getFinishTaskById(iter_8_1) ~= nil then
			var_8_0 = var_8_0 + 1
		end
	end

	if arg_8_0.usedCnt ~= var_8_0 then
		arg_8_0.usedCnt = var_8_0

		local var_8_1 = arg_8_0.activity

		var_8_1.data1 = arg_8_0.usedCnt

		getProxy(ActivityProxy):updateActivity(var_8_1)
	end

	arg_8_0.unlockCnt = pg.TimeMgr.GetInstance():DiffDay(arg_8_0.activity:getStartTime(), pg.TimeMgr.GetInstance():GetServerTime()) + 1
	arg_8_0.unlockCnt = arg_8_0.unlockCnt * tonumber(arg_8_0.activity:getConfig("config_id"))
	arg_8_0.unlockCnt = arg_8_0.unlockCnt > arg_8_0.totalCnt and arg_8_0.totalCnt or arg_8_0.unlockCnt
	arg_8_0.remainCnt = arg_8_0.usedCnt >= arg_8_0.totalCnt and 0 or arg_8_0.unlockCnt - arg_8_0.usedCnt

	setText(arg_8_0.countTF, tostring(arg_8_0.remainCnt))

	local var_8_2 = arg_8_0.activity:getConfig("config_client").story

	for iter_8_2, iter_8_3 in ipairs(arg_8_0.taskList) do
		if arg_8_0.taskProxy:getFinishTaskById(iter_8_3) and checkExist(var_8_2, {
			iter_8_2
		}, {
			1
		}) then
			pg.NewStoryMgr.GetInstance():Play(var_8_2[iter_8_2][1])
		end
	end

	arg_8_0:updateUI()
end

function var_0_0.updateUI(arg_9_0)
	for iter_9_0 = 1, #arg_9_0.itemTfs do
		local var_9_0 = arg_9_0.taskList[iter_9_0]
		local var_9_1 = arg_9_0.taskProxy:getTaskById(var_9_0) or arg_9_0.taskProxy:getFinishTaskById(var_9_0)
		local var_9_2 = arg_9_0.itemTfs[iter_9_0]:Find("item")
		local var_9_3 = var_9_1:getTaskStatus()
		local var_9_4 = arg_9_0.itemTfs[iter_9_0]:Find("got")
		local var_9_5 = arg_9_0.itemTfs[iter_9_0]:Find("get")
		local var_9_6 = var_9_3 == 1 and arg_9_0.remainCnt > 0
		local var_9_7 = var_9_3 == 2

		setActive(var_9_5, var_9_6)
		setActive(var_9_4, var_9_7)

		local var_9_8 = arg_9_0.paintingTfs[iter_9_0]

		setActive(findTF(var_9_8, "got"), var_9_7)
		setActive(findTF(var_9_8, "mask"), not var_9_7 or arg_9_0.selectedIndex == iter_9_0)
	end
end

function var_0_0.OnShowFlush(arg_10_0)
	return
end

function var_0_0.OnDestroy(arg_11_0)
	return
end

return var_0_0
