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
	arg_1_0.front = arg_1_0:findTF("front")
	arg_1_0.actorTr = arg_1_0._tf:Find("actor")
	arg_1_0.frontTr = arg_1_0._tf:Find("front")
	arg_1_0.backPanel = arg_1_0:findTF("back")
	arg_1_0.goCG = GetOrAddComponent(arg_1_0._tf, typeof(CanvasGroup))
	arg_1_0.asidePanel = arg_1_0:findTF("front/aside_panel")
	arg_1_0.bgGlitch = arg_1_0:findTF("back/bg_glitch")
	arg_1_0.oldPhoto = arg_1_0:findTF("front/oldphoto"):GetComponent(typeof(Image))
	arg_1_0.bgPanel = arg_1_0:findTF("back/bg")
	arg_1_0.bgPanelCg = arg_1_0.bgPanel:GetComponent(typeof(CanvasGroup))

	setActive(arg_1_0:findTF("back/bg/sub"), false)

	arg_1_0.bgImage = arg_1_0:findTF("image", arg_1_0.bgPanel):GetComponent(typeof(Image))
	arg_1_0.mainImg = arg_1_0._tf:GetComponent(typeof(Image))
	arg_1_0.castPanel = arg_1_0:findTF("front/cast_panel")
	arg_1_0.spAnimPanel = arg_1_0:findTF("front/sp_anim_panel")
	arg_1_0.centerPanel = arg_1_0._tf:Find("center")
	arg_1_0.actorPanel = arg_1_0:findTF("actor")
	arg_1_0.dialoguePanel = arg_1_0:findTF("front/dialogue")
	arg_1_0.effectPanel = arg_1_0:findTF("front/effect")
	arg_1_0.movePanel = arg_1_0:findTF("front/move_layer")
	arg_1_0.curtain = arg_1_0:findTF("back/curtain")
	arg_1_0.curtainCg = arg_1_0.curtain:GetComponent(typeof(CanvasGroup))
	arg_1_0.flash = arg_1_0:findTF("front/flash")
	arg_1_0.flashImg = arg_1_0.flash:GetComponent(typeof(Image))
	arg_1_0.flashCg = arg_1_0.flash:GetComponent(typeof(CanvasGroup))
	arg_1_0.curtainF = arg_1_0:findTF("back/curtain_front")
	arg_1_0.curtainFCg = arg_1_0.curtainF:GetComponent(typeof(CanvasGroup))
	arg_1_0.locationTr = arg_1_0:findTF("front/location")
	arg_1_0.locationTxt = arg_1_0:findTF("front/location/Text"):GetComponent(typeof(Text))
	arg_1_0.locationTrPos = arg_1_0.locationTr.localPosition
	arg_1_0.locationAnim = arg_1_0.locationTr:GetComponent(typeof(Animation))
	arg_1_0.locationAniEvent = arg_1_0.locationTr:GetComponent(typeof(DftAniEvent))
	arg_1_0.iconImage = arg_1_0:findTF("front/icon"):GetComponent(typeof(Image))
	arg_1_0.topEffectTr = arg_1_0:findTF("top/effect")
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

	if var_61_1:Find("type1") then
		setActive(var_61_1:Find("type1"), arg_61_4 and arg_61_4 == 1)
	end

	if var_61_1:Find("type2") then
		setActive(var_61_1:Find("type2"), arg_61_4 and arg_61_4 == 2)
	end
end

