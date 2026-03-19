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

	if var_6_0 <= 3 then
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
			local var_64_4 = table.contains(var_63_5, var_64_2)

			onButton(arg_63_0, var_64_0, function()
				if arg_63_0.pause or arg_63_0.stop then
					return
				end

				if not var_63_0 then
					return
				end

				arg_63_0.selectedBranchID = arg_64_1

				arg_63_0:SetBranchCode(arg_63_1, arg_63_2, var_64_2)
				pg.NewStoryMgr.GetInstance():TrackingOption(arg_63_2:GetOptionIndex(), var_64_2)

				local var_65_0 = arg_64_2:GetComponent(typeof(Animation))

				if var_65_0 then
					var_63_6.blocksRaycasts = false

					var_65_0:Play(arg_63_0.script:GetAnimPrefix() .. "confirm")
					arg_64_2:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
						setActive(arg_63_0.optionsCg.gameObject, false)

						var_63_6.blocksRaycasts = true

						arg_63_3(var_64_1)
					end)
				else
					setActive(arg_63_0.optionsCg.gameObject, false)
					arg_63_3(var_64_1)
				end

				arg_63_0:HideBranchesWithoutSelected(arg_63_2)
			end, SFX_PANEL)
			setButtonEnabled(var_64_0, not var_64_4)

			GetOrAddComponent(arg_64_2, typeof(CanvasGroup)).alpha = var_64_4 and 0.5 or 1

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

function var_0_0.SetBranchCode(arg_69_0, arg_69_1, arg_69_2, arg_69_3)
	arg_69_2:SetBranchCode(arg_69_3)
	arg_69_1:SetBranchCode(arg_69_3)

	local var_69_0 = arg_69_2:GetId()

	if not arg_69_0.branchCodeList[var_69_0] then
		arg_69_0.branchCodeList[var_69_0] = {}
	end

	table.insert(arg_69_0.branchCodeList[var_69_0], arg_69_3)
end

function var_0_0.ShowBranches(arg_70_0, arg_70_1, arg_70_2)
	setActive(arg_70_0.optionsCg.gameObject, true)

	local var_70_0 = arg_70_0:GetOptionContainer(arg_70_1)

	for iter_70_0 = 0, var_70_0.container.childCount - 1 do
		local var_70_1 = var_70_0.container:GetChild(iter_70_0):GetComponent(typeof(Animation))

		if var_70_1 then
			var_70_1:Play(arg_70_0.script:GetAnimPrefix() .. "in")
		end
	end

	arg_70_2()
end

