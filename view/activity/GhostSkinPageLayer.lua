local var_0_0 = class("GhostSkinPageLayer", import("view.base.BaseUI"))
local var_0_1

function var_0_0.getUIName(arg_1_0)
	return "GhostSkinPageUI"
end

function var_0_0.init(arg_2_0)
	var_0_1 = ActivityConst.GOASTSTORYACTIVITY_ID
	arg_2_0.activity = getProxy(ActivityProxy):getActivityById(var_0_1)
	arg_2_0.story = arg_2_0.activity:getConfig("config_client").story
	arg_2_0.storyStateDic = {}
	arg_2_0.item = arg_2_0:findTF("task/item", arg_2_0.bg)
	arg_2_0.items = arg_2_0:findTF("task/items", arg_2_0.bg)
	arg_2_0.uilist = UIItemList.New(arg_2_0.items, arg_2_0.item)

	setActive(arg_2_0.item, false)
	onButton(arg_2_0, arg_2_0._tf:Find("des/itemDes"), function()
		local var_3_0 = getProxy(ActivityProxy):getActivityById(var_0_1).data1
		local var_3_1 = {
			type = DROP_TYPE_VITEM,
			id = arg_2_0.activity:getConfig("config_id"),
			count = var_3_0
		}

		arg_2_0:emit(BaseUI.ON_DROP, var_3_1)
	end)
	arg_2_0.uilist:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateTask(arg_4_1, arg_4_2)
		end
	end)

	arg_2_0.taskProxy = getProxy(TaskProxy)

	arg_2_0:OnUpdateFlush()
	arg_2_0:UpdateItemView(arg_2_0.activity)
	arg_2_0:ShowMask(false)

	arg_2_0.isPlaying = false

	arg_2_0:InitStoryState()
	arg_2_0:UpdateStoryView()
	arg_2_0:DisplayBigTask()
	setText(arg_2_0:findTF("task/taskAll/taskallReward/hasRewardText"), i18n("activity_1024_memory_get"))
end

