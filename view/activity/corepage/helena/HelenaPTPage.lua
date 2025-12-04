local var_0_0 = class("HelenaPTPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.task_bg = arg_1_0.bg:Find("task_bg")
	arg_1_0.slider = arg_1_0.task_bg:Find("slider")
	arg_1_0.step = arg_1_0.task_bg:Find("step")
	arg_1_0.progres = arg_1_0.task_bg:Find("progres")
	arg_1_0.displayBtn = arg_1_0.task_bg:Find("display_btn")
	arg_1_0.awardTF = arg_1_0.task_bg:Find("award")
	arg_1_0.battleBtn = arg_1_0.task_bg:Find("battle_btn")
	arg_1_0.getBtn = arg_1_0.task_bg:Find("get_btn")
	arg_1_0.gotBtn = arg_1_0.task_bg:Find("got_btn")
	arg_1_0.scenario = HelenaScenarioPage.New(arg_1_0._tf, arg_1_0.event)

	arg_1_0.scenario:SetCoreStoryPage(arg_1_0)
	arg_1_0.scenario:RegisterView(arg_1_0.coreActivityUI)

	arg_1_0.loader = AutoLoader.New()
	arg_1_0.mapGroup = {}
	arg_1_0.currentBG = nil

	setText(arg_1_0.task_bg:Find("Text"), i18n("Outpost_20250904_Progress"))
	setText(arg_1_0.task_bg:Find("display_btn/Text"), i18n("other_world_temple_award"))
end

function var_0_0.OnDataSetting(arg_2_0)
	if arg_2_0.ptData then
		arg_2_0.ptData:Update(arg_2_0.activity)
	else
		arg_2_0.ptData = ActivityPtData.New(arg_2_0.activity)
	end
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.displayBtn, function()
		arg_3_0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
			blur = true,
			type = arg_3_0.ptData.type,
			dropList = arg_3_0.ptData.dropList,
			targets = arg_3_0.ptData.targets,
			level = arg_3_0.ptData.level,
			count = arg_3_0.ptData.count,
			resId = arg_3_0.ptData.resId,
			unlockStamps = arg_3_0.ptData:GetDayUnlockStamps()
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.battleBtn, function()
		arg_3_0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.getBtn, function()
		arg_3_0:GetAllAward()
	end, SFX_PANEL)
	arg_3_0:OnAddUI()
	arg_3_0:OnUpdateFlush()
end

function var_0_0.OnAddUI(arg_7_0)
	arg_7_0.skinBtn = arg_7_0.bg:Find("skinbtn")

	onButton(arg_7_0, arg_7_0.skinBtn, function()
		arg_7_0.scenario:Load()
		arg_7_0.scenario:SetActivity(arg_7_0.activity)
		arg_7_0.scenario:UpdateStoryTask()
		arg_7_0.scenario:ActionInvoke("UpdateView")
		arg_7_0:ShowScenarioLayer(true)
	end, SFX_PANEL)
	setActive(arg_7_0.skinBtn:Find("red"), arg_7_0.scenario:IsShowRed(arg_7_0.activity))
end

function var_0_0.SwitchBG(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if not arg_9_1 or #arg_9_1 <= 0 then
		existCall(arg_9_2)

		return
	elseif arg_9_3 then
		-- block empty
	elseif table.equal(arg_9_0.currentBG, arg_9_1) then
		return
	end

	arg_9_0.currentBG = arg_9_1

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.mapGroup) do
		arg_9_0.loader:ClearRequest(iter_9_1)
	end

	table.clear(arg_9_0.mapGroup)

	local var_9_0 = arg_9_0.loader:GetSpriteDirect("bg/" .. arg_9_1[1].BG, "", function(arg_10_0)
		setImageSprite(arg_9_0.bg, arg_10_0)
		SetActive(arg_9_0.bg, true)
	end)

	table.insert(arg_9_0.mapGroup, var_9_0)
end

