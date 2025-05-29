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
	arg_2_0.dynamicBgType = arg_2_1.dynamicBgType
	arg_2_0.fontSize = arg_2_1.fontsize
	arg_2_0.side = arg_2_1.side
	arg_2_0.dir = arg_2_1.dir

	if arg_2_0.dir == 0 then
		arg_2_0.dir = 1
	end

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

function var_0_0.GetL2dParams(arg_3_0)
	if not arg_3_0.live2dParams then
		return nil
	end

	return {
		name = arg_3_0.live2dParams[1],
		value = arg_3_0.live2dParams[2]
	}
end

function var_0_0.SetDefaultSide(arg_4_0)
	arg_4_0.side = defaultValue(arg_4_0.side, var_0_0.SIDE_LEFT)
end

function var_0_0.GetBgName(arg_5_0)
	if arg_5_0.dynamicBgType and arg_5_0.dynamicBgType == var_0_0.ACTOR_TYPE_TB and getProxy(EducateProxy) and getProxy(NewEducateProxy) and not pg.NewStoryMgr.GetInstance():IsReView() then
		local var_5_0 = ""

		if not getProxy(NewEducateProxy):GetCurChar() then
			local var_5_1, var_5_2, var_5_3 = getProxy(EducateProxy):GetStoryInfo()

			var_5_0 = var_5_3
		else
			local var_5_4, var_5_5, var_5_6 = getProxy(NewEducateProxy):GetStoryInfo()

			var_5_0 = var_5_6
		end

		return (arg_5_0:Convert2StoryBg(var_5_0))
	else
		return var_0_0.super.GetBgName(arg_5_0)
	end
end

function var_0_0.Convert2StoryBg(arg_6_0, arg_6_1)
	return ({
		educate_tb_1 = "bg_project_tb_room1",
		educate_tb_2 = "bg_project_tb_room2",
		educate_tb_3 = "bg_project_tb_room3"
	})[arg_6_1] or arg_6_1
end

function var_0_0.GetPaintingRwIndex(arg_7_0)
	if not arg_7_0.glitchArt then
		return 0
	end

	if not arg_7_0.expression then
		return 0
	end

	return arg_7_0.paintRwIndex
end

function var_0_0.IsMiniPortrait(arg_8_0)
	return arg_8_0.miniPortrait
end

function var_0_0.ExistPortrait(arg_9_0)
	return arg_9_0.portrait ~= nil
end

function var_0_0.GetPortrait(arg_10_0)
	if type(arg_10_0.portrait) == "number" then
		return pg.ship_skin_template[arg_10_0.portrait].painting
	elseif type(arg_10_0.portrait) == "string" then
		return arg_10_0.portrait
	else
		return nil
	end
end

function var_0_0.ShouldHideDialogue(arg_11_0)
	return arg_11_0.hideDialogFragment
end

function var_0_0.ShouldGlitchArtForPortrait(arg_12_0)
	return arg_12_0.glitchArtForPortrait
end

function var_0_0.GetMode(arg_13_0)
	return Story.MODE_DIALOGUE
end

function var_0_0.GetContentBGAlpha(arg_14_0)
	return arg_14_0.contentBGAlpha
end

function var_0_0.GetSpineExPression(arg_15_0)
	if arg_15_0.expression then
		return arg_15_0.expression
	end
end

function var_0_0.GetExPression(arg_16_0)
	if arg_16_0.expression then
		return arg_16_0.expression
	else
		local var_16_0 = arg_16_0:GetPainting()

		if var_16_0 and ShipExpressionHelper.DefaultFaceless(var_16_0) then
			return ShipExpressionHelper.GetDefaultFace(var_16_0)
		end
	end
end

function var_0_0.ShouldAddHeadMaskWhenFade(arg_17_0)
	if arg_17_0:ShouldAddGlitchArtEffect() then
		return false
	end

	if arg_17_0:IsNoHeadPainting() then
		return false
	end

	if not arg_17_0:GetExPression() then
		return false
	end

	return true
end

function var_0_0.ShouldGrayingPainting(arg_18_0, arg_18_1)
	return arg_18_1:GetPainting() ~= nil and not arg_18_0:IsSameSide(arg_18_1)
