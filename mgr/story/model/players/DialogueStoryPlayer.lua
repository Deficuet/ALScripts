local var_0_0 = class("DialogueStoryPlayer", import(".StoryPlayer"))
local var_0_1 = 159
local var_0_2 = 411
local var_0_3 = 250

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.actorPanel = arg_1_0._tf:Find("actor")
	arg_1_0.actorLeft = arg_1_0.actorPanel:Find("actor_left")
	arg_1_0.initActorLeftPos = arg_1_0.actorLeft.localPosition
	arg_1_0.actorMiddle = arg_1_0.actorPanel:Find("actor_middle")
	arg_1_0.initActorMiddlePos = arg_1_0.actorMiddle.localPosition
	arg_1_0.actorRgiht = arg_1_0.actorPanel:Find("actor_right")
	arg_1_0.initActorRgihtPos = arg_1_0.actorRgiht.localPosition
	arg_1_0.sortingOrder = arg_1_0._go:GetComponent(typeof(Canvas)).sortingOrder
	arg_1_0.subActorMiddle = UIItemList.New(arg_1_0.actorPanel:Find("actor_middle/sub"), arg_1_0.actorPanel:Find("actor_middle/sub/tpl"))
	arg_1_0.subActorRgiht = UIItemList.New(arg_1_0.actorPanel:Find("actor_right/sub"), arg_1_0.actorPanel:Find("actor_right/sub/tpl"))
	arg_1_0.subActorLeft = UIItemList.New(arg_1_0.actorPanel:Find("actor_left/sub"), arg_1_0.actorPanel:Find("actor_left/sub/tpl"))
	arg_1_0.glitchArtMaterial = arg_1_0._tf:Find("resource/material1"):GetComponent(typeof(Image)).material
	arg_1_0.maskMaterial = arg_1_0._tf:Find("resource/material2"):GetComponent(typeof(Image)).material
	arg_1_0.maskMaterialForWithLayer = arg_1_0._tf:Find("resource/material5"):GetComponent(typeof(Image)).material
	arg_1_0.glitchArtMaterialForPainting = arg_1_0._tf:Find("resource/material3"):GetComponent(typeof(Image)).material
	arg_1_0.glitchArtMaterialForPaintingBg = arg_1_0._tf:Find("resource/material4"):GetComponent(typeof(Image)).material
	arg_1_0.headObjectMat = arg_1_0._tf:Find("resource/material6"):GetComponent(typeof(Image)).material
	arg_1_0.headMaskMat = arg_1_0._tf:Find("resource/material7"):GetComponent(typeof(Image)).material
	arg_1_0.typewriterSpeed = 0
	arg_1_0.contentBgAlpha = 1
	arg_1_0.live2dChars = {}
	arg_1_0.spinePainings = {}
end

function var_0_0.OnStart(arg_2_0, arg_2_1)
	arg_2_0.nextTr = arg_2_0.dialogueWin:Find("next")
	arg_2_0.conentTr = arg_2_0.dialogueWin:Find("content")
	arg_2_0.conentTxt = arg_2_0.dialogueWin:Find("content"):GetComponent(typeof(Text))
	arg_2_0.typewriter = arg_2_0.dialogueWin:Find("content"):GetComponent(typeof(Typewriter))
	arg_2_0.nameTr = arg_2_0.dialogueWin:Find("content/name")
	arg_2_0.tag4Dialog2 = arg_2_0.dialogueWin:Find("content/tag")
	arg_2_0.nameTxt = arg_2_0.nameTr:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.portraitTr = arg_2_0.dialogueWin:Find("portrait")
	arg_2_0.conentLineTr = arg_2_0.dialogueWin:Find("line")
	arg_2_0.portraitImg = arg_2_0.portraitTr:GetComponent(typeof(Image))
	arg_2_0.tags = {
		arg_2_0.nameTr:Find("tags/1"),
		arg_2_0.nameTr:Find("tags/2")
	}
	arg_2_0.contentBgs = {
		arg_2_0.nameTr:Find("bg"),
		arg_2_0.dialogueWin:Find("bg")
	}
	arg_2_0.defualtFontSize = arg_2_0.conentTxt.fontSize
end

