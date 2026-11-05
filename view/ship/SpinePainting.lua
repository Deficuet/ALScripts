local var_0_0 = class("SpinePainting")
local var_0_1 = require("Mgr/Pool/PoolUtil")

function var_0_0.GenerateData(arg_1_0)
	local var_1_0 = {
		SetData = function(arg_2_0, arg_2_1)
			arg_2_0.ship = arg_2_1.ship
			arg_2_0.parent = arg_2_1.parent
			arg_2_0.effectParent = arg_2_1.effectParent

			local var_2_0 = arg_2_0:GetShipSkinConfig()
			local var_2_1
			local var_2_2

			if arg_2_1.offset and #arg_2_1.offset >= 3 then
				var_2_1 = BuildVector3({
					arg_2_1.offset[1],
					arg_2_1.offset[2],
					arg_2_1.offset[3]
				})
			elseif var_2_0.spine_offset and #var_2_0.spine_offset >= 3 then
				var_2_1 = BuildVector3({
					var_2_0.spine_offset[1],
					var_2_0.spine_offset[2],
					var_2_0.spine_offset[3]
				})
			else
				var_2_1 = BuildVector3({
					0,
					0,
					0
				})
			end

			if arg_2_1.offset and #arg_2_1.offset >= 4 then
				var_2_2 = arg_2_1.offset[4]
			elseif var_2_0.spine_offset and #var_2_0.spine_offset >= 4 then
				var_2_2 = var_2_0.spine_offset[4]
			else
				var_2_2 = 1
			end

			arg_2_0.pos = arg_2_1.position + var_2_1
			arg_2_0.scale = Vector3(var_2_2, var_2_2, var_2_2)

			if #var_2_0.special_effects > 0 then
				arg_2_0.bgEffectName = var_2_0.special_effects[1]
				arg_2_0.bgEffectPos = arg_2_1.position + BuildVector3(var_2_0.special_effects[2])

				local var_2_3 = var_2_0.special_effects[3][1]

				arg_2_0.bgEffectScale = Vector3(var_2_3, var_2_3, var_2_3)
			end
		end,
		GetShipName = function(arg_3_0)
			return arg_3_0.ship:getPainting()
		end,
		GetShipSkinConfig = function(arg_4_0)
			return arg_4_0.ship:GetSkinConfig()
		end,
		GetShipId = function(arg_5_0)
			return arg_5_0.ship.id
		end,
		isEmpty = function(arg_6_0)
			return arg_6_0.ship == nil
		end,
		Clear = function(arg_7_0)
			arg_7_0.ship = nil
			arg_7_0.parent = nil
			arg_7_0.scale = nil
			arg_7_0.pos = nil
			arg_7_0.bgEffectName = nil
			arg_7_0.bgEffectPos = nil
			arg_7_0.bgEffectScale = nil
			arg_7_0.effectParent = nil
		end
	}

	var_1_0:SetData(arg_1_0)

	return var_1_0
end

