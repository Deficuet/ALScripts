local var_0_0 = class("IslandStoryMgr", import("view.base.BaseSubView"))

var_0_0.START_STORY = "IslandStoryMgr:START_STORY"
var_0_0.END_STORY = "IslandStoryMgr:END_STORY"

local var_0_1 = 0
local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = Color.New(1, 0.8705, 0.4196, 1)
local var_0_5 = Color.New(1, 1, 1, 1)

function var_0_0.getUIName(arg_1_0)
	return "IslandStoryUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.skipBtn = arg_2_0._tf:Find("front/btns/btns/skip_button")
	arg_2_0.logBtn = arg_2_0._tf:Find("front/btns/record")
	arg_2_0.autoBtn = arg_2_0._tf:Find("front/btns/btns/auto_button")
	arg_2_0.autoBtnImg = findTF(arg_2_0._tf, "front/btns/btns/auto_button/sel"):GetComponent(typeof(Image))
	arg_2_0.animator = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.aniDft = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
	arg_2_0.canvasGroup = GetOrAddComponent(arg_2_0._tf, typeof(CanvasGroup))
	arg_2_0.player = Dialogue3DPlayer.New(arg_2_0)
	arg_2_0.recordPanel = IslandStoryRecordPanel.New(arg_2_0)
	arg_2_0.recorder = IslandStoryRecorder.New()
	arg_2_0.setSpeedPanel = StorySetSpeedPanel.New(arg_2_0._tf, function(arg_3_0)
		if arg_2_0:IsRunning() and arg_2_0.script then
			arg_2_0.script:SetPlaySpeed(arg_3_0)
		end
	end)

	setActive(arg_2_0._go, false)

	arg_2_0.state = var_0_1
end

function var_0_0.Play(arg_4_0, arg_4_1, arg_4_2)
	if not _IslandCore then
		return
	end

	if arg_4_0:IsRunning() then
		arg_4_2()

		return
	end

	local var_4_0 = _IslandCore:GetView():GetUnitListByKey(IslandConst.UNIT_LIST_OBJ)

	arg_4_0.state = var_0_2

	local var_4_1 = pg.NewStoryMgr.GetInstance():GetScript(arg_4_1)
	local var_4_2 = IslandStory.New(var_4_1, var_4_0, IslandStory.MODE_DIALOGUE)

	arg_4_0.script = var_4_2

	arg_4_0:StartScript(var_4_2)

	local var_4_3 = {}

	table.insert(var_4_3, function(arg_5_0)
		arg_4_0.player:OnStartAction(var_4_2, arg_5_0)
	end)

	for iter_4_0, iter_4_1 in ipairs(var_4_2.steps) do
		table.insert(var_4_3, function(arg_6_0)
			if arg_4_0.isStop then
				arg_6_0()

				return
			end

			arg_4_0.player:Play(arg_4_0.recorder, iter_4_0, var_4_2, arg_6_0)
		end)
	end

	table.insert(var_4_3, function(arg_7_0)
		arg_4_0.player:OnEndAction(var_4_2, arg_7_0)
	end)
	table.insert(var_4_3, function(arg_8_0)
		arg_4_0:PlayExitAniamtion(var_4_2, arg_8_0)
	end)
	seriesAsync(var_4_3, function()
		arg_4_0:EndScript(var_4_2)

		if arg_4_2 then
			arg_4_2()
		end
	end)
end

function var_0_0.StartScript(arg_10_0, arg_10_1)
	arg_10_0.isStop = false
	arg_10_0.canvasGroup.blocksRaycasts = true

	arg_10_0.recorder:Clear()
	setActive(arg_10_0._go, true)
	arg_10_0:RegisterSkipBtn()
	arg_10_0:RegisterLogBtn()
	arg_10_0:RegisterAutoBtn()
	arg_10_0.player:OnStart(arg_10_1)
	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = arg_10_1.id,
		callback = function()
			IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.STORY)
		end
	})
	arg_10_0:emit(IslandBaseScene.LINK_CORE_EVENT, IslandProxy.STORY_START)
end

