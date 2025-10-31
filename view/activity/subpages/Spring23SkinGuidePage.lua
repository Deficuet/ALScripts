local var_0_0 = class("Spring23SkinGuidePage", import("...base.BaseActivityPage"))
local var_0_1 = "ui/activityuipage/spring23skinguidepage_atlas"

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.countTF = arg_1_0.bg:Find("count")
	arg_1_0.item = arg_1_0.bg:Find("item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.itemList = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.countImg = arg_1_0.bg:Find("countImg")
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskList = arg_2_0.activity:getConfig("config_data")
	arg_2_0.totalCnt = #arg_2_0.taskList
end

function var_0_0.OnFirstFlush(arg_3_0)
	arg_3_0.usedCnt = arg_3_0.activity:getData1()
	arg_3_0.unlockCnt = pg.TimeMgr.GetInstance():DiffDay(arg_3_0.activity:getStartTime(), pg.TimeMgr.GetInstance():GetServerTime()) + 1
	arg_3_0.unlockCnt = arg_3_0.unlockCnt > arg_3_0.totalCnt and arg_3_0.totalCnt or arg_3_0.unlockCnt
	arg_3_0.remainCnt = arg_3_0.usedCnt >= arg_3_0.totalCnt and 0 or arg_3_0.unlockCnt - arg_3_0.usedCnt

	setActive(arg_3_0.item, false)
	arg_3_0.itemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_1 = arg_4_1 + 1

		local var_4_0 = arg_3_0.taskList[arg_4_1]
		local var_4_1 = arg_3_0.taskProxy:getTaskById(var_4_0) or arg_3_0.taskProxy:getFinishTaskById(var_4_0)

		assert(var_4_1, "without this task by id: " .. var_4_0)

		if arg_4_0 == UIItemList.EventInit then
			local var_4_2 = arg_4_2:Find("item")
			local var_4_3 = var_4_1:getConfig("award_display")[1]
			local var_4_4 = {
				type = var_4_3[1],
				id = var_4_3[2],
				count = var_4_3[3]
			}

			updateDrop(var_4_2, var_4_4)
			onButton(arg_3_0, arg_4_2, function()
				arg_3_0:emit(BaseUI.ON_DROP, var_4_4)
			end, SFX_PANEL)
		elseif arg_4_0 == UIItemList.EventUpdate then
			local var_4_5 = var_4_1:getTaskStatus()
			local var_4_6 = arg_4_2:Find("got")
			local var_4_7 = arg_4_2:Find("get")

			setActive(var_4_7, var_4_5 == 1 and arg_3_0.remainCnt > 0)
			setActive(var_4_6, var_4_5 == 2)
			onButton(arg_3_0, var_4_7, function()
				arg_3_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_4_1)
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.OnUpdateFlush(arg_7_0)
	local var_7_0 = 0

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.taskList) do
		if arg_7_0.taskProxy:getFinishTaskById(iter_7_1) ~= nil then
			var_7_0 = var_7_0 + 1
		end
	end

	if arg_7_0.usedCnt ~= var_7_0 then
		arg_7_0.usedCnt = var_7_0

		local var_7_1 = arg_7_0.activity

		var_7_1.data1 = arg_7_0.usedCnt

		getProxy(ActivityProxy):updateActivity(var_7_1)
	end

	arg_7_0.unlockCnt = pg.TimeMgr.GetInstance():DiffDay(arg_7_0.activity:getStartTime(), pg.TimeMgr.GetInstance():GetServerTime()) + 1
	arg_7_0.unlockCnt = arg_7_0.unlockCnt > arg_7_0.totalCnt and arg_7_0.totalCnt or arg_7_0.unlockCnt
	arg_7_0.remainCnt = arg_7_0.usedCnt >= arg_7_0.totalCnt and 0 or arg_7_0.unlockCnt - arg_7_0.usedCnt

	setText(arg_7_0.countTF, string.format("%02d", arg_7_0.remainCnt))
	setImageSprite(arg_7_0.countImg, GetSpriteFromAtlas(var_0_1, tostring(arg_7_0.remainCnt)), true)

	local var_7_2 = arg_7_0.activity:getConfig("config_client").story

	for iter_7_2, iter_7_3 in ipairs(arg_7_0.taskList) do
		if arg_7_0.taskProxy:getFinishTaskById(iter_7_3) and checkExist(var_7_2, {
			iter_7_2
		}, {
			1
		}) then
			pg.NewStoryMgr.GetInstance():Play(var_7_2[iter_7_2][1])
		end
	end

	arg_7_0.itemList:align(#arg_7_0.taskList)
end

function var_0_0.OnShowFlush(arg_8_0)
	arg_8_0.itemList:each(function(arg_9_0, arg_9_1)
		setActive(arg_9_1, true)
	end)
end

function var_0_0.OnDestroy(arg_10_0)
	return
end

return var_0_0