function var_0_0.HideBranchesWithoutSelected(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0:GetOptionContainer(arg_71_1)

	for iter_71_0 = 0, var_71_0.container.childCount - 1 do
		if iter_71_0 ~= arg_71_0.selectedBranchID then
			local var_71_1 = var_71_0.container:GetChild(iter_71_0):GetComponent(typeof(Animation))

			if var_71_1 then
				var_71_1:Play(arg_71_0.script:GetAnimPrefix() .. "unselected")
			end
		end
	end
end

function var_0_0.StartMoveNode(arg_72_0, arg_72_1, arg_72_2)
	if not arg_72_1:ExistMovableNode() then
		arg_72_2()

		return
	end

	local var_72_0 = arg_72_1:GetMovableNode()
	local var_72_1 = {}
	local var_72_2 = {}

	for iter_72_0, iter_72_1 in pairs(var_72_0) do
		table.insert(var_72_1, function(arg_73_0)
			arg_72_0:LoadMovableNode(iter_72_1, function(arg_74_0)
				var_72_2[iter_72_0] = arg_74_0

				arg_73_0()
			end)
		end)
	end

	parallelAsync(var_72_1, function()
		arg_72_0:MoveAllNode(arg_72_1, var_72_2, var_72_0)
		arg_72_2()
	end)
end

function var_0_0.MoveAllNode(arg_76_0, arg_76_1, arg_76_2, arg_76_3)
	local var_76_0 = {}

	for iter_76_0, iter_76_1 in pairs(arg_76_2) do
		table.insert(var_76_0, function(arg_77_0)
			local var_77_0 = arg_76_3[iter_76_0]
			local var_77_1 = var_77_0.path
			local var_77_2 = var_77_0.time
			local var_77_3 = var_77_0.easeType
			local var_77_4 = var_77_0.delay

			arg_76_0:moveLocalPath(iter_76_1, var_77_1, var_77_2, var_77_4, var_77_3, arg_77_0)
		end)
	end

	arg_76_0.moveTargets = arg_76_2

	parallelAsync(var_76_0, function()
		arg_76_0:ClearMoveNodes(arg_76_1)
	end)
end

local function var_0_12(arg_79_0, arg_79_1, arg_79_2, arg_79_3, arg_79_4)
	arg_79_0.spineChar = SpineAnimChar.New()

	arg_79_0.spineChar:SetPaint(arg_79_1)
	arg_79_0.spineChar:Load(true, function(arg_80_0)
		arg_80_0:SetParent(arg_79_0.movePanel)
		arg_80_0:SetLocalScale(Vector3(arg_79_2.scale, arg_79_2.scale, 0))
		arg_80_0:SetLocalPosition(arg_79_3)
		arg_80_0:SetAction(arg_79_2.action, 0)
		arg_80_0:SetName(arg_79_1)

		if arg_79_4 then
			arg_79_4(arg_79_0.spineChar:GetModel())
		end
	end)
end

local function var_0_13(arg_81_0, arg_81_1, arg_81_2, arg_81_3)
	local var_81_0 = GameObject.New("movable")

	var_81_0.transform:SetParent(arg_81_0.movePanel)

	var_81_0.transform.localScale = Vector3.zero

	local var_81_1 = GetOrAddComponent(var_81_0, typeof(RectTransform))
	local var_81_2 = GetOrAddComponent(var_81_0, typeof(Image))

	LoadSpriteAsync(arg_81_1, function(arg_82_0)
		var_81_2.sprite = arg_82_0

		var_81_2:SetNativeSize()

		var_81_1.localScale = Vector3.one
		var_81_1.localPosition = arg_81_2

		arg_81_3(var_81_1.gameObject)
	end)
end

function var_0_0.LoadMovableNode(arg_83_0, arg_83_1, arg_83_2)
	local var_83_0 = arg_83_1.path[1] or Vector3.zero

	if arg_83_1.isSpine then
		var_0_12(arg_83_0, arg_83_1.name, arg_83_1.spineData, var_83_0, arg_83_2)
	else
		var_0_13(arg_83_0, arg_83_1.name, var_83_0, arg_83_2)
	end
end

function var_0_0.ClearMoveNodes(arg_84_0, arg_84_1)
	if not arg_84_1:ExistMovableNode() then
		return
	end

	if arg_84_0.movePanel.childCount <= 0 then
		return
	end

	for iter_84_0, iter_84_1 in ipairs(arg_84_0.moveTargets or {}) do
		if iter_84_1:GetComponent(typeof(SpineAnimUI)) ~= nil then
			PoolMgr.GetInstance():ReturnSpineChar(iter_84_1.name, iter_84_1.gameObject)
		else
			Destroy(arg_84_0.movePanel:GetChild(iter_84_0 - 1))
		end
	end

	arg_84_0.moveTargets = {}
end

function var_0_0.FadeOutStory(arg_85_0, arg_85_1, arg_85_2)
	if not arg_85_1:ShouldFadeout() then
		arg_85_2()

		return
	end

	local var_85_0 = arg_85_1:GetFadeoutTime()

	if not arg_85_1:ShouldWaitFadeout() then
		arg_85_0:fadeTransform(arg_85_0._go, 1, 0.3, var_85_0, true)
		arg_85_2()
	else
		arg_85_0:fadeTransform(arg_85_0._go, 1, 0.3, var_85_0, true, arg_85_2)
	end
end

function var_0_0.GetFadeColor(arg_86_0, arg_86_1)
	local var_86_0 = {}
	local var_86_1 = {}
	local var_86_2 = arg_86_1:GetComponentsInChildren(typeof(Image)):ToTable()

	for iter_86_0, iter_86_1 in ipairs(var_86_2) do
		local var_86_3 = {
			name = "_Color",
			color = Color.white
		}

		if iter_86_1.material.shader.name == "UI/GrayScale" then
			var_86_3 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif iter_86_1.material.shader.name == "UI/Line_Add_Blue" then
			var_86_3 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(var_86_1, var_86_3)

		if iter_86_1.material == iter_86_1.defaultGraphicMaterial then
			iter_86_1.material = Material.Instantiate(iter_86_1.defaultGraphicMaterial)
		end

		table.insert(var_86_0, iter_86_1.material)
	end

	return var_86_0, var_86_1
end

function var_0_0._SetFadeColor(arg_87_0, arg_87_1, arg_87_2, arg_87_3)
	for iter_87_0, iter_87_1 in ipairs(arg_87_1) do
		if not IsNil(iter_87_1) then
			iter_87_1:SetColor(arg_87_2[iter_87_0].name, arg_87_2[iter_87_0].color * Color.New(arg_87_3, arg_87_3, arg_87_3))
		end
	end
end

function var_0_0.SetFadeColor(arg_88_0, arg_88_1, arg_88_2)
	local var_88_0, var_88_1 = arg_88_0:GetFadeColor(arg_88_1)

	arg_88_0:_SetFadeColor(var_88_0, var_88_1, arg_88_2)
end

function var_0_0._RevertFadeColor(arg_89_0, arg_89_1, arg_89_2)
	arg_89_0:_SetFadeColor(arg_89_1, arg_89_2, 1)
end

function var_0_0.RevertFadeColor(arg_90_0, arg_90_1)
	local var_90_0, var_90_1 = arg_90_0:GetFadeColor(arg_90_1)

	arg_90_0:_RevertFadeColor(var_90_0, var_90_1)
end

function var_0_0.fadeTransform(arg_91_0, arg_91_1, arg_91_2, arg_91_3, arg_91_4, arg_91_5, arg_91_6)
	if arg_91_4 <= 0 then
		if arg_91_6 then
			arg_91_6()
		end

		return
	end

	local var_91_0, var_91_1 = arg_91_0:GetFadeColor(arg_91_1)

	LeanTween.value(go(arg_91_1), arg_91_2, arg_91_3, arg_91_4):setOnUpdate(System.Action_float(function(arg_92_0)
		arg_91_0:_SetFadeColor(var_91_0, var_91_1, arg_92_0)
	end)):setOnComplete(System.Action(function()
		if arg_91_5 then
			arg_91_0:_RevertFadeColor(var_91_0, var_91_1)
		end

		if arg_91_6 then
			arg_91_6()
		end
	end))
end

function var_0_0.setPaintingAlpha(arg_94_0, arg_94_1, arg_94_2)
	local var_94_0 = {}
	local var_94_1 = {}
	local var_94_2 = arg_94_1:GetComponentsInChildren(typeof(Image)):ToTable()

	for iter_94_0, iter_94_1 in ipairs(var_94_2) do
		local var_94_3 = {
			name = "_Color",
			color = Color.white
		}

		if iter_94_1.material.shader.name == "UI/GrayScale" then
			var_94_3 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif iter_94_1.material.shader.name == "UI/Line_Add_Blue" then
			var_94_3 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(var_94_1, var_94_3)

		if iter_94_1.material == iter_94_1.defaultGraphicMaterial then
			iter_94_1.material = Material.Instantiate(iter_94_1.defaultGraphicMaterial)
		end

		table.insert(var_94_0, iter_94_1.material)
	end

	for iter_94_2, iter_94_3 in ipairs(var_94_0) do
		if not IsNil(iter_94_3) then
			iter_94_3:SetColor(var_94_1[iter_94_2].name, var_94_1[iter_94_2].color * Color.New(arg_94_2, arg_94_2, arg_94_2))
		end
	end
end

function var_0_0.RegisetEvent(arg_95_0, arg_95_1, arg_95_2)
	setButtonEnabled(arg_95_0._go, not arg_95_0.autoNext)
	onButton(arg_95_0, arg_95_0._go, function()
		if arg_95_0.pause or arg_95_0.stop then
			return
		end

		removeOnButton(arg_95_0._go)
		arg_95_2()
	end, SFX_PANEL)
end

function var_0_0.flashEffect(arg_97_0, arg_97_1, arg_97_2, arg_97_3, arg_97_4, arg_97_5, arg_97_6)
	arg_97_0.flashImg.color = arg_97_4 and Color(0, 0, 0) or Color(1, 1, 1)
	arg_97_0.flashCg.alpha = arg_97_1

	setActive(arg_97_0.flash, true)
	arg_97_0:TweenValueForcanvasGroup(arg_97_0.flashCg, arg_97_1, arg_97_2, arg_97_3, arg_97_5, arg_97_6)
end

function var_0_0.Flashout(arg_98_0, arg_98_1, arg_98_2)
	local var_98_0, var_98_1, var_98_2, var_98_3 = arg_98_1:GetFlashoutData()

	if not var_98_0 then
		arg_98_2()

		return
	end

	arg_98_0:flashEffect(var_98_0, var_98_1, var_98_2, var_98_3, 0, arg_98_2)
end

function var_0_0.flashin(arg_99_0, arg_99_1, arg_99_2)
	local var_99_0, var_99_1, var_99_2, var_99_3, var_99_4 = arg_99_1:GetFlashinData()

	if not var_99_0 then
		arg_99_2()

		return
	end

	arg_99_0:flashEffect(var_99_0, var_99_1, var_99_2, var_99_3, var_99_4, arg_99_2)
end

function var_0_0.UpdateBg(arg_100_0, arg_100_1)
	if arg_100_1:ShouldBgGlitchArt() then
		arg_100_0:SetBgGlitchArt(arg_100_1)
	else
		local var_100_0 = arg_100_1:GetBgName()

		if var_100_0 then
			setActive(arg_100_0.bgPanel, true)

			arg_100_0.bgPanelCg.alpha = 1

			local var_100_1 = arg_100_0.bgImage

			var_100_1.color = Color.New(1, 1, 1)
			var_100_1.sprite = arg_100_0:GetBg(var_100_0)
		end

		local var_100_2 = arg_100_1:GetBgShadow()

		if var_100_2 then
			local var_100_3 = arg_100_0.bgImage

			arg_100_0:TweenValue(var_100_3, var_100_2[1], var_100_2[2], var_100_2[3], 0, function(arg_101_0)
				var_100_3.color = Color.New(arg_101_0, arg_101_0, arg_101_0)
			end, nil)
		end

		if arg_100_1:IsBlackBg() then
			setActive(arg_100_0.curtain, true)

			arg_100_0.curtainCg.alpha = 1
		end

		local var_100_4, var_100_5 = arg_100_1:IsBlackFrontGround()

		if var_100_4 then
			arg_100_0.curtainFCg.alpha = var_100_5
		end

		setActive(arg_100_0.curtainF, var_100_4)
	end

	arg_100_0:ApplyOldPhotoEffect(arg_100_1)
	arg_100_0:OnBgUpdate(arg_100_1)

	local var_100_6 = arg_100_1:GetBgColor()

	arg_100_0.curtain:GetComponent(typeof(Image)).color = var_100_6
end

function var_0_0.ApplyOldPhotoEffect(arg_102_0, arg_102_1)
	local var_102_0 = arg_102_1:OldPhotoEffect()
	local var_102_1 = var_102_0 ~= nil

	setActive(arg_102_0.oldPhoto.gameObject, var_102_1)

	if var_102_1 then
		if type(var_102_0) == "table" then
			arg_102_0.oldPhoto.color = Color.New(var_102_0[1], var_102_0[2], var_102_0[3], var_102_0[4])
		else
			arg_102_0.oldPhoto.color = Color.New(0.62, 0.58, 0.14, 0.36)
		end
	end
end

function var_0_0.SetBgGlitchArt(arg_103_0, arg_103_1)
	setActive(arg_103_0.bgPanel, false)
	setActive(arg_103_0.bgGlitch, true)
end

function var_0_0.GetBg(arg_104_0, arg_104_1)
	if not arg_104_0.bgs[arg_104_1] then
		arg_104_0.bgs[arg_104_1] = LoadSprite("bg/" .. arg_104_1)
	end

	return arg_104_0.bgs[arg_104_1]
end

function var_0_0.LoadEffects(arg_105_0, arg_105_1, arg_105_2)
	local var_105_0 = arg_105_1:GetEffects()

	if #var_105_0 <= 0 then
		arg_105_2()

		return
	end

	local var_105_1 = {}

	for iter_105_0, iter_105_1 in ipairs(var_105_0) do
		local var_105_2 = iter_105_1.name
		local var_105_3 = iter_105_1.active
		local var_105_4 = iter_105_1.interlayer
		local var_105_5 = iter_105_1.center
		local var_105_6 = iter_105_1.adapt
		local var_105_7 = arg_105_0.effectPanel:Find(var_105_2) or arg_105_0.centerPanel:Find(var_105_2)

		if var_105_7 then
			setActive(var_105_7, var_105_3)
			setParent(var_105_7, var_105_5 and arg_105_0.centerPanel or arg_105_0.effectPanel.transform)

			if var_105_4 then
				arg_105_0:UpdateEffectInterLayer(var_105_2, var_105_7)
			end

			if not var_105_3 then
				arg_105_0:ClearEffectInterlayer(var_105_2)
			elseif isActive(var_105_7) then
				setActive(var_105_7, false)
				setActive(var_105_7, true)
			end

			if var_105_6 then
				arg_105_0:AdaptEffect(var_105_7)
			end
		else
			local var_105_8 = ""

			if checkABExist("ui/" .. var_105_2) then
				var_105_8 = "ui"
			elseif checkABExist("effect/" .. var_105_2) then
				var_105_8 = "effect"
			end

			if var_105_8 and var_105_8 ~= "" then
				table.insert(var_105_1, function(arg_106_0)
					LoadAndInstantiateAsync(var_105_8, var_105_2, function(arg_107_0)
						setParent(arg_107_0, var_105_5 and arg_105_0.centerPanel or arg_105_0.effectPanel.transform)

						arg_107_0.transform.localScale = Vector3.one

						setActive(arg_107_0, var_105_3)

						arg_107_0.name = var_105_2

						if var_105_4 then
							arg_105_0:UpdateEffectInterLayer(var_105_2, arg_107_0)
						end

						if var_105_3 == false then
							arg_105_0:ClearEffectInterlayer(var_105_2)
						end

						if var_105_6 then
							arg_105_0:AdaptEffect(arg_107_0)
						end

						arg_106_0()
					end)
				end)
			else
				originalPrint("not found effect", var_105_2)
			end
		end
	end

	parallelAsync(var_105_1, arg_105_2)
end

function var_0_0.AdaptEffect(arg_108_0, arg_108_1)
	local var_108_0 = 1.7777777777777777
	local var_108_1 = pg.UIMgr.GetInstance().OverlayMain.parent.sizeDelta
	local var_108_2 = var_108_1.x / var_108_1.y
	local var_108_3 = 1

	if var_108_0 < var_108_2 then
		var_108_3 = var_108_2 / var_108_0
	else
		var_108_3 = var_108_0 / var_108_2
	end

	tf(arg_108_1).localScale = Vector3(var_108_3, var_108_3, var_108_3)
end

function var_0_0.UpdateEffectInterLayer(arg_109_0, arg_109_1, arg_109_2)
	local var_109_0 = arg_109_0._go:GetComponent(typeof(Canvas)).sortingOrder
	local var_109_1 = arg_109_2:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer")):ToTable()

	for iter_109_0, iter_109_1 in ipairs(var_109_1) do
		local var_109_2 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_109_1)

		if var_109_0 < var_109_2 then
			var_109_0 = var_109_2
		end
	end

	local var_109_3 = var_109_0 + 1
	local var_109_4 = GetOrAddComponent(arg_109_0.actorTr, typeof(Canvas))

	var_109_4.overrideSorting = true
	var_109_4.sortingOrder = var_109_3

	local var_109_5 = GetOrAddComponent(arg_109_0.frontTr, typeof(Canvas))

	var_109_5.overrideSorting = true
	var_109_5.sortingOrder = var_109_3 + 1
	arg_109_0.activeInterLayer = arg_109_1

	GetOrAddComponent(arg_109_0.frontTr, typeof(GraphicRaycaster))
