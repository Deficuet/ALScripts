local var_0_0 = class("StoryStep")

var_0_0.OPTION_ANIM_ONLY_BTN = 1
var_0_0.OPTION_ANIM_ONLY_ICON = 2
var_0_0.OPTION_ANIM_BOTH = 3

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.flashout = arg_1_1.flashout
	arg_1_0.flashin = arg_1_1.flashin
	arg_1_0.bgName = arg_1_1.bgName
	arg_1_0.bgShadow = arg_1_1.bgShadow
	arg_1_0.blackBg = arg_1_1.blackBg
	arg_1_0.blackFg = arg_1_1.blackFg or 0
	arg_1_0.bgGlitchArt = arg_1_1.bgNoise
	arg_1_0.oldPhoto = arg_1_1.oldPhoto
	arg_1_0.bgm = arg_1_1.bgm
	arg_1_0.bgmDelay = arg_1_1.bgmDelay or 0
	arg_1_0.bgmVolume = arg_1_1.bgmVolume or -1
	arg_1_0.stopbgm = arg_1_1.stopbgm
	arg_1_0.effects = arg_1_1.effects or {}
	arg_1_0.blink = arg_1_1.flash
	arg_1_0.blinkWithColor = arg_1_1.flashN
	arg_1_0.soundeffect = arg_1_1.soundeffect
	arg_1_0.seDelay = arg_1_1.seDelay or 0
	arg_1_0.voice = arg_1_1.voice
	arg_1_0.voiceDelay = arg_1_1.voiceDelay or 0
	arg_1_0.stopVoice = defaultValue(arg_1_1.stopVoice, false)
	arg_1_0.movableNode = arg_1_1.movableNode
	arg_1_0.options = arg_1_1.options
	arg_1_0.optionForceCenter = arg_1_1.option_force_center
	arg_1_0.optionsEffect = arg_1_1.optionsEffect
	arg_1_0.important = arg_1_1.important
	arg_1_0.branchCode = arg_1_1.optionFlag
	arg_1_0.globalBranchCode = arg_1_1.globalOptionFlag
	arg_1_0.recallOption = arg_1_1.recallOption
	arg_1_0.nextScriptName = arg_1_1.jumpto
	arg_1_0.eventDelay = arg_1_1.eventDelay or 0
	arg_1_0.bgColor = arg_1_1.bgColor or {
		0,
		0,
		0
	}
	arg_1_0.location = arg_1_1.location
	arg_1_0.icon = arg_1_1.icon
	arg_1_0.dispatcher = arg_1_1.dispatcher
	arg_1_0.shakeTime = defaultValue(arg_1_1.shakeTime, 0)
	arg_1_0.code = arg_1_1.code or -1
	arg_1_0.autoShowOption = defaultValue(arg_1_1.autoShowOption, false)
	arg_1_0.selectedBranchCode = 0
	arg_1_0.id = 0
	arg_1_0.placeholderType = 0
	arg_1_0.defaultTb = arg_1_1.defaultTb
	arg_1_0.optionIndex = 0
	arg_1_0.isExecuted = false
end

function var_0_0.MarkIsExecuted(arg_2_0)
	arg_2_0.isExecuted = true
end

function var_0_0.GetIsExecuted(arg_3_0)
	return arg_3_0.isExecuted
end

function var_0_0.GetOptionEffects(arg_4_0)
	if not arg_4_0.optionsEffect then
		return nil
	end

	local var_4_0 = arg_4_0.optionsEffect[1] or 1
	local var_4_1 = arg_4_0.optionsEffect[2] or 1
	local var_4_2 = arg_4_0.optionsEffect[3] or var_0_0.OPTION_ANIM_BOTH

	return {
		string.format("StoryOptionEffect%s", var_4_0),
		string.format("StoryOptionEffect%sIcon", var_4_1)
	}, var_4_2
end

function var_0_0.IsValid(arg_5_0, arg_5_1)
	if arg_5_0.code == -1 then
		return true
	end

	if type(arg_5_0.code) == "string" or type(arg_5_0.code) == "number" then
		return arg_5_0.code == arg_5_1
	elseif type(arg_5_0.code) == "table" then
		return table.contains(arg_5_0.code, arg_5_1)
	end

	return false
end