function var_0_0.OnReset(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_0:ResetActorTF(arg_3_1, arg_3_2)
	setActive(arg_3_0.nameTr, false)
	setActive(arg_3_0.nameTr, false)
	setActive(arg_3_0.dialoguePanel, true)
	setActive(arg_3_0.actorPanel, true)
	setActive(arg_3_0.nextTr, false)

	arg_3_0.conentTxt.text = ""

	local var_3_0 = arg_3_1:ExistPortrait()
	local var_3_1 = arg_3_2 and arg_3_2:IsDialogueMode() and arg_3_2:ExistPortrait() and var_3_0

	setActive(arg_3_0.portraitTr, var_3_1)

	if not var_3_1 and arg_3_2 and arg_3_2:IsDialogueMode() and arg_3_2:ShouldGlitchArtForPortrait() then
		arg_3_0:ClearGlitchArtForPortrait()
	end

	arg_3_0:UpdateContentPosition(arg_3_1)
	arg_3_0:SetContentBgAlpha(arg_3_1:GetContentBGAlpha())
	arg_3_3()
end

function var_0_0.UpdateContentPosition(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:ExistPortrait()
	local var_4_1 = arg_4_1:IsMiniPortrait()
	local var_4_2 = var_4_0 and (var_4_1 and var_0_3 or var_0_2) or var_0_1

	arg_4_0.conentTr.offsetMin = Vector2(var_4_2, arg_4_0.conentTr.offsetMin.y)

	local var_4_3 = var_4_1 and var_0_3 or var_0_1

	arg_4_0.conentLineTr.offsetMin = Vector2(var_4_3, arg_4_0.conentLineTr.offsetMin.y)
end

local function var_0_4(arg_5_0, arg_5_1)
	if not arg_5_1 then
		return false
	end

	local var_5_0

	if arg_5_0:IsLive2dPainting() then
		var_5_0 = arg_5_1:Find("live2d")
	elseif arg_5_0:IsSpinePainting() then
		var_5_0 = arg_5_1:Find("spine")
	else
		var_5_0 = arg_5_1:Find("fitter")
	end

	if var_5_0.childCount <= 0 then
		return false
	end

	return var_5_0:GetChild(0).name == arg_5_0:GetPainting()
end

function var_0_0.GetRecycleActorList(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1:GetSide()
	local var_6_1 = arg_6_0:GetSideTF(var_6_0)
	local var_6_2 = {}

	if arg_6_1:HideOtherPainting() then
		var_6_2 = {
			arg_6_0.actorLeft,
			arg_6_0.actorMiddle,
			arg_6_0.actorRgiht
		}
	else
		if arg_6_2 and arg_6_2:IsDialogueMode() and arg_6_1:IsDialogueMode() and arg_6_1:IsSameSide(arg_6_2) and arg_6_1:IsSamePainting(arg_6_2) or var_0_4(arg_6_1, var_6_1) then
			-- block empty
		else
			table.insert(var_6_2, var_6_1)
		end

		if var_6_0 == DialogueStep.SIDE_MIDDLE then
			table.insert(var_6_2, arg_6_0.actorLeft)
			table.insert(var_6_2, arg_6_0.actorRgiht)
		end
	end

	return var_6_2
end

function var_0_0.ResetActorTF(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1:GetSide()
	local var_7_1 = arg_7_0:GetSideTF(var_7_0)

	if var_7_1 then
		arg_7_0:CancelTween(var_7_1.gameObject)

		var_7_1.localScale = Vector3(1, 1, 1)
		var_7_1.eulerAngles = Vector3(0, 0, 0)

		if var_7_1 == arg_7_0.actorRgiht then
			var_7_1.localPosition = arg_7_0.initActorRgihtPos
		elseif var_7_1 == arg_7_0.actorMiddle then
			var_7_1.localPosition = arg_7_0.initActorMiddlePos
		elseif var_7_1 == arg_7_0.actorLeft then
			var_7_1.localPosition = arg_7_0.initActorLeftPos
		end
	end

	local var_7_2 = arg_7_0:GetRecycleActorList(arg_7_1, arg_7_2)

	if var_7_1 and _.all(var_7_2, function(arg_8_0)
		return arg_8_0 ~= var_7_1
	end) then
		arg_7_0.paintingStay = true

		arg_7_0:ResetMeshPainting(var_7_1)

		if arg_7_1:IsSpinePainting() then
			arg_7_0:HideSpineEffect(var_7_1, arg_7_1)
		end
	end

	arg_7_0:RecyclePaintingList(var_7_2)
	arg_7_0:RecyclesSubPantings(arg_7_0.subActorMiddle)
	arg_7_0:RecyclesSubPantings(arg_7_0.subActorRgiht)
	arg_7_0:RecyclesSubPantings(arg_7_0.subActorLeft)

	for iter_7_0, iter_7_1 in ipairs({
		arg_7_0.actorLeft,
		arg_7_0.actorMiddle,
		arg_7_0.actorRgiht
	}) do
		iter_7_1:GetComponent(typeof(CanvasGroup)).alpha = 1
	end
end

function var_0_0.HideSpineEffect(arg_9_0, arg_9_1)
	arg_9_0.spineEffectOrderCaches = {}

	local function var_9_0(arg_10_0)
		local var_10_0 = arg_10_0:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer")):ToTable()

		for iter_10_0, iter_10_1 in ipairs(var_10_0) do
			local var_10_1 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_10_1)

			ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_10_1, -1)

			arg_9_0.spineEffectOrderCaches[iter_10_1] = var_10_1
		end
	end

	local var_9_1 = arg_9_1:Find("spine")
	local var_9_2 = arg_9_1:Find("spinebg")

	var_9_0(var_9_1)
	var_9_0(var_9_2)
end

function var_0_0.RevertSpineEffect(arg_11_0, arg_11_1, arg_11_2)
	if not arg_11_2 then
		return
	end

	local function var_11_0(arg_12_0)
		local var_12_0 = arg_12_0:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer")):ToTable()

		for iter_12_0, iter_12_1 in ipairs(var_12_0) do
			local var_12_1 = arg_11_2[iter_12_1] or 950

			ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_12_1, var_12_1)
		end
	end

	local var_11_1 = arg_11_1:Find("spine")
	local var_11_2 = arg_11_1:Find("spinebg")

	var_11_0(var_11_1)
	var_11_0(var_11_2)
end

function var_0_0.OnInit(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = {
		function(arg_14_0)
			arg_13_0:UpdateContent(arg_13_1, arg_14_0)
		end,
		function(arg_15_0)
			arg_13_0:UpdatePortrait(arg_13_1, arg_15_0)
		end,
		function(arg_16_0)
			arg_13_0:UpdateSubPaintings(arg_13_1, arg_16_0)
		end,
		function(arg_17_0)
			arg_13_0:UpdatePainting(arg_13_1, arg_13_2, arg_17_0)
		end,
		function(arg_18_0)
			arg_13_0:GrayingInPainting(arg_13_1, arg_13_2, arg_18_0)
		end,
		function(arg_19_0)
			arg_13_0:StartMovePrevPaintingToSide(arg_13_1, arg_13_2, arg_19_0)
		end,
		function(arg_20_0)
			arg_13_0:GrayingOutPrevPainting(arg_13_2, arg_13_1, arg_20_0)
		end
	}

	parallelAsync(var_13_0, arg_13_3)
end

function var_0_0.UpdatePortrait(arg_21_0, arg_21_1, arg_21_2)
	if not arg_21_1:ExistPortrait() then
		arg_21_2()

		return
	end

	local var_21_0 = arg_21_1:GetPortrait()

	LoadSpriteAsync("StoryIcon/" .. var_21_0, function(arg_22_0)
		setImageSprite(arg_21_0.portraitTr, arg_22_0, true)
		setActive(arg_21_0.portraitTr, true)
		arg_21_0:AdjustPortraitPosition(arg_21_1)

		if arg_21_1:ShouldGlitchArtForPortrait() then
			arg_21_0:SetGlitchArtForPortrait()
		else
			arg_21_0:ClearGlitchArtForPortrait()
		end

		arg_21_2()
	end)
end

function var_0_0.AdjustPortraitPosition(arg_23_0, arg_23_1)
	if arg_23_1:IsMiniPortrait() then
		setAnchoredPosition3D(arg_23_0.portraitTr, {
			x = 211,
			y = 133
		})
	else
		local var_23_0 = arg_23_0.portraitTr.sizeDelta.x < var_0_2 and var_0_2 or 539

		setAnchoredPosition3D(arg_23_0.portraitTr, {
			y = 0,
			x = var_23_0
		})
	end
end

function var_0_0.SetGlitchArtForPortrait(arg_24_0)
	if arg_24_0.portraitImg.material ~= arg_24_0.glitchArtMaterialForPainting then
		arg_24_0.portraitImg.material = arg_24_0.glitchArtMaterialForPainting
	end
end

function var_0_0.ClearGlitchArtForPortrait(arg_25_0)
	if not arg_25_0.portraitImg then
		return
	end

	if arg_25_0.portraitImg.material ~= arg_25_0.portraitImg.defaultGraphicMaterial then
		arg_25_0.portraitImg.material = arg_25_0.portraitImg.defaultGraphicMaterial
	end
end

function var_0_0.UpdateSubPaintings(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0, var_26_1, var_26_2, var_26_3 = arg_26_0:GetSideTF(arg_26_1:GetSide())

	if not arg_26_1:ExistPainting() then
		arg_26_2()

		return
	end

	arg_26_0:InitSubPainting(var_26_3, arg_26_1:GetSubPaintings(), arg_26_1)

	if arg_26_1:NeedDispppearSubPainting() then
		arg_26_0:DisappearSubPainting(var_26_3, arg_26_1, arg_26_2)
	else
		arg_26_2()
	end
end

function var_0_0.OnStartUIAnimations(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_1:ShouldShakeDailogue() then
		arg_27_2()

		return
	end

	local var_27_0 = arg_27_1:GetShakeDailogueData()
	local var_27_1 = var_27_0.x
	local var_27_2 = var_27_0.number
	local var_27_3 = var_27_0.delay
	local var_27_4 = var_27_0.speed
	local var_27_5 = arg_27_0.dialogueWin.localPosition.x

	arg_27_0:TweenMovex(arg_27_0.dialogueWin, var_27_1, var_27_5, var_27_4, var_27_3, var_27_2, arg_27_2)
end

function var_0_0.OnEnter(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	parallelAsync({
		function(arg_29_0)
			arg_28_0:UpdateCanMarkNode(arg_28_1, arg_29_0)
		end,
		function(arg_30_0)
			arg_28_0:UpdateIcon(arg_28_1, arg_30_0)
		end
	}, arg_28_3)
end

local function var_0_5(arg_31_0, arg_31_1)
	LoadAnyAsync("Story/" .. arg_31_0, "", nil, arg_31_1)
end

local function var_0_6(arg_32_0, arg_32_1)
	if not arg_32_1 then
		return false
	end

	return arg_32_0:GetCanMarkNodeData().name == arg_32_1.name
end

function var_0_0.UpdateCanMarkNode(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_1:ExistCanMarkNode()

	if not var_33_0 or not var_0_6(arg_33_1, arg_33_0.canMarkNode) then
		arg_33_0:ClearCanMarkNode(arg_33_0.canMarkNode)
	end

	if not var_33_0 then
		arg_33_2()

		return
	end

	local var_33_1 = arg_33_1:GetCanMarkNodeData()

	local function var_33_2(arg_34_0)
		eachChild(arg_34_0, function(arg_35_0)
			local var_35_0 = table.contains(var_33_1.marks, arg_35_0.gameObject.name)

			if var_35_0 ~= isActive(arg_35_0) then
				setActive(arg_35_0, var_35_0)
			end
		end)
	end

	if not arg_33_0.canMarkNode then
		var_0_5(var_33_1.name, function(arg_36_0)
			if arg_33_0.stop or not arg_36_0 then
				arg_33_2()

				return
			end

			local var_36_0 = Object.Instantiate(arg_36_0, arg_33_0.backPanel)

			arg_33_0.canMarkNode = {
				name = var_33_1.name,
				go = var_36_0
			}

			var_33_2(var_36_0)
			arg_33_2()
		end)
	else
		var_33_2(arg_33_0.canMarkNode.go)
		arg_33_2()
	end
end

function var_0_0.ClearCanMarkNode(arg_37_0)
	if arg_37_0.canMarkNode then
		Destroy(arg_37_0.canMarkNode.go)

		arg_37_0.canMarkNode = nil
	end
end

function var_0_0.GrayingOutPrevPainting(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	if not arg_38_1 or not arg_38_1:IsDialogueMode() then
		arg_38_3()

		return
	end

	local var_38_0 = arg_38_0:GetSideTF(arg_38_2:GetPrevSide(arg_38_1))

	if var_38_0 and arg_38_2 and arg_38_2:IsDialogueMode() and arg_38_2:ShouldGrayingOutPainting(arg_38_1) then
		local var_38_1 = arg_38_1:GetPaintingData()
		local var_38_2 = arg_38_1:GetPaintingAlpha() or 1

		arg_38_0:fadeTransform(var_38_0, var_38_2, var_38_1.alpha, var_38_1.time, false, arg_38_3)
	else
		arg_38_3()
	end
end

function var_0_0.GrayingInPainting(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	if not arg_39_1:ExistPainting() then
		arg_39_3()

		return
	end

	if arg_39_2 and arg_39_2:IsDialogueMode() and arg_39_1:ShouldGrayingPainting(arg_39_2) then
		local var_39_0 = arg_39_0:GetSideTF(arg_39_1:GetSide())
		local var_39_1 = arg_39_1:GetPaintingData()

		if not IsNil(var_39_0) and not arg_39_1:GetPaintingAlpha() then
			arg_39_0:fadeTransform(var_39_0, var_39_1.alpha, 1, var_39_1.time, false)
		end
	end

	arg_39_3()
end

function var_0_0.UpdateTypeWriter(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_1:GetTypewriter()

	if not var_40_0 then
		arg_40_2()

		return
	end

	function arg_40_0.typewriter.endFunc()
		arg_40_0.typewriterSpeed = 0
		arg_40_0.typewriter.endFunc = nil

		removeOnButton(arg_40_0._tf)
		arg_40_2()
	end

	arg_40_0.typewriterSpeed = math.max((var_40_0.speed or 0.1) * arg_40_0.timeScale, 0.001)

	local var_40_1 = var_40_0.speedUp or arg_40_0.typewriterSpeed

	arg_40_0.typewriter:setSpeed(arg_40_0.typewriterSpeed)
	arg_40_0.typewriter:Play()
	onButton(arg_40_0, arg_40_0._tf, function()
		if arg_40_0.puase or arg_40_0.stop then
			return
		end

		arg_40_0.typewriterSpeed = math.min(arg_40_0.typewriterSpeed, var_40_1)

		arg_40_0.typewriter:setSpeed(arg_40_0.typewriterSpeed)
	end, SFX_PANEL)
end

function var_0_0.UpdatePainting(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	if not arg_43_1:ExistPainting() then
		arg_43_3()

		return
	end

	local var_43_0 = not arg_43_0.paintingStay

	if arg_43_0.paintingStay and arg_43_0.spineEffectOrderCaches and arg_43_1:IsSpinePainting() then
		local var_43_1 = arg_43_0:GetSideTF(arg_43_1:GetSide())

		arg_43_0:RevertSpineEffect(var_43_1, arg_43_0.spineEffectOrderCaches)
	end

	arg_43_0.spineEffectOrderCaches = nil
	arg_43_0.paintingStay = nil

	local var_43_2, var_43_3, var_43_4, var_43_5 = arg_43_0:GetSideTF(arg_43_1:GetSide())
	local var_43_6 = arg_43_2 and arg_43_2:IsDialogueMode() and (arg_43_1:ShouldGrayingOutPainting(arg_43_2) or arg_43_1:ShouldGrayingPainting(arg_43_2)) or not arg_43_1:ShouldFadeInPainting() or not var_43_0
	local var_43_7 = arg_43_2 and arg_43_2:IsDialogueMode() and arg_43_1:ShouldGrayingPainting(arg_43_2)

	seriesAsync({
		function(arg_44_0)
			if not var_43_6 then
				var_43_2:GetComponent(typeof(CanvasGroup)).alpha = 0
			end

			arg_43_0:LoadPainting(arg_43_1, var_43_0, arg_44_0)

			if var_43_7 then
				local var_44_0 = arg_43_1:GetPaintingData()

				arg_43_0:SetFadeColor(var_43_2, var_44_0.alpha)
			end
		end,
		function(arg_45_0)
			if var_43_6 then
				arg_45_0()

				return
			end

			arg_43_0:FadeInPainting(var_43_2, arg_43_1, arg_45_0)
		end,
		function(arg_46_0)
			arg_43_0:AnimationPainting(arg_43_1, arg_46_0)
		end
	}, arg_43_3)
end

function var_0_0.FadeInPainting(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	local var_47_0 = arg_47_1:GetComponent(typeof(CanvasGroup))
	local var_47_1 = arg_47_2:GetFadeInPaintingTime()
	local var_47_2 = arg_47_2:ShouldAddHeadMaskWhenFade()

	if var_47_2 then
		arg_47_0:AddHeadMask(arg_47_1)
	end

	arg_47_0:TweenValueForcanvasGroup(var_47_0, 0, 1, var_47_1, 0, function()
		if var_47_2 then
			arg_47_0:ClearHeadMask(arg_47_1)
		end

		arg_47_3()
	end)
end

function var_0_0.AddHeadMask(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_1:Find("fitter")

	if not var_49_0 or var_49_0.childCount <= 0 then
		return
	end

	local var_49_1 = var_49_0:GetChild(0)
	local var_49_2 = var_49_1:Find("face")
	local var_49_3 = cloneTplTo(var_49_2, var_49_2.parent, "head_mask")
	local var_49_4 = var_49_1:Find("layers")
	local var_49_5 = arg_49_1:GetComponentsInChildren(typeof(Image)):ToTable()

	if var_49_4 then
		for iter_49_0, iter_49_1 in ipairs(var_49_5) do
			if iter_49_1.gameObject.name == "head_mask" then
				iter_49_1.material = arg_49_0.headMaskMat
			elseif iter_49_1.gameObject.name == "face" then
				-- block empty
			elseif iter_49_1.gameObject.transform.parent == var_49_4 then
				iter_49_1.material = arg_49_0.headObjectMat
			end
		end
	else
		for iter_49_2, iter_49_3 in ipairs(var_49_5) do
			if iter_49_3.gameObject.name == "head_mask" then
				iter_49_3.material = arg_49_0.headMaskMat
			elseif iter_49_3.gameObject.name == "face" then
				-- block empty
			else
				iter_49_3.material = arg_49_0.headObjectMat
			end
		end
	end
end

function var_0_0.ClearHeadMask(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1:Find("fitter")

	if not var_50_0 or var_50_0.childCount <= 0 then
		return
	end

	local var_50_1 = var_50_0:GetChild(0):Find("head_mask")

	Destroy(var_50_1.gameObject)

	local var_50_2 = arg_50_1:GetComponentsInChildren(typeof(Image)):ToTable()

	for iter_50_0, iter_50_1 in ipairs(var_50_2) do
		iter_50_1.material = iter_50_1.defaultGraphicMaterial
	end
end

function var_0_0.AnimationPainting(arg_51_0, arg_51_1, arg_51_2)
	if arg_51_1:IsLive2dPainting() or arg_51_1:IsSpinePainting() then
		arg_51_2()

		return
	end

	local var_51_0, var_51_1, var_51_2, var_51_3 = arg_51_0:GetSideTF(arg_51_1:GetSide())

	arg_51_0:StartPaintingActions(var_51_0, arg_51_1, arg_51_2)
end

function var_0_0.LoadPainting(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	local var_52_0, var_52_1, var_52_2, var_52_3 = arg_52_0:GetSideTF(arg_52_1:GetSide())
	local var_52_4, var_52_5 = arg_52_1:GetPaintingAndName()

	if arg_52_1:IsLive2dPainting() and checkABExist("live2d/" .. var_52_5) and not Live2dConst.GetLive2DArm32MatchAble() then
		arg_52_0:UpdateLive2dPainting(arg_52_1, var_52_0, arg_52_2, arg_52_3)
	elseif arg_52_1:IsSpinePainting() and checkABExist("spinepainting/" .. var_52_5) then
		arg_52_0:UpdateSpinePainting(arg_52_1, var_52_0, arg_52_2, arg_52_3)
	else
		arg_52_0:UpdateMeshPainting(arg_52_1, var_52_0, var_52_3, arg_52_2, arg_52_3)
	end
end

function var_0_0.UpdateLive2dPainting(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4)
	local function var_53_0(arg_54_0)
		local var_54_0 = arg_53_1:GetVirtualShip()
		local var_54_1 = arg_53_1:GetLive2dPos()
		local var_54_2 = Live2D.GenerateData({
			ship = var_54_0,
			offset = var_54_0:GetSkinConfig().live2d_offset,
			position = var_54_1 or Vector3(0, 0, 0),
			parent = arg_53_2:Find("live2d")
		})
		local var_54_3 = GetOrAddComponent(arg_53_0._go, typeof(CanvasGroup))

		var_54_3.blocksRaycasts = false

		local var_54_4 = Live2D.New(var_54_2, function(arg_55_0)
			arg_55_0._go.name = arg_53_1:GetPainting()

			local var_55_0 = arg_55_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
			local var_55_1 = arg_53_0.sortingOrder + 1
			local var_55_2 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

			ReflectionHelp.RefSetProperty(var_55_2, "SortingOrder", var_55_0, var_55_1)

			local var_55_3 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Rendering.CubismSortingMode"), "BackToFrontOrder")

			ReflectionHelp.RefSetProperty(var_55_2, "SortingMode", var_55_0, var_55_3)

			local var_55_4 = GetOrAddComponent(arg_53_0.front, typeof(Canvas))

			GetOrAddComponent(arg_53_0.front, typeof(GraphicRaycaster))

			var_55_4.overrideSorting = true
			var_55_4.sortingOrder = var_55_1 + arg_55_0._tf:Find("Drawables").childCount
			var_54_3.blocksRaycasts = true

			if arg_54_0 then
				arg_54_0(arg_55_0)
			end
		end)

		arg_53_0.live2dChars[arg_53_2] = var_54_4
	end

	local function var_53_1(arg_56_0)
		if arg_56_0 then
			local var_56_0 = arg_53_1:GetLive2dAction()

			if var_56_0 and var_56_0 ~= "" then
				arg_56_0:TriggerAction(var_56_0)
			end

			local var_56_1 = arg_53_1:GetL2dIdleIndex()

			if var_56_1 and var_56_1 ~= "" and var_56_1 > 0 then
				arg_56_0:changeIdleIndex(var_56_1)
			end

			local var_56_2 = arg_53_1:GetL2dParams()

			if var_56_2 then
				arg_56_0:changeDragParameter(var_56_2.name, var_56_2.value)
			end
		end

		arg_53_4()
	end

	if not arg_53_3 and arg_53_0.live2dChars[arg_53_2] then
		local var_53_2 = arg_53_0.live2dChars[arg_53_2]

		var_53_1(var_53_2)
	else
		var_53_0(var_53_1)
	end
end

local function var_0_7(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = arg_57_0:GetComponentsInChildren(typeof(Canvas)):ToTable()
	local var_57_1

	for iter_57_0, iter_57_1 in ipairs(var_57_0) do
		var_57_1 = iter_57_1.sortingOrder
	end

	local var_57_2 = math.huge
	local var_57_3 = arg_57_1:GetComponentsInChildren(typeof(Canvas)):ToTable()

	if #var_57_3 == 0 then
		var_57_2 = 0
	else
		for iter_57_2, iter_57_3 in ipairs(var_57_3) do
			local var_57_4 = iter_57_3.sortingOrder - var_57_1

			if var_57_4 < var_57_2 then
				var_57_2 = var_57_4
			end
		end
	end

	local var_57_5 = arg_57_1:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer")):ToTable()
	local var_57_6 = {}

	for iter_57_4, iter_57_5 in ipairs(var_57_5) do
		local var_57_7 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_57_5)

		var_57_6[iter_57_4] = var_57_7

		local var_57_8 = var_57_7 - var_57_1

		if var_57_8 < var_57_2 then
			var_57_2 = var_57_8
		end
	end

	local var_57_9 = arg_57_2 - var_57_2 + 1

	for iter_57_6, iter_57_7 in ipairs(var_57_0) do
		iter_57_7.sortingOrder = var_57_9 + (iter_57_6 - 1)
	end

	local var_57_10 = var_57_9 + 1

	for iter_57_8, iter_57_9 in ipairs(var_57_3) do
		local var_57_11 = var_57_9 + (iter_57_9.sortingOrder - var_57_1)

		iter_57_9.sortingOrder = var_57_11

		if var_57_9 < var_57_11 then
			var_57_10 = var_57_11
		end
	end

	for iter_57_10, iter_57_11 in ipairs(var_57_5) do
		local var_57_12 = var_57_9 + (var_57_6[iter_57_10] - var_57_1)

		ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_57_11, var_57_12)

		if var_57_9 < var_57_12 then
			var_57_10 = var_57_12
		end
	end

	return var_57_10
end

local function var_0_8(arg_58_0, arg_58_1, arg_58_2)
	local var_58_0 = arg_58_0:GetComponentsInChildren(typeof(Canvas)):ToTable()
	local var_58_1 = arg_58_0:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer")):ToTable()
	local var_58_2 = math.huge

	if #var_58_0 == 0 then
		var_58_2 = 0
	else
		for iter_58_0, iter_58_1 in ipairs(var_58_0) do
			local var_58_3 = iter_58_1.sortingOrder

			if var_58_3 < var_58_2 then
				var_58_2 = var_58_3
			end
		end
	end

	local var_58_4 = {}

	for iter_58_2, iter_58_3 in ipairs(var_58_1) do
		local var_58_5 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_58_3)

		var_58_4[iter_58_2] = var_58_5

		if var_58_5 < var_58_2 then
			var_58_2 = var_58_5
		end
	end

	local var_58_6 = arg_58_2 + 1
	local var_58_7 = var_58_6 - var_58_2

	for iter_58_4, iter_58_5 in ipairs(var_58_0) do
		local var_58_8 = var_58_7 + iter_58_5.sortingOrder

		iter_58_5.sortingOrder = var_58_8

		if var_58_6 < var_58_8 then
			var_58_6 = var_58_8
		end
	end

	for iter_58_6, iter_58_7 in ipairs(var_58_1) do
		local var_58_9 = var_58_7 + var_58_4[iter_58_6]

		ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_58_7, var_58_9)

		if var_58_9 < var_58_6 then
			var_58_6 = var_58_9
		end
	end

	return var_58_6
end

function var_0_0.UpdateSpinePainting(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4)
	local function var_59_0(arg_60_0)
		local var_60_0 = arg_59_2:Find("spine")
		local var_60_1 = arg_59_2:Find("spinebg")
		local var_60_2 = arg_59_1:GetVirtualShip()
		local var_60_3 = SpinePainting.GenerateData({
			ship = var_60_2,
			position = arg_59_1:GetSpinePosition(),
			parent = var_60_0,
			effectParent = var_60_1
		})

		setActive(var_60_1, not arg_59_1:IsHideSpineBg())

		local var_60_4 = SpinePainting.New(var_60_3, function(arg_61_0)
			arg_61_0._go.name = arg_59_1:GetPainting()

			local var_61_0 = arg_59_0.sortingOrder
			local var_61_1 = arg_59_1:GetSpineOrderIndex()

			if not var_61_1 then
				var_61_0 = var_0_7(var_60_0, var_60_1, arg_59_0.sortingOrder)
			else
				var_61_0 = var_0_8(var_60_0, var_61_1, arg_59_0.sortingOrder)
			end

			local var_61_2 = GetOrAddComponent(arg_59_0.front, typeof(Canvas))

			GetOrAddComponent(arg_59_0.front, typeof(GraphicRaycaster))

			var_61_2.overrideSorting = true
			var_61_2.sortingOrder = var_61_0 + 1

			arg_59_0:UpdateSpineExpression(arg_61_0, arg_59_1)

			if arg_60_0 then
				arg_60_0()
			end
		end)

		arg_59_0.spinePainings[arg_59_2] = var_60_4
	end

	if not arg_59_3 and arg_59_0.spinePainings[arg_59_2] then
		arg_59_0:UpdateSpineExpression(arg_59_0.spinePainings[arg_59_2], arg_59_1)
		arg_59_4()
	else
		var_59_0(arg_59_4)
	end
end

function var_0_0.UpdateSpineExpression(arg_62_0, arg_62_1, arg_62_2)
	local var_62_0 = arg_62_2:GetSpineExPression()

	if var_62_0 then
		arg_62_1:SetAction(var_62_0, 1)
	else
		arg_62_1:SetEmptyAction(1)
	end
end

function var_0_0.UpdateMeshPainting(arg_63_0, arg_63_1, arg_63_2, arg_63_3, arg_63_4, arg_63_5)
	local var_63_0 = arg_63_1:GetPainting()
	local var_63_1 = false

	local function var_63_2()
		if arg_63_1:IsShowNPainting() and checkABExist("painting/" .. var_63_0 .. "_n") then
			var_63_0 = var_63_0 .. "_n"
		end

		if arg_63_1:IsShowWJZPainting() and checkABExist("painting/" .. var_63_0 .. "_wjz") then
			var_63_0 = var_63_0 .. "_wjz"
		end

		setPaintingPrefab(arg_63_2, var_63_0, "duihua")
	end

	if var_63_0 then
		local var_63_3 = findTF(arg_63_2, "fitter").childCount

		if arg_63_4 or var_63_3 <= 0 then
			var_63_2()
		end

		local var_63_4 = arg_63_1:GetPaintingDir()
		local var_63_5 = math.abs(var_63_4)

		if arg_63_1:ShouldFlipPaintingY() then
			var_63_5 = -var_63_5
		end

		arg_63_2.localScale = Vector3(var_63_4, var_63_5, 1)

		local var_63_6 = findTF(arg_63_2, "fitter"):GetChild(0)

		var_63_6.name = var_63_0

		arg_63_0:UpdateActorPostion(arg_63_2, arg_63_1)
		arg_63_0:UpdateExpression(var_63_6, arg_63_1)
		arg_63_0:AddGlitchArtEffectForPating(arg_63_2, var_63_6, arg_63_1)
		arg_63_2:SetAsLastSibling()

		if arg_63_1:ShouldGrayPainting() then
			setGray(var_63_6, true, true)
		end

		local var_63_7 = findTF(var_63_6, "shadow")

		if var_63_7 then
			setActive(var_63_7, arg_63_1:ShouldFaceBlack())
		end

		local var_63_8 = arg_63_1:GetPaintingAlpha()

		if var_63_8 then
			arg_63_0:setPaintingAlpha(arg_63_2, var_63_8)
		end
	end

	arg_63_5()
end

local function var_0_9(arg_65_0)
	local var_65_0 = arg_65_0.name

	if arg_65_0.showNPainting and checkABExist("painting/" .. var_65_0 .. "_n") then
		var_65_0 = var_65_0 .. "_n"
	end

	return var_65_0
end

function var_0_0.InitSubPainting(arg_66_0, arg_66_1, arg_66_2, arg_66_3)
	local function var_66_0(arg_67_0, arg_67_1)
		local var_67_0 = var_0_9(arg_67_0)

		setPaintingPrefab(arg_67_1, var_67_0, "duihua")

		local var_67_1 = findTF(arg_67_1, "fitter"):GetChild(0)
		local var_67_2 = findTF(var_67_1, "face")
		local var_67_3 = arg_67_0.expression

		if not arg_67_0.expression and arg_67_0.name and ShipExpressionHelper.DefaultFaceless(arg_67_0.name) then
			var_67_3 = ShipExpressionHelper.GetDefaultFace(arg_67_0.name)
		end

		if var_67_3 then
			setActive(var_67_2, true)

			local var_67_4 = GetSpriteFromAtlas("paintingface/" .. arg_67_0.name, arg_67_0.expression)

			setImageSprite(var_67_2, var_67_4)
		end

		if arg_67_0.pos then
			setAnchoredPosition(arg_67_1, arg_67_0.pos)
		end

		if arg_67_0.dir then
			arg_67_1.transform.localScale = Vector3(arg_67_0.dir, 1, 1)
		end

		if arg_67_0.paintingNoise then
			arg_66_0:AddGlitchArtEffectForPating(arg_67_1, var_67_1, arg_66_3)
		end
	end

	arg_66_1:make(function(arg_68_0, arg_68_1, arg_68_2)
		if arg_68_0 == UIItemList.EventUpdate then
			var_66_0(arg_66_2[arg_68_1 + 1], arg_68_2)
		end
	end)
	arg_66_1:align(#arg_66_2)
end

function var_0_0.DisappearSubPainting(arg_69_0, arg_69_1, arg_69_2, arg_69_3)
	local var_69_0 = arg_69_2:GetSubPaintings()
	local var_69_1, var_69_2 = arg_69_2:GetDisappearTime()
	local var_69_3 = arg_69_2:GetDisappearSeq()
	local var_69_4 = {}
	local var_69_5 = {}

	for iter_69_0, iter_69_1 in ipairs(var_69_0) do
		table.insert(var_69_5, iter_69_1)
	end

	for iter_69_2, iter_69_3 in ipairs(var_69_3) do
		local var_69_6 = iter_69_3

		table.insert(var_69_4, function(arg_70_0)
			for iter_70_0, iter_70_1 in ipairs(var_69_5) do
				if iter_70_1.actor == var_69_6 then
					table.remove(var_69_5, iter_70_0)

					break
				end
			end

			arg_69_0:InitSubPainting(arg_69_1, var_69_5, arg_69_2)
			arg_69_0:DelayCall(var_69_2, arg_70_0)
		end)
	end

	arg_69_1.container:SetAsFirstSibling()
	arg_69_0:DelayCall(var_69_1, function()
		seriesAsync(var_69_4, function()
			arg_69_1.container:SetAsLastSibling()
			arg_69_3()
		end)
	end)
end

function var_0_0.UpdateActorPostion(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = arg_73_2:GetPaitingOffst()

	if var_73_0 then
		local var_73_1 = arg_73_1.localPosition

		arg_73_1.localPosition = Vector3(var_73_1.x + (var_73_0.x or 0), var_73_1.y + (var_73_0.y or 0), 0)
	end
end

function var_0_0.UpdateExpression(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = arg_74_2:GetExPression()
	local var_74_1 = findTF(arg_74_1, "face")

	if var_74_0 then
		local var_74_2 = arg_74_2:GetPainting()
		local var_74_3 = GetSpriteFromAtlas("paintingface/" .. var_74_2, var_74_0)

		setActive(var_74_1, true)
		setImageSprite(var_74_1, var_74_3)
	else
		setActive(var_74_1, false)
	end
end

function var_0_0.StartPaintingActions(arg_75_0, arg_75_1, arg_75_2, arg_75_3)
	local var_75_0 = {
		function(arg_76_0)
			arg_75_0:StartPatiningMoveAction(arg_75_1, arg_75_2, arg_76_0)
		end,
		function(arg_77_0)
			arg_75_0:StartPatiningShakeAction(arg_75_1, arg_75_2, arg_77_0)
		end,
		function(arg_78_0)
			arg_75_0:StartPatiningZoomAction(arg_75_1, arg_75_2, arg_78_0)
		end,
		function(arg_79_0)
			arg_75_0:StartPatiningRotateAction(arg_75_1, arg_75_2, arg_79_0)
		end
	}

	parallelAsync(var_75_0, function()
		if arg_75_3 then
			arg_75_3()
		end
	end)
end

function var_0_0.StartPatiningShakeAction(arg_81_0, arg_81_1, arg_81_2, arg_81_3)
	local var_81_0 = arg_81_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_SHAKE)

	if not var_81_0 then
		arg_81_3()

		return
	end

	local function var_81_1(arg_82_0, arg_82_1)
		local var_82_0 = arg_82_0.x or 0
		local var_82_1 = arg_82_0.y or 10
		local var_82_2 = arg_82_0.dur or 1
		local var_82_3 = arg_82_0.delay or 0
		local var_82_4 = arg_82_0.number or 1
		local var_82_5 = tf(arg_81_1).localPosition

		arg_81_0:TweenMove(arg_81_1, Vector3(var_82_5.x + var_82_0, var_82_5.y + var_82_1, 0), var_82_2, var_82_4, var_82_3, arg_82_1)
	end

	local var_81_2 = {}

	for iter_81_0, iter_81_1 in pairs(var_81_0) do
		table.insert(var_81_2, function(arg_83_0)
			var_81_1(iter_81_1, arg_83_0)
		end)
	end

	parallelAsync(var_81_2, function()
		if arg_81_3 then
			arg_81_3()
		end
	end)
end

function var_0_0.StartPatiningZoomAction(arg_85_0, arg_85_1, arg_85_2, arg_85_3)
	local var_85_0 = arg_85_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_ZOOM)

	if not var_85_0 then
		arg_85_3()

		return
	end

	local function var_85_1(arg_86_0, arg_86_1)
		if not arg_86_0.from then
			local var_86_0 = {
				0,
				0,
				0
			}
		end

		local var_86_1 = arg_86_0.to or {
			1,
			1,
			1
		}
		local var_86_2 = arg_86_0.dur or 0
		local var_86_3 = arg_86_0.delay or 0

		arg_85_0:TweenScale(arg_85_1, Vector3(var_86_1[1], var_86_1[2], var_86_1[3]), var_86_2, var_86_3, arg_86_1)
	end

	local var_85_2 = {}

	for iter_85_0, iter_85_1 in pairs(var_85_0) do
		table.insert(var_85_2, function(arg_87_0)
			var_85_1(iter_85_1, arg_87_0)
		end)
	end

	parallelAsync(var_85_2, function()
		if arg_85_3 then
			arg_85_3()
		end
	end)
end

function var_0_0.StartPatiningRotateAction(arg_89_0, arg_89_1, arg_89_2, arg_89_3)
	local var_89_0 = arg_89_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_ROTATE)

	if not var_89_0 then
		arg_89_3()

		return
	end

	local function var_89_1(arg_90_0, arg_90_1)
		local var_90_0 = arg_90_0.value
		local var_90_1 = arg_90_0.dur or 1
		local var_90_2 = arg_90_0.number or 1
		local var_90_3 = arg_90_0.delay or 0

		arg_89_0:TweenRotate(arg_89_1, var_90_0, var_90_1, var_90_2, var_90_3, arg_90_1)
	end

	local var_89_2 = {}

	for iter_89_0, iter_89_1 in pairs(var_89_0) do
		table.insert(var_89_2, function(arg_91_0)
			var_89_1(iter_89_1, arg_91_0)
		end)
	end

	parallelAsync(var_89_2, function()
		if arg_89_3 then
			arg_89_3()
		end
	end)
end

function var_0_0.StartPatiningMoveAction(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
	local var_93_0 = arg_93_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_MOVE)

	if not var_93_0 then
		arg_93_3()

		return
	end

	local function var_93_1(arg_94_0, arg_94_1)
		local var_94_0 = arg_94_0.x or 0
		local var_94_1 = arg_94_0.y or 0
		local var_94_2 = arg_94_0.dur or 1
		local var_94_3 = arg_94_0.delay or 0
		local var_94_4 = tf(arg_93_1).localPosition

		arg_93_0:TweenMove(arg_93_1, Vector3(var_94_4.x + var_94_0, var_94_4.y + var_94_1, 0), var_94_2, 1, var_94_3, arg_94_1)
	end

	local var_93_2 = {}

	for iter_93_0, iter_93_1 in pairs(var_93_0) do
		table.insert(var_93_2, function(arg_95_0)
			var_93_1(iter_93_1, arg_95_0)
		end)
	end

	parallelAsync(var_93_2, function()
		if arg_93_3 then
			arg_93_3()
		end
	end)
end

function var_0_0.StartMovePrevPaintingToSide(arg_97_0, arg_97_1, arg_97_2, arg_97_3)
	local var_97_0 = arg_97_1:GetPaintingMoveToSide()

	if not var_97_0 or not arg_97_2 then
		arg_97_3()

		return
	end

	local var_97_1 = arg_97_0:GetSideTF(arg_97_2:GetSide())

	if not var_97_1 then
		arg_97_3()

		return
	end

	local var_97_2 = var_97_0.time
	local var_97_3 = var_97_0.side
	local var_97_4 = arg_97_0:GetSideTF(var_97_3)

	if not var_97_4 then
		arg_97_3()

		return
	end

	if arg_97_1.side ~= arg_97_2.side then
		if var_97_1:Find("fitter").childCount > 0 then
			local var_97_5 = var_97_1:Find("fitter"):GetChild(0)

			removeAllChildren(var_97_4:Find("fitter"))
			setParent(var_97_5, var_97_4:Find("fitter"))

			local var_97_6 = arg_97_2:GetPaintingDir()

			var_97_4.localScale = Vector3(var_97_6, math.abs(var_97_6), 1)
		end
	else
		local var_97_7 = arg_97_2:GetPainting()

		if var_97_7 then
			setPaintingPrefab(var_97_4, var_97_7, "duihua")
		end
	end

	local var_97_8 = tf(var_97_4).localPosition

	arg_97_0:TweenValue(var_97_4, var_97_1.localPosition.x, var_97_8.x, var_97_2, 0, function(arg_98_0)
		setAnchoredPosition(var_97_4, {
			x = arg_98_0
		})
	end, arg_97_3)

	var_97_4.localPosition = Vector2(var_97_1.localPosition.x, var_97_4.localPosition.y, 0)
end

local function var_0_10(arg_99_0, arg_99_1, arg_99_2, arg_99_3, arg_99_4)
	local var_99_0 = arg_99_1:GetComponentsInChildren(typeof(Image)):ToTable()

	for iter_99_0, iter_99_1 in ipairs(var_99_0) do
		if iter_99_1.gameObject.name == "temp_mask" then
			iter_99_1.material = arg_99_4 and arg_99_0.maskMaterial or arg_99_0.maskMaterialForWithLayer
		elseif iter_99_1.gameObject.name == "face" then
			iter_99_1.material = arg_99_0.glitchArtMaterial
		elseif arg_99_3.hasPaintbg and iter_99_1.gameObject == arg_99_2.gameObject then
			iter_99_1.material = arg_99_0.glitchArtMaterialForPaintingBg
		else
			iter_99_1.material = arg_99_0.glitchArtMaterialForPainting
		end
	end
end

local function var_0_11(arg_100_0, arg_100_1, arg_100_2, arg_100_3, arg_100_4)
	local var_100_0 = arg_100_1:GetComponentsInChildren(typeof(Image)):ToTable()
	local var_100_1 = {}
	local var_100_2 = arg_100_2:GetComponent(typeof(Image))

	if var_100_2 then
		table.insert(var_100_1, var_100_2.gameObject)
	end

	for iter_100_0 = 1, arg_100_3 - 1 do
		local var_100_3 = arg_100_4:GetChild(iter_100_0 - 1)

		table.insert(var_100_1, var_100_3.gameObject)
	end

	for iter_100_1, iter_100_2 in ipairs(var_100_0) do
		if iter_100_2.gameObject.name == "temp_mask" then
			iter_100_2.material = arg_100_0.maskMaterial
		elseif iter_100_2.gameObject.name == "face" then
			iter_100_2.material = arg_100_0.glitchArtMaterial
		elseif table.contains(var_100_1, iter_100_2.gameObject) then
			iter_100_2.material = arg_100_0.glitchArtMaterialForPaintingBg
		else
			iter_100_2.material = arg_100_0.glitchArtMaterialForPainting
		end
	end
end

function var_0_0.AddGlitchArtEffectForPating(arg_101_0, arg_101_1, arg_101_2, arg_101_3)
	local var_101_0 = arg_101_3:ShouldAddGlitchArtEffect()
	local var_101_1 = arg_101_3:IsNoHeadPainting()

	if var_101_0 and arg_101_3:GetExPression() ~= nil and not var_101_1 then
		local var_101_2 = arg_101_2:Find("face")

		cloneTplTo(var_101_2, var_101_2.parent, "temp_mask"):SetAsFirstSibling()

		local var_101_3 = arg_101_2:Find("layers")
		local var_101_4 = IsNil(var_101_3)

		if not var_101_4 and arg_101_3:GetPaintingRwIndex() > 0 then
			var_0_11(arg_101_0, arg_101_1, arg_101_2, arg_101_3:GetPaintingRwIndex(), var_101_3)
		else
			var_0_10(arg_101_0, arg_101_1, arg_101_2, arg_101_3, var_101_4)
		end
	elseif var_101_0 then
		local var_101_5 = arg_101_1:GetComponentsInChildren(typeof(Image)):ToTable()

		for iter_101_0, iter_101_1 in ipairs(var_101_5) do
			iter_101_1.material = arg_101_0.glitchArtMaterial
		end
	end

	if var_101_0 then
		local var_101_6 = GameObject.Find("/OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)/items/SpriteMask")

		if var_101_6 and var_101_6.activeInHierarchy then
			setActive(var_101_6, false)

			arg_101_0.spriteMask = var_101_6
		end
	end
end

function var_0_0.UpdateContent(arg_102_0, arg_102_1, arg_102_2)
	local function var_102_0()
		setActive(arg_102_0.nextTr, true)
		arg_102_2()
	end

	setActive(arg_102_0.dialoguePanel, not arg_102_1:ShouldHideDialogue())

	for iter_102_0, iter_102_1 in ipairs(arg_102_0.tags) do
		setActive(iter_102_1, iter_102_0 == arg_102_1:GetTag())
	end

	arg_102_0.conentTxt.fontSize = arg_102_1:GetFontSize() or arg_102_0.defualtFontSize

	local var_102_1 = arg_102_1:GetContent()

	arg_102_0.conentTxt.text = var_102_1
	arg_102_0.conentTxt.color = Color.NewHex(arg_102_1:GetContentColor())

	local var_102_2 = 999

	if var_102_1 and var_102_1 ~= "" then
		var_102_2 = System.String.New(var_102_1).Length
	end

	if var_102_1 and var_102_1 ~= "" and var_102_1 ~= "…" and #var_102_1 > 1 and var_102_2 > 1 then
		arg_102_0:UpdateTypeWriter(arg_102_1, var_102_0)
	else
		var_102_0()
	end

	local var_102_3 = false
	local var_102_4, var_102_5, var_102_6, var_102_7 = arg_102_0:GetSideTF(arg_102_1:GetSide())

	if var_102_5 then
		local var_102_8 = arg_102_1:GetNameWithColor()
		local var_102_9 = var_102_8 and var_102_8 ~= ""

		var_102_3 = var_102_9

		setActive(var_102_5, var_102_9)

		if var_102_9 then
			local var_102_10 = arg_102_1:GetNameColorCode()

			var_102_5:Find("Text"):GetComponent(typeof(Outline)).effectColor = Color.NewHex(var_102_10)
		end

		var_102_6.text = var_102_8

		setText(var_102_6.gameObject.transform:Find("subText"), arg_102_1:GetSubActorName())
	end

	if arg_102_0.script:IsDialogueStyle2() then
		setActive(arg_102_0.tag4Dialog2, not var_102_3)
	end
end

function var_0_0.SetContentBgAlpha(arg_104_0, arg_104_1)
	if arg_104_0.contentBgAlpha ~= arg_104_1 then
		for iter_104_0, iter_104_1 in ipairs(arg_104_0.contentBgs) do
			GetOrAddComponent(iter_104_1, typeof(CanvasGroup)).alpha = arg_104_1
		end

		arg_104_0.contentBgAlpha = arg_104_1
	end
end

function var_0_0.GetSideTF(arg_105_0, arg_105_1)
	local var_105_0
	local var_105_1
	local var_105_2
	local var_105_3

	if DialogueStep.SIDE_LEFT == arg_105_1 then
		var_105_0, var_105_1, var_105_2, var_105_3 = arg_105_0.actorLeft, arg_105_0.nameTr, arg_105_0.nameTxt, arg_105_0.subActorLeft
	elseif DialogueStep.SIDE_RIGHT == arg_105_1 then
		var_105_0, var_105_1, var_105_2, var_105_3 = arg_105_0.actorRgiht, arg_105_0.nameTr, arg_105_0.nameTxt, arg_105_0.subActorRgiht
	elseif DialogueStep.SIDE_MIDDLE == arg_105_1 then
		var_105_0, var_105_1, var_105_2, var_105_3 = arg_105_0.actorMiddle, arg_105_0.nameTr, arg_105_0.nameTxt, arg_105_0.subActorMiddle
	end

	return var_105_0, var_105_1, var_105_2, var_105_3
end

function var_0_0.RecyclesSubPantings(arg_106_0, arg_106_1)
	arg_106_1:each(function(arg_107_0, arg_107_1)
		arg_106_0:RecyclePainting(arg_107_1)
	end)
end

local function var_0_12(arg_108_0)
	if arg_108_0:Find("fitter").childCount == 0 then
		return
	end

	local var_108_0 = arg_108_0:Find("fitter"):GetChild(0)

	if var_108_0 then
		local var_108_1 = findTF(var_108_0, "shadow")

		if var_108_1 then
			setActive(var_108_1, false)
		end

		local var_108_2 = arg_108_0:GetComponentsInChildren(typeof(Image)):ToTable()

		for iter_108_0, iter_108_1 in ipairs(var_108_2) do
			local var_108_3 = Color.white

			if iter_108_1.material ~= iter_108_1.defaultGraphicMaterial then
				iter_108_1.material = iter_108_1.defaultGraphicMaterial
			end

			iter_108_1.material:SetColor("_Color", var_108_3)
		end

		setGray(var_108_0, false, true)
		retPaintingPrefab(arg_108_0, var_108_0.name)

		local var_108_4 = var_108_0:Find("temp_mask")

		if var_108_4 then
			Destroy(var_108_4.gameObject)
		end
	end
end

function var_0_0.ClearMeshPainting(arg_109_0, arg_109_1)
	arg_109_0:ResetMeshPainting(arg_109_1)

	if arg_109_1:Find("fitter").childCount == 0 then
		return
	end

	local var_109_0 = arg_109_1:Find("fitter"):GetChild(0)

	if var_109_0 then
		retPaintingPrefab(arg_109_1, var_109_0.name)
	end
end

function var_0_0.ResetMeshPainting(arg_110_0, arg_110_1)
	if arg_110_1:Find("fitter").childCount == 0 then
		return
	end

	local var_110_0 = arg_110_1:Find("fitter"):GetChild(0)

	if var_110_0 then
		local var_110_1 = findTF(var_110_0, "shadow")

		if var_110_1 then
			setActive(var_110_1, false)
		end

		local var_110_2 = arg_110_1:GetComponentsInChildren(typeof(Image)):ToTable()

		for iter_110_0, iter_110_1 in ipairs(var_110_2) do
			local var_110_3 = Color.white

			if iter_110_1.material ~= iter_110_1.defaultGraphicMaterial then
				iter_110_1.material = iter_110_1.defaultGraphicMaterial

				iter_110_1.material:SetColor("_Color", var_110_3)
			else
				iter_110_1.material = nil
			end
		end

		setGray(var_110_0, false, true)

		local var_110_4 = var_110_0:Find("temp_mask")

		if var_110_4 then
			Destroy(var_110_4.gameObject)
		end
	end
end

local function var_0_13(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_0.live2dChars[arg_111_1]
	local var_111_1 = false

	if var_111_0 and var_111_0._go then
		local var_111_2 = var_111_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")

		ReflectionHelp.RefSetProperty(typeof("Live2D.Cubism.Rendering.CubismRenderController"), "SortingOrder", var_111_2, 0)
		var_111_0:Dispose()

		arg_111_0.live2dChars[arg_111_1] = nil
		var_111_1 = true
	end

	local var_111_3 = table.getCount(arg_111_0.live2dChars) <= 0

	if var_111_1 and var_111_3 then
		RemoveComponent(arg_111_0.front, "GraphicRaycaster")
		RemoveComponent(arg_111_0.front, "Canvas")
	end
end

local function var_0_14(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_0.spinePainings[arg_112_1]
	local var_112_1 = false

	if var_112_0 then
		var_112_0:Dispose()

		arg_112_0.spinePainings[arg_112_1] = nil
		var_112_1 = true
	end

	local var_112_2 = table.getCount(arg_112_0.spinePainings) <= 0

	if var_112_1 and var_112_2 then
		RemoveComponent(arg_112_0.front, "GraphicRaycaster")
		RemoveComponent(arg_112_0.front, "Canvas")
	end
end

function var_0_0.RecyclePainting(arg_113_0, arg_113_1)
	if type(arg_113_1) == "table" then
		local var_113_0 = _.map(arg_113_1, function(arg_114_0)
			return arg_113_0[arg_114_0]
		end)

		arg_113_0:RecyclePaintingList(var_113_0)
	else
		arg_113_0:ClearMeshPainting(arg_113_1)
		var_0_13(arg_113_0, arg_113_1)
		var_0_14(arg_113_0, arg_113_1)
	end
end

function var_0_0.RecyclePaintingList(arg_115_0, arg_115_1)
	for iter_115_0, iter_115_1 in ipairs(arg_115_1) do
		arg_115_0:ClearMeshPainting(iter_115_1)
		var_0_13(arg_115_0, iter_115_1)
		var_0_14(arg_115_0, iter_115_1)
	end
end

function var_0_0.Resume(arg_116_0)
	var_0_0.super.Resume(arg_116_0)

	if arg_116_0.typewriterSpeed ~= 0 then
		arg_116_0.typewriter:setSpeed(arg_116_0.typewriterSpeed)
	end
end

function var_0_0.Pause(arg_117_0)
	var_0_0.super.Pause(arg_117_0)

	if arg_117_0.typewriterSpeed ~= 0 then
		arg_117_0.typewriter:setSpeed(100000000)
	end
end

function var_0_0.OnClear(arg_118_0)
	if arg_118_0.spriteMask then
		setActive(arg_118_0.spriteMask, true)

		arg_118_0.spriteMask = nil
	end
end

function var_0_0.FadeOutPainting(arg_119_0, arg_119_1, arg_119_2, arg_119_3)
	local var_119_0 = arg_119_2:GetComponent(typeof(CanvasGroup))
	local var_119_1 = arg_119_1:GetFadeOutPaintingTime()

	if var_119_1 <= 0 then
		arg_119_3()

		return
	end

	local var_119_2 = arg_119_1:ShouldAddHeadMaskWhenFade()

	if var_119_2 then
		arg_119_0:AddHeadMask(arg_119_2)
	end

	arg_119_0:TweenValueForcanvasGroup(var_119_0, 1, 0, var_119_1, 0, function()
		if var_119_2 then
			arg_119_0:ClearHeadMask(arg_119_2)
		end

		arg_119_3()
	end)
end

function var_0_0.OnWillExit(arg_121_0, arg_121_1, arg_121_2, arg_121_3)
	if not arg_121_2 or not arg_121_2:IsDialogueMode() then
		arg_121_3()

		return
	end

	local var_121_0 = arg_121_0:GetRecycleActorList(arg_121_2, arg_121_1)
	local var_121_1

	if arg_121_2:ShouldMoveToSide() then
		var_121_1 = arg_121_0:GetSideTF(arg_121_1:GetSide())
	end

	local var_121_2 = {}

	for iter_121_0, iter_121_1 in pairs(var_121_0) do
		if (not var_121_1 or iter_121_1 ~= var_121_1) and iter_121_1:Find("fitter").childCount > 0 then
			table.insert(var_121_2, function(arg_122_0)
				arg_121_0:FadeOutPainting(arg_121_1, iter_121_1, arg_122_0)
			end)
		end
	end

	parallelAsync(var_121_2, arg_121_3)
end

function var_0_0.OnEnd(arg_123_0)
	if arg_123_0.conentTxt then
		arg_123_0.conentTxt.fontSize = arg_123_0.defualtFontSize
		arg_123_0.conentTxt.text = ""
	end

	if arg_123_0.nameTxt then
		arg_123_0.nameTxt.text = ""
	end

	arg_123_0:ClearGlitchArtForPortrait()
	arg_123_0:ClearCanMarkNode()

	local var_123_0 = {
		"actorLeft",
		"actorMiddle",
		"actorRgiht"
	}

	arg_123_0:RecyclePainting(var_123_0)

	for iter_123_0, iter_123_1 in ipairs({
		"actorLeft",
		"actorMiddle",
		"actorRgiht"
	}) do
		arg_123_0[iter_123_1]:GetComponent(typeof(CanvasGroup)).alpha = 1
	end
end

return var_0_0