end

function var_0_0.ClearEffectInterlayer(arg_110_0, arg_110_1)
	if arg_110_0.activeInterLayer == arg_110_1 then
		RemoveComponent(arg_110_0.frontTr, "GraphicRaycaster")
		RemoveComponent(arg_110_0.actorTr, "Canvas")
		RemoveComponent(arg_110_0.frontTr, "Canvas")

		arg_110_0.activeInterLayer = nil
	end
end

function var_0_0.ClearEffects(arg_111_0)
	removeAllChildren(arg_111_0.effectPanel)
	removeAllChildren(arg_111_0.centerPanel)

	if arg_111_0.activeInterLayer ~= nil then
		arg_111_0:ClearEffectInterlayer(arg_111_0.activeInterLayer)
	end
end

function var_0_0.PlaySoundEffect(arg_112_0, arg_112_1)
	if arg_112_1:ShouldPlaySoundEffect() then
		local var_112_0, var_112_1 = arg_112_1:GetSoundeffect()

		arg_112_0:DelayCall(var_112_1, function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_112_0)
		end)
	end

	if arg_112_1:ShouldPlayVoice() then
		arg_112_0:PlayVoice(arg_112_1)
	elseif arg_112_1:ShouldStopVoice() then
		arg_112_0:StopVoice()
	end