function var_0_0.RegisterAutoBtn(arg_12_0)
	onButton(arg_12_0, arg_12_0.autoBtn, function()
		if not arg_12_0.script then
			return
		end

		if arg_12_0.script:GetAutoPlayFlag() then
			arg_12_0.script:StopAutoPlay()
			arg_12_0.player:CancelAuto()
		else
			arg_12_0.script:SetAutoPlay()
			arg_12_0.player:NextOne()
		end

		arg_12_0:UpdateAutoBtn()
	end, SFX_PANEL)
	arg_12_0:UpdateAutoBtn()
end

function var_0_0.UpdateAutoBtn(arg_14_0)
	local var_14_0 = arg_14_0.script:GetAutoPlayFlag()

	arg_14_0:ClearAutoBtn(var_14_0)
end

function var_0_0.ClearAutoBtn(arg_15_0, arg_15_1)
	if not arg_15_0.script then
		return
	end

	arg_15_0.autoBtnImg.color = arg_15_1 and var_0_4 or var_0_5

	local var_15_0 = arg_15_1 and "Show" or "Hide"

	arg_15_0.setSpeedPanel[var_15_0](arg_15_0.setSpeedPanel, arg_15_0.script)
end

function var_0_0.RegisterSkipBtn(arg_16_0)
	onButton(arg_16_0, arg_16_0.skipBtn, function()
		arg_16_0.script:MarkSkipAll()
		arg_16_0.player:NextOne()
	end, SFX_PANEL)
end

function var_0_0.RegisterLogBtn(arg_18_0)
	onButton(arg_18_0, arg_18_0.logBtn, function()
		if not arg_18_0.recordPanel:CanOpen() then
			return
		end

		if arg_18_0.script:GetAutoPlayFlag() then
			arg_18_0.script:StopAutoPlay()
			arg_18_0.player:CancelAuto()
			arg_18_0:UpdateAutoBtn()
		end

		arg_18_0.recordPanel:Show(arg_18_0.recorder)
	end, SFX_PANEL)
end

function var_0_0.PlayExitAniamtion(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_1:LastStepIsTimeline() then
		if arg_20_2 then
			arg_20_2()
		end

		return
	end

	arg_20_0.aniDft:SetEndEvent(function()
		if arg_20_2 then
			arg_20_2()
		end
	end)

	arg_20_0.canvasGroup.blocksRaycasts = false

	arg_20_0.animator:Play("anim_IslandStoryUI_Dialogue_Out")
end

function var_0_0.EndScript(arg_22_0, arg_22_1)
	arg_22_0.isStop = false
	arg_22_0.canvasGroup.blocksRaycasts = true

	arg_22_0.aniDft:SetEndEvent(nil)
	setActive(arg_22_0._go, false)
	removeOnButton(arg_22_0.skipBtn)
	removeOnButton(arg_22_0.logBtn)
	arg_22_0:ClearAutoBtn(false)
	arg_22_0.recorder:Clear()
	arg_22_0.recordPanel:Hide()
	arg_22_0.setSpeedPanel:Clear()

	arg_22_0.state = var_0_3
	arg_22_0.script = nil

	arg_22_0.player:OnEnd(arg_22_1)
	arg_22_0:emit(IslandBaseScene.LINK_CORE_EVENT, IslandProxy.STORY_END)
end

function var_0_0.IsRunning(arg_23_0)
	return arg_23_0.state == var_0_2
end

function var_0_0.Stop(arg_24_0)
	if arg_24_0.isStop then
		return
	end

	if not arg_24_0:IsRunning() then
		return
	end

	arg_24_0.isStop = true

	arg_24_0.player:NextOne()
end

function var_0_0.onBackPressed(arg_25_0)
	if arg_25_0.recordPanel and arg_25_0.recordPanel:IsShowing() then
		arg_25_0.recordPanel:Hide()

		return true
	end

	if arg_25_0:IsRunning() then
		arg_25_0:Stop()

		return true
	end

	return false
end

function var_0_0.OnDestroy(arg_26_0)
	arg_26_0.recorder:Dispose()
	arg_26_0.recordPanel:Dispose()
	arg_26_0.setSpeedPanel:Dispose()
	arg_26_0.player:Dispose()
end

return var_0_0
