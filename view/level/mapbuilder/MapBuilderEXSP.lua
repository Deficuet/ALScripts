local var_0_0 = class("MapBuilderEXSP", import(".MapBuilderSPSeriesFull"))

function var_0_0.GetType(arg_1_0)
	return MapBuilder.TYPEEXSP
end

function var_0_0.getUIName(arg_2_0)
	return "LevelSelectEXSPUI"
end

function var_0_0.OnInit(arg_3_0)
	var_0_0.super.OnInit(arg_3_0)

	arg_3_0.personalBtn = arg_3_0._tf:Find("Story/PersonalCard")
	arg_3_0.personalPage = SecretsAbyssPersonalPage.New(arg_3_0._tf, arg_3_0, {})

	onButton(arg_3_0, arg_3_0.personalBtn, function()
		arg_3_0.personalPage:ExecuteAction("Show")
	end)
end

function var_0_0.OnDestroy(arg_5_0)
	arg_5_0.personalPage:Destroy()

	arg_5_0.personalBtn = nil

	var_0_0.super.OnDestroy(arg_5_0)
end

function var_0_0.UpdateMapVO(arg_6_0, arg_6_1)
	var_0_0.super.UpdateMapVO(arg_6_0, arg_6_1)

	if arg_6_0.activity:getConfig("config_client").roll_task then
		arg_6_0.personalPage:RegisterRandomCallback(function()
			arg_6_0.sceneParent:emit(LevelMediator2.ON_UPDATE_LOWPRIORITY_TASK, arg_6_0.activity:getConfig("config_client").roll_task)
		end)
	end
end

function var_0_0.SetDisplayMode(arg_8_0, arg_8_1)
	var_0_0.super.SetDisplayMode(arg_8_0, arg_8_1)

	if arg_8_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE then
		quickPlayAnimation(arg_8_0._tf, "Anim_LevelSelectAtelierYumia_Battle_In")
	else
		quickPlayAnimation(arg_8_0._tf, "Anim_LevelSelectAtelierYumia_In")
	end
end

function var_0_0.PlayerLevelTplAnimation(arg_9_0, arg_9_1, arg_9_2)
	quickPlayAnimation(arg_9_1, switch(arg_9_2.status, {
		Lock = function()
			return "Anim_LevelSelectAtelierYumia_LevelTplLock_In"
		end,
		Normal = function()
			return "Anim_LevelSelectAtelierYumia_LevelTpNormal_In"
		end,
		Hard = function()
			return "Anim_LevelSelectAtelierYumia_LevelTpHard_In"
		end
	}))
end