end

function var_0_0.StopVoice(arg_114_0)
	if arg_114_0.currentVoice then
		arg_114_0.currentVoice:Stop(true)

		arg_114_0.currentVoice = nil
	end
end

function var_0_0.PlayVoice(arg_115_0, arg_115_1)
	if arg_115_0.voiceDelayTimer then
		arg_115_0.voiceDelayTimer:Stop()

		arg_115_0.voiceDelayTimer = nil
	end

	arg_115_0:StopVoice()

	local var_115_0, var_115_1 = arg_115_1:GetVoice()
	local var_115_2

	var_115_2 = arg_115_0:CreateDelayTimer(var_115_1, function()
		if var_115_2 then
			var_115_2:Stop()
		end

		if arg_115_0.voiceDelayTimer then
			arg_115_0.voiceDelayTimer = nil
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_115_0, function(arg_117_0)
			if arg_117_0 then
				arg_115_0.currentVoice = arg_117_0.playback
			end
		end)
	end)
	arg_115_0.voiceDelayTimer = var_115_2
end

function var_0_0.Reset(arg_118_0, arg_118_1, arg_118_2, arg_118_3)
	setActive(arg_118_0.spAnimPanel, false)
	setActive(arg_118_0.castPanel, false)
	setActive(arg_118_0.bgPanel, false)

	if arg_118_1 and arg_118_1:IsDialogueMode() and arg_118_2 and arg_118_2:IsDialogueMode() then
		-- block empty
	else
		setActive(arg_118_0.dialoguePanel, false)
	end

	setActive(arg_118_0.asidePanel, false)
	setActive(arg_118_0.curtain, false)
	setActive(arg_118_0.flash, false)
	setActive(arg_118_0.optionsCg.gameObject, false)
	setActive(arg_118_0.bgGlitch, false)
	setActive(arg_118_0.locationTr, false)

	arg_118_0.locationTr.localPosition = arg_118_0.locationTrPos
	arg_118_0.locationStatus = var_0_9
	arg_118_0.flashCg.alpha = 1
	arg_118_0.goCG.alpha = 1

	arg_118_0.animationPlayer:Stop()
	arg_118_0:OnReset(arg_118_1, arg_118_2, arg_118_3)
