local var_0_0 = class("MapBuilderSPSeriesRecrew", import(".MapBuilderSPSeriesFull"))

function var_0_0.GetType(arg_1_0)
	return MapBuilder.TYPESPSERIESRECREW
end

function var_0_0.getUIName(arg_2_0)
	return "LevelSelectSPSeriesRecrewUI"
end

function var_0_0.UpdateStory(arg_3_0)
	local var_3_0 = {}
	local var_3_1 = pg.NewStoryMgr.GetInstance()
	local var_3_2 = 0
	local var_3_3 = 0

	for iter_3_0, iter_3_1 in pairs(arg_3_0.storyNodesDict) do
		local var_3_4 = arg_3_0.storyHolder:Find(tostring(iter_3_1.id))
		local var_3_5 = iter_3_1:IsActive(arg_3_0.activity, arg_3_0.sceneParent.ptActivity)

		setActive(var_3_4, var_3_5)
		setText(var_3_4:Find("main/char/bg/Text"), iter_3_1:GetName())
		setText(var_3_4:Find("main/talk/bg/Text"), iter_3_1:GetName())

		local var_3_6 = iter_3_1:IsReaded()

		setActive(var_3_4:Find("main/char"), not var_3_6)
		setActive(var_3_4:Find("main/talk"), var_3_6)

		local var_3_7 = iter_3_1:IsRecrew()

		if var_3_7 == nil then
			setActive(var_3_4:Find("main/recrew"), false)
		else
			setActive(var_3_4:Find("main/recrew"), true)
			setActive(var_3_4:Find("main/recrew/recrewed"), var_3_7)
			setActive(var_3_4:Find("main/recrew/not_recrew"), not var_3_7)
			setText(var_3_4:Find("main/recrew/recrewed/label"), i18n("story_recrewed"))
			setText(var_3_4:Find("main/recrew/not_recrew/label"), i18n("story_not_recrew"))
		end

		onButton(arg_3_0, var_3_4, function()
			local var_4_0 = iter_3_1:GetParams(BossRushStoryNode.REPEATABLE_KEY)
			local var_4_1 = var_4_0 and var_4_0[2]

			if var_3_6 and not var_4_1 then
				return
			end

			local var_4_2 = iter_3_1:GetStory()

			arg_3_0:PlayStory(var_4_2, function()
				local var_5_0 = arg_3_0.activity:getConfig("config_client").storys

				if var_5_0[#var_5_0] == iter_3_1.id and not var_3_6 then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = i18n("multiple_endings_tip")
					})
				end

				arg_3_0:UpdateView()
			end, var_4_1)
		end)

		var_3_2 = var_3_2 + (var_3_6 and 1 or 0)
		var_3_3 = var_3_3 + 1
	end

	setText(arg_3_0.progressText, var_3_2 .. "/" .. var_3_3)
	setActive(arg_3_0.storyAward, tobool(arg_3_0.storyTask))

	if arg_3_0.storyTask then
		local var_3_8 = arg_3_0.storyTask:getConfig("award_display")
		local var_3_9 = Drop.Create(var_3_8[1])

		updateDrop(arg_3_0.storyAward:GetChild(0), var_3_9)

		local var_3_10 = arg_3_0.storyTask:getTaskStatus()

		setActive(arg_3_0.storyAward:Find("get"), var_3_10 == 1)
		setActive(arg_3_0.storyAward:Find("got"), var_3_10 == 2)
		onButton(arg_3_0, arg_3_0.storyAward, function()
			arg_3_0:emit(BaseUI.ON_DROP, var_3_9)
		end)
	end
end

function var_0_0.SwitchStoryMapAndBGM(arg_7_0)
	local var_7_0 = arg_7_0.data:getConfig("default_background")
	local var_7_1 = arg_7_0.data:getConfig("default_bgm")
	local var_7_2 = arg_7_0.data:getConfig("ani_name")
	local var_7_3 = underscore.keys(arg_7_0.storyNodesDict)

	table.sort(var_7_3)

	for iter_7_0 = 1, #var_7_3 do
		local var_7_4 = arg_7_0.storyNodesDict[var_7_3[iter_7_0]]

		if var_7_4:IsReaded() then
			var_7_0 = defaultValue(var_7_4:GetCleanBG(), var_7_0)
			var_7_1 = defaultValue(var_7_4:GetCleanBGM(), var_7_1)
			var_7_2 = defaultValue(var_7_4:GetCleanAnimator(), var_7_2)
		else
			break
		end
	end

	arg_7_0.sceneParent:SwitchBG({
		{
			bgPrefix = "bg",
			BG = var_7_0,
			Animator = var_7_2
		}
	})
	pg.BgmMgr.GetInstance():Push(arg_7_0.__cname, var_7_1)
end

return var_0_0