function var_0_0.ShouldShake(arg_6_0)
	return arg_6_0.shakeTime > 0
end

function var_0_0.GetShakeTime(arg_7_0)
	return arg_7_0.shakeTime
end

function var_0_0.SetDefaultTb(arg_8_0, arg_8_1)
	if not arg_8_0.defaultTb or arg_8_0.defaultTb <= 0 then
		arg_8_0.defaultTb = arg_8_1
	end
end

function var_0_0.SetPlaceholderType(arg_9_0, arg_9_1)
	arg_9_0.placeholderType = arg_9_1
end

function var_0_0.ShouldReplacePlayer(arg_10_0)
	return bit.band(arg_10_0.placeholderType, Story.PLAYER) > 0
end

function var_0_0.ShouldReplaceTb(arg_11_0)
	return bit.band(arg_11_0.placeholderType, Story.TB) > 0
end

function var_0_0.ShouldReplaceDorm(arg_12_0)
	return bit.band(arg_12_0.placeholderType, Story.DORM) > 0
end

function var_0_0.ShouldReplaceCar2026(arg_13_0)
	return bit.band(arg_13_0.placeholderType, Story.CAR2026) > 0
end

function var_0_0.ReplacePlayerName(arg_14_0, arg_14_1)
	if not getProxy(PlayerProxy) or not getProxy(PlayerProxy):getRawData() then
		return arg_14_1
	end

	local var_14_0 = getProxy(PlayerProxy):getRawData():GetName()

	arg_14_1 = string.gsub(arg_14_1, "{playername}", var_14_0)

	return arg_14_1
end

function var_0_0.ReplaceTbName(arg_15_0, arg_15_1)
	if pg.NewStoryMgr.GetInstance():IsReView() then
		return string.gsub(arg_15_1, "{tb}", i18n("child_story_name"))
	end

	if not getProxy(EducateProxy) or not getProxy(NewEducateProxy) then
		return arg_15_1
	end

	if not getProxy(NewEducateProxy):GetCurChar() then
		local var_15_0, var_15_1 = getProxy(EducateProxy):GetStoryInfo()

		arg_15_1 = string.gsub(arg_15_1, "{tb}", var_15_1)
	else
		local var_15_2, var_15_3 = getProxy(NewEducateProxy):GetStoryInfo()

		arg_15_1 = string.gsub(arg_15_1, "{tb}", var_15_3)
	end

	return arg_15_1
end

function var_0_0.ReplaceDormName(arg_16_0, arg_16_1)
	if not arg_16_0.actorName then
		return arg_16_1
	end

	local var_16_0 = getProxy(ApartmentProxy):getApartment(arg_16_0.actorName)
	local var_16_1 = var_16_0 and var_16_0:GetCallName() or arg_16_0.actorName

	arg_16_1 = string.gsub(arg_16_1, "{dorm3d}", var_16_1)

	return arg_16_1
end

function var_0_0.ReplaceCar2026Name(arg_17_0, arg_17_1)
	local var_17_0 = getProxy(ActivityProxy)
	local var_17_1 = var_17_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)
	local var_17_2 = ""

	if getProxy(PlayerProxy) then
		var_17_2 = getProxy(PlayerProxy):getRawData():GetName()
	end

	if var_17_1 then
		local var_17_3 = var_17_1:getConfig("config_client").link_act
		local var_17_4 = var_17_0:RawGetActivityById(var_17_3)

		if var_17_4 and not var_17_4:isEnd() then
			var_17_2 = var_17_4.str_data1
		end
	end

	return string.gsub(arg_17_1, "{car2026}", var_17_2)
end

function var_0_0.ExistDispatcher(arg_18_0)
	return arg_18_0.dispatcher ~= nil
end

function var_0_0.GetDispatcher(arg_19_0)
	return arg_19_0.dispatcher
end

function var_0_0.IsRecallDispatcher(arg_20_0)
	if not arg_20_0:ExistDispatcher() then
		return false
	end

	local var_20_0 = arg_20_0:GetDispatcher()

	return var_20_0.callbackData ~= nil and var_20_0.callbackData.name ~= nil
end

function var_0_0.GetDispatcherRecallName(arg_21_0)
	if not arg_21_0:IsRecallDispatcher() then
		return nil
	end

	return arg_21_0:GetDispatcher().callbackData.name