end

function var_0_0.Clear(arg_119_0, arg_119_1)
	if arg_119_0.step then
		arg_119_0:ClearMoveNodes(arg_119_0.step)
	end

	arg_119_0.bgs = {}
	arg_119_0.skipOption = nil
	arg_119_0.step = nil
	arg_119_0.goCG.alpha = 1
	arg_119_0.callback = nil
	arg_119_0.autoNext = nil
	arg_119_0.script = nil
	arg_119_0.bgImage.sprite = nil

	arg_119_0:OnClear()

	if arg_119_1 then
		arg_119_1()
	end

	pg.DelegateInfo.New(arg_119_0)
end

function var_0_0.StoryEnd(arg_120_0, arg_120_1)
	setActive(arg_120_0.iconImage.gameObject, false)

	arg_120_0.iconImage.sprite = nil
	arg_120_0.branchCodeList = {}
	arg_120_0.stop = false
	arg_120_0.pause = false

	if arg_120_0.voiceDelayTimer then
		arg_120_0.voiceDelayTimer:Stop()

		arg_120_0.voiceDelayTimer = nil
	end

	if arg_120_0.currentVoice then
		arg_120_0.currentVoice:Stop(true)

		arg_120_0.currentVoice = nil
	end

	arg_120_0:ClearCheckDispatcher()
	arg_120_0:ClearEffects()
	arg_120_0:Clear()
	arg_120_0:OnEnd(arg_120_1)