function var_0_0.InitBranches(arg_62_0, arg_62_1, arg_62_2, arg_62_3, arg_62_4)
	local var_62_0 = false
	local var_62_1 = arg_62_2:GetOptions()
	local var_62_2, var_62_3 = arg_62_0:GetOptionContainer(arg_62_2)
	local var_62_4 = arg_62_2:GetId()
	local var_62_5 = arg_62_0.branchCodeList[var_62_4] or {}
	local var_62_6 = GetOrAddComponent(var_62_2.container, typeof(CanvasGroup))

	var_62_6.blocksRaycasts = true
	arg_62_0.selectedBranchID = nil

	var_62_2:make(function(arg_63_0, arg_63_1, arg_63_2)
		if arg_63_0 == UIItemList.EventUpdate then
			local var_63_0 = arg_63_2
			local var_63_1 = var_62_1[arg_63_1 + 1][1]
			local var_63_2 = var_62_1[arg_63_1 + 1][2]
			local var_63_3 = var_62_1[arg_63_1 + 1][3]
			local var_63_4 = table.contains(var_62_5, var_63_2)

			onButton(arg_62_0, var_63_0, function()
				if arg_62_0.pause or arg_62_0.stop then
					return
				end

				if not var_62_0 then
					return
				end

				arg_62_0.selectedBranchID = arg_63_1

				arg_62_0:SetBranchCode(arg_62_1, arg_62_2, var_63_2)
				pg.NewStoryMgr.GetInstance():TrackingOption(arg_62_2:GetOptionIndex(), var_63_2)

				local var_64_0 = arg_63_2:GetComponent(typeof(Animation))

				if var_64_0 then
					var_62_6.blocksRaycasts = false

					var_64_0:Play(arg_62_0.script:GetAnimPrefix() .. "confirm")
					arg_63_2:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
						setActive(arg_62_0.optionsCg.gameObject, false)

						var_62_6.blocksRaycasts = true

						arg_62_3(var_63_1)
					end)
				else
					setActive(arg_62_0.optionsCg.gameObject, false)
					arg_62_3(var_63_1)
				end

				arg_62_0:HideBranchesWithoutSelected(arg_62_2)
			end, SFX_PANEL)
			setButtonEnabled(var_63_0, not var_63_4)

			GetOrAddComponent(arg_63_2, typeof(CanvasGroup)).alpha = var_63_4 and 0.5 or 1

			arg_62_0:UpdateOptionTxt(var_62_3, var_63_0, var_63_1, var_63_3)

			if arg_62_0.script:IsDialogueStyle2() then
				setActive(var_63_0, arg_63_1 == 0)

				if arg_63_1 > 0 then
					LeanTween.delayedCall(0.066 * arg_63_1, System.Action(function()
						setActive(var_63_0, true)
					end))
				end
			end
		end
	end)
	var_62_2:align(#var_62_1)
	arg_62_0:ShowBranches(arg_62_2, function()
		var_62_0 = true

		if arg_62_4 then
			arg_62_4()
		end
	end)
end

function var_0_0.SetBranchCode(arg_68_0, arg_68_1, arg_68_2, arg_68_3)
	arg_68_2:SetBranchCode(arg_68_3)
	arg_68_1:SetBranchCode(arg_68_3)

	local var_68_0 = arg_68_2:GetId()

	if not arg_68_0.branchCodeList[var_68_0] then
		arg_68_0.branchCodeList[var_68_0] = {}
	end

	table.insert(arg_68_0.branchCodeList[var_68_0], arg_68_3)
end

function var_0_0.ShowBranches(arg_69_0, arg_69_1, arg_69_2)
	setActive(arg_69_0.optionsCg.gameObject, true)

	local var_69_0 = arg_69_0:GetOptionContainer(arg_69_1)

	for iter_69_0 = 0, var_69_0.container.childCount - 1 do
		local var_69_1 = var_69_0.container:GetChild(iter_69_0):GetComponent(typeof(Animation))

		if var_69_1 then
			var_69_1:Play(arg_69_0.script:GetAnimPrefix() .. "in")
		end
	end

	arg_69_2()
end

function var_0_0.HideBranchesWithoutSelected(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_0:GetOptionContainer(arg_70_1)

	for iter_70_0 = 0, var_70_0.container.childCount - 1 do
		if iter_70_0 ~= arg_70_0.selectedBranchID then
			local var_70_1 = var_70_0.container:GetChild(iter_70_0):GetComponent(typeof(Animation))

			if var_70_1 then
				var_70_1:Play(arg_70_0.script:GetAnimPrefix() .. "unselected")
			end
		end
	end
end

function var_0_0.StartMoveNode(arg_71_0, arg_71_1, arg_71_2)
	if not arg_71_1:ExistMovableNode() then
		arg_71_2()

		return
	end

	local var_71_0 = arg_71_1:GetMovableNode()
	local var_71_1 = {}
	local var_71_2 = {}

	for iter_71_0, iter_71_1 in pairs(var_71_0) do
		table.insert(var_71_1, function(arg_72_0)
			arg_71_0:LoadMovableNode(iter_71_1, function(arg_73_0)
				var_71_2[iter_71_0] = arg_73_0

				arg_72_0()
			end)
		end)
	end

	parallelAsync(var_71_1, function()
		arg_71_0:MoveAllNode(arg_71_1, var_71_2, var_71_0)
		arg_71_2()
	end)
end

function var_0_0.MoveAllNode(arg_75_0, arg_75_1, arg_75_2, arg_75_3)
	local var_75_0 = {}

	for iter_75_0, iter_75_1 in pairs(arg_75_2) do
		table.insert(var_75_0, function(arg_76_0)
			local var_76_0 = arg_75_3[iter_75_0]
			local var_76_1 = var_76_0.path
			local var_76_2 = var_76_0.time
			local var_76_3 = var_76_0.easeType
			local var_76_4 = var_76_0.delay

			arg_75_0:moveLocalPath(iter_75_1, var_76_1, var_76_2, var_76_4, var_76_3, arg_76_0)
		end)
	end

	arg_75_0.moveTargets = arg_75_2

	parallelAsync(var_75_0, function()
		arg_75_0:ClearMoveNodes(arg_75_1)
	end)
end

local function var_0_12(arg_78_0, arg_78_1, arg_78_2, arg_78_3, arg_78_4)
	PoolMgr.GetInstance():GetSpineChar(arg_78_1, true, function(arg_79_0)
		arg_79_0.transform:SetParent(arg_78_0.movePanel)

		local var_79_0 = arg_78_2.scale

		arg_79_0.transform.localScale = Vector3(var_79_0, var_79_0, 0)
		arg_79_0.transform.localPosition = arg_78_3

		arg_79_0:GetComponent(typeof(SpineAnimUI)):SetAction(arg_78_2.action, 0)

		arg_79_0.name = arg_78_1

		if arg_78_4 then
			arg_78_4(arg_79_0)
		end
	end)
end

local function var_0_13(arg_80_0, arg_80_1, arg_80_2, arg_80_3)
	local var_80_0 = GameObject.New("movable")

	var_80_0.transform:SetParent(arg_80_0.movePanel)

	var_80_0.transform.localScale = Vector3.zero

	local var_80_1 = GetOrAddComponent(var_80_0, typeof(RectTransform))
	local var_80_2 = GetOrAddComponent(var_80_0, typeof(Image))

	LoadSpriteAsync(arg_80_1, function(arg_81_0)
		var_80_2.sprite = arg_81_0

		var_80_2:SetNativeSize()

		var_80_1.localScale = Vector3.one
		var_80_1.localPosition = arg_80_2

		arg_80_3(var_80_1.gameObject)
	end)
end

function var_0_0.LoadMovableNode(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = arg_82_1.path[1] or Vector3.zero

	if arg_82_1.isSpine then
		var_0_12(arg_82_0, arg_82_1.name, arg_82_1.spineData, var_82_0, arg_82_2)
	else
		var_0_13(arg_82_0, arg_82_1.name, var_82_0, arg_82_2)
	end
end

function var_0_0.ClearMoveNodes(arg_83_0, arg_83_1)
	if not arg_83_1:ExistMovableNode() then
		return
	end

	if arg_83_0.movePanel.childCount <= 0 then
		return
	end

	for iter_83_0, iter_83_1 in ipairs(arg_83_0.moveTargets or {}) do
		if iter_83_1:GetComponent(typeof(SpineAnimUI)) ~= nil then
			PoolMgr.GetInstance():ReturnSpineChar(iter_83_1.name, iter_83_1.gameObject)
		else
			Destroy(arg_83_0.movePanel:GetChild(iter_83_0 - 1))
		end
	end

	arg_83_0.moveTargets = {}
end

function var_0_0.FadeOutStory(arg_84_0, arg_84_1, arg_84_2)
	if not arg_84_1:ShouldFadeout() then
		arg_84_2()

		return
	end

	local var_84_0 = arg_84_1:GetFadeoutTime()

	if not arg_84_1:ShouldWaitFadeout() then
		arg_84_0:fadeTransform(arg_84_0._go, 1, 0.3, var_84_0, true)
		arg_84_2()
	else
		arg_84_0:fadeTransform(arg_84_0._go, 1, 0.3, var_84_0, true, arg_84_2)
	end
end

function var_0_0.GetFadeColor(arg_85_0, arg_85_1)
	local var_85_0 = {}
	local var_85_1 = {}
	local var_85_2 = arg_85_1:GetComponentsInChildren(typeof(Image)):ToTable()

	for iter_85_0, iter_85_1 in ipairs(var_85_2) do
		local var_85_3 = {
			name = "_Color",
			color = Color.white
		}

		if iter_85_1.material.shader.name == "UI/GrayScale" then
			var_85_3 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif iter_85_1.material.shader.name == "UI/Line_Add_Blue" then
			var_85_3 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(var_85_1, var_85_3)

		if iter_85_1.material == iter_85_1.defaultGraphicMaterial then
			iter_85_1.material = Material.Instantiate(iter_85_1.defaultGraphicMaterial)
		end

		table.insert(var_85_0, iter_85_1.material)
	end

	return var_85_0, var_85_1
end

function var_0_0._SetFadeColor(arg_86_0, arg_86_1, arg_86_2, arg_86_3)
	for iter_86_0, iter_86_1 in ipairs(arg_86_1) do
		if not IsNil(iter_86_1) then
			iter_86_1:SetColor(arg_86_2[iter_86_0].name, arg_86_2[iter_86_0].color * Color.New(arg_86_3, arg_86_3, arg_86_3))
		end
	end
end

function var_0_0.SetFadeColor(arg_87_0, arg_87_1, arg_87_2)
	local var_87_0, var_87_1 = arg_87_0:GetFadeColor(arg_87_1)

	arg_87_0:_SetFadeColor(var_87_0, var_87_1, arg_87_2)
end

function var_0_0._RevertFadeColor(arg_88_0, arg_88_1, arg_88_2)
	arg_88_0:_SetFadeColor(arg_88_1, arg_88_2, 1)
end

function var_0_0.RevertFadeColor(arg_89_0, arg_89_1)
	local var_89_0, var_89_1 = arg_89_0:GetFadeColor(arg_89_1)

	arg_89_0:_RevertFadeColor(var_89_0, var_89_1)
end

function var_0_0.fadeTransform(arg_90_0, arg_90_1, arg_90_2, arg_90_3, arg_90_4, arg_90_5, arg_90_6)
	if arg_90_4 <= 0 then
		if arg_90_6 then
			arg_90_6()
		end

		return
	end

	local var_90_0, var_90_1 = arg_90_0:GetFadeColor(arg_90_1)

	LeanTween.value(go(arg_90_1), arg_90_2, arg_90_3, arg_90_4):setOnUpdate(System.Action_float(function(arg_91_0)
		arg_90_0:_SetFadeColor(var_90_0, var_90_1, arg_91_0)
	end)):setOnComplete(System.Action(function()
		if arg_90_5 then
			arg_90_0:_RevertFadeColor(var_90_0, var_90_1)
		end

		if arg_90_6 then
			arg_90_6()
		end
	end))
end

function var_0_0.setPaintingAlpha(arg_93_0, arg_93_1, arg_93_2)
	local var_93_0 = {}
	local var_93_1 = {}
	local var_93_2 = arg_93_1:GetComponentsInChildren(typeof(Image)):ToTable()

	for iter_93_0, iter_93_1 in ipairs(var_93_2) do
		local var_93_3 = {
			name = "_Color",
			color = Color.white
		}

		if iter_93_1.material.shader.name == "UI/GrayScale" then
			var_93_3 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif iter_93_1.material.shader.name == "UI/Line_Add_Blue" then
			var_93_3 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(var_93_1, var_93_3)

		if iter_93_1.material == iter_93_1.defaultGraphicMaterial then
			iter_93_1.material = Material.Instantiate(iter_93_1.defaultGraphicMaterial)
		end

		table.insert(var_93_0, iter_93_1.material)
	end

	for iter_93_2, iter_93_3 in ipairs(var_93_0) do
		if not IsNil(iter_93_3) then
			iter_93_3:SetColor(var_93_1[iter_93_2].name, var_93_1[iter_93_2].color * Color.New(arg_93_2, arg_93_2, arg_93_2))
		end
	end
end

function var_0_0.RegisetEvent(arg_94_0, arg_94_1, arg_94_2)
	setButtonEnabled(arg_94_0._go, not arg_94_0.autoNext)
	onButton(arg_94_0, arg_94_0._go, function()
		if arg_94_0.pause or arg_94_0.stop then
			return
		end

		removeOnButton(arg_94_0._go)
		arg_94_2()
	end, SFX_PANEL)
end

function var_0_0.flashEffect(arg_96_0, arg_96_1, arg_96_2, arg_96_3, arg_96_4, arg_96_5, arg_96_6)
	arg_96_0.flashImg.color = arg_96_4 and Color(0, 0, 0) or Color(1, 1, 1)
	arg_96_0.flashCg.alpha = arg_96_1

	setActive(arg_96_0.flash, true)
	arg_96_0:TweenValueForcanvasGroup(arg_96_0.flashCg, arg_96_1, arg_96_2, arg_96_3, arg_96_5, arg_96_6)
end

function var_0_0.Flashout(arg_97_0, arg_97_1, arg_97_2)
	local var_97_0, var_97_1, var_97_2, var_97_3 = arg_97_1:GetFlashoutData()

	if not var_97_0 then
		arg_97_2()

		return
	end

	arg_97_0:flashEffect(var_97_0, var_97_1, var_97_2, var_97_3, 0, arg_97_2)
end

function var_0_0.flashin(arg_98_0, arg_98_1, arg_98_2)
	local var_98_0, var_98_1, var_98_2, var_98_3, var_98_4 = arg_98_1:GetFlashinData()

	if not var_98_0 then
		arg_98_2()

		return
	end

	arg_98_0:flashEffect(var_98_0, var_98_1, var_98_2, var_98_3, var_98_4, arg_98_2)
end

function var_0_0.UpdateBg(arg_99_0, arg_99_1)
	if arg_99_1:ShouldBgGlitchArt() then
		arg_99_0:SetBgGlitchArt(arg_99_1)
	else
		local var_99_0 = arg_99_1:GetBgName()

		if var_99_0 then
			setActive(arg_99_0.bgPanel, true)

			arg_99_0.bgPanelCg.alpha = 1

			local var_99_1 = arg_99_0.bgImage

			var_99_1.color = Color.New(1, 1, 1)
			var_99_1.sprite = arg_99_0:GetBg(var_99_0)
		end

		local var_99_2 = arg_99_1:GetBgShadow()

		if var_99_2 then
			local var_99_3 = arg_99_0.bgImage

			arg_99_0:TweenValue(var_99_3, var_99_2[1], var_99_2[2], var_99_2[3], 0, function(arg_100_0)
				var_99_3.color = Color.New(arg_100_0, arg_100_0, arg_100_0)
			end, nil)
		end

		if arg_99_1:IsBlackBg() then
			setActive(arg_99_0.curtain, true)

			arg_99_0.curtainCg.alpha = 1
		end

		local var_99_4, var_99_5 = arg_99_1:IsBlackFrontGround()

		if var_99_4 then
			arg_99_0.curtainFCg.alpha = var_99_5
		end

		setActive(arg_99_0.curtainF, var_99_4)
	end

	arg_99_0:ApplyOldPhotoEffect(arg_99_1)
	arg_99_0:OnBgUpdate(arg_99_1)

	local var_99_6 = arg_99_1:GetBgColor()

	arg_99_0.curtain:GetComponent(typeof(Image)).color = var_99_6
end

function var_0_0.ApplyOldPhotoEffect(arg_101_0, arg_101_1)
	local var_101_0 = arg_101_1:OldPhotoEffect()
	local var_101_1 = var_101_0 ~= nil

	setActive(arg_101_0.oldPhoto.gameObject, var_101_1)

	if var_101_1 then
		if type(var_101_0) == "table" then
			arg_101_0.oldPhoto.color = Color.New(var_101_0[1], var_101_0[2], var_101_0[3], var_101_0[4])
		else
			arg_101_0.oldPhoto.color = Color.New(0.62, 0.58, 0.14, 0.36)
		end
	end
end

function var_0_0.SetBgGlitchArt(arg_102_0, arg_102_1)
	setActive(arg_102_0.bgPanel, false)
	setActive(arg_102_0.bgGlitch, true)
end

function var_0_0.GetBg(arg_103_0, arg_103_1)
	if not arg_103_0.bgs[arg_103_1] then
		arg_103_0.bgs[arg_103_1] = LoadSprite("bg/" .. arg_103_1)
	end

	return arg_103_0.bgs[arg_103_1]
end

function var_0_0.LoadEffects(arg_104_0, arg_104_1, arg_104_2)
	local var_104_0 = arg_104_1:GetEffects()

	if #var_104_0 <= 0 then
		arg_104_2()

		return
	end

	local var_104_1 = {}

	for iter_104_0, iter_104_1 in ipairs(var_104_0) do
		local var_104_2 = iter_104_1.name
		local var_104_3 = iter_104_1.active
		local var_104_4 = iter_104_1.interlayer
		local var_104_5 = iter_104_1.center
		local var_104_6 = iter_104_1.adapt
		local var_104_7 = arg_104_0.effectPanel:Find(var_104_2) or arg_104_0.centerPanel:Find(var_104_2)

		if var_104_7 then
			setActive(var_104_7, var_104_3)
			setParent(var_104_7, var_104_5 and arg_104_0.centerPanel or arg_104_0.effectPanel.transform)

			if var_104_4 then
				arg_104_0:UpdateEffectInterLayer(var_104_2, var_104_7)
			end

			if not var_104_3 then
				arg_104_0:ClearEffectInterlayer(var_104_2)
			elseif isActive(var_104_7) then
				setActive(var_104_7, false)
				setActive(var_104_7, true)
			end

			if var_104_6 then
				arg_104_0:AdaptEffect(var_104_7)
			end
		else
			local var_104_8 = ""

			if checkABExist("ui/" .. var_104_2) then
				var_104_8 = "ui"
			elseif checkABExist("effect/" .. var_104_2) then
				var_104_8 = "effect"
			end

			if var_104_8 and var_104_8 ~= "" then
				table.insert(var_104_1, function(arg_105_0)
					LoadAndInstantiateAsync(var_104_8, var_104_2, function(arg_106_0)
						setParent(arg_106_0, var_104_5 and arg_104_0.centerPanel or arg_104_0.effectPanel.transform)

						arg_106_0.transform.localScale = Vector3.one

						setActive(arg_106_0, var_104_3)

						arg_106_0.name = var_104_2

						if var_104_4 then
							arg_104_0:UpdateEffectInterLayer(var_104_2, arg_106_0)
						end

						if var_104_3 == false then
							arg_104_0:ClearEffectInterlayer(var_104_2)
						end

						if var_104_6 then
							arg_104_0:AdaptEffect(arg_106_0)
						end

						arg_105_0()
					end)
				end)
			else
				originalPrint("not found effect", var_104_2)
			end
		end
	end

	parallelAsync(var_104_1, arg_104_2)
end

function var_0_0.AdaptEffect(arg_107_0, arg_107_1)
	local var_107_0 = 1.7777777777777777
	local var_107_1 = pg.UIMgr.GetInstance().OverlayMain.parent.sizeDelta
	local var_107_2 = var_107_1.x / var_107_1.y
	local var_107_3 = 1

	if var_107_0 < var_107_2 then
		var_107_3 = var_107_2 / var_107_0
	else
		var_107_3 = var_107_0 / var_107_2
	end

	tf(arg_107_1).localScale = Vector3(var_107_3, var_107_3, var_107_3)
end

function var_0_0.UpdateEffectInterLayer(arg_108_0, arg_108_1, arg_108_2)
	local var_108_0 = arg_108_0._go:GetComponent(typeof(Canvas)).sortingOrder
	local var_108_1 = arg_108_2:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer")):ToTable()

	for iter_108_0, iter_108_1 in ipairs(var_108_1) do
		local var_108_2 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_108_1)

		if var_108_0 < var_108_2 then
			var_108_0 = var_108_2
		end
	end

	local var_108_3 = var_108_0 + 1
	local var_108_4 = GetOrAddComponent(arg_108_0.actorTr, typeof(Canvas))

	var_108_4.overrideSorting = true
	var_108_4.sortingOrder = var_108_3

	local var_108_5 = GetOrAddComponent(arg_108_0.frontTr, typeof(Canvas))

	var_108_5.overrideSorting = true
	var_108_5.sortingOrder = var_108_3 + 1
	arg_108_0.activeInterLayer = arg_108_1

	GetOrAddComponent(arg_108_0.frontTr, typeof(GraphicRaycaster))
end

function var_0_0.ClearEffectInterlayer(arg_109_0, arg_109_1)
	if arg_109_0.activeInterLayer == arg_109_1 then
		RemoveComponent(arg_109_0.frontTr, "GraphicRaycaster")
		RemoveComponent(arg_109_0.actorTr, "Canvas")
		RemoveComponent(arg_109_0.frontTr, "Canvas")

		arg_109_0.activeInterLayer = nil
	end
end

function var_0_0.ClearEffects(arg_110_0)
	removeAllChildren(arg_110_0.effectPanel)
	removeAllChildren(arg_110_0.centerPanel)

	if arg_110_0.activeInterLayer ~= nil then
		arg_110_0:ClearEffectInterlayer(arg_110_0.activeInterLayer)
	end
end

function var_0_0.PlaySoundEffect(arg_111_0, arg_111_1)
	if arg_111_1:ShouldPlaySoundEffect() then
		local var_111_0, var_111_1 = arg_111_1:GetSoundeffect()

		arg_111_0:DelayCall(var_111_1, function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_111_0)
		end)
	end

	if arg_111_1:ShouldPlayVoice() then
		arg_111_0:PlayVoice(arg_111_1)
	elseif arg_111_1:ShouldStopVoice() then
		arg_111_0:StopVoice()
	end
end

function var_0_0.StopVoice(arg_113_0)
	if arg_113_0.currentVoice then
		arg_113_0.currentVoice:Stop(true)

		arg_113_0.currentVoice = nil
	end
end

function var_0_0.PlayVoice(arg_114_0, arg_114_1)
	if arg_114_0.voiceDelayTimer then
		arg_114_0.voiceDelayTimer:Stop()

		arg_114_0.voiceDelayTimer = nil
	end

	arg_114_0:StopVoice()

	local var_114_0, var_114_1 = arg_114_1:GetVoice()
	local var_114_2

	var_114_2 = arg_114_0:CreateDelayTimer(var_114_1, function()
		if var_114_2 then
			var_114_2:Stop()
		end

		if arg_114_0.voiceDelayTimer then
			arg_114_0.voiceDelayTimer = nil
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_114_0, function(arg_116_0)
			if arg_116_0 then
				arg_114_0.currentVoice = arg_116_0.playback
			end
		end)
	end)
	arg_114_0.voiceDelayTimer = var_114_2
