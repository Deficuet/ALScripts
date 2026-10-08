local var_0_0 = class("DialogueStep", import(".StoryStep"))

var_0_0.SIDE_LEFT = 0
var_0_0.SIDE_RIGHT = 1
var_0_0.SIDE_MIDDLE = 2
var_0_0.ACTOR_TYPE_PLAYER = 0
var_0_0.ACTOR_TYPE_FLAGSHIP = -1
var_0_0.ACTOR_TYPE_TB = -2
var_0_0.PAINTING_ACTION_MOVE = "move"
var_0_0.PAINTING_ACTION_SHAKE = "shake"
var_0_0.PAINTING_ACTION_ZOOM = "zoom"
var_0_0.PAINTING_ACTION_ROTATE = "rotate"

local var_0_1 = pg.ship_skin_template

local function var_0_2(arg_1_0)
	local var_1_0 = string.lower(arg_1_0)

	if var_1_0 == "#a9f548" or var_1_0 == "#a9f548ff" then
		return "#5CE6FF"
	elseif var_1_0 == "#ff5c5c" then
		return "#FF9B93"
	elseif var_1_0 == "#ffa500" then
		return "#FFC960"
	elseif var_1_0 == "#ffff4d" then
		return "#FEF15E"
	elseif var_1_0 == "#696969" then
		return "#BDBDBD"
	elseif var_1_0 == "#a020f0" then
		return "#C3ABFF"
	elseif var_1_0 == "#ffffff" then
		return "#FFFFFF"
	else
		return arg_1_0
	end
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	var_0_0.super.Ctor(arg_2_0, arg_2_1)

	arg_2_0.actor = arg_2_1.actor

	if arg_2_1.nameColor then
		arg_2_0.nameColor = var_0_2(arg_2_1.nameColor)
	else
		arg_2_0.nameColor = COLOR_WHITE
	end

	arg_2_0.specialTbId = nil

	if arg_2_1.tbActor then
		arg_2_0.specialTbId = arg_2_0.actor
		arg_2_0.actor = var_0_0.ACTOR_TYPE_TB
	end

	arg_2_0.actorName = arg_2_1.actorName
	arg_2_0.subActorName = arg_2_1.factiontag
	arg_2_0.subActorNameColor = arg_2_1.factiontagColor or "#FFFFFF"
	arg_2_0.withoutActorName = arg_2_1.withoutActorName
	arg_2_0.say = arg_2_1.say
	arg_2_0.sayColor = arg_2_1.sayColor or COLOR_WHITE
	arg_2_0.dynamicBgType = arg_2_1.dynamicBgType
	arg_2_0.fontSize = arg_2_1.fontsize
	arg_2_0.side = arg_2_1.side
	arg_2_0.dir = arg_2_1.dir

	if arg_2_0.dir == 0 then
		arg_2_0.dir = 1
	end

	arg_2_0.nextIcon = arg_2_1.NextIcon or 0
	arg_2_0.expression = arg_2_1.expression
	arg_2_0.typewriter = arg_2_1.typewriter
	arg_2_0.painting = arg_2_1.painting
	arg_2_0.fadeInPaintingTime = arg_2_1.fadeInPaintingTime or 0.15
	arg_2_0.fadeOutPaintingTime = arg_2_1.fadeOutPaintingTime or 0.15
	arg_2_0.actorPosition = arg_2_1.actorPosition
	arg_2_0.dialogShake = arg_2_1.dialogShake
	arg_2_0.moveSideData = arg_2_1.paintingFadeOut
	arg_2_0.paingtingGray = arg_2_1.paingtingGray
	arg_2_0.glitchArt = arg_2_1.paintingNoise
	arg_2_0.hideOtherPainting = arg_2_1.hideOther
	arg_2_0.subPaintings = arg_2_1.subActors
	arg_2_0.disappearSeq = {}
	arg_2_0.disappearTime = {
		0,
		0
	}

	if arg_2_0.subPaintings and #arg_2_0.subPaintings > 0 and arg_2_1.disappearSeq then
		arg_2_0.disappearSeq = arg_2_1.disappearSeq
		arg_2_0.disappearTime = arg_2_1.disappearTime or {
			0,
			0
		}
	end

	arg_2_0.hideRecordIco = arg_2_1.hideRecordIco
	arg_2_0.paingtingScale = arg_2_1.actorScale
	arg_2_0.paingtingZRot = arg_2_1.actor_rotation or 0
	arg_2_0.paingtingYFlip = arg_2_1.actorYFlip
	arg_2_0.hidePainting = arg_2_1.withoutPainting
	arg_2_0.hidePaintingWithName = arg_2_1.hidePainting
	arg_2_0.actorShadow = arg_2_1.actorShadow
	arg_2_0.actorAlpha = arg_2_1.actorAlpha
	arg_2_0.showNPainting = arg_2_1.hidePaintObj
	arg_2_0.hasPaintbg = arg_2_1.hasPaintbg
	arg_2_0.showWJZPainting = arg_2_1.hidePaintEquip
	arg_2_0.hideDialogFragment = arg_2_1.hideDialogFragment
	arg_2_0.nohead = arg_2_1.nohead
	arg_2_0.live2d = arg_2_1.live2d
	arg_2_0.live2dIdleIndex = arg_2_1.live2dIdleIndex
	arg_2_0.live2dParams = arg_2_1.live2dParams
	arg_2_0.spine = arg_2_1.spine
	arg_2_0.spinePos = arg_2_1.spinePos or {
		0,
		0,
		0
	}
	arg_2_0.spineOrderIndex = arg_2_1.spineOrderIndex
	arg_2_0.live2dOffset = arg_2_1.live2dOffset
	arg_2_0.contentBGAlpha = arg_2_1.dialogueBgAlpha or 1
	arg_2_0.canMarkNode = arg_2_1.canMarkNode
	arg_2_0.portrait = arg_2_1.portrait
	arg_2_0.miniPortrait = false

	if arg_2_0.portrait and (arg_2_0.portrait == "zhihuiguan" or arg_2_0.portrait == "tongxunqi") then
		arg_2_0.miniPortrait = true
	end

	arg_2_0.glitchArtForPortrait = arg_2_1.portraitNoise

	if arg_2_0.hidePainting or arg_2_0.actor == nil then
		arg_2_0.actor = nil
		arg_2_0.hideOtherPainting = true
	end

	if arg_2_0.hidePaintingWithName or arg_2_0.actor == nil then
		if arg_2_0.actorName == nil then
			arg_2_0.actorName = arg_2_0:GetName()
		end

		arg_2_0.actor = nil
		arg_2_0.hideOtherPainting = true
	end

	arg_2_0.paintRwIndex = arg_2_1.paintRwIndex or 0
	arg_2_0.action = arg_2_1.action or {}