end

function var_0_0.ShouldGrayingOutPainting(arg_19_0, arg_19_1)
	return arg_19_0:GetPainting() ~= nil and not arg_19_0:IsSameSide(arg_19_1)
end

function var_0_0.ShouldFadeInPainting(arg_20_0)
	if not arg_20_0:GetPainting() then
		return false
	end

	if arg_20_0:IsLive2dPainting() or arg_20_0:IsSpinePainting() then
		return false
	end

	local var_20_0 = arg_20_0:GetFadeInPaintingTime()

	if not var_20_0 or var_20_0 <= 0 then
		return false
	end

	return true
end

function var_0_0.GetTypewriter(arg_21_0)
	return arg_21_0.typewriter
end

function var_0_0.ShouldFaceBlack(arg_22_0)
	return arg_22_0.actorShadow
end

function var_0_0.GetPaintingData(arg_23_0)
	local var_23_0 = arg_23_0.painting or {}

	return {
		alpha = var_23_0.alpha or 0.3,
		time = var_23_0.time or 1
	}
end

function var_0_0.GetFadeInPaintingTime(arg_24_0)
	return arg_24_0.fadeInPaintingTime
end

function var_0_0.GetFadeOutPaintingTime(arg_25_0)
	return arg_25_0.fadeOutPaintingTime
end

function var_0_0.GetPaintingDir(arg_26_0)
	local var_26_0 = arg_26_0.paingtingScale or 1

	return (arg_26_0.dir or 1) * var_26_0
end

function var_0_0.ShouldFlipPaintingY(arg_27_0)
	return arg_27_0.paingtingYFlip ~= nil
end

function var_0_0.GetTag(arg_28_0)
	if arg_28_0.glitchArt == true then
		return 2
	else
		return 1
	end
end

function var_0_0.GetPaintingAlpha(arg_29_0)
	return arg_29_0.actorAlpha
end

function var_0_0.GetPaitingOffst(arg_30_0)
	return arg_30_0.actorPosition
end

function var_0_0.GetSound(arg_31_0)
	return arg_31_0.sound
end

function var_0_0.GetPaintingActions(arg_32_0)
	return arg_32_0.action
end

function var_0_0.GetPaintingMoveToSide(arg_33_0)
	return arg_33_0.moveSideData
end

function var_0_0.ShouldMoveToSide(arg_34_0)
	return arg_34_0.moveSideData ~= nil
end

function var_0_0.GetPaintingAction(arg_35_0, arg_35_1)
	local var_35_0 = {}
	local var_35_1 = arg_35_0:GetPaintingActions()

	for iter_35_0, iter_35_1 in ipairs(var_35_1) do
		if iter_35_1.type == arg_35_1 then
			table.insert(var_35_0, iter_35_1)
		end
	end

	return var_35_0
end

function var_0_0.GetSide(arg_36_0)
	return arg_36_0.side
end

function var_0_0.GetContent(arg_37_0)
	if not arg_37_0.say then
		return "..."
	end

	local var_37_0 = arg_37_0.say

	if arg_37_0:ShouldReplacePlayer() then
		var_37_0 = arg_37_0:ReplacePlayerName(var_37_0)
	end

	if arg_37_0:ShouldReplaceTb() then
		var_37_0 = arg_37_0:ReplaceTbName(var_37_0)
	end

	if arg_37_0:ShouldReplaceDorm() then
		var_37_0 = arg_37_0:ReplaceDormName(var_37_0)
	end

	if PLATFORM_CODE ~= PLATFORM_US then
		var_37_0 = SwitchSpecialChar(HXSet.hxLan(var_37_0), true)
	else
		var_37_0 = HXSet.hxLan(var_37_0)
	end

	return var_37_0
end

function var_0_0.GetNameWithColor(arg_38_0)
	local var_38_0 = arg_38_0:GetName()

	if not var_38_0 then
		return nil
	end

	local var_38_1 = arg_38_0:GetNameColor()

	return setColorStr(var_38_0, var_38_1)
end

function var_0_0.GetNameColor(arg_39_0)
	return arg_39_0.nameColor or COLOR_WHITE
end

