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
				arg_8_0:UpdateGraphic()
				arg_8_0:applyVisible(false)
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

		local var_13_0 = arg_8_0._pendingVisible ~= false

		arg_8_0._pendingVisible = nil
		arg_8_0._visibleReady = true

		arg_8_0:applyVisible(var_13_0)

		if arg_8_2 then
			arg_8_2(arg_8_0)
		end
	end)
end

function var_0_0.init(arg_14_0, arg_14_1)
	arg_14_0._go = arg_14_1
	arg_14_0._tf = tf(arg_14_1)

	HotfixHelper.SetLayerRecursively(arg_14_0._go, LayerMask.NameToLayer("UI"))
	arg_14_0._tf:SetParent(arg_14_0._spinePaintingData.parent, true)

	arg_14_0._tf.localScale = arg_14_0._spinePaintingData.scale
	arg_14_0._tf.localPosition = arg_14_0._spinePaintingData.pos
	arg_14_0.spineAnimList = {}

	local var_14_0 = arg_14_0._tf:GetComponent(typeof(ItemList)).prefabItem:ToTable()

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		arg_14_0.spineAnimList[#arg_14_0.spineAnimList + 1] = GetOrAddComponent(iter_14_1, "SpineAnimUI")
	end

	local var_14_1 = #arg_14_0.spineAnimList

	assert(var_14_1 > 0, "动态立绘至少要保证有一个spine动画，请检查" .. arg_14_0._spinePaintingData:GetShipName())

	if var_14_1 == 1 then
		arg_14_0.mainSpineAnim = arg_14_0.spineAnimList[1]
	else
		arg_14_0.mainSpineAnim = arg_14_0.spineAnimList[#arg_14_0.spineAnimList]
	end

	arg_14_0._skeletonGraphic = arg_14_0.mainSpineAnim:GetComponent("SkeletonGraphic")

	function arg_14_0.updateLocal()
		arg_14_0:onUpdateLocal()
	end

	arg_14_0._skeletonGraphic.UpdateLocal = arg_14_0._skeletonGraphic.UpdateLocal + arg_14_0.updateLocal
	arg_14_0._baseMaterial = arg_14_0._skeletonGraphic.material
	arg_14_0._idleName = arg_14_0:getNormalIdleName()
	arg_14_0.shipDragData = SpinePaintingConst.ship_drag_datas[arg_14_0._spinePaintingData:GetShipName()]
	arg_14_0.dragShipFlag = false
	arg_14_0.lockLayer = false

	if arg_14_0.shipDragData then
		arg_14_0.dragShipFlag = arg_14_0.shipDragData.drag_data and arg_14_0.shipDragData.drag_data.type
		arg_14_0.lockLayer = arg_14_0.shipDragData.drag_data.lock_layer
		arg_14_0.replaceWord = arg_14_0.shipDragData.replace_word
		arg_14_0.dragDataConfigClient = arg_14_0.shipDragData.drag_data.config_client
	end

	arg_14_0.multipleFaceFlag = false

	if arg_14_0.shipDragData and arg_14_0.shipDragData.multiple_face and arg_14_0.shipDragData.multiple_face ~= "" then
		local var_14_2 = arg_14_0.shipDragData.multiple_face.name

		arg_14_0.multipleFaceFlag = table.contains(var_14_2, arg_14_0.mainSpineAnim.name)
		arg_14_0.multipleFaceData = arg_14_0.shipDragData.multiple_face.data
	end

	arg_14_0.shipEffectActionAble = SpinePaintingConst.ship_effect_action_able[arg_14_0._spinePaintingData:GetShipName()]
	arg_14_0._effectsTf = findTF(arg_14_0._tf, "effects")
	arg_14_0._effectShowFlag = true
	arg_14_0._dragPassFlag = true
	arg_14_0._lightTf = findTF(arg_14_0._tf, "light")

	if arg_14_0._lightTf then
		arg_14_0._lightAnimator = arg_14_0._lightTf:GetComponent(typeof(Animator))
		arg_14_0._lightAnimationName = arg_14_0._lightAnimator.runtimeAnimatorController.animationClips[0].name

		arg_14_0._lightAnimator:Play(arg_14_0._lightAnimationName, -1, SpinePaintingConst.painting_lit_value)
	end

	arg_14_0:playPaintingInitIdle()
	arg_14_0:playPaintingInitSkin()

	arg_14_0.slotDic = {}
	arg_14_0.stepSlotAlpha = {}
	arg_14_0._slotAlphaTimer = Timer.New(function()
		arg_14_0:updateSlotAlpha()
		arg_14_0:updateLight()
	end, 0.016666666666666666, -1)

	arg_14_0._slotAlphaTimer:Start()
	arg_14_0:UpdateGraphic()
end

function var_0_0.initBgEffect(arg_17_0, arg_17_1)
	arg_17_0._bgEffectGo = arg_17_1
	arg_17_0._bgEffectTf = tf(arg_17_1)

	HotfixHelper.SetLayerRecursively(arg_17_0._bgEffectGo, LayerMask.NameToLayer("UI"))
	arg_17_0._bgEffectTf:SetParent(arg_17_0._spinePaintingData.effectParent, true)

	arg_17_0._bgEffectTf.localScale = arg_17_0._spinePaintingData.bgEffectScale
	arg_17_0._bgEffectTf.localPosition = arg_17_0._spinePaintingData.bgEffectPos
end

function var_0_0.getInitFlag(arg_18_0)
	return arg_18_0._initFlag
end

function var_0_0.getNormalIdleName(arg_19_0)
	if HXSet.isHx() and arg_19_0.shipDragData and arg_19_0.shipDragData.hx_idle then
		return arg_19_0.shipDragData.hx_idle
	end

	return "normal"
end

function var_0_0.updateLink(arg_20_0)
	arg_20_0.slotOverride = {}

	local var_20_0 = arg_20_0._spinePaintingData.ship:getSkinId()
	local var_20_1 = ChangeSkinLink.CHANGE_SKIN_LINK_DATA[var_20_0]

	if var_20_1 then
		local var_20_2 = var_20_1.link_id
		local var_20_3 = var_20_1.relations

		if var_20_1.link_type == ChangeSkinLink.L2D_TYPE then
			local var_20_4

			if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 then
				var_20_4 = ChangeSkinLink.GetSaveL2dData(arg_20_0._spinePaintingData.ship.id, var_20_2)
			else
				var_20_4 = ChangeSkinLink.L2D_PARAMETER_DIC[arg_20_0._spinePaintingData.ship.id]
			end

			var_20_4 = var_20_4 or {}

			for iter_20_0, iter_20_1 in ipairs(var_20_3) do
				local var_20_5 = iter_20_1.type

				if var_20_5 == ChangeSkinLink.change_parameter_link_slot then
					local var_20_6 = true
					local var_20_7 = iter_20_1.link_parameter
					local var_20_8 = iter_20_1.slot_list

					for iter_20_2, iter_20_3 in ipairs(var_20_7) do
						local var_20_9 = iter_20_3.name
						local var_20_10 = iter_20_3.num

						if (var_20_4[var_20_9] and var_20_4[var_20_9] or 0) ~= var_20_10 then
							var_20_6 = false
						end
					end

					if var_20_6 then
						for iter_20_4, iter_20_5 in ipairs(var_20_8) do
							table.insert(arg_20_0.slotOverride, iter_20_5)
						end
					end
				elseif var_20_5 == ChangeSkinLink.change_parameter_link_skin then
					local var_20_11 = true
					local var_20_12 = iter_20_1.link_parameter
					local var_20_13 = iter_20_1.skeleton_skin

					for iter_20_6, iter_20_7 in ipairs(var_20_12) do
						local var_20_14 = iter_20_7.name
						local var_20_15 = iter_20_7.num

						if (var_20_4[var_20_14] and var_20_4[var_20_14] or 0) ~= var_20_15 then
							var_20_11 = false
						end
					end

					if var_20_11 then
						arg_20_0:SetSkeletonSkin(var_20_13)
					end
				end
			end
		end
	end
end

function var_0_0.setL2dSlot(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0._skeletonGraphic.Skeleton:SetAttachment(arg_21_1, arg_21_2)
end

function var_0_0.onUpdateLocal(arg_22_0)
	if arg_22_0.slotOverride then
		for iter_22_0, iter_22_1 in ipairs(arg_22_0.slotOverride) do
			arg_22_0:setL2dSlot(iter_22_1[1], iter_22_1[2])
		end
	end
end

function var_0_0.UpdateGraphic(arg_23_0)
	if arg_23_0._isDisposed then
		return
	end

	print("spine update graphic Time")
	arg_23_0._skeletonGraphic:UpdateMesh()
	Canvas.ForceUpdateCanvases()
end

function var_0_0.SetVisible(arg_24_0, arg_24_1)
	if arg_24_0._isDisposed then
		return
	end

	if not arg_24_0._visibleReady then
		arg_24_0._pendingVisible = arg_24_1

		return
	end

	arg_24_0:applyVisible(arg_24_1)
end

function var_0_0.applyVisible(arg_25_0, arg_25_1)
	if arg_25_0._isDisposed then
		return
	end

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
		if arg_25_0._slotAlphaTimer and not arg_25_0._slotAlphaTimer.running then
			arg_25_0._slotAlphaTimer:Start()
		end
	elseif arg_25_0._slotAlphaTimer and arg_25_0._slotAlphaTimer.running then
		arg_25_0._slotAlphaTimer:Stop()
	end

	arg_25_0._visible = arg_25_1

	if arg_25_0._isDisposed then
		return
	end

	if arg_25_0._lightTf then
		setActive(arg_25_0._lightTf, arg_25_0._visible)
	end

	if arg_25_0._spinePaintingData.effectParent then
		setActive(arg_25_0._spinePaintingData.effectParent, arg_25_0._visible)
		setActiveViaLayer(arg_25_0._spinePaintingData.effectParent, arg_25_0._visible)
	end

	if not IsNil(arg_25_0._tf) then
		pg.ViewUtils.SetLayer(arg_25_0._tf, arg_25_0._visible and Layer.UI or Layer.UIHidden)
	end

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

function var_0_0.playPaintingInitIdle(arg_26_0)
	local var_26_0 = SpinePaintingDrag.GetPaintingInitIdle(arg_26_0.mainSpineAnim.name, arg_26_0._spinePaintingData.ship.id)
	local var_26_1 = arg_26_0:getNormalIdleName()

	if var_26_0 then
		local var_26_2 = PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1)

		if var_26_2 == 1 and arg_26_0._idleName ~= var_26_0 then
			var_26_1 = var_26_0
		elseif var_26_2 ~= 1 and arg_26_0._idleName ~= arg_26_0:getNormalIdleName() then
			var_26_1 = arg_26_0:getNormalIdleName()
		end
	else
		var_26_1 = arg_26_0:getNormalIdleName()
	end

	if var_26_1 then
		arg_26_0:setIdleName(var_26_1)
		arg_26_0:SetActionWithFinishCallback(arg_26_0._idleName, 0, nil, true, nil)
		arg_26_0:changeInAction(false)
	end
end

function var_0_0.changeInAction(arg_27_0, arg_27_1)
	arg_27_0.inAction = arg_27_1
	SpinePaintingConst.spine_painting_action = arg_27_1

	if SpinePaintingConst.painting_lit_action_callback then
		SpinePaintingConst.painting_lit_action_callback(arg_27_1)
	end
end

function var_0_0.playPaintingInitSkin(arg_28_0)
	local var_28_0 = SpinePaintingDrag.GetPaintingInitSkin(arg_28_0.mainSpineAnim.name, arg_28_0._spinePaintingData.ship.id)
	local var_28_1 = arg_28_0:GetDefaultSkeletonSkin()

	if var_28_0 then
		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_28_0:GetDefaultSkeletonSkin() ~= var_28_0 then
			var_28_1 = var_28_0
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_28_0._skeletonSkin ~= arg_28_0:GetDefaultSkeletonSkin() then
			var_28_1 = arg_28_0:GetDefaultSkeletonSkin()
		end
	else
		var_28_1 = arg_28_0:GetDefaultSkeletonSkin()
	end

	if var_28_1 then
		if arg_28_0._skeletonGraphic and arg_28_0._skeletonGraphic.SkeletonData then
			if arg_28_0._skeletonGraphic.SkeletonData:FindSkin(var_28_1) ~= nil then
				arg_28_0:SetSkeletonSkin(var_28_1)
			elseif arg_28_0._skeletonGraphic.SkeletonData:FindSkin("default") ~= nil then
				arg_28_0:SetSkeletonSkin("default")
			end
		end
	else
		arg_28_0:SetDefaultSkeletonSkin()
	end
end

function var_0_0.getIdleName(arg_29_0)
	return arg_29_0._idleName
end

function var_0_0.setIdleName(arg_30_0, arg_30_1)
	arg_30_0._idleName = arg_30_1

	arg_30_0:updateHitArea()
end

function var_0_0.getReplaceWord(arg_31_0)
	if arg_31_0.replaceWord and table.contains(arg_31_0.replaceWord, arg_31_0._idleName) then
		return true
	end

	return false
end

function var_0_0.updateHitArea(arg_32_0)
	if arg_32_0.dragShipFlag then
		local var_32_0 = arg_32_0.shipDragData.drag_data.type
		local var_32_1 = arg_32_0.shipDragData.drag_data.config_client

		if var_32_0 == SpinePaintingConst.drag_type_normal then
			for iter_32_0 = 1, #var_32_1 do
				local var_32_2 = var_32_1[iter_32_0]
				local var_32_3 = var_32_2.hit
				local var_32_4 = var_32_2.active

				if var_32_3 and not var_32_4 then
					local var_32_5 = findTF(arg_32_0._tf, "hitArea/" .. var_32_3)

					if var_32_5 then
						local var_32_6 = true
						local var_32_7 = true

						if var_32_2.idle and type(var_32_2.idle) == "string" then
							var_32_6 = var_32_2.idle == arg_32_0._idleName
						elseif var_32_2.idle and type(var_32_2.idle) == "table" then
							var_32_6 = table.contains(var_32_2.idle, arg_32_0._idleName)
						end

						if var_32_2.skin and type(var_32_2.skin) == "string" then
							var_32_7 = var_32_2.skin == arg_32_0._skeletonSkin
						elseif var_32_2.skin and type(var_32_2.skin) == "table" then
							var_32_7 = table.contains(var_32_2.skin, arg_32_0._skeletonSkin)
						end

						setActive(var_32_5, var_32_6 and var_32_7)
					else
						print("hit area " .. var_32_3 .. "is not exist")
					end
				end
			end
		end
	end
end

function var_0_0.checkListAction(arg_33_0)
	if #arg_33_0.clickActionList > 0 then
		local var_33_0 = table.remove(arg_33_0.clickActionList, 1)

		arg_33_0:SetActionWithFinishCallback(var_33_0, 0, function()
			arg_33_0:checkListAction()
		end, true)
	else
		arg_33_0:SetAction(arg_33_0:getNormalIdleName(), 0, true)
		arg_33_0:changeInAction(false)
	end
end

function var_0_0.displayWord(arg_35_0, arg_35_1)
	arg_35_0._displayWord = arg_35_1
end

function var_0_0.readyDragAction(arg_36_0, arg_36_1, arg_36_2)
	if arg_36_0.inAction or arg_36_0._displayWord then
		return false
	end

	if arg_36_0.dragShipFlag then
		return arg_36_0:startDragAction(arg_36_1, arg_36_2)
	end

	return false
end

function var_0_0.SetSkeletonSkin(arg_37_0, arg_37_1)
	arg_37_0._skeletonSkin = arg_37_1

	arg_37_0:SetSkin(arg_37_1)
	arg_37_0:updateSkeletonGraphicTime()
	arg_37_0:updateHitArea()
end

function var_0_0.SetDefaultSkeletonSkin(arg_38_0)
	arg_38_0:SetSkeletonSkin(arg_38_0:GetDefaultSkeletonSkin())
end

function var_0_0.GetDefaultSkeletonSkin(arg_39_0)
	local var_39_0 = arg_39_0._spinePaintingData:GetShipSkinConfig().skeleton_default_skin

	if not var_39_0 or var_39_0 == "" then
		var_39_0 = arg_39_0._skeletonGraphic.SkeletonData:FindSkin("1") and "1" or "default"
	end

	return var_39_0
end

function var_0_0.startDragAction(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_0.shipDragData.drag_data
	local var_40_1 = var_40_0.type

	if var_40_1 == SpinePaintingConst.drag_type_normal then
		return arg_40_0:changePaintingNormal(var_40_0, arg_40_1, arg_40_2)
	elseif var_40_1 == SpinePaintingConst.drag_type_list then
		arg_40_0.clickActionList = Clone(var_40_0.config_client)

		return arg_40_0:checkListAction()
	end

	return false
end

function var_0_0.GetDragDataConfig(arg_41_0, arg_41_1)
	if arg_41_0.shipDragData then
		return arg_41_0.shipDragData[arg_41_1]
	end

	return nil
end

function var_0_0.setEventTriggerCallback(arg_42_0, arg_42_1)
	arg_42_0._eventTriggerCall = arg_42_1
end

function var_0_0.changePaintingNormal(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = arg_43_1.config_client
	local var_43_1 = arg_43_1.type

	for iter_43_0, iter_43_1 in ipairs(var_43_0) do
		if arg_43_0:matchDragFlag(arg_43_2, iter_43_1, arg_43_3) then
			return arg_43_0:doDragAction(var_43_1, arg_43_1, iter_43_1, arg_43_3)
		end
	end

	return false
end

function var_0_0.doDragAction(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4)
	local var_44_0 = arg_44_3.fold
	local var_44_1 = arg_44_3.fold_chat and arg_44_3.fold_chat or nil
	local var_44_2 = arg_44_3.effect_hide
	local var_44_3 = arg_44_3.action_cv
	local var_44_4 = arg_44_3.finish_cv
	local var_44_5 = arg_44_3.alpha_data and arg_44_3.alpha_data or nil
	local var_44_6 = arg_44_3.skin_change and arg_44_3.skin_change or nil
	local var_44_7 = arg_44_3.clear_track and arg_44_3.clear_track or nil
	local var_44_8 = arg_44_3.idle and arg_44_3.idle or nil
	local var_44_9 = arg_44_3.change_idle
	local var_44_10 = arg_44_3.action
	local var_44_11 = arg_44_3.event
	local var_44_12 = var_44_6
	local var_44_13
	local var_44_14
	local var_44_15

	if type(var_44_9) == "table" and type(var_44_10) == "table" then
		local var_44_16 = math.random(1, #var_44_10)

		var_44_13 = var_44_10[var_44_16]
		var_44_15 = var_44_9[var_44_16]
	elseif type(var_44_8) == "table" and type(var_44_10) == "table" then
		local var_44_17 = table.indexof(var_44_8, arg_44_0:getIdleName())

		var_44_13 = var_44_10[var_44_17]

		if type(var_44_9) == "table" then
			var_44_15 = var_44_9[var_44_17]
		end
	end

	if not var_44_13 then
		if type(var_44_10) == "string" then
			var_44_13 = var_44_10
		elseif type(var_44_10) == "table" then
			var_44_13 = var_44_10[math.random(1, #var_44_10)]
		end
	end

	if not var_44_15 then
		if type(var_44_9) == "string" then
			var_44_15 = var_44_9
		elseif type(var_44_9) == "table" then
			var_44_15 = var_44_9[math.random(1, #var_44_9)]
		end
	end

	if not var_44_14 then
		if type(var_44_11) == "string" then
			var_44_14 = var_44_11
		elseif type(var_44_11) == "table" then
			var_44_14 = var_44_11[math.random(1, #var_44_11)]
		end
	end

	if arg_44_1 == SpinePaintingConst.drag_type_normal then
		if var_44_5 and #var_44_5 > 0 then
			arg_44_0:SetAlphaData(var_44_5)
		end

		local var_44_18 = arg_44_3.material and arg_44_3.material or nil
		local var_44_19 = arg_44_3.material_time and arg_44_3.material_time or nil

		if var_44_18 then
			if LeanTween.isTweening(go(arg_44_0._tf)) then
				return false
			end

			arg_44_0:getSpineMaterial(var_44_18, function(arg_45_0)
				arg_44_0._skeletonGraphic.material = arg_45_0

				if var_44_19 then
					LeanTween.delayedCall(go(arg_44_0._tf), var_44_19, System.Action(function()
						arg_44_0._skeletonGraphic.material = arg_44_0._baseMaterial

						arg_44_0:changePaintingIdle(var_44_15)
					end))
				end
			end)
		end

		if var_44_7 and #var_44_7 > 0 then
			for iter_44_0, iter_44_1 in ipairs(var_44_7) do
				arg_44_0:SetEmptyAction(iter_44_1)
			end
		end

		if var_44_13 and var_44_13 ~= "" and arg_44_0:checkActionPlayAble(var_44_13, false, 0) then
			print("播放动作 .." .. var_44_13 .. "下一个待机动作 .. " .. var_44_15)

			if var_44_0 then
				pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, {
					flag = true,
					content = {
						chat = var_44_1
					}
				})
			end

			arg_44_0:setEffectVisible(var_44_2, false)
			arg_44_0:SetActionWithFinishCallback(var_44_13, 0, function()
				if var_44_12 and var_44_12 ~= "" then
					arg_44_0:changeSkeletonSkin(var_44_12)
				end

				if var_44_0 then
					pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, {
						flag = false,
						content = {
							chat = var_44_1
						}
					})
				end

				arg_44_0:changePaintingIdle(var_44_15 and var_44_15 or arg_44_0:getIdleName())
				arg_44_0:setEffectVisible(var_44_2, true)

				if var_44_4 and var_44_4 ~= "" then
					arg_44_0:PlayCv(var_44_4)
				end
			end, false, function()
				if var_44_3 and var_44_3 ~= "" then
					arg_44_0:PlayCv(var_44_3)
				end

				if var_44_14 and type(var_44_14) == "string" and arg_44_0._eventTriggerCall then
					arg_44_0._eventTriggerCall(var_44_14)
				end
			end)
		end

		if not var_44_13 or var_44_13 == "" then
			if var_44_12 and var_44_12 ~= "" then
				arg_44_0:changeSkeletonSkin(var_44_12)
			end

			if var_44_15 and var_44_15 ~= "" then
				arg_44_0:changePaintingIdle(var_44_15)
			end

			if var_44_14 and type(var_44_14) == "string" and arg_44_0._eventTriggerCall then
				arg_44_0._eventTriggerCall(var_44_14)
			end

			return false
		end
	end

	return true
end

function var_0_0.SetAlphaData(arg_49_0, arg_49_1)
	for iter_49_0, iter_49_1 in ipairs(arg_49_1) do
		local var_49_0 = iter_49_1[1]
		local var_49_1 = iter_49_1[2]
		local var_49_2 = iter_49_1[3]
		local var_49_3 = arg_49_0:getSlotAlpha(var_49_0)

		if not arg_49_0:getStepSlotAlpha(var_49_0) and var_49_3 then
			local var_49_4
			local var_49_5

			for iter_49_2, iter_49_3 in ipairs(var_49_1) do
				if math.abs(var_49_3 - iter_49_3) <= 0.1 then
					var_49_5 = iter_49_2 + 1
				end

				if var_49_5 == iter_49_2 then
					var_49_4 = iter_49_3
				end
			end

			var_49_4 = var_49_4 or var_49_1[1]

			if var_49_4 then
				arg_49_0:setStepSlotAlpha(var_49_0, var_49_4, var_49_2)
			end
		end
	end
end

function var_0_0.PlayCv(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0._spinePaintingData.ship:getSkinId()
	local var_50_1 = pg.CriMgr.GetCVBankName(ShipWordHelper.RawGetCVKey(var_50_0))
	local var_50_2 = pg.ship_skin_template[var_50_0].group_index
	local var_50_3 = arg_50_1 .. "_" .. var_50_2

	print("try playing cv" .. var_50_1 .. ":" .. var_50_3)
	pg.CriMgr.GetInstance():playCueSheetVoice(var_50_1, var_50_3, true, function(arg_51_0)
		if arg_51_0 then
			print("播放的语音长度为 = " .. arg_51_0:GetLength())
		end
	end)
end

function var_0_0.changeSkeletonSkin(arg_52_0, arg_52_1)
	if arg_52_0._skeletonSkin == arg_52_1 then
		arg_52_0:SetDefaultSkeletonSkin()
	else
		arg_52_0:SetSkeletonSkin(arg_52_1)
	end

	SpinePaintingDrag.SetPaintingInitSkin(arg_52_0.mainSpineAnim.name, arg_52_0._spinePaintingData.ship.id, arg_52_0._skeletonSkin)
end

function var_0_0.setEffectVisible(arg_53_0, arg_53_1, arg_53_2)
	if not arg_53_1 or #arg_53_1 == 0 then
		return
	end

	for iter_53_0 = 1, #arg_53_1 do
		local var_53_0 = findTF(arg_53_0._tf, arg_53_1[iter_53_0])

		if var_53_0 then
			setActive(var_53_0, arg_53_2)
		end
	end
end

function var_0_0.matchDragFlag(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	local var_54_0 = arg_54_2.hit

	if var_54_0 and var_54_0 ~= arg_54_1 then
		return false
	end

	local var_54_1 = arg_54_2.skin

	if var_54_1 and var_54_1 ~= "" and arg_54_0._skeletonSkin ~= var_54_1 then
		return false
	end

	local var_54_2 = arg_54_2.idle

	if var_54_2 and type(var_54_2) == "string" and arg_54_0:getIdleName() ~= var_54_2 then
		return false
	elseif var_54_2 and type(var_54_2) == "table" and not table.contains(var_54_2, arg_54_0:getIdleName()) then
		return false
	end

	local var_54_3 = arg_54_2.favor

	if var_54_3 and var_54_3 >= 0 then
		local var_54_4 = arg_54_0._spinePaintingData.ship:getCVIntimacy()

		if var_54_4 and var_54_4 < var_54_3 then
			return false
		end
	end

	if arg_54_2.click and arg_54_2.click == tobool(arg_54_3) then
		return false
	end

	return true
end

function var_0_0.OnDragMove(arg_55_0, arg_55_1, arg_55_2)
	return
end

function var_0_0.getSpineMaterial(arg_56_0, arg_56_1, arg_56_2)
	if not arg_56_0._materialDic then
		arg_56_0._materialDic = {}
	end

	if arg_56_0._materialDic[arg_56_1] then
		arg_56_2(arg_56_0._materialDic[arg_56_1])
	else
		arg_56_0._materialDic[arg_56_1] = LoadAny("spinematerials", arg_56_1, typeof(Material))

		arg_56_2(arg_56_0._materialDic[arg_56_1])
	end
end

function var_0_0.changePaintingIdle(arg_57_0, arg_57_1)
	arg_57_0:setIdleName(arg_57_1)
	arg_57_0:SetAction(arg_57_1, 0, true)
	SpinePaintingDrag.SetPaintingInitIdle(arg_57_0.mainSpineAnim.name, arg_57_0._spinePaintingData.ship.id, arg_57_1)
	arg_57_0:changeInAction(false)
end

function var_0_0.SetShopHx(arg_58_0, arg_58_1)
	if arg_58_1 and HXSet.isHx() then
		if arg_58_0:getAnimationExist("shop_hx", arg_58_0._skeletonGraphic) then
			arg_58_0:setIdleName("shop_hx")
			arg_58_0:SetAction(arg_58_0._idleName, 0, true)

			local var_58_0 = arg_58_0._tf.anchoredPosition

			arg_58_0._tf.localPosition = Vector2(100000, 0)

			arg_58_0:updateSkeletonGraphicTime()
			onDelayTick(function()
				arg_58_0._tf.localPosition = arg_58_0._spinePaintingData.pos
			end, 0.05)
		end
	else
		arg_58_0:setIdleName(arg_58_0:getNormalIdleName())
		arg_58_0:SetAction(arg_58_0._idleName, 0, true)
	end
end

function var_0_0.SetAction(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	if not arg_60_0:checkActionPlayAble(arg_60_1, arg_60_3, arg_60_2) then
		return false
	end

	if arg_60_2 and arg_60_2 == 0 then
		arg_60_0.lastPlayAction = arg_60_1
	end

	if arg_60_2 == 0 and arg_60_1 ~= arg_60_0:getIdleName() then
		arg_60_0:changeInAction(true)
	end

	if arg_60_0.multipleFaceFlag and not arg_60_0.inAction then
		arg_60_1 = arg_60_0:getMultipFaceAction(arg_60_1)
	end

	local var_60_0 = arg_60_0._spinePaintingData.ship:getSkinId()
	local var_60_1 = pg.ship_skin_template[var_60_0].voice_lang

	if arg_60_2 == 0 and var_60_1 and #var_60_1 > 0 then
		local var_60_2 = ShipWordHelper.GetLanguageSetting(var_60_0)

		if var_60_2 <= 0 then
			var_60_2 = 1
		end

		local var_60_3 = var_60_1[var_60_2]
		local var_60_4 = arg_60_0:GetVoiceLandAction(arg_60_1, var_60_3)

		if arg_60_0:getAnimationExist(var_60_4, arg_60_0._skeletonGraphic) then
			arg_60_1 = var_60_4
		end
	end

	arg_60_0:updateEffectVisible(arg_60_1)

	if HXSet.isHx() and arg_60_0:getAnimationExist(arg_60_1 .. "_hx") then
		arg_60_1 = arg_60_1 .. "_hx"
	elseif HXSet.isHx() and arg_60_0:getAnimationExist("hx/" .. arg_60_1 .. "_hx") then
		arg_60_1 = "hx/" .. arg_60_1 .. "_hx"
	end

	for iter_60_0, iter_60_1 in ipairs(arg_60_0.spineAnimList) do
		local var_60_5 = iter_60_1:GetComponent("SkeletonGraphic")

		if arg_60_0:getAnimationExist(arg_60_1, var_60_5) then
			iter_60_1:SetAction(arg_60_1, arg_60_2)
		end

		if iter_60_1:GetAnimationState() then
			GetComponent(iter_60_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end

	return true
end

function var_0_0.GetVoiceLandAction(arg_61_0, arg_61_1, arg_61_2)
	local var_61_0 = ""

	if arg_61_2 == ShipSkin.VOICE_LANG_JP then
		var_61_0 = "_jp"
	elseif arg_61_2 == ShipSkin.VOICE_LANG_CN then
		var_61_0 = "_cn"
	end

	return arg_61_1 .. var_61_0
end

function var_0_0.checkActionPlayAble(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	if arg_62_3 and arg_62_3 == 0 and arg_62_0.inAction and not arg_62_2 then
		return false
	end

	if arg_62_0.lockLayer and not arg_62_2 and arg_62_0.inAction and arg_62_3 and arg_62_3 > 0 then
		return false
	end

	if arg_62_0.lastPlayAction and arg_62_0.lastPlayAction ~= arg_62_0._idleName and arg_62_3 and arg_62_3 > 0 then
		return false
	end

	if arg_62_0._idleName ~= arg_62_0:getNormalIdleName() and arg_62_1 == "login" then
		return false
	end

	if not arg_62_0._dragPassFlag then
		return false
	end

	if arg_62_0.dragShipFlag and arg_62_0.shipDragData.action_enable then
		local var_62_0 = arg_62_0.shipDragData.action_enable

		for iter_62_0 = 1, #var_62_0 do
			local var_62_1 = var_62_0[iter_62_0]

			if var_62_1.name == arg_62_0._idleName and table.contains(var_62_1.ignore, arg_62_1) then
				return false
			end
		end
	end

	return true
end

function var_0_0.ClearAction(arg_63_0)
	arg_63_0:changeInAction(false)
end

function var_0_0.getSlotAlpha(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_0._skeletonGraphic.Skeleton:FindSlot(arg_64_1)

	if var_64_0 then
		return ReflectionHelp.RefGetProperty(typeof("Spine.Slot"), "A", var_64_0)
	end

	return nil
end

function var_0_0.setSlotAlpha(arg_65_0, arg_65_1, arg_65_2)
	ReflectionHelp.RefSetProperty(typeof("Spine.Slot"), "A", arg_65_1, arg_65_2)
end

function var_0_0.setStepSlotAlpha(arg_66_0, arg_66_1, arg_66_2, arg_66_3)
	if not arg_66_0.slotDic[arg_66_1] then
		arg_66_0.slotDic[arg_66_1] = arg_66_0._skeletonGraphic.Skeleton:FindSlot(arg_66_1)
	end

	if arg_66_0.slotDic[arg_66_1] then
		if not arg_66_3 or arg_66_3 <= 0 then
			print("设置插槽 " .. arg_66_1 .. " alpha = " .. arg_66_2)
			arg_66_0:setSlotAlpha(arg_66_0.slotDic[arg_66_1], arg_66_2)
		else
			local var_66_0 = arg_66_0:getSlotAlpha(arg_66_1)

			table.insert(arg_66_0.stepSlotAlpha, {
				smooth = 0,
				name = arg_66_1,
				slot = arg_66_0.slotDic[arg_66_1],
				current = var_66_0,
				target = arg_66_2,
				time = arg_66_3
			})
		end
	end
end

function var_0_0.getStepSlotAlpha(arg_67_0, arg_67_1)
	for iter_67_0, iter_67_1 in ipairs(arg_67_0.stepSlotAlpha) do
		if iter_67_1.name == arg_67_1 then
			return iter_67_1
		end
	end

	return nil
end

function var_0_0.updateSlotAlpha(arg_68_0)
	for iter_68_0 = #arg_68_0.stepSlotAlpha, 1, -1 do
		local var_68_0 = arg_68_0.stepSlotAlpha[iter_68_0]

		var_68_0.current, var_68_0.smooth = Mathf.SmoothDamp(var_68_0.current, var_68_0.target, var_68_0.smooth, var_68_0.time)

		if math.abs(var_68_0.target - var_68_0.current) <= 0.02 then
			print("设置插槽 " .. var_68_0.name .. " alpha = " .. var_68_0.target)
			arg_68_0:setSlotAlpha(var_68_0.slot, var_68_0.target)

			table.remove(arg_68_0.stepSlotAlpha, iter_68_0).slot = nil
		else
			print("设置插槽 " .. var_68_0.name .. " alpha = " .. var_68_0.current)
			arg_68_0:setSlotAlpha(var_68_0.slot, var_68_0.current)
		end
	end
end

function var_0_0.updateLight(arg_69_0)
	if arg_69_0._lightAnimator and arg_69_0._lightAnimationName and (not arg_69_0._lightValue or math.abs(arg_69_0._lightValue - SpinePaintingConst.painting_lit_value) > 0.001) then
		arg_69_0._lightAnimator:Play(arg_69_0._lightAnimationName, -1, SpinePaintingConst.painting_lit_value)

		arg_69_0._lightValue = SpinePaintingConst.painting_lit_value
	end

	arg_69_0._paintingLitOpening = SpinePaintingConst.painting_lit_opening

	if arg_69_0._paintingLitOpening and arg_69_0.dragDataConfigClient and #arg_69_0.dragDataConfigClient > 0 and not arg_69_0:isInAction() then
		for iter_69_0, iter_69_1 in ipairs(arg_69_0.dragDataConfigClient) do
			if iter_69_1.lit and #iter_69_1.lit > 0 and SpinePaintingConst.painting_lit_value >= iter_69_1.lit[1] and SpinePaintingConst.painting_lit_value <= iter_69_1.lit[2] then
				local var_69_0 = arg_69_0:startDragAction(iter_69_1.hit, not iter_69_1.click)
			end
		end
	end
end

function var_0_0.updateEffectVisible(arg_70_0, arg_70_1)
	if not arg_70_0._effectsTf then
		return
	end

	if isActive(arg_70_0._effectsTf) ~= arg_70_0._effectShowFlag then
		setActive(arg_70_0._effectsTf, arg_70_0._effectShowFlag)
	end

	if arg_70_0.shipEffectActionAble then
		if table.contains(arg_70_0.shipEffectActionAble, arg_70_1) then
			if arg_70_0._effectsTf and isActive(arg_70_0._effectsTf) then
				setActive(arg_70_0._effectsTf, false)
			end

			if arg_70_0._lightEffects and isActive(arg_70_0._lightEffects) then
				setActive(arg_70_0._lightEffects, false)
			end
		else
			if arg_70_0._effectsTf and not isActive(arg_70_0._effectsTf) then
				setActive(arg_70_0._effectsTf, true)
			end

			if arg_70_0._lightEffects and not isActive(arg_70_0._lightEffects) then
				setActive(arg_70_0._lightEffects, true)
			end
		end
	end
end

function var_0_0.isInAction(arg_71_0)
	return arg_71_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_72_0, arg_72_1, arg_72_2, arg_72_3, arg_72_4, arg_72_5)
	if not arg_72_0:checkActionPlayAble(arg_72_1, arg_72_4, arg_72_2) then
		return
	end

	if arg_72_0.mainSpineAnim then
		arg_72_0.mainSpineAnim:SetActionCallBack(nil)
		arg_72_0.mainSpineAnim:SetActionCallBack(function(arg_73_0)
			if arg_73_0 == "finish" and arg_72_3 then
				arg_72_0:changeInAction(false)
				arg_72_3()

				arg_72_3 = nil
			elseif arg_73_0 == "action" and arg_72_5 then
				arg_72_5()

				arg_72_5 = nil
			elseif string.match(arg_73_0, "^bgm_") or string.match(arg_73_0, "^bgmsingle_") then
				if arg_72_0._visible then
					local var_73_0 = string.match(arg_73_0, "^bgm_(.*)$") or string.match(arg_73_0, "^bgmsingle_(.*)$")
					local var_73_1 = string.split(var_73_0, "_")
					local var_73_2 = string.match(arg_73_0, "^bgm_(.*)$") and true or false
					local var_73_3 = "se-skin"
					local var_73_4 = var_73_1[1] .. "_" .. var_73_1[2]
					local var_73_5 = var_73_1[3] and tonumber(var_73_1[3]) or 1

					pg.CriMgr.GetInstance():PlayPaintingBgm(var_73_3, var_73_4, var_73_2, var_73_5, Live2dConst.GetPaintingBgmVolume(arg_72_0._spinePaintingData.ship:getSkinId()))
				end
			elseif string.match(arg_73_0, "^effect_") then
				if string.match(arg_73_0, "^effect_on") then
					arg_72_0._effectShowFlag = false
				elseif string.match(arg_73_0, "^effect_off") then
					arg_72_0._effectShowFlag = true
				end

				arg_72_0:updateEffectVisible(arg_72_1)
				print("change effect " .. tostring(arg_72_0._effectShowFlag))
			elseif string.match(arg_73_0, "^drag_") then
				if string.match(arg_73_0, "^drag_on") then
					arg_72_0._dragPassFlag = false
				elseif string.match(arg_73_0, "^drag_off") then
					arg_72_0._dragPassFlag = true
				end

				print("change drag pass " .. tostring(arg_72_0._dragPassFlag))
			end
		end)
	end

	arg_72_0:SetAction(arg_72_1, arg_72_2, arg_72_4)
end

function var_0_0.SetOnceAction(arg_74_0, arg_74_1, arg_74_2, arg_74_3, arg_74_4)
	if not arg_74_0:checkActionPlayAble(arg_74_1, arg_74_4, 0) then
		return
	end

	arg_74_0:SetActionWithFinishCallback(arg_74_1, 0, function()
		arg_74_0:SetAction(arg_74_0:getIdleName(), 0)

		if arg_74_2 then
			arg_74_2()

			arg_74_2 = nil
		end
	end, arg_74_4, function()
		if arg_74_3 then
			arg_74_3()

			arg_74_3 = nil
		end
	end)
end

function var_0_0.pullInitCallback(arg_77_0, arg_77_1)
	table.insert(arg_77_0._initCallback, arg_77_1)
end

function var_0_0.getAnimationExist(arg_78_0, arg_78_1, arg_78_2)
	local var_78_0

	arg_78_2 = arg_78_2 or arg_78_0._skeletonGraphic

	if arg_78_2 then
		var_78_0 = arg_78_2.Skeleton.Data:FindAnimation(arg_78_1)
	end

	return var_78_0
end

function var_0_0.SetEmptyAction(arg_79_0, arg_79_1)
	if not arg_79_0.spineAnimList then
		return
	end

	for iter_79_0, iter_79_1 in ipairs(arg_79_0.spineAnimList) do
		local var_79_0 = iter_79_1:GetAnimationState()

		if var_79_0 then
			var_79_0:SetEmptyAnimation(arg_79_1, 0)
			GetComponent(iter_79_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.GetSpineTransform(arg_80_0)
	return arg_80_0._tf
end

function var_0_0.SetSkin(arg_81_0, arg_81_1)
	if arg_81_0._skeletonGraphic and arg_81_0._skeletonGraphic.SkeletonData and arg_81_0._skeletonGraphic.SkeletonData:FindSkin(arg_81_1) ~= nil then
		arg_81_0._skeletonGraphic.Skeleton:SetSkin(arg_81_1)
		arg_81_0._skeletonGraphic.Skeleton:SetSlotsToSetupPose()
	end
end

function var_0_0.updateSkeletonGraphicTime(arg_82_0)
	if arg_82_0._skeletonGraphic then
		arg_82_0._skeletonGraphic:Update(Time.deltaTime)
	end
end

function var_0_0.getMultipFaceAction(arg_83_0, arg_83_1)
	if arg_83_0.multipleFaceFlag then
		local var_83_0 = tonumber(arg_83_1)

		if var_83_0 and var_83_0 >= 0 then
			for iter_83_0, iter_83_1 in ipairs(arg_83_0.multipleFaceData) do
				if iter_83_1[1] == arg_83_0:getIdleName() then
					return tostring(var_83_0 + iter_83_1[2])
				end
			end
		end
	end

	return arg_83_1
end

function var_0_0.unloadCueSheet(arg_84_0)
	if not arg_84_0.loadSheets then
		return
	end

	for iter_84_0, iter_84_1 in ipairs(arg_84_0.loadSheets) do
		pg.CriMgr.GetInstance():UnloadCueSheet(iter_84_1)
	end

	arg_84_0.loadSheets = {}
end

function var_0_0.Dispose(arg_85_0)
	arg_85_0._isDisposed = true
	arg_85_0._materialDic = {}

	if arg_85_0.updateLocal then
		arg_85_0._skeletonGraphic.UpdateLocal = arg_85_0._skeletonGraphic.UpdateLocal - arg_85_0.updateLocal
		arg_85_0.updateLocal = nil
	end

	if arg_85_0._spinePaintingData then
		arg_85_0._spinePaintingData:Clear()
	end

	for iter_85_0, iter_85_1 in pairs(arg_85_0._loadSpineDic) do
		PoolMgr.GetInstance():ReturnSpinePainting(iter_85_0, iter_85_1)
	end

	for iter_85_2, iter_85_3 in pairs(arg_85_0._loadUIDic) do
		PoolMgr.GetInstance():ReturnUI(iter_85_2, iter_85_3)
	end

	arg_85_0._loadSpineDic = {}
	arg_85_0._loadUIDic = {}

	arg_85_0:unloadCueSheet()

	if arg_85_0._go ~= nil then
		var_0_1.Destroy(arg_85_0._go)
	end

	if arg_85_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_85_0._bgEffectGo)
	end

	arg_85_0._go = nil
	arg_85_0._tf = nil
	arg_85_0._bgEffectGo = nil
	arg_85_0._bgEffectTf = nil

	if arg_85_0.spineAnim then
		arg_85_0.spineAnim:SetActionCallBack(nil)
	end

	if arg_85_0._slotAlphaTimer and arg_85_0._slotAlphaTimer.running then
		arg_85_0._slotAlphaTimer:Stop()
	end

	arg_85_0._slotAlphaTimer = nil

	if arg_85_0.stepSlotAlpha and #arg_85_0.stepSlotAlpha > 0 then
		for iter_85_4, iter_85_5 in ipairs(arg_85_0.stepSlotAlpha) do
			iter_85_5.slot = nil
		end

		arg_85_0.stepSlotAlpha = {}
	end
end

function var_0_0.getPaintingName(arg_86_0)
	return arg_86_0._spinePaintingData:GetShipName()
end

return var_0_0