end

function var_0_0.GetNextIcon(arg_3_0)
	return arg_3_0.nextIcon
end

function var_0_0.GetSpinePosition(arg_4_0)
	return BuildVector3(arg_4_0.spinePos)
end

function var_0_0.GetL2dParams(arg_5_0)
	if not arg_5_0.live2dParams then
		return nil
	end

	return {
		name = arg_5_0.live2dParams[1],
		value = arg_5_0.live2dParams[2]
	}
end

function var_0_0.SetDefaultSide(arg_6_0)
	arg_6_0.side = defaultValue(arg_6_0.side, var_0_0.SIDE_LEFT)
end

function var_0_0.GetBgName(arg_7_0)
	if arg_7_0.dynamicBgType and arg_7_0.dynamicBgType == var_0_0.ACTOR_TYPE_TB and getProxy(EducateProxy) and getProxy(NewEducateProxy) and not pg.NewStoryMgr.GetInstance():IsReView() then
		local var_7_0 = ""

		if not getProxy(NewEducateProxy):GetCurChar() then
			local var_7_1, var_7_2, var_7_3 = getProxy(EducateProxy):GetStoryInfo()

			var_7_0 = var_7_3
		else
			local var_7_4, var_7_5, var_7_6 = getProxy(NewEducateProxy):GetStoryInfo()

			var_7_0 = var_7_6
		end

		return (arg_7_0:Convert2StoryBg(var_7_0))
	else
		return var_0_0.super.GetBgName(arg_7_0)
	end