end

function var_0_0.PlayBgm(arg_121_0, arg_121_1)
	if arg_121_1:ShouldStopBgm() then
		arg_121_0:StopBgm()
	end

	if arg_121_1:ShoulePlayBgm() then
		local var_121_0, var_121_1, var_121_2 = arg_121_1:GetBgmData()

		arg_121_0:DelayCall(var_121_1, function()
			arg_121_0:RevertBgmVolume()
			pg.BgmMgr.GetInstance():TempPlay(var_121_0)
		end)

		if var_121_2 and var_121_2 > 0 then
			arg_121_0.defaultBgmVolume = pg.CriMgr.GetInstance():getBGMVolume()

			pg.CriMgr.GetInstance():setBGMVolume(var_121_2)
		end
	end
end

function var_0_0.StopBgm(arg_123_0, arg_123_1)
	arg_123_0:RevertBgmVolume()
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.RevertBgmVolume(arg_124_0)
	if arg_124_0.defaultBgmVolume then
		pg.CriMgr.GetInstance():setBGMVolume(arg_124_0.defaultBgmVolume)

		arg_124_0.defaultBgmVolume = nil
	end
end

function var_0_0.StartUIAnimations(arg_125_0, arg_125_1, arg_125_2)
	parallelAsync({
		function(arg_126_0)
			arg_125_0:StartBlinkAnimation(arg_125_1, arg_126_0)
		end,
		function(arg_127_0)
			arg_125_0:StartBlinkWithColorAnimation(arg_125_1, arg_127_0)
		end,
		function(arg_128_0)
			arg_125_0:OnStartUIAnimations(arg_125_1, arg_128_0)
		end
	}, arg_125_2)
