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

function var_0_0.ShouldFlipPaintingY(arg_29_0)
	return arg_29_0.paingtingYFlip ~= nil
end

function var_0_0.GetTag(arg_30_0)
	if arg_30_0.glitchArt == true then
		return 2
	else
		return 1
	end
end

function var_0_0.GetPaintingAlpha(arg_31_0)
	return arg_31_0.actorAlpha
end

function var_0_0.GetPaitingOffst(arg_32_0)
	return arg_32_0.actorPosition
end

function var_0_0.GetSound(arg_33_0)
	return arg_33_0.sound
end

function var_0_0.GetPaintingActions(arg_34_0)
	return arg_34_0.action
end

function var_0_0.GetPaintingMoveToSide(arg_35_0)
	return arg_35_0.moveSideData
end

function var_0_0.ShouldMoveToSide(arg_36_0)
	return arg_36_0.moveSideData ~= nil
end

function var_0_0.GetPaintingAction(arg_37_0, arg_37_1)
	local var_37_0 = {}
	local var_37_1 = arg_37_0:GetPaintingActions()

	for iter_37_0, iter_37_1 in ipairs(var_37_1) do
		if iter_37_1.type == arg_37_1 then
			table.insert(var_37_0, iter_37_1)
		end
	end

	return var_37_0
end

function var_0_0.GetSide(arg_38_0)
	return arg_38_0.side
end

function var_0_0.GetContent(arg_39_0)
	if not arg_39_0.say then
		return "..."
	end

	local var_39_0 = arg_39_0.say

	if arg_39_0:ShouldReplacePlayer() then
		var_39_0 = arg_39_0:ReplacePlayerName(var_39_0)
	end

	if arg_39_0:ShouldReplaceTb() then
		var_39_0 = arg_39_0:ReplaceTbName(var_39_0)
	end

	if arg_39_0:ShouldReplaceDorm() then
		var_39_0 = arg_39_0:ReplaceDormName(var_39_0)
	end

	if arg_39_0:ShouldReplaceCar2026() then
		var_39_0 = arg_39_0:ReplaceCar2026Name(var_39_0)
	end

	if PLATFORM_CODE ~= PLATFORM_US then
		var_39_0 = SwitchSpecialChar(HXSet.hxLan(var_39_0), true)
	else
		var_39_0 = HXSet.hxLan(var_39_0)
	end

	return var_39_0
end

function var_0_0.GetContentColor(arg_40_0)
	return arg_40_0.sayColor or COLOR_WHITE
end

function var_0_0.GetNameWithColor(arg_41_0)
	local var_41_0 = arg_41_0:GetName()

	if not var_41_0 then
		return nil
	end

	local var_41_1 = arg_41_0:GetNameColor()

	return setColorStr(var_41_0, var_41_1)
end

function var_0_0.GetNameColor(arg_42_0)
	return arg_42_0.nameColor or COLOR_WHITE
end

function var_0_0.GetNameColorCode(arg_43_0)
	local var_43_0 = arg_43_0:GetNameColor()

	return string.gsub(var_43_0, "#", "")
end

function var_0_0.GetCustomActorName(arg_44_0)
	if type(arg_44_0.actorName) == "number" and arg_44_0.actorName == 0 and getProxy(PlayerProxy) then
		return getProxy(PlayerProxy):getRawData().name
	elseif type(arg_44_0.actorName) == "number" then
		return ShipGroup.getDefaultShipNameByGroupID(arg_44_0.actorName)
	elseif type(arg_44_0.actorName) == "string" then
		return arg_44_0.actorName
	else
		return ""
	end
end

function var_0_0.GetPortraitName(arg_45_0)
	if not arg_45_0:ExistPortrait() then
		return ""
	end

	if type(arg_45_0.portrait) ~= "number" then
		return ""
	end

	local var_45_0 = var_0_1[arg_45_0.portrait]

	if not var_45_0 then
		return ""
	end

	local var_45_1 = ""
	local var_45_2 = var_45_0.ship_group
	local var_45_3 = ShipGroup.getDefaultShipConfig(var_45_2)

	if not var_45_3 then
		var_45_1 = var_45_0.name
	else
		var_45_1 = Ship.getShipName(var_45_3.id)
	end

	return var_45_1