end

function var_0_0.Convert2StoryBg(arg_8_0, arg_8_1)
	return ({
		educate_tb_1 = "bg_project_tb_room1",
		educate_tb_2 = "bg_project_tb_room2",
		educate_tb_3 = "bg_project_tb_room3"
	})[arg_8_1] or arg_8_1
end

function var_0_0.GetPaintingRwIndex(arg_9_0)
	if not arg_9_0.glitchArt then
		return 0
	end

	if not arg_9_0.expression then
		return 0
	end

	return arg_9_0.paintRwIndex
end

function var_0_0.IsMiniPortrait(arg_10_0)
	return arg_10_0.miniPortrait
end

function var_0_0.ExistPortrait(arg_11_0)
	return arg_11_0.portrait ~= nil
end

function var_0_0.GetPortrait(arg_12_0)
	if type(arg_12_0.portrait) == "number" then
		return pg.ship_skin_template[arg_12_0.portrait].painting
	elseif type(arg_12_0.portrait) == "string" then
		return arg_12_0.portrait
	else
		return nil
	end
end

function var_0_0.ShouldHideDialogue(arg_13_0)
	return arg_13_0.hideDialogFragment
end

function var_0_0.ShouldGlitchArtForPortrait(arg_14_0)
	return arg_14_0.glitchArtForPortrait
end

function var_0_0.GetMode(arg_15_0)
	return Story.MODE_DIALOGUE
end

function var_0_0.GetContentBGAlpha(arg_16_0)
	return arg_16_0.contentBGAlpha
end

function var_0_0.GetSpineExPression(arg_17_0)
	if arg_17_0.expression then
		return arg_17_0.expression
	end
end

function var_0_0.GetExPression(arg_18_0)
	if arg_18_0.expression then
		return arg_18_0.expression
	else
		local var_18_0 = arg_18_0:GetPainting()

		if var_18_0 and ShipExpressionHelper.DefaultFaceless(var_18_0) then
			return ShipExpressionHelper.GetDefaultFace(var_18_0)
		end
	end
end

function var_0_0.ShouldAddHeadMaskWhenFade(arg_19_0)
	if arg_19_0:ShouldAddGlitchArtEffect() then
		return false
	end

	if arg_19_0:IsNoHeadPainting() then
		return false
	end

	if not arg_19_0:GetExPression() then
		return false
	end

	return true
end

function var_0_0.ShouldGrayingPainting(arg_20_0, arg_20_1)
	return arg_20_1:GetPainting() ~= nil and not arg_20_0:IsSameSide(arg_20_1)
end

function var_0_0.ShouldGrayingOutPainting(arg_21_0, arg_21_1)
	return arg_21_0:GetPainting() ~= nil and not arg_21_0:IsSameSide(arg_21_1)
end

function var_0_0.ShouldFadeInPainting(arg_22_0)
	if not arg_22_0:GetPainting() then
		return false
	end

	if arg_22_0:IsLive2dPainting() or arg_22_0:IsSpinePainting() then
		return false
	end

	local var_22_0 = arg_22_0:GetFadeInPaintingTime()

	if not var_22_0 or var_22_0 <= 0 then
		return false
	end

	return true
end

function var_0_0.GetTypewriter(arg_23_0)
	return arg_23_0.typewriter
end

function var_0_0.ShouldFaceBlack(arg_24_0)
	return arg_24_0.actorShadow
end

function var_0_0.GetPaintingData(arg_25_0)
	local var_25_0 = arg_25_0.painting or {}

	return {
		alpha = var_25_0.alpha or 0.3,
		time = var_25_0.time or 1
	}
end

function var_0_0.GetFadeInPaintingTime(arg_26_0)
	return arg_26_0.fadeInPaintingTime
end