function var_0_0.ShowScenarioLayer(arg_11_0, arg_11_1)
	if arg_11_1 then
		arg_11_0.coreActivityUI:ActiveScenarioLayer(true)
		arg_11_0.scenario:ActionInvoke("Show")
	else
		arg_11_0.scenario:Hide()
		setActive(arg_11_0.skinBtn:Find("red"), arg_11_0.scenario:IsShowRed(arg_11_0.activity))
		arg_11_0.coreActivityUI:ActiveScenarioLayer(false)
	end
end

function var_0_0.IsShowingPopWindow(arg_12_0)
	return arg_12_0.scenario:isShowing()
end

function var_0_0.ClosePopWindow(arg_13_0)
	arg_13_0.scenario:Hide()
	arg_13_0:ShowScenarioLayer(false)
end

function var_0_0.GetAllAward(arg_14_0)
	local var_14_0 = {}
	local var_14_1 = arg_14_0.ptData:GetAward()
	local var_14_2 = getProxy(PlayerProxy):getRawData()
	local var_14_3 = pg.gameset.urpt_chapter_max.description[1]
	local var_14_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_14_3)
	local var_14_5, var_14_6 = Task.StaticJudgeOverflow(var_14_2.gold, var_14_2.oil, var_14_4, true, true, {
		{
			var_14_1.type,
			var_14_1.id,
			var_14_1.count
		}
	})

	if var_14_5 then
		table.insert(var_14_0, function(arg_15_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				content = i18n("award_max_warning"),
				items = var_14_6,
				onYes = arg_15_0
			})
		end)
	end

	seriesAsync(var_14_0, function()
		local var_16_0, var_16_1 = arg_14_0.ptData:GetResProgress()

		arg_14_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1,
			activity_id = arg_14_0.ptData:GetId(),
			arg1 = var_16_1
		})
	end)
end

function var_0_0.OnUpdateFlush(arg_17_0)
	local var_17_0, var_17_1, var_17_2 = arg_17_0.ptData:GetLevelProgress()

	if arg_17_0.step then
		setText(arg_17_0.step, var_17_0 .. "/" .. var_17_1)
	end

	local var_17_3 = arg_17_0.activity:getConfig("config_client").story

	if checkExist(var_17_3, {
		var_17_0
	}, {
		1
	}) then
		pg.NewStoryMgr.GetInstance():Play(var_17_3[var_17_0][1])
	end

	local var_17_4, var_17_5, var_17_6 = arg_17_0.ptData:GetResProgress()

	if var_17_5 < var_17_4 then
		var_17_4 = var_17_5
	end

	setText(arg_17_0.progres, setColorStr(var_17_4, "#3f93d4") .. setColorStr("/" .. var_17_5, "#747c88"))
	setSlider(arg_17_0.slider, 0, 1, var_17_6)

	local var_17_7 = arg_17_0.ptData:CanGetAward()
	local var_17_8 = arg_17_0.ptData:CanGetNextAward()
	local var_17_9 = arg_17_0.ptData:CanGetMorePt()

	setActive(arg_17_0.battleBtn, var_17_9 and not var_17_7 and var_17_8)
	setActive(arg_17_0.getBtn, var_17_7)
	setActive(arg_17_0.gotBtn, not var_17_8)

	local var_17_10 = arg_17_0.ptData:GetAward()

	updateDrop(arg_17_0.awardTF, var_17_10)
	onButton(arg_17_0, arg_17_0.awardTF, function()
		arg_17_0:emit(BaseUI.ON_DROP, var_17_10)
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_19_0)
	if arg_19_0.scenario:isShowing() then
		arg_19_0.scenario:Hide()
	end

	arg_19_0.scenario:Destroy()
end

function var_0_0.GetWorldPtData(arg_20_0, arg_20_1)
	if arg_20_1 <= pg.TimeMgr.GetInstance():GetServerTime() - (ActivityMainScene.Data2Time or 0) then
		ActivityMainScene.Data2Time = pg.TimeMgr.GetInstance():GetServerTime()

		arg_20_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 2,
			activity_id = arg_20_0.ptData:GetId()
		})
	end
end

return var_0_0
