local var_0_0 = class("NewYearShrinePage", import("...base.BaseActivityPage"))

var_0_0.MAX_COUNT = 7
var_0_0.GO_MINI_GAME_ID = 34
var_0_0.GO_BACKHILL_SCENE = SCENE.NEWYEAR_BACKHILL_2022

function var_0_0.OnInit(arg_1_0)
	arg_1_0.progressTpl = arg_1_0._tf:Find("ProgressTpl")
	arg_1_0.progressTplContainer = arg_1_0._tf:Find("ProgressList")
	arg_1_0.progressUIItemList = UIItemList.New(arg_1_0.progressTplContainer, arg_1_0.progressTpl)
	arg_1_0.countText = arg_1_0._tf:Find("CountText")

	local var_1_0 = arg_1_0._tf:Find("Award")

	arg_1_0.lockTF = var_1_0:Find("Unlock")
	arg_1_0.getBtn = var_1_0:Find("Achieve")
	arg_1_0.gotTag = var_1_0:Find("Got")
	arg_1_0.goBtn = arg_1_0._tf:Find("GoBtn")
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.isAchieved = arg_2_0.activity.data1
	arg_2_0.playCount = arg_2_0.activity.data2
	arg_2_0.startTimestamp = arg_2_0.activity.data3
	arg_2_0.dayFromStart = pg.TimeMgr.GetInstance():DiffDay(arg_2_0.startTimestamp, pg.TimeMgr.GetInstance():GetServerTime()) + 1
	arg_2_0.curDay = math.clamp(arg_2_0.dayFromStart, 1, var_0_0.MAX_COUNT)
	arg_2_0.storyIDTable = {}

	local var_2_0 = arg_2_0.activity:getConfig("config_client").story

	if var_2_0 then
		for iter_2_0, iter_2_1 in ipairs(var_2_0) do
			local var_2_1 = iter_2_1[1]

			if var_2_1 then
				arg_2_0.storyIDTable[iter_2_0] = var_2_1
			end
		end
	end
end

function var_0_0.OnFirstFlush(arg_3_0)
	local var_3_0 = math.clamp(arg_3_0.playCount, 0, var_0_0.MAX_COUNT)

	setText(arg_3_0.countText, var_3_0)
	arg_3_0.progressUIItemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_4_1 = arg_4_1 + 1

			local var_4_0 = arg_4_2:Find("Achieve")
			local var_4_1 = arg_4_2:Find("Unlock")
			local var_4_2 = arg_4_2:Find("Lock")

			setActive(var_4_2, not (arg_4_1 <= arg_3_0.curDay))

			if arg_4_1 <= arg_3_0.curDay then
				setActive(var_4_0, arg_4_1 <= var_3_0)
				setActive(var_4_1, arg_4_1 > var_3_0)
			else
				setActive(var_4_0, false)
				setActive(var_4_1, true)
			end
		end
	end)
	arg_3_0.progressUIItemList:align(var_0_0.MAX_COUNT)
	onButton(arg_3_0, arg_3_0.getBtn, function()
		if arg_3_0.curDay >= var_0_0.MAX_COUNT and arg_3_0.playCount >= var_0_0.MAX_COUNT and not (arg_3_0.isAchieved > 0) then
			arg_3_0:emit(ActivityMediator.EVENT_OPERATION, {
				cmd = 1,
				activity_id = arg_3_0.activity.id
			})
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.goBtn, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, var_0_0.GO_MINI_GAME_ID, {
			callback = function()
				local var_7_0 = Context.New()

				SCENE.SetSceneInfo(var_7_0, var_0_0.GO_BACKHILL_SCENE)
				getProxy(ContextProxy):PushContext2Prev(var_7_0)
			end
		})
	end, SFX_PANEL)

	local var_3_1 = {}
	local var_3_2 = pg.NewStoryMgr.GetInstance()
	local var_3_3 = math.clamp(arg_3_0.playCount, 0, var_0_0.MAX_COUNT)

	for iter_3_0 = 1, var_0_0.MAX_COUNT do
		local var_3_4 = arg_3_0.storyIDTable[iter_3_0]

		if var_3_4 and iter_3_0 <= arg_3_0.curDay and iter_3_0 <= var_3_3 then
			table.insert(var_3_1, function(arg_8_0)
				var_3_2:Play(var_3_4, arg_8_0)
			end)
		end
	end

	seriesAsync(var_3_1, function()
		print("play story done,count:", #var_3_1)
	end)
end

function var_0_0.OnUpdateFlush(arg_10_0)
	setActive(arg_10_0.gotTag, arg_10_0.isAchieved > 0)

	if arg_10_0.curDay >= var_0_0.MAX_COUNT and arg_10_0.playCount >= var_0_0.MAX_COUNT and not (arg_10_0.isAchieved > 0) then
		setActive(arg_10_0.lockTF, false)
		setActive(arg_10_0.getBtn, true)
		triggerButton(arg_10_0.getBtn)
	elseif arg_10_0.isAchieved > 0 then
		setActive(arg_10_0.lockTF, false)
		setActive(arg_10_0.getBtn, true)
	else
		setActive(arg_10_0.lockTF, true)
		setActive(arg_10_0.getBtn, false)
	end
end

function var_0_0.OnDestroy(arg_11_0)
	return
end

function var_0_0.IsTip()
	local var_12_0 = getProxy(ActivityProxy):getActivityById(pg.activity_const.NEWYEAR_SHRINE_PAGE_ID.act_id)

	if var_12_0 and not var_12_0:isEnd() then
		local var_12_1 = pg.TimeMgr.GetInstance():DiffDay(var_12_0.data3, pg.TimeMgr.GetInstance():GetServerTime()) + 1

		return math.clamp(var_12_1, 1, var_0_0.MAX_COUNT) > math.clamp(var_12_0.data2, 0, var_0_0.MAX_COUNT)
	end
end

return var_0_0