end

function var_0_0.StartBlinkAnimation(arg_129_0, arg_129_1, arg_129_2)
	if arg_129_1:ShouldBlink() then
		local var_129_0 = arg_129_1:GetBlinkData()
		local var_129_1 = var_129_0.black
		local var_129_2 = var_129_0.number
		local var_129_3 = var_129_0.dur
		local var_129_4 = var_129_0.delay
		local var_129_5 = var_129_0.alpha[1]
		local var_129_6 = var_129_0.alpha[2]
		local var_129_7 = var_129_0.wait

		arg_129_0.flashImg.color = var_129_1 and Color(0, 0, 0) or Color(1, 1, 1)

		setActive(arg_129_0.flash, true)

		local var_129_8 = {}

		for iter_129_0 = 1, var_129_2 do
			table.insert(var_129_8, function(arg_130_0)
				arg_129_0:TweenAlpha(arg_129_0.flash, var_129_5, var_129_6, var_129_3 / 2, 0, function()
					arg_129_0:TweenAlpha(arg_129_0.flash, var_129_6, var_129_5, var_129_3 / 2, var_129_7, arg_130_0)
				end)
			end)
		end

		seriesAsync(var_129_8, function()
			setActive(arg_129_0.flash, false)
		end)
	end

	arg_129_2()