end

function var_0_0.Reset(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
	setActive(arg_117_0.spAnimPanel, false)
	setActive(arg_117_0.castPanel, false)
	setActive(arg_117_0.bgPanel, false)

	if arg_117_1 and arg_117_1:IsDialogueMode() and arg_117_2 and arg_117_2:IsDialogueMode() then
		-- block empty
	else
		setActive(arg_117_0.dialoguePanel, false)
	end

	setActive(arg_117_0.asidePanel, false)
	setActive(arg_117_0.curtain, false)
	setActive(arg_117_0.flash, false)
	setActive(arg_117_0.optionsCg.gameObject, false)
	setActive(arg_117_0.bgGlitch, false)
	setActive(arg_117_0.locationTr, false)

	arg_117_0.locationTr.localPosition = arg_117_0.locationTrPos
	arg_117_0.locationStatus = var_0_9
	arg_117_0.flashCg.alpha = 1
	arg_117_0.goCG.alpha = 1

	arg_117_0.animationPlayer:Stop()
	arg_117_0:OnReset(arg_117_1, arg_117_2, arg_117_3)
end

function var_0_0.Clear(arg_118_0, arg_118_1)
	if arg_118_0.step then
		arg_118_0:ClearMoveNodes(arg_118_0.step)
	end

	arg_118_0.bgs = {}
	arg_118_0.skipOption = nil
	arg_118_0.step = nil
	arg_118_0.goCG.alpha = 1
	arg_118_0.callback = nil
	arg_118_0.autoNext = nil
	arg_118_0.script = nil
	arg_118_0.bgImage.sprite = nil

	arg_118_0:OnClear()

	if arg_118_1 then
		arg_118_1()
	end

	pg.DelegateInfo.New(arg_118_0)
end

function var_0_0.StoryEnd(arg_119_0, arg_119_1)
	setActive(arg_119_0.iconImage.gameObject, false)

	arg_119_0.iconImage.sprite = nil
	arg_119_0.branchCodeList = {}
	arg_119_0.stop = false
	arg_119_0.pause = false

	if arg_119_0.voiceDelayTimer then
		arg_119_0.voiceDelayTimer:Stop()

		arg_119_0.voiceDelayTimer = nil
	end

	if arg_119_0.currentVoice then
		arg_119_0.currentVoice:Stop(true)

		arg_119_0.currentVoice = nil
	end

	arg_119_0:ClearCheckDispatcher()
	arg_119_0:ClearEffects()
	arg_119_0:Clear()
	arg_119_0:OnEnd(arg_119_1)
end

function var_0_0.PlayBgm(arg_120_0, arg_120_1)
	if arg_120_1:ShouldStopBgm() then
		arg_120_0:StopBgm()
	end

	if arg_120_1:ShoulePlayBgm() then
		local var_120_0, var_120_1, var_120_2 = arg_120_1:GetBgmData()

		arg_120_0:DelayCall(var_120_1, function()
			arg_120_0:RevertBgmVolume()
			pg.BgmMgr.GetInstance():TempPlay(var_120_0)
		end)

		if var_120_2 and var_120_2 > 0 then
			arg_120_0.defaultBgmVolume = pg.CriMgr.GetInstance():getBGMVolume()

			pg.CriMgr.GetInstance():setBGMVolume(var_120_2)
		end
	end
end

function var_0_0.StopBgm(arg_122_0, arg_122_1)
	arg_122_0:RevertBgmVolume()
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.RevertBgmVolume(arg_123_0)
	if arg_123_0.defaultBgmVolume then
		pg.CriMgr.GetInstance():setBGMVolume(arg_123_0.defaultBgmVolume)

		arg_123_0.defaultBgmVolume = nil
	end
end

function var_0_0.StartUIAnimations(arg_124_0, arg_124_1, arg_124_2)
	parallelAsync({
		function(arg_125_0)
			arg_124_0:StartBlinkAnimation(arg_124_1, arg_125_0)
		end,
		function(arg_126_0)
			arg_124_0:StartBlinkWithColorAnimation(arg_124_1, arg_126_0)
		end,
		function(arg_127_0)
			arg_124_0:OnStartUIAnimations(arg_124_1, arg_127_0)
		end
	}, arg_124_2)
end

function var_0_0.StartBlinkAnimation(arg_128_0, arg_128_1, arg_128_2)
	if arg_128_1:ShouldBlink() then
		local var_128_0 = arg_128_1:GetBlinkData()
		local var_128_1 = var_128_0.black
		local var_128_2 = var_128_0.number
		local var_128_3 = var_128_0.dur
		local var_128_4 = var_128_0.delay
		local var_128_5 = var_128_0.alpha[1]
		local var_128_6 = var_128_0.alpha[2]
		local var_128_7 = var_128_0.wait

		arg_128_0.flashImg.color = var_128_1 and Color(0, 0, 0) or Color(1, 1, 1)

		setActive(arg_128_0.flash, true)

		local var_128_8 = {}

		for iter_128_0 = 1, var_128_2 do
			table.insert(var_128_8, function(arg_129_0)
				arg_128_0:TweenAlpha(arg_128_0.flash, var_128_5, var_128_6, var_128_3 / 2, 0, function()
					arg_128_0:TweenAlpha(arg_128_0.flash, var_128_6, var_128_5, var_128_3 / 2, var_128_7, arg_129_0)
				end)
			end)
		end

		seriesAsync(var_128_8, function()
			setActive(arg_128_0.flash, false)
		end)
	end

	arg_128_2()
end

function var_0_0.StartBlinkWithColorAnimation(arg_132_0, arg_132_1, arg_132_2)
	if arg_132_1:ShouldBlinkWithColor() then
		local var_132_0 = arg_132_1:GetBlinkWithColorData()
		local var_132_1 = var_132_0.color
		local var_132_2 = var_132_0.alpha

		arg_132_0.flashImg.color = Color(var_132_1[1], var_132_1[2], var_132_1[3], var_132_1[4])

		setActive(arg_132_0.flash, true)

		local var_132_3 = {}

		for iter_132_0, iter_132_1 in ipairs(var_132_2) do
			local var_132_4 = iter_132_1[1]
			local var_132_5 = iter_132_1[2]
			local var_132_6 = iter_132_1[3]
			local var_132_7 = iter_132_1[4]

			table.insert(var_132_3, function(arg_133_0)
				arg_132_0:TweenValue(arg_132_0.flash, var_132_4, var_132_5, var_132_6, var_132_7, function(arg_134_0)
					arg_132_0.flashCg.alpha = arg_134_0
				end, arg_133_0)
			end)
		end

		parallelAsync(var_132_3, function()
			setActive(arg_132_0.flash, false)
		end)
	end

	arg_132_2()
end

function var_0_0.findTF(arg_136_0, arg_136_1, arg_136_2)
	assert(arg_136_0._tf, "transform should exist")

	return findTF(arg_136_2 or arg_136_0._tf, arg_136_1)
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