end

function var_0_0.GetName(arg_46_0)
	local var_46_0 = arg_46_0.actorName and arg_46_0:GetCustomActorName() or arg_46_0:GetPaintingAndName() or ""

	if not var_46_0 or var_46_0 == "" then
		var_46_0 = arg_46_0:GetPortraitName()
	end

	if not var_46_0 or var_46_0 == "" or arg_46_0.withoutActorName then
		return nil
	end

	if arg_46_0:ShouldReplacePlayer() then
		var_46_0 = arg_46_0:ReplacePlayerName(var_46_0)
	end

	if arg_46_0:ShouldReplaceTb() then
		var_46_0 = arg_46_0:ReplaceTbName(var_46_0)
	end

	if arg_46_0:ShouldReplaceCar2026() then
		var_46_0 = arg_46_0:ReplaceCar2026Name(var_46_0)
	end

	return (HXSet.hxLan(var_46_0))
end

function var_0_0.GetPainting(arg_47_0)
	local var_47_0, var_47_1 = arg_47_0:GetPaintingAndName()

	return var_47_1
end

function var_0_0.ExistPainting(arg_48_0)
	return arg_48_0:GetPainting() ~= nil
end

function var_0_0.ShouldShakeDailogue(arg_49_0)
	return arg_49_0.dialogShake ~= nil
end

function var_0_0.GetShakeDailogueData(arg_50_0)
	return arg_50_0.dialogShake
end

