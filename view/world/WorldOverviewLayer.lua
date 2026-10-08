local var_0_0 = class("WorldOverviewLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "WorldOverviewUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"scenes/worldoverview"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.preload(arg_3_0, arg_3_1)
	arg_3_0:LoadAtlasOverall(arg_3_1)
end

function var_0_0.init(arg_4_0)
	local var_4_0 = arg_4_0._tf

	arg_4_0.rtBg = var_4_0:Find("bg")

	onButton(arg_4_0, arg_4_0.rtBg, function()
		arg_4_0:closeView()
	end, SFX_CANCEL)
	setText(var_4_0:Find("tip/Text"), i18n("click_back_tip"))

	arg_4_0.rtTaskPanel = var_4_0:Find("panel/middle/info_panel/task_panel")

	setActive(arg_4_0.rtTaskPanel, false)
	setActive(arg_4_0.rtTaskPanel:Find("btn_next"), false)

	arg_4_0.entranceItemList = UIItemList.New(arg_4_0.rtTaskPanel:Find("entrance_list/target_list"), arg_4_0.rtTaskPanel:Find("entrance_list/target_tpl"))

	arg_4_0.entranceItemList:make(function(arg_6_0, arg_6_1, arg_6_2)
		arg_6_1 = arg_6_1 + 1

		if arg_6_0 == UIItemList.EventUpdate then
			if arg_4_0.entranceIds[arg_6_1] then
				local var_6_0 = nowWorld():GetEntrance(arg_4_0.entranceIds[arg_6_1])

				setActive(arg_6_2:Find("Image"), true)
				setText(arg_6_2:Find("Text"), i18n("world_task_view1") .. var_6_0:GetBaseMap():GetName())
			else
				setActive(arg_6_2:Find("Image"), true)
				setText(arg_6_2:Find("Text"), i18n("world_task_view1") .. i18n("world_task_view2"))
			end
		end
	end)

	arg_4_0.areaItemList = UIItemList.New(arg_4_0.rtTaskPanel:Find("entrance_list/target_list"), arg_4_0.rtTaskPanel:Find("entrance_list/target_tpl"))

	arg_4_0.areaItemList:make(function(arg_7_0, arg_7_1, arg_7_2)
		arg_7_1 = arg_7_1 + 1

		if arg_7_0 == UIItemList.EventUpdate then
			if arg_4_0.areaIds[arg_7_1] then
				setActive(arg_7_2:Find("Image"), true)
				setText(arg_7_2:Find("Text"), i18n("world_task_view1") .. pg.world_regions_data[arg_4_0.areaIds[arg_7_1]].name)
			else
				setActive(arg_7_2:Find("Image"), true)
				setText(arg_7_2:Find("Text"), i18n("world_task_view1") .. i18n("world_task_view2"))
			end
		end
	end)

	arg_4_0.rtAchievementPanel = var_4_0:Find("panel/middle/info_panel/achievement_panel")

	setActive(arg_4_0.rtAchievementPanel, false)

	arg_4_0.btnAchieve = arg_4_0.rtAchievementPanel:Find("btn_all")

	onButton(arg_4_0, arg_4_0.btnAchieve, function()
		local var_8_0, var_8_1 = nowWorld():GetFinishAchievements()

		if #var_8_0 == 0 then
			pg.TipsMgr.GetInstance():ShowTips("without any award")
		else
			arg_4_0:emit(WorldOverviewMediator.OnAchieveStar, var_8_0)
			arg_4_0:closeView()
		end
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.didEnter(arg_9_0)
	local var_9_0 = arg_9_0.contextData.info

	arg_9_0.mode = var_9_0.mode

	if arg_9_0.mode == "Task" then
		arg_9_0.taskId = var_9_0.taskId

		arg_9_0:UpdateTaskPanel()
	elseif arg_9_0.mode == "Achievement" then
		arg_9_0:UpdateAchievementPanel()
	else
		arg_9_0.entranceIds = var_9_0.ids
	end

	arg_9_0._tf:GetComponent("DftAniEvent"):SetEndEvent(function(arg_10_0)
		local var_10_0 = {}

		_.each(arg_9_0.entranceIds, function(arg_11_0)
			var_10_0[arg_11_0] = true
		end)

		if #arg_9_0.entranceIds > 0 then
			arg_9_0.wsAtlasOverall:UpdateTargetEntrance(arg_9_0.entranceIds[1])
		end

		arg_9_0.wsAtlasOverall:UpdateStaticMark(var_10_0, arg_9_0:GetOverviewMark())
		arg_9_0:DisplayAtlasOverall()

		if arg_9_0.mode then
			setActive(arg_9_0["rt" .. arg_9_0.mode .. "Panel"], true)

			if arg_9_0.mode == "Task" then
				eachChild(arg_9_0.entranceItemList.container, function(arg_12_0)
					local var_12_0 = GetComponent(arg_12_0:Find("Text"), typeof(Typewriter))

					var_12_0:setSpeed(0.03)
					var_12_0:Play()
				end)

				local var_10_1 = arg_9_0.rtTaskPanel:Find("entrance_list/target_tpl")
				local var_10_2 = GetComponent(var_10_1:Find("Text"), typeof(Typewriter))

				var_10_2:setSpeed(0.03)
				var_10_2:Play()
			end
		end
	end)
end

function var_0_0.willExit(arg_13_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf, arg_13_0._parentTf)

	if arg_13_0.mode then
		setActive(arg_13_0["rt" .. arg_13_0.mode .. "Panel"], false)
	end

	arg_13_0:HideAtlasOverall()
	arg_13_0:DisposeAtlasOverall()
end

function var_0_0.GetOverviewMark(arg_14_0)
	if arg_14_0.mode == "Task" then
		if arg_14_0.isTaskArea then
			return {
				"overview_port"
			}
		else
			return {
				"overview_task_port",
				"overview_task"
			}
		end
	elseif arg_14_0.mode == "Achievement" then
		return {
			"overview_achievement",
			"overview_achievement"
		}
	else
		return {
			"overview_task_port",
			"overview_task"
		}
	end
end

function var_0_0.UpdateTaskPanel(arg_15_0)
	local var_15_0 = nowWorld()
	local var_15_1 = var_15_0:GetTaskProxy():getTaskById(arg_15_0.taskId)

	assert(var_15_1, "without this doing task: " .. arg_15_0.taskId)

	local var_15_2 = arg_15_0.rtTaskPanel:Find("task_info")

	GetImageSpriteFromAtlasAsync("ui/worldtaskfloatui_atlas", pg.WorldToastMgr.Type2PictrueName[var_15_1.config.type], var_15_2:Find("type"), true)
	setText(var_15_2:Find("name/Text"), var_15_1.config.name)

	local var_15_3 = var_15_1:GetFollowingAreaId()

	if var_15_3 then
		arg_15_0.isTaskArea = true
		arg_15_0.entranceIds = underscore.to_array(var_15_0:GetAreaEntranceIds(var_15_3))
		arg_15_0.areaIds = {
			var_15_3
		}

		arg_15_0.areaItemList:align(math.max(#arg_15_0.areaIds, 1))
	else
		arg_15_0.isTaskArea = false
		arg_15_0.entranceIds = {
			var_15_1:GetFollowingEntrance()
		}

		arg_15_0.entranceItemList:align(math.max(#arg_15_0.entranceIds, 1))
	end

	local var_15_4 = arg_15_0.rtTaskPanel:Find("entrance_list/target_tpl")
	local var_15_5 = var_15_0:GetActiveEntrance()

	setActive(var_15_4:Find("Image"), false)
	setText(var_15_4:Find("Text"), i18n("world_task_view2") .. var_15_5:GetBaseMap():GetName())
end

function var_0_0.UpdateAchievementPanel(arg_16_0)
	local var_16_0 = nowWorld()
	local var_16_1, var_16_2, var_16_3 = var_16_0:CountAchievements()

	setText(arg_16_0.rtAchievementPanel:Find("achievement_info/name/info/number"), var_16_1 + var_16_2 .. "/" .. var_16_3)

	local var_16_4, var_16_5 = var_16_0:GetFinishAchievements()
	local var_16_6 = 0

	for iter_16_0, iter_16_1 in ipairs(var_16_4) do
		var_16_6 = var_16_6 + #iter_16_1.star_list
	end

	local var_16_7 = arg_16_0.rtAchievementPanel:Find("word_list/target_tpl")

	setActive(var_16_7:Find("Image"), true)
	setText(var_16_7:Find("Text"), i18n("world_target_count", "  " .. setColorStr(tostring(var_16_6), COLOR_YELLOW) .. "  "))

	arg_16_0.entranceIds = var_16_5

	local var_16_8 = pg.gameset.world_target_obtain.key_value

	setActive(arg_16_0.btnAchieve, var_16_8 <= #var_16_4)
end

function var_0_0.DisplayAtlasOverall(arg_17_0)
	if arg_17_0.wsAtlasOverall then
		setActive(arg_17_0.wsAtlasOverall.tfEntity:Find("Plane"), false)
		arg_17_0.wsAtlasOverall:ShowOrHide(true)
	end
end

function var_0_0.HideAtlasOverall(arg_18_0)
	if arg_18_0.wsAtlasOverall then
		arg_18_0.wsAtlasOverall:ShowOrHide(false)
	end
end

function var_0_0.LoadAtlasOverall(arg_19_0, arg_19_1)
	local var_19_0 = {}

	if not arg_19_0.wsAtlasOverall then
		table.insert(var_19_0, function(arg_20_0)
			arg_19_0.wsAtlasOverall = WSAtlasOverall.New()

			arg_19_0.wsAtlasOverall:Setup()
			arg_19_0.wsAtlasOverall:LoadScene(function()
				arg_19_0.wsAtlasOverall:UpdateAtlas(nowWorld():GetAtlas())

				return arg_20_0()
			end)
		end)
	end

	seriesAsync(var_19_0, function()
		return existCall(arg_19_1)
	end)
end

function var_0_0.DisposeAtlasOverall(arg_23_0)
	if arg_23_0.wsAtlasOverall then
		arg_23_0.wsAtlasOverall:Dispose()

		arg_23_0.wsAtlasOverall = nil
	end
end

return var_0_0