function var_0_0.Ctor(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._spinePaintingData = arg_8_1
	arg_8_0._loadSpineDic = {}
	arg_8_0._loadUIDic = {}
	arg_8_0._initCallback = {}
	arg_8_0.loadSheets = {}
	arg_8_0._visible = true

	parallelAsync({
		function(arg_9_0)
			local var_9_0 = arg_8_0._spinePaintingData:GetShipName()

			PoolMgr.GetInstance():GetSpinePainting(var_9_0, true, function(arg_10_0)
				arg_8_0._loadSpineDic[var_9_0] = arg_10_0

				arg_8_0:init(arg_10_0)
				arg_8_0:SetVisible(false)
				arg_9_0()
			end)
		end,
		function(arg_11_0)
			local var_11_0 = arg_8_0._spinePaintingData.bgEffectName

			if var_11_0 ~= nil then
				PoolMgr.GetInstance():GetUI(var_11_0, true, function(arg_12_0)
					arg_8_0._loadUIDic[var_11_0] = arg_12_0

					arg_8_0:initBgEffect(arg_12_0)
					arg_11_0()
				end)
			else
				arg_11_0()
			end
		end
	}, function()
		setActive(arg_8_0._spinePaintingData.parent, true)
		setActive(arg_8_0._spinePaintingData.effectParent, true)

		arg_8_0._initFlag = true

		arg_8_0:updateLink()

		for iter_13_0, iter_13_1 in ipairs(arg_8_0._initCallback) do
			iter_13_1()
		end

		arg_8_0._initCallback = {}

		onNextTick(function()
			arg_8_0:SetVisible(true)

			if arg_8_2 then
				arg_8_2(arg_8_0)
			end
		end)
	end)
end

function var_0_0.init(arg_15_0, arg_15_1)
	arg_15_0._go = arg_15_1
	arg_15_0._tf = tf(arg_15_1)

	HotfixHelper.SetLayerRecursively(arg_15_0._go, LayerMask.NameToLayer("UI"))
	arg_15_0._tf:SetParent(arg_15_0._spinePaintingData.parent, true)

	arg_15_0._tf.localScale = arg_15_0._spinePaintingData.scale
	arg_15_0._tf.localPosition = arg_15_0._spinePaintingData.pos
	arg_15_0.spineAnimList = {}

	local var_15_0 = arg_15_0._tf:GetComponent(typeof(ItemList)).prefabItem:ToTable()

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		arg_15_0.spineAnimList[#arg_15_0.spineAnimList + 1] = GetOrAddComponent(iter_15_1, "SpineAnimUI")
	end

	local var_15_1 = #arg_15_0.spineAnimList

	assert(var_15_1 > 0, "动态立绘至少要保证有一个spine动画，请检查" .. arg_15_0._spinePaintingData:GetShipName())

	if var_15_1 == 1 then
		arg_15_0.mainSpineAnim = arg_15_0.spineAnimList[1]
	else
		arg_15_0.mainSpineAnim = arg_15_0.spineAnimList[#arg_15_0.spineAnimList]
	end

	arg_15_0._skeletonGraphic = arg_15_0.mainSpineAnim:GetComponent("SkeletonGraphic")

	function arg_15_0.updateLocal()
		arg_15_0:onUpdateLocal()
	end

	arg_15_0._skeletonGraphic.UpdateLocal = arg_15_0._skeletonGraphic.UpdateLocal + arg_15_0.updateLocal
	arg_15_0._baseMaterial = arg_15_0._skeletonGraphic.material
	arg_15_0._idleName = arg_15_0:getNormalIdleName()
	arg_15_0.shipDragData = SpinePaintingConst.ship_drag_datas[arg_15_0._spinePaintingData:GetShipName()]
	arg_15_0.dragShipFlag = false
	arg_15_0.lockLayer = false

	if arg_15_0.shipDragData then
		arg_15_0.dragShipFlag = arg_15_0.shipDragData.drag_data and arg_15_0.shipDragData.drag_data.type
		arg_15_0.lockLayer = arg_15_0.shipDragData.drag_data.lock_layer
		arg_15_0.replaceWord = arg_15_0.shipDragData.replace_word
		arg_15_0.dragDataConfigClient = arg_15_0.shipDragData.drag_data.config_client
	end

	arg_15_0.multipleFaceFlag = false

	if arg_15_0.shipDragData and arg_15_0.shipDragData.multiple_face and arg_15_0.shipDragData.multiple_face ~= "" then
		local var_15_2 = arg_15_0.shipDragData.multiple_face.name

		arg_15_0.multipleFaceFlag = table.contains(var_15_2, arg_15_0.mainSpineAnim.name)
		arg_15_0.multipleFaceData = arg_15_0.shipDragData.multiple_face.data
	end

	arg_15_0.shipEffectActionAble = SpinePaintingConst.ship_effect_action_able[arg_15_0._spinePaintingData:GetShipName()]
	arg_15_0._effectsTf = findTF(arg_15_0._tf, "effects")
	arg_15_0._effectShowFlag = true
	arg_15_0._dragPassFlag = true
	arg_15_0._lightTf = findTF(arg_15_0._tf, "light")

	if arg_15_0._lightTf then
		arg_15_0._lightAnimator = arg_15_0._lightTf:GetComponent(typeof(Animator))
		arg_15_0._lightAnimationName = arg_15_0._lightAnimator.runtimeAnimatorController.animationClips[0].name

		arg_15_0._lightAnimator:Play(arg_15_0._lightAnimationName, -1, SpinePaintingConst.painting_lit_value)
	end

	arg_15_0:playPaintingInitIdle()
	arg_15_0:playPaintingInitSkin()

	arg_15_0.slotDic = {}
	arg_15_0.stepSlotAlpha = {}
	arg_15_0._slotAlphaTimer = Timer.New(function()
		arg_15_0:updateSlotAlpha()
		arg_15_0:updateLight()
	end, 0.016666666666666666, -1)

	arg_15_0._slotAlphaTimer:Start()
end

function var_0_0.initBgEffect(arg_18_0, arg_18_1)
	arg_18_0._bgEffectGo = arg_18_1
	arg_18_0._bgEffectTf = tf(arg_18_1)

	HotfixHelper.SetLayerRecursively(arg_18_0._bgEffectGo, LayerMask.NameToLayer("UI"))
	arg_18_0._bgEffectTf:SetParent(arg_18_0._spinePaintingData.effectParent, true)

	arg_18_0._bgEffectTf.localScale = arg_18_0._spinePaintingData.bgEffectScale
	arg_18_0._bgEffectTf.localPosition = arg_18_0._spinePaintingData.bgEffectPos
end

function var_0_0.getInitFlag(arg_19_0)
	return arg_19_0._initFlag
end

function var_0_0.getNormalIdleName(arg_20_0)
	if HXSet.isHx() and arg_20_0.shipDragData and arg_20_0.shipDragData.hx_idle then
		return arg_20_0.shipDragData.hx_idle
	end

	return "normal"
end

function var_0_0.updateLink(arg_21_0)
	arg_21_0.slotOverride = {}

	local var_21_0 = arg_21_0._spinePaintingData.ship:getSkinId()
	local var_21_1 = ChangeSkinLink.CHANGE_SKIN_LINK_DATA[var_21_0]

	if var_21_1 then
		local var_21_2 = var_21_1.link_id
		local var_21_3 = var_21_1.relations

		if var_21_1.link_type == ChangeSkinLink.L2D_TYPE then
			local var_21_4

			if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 then
				var_21_4 = ChangeSkinLink.GetSaveL2dData(arg_21_0._spinePaintingData.ship.id, var_21_2)
			else
				var_21_4 = ChangeSkinLink.L2D_PARAMETER_DIC[arg_21_0._spinePaintingData.ship.id]
			end

			var_21_4 = var_21_4 or {}

			for iter_21_0, iter_21_1 in ipairs(var_21_3) do
				local var_21_5 = iter_21_1.type

				if var_21_5 == ChangeSkinLink.change_parameter_link_slot then
					local var_21_6 = true
					local var_21_7 = iter_21_1.link_parameter
					local var_21_8 = iter_21_1.slot_list

					for iter_21_2, iter_21_3 in ipairs(var_21_7) do
						local var_21_9 = iter_21_3.name
						local var_21_10 = iter_21_3.num

						if (var_21_4[var_21_9] and var_21_4[var_21_9] or 0) ~= var_21_10 then
							var_21_6 = false
						end
					end

					if var_21_6 then
						for iter_21_4, iter_21_5 in ipairs(var_21_8) do
							table.insert(arg_21_0.slotOverride, iter_21_5)
						end
					end
				elseif var_21_5 == ChangeSkinLink.change_parameter_link_skin then
					local var_21_11 = true
					local var_21_12 = iter_21_1.link_parameter
					local var_21_13 = iter_21_1.skeleton_skin

					for iter_21_6, iter_21_7 in ipairs(var_21_12) do
						local var_21_14 = iter_21_7.name
						local var_21_15 = iter_21_7.num

						if (var_21_4[var_21_14] and var_21_4[var_21_14] or 0) ~= var_21_15 then
							var_21_11 = false
						end
					end

					if var_21_11 then
						arg_21_0:SetSkeletonSkin(var_21_13)
					end
				end
			end
		end
	end
end

function var_0_0.setL2dSlot(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0._skeletonGraphic.Skeleton:SetAttachment(arg_22_1, arg_22_2)
end

function var_0_0.onUpdateLocal(arg_23_0)
	if arg_23_0.slotOverride then
		for iter_23_0, iter_23_1 in ipairs(arg_23_0.slotOverride) do
			arg_23_0:setL2dSlot(iter_23_1[1], iter_23_1[2])
		end
	end
end

function var_0_0.UpdateGraphic(arg_24_0)
	if arg_24_0._isDisposed then
		return
	end

	arg_24_0._skeletonGraphic:UpdateMesh()
	Canvas.ForceUpdateCanvases()
end

function var_0_0.SetVisible(arg_25_0, arg_25_1)
	if arg_25_1 then
		arg_25_0._tf.localPosition = arg_25_0._spinePaintingData.pos
	else
		arg_25_0._tf.localPosition = Vector2(100000, 0)
	end

	if not arg_25_1 and arg_25_0.dragDataConfigClient then
		local var_25_0 = arg_25_0:getIdleName()

		for iter_25_0, iter_25_1 in ipairs(arg_25_0.dragDataConfigClient) do
			if iter_25_1.idle == var_25_0 and iter_25_1.lit_start and iter_25_1.lit_start >= 0 then
				SpinePaintingConst.painting_lit_value = iter_25_1.lit_start

				if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 then
					SpinePaintingDrag.SetPaintingLite(arg_25_0._spinePaintingData:GetShipName(), arg_25_0._spinePaintingData:GetShipId(), SpinePaintingConst.painting_lit_value)
				else
					SpinePaintingDrag.SetPaintingLite(arg_25_0._spinePaintingData:GetShipName(), arg_25_0._spinePaintingData:GetShipId(), 0)
				end
			end
		end
	end

	SpinePaintingConst.spine_painting_action = false

	if arg_25_1 then
		arg_25_0._slotAlphaTimer:Start()
	else
		arg_25_0._slotAlphaTimer:Stop()
	end

	arg_25_0._visible = arg_25_1

	local function var_25_1()
		if arg_25_0._isDisposed then
			return
		end

		if arg_25_0._lightTf then
			setActive(arg_25_0._lightTf, arg_25_0._visible)
		end

		if arg_25_0._spinePaintingData.effectParent then
			setActive(arg_25_0._spinePaintingData.effectParent, arg_25_0._visible)
		end

		pg.ViewUtils.SetLayer(arg_25_0._tf, arg_25_0._visible and Layer.UI or Layer.UIHidden)
		setActiveViaLayer(arg_25_0._spinePaintingData.effectParent, arg_25_0._visible)

		arg_25_0._lightValue = nil
		arg_25_0._effectShowFlag = true
		arg_25_0._dragPassFlag = true

		if arg_25_0._skeletonGraphic then
			arg_25_0._skeletonGraphic.timeScale = arg_25_0._visible and 1 or 0
		end

		if not arg_25_0._visible then
			arg_25_0.mainSpineAnim:SetActionCallBack(nil)
			arg_25_0:changeInAction(false)

			arg_25_0.clickActionList = {}

			if LeanTween.isTweening(go(arg_25_0._tf)) then
				LeanTween.cancel(go(arg_25_0._tf))
			end

			if arg_25_0._baseShader then
				if arg_25_0._skeletonGraphic then
					arg_25_0._skeletonGraphic.material.shader = arg_25_0._baseShader
				end

				arg_25_0._baseShader = nil
			end

			arg_25_0._displayWord = false
		else
			arg_25_0._skeletonGraphic:Update(Time.deltaTime)
		end

		arg_25_0:playPaintingInitIdle()
		arg_25_0:playPaintingInitSkin()
		arg_25_0:updateLink()

		if not arg_25_1 then
			arg_25_0:unloadCueSheet()
			pg.CriMgr.GetInstance():DisposePaintingBgm()
		end
	end

	onNextTick(var_25_1)
end

function var_0_0.playPaintingInitIdle(arg_27_0)
	local var_27_0 = SpinePaintingDrag.GetPaintingInitIdle(arg_27_0.mainSpineAnim.name, arg_27_0._spinePaintingData.ship.id)
	local var_27_1 = arg_27_0:getNormalIdleName()

	if var_27_0 then
		local var_27_2 = PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1)

		if var_27_2 == 1 and arg_27_0._idleName ~= var_27_0 then
			var_27_1 = var_27_0
		elseif var_27_2 ~= 1 and arg_27_0._idleName ~= arg_27_0:getNormalIdleName() then
			var_27_1 = arg_27_0:getNormalIdleName()
		end
	else
		var_27_1 = arg_27_0:getNormalIdleName()
	end

	if var_27_1 then
		arg_27_0:setIdleName(var_27_1)
		arg_27_0:SetActionWithFinishCallback(arg_27_0._idleName, 0, nil, true, nil)
		arg_27_0:changeInAction(false)
	end
end

function var_0_0.changeInAction(arg_28_0, arg_28_1)
	arg_28_0.inAction = arg_28_1
	SpinePaintingConst.spine_painting_action = arg_28_1

	if SpinePaintingConst.painting_lit_action_callback then
		SpinePaintingConst.painting_lit_action_callback(arg_28_1)
	end
end

function var_0_0.playPaintingInitSkin(arg_29_0)
	local var_29_0 = SpinePaintingDrag.GetPaintingInitSkin(arg_29_0.mainSpineAnim.name, arg_29_0._spinePaintingData.ship.id)
	local var_29_1 = arg_29_0:GetDefaultSkeletonSkin()

	if var_29_0 then
		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_29_0:GetDefaultSkeletonSkin() ~= var_29_0 then
			var_29_1 = var_29_0
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_29_0._skeletonSkin ~= arg_29_0:GetDefaultSkeletonSkin() then
			var_29_1 = arg_29_0:GetDefaultSkeletonSkin()
		end
	else
		var_29_1 = arg_29_0:GetDefaultSkeletonSkin()
	end

	if var_29_1 then
		if arg_29_0._skeletonGraphic and arg_29_0._skeletonGraphic.SkeletonData then
			if arg_29_0._skeletonGraphic.SkeletonData:FindSkin(var_29_1) ~= nil then
				arg_29_0:SetSkeletonSkin(var_29_1)
			elseif arg_29_0._skeletonGraphic.SkeletonData:FindSkin("default") ~= nil then
				arg_29_0:SetSkeletonSkin("default")
			end
		end
	else
		arg_29_0:SetDefaultSkeletonSkin()
	end
end

function var_0_0.getIdleName(arg_30_0)
	return arg_30_0._idleName
end

function var_0_0.setIdleName(arg_31_0, arg_31_1)
	arg_31_0._idleName = arg_31_1

	arg_31_0:updateHitArea()
end

function var_0_0.getReplaceWord(arg_32_0)
	if arg_32_0.replaceWord and table.contains(arg_32_0.replaceWord, arg_32_0._idleName) then
		return true
	end

	return false
end

function var_0_0.updateHitArea(arg_33_0)
	if arg_33_0.dragShipFlag then
		local var_33_0 = arg_33_0.shipDragData.drag_data.type
		local var_33_1 = arg_33_0.shipDragData.drag_data.config_client

		if var_33_0 == SpinePaintingConst.drag_type_normal then
			for iter_33_0 = 1, #var_33_1 do
				local var_33_2 = var_33_1[iter_33_0]
				local var_33_3 = var_33_2.hit
				local var_33_4 = var_33_2.active

				if var_33_3 and not var_33_4 then
					local var_33_5 = findTF(arg_33_0._tf, "hitArea/" .. var_33_3)

					if var_33_5 then
						local var_33_6 = true
						local var_33_7 = true

						if var_33_2.idle and type(var_33_2.idle) == "string" then
							var_33_6 = var_33_2.idle == arg_33_0._idleName
						elseif var_33_2.idle and type(var_33_2.idle) == "table" then
							var_33_6 = table.contains(var_33_2.idle, arg_33_0._idleName)
						end

						if var_33_2.skin and type(var_33_2.skin) == "string" then
							var_33_7 = var_33_2.skin == arg_33_0._skeletonSkin
						elseif var_33_2.skin and type(var_33_2.skin) == "table" then
							var_33_7 = table.contains(var_33_2.skin, arg_33_0._skeletonSkin)
						end

						setActive(var_33_5, var_33_6 and var_33_7)
					else
						print("hit area " .. var_33_3 .. "is not exist")
					end
				end
			end
		end
	end
end

function var_0_0.checkListAction(arg_34_0)
	if #arg_34_0.clickActionList > 0 then
		local var_34_0 = table.remove(arg_34_0.clickActionList, 1)

		arg_34_0:SetActionWithFinishCallback(var_34_0, 0, function()
			arg_34_0:checkListAction()
		end, true)
	else
		arg_34_0:SetAction(arg_34_0:getNormalIdleName(), 0, true)
		arg_34_0:changeInAction(false)
	end
end

function var_0_0.displayWord(arg_36_0, arg_36_1)
	arg_36_0._displayWord = arg_36_1
end

function var_0_0.readyDragAction(arg_37_0, arg_37_1, arg_37_2)
	if arg_37_0.inAction or arg_37_0._displayWord then
		return false
	end

	if arg_37_0.dragShipFlag then
		return arg_37_0:startDragAction(arg_37_1, arg_37_2)
	end

	return false
end

function var_0_0.SetSkeletonSkin(arg_38_0, arg_38_1)
	arg_38_0._skeletonSkin = arg_38_1

	arg_38_0:SetSkin(arg_38_1)
	arg_38_0:updateSkeletonGraphicTime()
	arg_38_0:updateHitArea()
end

function var_0_0.SetDefaultSkeletonSkin(arg_39_0)
	arg_39_0:SetSkeletonSkin(arg_39_0:GetDefaultSkeletonSkin())
end

function var_0_0.GetDefaultSkeletonSkin(arg_40_0)
	local var_40_0 = arg_40_0._spinePaintingData:GetShipSkinConfig().skeleton_default_skin

	if not var_40_0 or var_40_0 == "" then
		var_40_0 = arg_40_0._skeletonGraphic.SkeletonData:FindSkin("1") and "1" or "default"
	end

	return var_40_0
end

function var_0_0.startDragAction(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = arg_41_0.shipDragData.drag_data
	local var_41_1 = var_41_0.type

	if var_41_1 == SpinePaintingConst.drag_type_normal then
		return arg_41_0:changePaintingNormal(var_41_0, arg_41_1, arg_41_2)
	elseif var_41_1 == SpinePaintingConst.drag_type_list then
		arg_41_0.clickActionList = Clone(var_41_0.config_client)

		return arg_41_0:checkListAction()
	end

	return false
end

function var_0_0.GetDragDataConfig(arg_42_0, arg_42_1)
	if arg_42_0.shipDragData then
		return arg_42_0.shipDragData[arg_42_1]
	end

	return nil
end

function var_0_0.setEventTriggerCallback(arg_43_0, arg_43_1)
	arg_43_0._eventTriggerCall = arg_43_1
end

function var_0_0.changePaintingNormal(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0 = arg_44_1.config_client
	local var_44_1 = arg_44_1.type

	for iter_44_0, iter_44_1 in ipairs(var_44_0) do
		if arg_44_0:matchDragFlag(arg_44_2, iter_44_1, arg_44_3) then
			return arg_44_0:doDragAction(var_44_1, arg_44_1, iter_44_1, arg_44_3)
		end
	end

	return false
end

function var_0_0.doDragAction(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4)
	local var_45_0 = arg_45_3.fold
	local var_45_1 = arg_45_3.fold_chat and arg_45_3.fold_chat or nil
	local var_45_2 = arg_45_3.effect_hide
	local var_45_3 = arg_45_3.action_cv
	local var_45_4 = arg_45_3.finish_cv
	local var_45_5 = arg_45_3.alpha_data and arg_45_3.alpha_data or nil
	local var_45_6 = arg_45_3.skin_change and arg_45_3.skin_change or nil
	local var_45_7 = arg_45_3.clear_track and arg_45_3.clear_track or nil
	local var_45_8 = arg_45_3.idle and arg_45_3.idle or nil
	local var_45_9 = arg_45_3.change_idle
	local var_45_10 = arg_45_3.action
	local var_45_11 = arg_45_3.event
	local var_45_12 = var_45_6
	local var_45_13
	local var_45_14
	local var_45_15

	if type(var_45_9) == "table" and type(var_45_10) == "table" then
		local var_45_16 = math.random(1, #var_45_10)

		var_45_13 = var_45_10[var_45_16]
		var_45_15 = var_45_9[var_45_16]
	elseif type(var_45_8) == "table" and type(var_45_10) == "table" then
		local var_45_17 = table.indexof(var_45_8, arg_45_0:getIdleName())

		var_45_13 = var_45_10[var_45_17]

		if type(var_45_9) == "table" then
			var_45_15 = var_45_9[var_45_17]
		end
	end

	if not var_45_13 then
		if type(var_45_10) == "string" then
			var_45_13 = var_45_10
		elseif type(var_45_10) == "table" then
			var_45_13 = var_45_10[math.random(1, #var_45_10)]
		end
	end

	if not var_45_15 then
		if type(var_45_9) == "string" then
			var_45_15 = var_45_9
		elseif type(var_45_9) == "table" then
			var_45_15 = var_45_9[math.random(1, #var_45_9)]
		end
	end

	if not var_45_14 then
		if type(var_45_11) == "string" then
			var_45_14 = var_45_11
		elseif type(var_45_11) == "table" then
			var_45_14 = var_45_11[math.random(1, #var_45_11)]
		end
	end

	if arg_45_1 == SpinePaintingConst.drag_type_normal then
		if var_45_5 and #var_45_5 > 0 then
			arg_45_0:SetAlphaData(var_45_5)
		end

		local var_45_18 = arg_45_3.material and arg_45_3.material or nil
		local var_45_19 = arg_45_3.material_time and arg_45_3.material_time or nil

		if var_45_18 then
			if LeanTween.isTweening(go(arg_45_0._tf)) then
				return false
			end

			arg_45_0:getSpineMaterial(var_45_18, function(arg_46_0)
				arg_45_0._skeletonGraphic.material = arg_46_0

				if var_45_19 then
					LeanTween.delayedCall(go(arg_45_0._tf), var_45_19, System.Action(function()
						arg_45_0._skeletonGraphic.material = arg_45_0._baseMaterial

						arg_45_0:changePaintingIdle(var_45_15)
					end))
				end
			end)
		end

		if var_45_7 and #var_45_7 > 0 then
			for iter_45_0, iter_45_1 in ipairs(var_45_7) do
				arg_45_0:SetEmptyAction(iter_45_1)
			end
		end

		if var_45_13 and var_45_13 ~= "" and arg_45_0:checkActionPlayAble(var_45_13, false, 0) then
			print("播放动作 .." .. var_45_13 .. "下一个待机动作 .. " .. var_45_15)

			if var_45_0 then
				pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, {
					flag = true,
					content = {
						chat = var_45_1
					}
				})
			end

			arg_45_0:setEffectVisible(var_45_2, false)
			arg_45_0:SetActionWithFinishCallback(var_45_13, 0, function()
				if var_45_12 and var_45_12 ~= "" then
					arg_45_0:changeSkeletonSkin(var_45_12)
				end

				if var_45_0 then
					pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, {
						flag = false,
						content = {
							chat = var_45_1
						}
					})
				end

				arg_45_0:changePaintingIdle(var_45_15 and var_45_15 or arg_45_0:getIdleName())
				arg_45_0:setEffectVisible(var_45_2, true)

				if var_45_4 and var_45_4 ~= "" then
					arg_45_0:PlayCv(var_45_4)
				end
			end, false, function()
				if var_45_3 and var_45_3 ~= "" then
					arg_45_0:PlayCv(var_45_3)
				end

				if var_45_14 and type(var_45_14) == "string" and arg_45_0._eventTriggerCall then
					arg_45_0._eventTriggerCall(var_45_14)
				end
			end)
		end

		if not var_45_13 or var_45_13 == "" then
			if var_45_12 and var_45_12 ~= "" then
				arg_45_0:changeSkeletonSkin(var_45_12)
			end

			if var_45_15 and var_45_15 ~= "" then
				arg_45_0:changePaintingIdle(var_45_15)
			end

			if var_45_14 and type(var_45_14) == "string" and arg_45_0._eventTriggerCall then
				arg_45_0._eventTriggerCall(var_45_14)
			end

			return false
		end
	end

	return true
end

function var_0_0.SetAlphaData(arg_50_0, arg_50_1)
	for iter_50_0, iter_50_1 in ipairs(arg_50_1) do
		local var_50_0 = iter_50_1[1]
		local var_50_1 = iter_50_1[2]
		local var_50_2 = iter_50_1[3]
		local var_50_3 = arg_50_0:getSlotAlpha(var_50_0)

		if not arg_50_0:getStepSlotAlpha(var_50_0) and var_50_3 then
			local var_50_4
			local var_50_5

			for iter_50_2, iter_50_3 in ipairs(var_50_1) do
				if math.abs(var_50_3 - iter_50_3) <= 0.1 then
					var_50_5 = iter_50_2 + 1
				end

				if var_50_5 == iter_50_2 then
					var_50_4 = iter_50_3
				end
			end

			var_50_4 = var_50_4 or var_50_1[1]

			if var_50_4 then
				arg_50_0:setStepSlotAlpha(var_50_0, var_50_4, var_50_2)
			end
		end
	end
end

function var_0_0.PlayCv(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_0._spinePaintingData.ship:getSkinId()
	local var_51_1 = pg.CriMgr.GetCVBankName(ShipWordHelper.RawGetCVKey(var_51_0))
	local var_51_2 = pg.ship_skin_template[var_51_0].group_index
	local var_51_3 = arg_51_1 .. "_" .. var_51_2

	print("try playing cv" .. var_51_1 .. ":" .. var_51_3)
	pg.CriMgr.GetInstance():playCueSheetVoice(var_51_1, var_51_3, true, function(arg_52_0)
		if arg_52_0 then
			print("播放的语音长度为 = " .. arg_52_0:GetLength())
		end
	end)
end

function var_0_0.changeSkeletonSkin(arg_53_0, arg_53_1)
	if arg_53_0._skeletonSkin == arg_53_1 then
		arg_53_0:SetDefaultSkeletonSkin()
	else
		arg_53_0:SetSkeletonSkin(arg_53_1)
	end

	SpinePaintingDrag.SetPaintingInitSkin(arg_53_0.mainSpineAnim.name, arg_53_0._spinePaintingData.ship.id, arg_53_0._skeletonSkin)
end

function var_0_0.setEffectVisible(arg_54_0, arg_54_1, arg_54_2)
	if not arg_54_1 or #arg_54_1 == 0 then
		return
	end

	for iter_54_0 = 1, #arg_54_1 do
		local var_54_0 = findTF(arg_54_0._tf, arg_54_1[iter_54_0])

		if var_54_0 then
			setActive(var_54_0, arg_54_2)
		end
	end
end

function var_0_0.matchDragFlag(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	local var_55_0 = arg_55_2.hit

	if var_55_0 and var_55_0 ~= arg_55_1 then
		return false
	end

	local var_55_1 = arg_55_2.skin

	if var_55_1 and var_55_1 ~= "" and arg_55_0._skeletonSkin ~= var_55_1 then
		return false
	end

	local var_55_2 = arg_55_2.idle

	if var_55_2 and type(var_55_2) == "string" and arg_55_0:getIdleName() ~= var_55_2 then
		return false
	elseif var_55_2 and type(var_55_2) == "table" and not table.contains(var_55_2, arg_55_0:getIdleName()) then
		return false
	end

	local var_55_3 = arg_55_2.favor

	if var_55_3 and var_55_3 >= 0 then
		local var_55_4 = arg_55_0._spinePaintingData.ship:getCVIntimacy()

		if var_55_4 and var_55_4 < var_55_3 then
			return false
		end
	end

	if arg_55_2.click and arg_55_2.click == tobool(arg_55_3) then
		return false
	end

	return true
end

function var_0_0.OnDragMove(arg_56_0, arg_56_1, arg_56_2)
	return
end

function var_0_0.getSpineMaterial(arg_57_0, arg_57_1, arg_57_2)
	if not arg_57_0._materialDic then
		arg_57_0._materialDic = {}
	end

	if arg_57_0._materialDic[arg_57_1] then
		arg_57_2(arg_57_0._materialDic[arg_57_1])
	else
		arg_57_0._materialDic[arg_57_1] = LoadAny("spinematerials", arg_57_1, typeof(Material))

		arg_57_2(arg_57_0._materialDic[arg_57_1])
	end
end

function var_0_0.changePaintingIdle(arg_58_0, arg_58_1)
	arg_58_0:setIdleName(arg_58_1)
	arg_58_0:SetAction(arg_58_1, 0, true)
	SpinePaintingDrag.SetPaintingInitIdle(arg_58_0.mainSpineAnim.name, arg_58_0._spinePaintingData.ship.id, arg_58_1)
	arg_58_0:changeInAction(false)
end

function var_0_0.SetShopHx(arg_59_0, arg_59_1)
	if arg_59_1 and HXSet.isHx() then
		if arg_59_0:getAnimationExist("shop_hx", arg_59_0._skeletonGraphic) then
			arg_59_0:setIdleName("shop_hx")
			arg_59_0:SetAction(arg_59_0._idleName, 0, true)

			local var_59_0 = arg_59_0._tf.anchoredPosition

			arg_59_0._tf.localPosition = Vector2(100000, 0)

			arg_59_0:updateSkeletonGraphicTime()
			onDelayTick(function()
				arg_59_0._tf.localPosition = arg_59_0._spinePaintingData.pos
			end, 0.05)
		end
	else
		arg_59_0:setIdleName(arg_59_0:getNormalIdleName())
		arg_59_0:SetAction(arg_59_0._idleName, 0, true)
	end
end

function var_0_0.SetAction(arg_61_0, arg_61_1, arg_61_2, arg_61_3)
	if not arg_61_0:checkActionPlayAble(arg_61_1, arg_61_3, arg_61_2) then
		return false
	end

	if arg_61_2 and arg_61_2 == 0 then
		arg_61_0.lastPlayAction = arg_61_1
	end

	if arg_61_2 == 0 and arg_61_1 ~= arg_61_0:getIdleName() then
		arg_61_0:changeInAction(true)
	end

	if arg_61_0.multipleFaceFlag and not arg_61_0.inAction then
		arg_61_1 = arg_61_0:getMultipFaceAction(arg_61_1)
	end

	local var_61_0 = arg_61_0._spinePaintingData.ship:getSkinId()
	local var_61_1 = pg.ship_skin_template[var_61_0].voice_lang

	if arg_61_2 == 0 and var_61_1 and #var_61_1 > 0 then
		local var_61_2 = ShipWordHelper.GetLanguageSetting(var_61_0)

		if var_61_2 <= 0 then
			var_61_2 = 1
		end

		local var_61_3 = var_61_1[var_61_2]
		local var_61_4 = arg_61_0:GetVoiceLandAction(arg_61_1, var_61_3)

		if arg_61_0:getAnimationExist(var_61_4, arg_61_0._skeletonGraphic) then
			arg_61_1 = var_61_4
		end
	end

	arg_61_0:updateEffectVisible(arg_61_1)

	if HXSet.isHx() and arg_61_0:getAnimationExist(arg_61_1 .. "_hx") then
		arg_61_1 = arg_61_1 .. "_hx"
	elseif HXSet.isHx() and arg_61_0:getAnimationExist("hx/" .. arg_61_1 .. "_hx") then
		arg_61_1 = "hx/" .. arg_61_1 .. "_hx"
	end

	for iter_61_0, iter_61_1 in ipairs(arg_61_0.spineAnimList) do
		local var_61_5 = iter_61_1:GetComponent("SkeletonGraphic")

		if arg_61_0:getAnimationExist(arg_61_1, var_61_5) then
			iter_61_1:SetAction(arg_61_1, arg_61_2)
		end

		if iter_61_1:GetAnimationState() then
			GetComponent(iter_61_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end

	return true
end

function var_0_0.GetVoiceLandAction(arg_62_0, arg_62_1, arg_62_2)
	local var_62_0 = ""

	if arg_62_2 == ShipSkin.VOICE_LANG_JP then
		var_62_0 = "_jp"
	elseif arg_62_2 == ShipSkin.VOICE_LANG_CN then
		var_62_0 = "_cn"
	end

	return arg_62_1 .. var_62_0
end

function var_0_0.checkActionPlayAble(arg_63_0, arg_63_1, arg_63_2, arg_63_3)
	if arg_63_3 and arg_63_3 == 0 and arg_63_0.inAction and not arg_63_2 then
		return false
	end

	if arg_63_0.lockLayer and not arg_63_2 and arg_63_0.inAction and arg_63_3 and arg_63_3 > 0 then
		return false
	end

	if arg_63_0.lastPlayAction and arg_63_0.lastPlayAction ~= arg_63_0._idleName and arg_63_3 and arg_63_3 > 0 then
		return false
	end

	if arg_63_0._idleName ~= arg_63_0:getNormalIdleName() and arg_63_1 == "login" then
		return false
	end

	if not arg_63_0._dragPassFlag then
		return false
	end

	if arg_63_0.dragShipFlag and arg_63_0.shipDragData.action_enable then
		local var_63_0 = arg_63_0.shipDragData.action_enable

		for iter_63_0 = 1, #var_63_0 do
			local var_63_1 = var_63_0[iter_63_0]

			if var_63_1.name == arg_63_0._idleName and table.contains(var_63_1.ignore, arg_63_1) then
				return false
			end
		end
	end

	return true
end

function var_0_0.ClearAction(arg_64_0)
	arg_64_0:changeInAction(false)
end

function var_0_0.getSlotAlpha(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_0._skeletonGraphic.Skeleton:FindSlot(arg_65_1)

	if var_65_0 then
		return ReflectionHelp.RefGetProperty(typeof("Spine.Slot"), "A", var_65_0)
	end

	return nil
end

function var_0_0.setSlotAlpha(arg_66_0, arg_66_1, arg_66_2)
	ReflectionHelp.RefSetProperty(typeof("Spine.Slot"), "A", arg_66_1, arg_66_2)
end

function var_0_0.setStepSlotAlpha(arg_67_0, arg_67_1, arg_67_2, arg_67_3)
	if not arg_67_0.slotDic[arg_67_1] then
		arg_67_0.slotDic[arg_67_1] = arg_67_0._skeletonGraphic.Skeleton:FindSlot(arg_67_1)
	end

	if arg_67_0.slotDic[arg_67_1] then
		if not arg_67_3 or arg_67_3 <= 0 then
			print("设置插槽 " .. arg_67_1 .. " alpha = " .. arg_67_2)
			arg_67_0:setSlotAlpha(arg_67_0.slotDic[arg_67_1], arg_67_2)
		else
			local var_67_0 = arg_67_0:getSlotAlpha(arg_67_1)

			table.insert(arg_67_0.stepSlotAlpha, {
				smooth = 0,
				name = arg_67_1,
				slot = arg_67_0.slotDic[arg_67_1],
				current = var_67_0,
				target = arg_67_2,
				time = arg_67_3
			})
		end
	end
end

function var_0_0.getStepSlotAlpha(arg_68_0, arg_68_1)
	for iter_68_0, iter_68_1 in ipairs(arg_68_0.stepSlotAlpha) do
		if iter_68_1.name == arg_68_1 then
			return iter_68_1
		end
	end

	return nil
end

function var_0_0.updateSlotAlpha(arg_69_0)
	for iter_69_0 = #arg_69_0.stepSlotAlpha, 1, -1 do
		local var_69_0 = arg_69_0.stepSlotAlpha[iter_69_0]

		var_69_0.current, var_69_0.smooth = Mathf.SmoothDamp(var_69_0.current, var_69_0.target, var_69_0.smooth, var_69_0.time)

		if math.abs(var_69_0.target - var_69_0.current) <= 0.02 then
			print("设置插槽 " .. var_69_0.name .. " alpha = " .. var_69_0.target)
			arg_69_0:setSlotAlpha(var_69_0.slot, var_69_0.target)

			table.remove(arg_69_0.stepSlotAlpha, iter_69_0).slot = nil
		else
			print("设置插槽 " .. var_69_0.name .. " alpha = " .. var_69_0.current)
			arg_69_0:setSlotAlpha(var_69_0.slot, var_69_0.current)
		end
	end
end

function var_0_0.updateLight(arg_70_0)
	if arg_70_0._lightAnimator and arg_70_0._lightAnimationName and (not arg_70_0._lightValue or math.abs(arg_70_0._lightValue - SpinePaintingConst.painting_lit_value) > 0.001) then
		arg_70_0._lightAnimator:Play(arg_70_0._lightAnimationName, -1, SpinePaintingConst.painting_lit_value)

		arg_70_0._lightValue = SpinePaintingConst.painting_lit_value
	end

	arg_70_0._paintingLitOpening = SpinePaintingConst.painting_lit_opening

	if arg_70_0._paintingLitOpening and arg_70_0.dragDataConfigClient and #arg_70_0.dragDataConfigClient > 0 and not arg_70_0:isInAction() then
		for iter_70_0, iter_70_1 in ipairs(arg_70_0.dragDataConfigClient) do
			if iter_70_1.lit and #iter_70_1.lit > 0 and SpinePaintingConst.painting_lit_value >= iter_70_1.lit[1] and SpinePaintingConst.painting_lit_value <= iter_70_1.lit[2] then
				local var_70_0 = arg_70_0:startDragAction(iter_70_1.hit, not iter_70_1.click)
			end
		end
	end
end

function var_0_0.updateEffectVisible(arg_71_0, arg_71_1)
	if not arg_71_0._effectsTf then
		return
	end

	if isActive(arg_71_0._effectsTf) ~= arg_71_0._effectShowFlag then
		setActive(arg_71_0._effectsTf, arg_71_0._effectShowFlag)
	end

	if arg_71_0.shipEffectActionAble then
		if table.contains(arg_71_0.shipEffectActionAble, arg_71_1) then
			if arg_71_0._effectsTf and isActive(arg_71_0._effectsTf) then
				setActive(arg_71_0._effectsTf, false)
			end

			if arg_71_0._lightEffects and isActive(arg_71_0._lightEffects) then
				setActive(arg_71_0._lightEffects, false)
			end
		else
			if arg_71_0._effectsTf and not isActive(arg_71_0._effectsTf) then
				setActive(arg_71_0._effectsTf, true)
			end

			if arg_71_0._lightEffects and not isActive(arg_71_0._lightEffects) then
				setActive(arg_71_0._lightEffects, true)
			end
		end
	end
end

function var_0_0.isInAction(arg_72_0)
	return arg_72_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_73_0, arg_73_1, arg_73_2, arg_73_3, arg_73_4, arg_73_5)
	if not arg_73_0:checkActionPlayAble(arg_73_1, arg_73_4, arg_73_2) then
		return
	end

	if arg_73_0.mainSpineAnim then
		arg_73_0.mainSpineAnim:SetActionCallBack(nil)
		arg_73_0.mainSpineAnim:SetActionCallBack(function(arg_74_0)
			if arg_74_0 == "finish" and arg_73_3 then
				arg_73_0:changeInAction(false)
				arg_73_3()

				arg_73_3 = nil
			elseif arg_74_0 == "action" and arg_73_5 then
				arg_73_5()

				arg_73_5 = nil
			elseif string.match(arg_74_0, "^bgm_") or string.match(arg_74_0, "^bgmsingle_") then
				if arg_73_0._visible then
					local var_74_0 = string.match(arg_74_0, "^bgm_(.*)$") or string.match(arg_74_0, "^bgmsingle_(.*)$")
					local var_74_1 = string.split(var_74_0, "_")
					local var_74_2 = string.match(arg_74_0, "^bgm_(.*)$") and true or false
					local var_74_3 = "se-skin"
					local var_74_4 = var_74_1[1] .. "_" .. var_74_1[2]
					local var_74_5 = var_74_1[3] and tonumber(var_74_1[3]) or 1

					pg.CriMgr.GetInstance():PlayPaintingBgm(var_74_3, var_74_4, var_74_2, var_74_5, Live2dConst.GetPaintingBgmVolume(arg_73_0._spinePaintingData.ship:getSkinId()))
				end
			elseif string.match(arg_74_0, "^effect_") then
				if string.match(arg_74_0, "^effect_on") then
					arg_73_0._effectShowFlag = false
				elseif string.match(arg_74_0, "^effect_off") then
					arg_73_0._effectShowFlag = true
				end

				arg_73_0:updateEffectVisible(arg_73_1)
				print("change effect " .. tostring(arg_73_0._effectShowFlag))
			elseif string.match(arg_74_0, "^drag_") then
				if string.match(arg_74_0, "^drag_on") then
					arg_73_0._dragPassFlag = false
				elseif string.match(arg_74_0, "^drag_off") then
					arg_73_0._dragPassFlag = true
				end

				print("change drag pass " .. tostring(arg_73_0._dragPassFlag))
			end
		end)
	end

	arg_73_0:SetAction(arg_73_1, arg_73_2, arg_73_4)
end

function var_0_0.SetOnceAction(arg_75_0, arg_75_1, arg_75_2, arg_75_3, arg_75_4)
	if not arg_75_0:checkActionPlayAble(arg_75_1, arg_75_4, 0) then
		return
	end

	arg_75_0:SetActionWithFinishCallback(arg_75_1, 0, function()
		arg_75_0:SetAction(arg_75_0:getIdleName(), 0)

		if arg_75_2 then
			arg_75_2()

			arg_75_2 = nil
		end
	end, arg_75_4, function()
		if arg_75_3 then
			arg_75_3()

			arg_75_3 = nil
		end
	end)
end

function var_0_0.pullInitCallback(arg_78_0, arg_78_1)
	table.insert(arg_78_0._initCallback, arg_78_1)
end

function var_0_0.getAnimationExist(arg_79_0, arg_79_1, arg_79_2)
	local var_79_0

	arg_79_2 = arg_79_2 or arg_79_0._skeletonGraphic

	if arg_79_2 then
		var_79_0 = arg_79_2.Skeleton.Data:FindAnimation(arg_79_1)
	end

	return var_79_0
end

function var_0_0.SetEmptyAction(arg_80_0, arg_80_1)
	if not arg_80_0.spineAnimList then
		return
	end

	for iter_80_0, iter_80_1 in ipairs(arg_80_0.spineAnimList) do
		local var_80_0 = iter_80_1:GetAnimationState()

		if var_80_0 then
			var_80_0:SetEmptyAnimation(arg_80_1, 0)
			GetComponent(iter_80_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.GetSpineTransform(arg_81_0)
	return arg_81_0._tf
end

function var_0_0.SetSkin(arg_82_0, arg_82_1)
	if arg_82_0._skeletonGraphic and arg_82_0._skeletonGraphic.SkeletonData and arg_82_0._skeletonGraphic.SkeletonData:FindSkin(arg_82_1) ~= nil then
		arg_82_0._skeletonGraphic.Skeleton:SetSkin(arg_82_1)
		arg_82_0._skeletonGraphic.Skeleton:SetSlotsToSetupPose()
	end
end

function var_0_0.updateSkeletonGraphicTime(arg_83_0)
	if arg_83_0._skeletonGraphic then
		arg_83_0._skeletonGraphic:Update(Time.deltaTime)
	end
end

function var_0_0.getMultipFaceAction(arg_84_0, arg_84_1)
	if arg_84_0.multipleFaceFlag then
		local var_84_0 = tonumber(arg_84_1)

		if var_84_0 and var_84_0 >= 0 then
			for iter_84_0, iter_84_1 in ipairs(arg_84_0.multipleFaceData) do
				if iter_84_1[1] == arg_84_0:getIdleName() then
					return tostring(var_84_0 + iter_84_1[2])
				end
			end
		end
	end

	return arg_84_1
end

function var_0_0.unloadCueSheet(arg_85_0)
	if not arg_85_0.loadSheets then
		return
	end

	for iter_85_0, iter_85_1 in ipairs(arg_85_0.loadSheets) do
		pg.CriMgr.GetInstance():UnloadCueSheet(iter_85_1)
	end

	arg_85_0.loadSheets = {}
end

function var_0_0.Dispose(arg_86_0)
	arg_86_0._isDisposed = true
	arg_86_0._materialDic = {}

	if arg_86_0.updateLocal then
		arg_86_0._skeletonGraphic.UpdateLocal = arg_86_0._skeletonGraphic.UpdateLocal - arg_86_0.updateLocal
		arg_86_0.updateLocal = nil
	end

	if arg_86_0._spinePaintingData then
		arg_86_0._spinePaintingData:Clear()
	end

	for iter_86_0, iter_86_1 in pairs(arg_86_0._loadSpineDic) do
		PoolMgr.GetInstance():ReturnSpinePainting(iter_86_0, iter_86_1)
	end

	for iter_86_2, iter_86_3 in pairs(arg_86_0._loadUIDic) do
		PoolMgr.GetInstance():ReturnUI(iter_86_2, iter_86_3)
	end

	arg_86_0._loadSpineDic = {}
	arg_86_0._loadUIDic = {}

	arg_86_0:unloadCueSheet()

	if arg_86_0._go ~= nil then
		var_0_1.Destroy(arg_86_0._go)
	end

	if arg_86_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_86_0._bgEffectGo)
	end

	arg_86_0._go = nil
	arg_86_0._tf = nil
	arg_86_0._bgEffectGo = nil
	arg_86_0._bgEffectTf = nil

	if arg_86_0.spineAnim then
		arg_86_0.spineAnim:SetActionCallBack(nil)
	end

	if arg_86_0._slotAlphaTimer then
		arg_86_0._slotAlphaTimer:Stop()

		arg_86_0._slotAlphaTimer = nil
	end

	if arg_86_0.stepSlotAlpha and #arg_86_0.stepSlotAlpha > 0 then
		for iter_86_4, iter_86_5 in ipairs(arg_86_0.stepSlotAlpha) do
			iter_86_5.slot = nil
		end

		arg_86_0.stepSlotAlpha = {}
	end
end

function var_0_0.getPaintingName(arg_87_0)
	return arg_87_0._spinePaintingData:GetShipName()
end

return var_0_0
