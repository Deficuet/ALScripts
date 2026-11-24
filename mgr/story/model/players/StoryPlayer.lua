local var_0_0 = class("StoryPlayer", import("..animation.StoryAnimtion"))
local var_0_1 = 0
local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3
local var_0_5 = 4
local var_0_6 = 5
local var_0_7 = 6
local var_0_8 = 7
local var_0_9 = 0
local var_0_10 = 1
local var_0_11 = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.animationPlayer = arg_1_0._tf:GetComponent(typeof(Animation))
	arg_1_0.front = arg_1_0._tf:Find("front")
	arg_1_0.actorTr = arg_1_0._tf:Find("actor")
	arg_1_0.frontTr = arg_1_0._tf:Find("front")
	arg_1_0.backPanel = arg_1_0._tf:Find("back")
	arg_1_0.goCG = GetOrAddComponent(arg_1_0._tf, typeof(CanvasGroup))
	arg_1_0.asidePanel = arg_1_0._tf:Find("front/aside_panel")
	arg_1_0.bgGlitch = arg_1_0._tf:Find("back/bg_glitch")
	arg_1_0.oldPhoto = arg_1_0._tf:Find("front/oldphoto"):GetComponent(typeof(Image))
	arg_1_0.bgPanel = arg_1_0._tf:Find("back/bg")
	arg_1_0.bgPanelCg = arg_1_0.bgPanel:GetComponent(typeof(CanvasGroup))

	setActive(arg_1_0._tf:Find("back/bg/sub"), false)

	arg_1_0.bgImage = arg_1_0.bgPanel:Find("image"):GetComponent(typeof(Image))
	arg_1_0.mainImg = arg_1_0._tf:GetComponent(typeof(Image))
	arg_1_0.castPanel = arg_1_0._tf:Find("front/cast_panel")
	arg_1_0.spAnimPanel = arg_1_0._tf:Find("front/sp_anim_panel")
	arg_1_0.centerPanel = arg_1_0._tf:Find("center")
	arg_1_0.actorPanel = arg_1_0._tf:Find("actor")
	arg_1_0.dialoguePanel = arg_1_0._tf:Find("front/dialogue")
	arg_1_0.effectPanel = arg_1_0._tf:Find("front/effect")
	arg_1_0.movePanel = arg_1_0._tf:Find("front/move_layer")
	arg_1_0.curtain = arg_1_0._tf:Find("back/curtain")
	arg_1_0.curtainCg = arg_1_0.curtain:GetComponent(typeof(CanvasGroup))
	arg_1_0.flash = arg_1_0._tf:Find("front/flash")
	arg_1_0.flashImg = arg_1_0.flash:GetComponent(typeof(Image))
	arg_1_0.flashCg = arg_1_0.flash:GetComponent(typeof(CanvasGroup))
	arg_1_0.curtainF = arg_1_0._tf:Find("back/curtain_front")
	arg_1_0.curtainFCg = arg_1_0.curtainF:GetComponent(typeof(CanvasGroup))
	arg_1_0.locationTr = arg_1_0._tf:Find("front/location")
	arg_1_0.locationTxt = arg_1_0._tf:Find("front/location/Text"):GetComponent(typeof(Text))
	arg_1_0.locationTrPos = arg_1_0.locationTr.localPosition
	arg_1_0.locationAnim = arg_1_0.locationTr:GetComponent(typeof(Animation))
	arg_1_0.locationAniEvent = arg_1_0.locationTr:GetComponent(typeof(DftAniEvent))
	arg_1_0.iconImage = arg_1_0._tf:Find("front/icon"):GetComponent(typeof(Image))
	arg_1_0.topEffectTr = arg_1_0._tf:Find("top/effect")
	arg_1_0.dialogueWin = nil
	arg_1_0.bgs = {}
	arg_1_0.branchCodeList = {}
	arg_1_0.stop = false
	arg_1_0.pause = false
end

function var_0_0.Disable(arg_2_0)
	setActive(arg_2_0._tf, false)
end

function var_0_0.Enable(arg_3_0)
	setActive(arg_3_0._tf, true)
end

function var_0_0.StoryStart(arg_4_0, arg_4_1)
	arg_4_0.branchCodeList = {}

	eachChild(arg_4_0.dialoguePanel, function(arg_5_0)
		setActive(arg_5_0, false)
	end)

	arg_4_0.dialogueWin = arg_4_0.dialoguePanel:Find(arg_4_1:GetDialogueStyleName())

	setActive(arg_4_0.dialogueWin, true)

	arg_4_0.optionLUIlist = UIItemList.New(arg_4_0.dialogueWin:Find("options_panel/options_l"), arg_4_0.dialogueWin:Find("options_panel/options_l/option_tpl"))
	arg_4_0.optionCUIlist = UIItemList.New(arg_4_0.dialogueWin:Find("options_panel/options_c"), arg_4_0.dialogueWin:Find("options_panel/options_c/option_tpl"))
	arg_4_0.optionsCg = arg_4_0.dialogueWin:Find("options_panel"):GetComponent(typeof(CanvasGroup))

	arg_4_0:OnStart(arg_4_1)
end