function var_0_0.OnUpdateFlush(arg_5_0)
	arg_5_0:UpdataTaskData()
	arg_5_0.uilist:align(#arg_5_0.taskGroup)
end

function var_0_0.UpdataTaskData(arg_6_0)
	arg_6_0.taskGroup = {}

	local var_6_0 = arg_6_0.activity:getConfig("config_client")
	local var_6_1 = #var_6_0.group_1

	arg_6_0.allCompleteCount = 0

	for iter_6_0, iter_6_1 in ipairs(var_6_0.group_1) do
		local var_6_2 = (arg_6_0.taskProxy:getTaskById(iter_6_1) or arg_6_0.taskProxy:getFinishTaskById(iter_6_1)):getTaskStatus()

		if var_6_2 == 0 or var_6_2 == 1 or iter_6_0 == var_6_1 then
			table.insert(arg_6_0.taskGroup, iter_6_1)

			local var_6_3

			if iter_6_0 == var_6_1 and var_6_2 == 2 then
				var_6_3 = iter_6_0
			else
				var_6_3 = iter_6_0 - 1
			end

			arg_6_0.allCompleteCount = arg_6_0.allCompleteCount + var_6_3

			break
		end
	end

	local var_6_4 = #var_6_0.group_2

	for iter_6_2, iter_6_3 in ipairs(var_6_0.group_2) do
		local var_6_5 = (arg_6_0.taskProxy:getTaskById(iter_6_3) or arg_6_0.taskProxy:getFinishTaskById(iter_6_3)):getTaskStatus()

		if var_6_5 == 0 or var_6_5 == 1 or iter_6_2 == var_6_4 then
			table.insert(arg_6_0.taskGroup, iter_6_3)

			local var_6_6

			if iter_6_2 == var_6_4 and var_6_5 == 2 then
				var_6_6 = iter_6_2
			else
				var_6_6 = iter_6_2 - 1
			end

			arg_6_0.allCompleteCount = arg_6_0.allCompleteCount + var_6_6

			break
		end
	end
end

function var_0_0.UpdateTask(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1 + 1
	local var_7_1 = arg_7_0:findTF("item", arg_7_2)
	local var_7_2 = arg_7_0.taskGroup[var_7_0]
	local var_7_3 = arg_7_0.taskProxy:getTaskById(var_7_2) or arg_7_0.taskProxy:getFinishTaskById(var_7_2)

	assert(var_7_3, "without this task by id: " .. var_7_2)

	local var_7_4 = Drop.Create(var_7_3:getConfig("award_display")[1])

	updateDrop(var_7_1, var_7_4)
	onButton(arg_7_0, var_7_1, function()
		arg_7_0:emit(BaseUI.ON_DROP, var_7_4)
	end, SFX_PANEL)

	local var_7_5 = var_7_3:getProgress()
	local var_7_6 = var_7_3:getConfig("target_num")

	if arg_7_0.allCompleteCount == 8 then
		var_7_5 = var_7_6
	end

	local var_7_7, var_7_8 = arg_7_0:GetProgressColor()
	local var_7_9

	var_7_9 = var_7_7 and setColorStr(var_7_5, var_7_7) or var_7_5

	local var_7_10

	var_7_10 = var_7_8 and setColorStr("/" .. var_7_6, var_7_8) or "/" .. var_7_6

	setActive(arg_7_0:findTF("progressText", arg_7_2), false)

	local var_7_11 = var_7_3:getConfig("desc") .. " (" .. var_7_9 .. var_7_10 .. ")"

	setText(arg_7_0:findTF("description", arg_7_2), var_7_11)
	setSlider(arg_7_0:findTF("progress", arg_7_2), 0, var_7_6, var_7_5)

	local var_7_12 = arg_7_0:findTF("go_btn", arg_7_2)
	local var_7_13 = arg_7_0:findTF("get_btn", arg_7_2)
	local var_7_14 = arg_7_0:findTF("got_btn", arg_7_2)
	local var_7_15 = var_7_3:getTaskStatus()

	if arg_7_0.allCompleteCount == 8 then
		var_7_15 = 2
	end

	setActive(var_7_12, var_7_15 == 0)
	setActive(var_7_13, var_7_15 == 1)
	setActive(var_7_14, var_7_15 == 2)
	onButton(arg_7_0, var_7_12, function()
		arg_7_0:emit(ActivityMediator.ON_TASK_GO, var_7_3)
	end, SFX_PANEL)
	onButton(arg_7_0, var_7_13, function()
		local var_10_0 = {}
		local var_10_1 = var_7_3:getConfig("award_display")
		local var_10_2 = getProxy(PlayerProxy):getRawData()
		local var_10_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_10_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_10_3)
		local var_10_5, var_10_6 = Task.StaticJudgeOverflow(var_10_2.gold, var_10_2.oil, var_10_4, true, true, var_10_1)

		if var_10_5 then
			table.insert(var_10_0, function(arg_11_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_10_6,
					onYes = arg_11_0
				})
			end)
		end

		seriesAsync(var_10_0, function()
			arg_7_0:emit(GhostSkinMediator.ON_TASK_SUBMIT, var_7_3)
		end)
	end, SFX_PANEL)

	local var_7_16 = arg_7_0.allCompleteCount < 8 and var_7_15 == 1
	local var_7_17 = arg_7_0:findTF("reddot", arg_7_2)

	setActive(var_7_17, var_7_16)
end