function var_0_0.IsSameSide(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_0:GetPrevSide(arg_51_1)
	local var_51_1 = arg_51_0:GetSide()

	return var_51_0 ~= nil and var_51_1 ~= nil and var_51_0 == var_51_1
end

function var_0_0.GetPrevSide(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_1:GetSide()

	if arg_52_0.moveSideData then
		var_52_0 = arg_52_0.moveSideData.side
	end

	return var_52_0
end

function var_0_0.GetPaintingIcon(arg_53_0)
	local var_53_0

	if arg_53_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_53_1 = getProxy(PlayerProxy):getRawData().character

		var_53_0 = getProxy(BayProxy):getShipById(var_53_1):getPrefab()
	else
		var_53_0 = (arg_53_0.actor ~= var_0_0.ACTOR_TYPE_PLAYER or nil) and (arg_53_0.actor ~= var_0_0.ACTOR_TYPE_TB or nil) and (arg_53_0.actor or nil) and (not arg_53_0.hideRecordIco or nil) and var_0_1[arg_53_0.actor].prefab
	end

	if var_53_0 == nil and arg_53_0:ExistPortrait() and not arg_53_0.hideRecordIco then
		var_53_0 = arg_53_0:GetPortrait()
	end

	return var_53_0
end

function var_0_0.GetPaintingAndName(arg_54_0)
	local var_54_0
	local var_54_1

	if not UnGamePlayState and arg_54_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_54_2 = getProxy(PlayerProxy):getRawData().character
		local var_54_3 = getProxy(BayProxy):getShipById(var_54_2)

		var_54_0 = var_54_3:getName()
		var_54_1 = var_54_3:getPainting()
	elseif not UnGamePlayState and arg_54_0.actor == var_0_0.ACTOR_TYPE_PLAYER then
		if getProxy(PlayerProxy) then
			var_54_0 = getProxy(PlayerProxy):getRawData().name
		else
			var_54_0 = ""
		end
	elseif not UnGamePlayState and arg_54_0.actor == var_0_0.ACTOR_TYPE_TB then
		if pg.NewStoryMgr.GetInstance():IsReView() then
			assert(arg_54_0.defaultTb and arg_54_0.defaultTb > 0, "<<< defaultTb is nil >>>")

			local var_54_4 = pg.secretary_special_ship[arg_54_0.defaultTb]

			var_54_0 = var_54_4.name or ""
			var_54_1 = var_54_4.prefab
		elseif arg_54_0.specialTbId then
			local var_54_5 = pg.secretary_special_ship[arg_54_0.specialTbId]

			assert(var_54_5)

			var_54_0 = var_54_5.name or ""
			var_54_1 = var_54_5.prefab
		elseif getProxy(NewEducateProxy) and getProxy(NewEducateProxy):GetCurChar() then
			var_54_1, var_54_0 = getProxy(NewEducateProxy):GetStoryInfo()
		elseif EducateProxy and getProxy(EducateProxy) then
			var_54_1, var_54_0 = getProxy(EducateProxy):GetStoryInfo()
		else
			var_54_0 = ""
		end
	elseif not arg_54_0.actor or var_0_1[arg_54_0.actor] == nil then
		var_54_0, var_54_1 = nil
	else
		local var_54_6 = var_0_1[arg_54_0.actor]
		local var_54_7 = var_54_6.ship_group
		local var_54_8 = ShipGroup.getDefaultShipConfig(var_54_7)

		if not var_54_8 then
			var_54_0 = var_54_6.name
		else
			var_54_0 = Ship.getShipName(var_54_8.id)
		end

		var_54_1 = var_54_6.painting
	end

	return HXSet.hxLan(var_54_0), var_54_1
end

function var_0_0.GetShipSkinId(arg_55_0)
	if arg_55_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_55_0 = getProxy(PlayerProxy):getRawData()

		return getProxy(BayProxy):GetShipPhantom(var_55_0:GetFlagShipPhantomMark()):getSkinId()
	elseif arg_55_0.actor == var_0_0.ACTOR_TYPE_PLAYER then
		return nil
	elseif not arg_55_0.actor then
		return nil
	else
		return arg_55_0.actor
	end
end

function var_0_0.IsShowNPainting(arg_56_0)
	return arg_56_0.showNPainting
end

function var_0_0.IsShowWJZPainting(arg_57_0)
	return arg_57_0.showWJZPainting
end

function var_0_0.ShouldGrayPainting(arg_58_0)
	return arg_58_0.paingtingGray
end

function var_0_0.ShouldAddGlitchArtEffect(arg_59_0)
	return arg_59_0.glitchArt
end

function var_0_0.HideOtherPainting(arg_60_0)
	return arg_60_0.hideOtherPainting
end

function var_0_0.GetSubPaintings(arg_61_0)
	return _.map(arg_61_0.subPaintings or {}, function(arg_62_0)
		local var_62_0 = pg.ship_skin_template[arg_62_0.actor]

		assert(var_62_0)

		return {
			actor = arg_62_0.actor,
			name = var_62_0.painting,
			expression = arg_62_0.expression,
			pos = arg_62_0.pos,
			dir = arg_62_0.dir or 1,
			paintingNoise = arg_62_0.paintingNoise or false,
			showNPainting = arg_62_0.hidePaintObj or false
		}
	end)
end

function var_0_0.NeedDispppearSubPainting(arg_63_0)
	return #arg_63_0.disappearSeq > 0
end

function var_0_0.GetDisappearSeq(arg_64_0)
	return arg_64_0.disappearSeq
end

function var_0_0.GetDisappearTime(arg_65_0)
	return arg_65_0.disappearTime[1], arg_65_0.disappearTime[2]
end

function var_0_0.IsNoHeadPainting(arg_66_0)
	return arg_66_0.nohead
end

function var_0_0.GetFontSize(arg_67_0)
	return arg_67_0.fontSize
end

function var_0_0.IsSpinePainting(arg_68_0)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		return false
	end

	local var_68_0 = arg_68_0:GetPainting()

	return tobool(var_68_0 ~= nil and arg_68_0.spine)
end

function var_0_0.IsHideSpineBg(arg_69_0)
	return arg_69_0.spine == 1
end

function var_0_0.GetSpineOrderIndex(arg_70_0)
	if arg_70_0:IsSpinePainting() then
		return arg_70_0.spineOrderIndex
	else
		return nil
	end
end

function var_0_0.IsLive2dPainting(arg_71_0)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		return false
	end

	local var_71_0 = arg_71_0:GetPainting()

	return tobool(var_71_0 ~= nil and arg_71_0.live2d)
end

function var_0_0.GetLive2dPos(arg_72_0)
	if arg_72_0.live2dOffset then
		return Vector3(arg_72_0.live2dOffset[1], arg_72_0.live2dOffset[2], arg_72_0.live2dOffset[3])
	end
end

function var_0_0.GetVirtualShip(arg_73_0)
	local var_73_0 = arg_73_0:GetShipSkinId()
	local var_73_1 = pg.ship_skin_template[var_73_0].ship_group

	return StoryShip.New({
		skin_id = var_73_0
	})
end

function var_0_0.GetLive2dAction(arg_74_0)
	if type(arg_74_0.live2d) == "string" then
		local var_74_0 = pg.character_voice[arg_74_0.live2d]

		if var_74_0 then
			return var_74_0.l2d_action
		end

		return arg_74_0.live2d
	else
		return nil
	end
end

function var_0_0.GetL2dIdleIndex(arg_75_0)
	return arg_75_0.live2dIdleIndex
end

function var_0_0.GetSubActorName(arg_76_0)
	if arg_76_0.subActorName and arg_76_0.subActorName ~= "" then
		local var_76_0 = HXSet.hxLan(arg_76_0.subActorName)

		return " " .. setColorStr(var_76_0, arg_76_0.subActorNameColor)
	else
		return ""
	end
end

function var_0_0.IsSamePainting(arg_77_0, arg_77_1)
	local function var_77_0()
		return arg_77_1:ShouldAddGlitchArtEffect() or arg_77_0:ShouldAddGlitchArtEffect()
	end

	return (function()
		return arg_77_0:GetPainting() == arg_77_1:GetPainting() and arg_77_0:IsShowNPainting() == arg_77_1:IsShowNPainting() and arg_77_0:IsShowWJZPainting() == arg_77_1:IsShowWJZPainting()
	end)() and arg_77_0:IsLive2dPainting() == arg_77_1:IsLive2dPainting() and arg_77_0:IsSpinePainting() == arg_77_1:IsSpinePainting() and not var_77_0()
end

function var_0_0.ExistCanMarkNode(arg_80_0)
	return arg_80_0.canMarkNode ~= nil and type(arg_80_0.canMarkNode) == "table" and arg_80_0.canMarkNode[1] and arg_80_0.canMarkNode[1] ~= "" and arg_80_0.canMarkNode[2] and type(arg_80_0.canMarkNode[2]) == "table"
end

function var_0_0.GetCanMarkNodeData(arg_81_0)
	local var_81_0 = {}

	for iter_81_0, iter_81_1 in ipairs(arg_81_0.canMarkNode[2] or {}) do
		table.insert(var_81_0, iter_81_1 .. "")
	end

	return {
		name = arg_81_0.canMarkNode[1],
		marks = var_81_0
	}
end

function var_0_0.OnClear(arg_82_0)
	return
end

function var_0_0.GetUsingPaintingNames(arg_83_0)
	local var_83_0 = {}
	local var_83_1 = arg_83_0:GetPainting()

	if var_83_1 ~= nil then
		table.insert(var_83_0, var_83_1)
	end

	local var_83_2 = arg_83_0:GetSubPaintings()

	for iter_83_0, iter_83_1 in ipairs(var_83_2) do
		local var_83_3 = iter_83_1.name

		table.insert(var_83_0, var_83_3)
	end

	return var_83_0
end

return var_0_0
