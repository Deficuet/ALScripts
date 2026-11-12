local var_0_0 = class("TwoPointFiveMainPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.storyBtn = arg_1_0._tf:Find("AD/story_btn")
	arg_1_0.redPoint = arg_1_0.storyBtn:Find("redPoint")
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)

	arg_2_0.scenario = arg_2_0:GetOutPostScenarioPage().New(arg_2_0._tf, arg_2_0.event)

	arg_2_0.scenario:SetCoreStoryPage(arg_2_0)
	arg_2_0.scenario:RegisterView(arg_2_0.coreActivityUI)

	local var_2_0 = arg_2_0.activity:getConfig("config_client")
	local var_2_1 = type(var_2_0) == "table" and var_2_0.intro_story or nil

	if type(var_2_1) == "table" then
		var_2_1 = var_2_1[1]
	end

	if var_2_1 and var_2_1 ~= "" then
		local var_2_2 = pg.NewStoryMgr.GetInstance()

		if not var_2_2:IsPlayed(var_2_1) then
			var_2_2:Play(var_2_1)
		end
	end

	onButton(arg_2_0, arg_2_0.storyBtn, function()
		arg_2_0.scenario:Load()
		arg_2_0.scenario:SetActivity(arg_2_0.activity)
		arg_2_0.scenario:UpdateStoryTask()
		arg_2_0.scenario:ActionInvoke("UpdateView")
		arg_2_0:ShowScenarioLayer(true)

		local var_3_0 = Activity.GetPlayerActivyIDKey(arg_2_0.activity.id)

		PlayerPrefs.SetInt(var_3_0, 1)
	end, SFX_PANEL)
	arg_2_0:refreshRed()
end

function var_0_0.OnUpdateFlush(arg_4_0)
	var_0_0.super.OnUpdateFlush(arg_4_0)
	arg_4_0:refreshRed()

	if arg_4_0.coreActivityUI.contextData.activeScenario and not arg_4_0:IsShowingPopWindow() then
		triggerButton(arg_4_0.storyBtn)
	end
end

function var_0_0.GetOutPostScenarioPage(arg_5_0)
	return TwoPointFiveScenarioPage
end

function var_0_0.refreshRed(arg_6_0)
	setActive(arg_6_0.redPoint, arg_6_0.activity:readyToAchieve())
end

function var_0_0.ShowScenarioLayer(arg_7_0, arg_7_1)
	if not arg_7_0.coreActivityUI.exited then
		arg_7_0.coreActivityUI:ActiveScenarioLayer(arg_7_1)
	end

	if arg_7_1 then
		arg_7_0.scenario:ActionInvoke("Show")
	else
		arg_7_0.scenario:Hide()
	end
end

function var_0_0.IsShowingPopWindow(arg_8_0)
	return arg_8_0.scenario and arg_8_0.scenario:isShowing() or false
end

function var_0_0.ClosePopWindow(arg_9_0)
	if arg_9_0:IsShowingPopWindow() then
		arg_9_0:ShowScenarioLayer(false)
	end
end

function var_0_0.OnDestroy(arg_10_0)
	if arg_10_0.scenario then
		arg_10_0:ClosePopWindow()
		arg_10_0.scenario:Destroy()

		arg_10_0.scenario = nil
	end
end

return var_0_0
