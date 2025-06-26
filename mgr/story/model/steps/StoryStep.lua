local var_0_0 = class("StoryStep")

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
	arg_1_0.important = arg_1_1.important
	arg_1_0.branchCode = arg_1_1.optionFlag
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
end

function var_0_0.IsValid(arg_2_0, arg_2_1)
	if arg_2_0.code == -1 then
		return true
	end

	if type(arg_2_0.code) == "string" or type(arg_2_0.code) == "number" then
		return arg_2_0.code == arg_2_1
	elseif type(arg_2_0.code) == "table" then
		return table.contains(arg_2_0.code, arg_2_1)
	end

	return false
end

function var_0_0.ShouldShake(arg_3_0)
	return arg_3_0.shakeTime > 0
end

function var_0_0.GetShakeTime(arg_4_0)
	return arg_4_0.shakeTime
end

function var_0_0.SetDefaultTb(arg_5_0, arg_5_1)
	if not arg_5_0.defaultTb or arg_5_0.defaultTb <= 0 then
		arg_5_0.defaultTb = arg_5_1
	end
end

function var_0_0.SetPlaceholderType(arg_6_0, arg_6_1)
	arg_6_0.placeholderType = arg_6_1
end

function var_0_0.ShouldReplacePlayer(arg_7_0)
	return bit.band(arg_7_0.placeholderType, Story.PLAYER) > 0
end

function var_0_0.ShouldReplaceTb(arg_8_0)
	return bit.band(arg_8_0.placeholderType, Story.TB) > 0
end

function var_0_0.ShouldReplaceDorm(arg_9_0)
	return bit.band(arg_9_0.placeholderType, Story.DORM) > 0
end

function var_0_0.ReplacePlayerName(arg_10_0, arg_10_1)
	if not getProxy(PlayerProxy) or not getProxy(PlayerProxy):getRawData() then
		return arg_10_1
	end

	local var_10_0 = getProxy(PlayerProxy):getRawData():GetName()

	arg_10_1 = string.gsub(arg_10_1, "{playername}", var_10_0)

	return arg_10_1
end

function var_0_0.ReplaceTbName(arg_11_0, arg_11_1)
	if pg.NewStoryMgr.GetInstance():IsReView() then
		return string.gsub(arg_11_1, "{tb}", i18n("child_story_name"))
	end

	if not getProxy(EducateProxy) or not getProxy(NewEducateProxy) then
		return arg_11_1
	end

	if not getProxy(NewEducateProxy):GetCurChar() then
		local var_11_0, var_11_1 = getProxy(EducateProxy):GetStoryInfo()

		arg_11_1 = string.gsub(arg_11_1, "{tb}", var_11_1)
	else
		local var_11_2, var_11_3 = getProxy(NewEducateProxy):GetStoryInfo()

		arg_11_1 = string.gsub(arg_11_1, "{tb}", var_11_3)
	end

	return arg_11_1
end

function var_0_0.ReplaceDormName(arg_12_0, arg_12_1)
	if not arg_12_0.actorName then
		return arg_12_1
	end

	local var_12_0 = getProxy(ApartmentProxy):getApartment(arg_12_0.actorName)
	local var_12_1 = var_12_0 and var_12_0:GetCallName() or arg_12_0.actorName

	arg_12_1 = string.gsub(arg_12_1, "{dorm3d}", var_12_1)

	return arg_12_1
end

function var_0_0.ExistDispatcher(arg_13_0)
	return arg_13_0.dispatcher ~= nil
end

function var_0_0.GetDispatcher(arg_14_0)
	return arg_14_0.dispatcher
end

function var_0_0.IsRecallDispatcher(arg_15_0)
	if not arg_15_0:ExistDispatcher() then
		return false
	end

	local var_15_0 = arg_15_0:GetDispatcher()

	return var_15_0.callbackData ~= nil and var_15_0.callbackData.name ~= nil
end

function var_0_0.GetDispatcherRecallName(arg_16_0)
	if not arg_16_0:IsRecallDispatcher() then
		return nil
	end

	return arg_16_0:GetDispatcher().callbackData.name
end