end

function var_0_0.StartBlinkWithColorAnimation(arg_133_0, arg_133_1, arg_133_2)
	if arg_133_1:ShouldBlinkWithColor() then
		local var_133_0 = arg_133_1:GetBlinkWithColorData()
		local var_133_1 = var_133_0.color
		local var_133_2 = var_133_0.alpha

		arg_133_0.flashImg.color = Color(var_133_1[1], var_133_1[2], var_133_1[3], var_133_1[4])

		setActive(arg_133_0.flash, true)

		local var_133_3 = {}

		for iter_133_0, iter_133_1 in ipairs(var_133_2) do
			local var_133_4 = iter_133_1[1]
			local var_133_5 = iter_133_1[2]
			local var_133_6 = iter_133_1[3]
			local var_133_7 = iter_133_1[4]

			table.insert(var_133_3, function(arg_134_0)
				arg_133_0:TweenValue(arg_133_0.flash, var_133_4, var_133_5, var_133_6, var_133_7, function(arg_135_0)
					arg_133_0.flashCg.alpha = arg_135_0
				end, arg_134_0)
			end)
		end

		parallelAsync(var_133_3, function()
			setActive(arg_133_0.flash, false)
		end)
	end

	arg_133_2()
end

function var_0_0.OnStart(arg_137_0, arg_137_1)
	return
end

function var_0_0.OnReset(arg_138_0, arg_138_1, arg_138_2, arg_138_3)
	arg_138_3()
end

function var_0_0.OnBgUpdate(arg_139_0, arg_139_1)
	return
end

function var_0_0.OnInit(arg_140_0, arg_140_1, arg_140_2, arg_140_3)
	if arg_140_3 then
		arg_140_3()
	end
end

function var_0_0.OnStartUIAnimations(arg_141_0, arg_141_1, arg_141_2)
	if arg_141_2 then
		arg_141_2()
	end
end

function var_0_0.OnEnter(arg_142_0, arg_142_1, arg_142_2, arg_142_3)
	if arg_142_3 then
		arg_142_3()
	end
end

function var_0_0.OnWillExit(arg_143_0, arg_143_1, arg_143_2, arg_143_3)
	arg_143_3()
end

function var_0_0.OnWillClear(arg_144_0, arg_144_1)
	return
end

function var_0_0.OnClear(arg_145_0)
	return
end

function var_0_0.OnEnd(arg_146_0, arg_146_1)
	return
end

return var_0_0