function var_0_0.GetFadeOutPaintingTime(arg_27_0)
	return arg_27_0.fadeOutPaintingTime
end

function var_0_0.GetPaintingDir(arg_28_0)
	local var_28_0 = arg_28_0.paingtingScale or 1

	return (arg_28_0.dir or 1) * var_28_0
end

function var_0_0.GetPaintingZRotation(arg_29_0)
	return arg_29_0.paingtingZRot
end

function var_0_0.ShouldFlipPaintingY(arg_30_0)
	return arg_30_0.paingtingYFlip ~= nil
end

function var_0_0.GetTag(arg_31_0)
	if arg_31_0.glitchArt == true then
		return 2
	else
		return 1
	end
end

function var_0_0.GetPaintingAlpha(arg_32_0)
	return arg_32_0.actorAlpha
end

function var_0_0.GetPaitingOffst(arg_33_0)
	return arg_33_0.actorPosition
end

function var_0_0.GetSound(arg_34_0)
	return arg_34_0.sound
end

function var_0_0.GetPaintingActions(arg_35_0)
	return arg_35_0.action
end

function var_0_0.GetPaintingMoveToSide(arg_36_0)
	return arg_36_0.moveSideData
end

function var_0_0.ShouldMoveToSide(arg_37_0)
	return arg_37_0.moveSideData ~= nil
end

function var_0_0.GetPaintingAction(arg_38_0, arg_38_1)
	local var_38_0 = {}
	local var_38_1 = arg_38_0:GetPaintingActions()

	for iter_38_0, iter_38_1 in ipairs(var_38_1) do
		if iter_38_1.type == arg_38_1 then
			table.insert(var_38_0, iter_38_1)
		end
	end

	return var_38_0
end

function var_0_0.GetSide(arg_39_0)
	return arg_39_0.side
end

function var_0_0.GetContent(arg_40_0)
	if not arg_40_0.say then
		return "..."
	end

	local var_40_0 = arg_40_0.say

	if arg_40_0:ShouldReplacePlayer() then
		var_40_0 = arg_40_0:ReplacePlayerName(var_40_0)
	end

	if arg_40_0:ShouldReplaceTb() then
		var_40_0 = arg_40_0:ReplaceTbName(var_40_0)
	end

	if arg_40_0:ShouldReplaceDorm() then
		var_40_0 = arg_40_0:ReplaceDormName(var_40_0)
	end

	if arg_40_0:ShouldReplaceCar2026() then
		var_40_0 = arg_40_0:ReplaceCar2026Name(var_40_0)
	end

	if PLATFORM_CODE ~= PLATFORM_US then
		var_40_0 = SwitchSpecialChar(HXSet.hxLan(var_40_0), true)
	else
		var_40_0 = HXSet.hxLan(var_40_0)
	end

	return var_40_0
end

function var_0_0.GetContentColor(arg_41_0)
	return arg_41_0.sayColor or COLOR_WHITE
end

function var_0_0.GetNameWithColor(arg_42_0)
	local var_42_0 = arg_42_0:GetName()

	if not var_42_0 then
		return nil
	end

	local var_42_1 = arg_42_0:GetNameColor()

	return setColorStr(var_42_0, var_42_1)
end

function var_0_0.GetNameColor(arg_43_0)
	return arg_43_0.nameColor or COLOR_WHITE
end

function var_0_0.GetNameColorCode(arg_44_0)
	local var_44_0 = arg_44_0:GetNameColor()

	return string.gsub(var_44_0, "#", "")
end

function var_0_0.GetCustomActorName(arg_45_0)
	if type(arg_45_0.actorName) == "number" and arg_45_0.actorName == 0 and getProxy(PlayerProxy) then
		return getProxy(PlayerProxy):getRawData().name
	elseif type(arg_45_0.actorName) == "number" then
		return ShipGroup.getDefaultShipNameByGroupID(arg_45_0.actorName)
	elseif type(arg_45_0.actorName) == "string" then
		return arg_45_0.actorName
	else
		return ""
	end
end