function var_0_0.GetNameColorCode(arg_40_0)
	local var_40_0 = arg_40_0:GetNameColor()

	return string.gsub(var_40_0, "#", "")
end

function var_0_0.GetCustomActorName(arg_41_0)
	if type(arg_41_0.actorName) == "number" and arg_41_0.actorName == 0 and getProxy(PlayerProxy) then
		return getProxy(PlayerProxy):getRawData().name
	elseif type(arg_41_0.actorName) == "number" then
		return ShipGroup.getDefaultShipNameByGroupID(arg_41_0.actorName)
	elseif type(arg_41_0.actorName) == "string" then
		return arg_41_0.actorName
	else
		return ""
	end
end

function var_0_0.GetPortraitName(arg_42_0)
	if not arg_42_0:ExistPortrait() then
		return ""
	end

	if type(arg_42_0.portrait) ~= "number" then
		return ""
	end

	local var_42_0 = var_0_1[arg_42_0.portrait]

	if not var_42_0 then
		return ""
	end

	local var_42_1 = ""
	local var_42_2 = var_42_0.ship_group
	local var_42_3 = ShipGroup.getDefaultShipConfig(var_42_2)

	if not var_42_3 then
		var_42_1 = var_42_0.name
	else
		var_42_1 = Ship.getShipName(var_42_3.id)
	end

	return var_42_1
end

function var_0_0.GetName(arg_43_0)
	local var_43_0 = arg_43_0.actorName and arg_43_0:GetCustomActorName() or arg_43_0:GetPaintingAndName() or ""

	if not var_43_0 or var_43_0 == "" then
		var_43_0 = arg_43_0:GetPortraitName()
	end

	if not var_43_0 or var_43_0 == "" or arg_43_0.withoutActorName then
		return nil
	end

	if arg_43_0:ShouldReplacePlayer() then
		var_43_0 = arg_43_0:ReplacePlayerName(var_43_0)
	end

	if arg_43_0:ShouldReplaceTb() then
		var_43_0 = arg_43_0:ReplaceTbName(var_43_0)
	end

	return (HXSet.hxLan(var_43_0))
end

function var_0_0.GetPainting(arg_44_0)
	local var_44_0, var_44_1 = arg_44_0:GetPaintingAndName()

	return var_44_1
end

function var_0_0.ExistPainting(arg_45_0)
	return arg_45_0:GetPainting() ~= nil
end

function var_0_0.ShouldShakeDailogue(arg_46_0)
	return arg_46_0.dialogShake ~= nil
end

function var_0_0.GetShakeDailogueData(arg_47_0)
	return arg_47_0.dialogShake
end