end

function var_0_0.ShouldHideUI(arg_22_0)
	if not arg_22_0:IsRecallDispatcher() then
		return false
	end

	return arg_22_0:GetDispatcher().callbackData.hideUI == true
end

function var_0_0.ExistIcon(arg_23_0)
	return arg_23_0.icon ~= nil
end

function var_0_0.GetIconData(arg_24_0)
	return arg_24_0.icon
end

function var_0_0.SetId(arg_25_0, arg_25_1)
	arg_25_0.id = arg_25_1
end

function var_0_0.GetId(arg_26_0)
	return arg_26_0.id
end

function var_0_0.AutoShowOption(arg_27_0)
	arg_27_0.autoShowOption = true
end

function var_0_0.SkipEventForOption(arg_28_0)
	return arg_28_0:ExistOption() and arg_28_0.autoShowOption
end

function var_0_0.IsRecallOption(arg_29_0)
	if arg_29_0:ExistOption() and arg_29_0:GetOptionCnt() > 1 and arg_29_0.recallOption then
		return true
	end

	return false
end

function var_0_0.IsOptionForceCenter(arg_30_0)
	return arg_30_0.optionForceCenter
end

function var_0_0.SetBranchCode(arg_31_0, arg_31_1)
	arg_31_0.selectedBranchCode = arg_31_1
end

function var_0_0.GetSelectedBranchCode(arg_32_0)
	return arg_32_0.selectedBranchCode
end

function var_0_0.ExistLocation(arg_33_0)
	return arg_33_0.location ~= nil
end

function var_0_0.GetLocation(arg_34_0)
	return {
		text = arg_34_0.location[1] or "",
		time = arg_34_0.location[2] or 999
	}
end

function var_0_0.ExistMovableNode(arg_35_0)
	return arg_35_0.movableNode ~= nil and type(arg_35_0.movableNode) == "table" and #arg_35_0.movableNode > 0
end