function var_0_0.GetPortraitName(arg_46_0)
	if not arg_46_0:ExistPortrait() then
		return ""
	end

	if type(arg_46_0.portrait) ~= "number" then
		return ""
	end

	local var_46_0 = var_0_1[arg_46_0.portrait]

	if not var_46_0 then
		return ""
	end

	local var_46_1 = ""
	local var_46_2 = var_46_0.ship_group
	local var_46_3 = ShipGroup.getDefaultShipConfig(var_46_2)

	if not var_46_3 then
		var_46_1 = var_46_0.name
	else
		var_46_1 = Ship.getShipName(var_46_3.id)
	end

	return var_46_1
end

function var_0_0.GetName(arg_47_0)
	local var_47_0 = arg_47_0.actorName and arg_47_0:GetCustomActorName() or arg_47_0:GetPaintingAndName() or ""

	if not var_47_0 or var_47_0 == "" then
		var_47_0 = arg_47_0:GetPortraitName()
	end

	if not var_47_0 or var_47_0 == "" or arg_47_0.withoutActorName then
		return nil
	end

	if arg_47_0:ShouldReplacePlayer() then
		var_47_0 = arg_47_0:ReplacePlayerName(var_47_0)
	end

	if arg_47_0:ShouldReplaceTb() then
		var_47_0 = arg_47_0:ReplaceTbName(var_47_0)
	end

	if arg_47_0:ShouldReplaceCar2026() then
		var_47_0 = arg_47_0:ReplaceCar2026Name(var_47_0)
	end

	return (HXSet.hxLan(var_47_0))
end

function var_0_0.GetPainting(arg_48_0)
	local var_48_0, var_48_1 = arg_48_0:GetPaintingAndName()

	return var_48_1
end

function var_0_0.ExistPainting(arg_49_0)
	return arg_49_0:GetPainting() ~= nil
end

function var_0_0.ShouldShakeDailogue(arg_50_0)
	return arg_50_0.dialogShake ~= nil
end

function var_0_0.GetShakeDailogueData(arg_51_0)
	return arg_51_0.dialogShake
end