function var_0_0.IsSameSide(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_0:GetPrevSide(arg_48_1)
	local var_48_1 = arg_48_0:GetSide()

	return var_48_0 ~= nil and var_48_1 ~= nil and var_48_0 == var_48_1
end

function var_0_0.GetPrevSide(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_1:GetSide()

	if arg_49_0.moveSideData then
		var_49_0 = arg_49_0.moveSideData.side
	end

	return var_49_0
end

function var_0_0.GetPaintingIcon(arg_50_0)
	local var_50_0

	if arg_50_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_50_1 = getProxy(PlayerProxy):getRawData().character

		var_50_0 = getProxy(BayProxy):getShipById(var_50_1):getPrefab()
	else
		var_50_0 = (arg_50_0.actor ~= var_0_0.ACTOR_TYPE_PLAYER or nil) and (arg_50_0.actor ~= var_0_0.ACTOR_TYPE_TB or nil) and (arg_50_0.actor or nil) and (not arg_50_0.hideRecordIco or nil) and var_0_1[arg_50_0.actor].prefab
	end

	if var_50_0 == nil and arg_50_0:ExistPortrait() then
		var_50_0 = arg_50_0:GetPortrait()
	end

	return var_50_0
end

function var_0_0.GetPaintingAndName(arg_51_0)
	local var_51_0
	local var_51_1

	if not UnGamePlayState and arg_51_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_51_2 = getProxy(PlayerProxy):getRawData().character
		local var_51_3 = getProxy(BayProxy):getShipById(var_51_2)

		var_51_0 = var_51_3:getName()
		var_51_1 = var_51_3:getPainting()
	elseif not UnGamePlayState and arg_51_0.actor == var_0_0.ACTOR_TYPE_PLAYER then
		if getProxy(PlayerProxy) then
			var_51_0 = getProxy(PlayerProxy):getRawData().name
		else
			var_51_0 = ""
		end
	elseif not UnGamePlayState and arg_51_0.actor == var_0_0.ACTOR_TYPE_TB then
		if pg.NewStoryMgr.GetInstance():IsReView() then
			assert(arg_51_0.defaultTb and arg_51_0.defaultTb > 0, "<<< defaultTb is nil >>>")

			local var_51_4 = pg.secretary_special_ship[arg_51_0.defaultTb]

			var_51_0 = var_51_4.name or ""
			var_51_1 = var_51_4.prefab
		elseif arg_51_0.specialTbId then
			local var_51_5 = pg.secretary_special_ship[arg_51_0.specialTbId]

			assert(var_51_5)

			var_51_0 = var_51_5.name or ""
			var_51_1 = var_51_5.prefab
		elseif getProxy(NewEducateProxy) and getProxy(NewEducateProxy):GetCurChar() then
			var_51_1, var_51_0 = getProxy(NewEducateProxy):GetStoryInfo()
		elseif EducateProxy and getProxy(EducateProxy) then
			var_51_1, var_51_0 = getProxy(EducateProxy):GetStoryInfo()
		else
			var_51_0 = ""
		end
	elseif not arg_51_0.actor or var_0_1[arg_51_0.actor] == nil then
		var_51_0, var_51_1 = nil
	else
		local var_51_6 = var_0_1[arg_51_0.actor]
		local var_51_7 = var_51_6.ship_group
		local var_51_8 = ShipGroup.getDefaultShipConfig(var_51_7)

		if not var_51_8 then
			var_51_0 = var_51_6.name
		else
			var_51_0 = Ship.getShipName(var_51_8.id)
		end

		var_51_1 = var_51_6.painting
	end

	return HXSet.hxLan(var_51_0), var_51_1
end

function var_0_0.GetShipSkinId(arg_52_0)
	if arg_52_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_52_0 = getProxy(PlayerProxy):getRawData()

		return getProxy(BayProxy):GetShipPhantom(var_52_0:GetFlagShipPhantomMark()):getSkinId()
	elseif arg_52_0.actor == var_0_0.ACTOR_TYPE_PLAYER then
		return nil
	elseif not arg_52_0.actor then
		return nil
	else
		return arg_52_0.actor
	end
end

function var_0_0.IsShowNPainting(arg_53_0)
	return arg_53_0.showNPainting
end

function var_0_0.IsShowWJZPainting(arg_54_0)
	return arg_54_0.showWJZPainting
end

function var_0_0.ShouldGrayPainting(arg_55_0)
	return arg_55_0.paingtingGray
end

function var_0_0.ShouldAddGlitchArtEffect(arg_56_0)
	return arg_56_0.glitchArt
end

function var_0_0.HideOtherPainting(arg_57_0)
	return arg_57_0.hideOtherPainting
end

function var_0_0.GetSubPaintings(arg_58_0)
	return _.map(arg_58_0.subPaintings or {}, function(arg_59_0)
		local var_59_0 = pg.ship_skin_template[arg_59_0.actor]

		assert(var_59_0)

		return {
			actor = arg_59_0.actor,
			name = var_59_0.painting,
			expression = arg_59_0.expression,
			pos = arg_59_0.pos,
			dir = arg_59_0.dir or 1,
			paintingNoise = arg_59_0.paintingNoise or false,
			showNPainting = arg_59_0.hidePaintObj or false
		}
	end)
end

function var_0_0.NeedDispppearSubPainting(arg_60_0)
	return #arg_60_0.disappearSeq > 0
end

function var_0_0.GetDisappearSeq(arg_61_0)
	return arg_61_0.disappearSeq
end

function var_0_0.GetDisappearTime(arg_62_0)
	return arg_62_0.disappearTime[1], arg_62_0.disappearTime[2]
end

function var_0_0.IsNoHeadPainting(arg_63_0)
	return arg_63_0.nohead
end

function var_0_0.GetFontSize(arg_64_0)
	return arg_64_0.fontSize
end

function var_0_0.IsSpinePainting(arg_65_0)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		return false
	end

	local var_65_0 = arg_65_0:GetPainting()

	return tobool(var_65_0 ~= nil and arg_65_0.spine)
end

function var_0_0.IsHideSpineBg(arg_66_0)
	return arg_66_0.spine == 1
end

function var_0_0.GetSpineOrderIndex(arg_67_0)
	if arg_67_0:IsSpinePainting() then
		return arg_67_0.spineOrderIndex
	else
		return nil
	end
end

function var_0_0.IsLive2dPainting(arg_68_0)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		return false
	end

	local var_68_0 = arg_68_0:GetPainting()

	return tobool(var_68_0 ~= nil and arg_68_0.live2d)
end

function var_0_0.GetLive2dPos(arg_69_0)
	if arg_69_0.live2dOffset then
		return Vector3(arg_69_0.live2dOffset[1], arg_69_0.live2dOffset[2], arg_69_0.live2dOffset[3])
	end
end

function var_0_0.GetVirtualShip(arg_70_0)
	local var_70_0 = arg_70_0:GetShipSkinId()
	local var_70_1 = pg.ship_skin_template[var_70_0].ship_group

	return StoryShip.New({
		skin_id = var_70_0
	})
end

function var_0_0.GetLive2dAction(arg_71_0)
	if type(arg_71_0.live2d) == "string" then
		local var_71_0 = pg.character_voice[arg_71_0.live2d]

		if var_71_0 then
			return var_71_0.l2d_action
		end

		return arg_71_0.live2d
	else
		return nil
	end
end

function var_0_0.GetL2dIdleIndex(arg_72_0)
	return arg_72_0.live2dIdleIndex
end

function var_0_0.GetSubActorName(arg_73_0)
	if arg_73_0.subActorName and arg_73_0.subActorName ~= "" then
		local var_73_0 = HXSet.hxLan(arg_73_0.subActorName)

		return " " .. setColorStr(var_73_0, arg_73_0.subActorNameColor)
	else
		return ""
	end
end

function var_0_0.IsSamePainting(arg_74_0, arg_74_1)
	local function var_74_0()
		return arg_74_1:ShouldAddGlitchArtEffect() or arg_74_0:ShouldAddGlitchArtEffect()
	end

	return (function()
		return arg_74_0:GetPainting() == arg_74_1:GetPainting() and arg_74_0:IsShowNPainting() == arg_74_1:IsShowNPainting() and arg_74_0:IsShowWJZPainting() == arg_74_1:IsShowWJZPainting()
	end)() and arg_74_0:IsLive2dPainting() == arg_74_1:IsLive2dPainting() and arg_74_0:IsSpinePainting() == arg_74_1:IsSpinePainting() and not var_74_0()
end

function var_0_0.ExistCanMarkNode(arg_77_0)
	return arg_77_0.canMarkNode ~= nil and type(arg_77_0.canMarkNode) == "table" and arg_77_0.canMarkNode[1] and arg_77_0.canMarkNode[1] ~= "" and arg_77_0.canMarkNode[2] and type(arg_77_0.canMarkNode[2]) == "table"
end

function var_0_0.GetCanMarkNodeData(arg_78_0)
	local var_78_0 = {}

	for iter_78_0, iter_78_1 in ipairs(arg_78_0.canMarkNode[2] or {}) do
		table.insert(var_78_0, iter_78_1 .. "")
	end

	return {
		name = arg_78_0.canMarkNode[1],
		marks = var_78_0
	}
end

function var_0_0.OnClear(arg_79_0)
	return
end

function var_0_0.GetUsingPaintingNames(arg_80_0)
	local var_80_0 = {}
	local var_80_1 = arg_80_0:GetPainting()

	if var_80_1 ~= nil then
		table.insert(var_80_0, var_80_1)
	end

	local var_80_2 = arg_80_0:GetSubPaintings()

	for iter_80_0, iter_80_1 in ipairs(var_80_2) do
		local var_80_3 = iter_80_1.name

		table.insert(var_80_0, var_80_3)
	end

	return var_80_0
end

return var_0_0