function var_0_0.GetPathByString(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = {}
	local var_36_1 = pg.NewStoryMgr.GetInstance():GetRectSize()
	local var_36_2 = Vector3(-var_36_1.x * 0.5, var_36_1.y * 0.5, 0)
	local var_36_3 = Vector3(var_36_1.x * 0.5, var_36_1.y * 0.5, 0)
	local var_36_4 = Vector3(-var_36_1.x * 0.5, -var_36_1.y * 0.5, 0)
	local var_36_5 = Vector3(var_36_1.x * 0.5, -var_36_1.y * 0.5, 0)
	local var_36_6 = arg_36_2 or 200

	if arg_36_1 == "LTLB" then
		local var_36_7 = Vector3(var_36_6, 0, 0)

		var_36_0 = {
			var_36_2 + var_36_7,
			var_36_4 + var_36_7
		}
	elseif arg_36_1 == "LBLT" then
		local var_36_8 = Vector3(var_36_6, 0, 0)

		var_36_0 = {
			var_36_4 + var_36_8,
			var_36_2 + var_36_8
		}
	elseif arg_36_1 == "LTRT" then
		local var_36_9 = Vector3(0, -var_36_6, 0)

		var_36_0 = {
			var_36_2 + var_36_9,
			var_36_3 + var_36_9
		}
	elseif arg_36_1 == "RTLT" then
		local var_36_10 = Vector3(0, -var_36_6, 0)

		var_36_0 = {
			var_36_3 + var_36_10,
			var_36_2 + var_36_10
		}
	elseif arg_36_1 == "RTRB" then
		local var_36_11 = Vector3(var_36_6, 0, 0)

		var_36_0 = {
			var_36_3 + var_36_11,
			var_36_5 + var_36_11
		}
	elseif arg_36_1 == "RBRT" then
		local var_36_12 = Vector3(var_36_6, 0, 0)

		var_36_0 = {
			var_36_5 + var_36_12,
			var_36_3 + var_36_12
		}
	elseif arg_36_1 == "LBRB" then
		local var_36_13 = Vector3(0, -(arg_36_2 or 0), 0)

		var_36_0 = {
			var_36_4 + var_36_13,
			var_36_5 + var_36_13
		}
	elseif arg_36_1 == "RBLB" then
		local var_36_14 = Vector3(0, -(arg_36_2 or 0), 0)

		var_36_0 = {
			var_36_5 + var_36_14,
			var_36_4 + var_36_14
		}
	end

	return var_36_0
end

function var_0_0.GenMoveNode(arg_37_0, arg_37_1)
	local var_37_0 = {}

	if type(arg_37_1.path) == "table" then
		for iter_37_0, iter_37_1 in ipairs(arg_37_1.path) do
			table.insert(var_37_0, Vector3(iter_37_1[1], iter_37_1[2], 0))
		end
	elseif type(arg_37_1.path) == "string" then
		var_37_0 = arg_37_0:GetPathByString(arg_37_1.path, arg_37_1.offset)
	else
		var_37_0 = arg_37_0:GetPathByString("LTRT")
	end

	local var_37_1 = type(arg_37_1.spine) == "table" or arg_37_1.spine == true
	local var_37_2

	if arg_37_1.spine == true then
		var_37_2 = {
			action = "walk",
			scale = 0.5
		}
	elseif var_37_1 then
		var_37_2 = {
			action = arg_37_1.spine.action or "walk",
			scale = arg_37_1.spine.scale or 0.5
		}
	end

	return {
		name = arg_37_1.name,
		isSpine = var_37_1,
		spineData = var_37_2,
		path = var_37_0,
		time = arg_37_1.time,
		delay = arg_37_1.delay or 0,
		easeType = arg_37_1.easeType or LeanTweenType.linear
	}
end

function var_0_0.GetMovableNode(arg_38_0)
	if not arg_38_0:ExistMovableNode() then
		return {}
	end

	local var_38_0 = {}

	for iter_38_0, iter_38_1 in pairs(arg_38_0.movableNode or {}) do
		local var_38_1 = arg_38_0:GenMoveNode(iter_38_1)

		table.insert(var_38_0, var_38_1)
	end

	return var_38_0
end

function var_0_0.OldPhotoEffect(arg_39_0)
	return arg_39_0.oldPhoto
end

function var_0_0.ShouldBgGlitchArt(arg_40_0)
	return arg_40_0.bgGlitchArt
end

function var_0_0.IsSameBranch(arg_41_0, arg_41_1)
	return not arg_41_0.branchCode or arg_41_0.branchCode == arg_41_1
end

function var_0_0.IsGlobalFlagHit(arg_42_0)
	local var_42_0 = var_0_0.GetGlobalFlagKey(arg_42_0.globalBranchCode.id)
	local var_42_1 = 1
	local var_42_2 = 0

	while PlayerPrefs.HasKey(var_42_0 .. var_42_1) do
		var_42_2 = var_42_2 + PlayerPrefs.GetInt(var_42_0 .. var_42_1)
		var_42_1 = var_42_1 + 1
	end

	local var_42_3 = arg_42_0.globalBranchCode.section

	for iter_42_0, iter_42_1 in ipairs(var_42_3) do
		if var_42_2 >= iter_42_1[1] and var_42_2 <= iter_42_1[2] then
			return true
		end
	end

	return false
end

function var_0_0.GetGlobalFlagKey(arg_43_0)
	return getProxy(PlayerProxy):getRawData().id .. "GlobalStoryFlag_" .. arg_43_0 .. "_"
end

function var_0_0.GetMode(arg_44_0)
	assert(false, "should override this function")
end

function var_0_0.GetFlashoutData(arg_45_0)
	if arg_45_0.flashout then
		local var_45_0 = arg_45_0.flashout.alpha[1]
		local var_45_1 = arg_45_0.flashout.alpha[2]
		local var_45_2 = arg_45_0.flashout.dur
		local var_45_3 = arg_45_0.flashout.black

		return var_45_0, var_45_1, var_45_2, var_45_3
	end
end

function var_0_0.GetFlashinData(arg_46_0)
	if arg_46_0.flashin then
		local var_46_0 = arg_46_0.flashin.alpha[1]
		local var_46_1 = arg_46_0.flashin.alpha[2]
		local var_46_2 = arg_46_0.flashin.dur
		local var_46_3 = arg_46_0.flashin.black
		local var_46_4 = arg_46_0.flashin.delay

		return var_46_0, var_46_1, var_46_2, var_46_3, var_46_4
	end
end

function var_0_0.GetBgColor(arg_47_0)
	return Color.New(arg_47_0.bgColor[1] or 0, arg_47_0.bgColor[2] or 0, arg_47_0.bgColor[3] or 0)
end

function var_0_0.IsBlackBg(arg_48_0)
	return arg_48_0.blackBg
end

function var_0_0.GetBgName(arg_49_0)
	return arg_49_0.bgName
end

function var_0_0.GetBgShadow(arg_50_0)
	return arg_50_0.bgShadow
end

function var_0_0.IsDialogueMode(arg_51_0)
	return arg_51_0:GetMode() == Story.MODE_DIALOGUE
end

function var_0_0.GetBgmData(arg_52_0)
	return arg_52_0.bgm, arg_52_0.bgmDelay, arg_52_0.bgmVolume
end

function var_0_0.ShoulePlayBgm(arg_53_0)
	return arg_53_0.bgm ~= nil
end

function var_0_0.ShouldStopBgm(arg_54_0)
	return arg_54_0.stopbgm
end

function var_0_0.GetEffects(arg_55_0)
	return arg_55_0.effects
end

function var_0_0.ShouldBlink(arg_56_0)
	return arg_56_0.blink ~= nil
end

function var_0_0.GetBlinkData(arg_57_0)
	return arg_57_0.blink
end

function var_0_0.ShouldBlinkWithColor(arg_58_0)
	return arg_58_0.blinkWithColor ~= nil
end

function var_0_0.GetBlinkWithColorData(arg_59_0)
	return arg_59_0.blinkWithColor
end

function var_0_0.ShouldPlaySoundEffect(arg_60_0)
	return arg_60_0.soundeffect ~= nil
end

function var_0_0.GetSoundeffect(arg_61_0)
	return arg_61_0.soundeffect, arg_61_0.seDelay
end

function var_0_0.ShouldPlayVoice(arg_62_0)
	return arg_62_0.voice ~= nil
end

function var_0_0.ShouldStopVoice(arg_63_0)
	return arg_63_0.stopVoice
end

function var_0_0.GetVoice(arg_64_0)
	return arg_64_0.voice, arg_64_0.voiceDelay
end

function var_0_0.ExistOption(arg_65_0)
	return arg_65_0.options ~= nil and #arg_65_0.options > 0
end

function var_0_0.GetOptionCnt(arg_66_0)
	if arg_66_0:ExistOption() then
		return #arg_66_0.options
	else
		return 0
	end
end

function var_0_0.SetOptionSelCodes(arg_67_0, arg_67_1)
	arg_67_0.optionSelCode = arg_67_1
end

function var_0_0.IsBlackFrontGround(arg_68_0)
	return arg_68_0.blackFg > 0, Mathf.Clamp01(arg_68_0.blackFg)
end

function var_0_0.GetOptionIndexByAutoSel(arg_69_0)
	local var_69_0 = 0
	local var_69_1 = 0

	for iter_69_0, iter_69_1 in ipairs(arg_69_0.options) do
		if arg_69_0.optionSelCode and iter_69_1.flag == arg_69_0.optionSelCode then
			var_69_0 = iter_69_0

			break
		end

		if iter_69_1.autochoice and iter_69_1.autochoice == 1 then
			var_69_1 = iter_69_0
		end
	end

	if var_69_0 > 0 then
		return var_69_0
	end

	if var_69_1 > 0 then
		return var_69_1
	end

	return nil
end

function var_0_0.IsImport(arg_70_0)
	return arg_70_0.important
end

function var_0_0.SetOptionIndex(arg_71_0, arg_71_1)
	arg_71_0.optionIndex = arg_71_1
end

function var_0_0.GetOptionIndex(arg_72_0)
	return arg_72_0.optionIndex
end

function var_0_0.GetOptions(arg_73_0)
	return _.map(arg_73_0.options or {}, function(arg_74_0)
		local var_74_0 = arg_74_0.content

		if arg_73_0:ShouldReplacePlayer() then
			var_74_0 = arg_73_0:ReplacePlayerName(var_74_0)
		end

		if arg_73_0:ShouldReplaceTb() then
			var_74_0 = arg_73_0:ReplaceTbName(var_74_0)
		end

		if arg_73_0:ShouldReplaceDorm() then
			var_74_0 = arg_73_0:ReplaceDormName(var_74_0)
		end

		if arg_73_0:ShouldReplaceCar2026() then
			var_74_0 = arg_73_0:ReplaceCar2026Name(var_74_0)
		end

		local var_74_1 = HXSet.hxLan(var_74_0)

		return {
			var_74_1,
			arg_74_0.flag,
			arg_74_0.type,
			arg_74_0.globalFlag
		}
	end)
end

function var_0_0.ShouldJumpToNextScript(arg_75_0)
	return arg_75_0.nextScriptName ~= nil
end

function var_0_0.GetNextScriptName(arg_76_0)
	return arg_76_0.nextScriptName
end

function var_0_0.ShouldDelayEvent(arg_77_0)
	return arg_77_0.eventDelay and arg_77_0.eventDelay > 0
end

function var_0_0.GetEventDelayTime(arg_78_0)
	return arg_78_0.eventDelay
end

function var_0_0.GetUsingPaintingNames(arg_79_0)
	return {}
end

function var_0_0.GetResList(arg_80_0)
	local var_80_0 = {}
	local var_80_1 = arg_80_0:GetBgName()

	if var_80_1 then
		table.insert(var_80_0, var_80_1)
	end

	if arg_80_0.GetSubBg then
		local var_80_2 = arg_80_0:GetSubBg()

		if var_80_2 then
			table.insert(var_80_0, var_80_2)
		end
	end

	local var_80_3 = _.map(var_80_0, function(arg_81_0)
		return ResPathSupport.CombinePath(ResPathSupport.ConstPath.BG.Base, arg_81_0)
	end)
	local var_80_4 = {}
	local var_80_5 = {}
	local var_80_6, var_80_7, var_80_8 = arg_80_0:GetBgmData()

	if var_80_6 then
		table.insert(var_80_4, var_80_6)
	end

	if arg_80_0:ShouldPlaySoundEffect() then
		local var_80_9, var_80_10 = arg_80_0:GetSoundeffect()

		if var_80_9 then
			local var_80_11 = pg.CriMgr.GetInstance():CheckFModeEvent(var_80_9, function()
				return
			end, function()
				return
			end)

			if var_80_11 then
				table.insert(var_80_4, var_80_11)
			end
		end
	end

	if arg_80_0:ShouldPlayVoice() then
		local var_80_12, var_80_13 = arg_80_0:GetVoice()

		if var_80_12 then
			local var_80_14 = pg.CriMgr.GetInstance():CheckFModeEvent(var_80_12, function()
				return
			end, function()
				return
			end)

			if var_80_14 then
				table.insert(var_80_4, var_80_14)
			end
		end
	end

	_.each(var_80_4, function(arg_86_0)
		local var_86_0 = ResPathSupport.GetSoundResList(arg_86_0)

		table.insertto(var_80_5, var_86_0)
	end)

	local var_80_15 = {}
	local var_80_16 = arg_80_0:GetEffects()

	_.each(var_80_16, function(arg_87_0)
		local var_87_0 = arg_87_0.name

		table.insert(var_80_15, var_87_0)
	end)

	local var_80_17 = {}

	_.each(var_80_15, function(arg_88_0)
		local var_88_0 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Base, arg_88_0)

		table.insert(var_80_17, var_88_0)

		local var_88_1 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Effect, arg_88_0)

		table.insert(var_80_17, var_88_1)
	end)

	local var_80_18 = {}

	if arg_80_0:ExistIcon() then
		local var_80_19 = arg_80_0:GetIconData()

		if var_80_19 and var_80_19.image then
			table.insert(var_80_18, var_80_19.image)
		end
	end

	local var_80_20 = {}
	local var_80_21 = StoryRecorder.New()

	var_80_21:Add(arg_80_0)

	local var_80_22 = var_80_21:GetContentList()

	_.each(var_80_22, function(arg_89_0)
		if arg_89_0.icon then
			local var_89_0 = ResPathSupport.GetPaintingSquareIconListByPaintingName(arg_89_0.icon)

			table.insertto(var_80_20, var_89_0)
		end
	end)

	return (ResPathSupport.MergeLuaArr(var_80_3, var_80_5, var_80_17, var_80_18, var_80_20))
end

return var_0_0