function var_0_0.ShouldHideUI(arg_17_0)
	if not arg_17_0:IsRecallDispatcher() then
		return false
	end

	return arg_17_0:GetDispatcher().callbackData.hideUI == true
end

function var_0_0.ExistIcon(arg_18_0)
	return arg_18_0.icon ~= nil
end

function var_0_0.GetIconData(arg_19_0)
	return arg_19_0.icon
end

function var_0_0.SetId(arg_20_0, arg_20_1)
	arg_20_0.id = arg_20_1
end

function var_0_0.GetId(arg_21_0)
	return arg_21_0.id
end

function var_0_0.AutoShowOption(arg_22_0)
	arg_22_0.autoShowOption = true
end

function var_0_0.SkipEventForOption(arg_23_0)
	return arg_23_0:ExistOption() and arg_23_0.autoShowOption
end

function var_0_0.IsRecallOption(arg_24_0)
	if arg_24_0:ExistOption() and arg_24_0:GetOptionCnt() > 1 and arg_24_0.recallOption then
		return true
	end

	return false
end

function var_0_0.SetBranchCode(arg_25_0, arg_25_1)
	arg_25_0.selectedBranchCode = arg_25_1
end

function var_0_0.GetSelectedBranchCode(arg_26_0)
	return arg_26_0.selectedBranchCode
end

function var_0_0.ExistLocation(arg_27_0)
	return arg_27_0.location ~= nil
end

function var_0_0.GetLocation(arg_28_0)
	return {
		text = arg_28_0.location[1] or "",
		time = arg_28_0.location[2] or 999
	}
end

function var_0_0.ExistMovableNode(arg_29_0)
	return arg_29_0.movableNode ~= nil and type(arg_29_0.movableNode) == "table" and #arg_29_0.movableNode > 0
end