function var_0_0.GetOptionContainer(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1:GetOptionCnt()

	if arg_6_0.script:IsDialogueStyle2() then
		setActive(arg_6_0.optionLUIlist.container, true)
		setActive(arg_6_0.optionCUIlist.container, false)

		return arg_6_0.optionLUIlist, true
	end

	if var_6_0 <= 3 or arg_6_1:IsOptionForceCenter() then
		setActive(arg_6_0.optionLUIlist.container, false)
		setActive(arg_6_0.optionCUIlist.container, true)

		return arg_6_0.optionCUIlist, false
	else
		setActive(arg_6_0.optionLUIlist.container, true)
		setActive(arg_6_0.optionCUIlist.container, false)

		return arg_6_0.optionLUIlist, true
	end
end

function var_0_0.Pause(arg_7_0)
	arg_7_0.pause = true

	arg_7_0:PauseAllAnimation()
	pg.ViewUtils.SetLayer(arg_7_0.effectPanel, Layer.UIHidden)
end

function var_0_0.Resume(arg_8_0)
	arg_8_0.pause = false

	arg_8_0:ResumeAllAnimation()
	pg.ViewUtils.SetLayer(arg_8_0.effectPanel, Layer.UI)
end

function var_0_0.Stop(arg_9_0)
	arg_9_0.stop = true

	arg_9_0:NextOneImmediately()
end

function var_0_0.Play(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if not arg_10_1 then
		arg_10_3()

		return
	end

	if arg_10_1:GetNextScriptName() or arg_10_0.stop then
		arg_10_3()

		return
	end

	local var_10_0 = arg_10_1:GetStepByIndex(arg_10_2)

	if not var_10_0 then
		arg_10_3()

		return
	end

	if var_10_0:GetMode() == Story.MODE_SUBPAGE and not var_10_0:ShouldShowSubPage() then
		arg_10_3()

		return
	end

	pg.NewStoryMgr.GetInstance():AddRecord(var_10_0)

	if var_10_0:ShouldJumpToNextScript() then
		arg_10_1:SetNextScriptName(var_10_0:GetNextScriptName())
		arg_10_3()

		return
	end

	local var_10_1 = arg_10_1:ShouldSkipAll()

	if var_10_1 then
		arg_10_0:ClearEffects()
	end

	local var_10_2 = false

	if var_10_1 and var_10_0:IsImport() and not pg.NewStoryMgr.GetInstance():IsReView() then
		var_10_2 = true
	elseif var_10_1 then
		arg_10_3()

		return
	end

	arg_10_0.script = arg_10_1
	arg_10_0.callback = arg_10_3
	arg_10_0.step = var_10_0
	arg_10_0.autoNext = arg_10_1:GetAutoPlayFlag()
	arg_10_0.stage = var_0_1

	local var_10_3 = arg_10_1:GetTriggerDelayTime()

	var_10_0:MarkIsExecuted()

	if arg_10_0.autoNext and var_10_0:IsImport() and not var_10_0.optionSelCode then
		arg_10_0.autoNext = nil
	end

	arg_10_0:SetTimeScale(1 - arg_10_1:GetPlaySpeed() * 0.1)

	local var_10_4 = arg_10_1:GetPrevStep(arg_10_2)

	seriesAsync({
		function(arg_11_0)
			if not arg_10_0:NextStage(var_0_2) then
				return
			end

			parallelAsync({
				function(arg_12_0)
					arg_10_0:Reset(var_10_0, var_10_4, arg_12_0)
					arg_10_0:UpdateBg(var_10_0)
					arg_10_0:PlayBgm(var_10_0)
				end,
				function(arg_13_0)
					arg_10_0:LoadEffects(var_10_0, arg_13_0)
				end,
				function(arg_14_0)
					arg_10_0:ApplyEffects(var_10_0, arg_14_0)
				end,
				function(arg_15_0)
					arg_10_0:flashin(var_10_0, arg_15_0)
				end
			}, arg_11_0)
		end,
		function(arg_16_0)
			if var_10_2 then
				arg_10_1:StopSkip()
			end

			var_10_2 = false

			arg_16_0()
		end,
		function(arg_17_0)
			if not arg_10_0:NextStage(var_0_3) then
				return
			end

			parallelAsync({
				function(arg_18_0)
					arg_10_0:OnInit(var_10_0, var_10_4, arg_18_0)
				end,
				function(arg_19_0)
					arg_10_0:PlaySoundEffect(var_10_0)
					arg_10_0:StartUIAnimations(var_10_0, arg_19_0)
				end,
				function(arg_20_0)
					arg_10_0:OnEnter(var_10_0, var_10_4, arg_20_0)
				end,
				function(arg_21_0)
					arg_10_0:StartMoveNode(var_10_0, arg_21_0)
				end,
				function(arg_22_0)
					arg_10_0:UpdateIcon(var_10_0, arg_22_0)
				end,
				function(arg_23_0)
					arg_10_0:SetLocation(var_10_0, arg_23_0)
				end,
				function(arg_24_0)
					if arg_10_0:DispatcherEvent(var_10_0, arg_24_0) then
						arg_10_0.autoNext = true
						var_10_3 = 0
					end
				end
			}, arg_17_0)
		end,
		function(arg_25_0)
			arg_10_0:ClearCheckDispatcher()

			if not arg_10_0:NextStage(var_0_4) then
				return
			end

			if not var_10_0:ShouldDelayEvent() then
				arg_25_0()

				return
			end

			arg_10_0:DelayCall(var_10_0:GetEventDelayTime(), arg_25_0)
		end,
		function(arg_26_0)
			if not arg_10_0:NextStage(var_0_5) then
				return
			end

			if arg_10_0.skipOption then
				arg_26_0()

				return
			end

			if var_10_0:SkipEventForOption() then
				arg_26_0()

				return
			end

			if arg_10_0:ShouldAutoTrigger() then
				arg_10_0:UnscaleDelayCall(var_10_3, arg_26_0)

				return
			end

			arg_10_0:RegisetEvent(var_10_0, arg_26_0)
			arg_10_0:TriggerEventIfAuto(var_10_3)
		end,
		function(arg_27_0)
			if not arg_10_0:NextStage(var_0_6) then
				return
			end

			if not var_10_0:ExistOption() then
				arg_27_0()

				return
			end

			if arg_10_0.skipOption then
				arg_10_0.skipOption = false

				arg_27_0()

				return
			end

			arg_10_0:InitBranches(arg_10_1, var_10_0, function(arg_28_0)
				arg_27_0()
			end, function()
				arg_10_0:TriggerOptionIfAuto(var_10_3, var_10_0)
			end)
		end,
		function(arg_30_0)
			if not arg_10_0:NextStage(var_0_7) then
				return
			end

			arg_10_0.autoNext = nil

			local var_30_0 = arg_10_1:GetNextStep(arg_10_2)

			seriesAsync({
				function(arg_31_0)
					arg_10_0:ClearAnimation()
					arg_10_0:ClearApplyEffect()
					arg_10_0:OnWillExit(var_10_0, var_30_0, arg_31_0)
				end,
				function(arg_32_0)
					parallelAsync({
						function(arg_33_0)
							if not var_30_0 then
								arg_33_0()

								return
							end

							arg_10_0:Flashout(var_30_0, arg_33_0)
						end,
						function(arg_34_0)
							if var_30_0 then
								arg_34_0()

								return
							end

							arg_10_0:FadeOutStory(arg_10_0.script, arg_34_0)
						end
					}, arg_32_0)
				end
			}, arg_30_0)
		end,
		function(arg_35_0)
			if not arg_10_0:NextStage(var_0_8) then
				return
			end

			arg_10_0:OnWillClear(var_10_0)
			arg_10_0:Clear(arg_35_0)
		end
	}, arg_10_3)
end

function var_0_0.NextStage(arg_36_0, arg_36_1)
	if arg_36_0.stage == arg_36_1 - 1 then
		arg_36_0.stage = arg_36_1

		return true
	end

	return false
end

function var_0_0.ApplyEffects(arg_37_0, arg_37_1, arg_37_2)
	if arg_37_1:ShouldShake() then
		arg_37_0:ApplyShakeEffect(arg_37_1)
	end

	arg_37_2()
end

function var_0_0.ApplyShakeEffect(arg_38_0, arg_38_1)
	if not arg_38_1:ShouldShake() then
		return
	end

	arg_38_0.animationPlayer:Play("anim_storyrecordUI_shake_loop")

	local var_38_0 = arg_38_1:GetShakeTime()

	arg_38_0.playingShakeAnim = true

	arg_38_0:DelayCall(var_38_0, function()
		arg_38_0:ClearShakeEffect()
	end)
end

function var_0_0.ClearShakeEffect(arg_40_0)
	if arg_40_0.playingShakeAnim then
		arg_40_0.animationPlayer:Play("anim_storyrecordUI_shake_reset")

		arg_40_0.playingShakeAnim = nil
	end
end

function var_0_0.ClearApplyEffect(arg_41_0)
	arg_41_0:ClearShakeEffect()
end

function var_0_0.DispatcherEvent(arg_42_0, arg_42_1, arg_42_2)
	if not arg_42_1:ExistDispatcher() then
		arg_42_2()

		return
	end

	local var_42_0 = arg_42_1:GetDispatcher()

	pg.NewStoryMgr.GetInstance():ClearStoryEvent()
	pg.m02:sendNotification(var_42_0.name, {
		data = var_42_0.data,
		callbackData = var_42_0.callbackData,
		flags = arg_42_0.branchCodeList[arg_42_1:GetId()] or {}
	})

	if arg_42_1:ShouldHideUI() then
		setActive(arg_42_0._tf, false)
	end

	if arg_42_1:IsRecallDispatcher() then
		arg_42_0:CheckDispatcher(arg_42_1, arg_42_2)
	else
		arg_42_2()
	end

	return var_42_0.nextOne
end

function var_0_0.WaitForEvent(arg_43_0)
	return arg_43_0.checkTimer ~= nil
end

function var_0_0.CheckDispatcher(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_1:GetDispatcherRecallName()

	arg_44_0:ClearCheckDispatcher()

	arg_44_0.checkTimer = Timer.New(function()
		if pg.NewStoryMgr.GetInstance():CheckStoryEvent(var_44_0) then
			local var_45_0 = pg.NewStoryMgr.GetInstance():GetStoryEventArg(var_44_0)

			if var_45_0 then
				existCall(var_45_0.notifiCallback)
			end

			if var_45_0 and var_45_0.optionIndex then
				arg_44_0:SetBranchCode(arg_44_0.script, arg_44_1, var_45_0.optionIndex)

				arg_44_0.skipOption = true
			end

			if arg_44_1:ShouldHideUI() then
				setActive(arg_44_0._tf, true)
			end

			arg_44_0:ClearCheckDispatcher()
			arg_44_2()
		end
	end, 1, -1)

	arg_44_0.checkTimer:Start()
	arg_44_0.checkTimer.func()
end

function var_0_0.ClearCheckDispatcher(arg_46_0)
	if arg_46_0.checkTimer then
		arg_46_0.checkTimer:Stop()

		arg_46_0.checkTimer = nil
	end
end

function var_0_0.TriggerEventIfAuto(arg_47_0, arg_47_1)
	if not arg_47_0:ShouldAutoTrigger() then
		return
	end

	arg_47_0:UnscaleDelayCall(arg_47_1, function()
		if not arg_47_0.autoNext then
			setButtonEnabled(arg_47_0._go, true)

			return
		end

		triggerButton(arg_47_0._go)
	end)
end

function var_0_0.TriggerOptionIfAuto(arg_49_0, arg_49_1, arg_49_2)
	if not arg_49_0:ShouldAutoTrigger() then
		return
	end

	if not arg_49_2 or not arg_49_2:ExistOption() then
		return
	end

	arg_49_0:UnscaleDelayCall(arg_49_1, function()
		if not arg_49_0.autoNext then
			return
		end

		local var_50_0 = arg_49_2:GetOptionIndexByAutoSel()

		if var_50_0 ~= nil then
			local var_50_1 = arg_49_0:GetOptionContainer(arg_49_2).container:GetChild(var_50_0 - 1)

			triggerButton(var_50_1)
		end
	end)
end

function var_0_0.ShouldAutoTrigger(arg_51_0)
	if arg_51_0.pause or arg_51_0.stop then
		return false
	end

	return arg_51_0.autoNext
end

function var_0_0.CanSkip(arg_52_0)
	return arg_52_0.step and not arg_52_0.step:IsImport()
end

function var_0_0.CancelAuto(arg_53_0)
	arg_53_0.autoNext = false
end

function var_0_0.NextOne(arg_54_0)
	arg_54_0.timeScale = 0.0001

	if arg_54_0.stage == var_0_1 then
		arg_54_0.autoNext = true
	elseif arg_54_0.stage == var_0_5 then
		arg_54_0.autoNext = true

		arg_54_0:TriggerEventIfAuto(0)
	elseif arg_54_0.stage == var_0_6 then
		arg_54_0:TriggerOptionIfAuto(0, arg_54_0.step)
	end
end

function var_0_0.NextOneImmediately(arg_55_0)
	local var_55_0 = arg_55_0.callback

	if var_55_0 then
		arg_55_0:ClearAnimation()
		arg_55_0:Clear()
		var_55_0()
	end
end

function var_0_0.SetLocation(arg_56_0, arg_56_1, arg_56_2)
	if not arg_56_1:ExistLocation() then
		arg_56_0.locationAniEvent:SetEndEvent(nil)
		arg_56_2()

		return
	end

	setActive(arg_56_0.locationTr, true)

	local var_56_0 = arg_56_1:GetLocation()

	arg_56_0.locationTxt.text = var_56_0.text

	local function var_56_1()
		arg_56_0:DelayCall(var_56_0.time, function()
			arg_56_0.locationAnim:Play("anim_newstoryUI_iocation_out")

			arg_56_0.locationStatus = var_0_11
		end)
	end

	arg_56_0.locationAniEvent:SetEndEvent(function()
		if arg_56_0.locationStatus == var_0_10 then
			var_56_1()
			arg_56_2()
		elseif arg_56_0.locationStatus == var_0_11 then
			setActive(arg_56_0.locationTr, false)

			arg_56_0.locationStatus = var_0_9
		end
	end)
	arg_56_0.locationAnim:Play("anim_newstoryUI_iocation_in")

	arg_56_0.locationStatus = var_0_10
end

function var_0_0.UpdateIcon(arg_60_0, arg_60_1, arg_60_2)
	if not arg_60_1:ExistIcon() then
		setActive(arg_60_0.iconImage.gameObject, false)
		arg_60_2()

		return
	end

	local var_60_0 = arg_60_1:GetIconData()

	arg_60_0.iconImage.sprite = LoadSprite(var_60_0.image)

	arg_60_0.iconImage:SetNativeSize()

	local var_60_1 = arg_60_0.iconImage.gameObject.transform

	if var_60_0.pos then
		var_60_1.localPosition = Vector3(var_60_0.pos[1], var_60_0.pos[2], 0)
	else
		var_60_1.localPosition = Vector3.one
	end

	var_60_1.localScale = Vector3(var_60_0.scale or 1, var_60_0.scale or 1, 1)

	setActive(arg_60_0.iconImage.gameObject, true)
	arg_60_2()
end

function var_0_0.UpdateOptionTxt(arg_61_0, arg_61_1, arg_61_2, arg_61_3, arg_61_4)
	local var_61_0 = arg_61_2:GetComponent(typeof(LayoutElement))
	local var_61_1 = arg_61_2:Find("content")

	if arg_61_1 then
		local var_61_2 = GetPerceptualSize(arg_61_3)
		local var_61_3 = arg_61_2:Find("content_max")
		local var_61_4 = var_61_2 >= 17
		local var_61_5 = var_61_4 and var_61_3 or var_61_1

		setActive(var_61_1, not var_61_4)
		setActive(var_61_3, var_61_4)
		setText(var_61_5:Find("Text"), arg_61_3)

		var_61_0.preferredHeight = var_61_5.rect.height
	else
		setText(var_61_1:Find("Text"), arg_61_3)

		var_61_0.preferredHeight = var_61_1.rect.height
	end

	arg_61_0:UpdateOptionBGWithTB(var_61_1, arg_61_4)
end

function var_0_0.UpdateOptionBGWithTB(arg_62_0, arg_62_1, arg_62_2)
	local var_62_0 = getProxy(NewEducateProxy):GetCurChar()
	local var_62_1 = arg_62_1:Find("type1")
	local var_62_2 = arg_62_1:Find("type2")

	if var_62_1 then
		setActive(var_62_1, false)
	end

	if var_62_2 then
		setActive(var_62_2, false)
	end

	if var_62_0 and var_62_1 then
		local var_62_3 = arg_62_2 and arg_62_2 == 1

		if var_62_3 then
			local var_62_4 = var_62_0:GetPersonalityTagOptionBg(arg_62_2)

			LoadImageSpriteAsync("neweducateicon/" .. var_62_4, var_62_1)
		end

		setActive(var_62_1, var_62_3)
	end

	if var_62_0 and var_62_2 then
		local var_62_5 = arg_62_2 and arg_62_2 == 2

		if var_62_5 then
			local var_62_6 = var_62_0:GetPersonalityTagOptionBg(arg_62_2)

			LoadImageSpriteAsync("neweducateicon/" .. var_62_6, var_62_2)
		end

		setActive(var_62_2, var_62_5)
	end

	if arg_62_1:Find("type3") then
		if arg_62_2 and arg_62_2 == 3 then
			arg_62_1:Find("Text").localPosition = Vector2(20, 0)

			setActive(arg_62_1:Find("type3"), true)
		else
			arg_62_1:Find("Text").localPosition = Vector2.zero

			setActive(arg_62_1:Find("type3"), false)
		end
	end

	if arg_62_2 and arg_62_2 == 3 and arg_62_1:Find("icon") then
		setActive(arg_62_1:Find("icon"), false)

		local var_62_7 = GetSpriteFromAtlas("ui/story_atlas", "option_bg_left_global")

		setImageSprite(arg_62_1, var_62_7)
	end
end

function var_0_0.InitBranches(arg_63_0, arg_63_1, arg_63_2, arg_63_3, arg_63_4)
	local var_63_0 = false
	local var_63_1 = arg_63_2:GetOptions()
	local var_63_2, var_63_3 = arg_63_0:GetOptionContainer(arg_63_2)
	local var_63_4 = arg_63_2:GetId()
	local var_63_5 = arg_63_0.branchCodeList[var_63_4] or {}
	local var_63_6 = GetOrAddComponent(var_63_2.container, typeof(CanvasGroup))

	var_63_6.blocksRaycasts = true
	arg_63_0.selectedBranchID = nil

	var_63_2:make(function(arg_64_0, arg_64_1, arg_64_2)
		if arg_64_0 == UIItemList.EventUpdate then
			local var_64_0 = arg_64_2
			local var_64_1 = var_63_1[arg_64_1 + 1][1]
			local var_64_2 = var_63_1[arg_64_1 + 1][2]
			local var_64_3 = var_63_1[arg_64_1 + 1][3]
			local var_64_4 = var_63_1[arg_64_1 + 1][4]
			local var_64_5 = table.contains(var_63_5, var_64_2)

			onButton(arg_63_0, var_64_0, function()
				if arg_63_0.pause or arg_63_0.stop then
					return
				end

				if not var_63_0 then
					return
				end

				var_63_0 = false

				seriesAsync({
					function(arg_66_0)
						arg_63_0:PlayOptionEffect(arg_63_1, arg_63_2, arg_64_1, arg_64_2, var_64_1, var_64_2, var_64_4, var_63_6, var_63_0, arg_66_0)
					end
				}, function()
					pg.m02:sendNotification(STORY_EVENT.OPTION_SELECTED, {
						optionalFlag = var_64_2
					})
					arg_63_3(var_64_1)
				end)
			end, SFX_PANEL)
			setButtonEnabled(var_64_0, not var_64_5)

			GetOrAddComponent(arg_64_2, typeof(CanvasGroup)).alpha = var_64_5 and 0.5 or 1

			if var_64_4 then
				var_64_3 = 3
			end

			arg_63_0:UpdateOptionTxt(var_63_3, var_64_0, var_64_1, var_64_3)

			if arg_63_0.script:IsDialogueStyle2() then
				setActive(var_64_0, arg_64_1 == 0)

				if arg_64_1 > 0 then
					LeanTween.delayedCall(0.066 * arg_64_1, System.Action(function()
						setActive(var_64_0, true)
					end))
				end
			end
		end
	end)
	var_63_2:align(#var_63_1)
	arg_63_0:ShowBranches(arg_63_2, function()
		var_63_0 = true

		if arg_63_4 then
			arg_63_4()
		end
	end)
end

function var_0_0.PlayOptionEffect(arg_70_0, arg_70_1, arg_70_2, arg_70_3, arg_70_4, arg_70_5, arg_70_6, arg_70_7, arg_70_8, arg_70_9, arg_70_10)
	local var_70_0, var_70_1 = arg_70_2:GetOptionEffects()

	if not var_70_0 or #var_70_0 <= 0 then
		arg_70_0:OnBranchSelected(arg_70_1, arg_70_2, arg_70_3, arg_70_4, arg_70_5, arg_70_6, arg_70_7, arg_70_8, arg_70_9, arg_70_10)

		return
	end

	local var_70_2 = var_70_0[1]
	local var_70_3 = var_70_0[2]
	local var_70_4 = var_70_1 == StoryStep.OPTION_ANIM_ONLY_BTN or var_70_1 == StoryStep.OPTION_ANIM_BOTH
	local var_70_5 = var_70_1 == StoryStep.OPTION_ANIM_ONLY_ICON or var_70_1 == StoryStep.OPTION_ANIM_BOTH
	local var_70_6 = PoolMgr.GetInstance()

	local function var_70_7(arg_71_0, arg_71_1, arg_71_2)
		var_70_6:GetUI(arg_71_0, true, function(arg_72_0)
			local var_72_0 = arg_72_0.transform

			setParent(var_72_0, arg_71_1, false)

			local var_72_1 = var_72_0:GetComponent(typeof(DftAniEvent))

			var_72_1:SetEndEvent(function()
				var_72_1:SetEndEvent(nil)
				var_70_6:ReturnUI(arg_71_0, arg_72_0)
				arg_71_2()
			end)
			setActive(var_72_0, true)
		end)
	end

	local var_70_8 = {}

	if var_70_4 then
		table.insert(var_70_8, function(arg_74_0)
			var_70_7(var_70_2, arg_70_4, arg_74_0)
		end)
	end

	table.insert(var_70_8, function(arg_75_0)
		arg_70_0:OnBranchSelected(arg_70_1, arg_70_2, arg_70_3, arg_70_4, arg_70_5, arg_70_6, arg_70_7, arg_70_8, arg_70_9, arg_75_0)
	end)

	local var_70_9 = {
		function(arg_76_0)
			seriesAsync(var_70_8, arg_76_0)
		end
	}

	if var_70_5 then
		table.insert(var_70_9, function(arg_77_0)
			var_70_7(var_70_3, arg_70_0.frontTr, arg_77_0)
		end)
	end

	arg_70_8.blocksRaycasts = false

	parallelAsync(var_70_9, function()
		arg_70_8.blocksRaycasts = true

		arg_70_10()
	end)
end

function var_0_0.OnBranchSelected(arg_79_0, arg_79_1, arg_79_2, arg_79_3, arg_79_4, arg_79_5, arg_79_6, arg_79_7, arg_79_8, arg_79_9, arg_79_10)
	arg_79_0.selectedBranchID = arg_79_3

	arg_79_0:SetBranchCode(arg_79_1, arg_79_2, arg_79_6)

	if arg_79_7 then
		arg_79_0:SetGlobalOptionFlag(arg_79_7)
	end

	pg.NewStoryMgr.GetInstance():TrackingOption(arg_79_2:GetOptionIndex(), arg_79_6)

	local var_79_0 = arg_79_4:GetComponent(typeof(Animation))

	if var_79_0 then
		arg_79_8.blocksRaycasts = false

		var_79_0:Play(arg_79_0.script:GetAnimPrefix() .. "confirm")
		arg_79_4:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
			setActive(arg_79_0.optionsCg.gameObject, false)

			arg_79_8.blocksRaycasts = true

			arg_79_0:HideBranchesWithoutSelected(arg_79_2)
			arg_79_10()
		end)
	else
		setActive(arg_79_0.optionsCg.gameObject, false)
		arg_79_0:HideBranchesWithoutSelected(arg_79_2)
		arg_79_10()
	end
end

function var_0_0.SetBranchCode(arg_81_0, arg_81_1, arg_81_2, arg_81_3)
	arg_81_2:SetBranchCode(arg_81_3)
	arg_81_1:SetBranchCode(arg_81_3)

	local var_81_0 = arg_81_2:GetId()

	if not arg_81_0.branchCodeList[var_81_0] then
		arg_81_0.branchCodeList[var_81_0] = {}
	end

	table.insert(arg_81_0.branchCodeList[var_81_0], arg_81_3)
end

function var_0_0.SetGlobalOptionFlag(arg_82_0, arg_82_1)
	local var_82_0 = StoryStep.GetGlobalFlagKey(arg_82_1.flagID) .. arg_82_1.flagIndex

	PlayerPrefs.SetInt(var_82_0, arg_82_1.flagValue)
end

function var_0_0.ShowBranches(arg_83_0, arg_83_1, arg_83_2)
	setActive(arg_83_0.optionsCg.gameObject, true)

	local var_83_0 = arg_83_0:GetOptionContainer(arg_83_1)

	for iter_83_0 = 0, var_83_0.container.childCount - 1 do
		local var_83_1 = var_83_0.container:GetChild(iter_83_0):GetComponent(typeof(Animation))

		if var_83_1 then
			var_83_1:Play(arg_83_0.script:GetAnimPrefix() .. "in")
		end
	end

	arg_83_2()
end

function var_0_0.HideBranchesWithoutSelected(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_0:GetOptionContainer(arg_84_1)

	for iter_84_0 = 0, var_84_0.container.childCount - 1 do
		if iter_84_0 ~= arg_84_0.selectedBranchID then
			local var_84_1 = var_84_0.container:GetChild(iter_84_0):GetComponent(typeof(Animation))

			if var_84_1 then
				var_84_1:Play(arg_84_0.script:GetAnimPrefix() .. "unselected")
			end
		end
	end
end

function var_0_0.StartMoveNode(arg_85_0, arg_85_1, arg_85_2)
	if not arg_85_1:ExistMovableNode() then
		arg_85_2()

		return
	end

	local var_85_0 = arg_85_1:GetMovableNode()
	local var_85_1 = {}
	local var_85_2 = {}

	for iter_85_0, iter_85_1 in pairs(var_85_0) do
		table.insert(var_85_1, function(arg_86_0)
			arg_85_0:LoadMovableNode(iter_85_1, function(arg_87_0)
				var_85_2[iter_85_0] = arg_87_0

				arg_86_0()
			end)
		end)
	end

	parallelAsync(var_85_1, function()
		arg_85_0:MoveAllNode(arg_85_1, var_85_2, var_85_0)
		arg_85_2()
	end)
end

function var_0_0.MoveAllNode(arg_89_0, arg_89_1, arg_89_2, arg_89_3)
	local var_89_0 = {}

	for iter_89_0, iter_89_1 in pairs(arg_89_2) do
		table.insert(var_89_0, function(arg_90_0)
			local var_90_0 = arg_89_3[iter_89_0]
			local var_90_1 = var_90_0.path
			local var_90_2 = var_90_0.time
			local var_90_3 = var_90_0.easeType
			local var_90_4 = var_90_0.delay

			arg_89_0:moveLocalPath(iter_89_1, var_90_1, var_90_2, var_90_4, var_90_3, arg_90_0)
		end)
	end

	arg_89_0.moveTargets = arg_89_2

	parallelAsync(var_89_0, function()
		arg_89_0:ClearMoveNodes(arg_89_1)
	end)
end

local function var_0_12(arg_92_0, arg_92_1, arg_92_2, arg_92_3, arg_92_4)
	arg_92_0.spineChar = SpineAnimChar.New()

	arg_92_0.spineChar:SetPaint(arg_92_1)
	arg_92_0.spineChar:Load(true, function(arg_93_0)
		arg_93_0:SetParent(arg_92_0.movePanel)
		arg_93_0:SetLocalScale(Vector3(arg_92_2.scale, arg_92_2.scale, 0))
		arg_93_0:SetLocalPosition(arg_92_3)
		arg_93_0:SetAction(arg_92_2.action, 0)
		arg_93_0:SetName(arg_92_1)

		if arg_92_4 then
			arg_92_4(arg_92_0.spineChar:GetModel())
		end
	end)
end

local function var_0_13(arg_94_0, arg_94_1, arg_94_2, arg_94_3)
	local var_94_0 = GameObject.New("movable")

	var_94_0.transform:SetParent(arg_94_0.movePanel)

	var_94_0.transform.localScale = Vector3.zero

	local var_94_1 = GetOrAddComponent(var_94_0, typeof(RectTransform))
	local var_94_2 = GetOrAddComponent(var_94_0, typeof(Image))

	LoadSpriteAsync(arg_94_1, function(arg_95_0)
		var_94_2.sprite = arg_95_0

		var_94_2:SetNativeSize()

		var_94_1.localScale = Vector3.one
		var_94_1.localPosition = arg_94_2

		arg_94_3(var_94_1.gameObject)
	end)
end

function var_0_0.LoadMovableNode(arg_96_0, arg_96_1, arg_96_2)
	local var_96_0 = arg_96_1.path[1] or Vector3.zero

	if arg_96_1.isSpine then
		var_0_12(arg_96_0, arg_96_1.name, arg_96_1.spineData, var_96_0, arg_96_2)
	else
		var_0_13(arg_96_0, arg_96_1.name, var_96_0, arg_96_2)
	end
end

function var_0_0.ClearMoveNodes(arg_97_0, arg_97_1)
	if not arg_97_1:ExistMovableNode() then
		return
	end

	if arg_97_0.movePanel.childCount <= 0 then
		return
	end

	for iter_97_0, iter_97_1 in ipairs(arg_97_0.moveTargets or {}) do
		if iter_97_1:GetComponent(typeof(SpineAnimUI)) ~= nil then
			PoolMgr.GetInstance():ReturnSpineChar(iter_97_1.name, iter_97_1.gameObject)
		else
			Destroy(arg_97_0.movePanel:GetChild(iter_97_0 - 1))
		end
	end

	arg_97_0.moveTargets = {}
end

function var_0_0.FadeOutStory(arg_98_0, arg_98_1, arg_98_2)
	if not arg_98_1:ShouldFadeout() then
		arg_98_2()

		return
	end

	local var_98_0 = arg_98_1:GetFadeoutTime()

	if not arg_98_1:ShouldWaitFadeout() then
		arg_98_0:fadeTransform(arg_98_0._go, 1, 0.3, var_98_0, true)
		arg_98_2()
	else
		arg_98_0:fadeTransform(arg_98_0._go, 1, 0.3, var_98_0, true, arg_98_2)
	end
end

function var_0_0.GetFadeColor(arg_99_0, arg_99_1)
	local var_99_0 = {}
	local var_99_1 = {}
	local var_99_2 = arg_99_1:GetComponentsInChildren(typeof(Image)):ToTable()

	for iter_99_0, iter_99_1 in ipairs(var_99_2) do
		local var_99_3 = {
			name = "_Color",
			color = Color.white
		}

		if iter_99_1.material.shader.name == "UI/GrayScale" then
			var_99_3 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif iter_99_1.material.shader.name == "UI/Line_Add_Blue" then
			var_99_3 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(var_99_1, var_99_3)

		if iter_99_1.material == iter_99_1.defaultGraphicMaterial then
			iter_99_1.material = Material.Instantiate(iter_99_1.defaultGraphicMaterial)
		end

		table.insert(var_99_0, iter_99_1.material)
	end

	return var_99_0, var_99_1
end

function var_0_0._SetFadeColor(arg_100_0, arg_100_1, arg_100_2, arg_100_3)
	for iter_100_0, iter_100_1 in ipairs(arg_100_1) do
		if not IsNil(iter_100_1) then
			iter_100_1:SetColor(arg_100_2[iter_100_0].name, arg_100_2[iter_100_0].color * Color.New(arg_100_3, arg_100_3, arg_100_3))
		end
	end
end

function var_0_0.SetFadeColor(arg_101_0, arg_101_1, arg_101_2)
	local var_101_0, var_101_1 = arg_101_0:GetFadeColor(arg_101_1)

	arg_101_0:_SetFadeColor(var_101_0, var_101_1, arg_101_2)
end

function var_0_0._RevertFadeColor(arg_102_0, arg_102_1, arg_102_2)
	arg_102_0:_SetFadeColor(arg_102_1, arg_102_2, 1)
end

function var_0_0.RevertFadeColor(arg_103_0, arg_103_1)
	local var_103_0, var_103_1 = arg_103_0:GetFadeColor(arg_103_1)

	arg_103_0:_RevertFadeColor(var_103_0, var_103_1)
end

function var_0_0.fadeTransform(arg_104_0, arg_104_1, arg_104_2, arg_104_3, arg_104_4, arg_104_5, arg_104_6)
	if arg_104_4 <= 0 then
		if arg_104_6 then
			arg_104_6()
		end

		return
	end

	local var_104_0, var_104_1 = arg_104_0:GetFadeColor(arg_104_1)

	LeanTween.value(go(arg_104_1), arg_104_2, arg_104_3, arg_104_4):setOnUpdate(System.Action_float(function(arg_105_0)
		arg_104_0:_SetFadeColor(var_104_0, var_104_1, arg_105_0)
	end)):setOnComplete(System.Action(function()
		if arg_104_5 then
			arg_104_0:_RevertFadeColor(var_104_0, var_104_1)
		end

		if arg_104_6 then
			arg_104_6()
		end
	end))
end

function var_0_0.setPaintingAlpha(arg_107_0, arg_107_1, arg_107_2)
	local var_107_0 = {}
	local var_107_1 = {}
	local var_107_2 = arg_107_1:GetComponentsInChildren(typeof(Image)):ToTable()

	for iter_107_0, iter_107_1 in ipairs(var_107_2) do
		local var_107_3 = {
			name = "_Color",
			color = Color.white
		}

		if iter_107_1.material.shader.name == "UI/GrayScale" then
			var_107_3 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif iter_107_1.material.shader.name == "UI/Line_Add_Blue" then
			var_107_3 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(var_107_1, var_107_3)

		if iter_107_1.material == iter_107_1.defaultGraphicMaterial then
			iter_107_1.material = Material.Instantiate(iter_107_1.defaultGraphicMaterial)
		end

		table.insert(var_107_0, iter_107_1.material)
	end

	for iter_107_2, iter_107_3 in ipairs(var_107_0) do
		if not IsNil(iter_107_3) then
			iter_107_3:SetColor(var_107_1[iter_107_2].name, var_107_1[iter_107_2].color * Color.New(arg_107_2, arg_107_2, arg_107_2))
		end
	end
end

function var_0_0.RegisetEvent(arg_108_0, arg_108_1, arg_108_2)
	setButtonEnabled(arg_108_0._go, not arg_108_0.autoNext)
	onButton(arg_108_0, arg_108_0._go, function()
		if arg_108_0.pause or arg_108_0.stop then
			return
		end

		removeOnButton(arg_108_0._go)
		arg_108_2()
	end, SFX_PANEL)
end

function var_0_0.flashEffect(arg_110_0, arg_110_1, arg_110_2, arg_110_3, arg_110_4, arg_110_5, arg_110_6)
	arg_110_0.flashImg.color = arg_110_4 and Color(0, 0, 0) or Color(1, 1, 1)
	arg_110_0.flashCg.alpha = arg_110_1

	setActive(arg_110_0.flash, true)
	arg_110_0:TweenValueForcanvasGroup(arg_110_0.flashCg, arg_110_1, arg_110_2, arg_110_3, arg_110_5, arg_110_6)
end

function var_0_0.Flashout(arg_111_0, arg_111_1, arg_111_2)
	local var_111_0, var_111_1, var_111_2, var_111_3 = arg_111_1:GetFlashoutData()

	if not var_111_0 then
		arg_111_2()

		return
	end

	arg_111_0:flashEffect(var_111_0, var_111_1, var_111_2, var_111_3, 0, arg_111_2)
end

function var_0_0.flashin(arg_112_0, arg_112_1, arg_112_2)
	local var_112_0, var_112_1, var_112_2, var_112_3, var_112_4 = arg_112_1:GetFlashinData()

	if not var_112_0 then
		arg_112_2()

		return
	end

	arg_112_0:flashEffect(var_112_0, var_112_1, var_112_2, var_112_3, var_112_4, arg_112_2)
end

function var_0_0.UpdateBg(arg_113_0, arg_113_1)
	if arg_113_1:ShouldBgGlitchArt() then
		arg_113_0:SetBgGlitchArt(arg_113_1)
	else
		local var_113_0 = arg_113_1:GetBgName()

		if var_113_0 then
			setActive(arg_113_0.bgPanel, true)

			arg_113_0.bgPanelCg.alpha = 1

			local var_113_1 = arg_113_0.bgImage

			var_113_1.color = Color.New(1, 1, 1)
			var_113_1.sprite = arg_113_0:GetBg(var_113_0)
		end

		local var_113_2 = arg_113_1:GetBgShadow()

		if var_113_2 then
			local var_113_3 = arg_113_0.bgImage

			arg_113_0:TweenValue(var_113_3, var_113_2[1], var_113_2[2], var_113_2[3], 0, function(arg_114_0)
				var_113_3.color = Color.New(arg_114_0, arg_114_0, arg_114_0)
			end, nil)
		end

		if arg_113_1:IsBlackBg() then
			setActive(arg_113_0.curtain, true)

			arg_113_0.curtainCg.alpha = 1
		end

		local var_113_4, var_113_5 = arg_113_1:IsBlackFrontGround()

		if var_113_4 then
			arg_113_0.curtainFCg.alpha = var_113_5
		end

		setActive(arg_113_0.curtainF, var_113_4)
	end

	arg_113_0:ApplyOldPhotoEffect(arg_113_1)
	arg_113_0:OnBgUpdate(arg_113_1)

	local var_113_6 = arg_113_1:GetBgColor()

	arg_113_0.curtain:GetComponent(typeof(Image)).color = var_113_6
end

function var_0_0.ApplyOldPhotoEffect(arg_115_0, arg_115_1)
	local var_115_0 = arg_115_1:OldPhotoEffect()
	local var_115_1 = var_115_0 ~= nil

	setActive(arg_115_0.oldPhoto.gameObject, var_115_1)

	if var_115_1 then
		if type(var_115_0) == "table" then
			arg_115_0.oldPhoto.color = Color.New(var_115_0[1], var_115_0[2], var_115_0[3], var_115_0[4])
		else
			arg_115_0.oldPhoto.color = Color.New(0.62, 0.58, 0.14, 0.36)
		end
	end
end

function var_0_0.SetBgGlitchArt(arg_116_0, arg_116_1)
	setActive(arg_116_0.bgPanel, false)
	setActive(arg_116_0.bgGlitch, true)
end

function var_0_0.GetBg(arg_117_0, arg_117_1)
	if not arg_117_0.bgs[arg_117_1] then
		arg_117_0.bgs[arg_117_1] = LoadSprite("bg/" .. arg_117_1)
	end

	return arg_117_0.bgs[arg_117_1]
end

function var_0_0.LoadEffects(arg_118_0, arg_118_1, arg_118_2)
	local var_118_0 = arg_118_1:GetEffects()

	if #var_118_0 <= 0 then
		arg_118_2()

		return
	end

	local var_118_1 = {}

	for iter_118_0, iter_118_1 in ipairs(var_118_0) do
		local var_118_2 = iter_118_1.name
		local var_118_3 = iter_118_1.active
		local var_118_4 = iter_118_1.interlayer
		local var_118_5 = iter_118_1.center
		local var_118_6 = iter_118_1.adapt
		local var_118_7 = arg_118_0.effectPanel:Find(var_118_2) or arg_118_0.centerPanel:Find(var_118_2)

		if var_118_7 then
			setActive(var_118_7, var_118_3)
			setParent(var_118_7, var_118_5 and arg_118_0.centerPanel or arg_118_0.effectPanel.transform)

			if var_118_4 then
				arg_118_0:UpdateEffectInterLayer(var_118_2, var_118_7)
			end

			if not var_118_3 then
				arg_118_0:ClearEffectInterlayer(var_118_2)
			elseif isActive(var_118_7) then
				setActive(var_118_7, false)
				setActive(var_118_7, true)
			end

			if var_118_6 then
				arg_118_0:AdaptEffect(var_118_7)
			end
		else
			local var_118_8 = ""

			if checkABExist("ui/" .. var_118_2) then
				var_118_8 = "ui"
			elseif checkABExist("effect/" .. var_118_2) then
				var_118_8 = "effect"
			end

			if var_118_8 and var_118_8 ~= "" then
				table.insert(var_118_1, function(arg_119_0)
					LoadAndInstantiateAsync(var_118_8, var_118_2, function(arg_120_0)
						setParent(arg_120_0, var_118_5 and arg_118_0.centerPanel or arg_118_0.effectPanel.transform)

						arg_120_0.transform.localScale = Vector3.one

						setActive(arg_120_0, var_118_3)

						arg_120_0.name = var_118_2

						if var_118_4 then
							arg_118_0:UpdateEffectInterLayer(var_118_2, arg_120_0)
						end

						if var_118_3 == false then
							arg_118_0:ClearEffectInterlayer(var_118_2)
						end

						if var_118_6 then
							arg_118_0:AdaptEffect(arg_120_0)
						end

						arg_119_0()
					end)
				end)
			else
				originalPrint("not found effect", var_118_2)
			end
		end
	end

	parallelAsync(var_118_1, arg_118_2)
end

function var_0_0.AdaptEffect(arg_121_0, arg_121_1)
	local var_121_0 = 1.7777777777777777
	local var_121_1 = pg.UIMgr.GetInstance().OverlayMain.parent.sizeDelta
	local var_121_2 = var_121_1.x / var_121_1.y
	local var_121_3 = 1

	if var_121_0 < var_121_2 then
		var_121_3 = var_121_2 / var_121_0
	else
		var_121_3 = var_121_0 / var_121_2
	end

	tf(arg_121_1).localScale = Vector3(var_121_3, var_121_3, var_121_3)
end

function var_0_0.UpdateEffectInterLayer(arg_122_0, arg_122_1, arg_122_2)
	local var_122_0 = arg_122_0._go:GetComponent(typeof(Canvas)).sortingOrder
	local var_122_1 = arg_122_2:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer")):ToTable()

	for iter_122_0, iter_122_1 in ipairs(var_122_1) do
		local var_122_2 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_122_1)

		if var_122_0 < var_122_2 then
			var_122_0 = var_122_2
		end
	end

	local var_122_3 = var_122_0 + 1
	local var_122_4 = GetOrAddComponent(arg_122_0.actorTr, typeof(Canvas))

	var_122_4.overrideSorting = true
	var_122_4.sortingOrder = var_122_3

	local var_122_5 = GetOrAddComponent(arg_122_0.frontTr, typeof(Canvas))

	var_122_5.overrideSorting = true
	var_122_5.sortingOrder = var_122_3 + 10
	arg_122_0.activeInterLayer = arg_122_1

	GetOrAddComponent(arg_122_0.frontTr, typeof(GraphicRaycaster))
end

function var_0_0.ClearEffectInterlayer(arg_123_0, arg_123_1)
	if arg_123_0.activeInterLayer == arg_123_1 then
		RemoveComponent(arg_123_0.frontTr, "GraphicRaycaster")
		RemoveComponent(arg_123_0.actorTr, "Canvas")
		RemoveComponent(arg_123_0.frontTr, "Canvas")

		arg_123_0.activeInterLayer = nil
	end
end

function var_0_0.ClearEffects(arg_124_0)
	removeAllChildren(arg_124_0.effectPanel)
	removeAllChildren(arg_124_0.centerPanel)

	if arg_124_0.activeInterLayer ~= nil then
		arg_124_0:ClearEffectInterlayer(arg_124_0.activeInterLayer)
	end
end

function var_0_0.PlaySoundEffect(arg_125_0, arg_125_1)
	if arg_125_1:ShouldPlaySoundEffect() then
		local var_125_0, var_125_1 = arg_125_1:GetSoundeffect()

		arg_125_0:DelayCall(var_125_1, function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_125_0)
		end)
	end

	if arg_125_1:ShouldPlayVoice() then
		arg_125_0:PlayVoice(arg_125_1)
	elseif arg_125_1:ShouldStopVoice() then
		arg_125_0:StopVoice()
	end
end

function var_0_0.StopVoice(arg_127_0)
	if arg_127_0.currentVoice then
		arg_127_0.currentVoice:Stop(true)

		arg_127_0.currentVoice = nil
	end
end

function var_0_0.PlayVoice(arg_128_0, arg_128_1)
	if arg_128_0.voiceDelayTimer then
		arg_128_0.voiceDelayTimer:Stop()

		arg_128_0.voiceDelayTimer = nil
	end

	arg_128_0:StopVoice()

	local var_128_0, var_128_1 = arg_128_1:GetVoice()
	local var_128_2

	var_128_2 = arg_128_0:CreateDelayTimer(var_128_1, function()
		if var_128_2 then
			var_128_2:Stop()
		end

		if arg_128_0.voiceDelayTimer then
			arg_128_0.voiceDelayTimer = nil
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_128_0, function(arg_130_0)
			if arg_130_0 then
				arg_128_0.currentVoice = arg_130_0.playback
			end
		end)
	end)
	arg_128_0.voiceDelayTimer = var_128_2
end

function var_0_0.Reset(arg_131_0, arg_131_1, arg_131_2, arg_131_3)
	setActive(arg_131_0.spAnimPanel, false)
	setActive(arg_131_0.castPanel, false)
	setActive(arg_131_0.bgPanel, false)
	setActive(arg_131_0.frontTr, true)

	if arg_131_1 and arg_131_1:IsDialogueMode() and arg_131_2 and arg_131_2:IsDialogueMode() then
		-- block empty
	else
		setActive(arg_131_0.dialoguePanel, false)
	end

	setActive(arg_131_0.asidePanel, false)
	setActive(arg_131_0.curtain, false)
	setActive(arg_131_0.flash, false)
	setActive(arg_131_0.optionsCg.gameObject, false)
	setActive(arg_131_0.bgGlitch, false)
	setActive(arg_131_0.locationTr, false)

	arg_131_0.locationTr.localPosition = arg_131_0.locationTrPos
	arg_131_0.locationStatus = var_0_9
	arg_131_0.flashCg.alpha = 1
	arg_131_0.goCG.alpha = 1

	arg_131_0.animationPlayer:Stop()
	arg_131_0:OnReset(arg_131_1, arg_131_2, arg_131_3)
end

function var_0_0.Clear(arg_132_0, arg_132_1)
	if arg_132_0.step then
		arg_132_0:ClearMoveNodes(arg_132_0.step)
	end

	arg_132_0.bgs = {}
	arg_132_0.skipOption = nil
	arg_132_0.step = nil
	arg_132_0.goCG.alpha = 1
	arg_132_0.callback = nil
	arg_132_0.autoNext = nil
	arg_132_0.script = nil
	arg_132_0.bgImage.sprite = nil

	arg_132_0:OnClear()

	if arg_132_1 then
		arg_132_1()
	end

	pg.DelegateInfo.New(arg_132_0)
end

function var_0_0.StoryEnd(arg_133_0, arg_133_1)
	setActive(arg_133_0.iconImage.gameObject, false)

	arg_133_0.iconImage.sprite = nil
	arg_133_0.branchCodeList = {}
	arg_133_0.stop = false
	arg_133_0.pause = false

	if arg_133_0.voiceDelayTimer then
		arg_133_0.voiceDelayTimer:Stop()

		arg_133_0.voiceDelayTimer = nil
	end

	if arg_133_0.currentVoice then
		arg_133_0.currentVoice:Stop(true)

		arg_133_0.currentVoice = nil
	end

	arg_133_0:ClearCheckDispatcher()
	arg_133_0:ClearEffects()
	arg_133_0:Clear()
	arg_133_0:OnEnd(arg_133_1)
end

function var_0_0.PlayBgm(arg_134_0, arg_134_1)
	if arg_134_1:ShouldStopBgm() then
		arg_134_0:StopBgm()
	end

	if arg_134_1:ShoulePlayBgm() then
		local var_134_0, var_134_1, var_134_2 = arg_134_1:GetBgmData()

		arg_134_0:DelayCall(var_134_1, function()
			arg_134_0:RevertBgmVolume()
			pg.BgmMgr.GetInstance():TempPlay(var_134_0)
		end)

		if var_134_2 and var_134_2 > 0 then
			arg_134_0.defaultBgmVolume = pg.CriMgr.GetInstance():getBGMVolume()

			pg.CriMgr.GetInstance():setBGMVolume(var_134_2)
		end
	end
end

function var_0_0.StopBgm(arg_136_0, arg_136_1)
	arg_136_0:RevertBgmVolume()
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.RevertBgmVolume(arg_137_0)
	if arg_137_0.defaultBgmVolume then
		pg.CriMgr.GetInstance():setBGMVolume(arg_137_0.defaultBgmVolume)

		arg_137_0.defaultBgmVolume = nil
	end
end

function var_0_0.StartUIAnimations(arg_138_0, arg_138_1, arg_138_2)
	parallelAsync({
		function(arg_139_0)
			arg_138_0:StartBlinkAnimation(arg_138_1, arg_139_0)
		end,
		function(arg_140_0)
			arg_138_0:StartBlinkWithColorAnimation(arg_138_1, arg_140_0)
		end,
		function(arg_141_0)
			arg_138_0:OnStartUIAnimations(arg_138_1, arg_141_0)
		end
	}, arg_138_2)
end

function var_0_0.StartBlinkAnimation(arg_142_0, arg_142_1, arg_142_2)
	if arg_142_1:ShouldBlink() then
		local var_142_0 = arg_142_1:GetBlinkData()
		local var_142_1 = var_142_0.black
		local var_142_2 = var_142_0.number
		local var_142_3 = var_142_0.dur
		local var_142_4 = var_142_0.delay
		local var_142_5 = var_142_0.alpha[1]
		local var_142_6 = var_142_0.alpha[2]
		local var_142_7 = var_142_0.wait

		arg_142_0.flashImg.color = var_142_1 and Color(0, 0, 0) or Color(1, 1, 1)

		setActive(arg_142_0.flash, true)

		local var_142_8 = {}

		for iter_142_0 = 1, var_142_2 do
			table.insert(var_142_8, function(arg_143_0)
				arg_142_0:TweenAlpha(arg_142_0.flash, var_142_5, var_142_6, var_142_3 / 2, 0, function()
					arg_142_0:TweenAlpha(arg_142_0.flash, var_142_6, var_142_5, var_142_3 / 2, var_142_7, arg_143_0)
				end)
			end)
		end

		seriesAsync(var_142_8, function()
			setActive(arg_142_0.flash, false)
		end)
	end

	arg_142_2()
end

function var_0_0.StartBlinkWithColorAnimation(arg_146_0, arg_146_1, arg_146_2)
	if arg_146_1:ShouldBlinkWithColor() then
		local var_146_0 = arg_146_1:GetBlinkWithColorData()
		local var_146_1 = var_146_0.color
		local var_146_2 = var_146_0.alpha

		arg_146_0.flashImg.color = Color(var_146_1[1], var_146_1[2], var_146_1[3], var_146_1[4])

		setActive(arg_146_0.flash, true)

		local var_146_3 = {}

		for iter_146_0, iter_146_1 in ipairs(var_146_2) do
			local var_146_4 = iter_146_1[1]
			local var_146_5 = iter_146_1[2]
			local var_146_6 = iter_146_1[3]
			local var_146_7 = iter_146_1[4]

			table.insert(var_146_3, function(arg_147_0)
				arg_146_0:TweenValue(arg_146_0.flash, var_146_4, var_146_5, var_146_6, var_146_7, function(arg_148_0)
					arg_146_0.flashCg.alpha = arg_148_0
				end, arg_147_0)
			end)
		end

		parallelAsync(var_146_3, function()
			setActive(arg_146_0.flash, false)
		end)
	end

	arg_146_2()
end

function var_0_0.OnStart(arg_150_0, arg_150_1)
	return
end

function var_0_0.OnReset(arg_151_0, arg_151_1, arg_151_2, arg_151_3)
	arg_151_3()
end

function var_0_0.OnBgUpdate(arg_152_0, arg_152_1)
	return
end

function var_0_0.OnInit(arg_153_0, arg_153_1, arg_153_2, arg_153_3)
	if arg_153_3 then
		arg_153_3()
	end
end

function var_0_0.OnStartUIAnimations(arg_154_0, arg_154_1, arg_154_2)
	if arg_154_2 then
		arg_154_2()
	end
end

function var_0_0.OnEnter(arg_155_0, arg_155_1, arg_155_2, arg_155_3)
	if arg_155_3 then
		arg_155_3()
	end
end

function var_0_0.OnWillExit(arg_156_0, arg_156_1, arg_156_2, arg_156_3)
	arg_156_3()
end

function var_0_0.OnWillClear(arg_157_0, arg_157_1)
	return
end

function var_0_0.OnClear(arg_158_0)
	return
end

function var_0_0.OnEnd(arg_159_0, arg_159_1)
	return
end

return var_0_0