function var_0_0.IsSameSide(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0:GetPrevSide(arg_52_1)
	local var_52_1 = arg_52_0:GetSide()

	return var_52_0 ~= nil and var_52_1 ~= nil and var_52_0 == var_52_1
end

function var_0_0.GetPrevSide(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1:GetSide()

	if arg_53_0.moveSideData then
		var_53_0 = arg_53_0.moveSideData.side
	end

	return var_53_0
end

function var_0_0.GetPaintingIcon(arg_54_0)
	local var_54_0

	if arg_54_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_54_1 = getProxy(PlayerProxy):getRawData().character

		var_54_0 = getProxy(BayProxy):getShipById(var_54_1):getPrefab()
	else
		var_54_0 = (arg_54_0.actor ~= var_0_0.ACTOR_TYPE_PLAYER or nil) and (arg_54_0.actor ~= var_0_0.ACTOR_TYPE_TB or nil) and (arg_54_0.actor or nil) and (not arg_54_0.hideRecordIco or nil) and var_0_1[arg_54_0.actor].prefab
	end

	if var_54_0 == nil and arg_54_0:ExistPortrait() and not arg_54_0.hideRecordIco then
		var_54_0 = arg_54_0:GetPortrait()
	end

	return var_54_0
end

function var_0_0.GetPaintingAndName(arg_55_0)
	local var_55_0
	local var_55_1

	if not UnGamePlayState and arg_55_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_55_2 = getProxy(PlayerProxy):getRawData().character
		local var_55_3 = getProxy(BayProxy):getShipById(var_55_2)

		var_55_0 = var_55_3:getName()
		var_55_1 = var_55_3:getPainting()
	elseif not UnGamePlayState and arg_55_0.actor == var_0_0.ACTOR_TYPE_PLAYER then
		if getProxy(PlayerProxy) then
			var_55_0 = getProxy(PlayerProxy):getRawData().name
		else
			var_55_0 = ""
		end
	elseif not UnGamePlayState and arg_55_0.actor == var_0_0.ACTOR_TYPE_TB then
		if pg.NewStoryMgr.GetInstance():IsReView() then
			assert(arg_55_0.defaultTb and arg_55_0.defaultTb > 0, "<<< defaultTb is nil >>>")

			local var_55_4 = pg.secretary_special_ship[arg_55_0.defaultTb]

			var_55_0 = var_55_4.name or ""
			var_55_1 = var_55_4.prefab
		elseif arg_55_0.specialTbId then
			local var_55_5 = pg.secretary_special_ship[arg_55_0.specialTbId]

			assert(var_55_5)

			var_55_0 = var_55_5.name or ""
			var_55_1 = var_55_5.prefab
		elseif getProxy(NewEducateProxy) and getProxy(NewEducateProxy):GetCurChar() then
			var_55_1, var_55_0 = getProxy(NewEducateProxy):GetStoryInfo()
		elseif EducateProxy and getProxy(EducateProxy) then
			var_55_1, var_55_0 = getProxy(EducateProxy):GetStoryInfo()
		else
			var_55_0 = ""
		end
	elseif not arg_55_0.actor or var_0_1[arg_55_0.actor] == nil then
		var_55_0, var_55_1 = nil
	else
		local var_55_6 = var_0_1[arg_55_0.actor]
		local var_55_7 = var_55_6.ship_group
		local var_55_8 = ShipGroup.getDefaultShipConfig(var_55_7)

		if not var_55_8 then
			var_55_0 = var_55_6.name
		else
			var_55_0 = Ship.getShipName(var_55_8.id)
		end

		var_55_1 = var_55_6.painting
	end

	return HXSet.hxLan(var_55_0), var_55_1
end

function var_0_0.GetShipSkinId(arg_56_0)
	if arg_56_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_56_0 = getProxy(PlayerProxy):getRawData()

		return getProxy(BayProxy):GetShipPhantom(var_56_0:GetFlagShipPhantomMark()):getSkinId()
	elseif arg_56_0.actor == var_0_0.ACTOR_TYPE_PLAYER then
		return nil
	elseif not arg_56_0.actor then
		return nil
	else
		return arg_56_0.actor
	end
end

function var_0_0.IsShowNPainting(arg_57_0)
	return arg_57_0.showNPainting
end

function var_0_0.IsShowWJZPainting(arg_58_0)
	return arg_58_0.showWJZPainting
end

function var_0_0.ShouldGrayPainting(arg_59_0)
	return arg_59_0.paingtingGray
end

function var_0_0.ShouldAddGlitchArtEffect(arg_60_0)
	return arg_60_0.glitchArt
end

function var_0_0.HideOtherPainting(arg_61_0)
	return arg_61_0.hideOtherPainting
end

function var_0_0.GetSubPaintings(arg_62_0)
	return _.map(arg_62_0.subPaintings or {}, function(arg_63_0)
		local var_63_0 = pg.ship_skin_template[arg_63_0.actor]

		assert(var_63_0)

		return {
			actor = arg_63_0.actor,
			name = var_63_0.painting,
			expression = arg_63_0.expression,
			pos = arg_63_0.pos,
			dir = arg_63_0.dir or 1,
			paintingNoise = arg_63_0.paintingNoise or false,
			showNPainting = arg_63_0.hidePaintObj or false
		}
	end)
end

function var_0_0.NeedDispppearSubPainting(arg_64_0)
	return #arg_64_0.disappearSeq > 0
end

function var_0_0.GetDisappearSeq(arg_65_0)
	return arg_65_0.disappearSeq
end

function var_0_0.GetDisappearTime(arg_66_0)
	return arg_66_0.disappearTime[1], arg_66_0.disappearTime[2]
end

function var_0_0.IsNoHeadPainting(arg_67_0)
	return arg_67_0.nohead
end

function var_0_0.GetFontSize(arg_68_0)
	return arg_68_0.fontSize
end

function var_0_0.IsSpinePainting(arg_69_0)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		return false
	end

	local var_69_0 = arg_69_0:GetPainting()

	return tobool(var_69_0 ~= nil and arg_69_0.spine)
end

function var_0_0.IsHideSpineBg(arg_70_0)
	return arg_70_0.spine == 1
end

function var_0_0.GetSpineOrderIndex(arg_71_0)
	if arg_71_0:IsSpinePainting() then
		return arg_71_0.spineOrderIndex
	else
		return nil
	end
end

function var_0_0.IsLive2dPainting(arg_72_0)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		return false
	end

	local var_72_0 = arg_72_0:GetPainting()

	return tobool(var_72_0 ~= nil and arg_72_0.live2d)
end

function var_0_0.GetLive2dPos(arg_73_0)
	if arg_73_0.live2dOffset then
		return Vector3(arg_73_0.live2dOffset[1], arg_73_0.live2dOffset[2], arg_73_0.live2dOffset[3])
	end
end

function var_0_0.GetVirtualShip(arg_74_0)
	local var_74_0 = arg_74_0:GetShipSkinId()
	local var_74_1 = pg.ship_skin_template[var_74_0].ship_group

	return StoryShip.New({
		skin_id = var_74_0
	})
end

function var_0_0.GetLive2dAction(arg_75_0)
	if type(arg_75_0.live2d) == "string" then
		local var_75_0 = pg.character_voice[arg_75_0.live2d]

		if var_75_0 then
			return var_75_0.l2d_action
		end

		return arg_75_0.live2d
	else
		return nil
	end
end

function var_0_0.GetL2dIdleIndex(arg_76_0)
	return arg_76_0.live2dIdleIndex
end

function var_0_0.GetSubActorName(arg_77_0)
	if arg_77_0.subActorName and arg_77_0.subActorName ~= "" then
		local var_77_0 = HXSet.hxLan(arg_77_0.subActorName)

		return " " .. setColorStr(var_77_0, arg_77_0.subActorNameColor)
	else
		return ""
	end
end

function var_0_0.IsSamePainting(arg_78_0, arg_78_1)
	local function var_78_0()
		return arg_78_1:ShouldAddGlitchArtEffect() or arg_78_0:ShouldAddGlitchArtEffect()
	end

	return (function()
		return arg_78_0:GetPainting() == arg_78_1:GetPainting() and arg_78_0:IsShowNPainting() == arg_78_1:IsShowNPainting() and arg_78_0:IsShowWJZPainting() == arg_78_1:IsShowWJZPainting()
	end)() and arg_78_0:IsLive2dPainting() == arg_78_1:IsLive2dPainting() and arg_78_0:IsSpinePainting() == arg_78_1:IsSpinePainting() and not var_78_0()
end

function var_0_0.ExistCanMarkNode(arg_81_0)
	return arg_81_0.canMarkNode ~= nil and type(arg_81_0.canMarkNode) == "table" and arg_81_0.canMarkNode[1] and arg_81_0.canMarkNode[1] ~= "" and arg_81_0.canMarkNode[2] and type(arg_81_0.canMarkNode[2]) == "table"
end

function var_0_0.GetCanMarkNodeData(arg_82_0)
	local var_82_0 = {}

	for iter_82_0, iter_82_1 in ipairs(arg_82_0.canMarkNode[2] or {}) do
		table.insert(var_82_0, iter_82_1 .. "")
	end

	return {
		name = arg_82_0.canMarkNode[1],
		marks = var_82_0
	}
end

function var_0_0.OnClear(arg_83_0)
	return
end

function var_0_0.GetUsingPaintingNames(arg_84_0)
	local var_84_0 = {}
	local var_84_1 = arg_84_0:GetPainting()

	if var_84_1 ~= nil then
		table.insert(var_84_0, var_84_1)
	end

	local var_84_2 = arg_84_0:GetSubPaintings()

	for iter_84_0, iter_84_1 in ipairs(var_84_2) do
		local var_84_3 = iter_84_1.name

		table.insert(var_84_0, var_84_3)
	end

	return var_84_0
end

return var_0_0