function var_0_0.GetPathByString(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = {}
	local var_30_1 = pg.NewStoryMgr.GetInstance():GetRectSize()
	local var_30_2 = Vector3(-var_30_1.x * 0.5, var_30_1.y * 0.5, 0)
	local var_30_3 = Vector3(var_30_1.x * 0.5, var_30_1.y * 0.5, 0)
	local var_30_4 = Vector3(-var_30_1.x * 0.5, -var_30_1.y * 0.5, 0)
	local var_30_5 = Vector3(var_30_1.x * 0.5, -var_30_1.y * 0.5, 0)
	local var_30_6 = arg_30_2 or 200

	if arg_30_1 == "LTLB" then
		local var_30_7 = Vector3(var_30_6, 0, 0)

		var_30_0 = {
			var_30_2 + var_30_7,
			var_30_4 + var_30_7
		}
	elseif arg_30_1 == "LBLT" then
		local var_30_8 = Vector3(var_30_6, 0, 0)

		var_30_0 = {
			var_30_4 + var_30_8,
			var_30_2 + var_30_8
		}
	elseif arg_30_1 == "LTRT" then
		local var_30_9 = Vector3(0, -var_30_6, 0)

		var_30_0 = {
			var_30_2 + var_30_9,
			var_30_3 + var_30_9
		}
	elseif arg_30_1 == "RTLT" then
		local var_30_10 = Vector3(0, -var_30_6, 0)

		var_30_0 = {
			var_30_3 + var_30_10,
			var_30_2 + var_30_10
		}
	elseif arg_30_1 == "RTRB" then
		local var_30_11 = Vector3(var_30_6, 0, 0)

		var_30_0 = {
			var_30_3 + var_30_11,
			var_30_5 + var_30_11
		}
	elseif arg_30_1 == "RBRT" then
		local var_30_12 = Vector3(var_30_6, 0, 0)

		var_30_0 = {
			var_30_5 + var_30_12,
			var_30_3 + var_30_12
		}
	elseif arg_30_1 == "LBRB" then
		local var_30_13 = Vector3(0, -(arg_30_2 or 0), 0)

		var_30_0 = {
			var_30_4 + var_30_13,
			var_30_5 + var_30_13
		}
	elseif arg_30_1 == "RBLB" then
		local var_30_14 = Vector3(0, -(arg_30_2 or 0), 0)

		var_30_0 = {
			var_30_5 + var_30_14,
			var_30_4 + var_30_14
		}
	end

	return var_30_0
end

function var_0_0.GenMoveNode(arg_31_0, arg_31_1)
	local var_31_0 = {}

	if type(arg_31_1.path) == "table" then
		for iter_31_0, iter_31_1 in ipairs(arg_31_1.path) do
			table.insert(var_31_0, Vector3(iter_31_1[1], iter_31_1[2], 0))
		end
	elseif type(arg_31_1.path) == "string" then
		var_31_0 = arg_31_0:GetPathByString(arg_31_1.path, arg_31_1.offset)
	else
		var_31_0 = arg_31_0:GetPathByString("LTRT")
	end

	local var_31_1 = type(arg_31_1.spine) == "table" or arg_31_1.spine == true
	local var_31_2

	if arg_31_1.spine == true then
		var_31_2 = {
			action = "walk",
			scale = 0.5
		}
	elseif var_31_1 then
		var_31_2 = {
			action = arg_31_1.spine.action or "walk",
			scale = arg_31_1.spine.scale or 0.5
		}
	end

	return {
		name = arg_31_1.name,
		isSpine = var_31_1,
		spineData = var_31_2,
		path = var_31_0,
		time = arg_31_1.time,
		delay = arg_31_1.delay or 0,
		easeType = arg_31_1.easeType or LeanTweenType.linear
	}
end

function var_0_0.GetMovableNode(arg_32_0)
	if not arg_32_0:ExistMovableNode() then
		return {}
	end

	local var_32_0 = {}

	for iter_32_0, iter_32_1 in pairs(arg_32_0.movableNode or {}) do
		local var_32_1 = arg_32_0:GenMoveNode(iter_32_1)

		table.insert(var_32_0, var_32_1)
	end

	return var_32_0
end

function var_0_0.OldPhotoEffect(arg_33_0)
	return arg_33_0.oldPhoto
end

function var_0_0.ShouldBgGlitchArt(arg_34_0)
	return arg_34_0.bgGlitchArt
end

function var_0_0.IsSameBranch(arg_35_0, arg_35_1)
	return not arg_35_0.branchCode or arg_35_0.branchCode == arg_35_1
end

function var_0_0.GetMode(arg_36_0)
	assert(false, "should override this function")
end

function var_0_0.GetFlashoutData(arg_37_0)
	if arg_37_0.flashout then
		local var_37_0 = arg_37_0.flashout.alpha[1]
		local var_37_1 = arg_37_0.flashout.alpha[2]
		local var_37_2 = arg_37_0.flashout.dur
		local var_37_3 = arg_37_0.flashout.black

		return var_37_0, var_37_1, var_37_2, var_37_3
	end
end

function var_0_0.GetFlashinData(arg_38_0)
	if arg_38_0.flashin then
		local var_38_0 = arg_38_0.flashin.alpha[1]
		local var_38_1 = arg_38_0.flashin.alpha[2]
		local var_38_2 = arg_38_0.flashin.dur
		local var_38_3 = arg_38_0.flashin.black
		local var_38_4 = arg_38_0.flashin.delay

		return var_38_0, var_38_1, var_38_2, var_38_3, var_38_4
	end
end

function var_0_0.GetBgColor(arg_39_0)
	return Color.New(arg_39_0.bgColor[1] or 0, arg_39_0.bgColor[2] or 0, arg_39_0.bgColor[3] or 0)
end

function var_0_0.IsBlackBg(arg_40_0)
	return arg_40_0.blackBg
end

function var_0_0.GetBgName(arg_41_0)
	return arg_41_0.bgName
end

function var_0_0.GetBgShadow(arg_42_0)
	return arg_42_0.bgShadow
end

function var_0_0.IsDialogueMode(arg_43_0)
	return arg_43_0:GetMode() == Story.MODE_DIALOGUE
end

function var_0_0.GetBgmData(arg_44_0)
	return arg_44_0.bgm, arg_44_0.bgmDelay, arg_44_0.bgmVolume
end

function var_0_0.ShoulePlayBgm(arg_45_0)
	return arg_45_0.bgm ~= nil
end

function var_0_0.ShouldStopBgm(arg_46_0)
	return arg_46_0.stopbgm
end

function var_0_0.GetEffects(arg_47_0)
	return arg_47_0.effects
end

function var_0_0.ShouldBlink(arg_48_0)
	return arg_48_0.blink ~= nil
end

function var_0_0.GetBlinkData(arg_49_0)
	return arg_49_0.blink
end

function var_0_0.ShouldBlinkWithColor(arg_50_0)
	return arg_50_0.blinkWithColor ~= nil
end

function var_0_0.GetBlinkWithColorData(arg_51_0)
	return arg_51_0.blinkWithColor
end

function var_0_0.ShouldPlaySoundEffect(arg_52_0)
	return arg_52_0.soundeffect ~= nil
end

function var_0_0.GetSoundeffect(arg_53_0)
	return arg_53_0.soundeffect, arg_53_0.seDelay
end

function var_0_0.ShouldPlayVoice(arg_54_0)
	return arg_54_0.voice ~= nil
end

function var_0_0.ShouldStopVoice(arg_55_0)
	return arg_55_0.stopVoice
end

function var_0_0.GetVoice(arg_56_0)
	return arg_56_0.voice, arg_56_0.voiceDelay
end

function var_0_0.ExistOption(arg_57_0)
	return arg_57_0.options ~= nil and #arg_57_0.options > 0
end

function var_0_0.GetOptionCnt(arg_58_0)
	if arg_58_0:ExistOption() then
		return #arg_58_0.options
	else
		return 0
	end
end

function var_0_0.SetOptionSelCodes(arg_59_0, arg_59_1)
	arg_59_0.optionSelCode = arg_59_1
end

function var_0_0.IsBlackFrontGround(arg_60_0)
	return arg_60_0.blackFg > 0, Mathf.Clamp01(arg_60_0.blackFg)
end

function var_0_0.GetOptionIndexByAutoSel(arg_61_0)
	local var_61_0 = 0
	local var_61_1 = 0

	for iter_61_0, iter_61_1 in ipairs(arg_61_0.options) do
		if arg_61_0.optionSelCode and iter_61_1.flag == arg_61_0.optionSelCode then
			var_61_0 = iter_61_0

			break
		end

		if iter_61_1.autochoice and iter_61_1.autochoice == 1 then
			var_61_1 = iter_61_0
		end
	end

	if var_61_0 > 0 then
		return var_61_0
	end

	if var_61_1 > 0 then
		return var_61_1
	end

	return nil
end

function var_0_0.IsImport(arg_62_0)
	return arg_62_0.important
end

function var_0_0.SetOptionIndex(arg_63_0, arg_63_1)
	arg_63_0.optionIndex = arg_63_1
end

function var_0_0.GetOptionIndex(arg_64_0)
	return arg_64_0.optionIndex
end

function var_0_0.GetOptions(arg_65_0)
	return _.map(arg_65_0.options or {}, function(arg_66_0)
		local var_66_0 = arg_66_0.content

		if arg_65_0:ShouldReplacePlayer() then
			var_66_0 = arg_65_0:ReplacePlayerName(var_66_0)
		end

		if arg_65_0:ShouldReplaceTb() then
			var_66_0 = arg_65_0:ReplaceTbName(var_66_0)
		end

		if arg_65_0:ShouldReplaceDorm() then
			var_66_0 = arg_65_0:ReplaceDormName(var_66_0)
		end

		local var_66_1 = HXSet.hxLan(var_66_0)

		return {
			var_66_1,
			arg_66_0.flag,
			arg_66_0.type
		}
	end)
end

function var_0_0.ShouldJumpToNextScript(arg_67_0)
	return arg_67_0.nextScriptName ~= nil
end

function var_0_0.GetNextScriptName(arg_68_0)
	return arg_68_0.nextScriptName
end

function var_0_0.ShouldDelayEvent(arg_69_0)
	return arg_69_0.eventDelay and arg_69_0.eventDelay > 0
end

function var_0_0.GetEventDelayTime(arg_70_0)
	return arg_70_0.eventDelay
end

function var_0_0.GetUsingPaintingNames(arg_71_0)
	return {}
end

return var_0_0