function var_0_0.DisplayBigTask(arg_13_0)
	local var_13_0 = arg_13_0.activity:getConfig("config_client").group_3[1]
	local var_13_1 = arg_13_0.taskProxy:getTaskById(var_13_0) or arg_13_0.taskProxy:getFinishTaskById(var_13_0)

	assert(var_13_1, "without this task by id: " .. var_13_0)

	local var_13_2 = arg_13_0:findTF("task/allTaskItem")
	local var_13_3 = Drop.Create(var_13_1:getConfig("award_display")[1])

	updateDrop(var_13_2, var_13_3)
	onButton(arg_13_0, var_13_2, function()
		arg_13_0:emit(BaseUI.ON_DROP, var_13_3)
	end, SFX_PANEL)

	local var_13_4 = var_13_1:getTaskStatus()

	setActive(arg_13_0:findTF("task/taskAll/taskallReward"), var_13_4 == 2)
end

function var_0_0.GetProgressColor(arg_15_0)
	return nil
end

function var_0_0.InitStoryState(arg_16_0)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0.story) do
		if checkExist(arg_16_0.story, {
			iter_16_0
		}, {
			1
		}) then
			local var_16_0 = false
			local var_16_1 = iter_16_1[1]

			if pg.NewStoryMgr.GetInstance():IsPlayed(var_16_1) then
				var_16_0 = true
			end

			local var_16_2 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_16_1)

			arg_16_0.storyStateDic[var_16_2] = var_16_0
		end
	end
end

function var_0_0.UpdateStoryView(arg_17_0)
	local var_17_0 = {
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8"
	}

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		local var_17_1 = arg_17_0.story[iter_17_0][1]
		local var_17_2 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_17_1)
		local var_17_3 = arg_17_0.storyStateDic[var_17_2]
		local var_17_4 = arg_17_0._tf:Find("frame/" .. iter_17_1 .. "/locked")
		local var_17_5 = arg_17_0._tf:Find("frame/" .. iter_17_1)

		setActive(var_17_4, not var_17_3)

		if var_17_3 then
			onButton(arg_17_0, var_17_5, function()
				pg.NewStoryMgr.GetInstance():Play(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_17_2), nil, true)
			end)
		else
			onButton(arg_17_0, var_17_4, function()
				if getProxy(ActivityProxy):getActivityById(var_0_1).data1 <= 0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("activity_1024_memory"))

					return
				end

				pg.m02:sendNotification(GAME.ACTIVITY_UNLOCKSTORYT, {
					cmd = 1,
					activity_id = arg_17_0.activity.id,
					arg1 = var_17_2
				})
			end)
		end
	end
end

function var_0_0.UpdateItemView(arg_20_0, arg_20_1)
	setText(arg_20_0._tf:Find("des/count"), tostring(arg_20_1.data1))
end

function var_0_0.UpdataStoryState(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1.storyId

	arg_21_0.storyStateDic[var_21_0] = true

	local var_21_1 = 0

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.story) do
		local var_21_2 = iter_21_1[1]

		if pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_21_2) == var_21_0 then
			var_21_1 = iter_21_0
		end
	end

	local var_21_3 = {
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8"
	}

	for iter_21_2, iter_21_3 in ipairs(var_21_3) do
		if iter_21_2 == var_21_1 then
			local var_21_4 = arg_21_0.storyStateDic[var_21_0]
			local var_21_5 = arg_21_0._tf:Find("frame/" .. iter_21_3 .. "/locked")
			local var_21_6 = arg_21_0._tf:Find("frame/" .. iter_21_3)
			local var_21_7 = var_21_5:GetComponent(typeof(Animation))
			local var_21_8 = var_21_7:GetClip("anim_GhostSkin_unlock_1").length

			var_21_7:Play("anim_GhostSkin_unlock_1")
			arg_21_0:ShowMask(true)

			arg_21_0.isPlaying = true

			onDelayTick(function()
				arg_21_0.isPlaying = false

				setActive(var_21_5, not var_21_4)
				arg_21_0:ShowMask(false)
				pg.NewStoryMgr.GetInstance():Play(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_21_0), function()
					arg_21_0:ShouldRewardAll(false)
				end)
			end, var_21_8)
			onButton(arg_21_0, var_21_6, function()
				pg.NewStoryMgr.GetInstance():Play(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_21_0), nil, true)
			end)
		end
	end