function var_0_0.UpdateStory(arg_13_0)
	local var_13_0 = {}
	local var_13_1 = pg.NewStoryMgr.GetInstance()
	local var_13_2 = 0
	local var_13_3 = 0
	local var_13_4 = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_0.storyNodesDict) do
		local var_13_5 = arg_13_0.storyHolder:Find(tostring(iter_13_1.id))
		local var_13_6 = iter_13_1:IsActive(arg_13_0.activity, arg_13_0.ptActivity)
		local var_13_7 = iter_13_1:IsReaded()

		if not _G.isActive(var_13_5) and var_13_6 then
			setActive(var_13_5, var_13_6)
			quickPlayAnimation(var_13_5, switch(iter_13_1:GetType(), {
				[BossRushStoryNode.NODE_TYPE.NORMAL] = function()
					return "Anim_LevelSelectAtelierYumia_storytpl_In"
				end,
				[BossRushStoryNode.NODE_TYPE.BATTLE] = function()
					return "Anim_LevelSelectAtelierYumia_bettletpl_In"
				end,
				[BossRushStoryNode.NODE_TYPE.LOCATION] = function()
					return "Anim_LevelSelectAtelierYumia_Item_Lock_In"
				end
			}, function()
				assert(false)
			end))
		else
			setActive(var_13_5, var_13_6)
		end

		if iter_13_1:GetType() ~= BossRushStoryNode.NODE_TYPE.LOCATION then
			var_13_2 = var_13_2 + (var_13_7 and 1 or 0)
			var_13_3 = var_13_3 + 1

			if var_13_7 then
				table.insert(var_13_4, iter_13_1)
			end
		end

		if var_13_6 then
			local var_13_8
			local var_13_9 = iter_13_1:GetParams("item_lock")
			local var_13_10 = var_13_9 and Drop.Create(var_13_9[2]) or nil
			local var_13_11 = var_13_10 and var_13_10.count > var_13_10:getOwnedCount() and "item_lock" or switch(iter_13_1:GetType(), {
				[BossRushStoryNode.NODE_TYPE.NORMAL] = function()
					return "story"
				end,
				[BossRushStoryNode.NODE_TYPE.BATTLE] = function()
					return "battle"
				end,
				[BossRushStoryNode.NODE_TYPE.LOCATION] = function()
					return "location"
				end
			})

			eachChild(var_13_5, function(arg_21_0, arg_21_1)
				setActive(arg_21_0, arg_21_0.name == var_13_11)
			end)
			switch(var_13_11, {
				story = function(arg_22_0)
					setText(arg_22_0:Find("name/Text"), iter_13_1:GetName())
					onButton(arg_13_0, arg_22_0, function()
						if var_13_7 then
							return
						end

						local var_23_0 = iter_13_1:GetStory()

						arg_13_0:PlayStory(var_23_0, function()
							arg_13_0:UpdateView()
							arg_13_0:CheckAutoShowPersonal()
						end)
					end)
				end,
				battle = function(arg_25_0)
					setText(arg_25_0:Find("name/Text"), iter_13_1:GetName())
					onButton(arg_13_0, arg_25_0, function()
						if var_13_7 then
							return
						end

						local var_26_0 = iter_13_1:GetStory()

						arg_13_0:PlayStory(var_26_0, function()
							arg_13_0:UpdateView()
							arg_13_0:CheckAutoShowPersonal()
						end)
					end)
				end,
				location = function(arg_28_0)
					setText(arg_28_0:Find("name/Text"), iter_13_1:GetName())

					local var_28_0 = arg_28_0:Find("en")

					if arg_28_0:Find("en") then
						setActive(arg_28_0:Find("en"), PLATFORM_CODE ~= PLATFORM_US)
						setText(arg_28_0:Find("en"), iter_13_1:getConfig("en_name"))
					end
				end
			}, function()
				warning("error state without any display:", var_13_11)
			end, var_13_5:Find(var_13_11))
		end
	end

	setText(arg_13_0.progressText, var_13_2 .. "/" .. var_13_3)
	setActive(arg_13_0.storyAward, tobool(arg_13_0.storyTask))

	if arg_13_0.storyTask then
		local var_13_12 = arg_13_0.storyTask:getConfig("award_display")
		local var_13_13 = Drop.Create(var_13_12[1])

		updateDrop(arg_13_0.storyAward:GetChild(0), var_13_13)

		local var_13_14 = arg_13_0.storyTask:getTaskStatus()

		setActive(arg_13_0.storyAward:Find("get"), var_13_14 == 1)
		setActive(arg_13_0.storyAward:Find("got"), var_13_14 == 2)
		onButton(arg_13_0, arg_13_0.storyAward, function()
			arg_13_0:emit(BaseUI.ON_DROP, var_13_13)
		end)
	end

	table.sort(var_13_4, function(arg_31_0, arg_31_1)
		return arg_31_0:getConfig("id") < arg_31_1:getConfig("id")
	end)

	local var_13_15 = var_13_4[#var_13_4]
	local var_13_16
	local var_13_17 = #var_13_4 - 1

	while var_13_17 > 0 do
		if #arg_13_0.personalPage:GetActivitySingleEventOption(var_13_4[var_13_17]) > 0 then
			var_13_16 = var_13_4[var_13_17]

			break
		end

		var_13_17 = var_13_17 - 1
	end

	if var_13_15 and #arg_13_0.personalPage:GetActivitySingleEventOption(var_13_15) > 0 or var_13_16 and #arg_13_0.personalPage:GetActivitySingleEventOption(var_13_16) > 0 then
		setActive(arg_13_0.personalBtn, true)
	else
		setActive(arg_13_0.personalBtn, false)
	end

	var_13_16 = var_13_16 and var_13_16 or var_13_15

	arg_13_0.personalPage:SetBossRushNode(var_13_15, var_13_16)

	if var_13_2 == var_13_3 then
		arg_13_0.personalPage:UnlockRandom()
	end

	if arg_13_0.activity:getConfig("config_client").first_story then
		pg.NewStoryMgr.GetInstance():Play(arg_13_0.activity:getConfig("config_client").first_story)
	end
end

function var_0_0.CheckAutoShowPersonal(arg_32_0)
	if #arg_32_0.personalPage:GetActivitySingleEventOption(arg_32_0.personalPage:GetCurrentEvent()) > 0 then
		arg_32_0.personalPage:SetUpgrade()
		arg_32_0.personalPage:ExecuteAction("Show")
		arg_32_0.personalPage:ExecuteAction("UpdateView")
	end
end

var_0_0.presonalRandomData = nil

return var_0_0