end

function var_0_0.ShouldRewardAll(arg_25_0, arg_25_1)
	local function var_25_0()
		for iter_26_0, iter_26_1 in pairs(arg_25_0.storyStateDic) do
			if iter_26_1 == false then
				return false
			end
		end

		return true
	end

	local function var_25_1()
		if not arg_25_1 then
			return true
		end

		local var_27_0 = arg_25_0.activity:getConfig("config_client").group_3[1]
		local var_27_1 = arg_25_0.taskProxy:getTaskById(var_27_0) or arg_25_0.taskProxy:getFinishTaskById(var_27_0)

		assert(var_27_1, "without this task by id: " .. var_27_0)

		if var_27_1:getTaskStatus() == 1 then
			return true
		end

		return false
	end

	if var_25_0() and var_25_1() then
		local var_25_2 = {}
		local var_25_3 = arg_25_0.activity:getConfig("config_client").group_3[1]
		local var_25_4 = arg_25_0.taskProxy:getTaskById(var_25_3) or arg_25_0.taskProxy:getFinishTaskById(var_25_3)
		local var_25_5 = var_25_4:getConfig("award_display")
		local var_25_6 = getProxy(PlayerProxy):getRawData()
		local var_25_7 = pg.gameset.urpt_chapter_max.description[1]
		local var_25_8 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_25_7)
		local var_25_9, var_25_10 = Task.StaticJudgeOverflow(var_25_6.gold, var_25_6.oil, var_25_8, true, true, var_25_5)

		if var_25_9 then
			table.insert(var_25_2, function(arg_28_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_25_10,
					onYes = arg_28_0
				})
			end)
		end

		seriesAsync(var_25_2, function()
			arg_25_0:emit(GhostSkinMediator.ON_TASK_SUBMIT, var_25_4)
		end)
	end
end

function var_0_0.didEnter(arg_30_0)
	onButton(arg_30_0, arg_30_0._tf:Find("title/back"), function()
		arg_30_0:onBackPressed()
	end, SFX_PANEL)
	arg_30_0:ShouldRewardAll(true)
end

function var_0_0.ShowMask(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0._tf:Find("mask")

	GetOrAddComponent(var_32_0, typeof(CanvasGroup)).blocksRaycasts = arg_32_1
end

function var_0_0.onBackPressed(arg_33_0)
	if arg_33_0.isPlaying then
		return
	end

	arg_33_0.super.onBackPressed(arg_33_0)
end

function var_0_0.IsShowRed()
	local var_34_0 = getProxy(TaskProxy)
	local var_34_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.GOASTSTORYACTIVITY_ID):getConfig("config_client")
	local var_34_2 = 0
	local var_34_3 = false

	for iter_34_0, iter_34_1 in ipairs(var_34_1.group_1) do
		local var_34_4 = var_34_0:getTaskById(iter_34_1) or var_34_0:getFinishTaskById(iter_34_1)

		if var_34_4 then
			local var_34_5 = var_34_4:getTaskStatus()

			if var_34_5 == 2 then
				var_34_2 = var_34_2 + 1
			elseif var_34_5 == 1 then
				var_34_3 = true
			end
		end
	end

	for iter_34_2, iter_34_3 in ipairs(var_34_1.group_2) do
		local var_34_6 = var_34_0:getTaskById(iter_34_3) or var_34_0:getFinishTaskById(iter_34_3)

		if var_34_6 then
			local var_34_7 = var_34_6:getTaskStatus()

			if var_34_7 == 2 then
				var_34_2 = var_34_2 + 1
			elseif var_34_7 == 1 then
				var_34_3 = true
			end
		end
	end

	return var_34_2 < 8 and var_34_3
end

return var_0_0
