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

		onNextTick(function()
			local var_14_0 = arg_8_0._pendingVisible ~= false

			arg_8_0._pendingVisible = nil
			arg_8_0._visibleReady = true

			arg_8_0:applyVisible(var_14_0)

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
	if arg_25_0._isDisposed then
		return
	end

	if not arg_25_0._visibleReady then
		arg_25_0._pendingVisible = arg_25_1

		return
	end

	arg_25_0:applyVisible(arg_25_1)
end

function var_0_0.applyVisible(arg_26_0, arg_26_1)
	if arg_26_0._isDisposed then
		return
	end

	if arg_26_1 then
		arg_26_0._tf.localPosition = arg_26_0._spinePaintingData.pos
	else
		arg_26_0._tf.localPosition = Vector2(100000, 0)
	end

	if not arg_26_1 and arg_26_0.dragDataConfigClient then
		local var_26_0 = arg_26_0:getIdleName()

		for iter_26_0, iter_26_1 in ipairs(arg_26_0.dragDataConfigClient) do
			if iter_26_1.idle == var_26_0 and iter_26_1.lit_start and iter_26_1.lit_start >= 0 then
				SpinePaintingConst.painting_lit_value = iter_26_1.lit_start

				if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 then
					SpinePaintingDrag.SetPaintingLite(arg_26_0._spinePaintingData:GetShipName(), arg_26_0._spinePaintingData:GetShipId(), SpinePaintingConst.painting_lit_value)
				else
					SpinePaintingDrag.SetPaintingLite(arg_26_0._spinePaintingData:GetShipName(), arg_26_0._spinePaintingData:GetShipId(), 0)
				end
			end
		end
	end

	SpinePaintingConst.spine_painting_action = false

	if arg_26_1 then
		if arg_26_0._slotAlphaTimer and not arg_26_0._slotAlphaTimer.running then
			arg_26_0._slotAlphaTimer:Start()
		end
	elseif arg_26_0._slotAlphaTimer and arg_26_0._slotAlphaTimer.running then
		arg_26_0._slotAlphaTimer:Stop()
	end

	arg_26_0._visible = arg_26_1

	local function var_26_1()
		if arg_26_0._isDisposed then
			return
		end

		if arg_26_0._lightTf then
			setActive(arg_26_0._lightTf, arg_26_0._visible)
		end

		if arg_26_0._spinePaintingData.effectParent then
			setActive(arg_26_0._spinePaintingData.effectParent, arg_26_0._visible)
		end

		pg.ViewUtils.SetLayer(arg_26_0._tf, arg_26_0._visible and Layer.UI or Layer.UIHidden)
		setActiveViaLayer(arg_26_0._spinePaintingData.effectParent, arg_26_0._visible)

		arg_26_0._lightValue = nil
		arg_26_0._effectShowFlag = true
		arg_26_0._dragPassFlag = true

		if arg_26_0._skeletonGraphic then
			arg_26_0._skeletonGraphic.timeScale = arg_26_0._visible and 1 or 0
		end

		if not arg_26_0._visible then
			arg_26_0.mainSpineAnim:SetActionCallBack(nil)
			arg_26_0:changeInAction(false)

			arg_26_0.clickActionList = {}

			if LeanTween.isTweening(go(arg_26_0._tf)) then
				LeanTween.cancel(go(arg_26_0._tf))
			end

			if arg_26_0._baseShader then
				if arg_26_0._skeletonGraphic then
					arg_26_0._skeletonGraphic.material.shader = arg_26_0._baseShader
				end

				arg_26_0._baseShader = nil
			end

			arg_26_0._displayWord = false
		else
			arg_26_0._skeletonGraphic:Update(Time.deltaTime)
		end

		arg_26_0:playPaintingInitIdle()
		arg_26_0:playPaintingInitSkin()
		arg_26_0:updateLink()

		if not arg_26_1 then
			arg_26_0:unloadCueSheet()
			pg.CriMgr.GetInstance():DisposePaintingBgm()
		end
	end

	onNextTick(var_26_1)
end

function var_0_0.playPaintingInitIdle(arg_28_0)
	local var_28_0 = SpinePaintingDrag.GetPaintingInitIdle(arg_28_0.mainSpineAnim.name, arg_28_0._spinePaintingData.ship.id)
	local var_28_1 = arg_28_0:getNormalIdleName()

	if var_28_0 then
		local var_28_2 = PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1)

		if var_28_2 == 1 and arg_28_0._idleName ~= var_28_0 then
			var_28_1 = var_28_0
		elseif var_28_2 ~= 1 and arg_28_0._idleName ~= arg_28_0:getNormalIdleName() then
			var_28_1 = arg_28_0:getNormalIdleName()
		end
	else
		var_28_1 = arg_28_0:getNormalIdleName()
	end

	if var_28_1 then
		arg_28_0:setIdleName(var_28_1)
		arg_28_0:SetActionWithFinishCallback(arg_28_0._idleName, 0, nil, true, nil)
		arg_28_0:changeInAction(false)
	end
end

function var_0_0.changeInAction(arg_29_0, arg_29_1)
	arg_29_0.inAction = arg_29_1
	SpinePaintingConst.spine_painting_action = arg_29_1

	if SpinePaintingConst.painting_lit_action_callback then
		SpinePaintingConst.painting_lit_action_callback(arg_29_1)
	end
end

function var_0_0.playPaintingInitSkin(arg_30_0)
	local var_30_0 = SpinePaintingDrag.GetPaintingInitSkin(arg_30_0.mainSpineAnim.name, arg_30_0._spinePaintingData.ship.id)
	local var_30_1 = arg_30_0:GetDefaultSkeletonSkin()

	if var_30_0 then
		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_30_0:GetDefaultSkeletonSkin() ~= var_30_0 then
			var_30_1 = var_30_0
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_30_0._skeletonSkin ~= arg_30_0:GetDefaultSkeletonSkin() then
			var_30_1 = arg_30_0:GetDefaultSkeletonSkin()
		end
	else
		var_30_1 = arg_30_0:GetDefaultSkeletonSkin()
	end

	if var_30_1 then
		if arg_30_0._skeletonGraphic and arg_30_0._skeletonGraphic.SkeletonData then
			if arg_30_0._skeletonGraphic.SkeletonData:FindSkin(var_30_1) ~= nil then
				arg_30_0:SetSkeletonSkin(var_30_1)
			elseif arg_30_0._skeletonGraphic.SkeletonData:FindSkin("default") ~= nil then
				arg_30_0:SetSkeletonSkin("default")
			end
		end
	else
		arg_30_0:SetDefaultSkeletonSkin()
	end
end

function var_0_0.getIdleName(arg_31_0)
	return arg_31_0._idleName
end

function var_0_0.setIdleName(arg_32_0, arg_32_1)
	arg_32_0._idleName = arg_32_1

	arg_32_0:updateHitArea()
end

function var_0_0.getReplaceWord(arg_33_0)
	if arg_33_0.replaceWord and table.contains(arg_33_0.replaceWord, arg_33_0._idleName) then
		return true
	end

	return false
end

function var_0_0.updateHitArea(arg_34_0)
	if arg_34_0.dragShipFlag then
		local var_34_0 = arg_34_0.shipDragData.drag_data.type
		local var_34_1 = arg_34_0.shipDragData.drag_data.config_client

		if var_34_0 == SpinePaintingConst.drag_type_normal then
			for iter_34_0 = 1, #var_34_1 do
				local var_34_2 = var_34_1[iter_34_0]
				local var_34_3 = var_34_2.hit
				local var_34_4 = var_34_2.active

				if var_34_3 and not var_34_4 then
					local var_34_5 = findTF(arg_34_0._tf, "hitArea/" .. var_34_3)

					if var_34_5 then
						local var_34_6 = true
						local var_34_7 = true

						if var_34_2.idle and type(var_34_2.idle) == "string" then
							var_34_6 = var_34_2.idle == arg_34_0._idleName
						elseif var_34_2.idle and type(var_34_2.idle) == "table" then
							var_34_6 = table.contains(var_34_2.idle, arg_34_0._idleName)
						end

						if var_34_2.skin and type(var_34_2.skin) == "string" then
							var_34_7 = var_34_2.skin == arg_34_0._skeletonSkin
						elseif var_34_2.skin and type(var_34_2.skin) == "table" then
							var_34_7 = table.contains(var_34_2.skin, arg_34_0._skeletonSkin)
						end

						setActive(var_34_5, var_34_6 and var_34_7)
					else
						print("hit area " .. var_34_3 .. "is not exist")
					end
				end
			end
		end
	end
end

function var_0_0.checkListAction(arg_35_0)
	if #arg_35_0.clickActionList > 0 then
		local var_35_0 = table.remove(arg_35_0.clickActionList, 1)

		arg_35_0:SetActionWithFinishCallback(var_35_0, 0, function()
			arg_35_0:checkListAction()
		end, true)
	else
		arg_35_0:SetAction(arg_35_0:getNormalIdleName(), 0, true)
		arg_35_0:changeInAction(false)
	end
end

function var_0_0.displayWord(arg_37_0, arg_37_1)
	arg_37_0._displayWord = arg_37_1
end

function var_0_0.readyDragAction(arg_38_0, arg_38_1, arg_38_2)
	if arg_38_0.inAction or arg_38_0._displayWord then
		return false
	end

	if arg_38_0.dragShipFlag then
		return arg_38_0:startDragAction(arg_38_1, arg_38_2)
	end

	return false
end

function var_0_0.SetSkeletonSkin(arg_39_0, arg_39_1)
	arg_39_0._skeletonSkin = arg_39_1

	arg_39_0:SetSkin(arg_39_1)
	arg_39_0:updateSkeletonGraphicTime()
	arg_39_0:updateHitArea()
end

function var_0_0.SetDefaultSkeletonSkin(arg_40_0)
	arg_40_0:SetSkeletonSkin(arg_40_0:GetDefaultSkeletonSkin())
end

function var_0_0.GetDefaultSkeletonSkin(arg_41_0)
	local var_41_0 = arg_41_0._spinePaintingData:GetShipSkinConfig().skeleton_default_skin

	if not var_41_0 or var_41_0 == "" then
		var_41_0 = arg_41_0._skeletonGraphic.SkeletonData:FindSkin("1") and "1" or "default"
	end

	return var_41_0
end

function var_0_0.startDragAction(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = arg_42_0.shipDragData.drag_data
	local var_42_1 = var_42_0.type

	if var_42_1 == SpinePaintingConst.drag_type_normal then
		return arg_42_0:changePaintingNormal(var_42_0, arg_42_1, arg_42_2)
	elseif var_42_1 == SpinePaintingConst.drag_type_list then
		arg_42_0.clickActionList = Clone(var_42_0.config_client)

		return arg_42_0:checkListAction()
	end

	return false
end

function var_0_0.GetDragDataConfig(arg_43_0, arg_43_1)
	if arg_43_0.shipDragData then
		return arg_43_0.shipDragData[arg_43_1]
	end

	return nil
end

function var_0_0.setEventTriggerCallback(arg_44_0, arg_44_1)
	arg_44_0._eventTriggerCall = arg_44_1
end

function var_0_0.changePaintingNormal(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	local var_45_0 = arg_45_1.config_client
	local var_45_1 = arg_45_1.type

	for iter_45_0, iter_45_1 in ipairs(var_45_0) do
		if arg_45_0:matchDragFlag(arg_45_2, iter_45_1, arg_45_3) then
			return arg_45_0:doDragAction(var_45_1, arg_45_1, iter_45_1, arg_45_3)
		end
	end

	return false
end

function var_0_0.doDragAction(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	local var_46_0 = arg_46_3.fold
	local var_46_1 = arg_46_3.fold_chat and arg_46_3.fold_chat or nil
	local var_46_2 = arg_46_3.effect_hide
	local var_46_3 = arg_46_3.action_cv
	local var_46_4 = arg_46_3.finish_cv
	local var_46_5 = arg_46_3.alpha_data and arg_46_3.alpha_data or nil
	local var_46_6 = arg_46_3.skin_change and arg_46_3.skin_change or nil
	local var_46_7 = arg_46_3.clear_track and arg_46_3.clear_track or nil
	local var_46_8 = arg_46_3.idle and arg_46_3.idle or nil
	local var_46_9 = arg_46_3.change_idle
	local var_46_10 = arg_46_3.action
	local var_46_11 = arg_46_3.event
	local var_46_12 = var_46_6
	local var_46_13
	local var_46_14
	local var_46_15

	if type(var_46_9) == "table" and type(var_46_10) == "table" then
		local var_46_16 = math.random(1, #var_46_10)

		var_46_13 = var_46_10[var_46_16]
		var_46_15 = var_46_9[var_46_16]
	elseif type(var_46_8) == "table" and type(var_46_10) == "table" then
		local var_46_17 = table.indexof(var_46_8, arg_46_0:getIdleName())

		var_46_13 = var_46_10[var_46_17]

		if type(var_46_9) == "table" then
			var_46_15 = var_46_9[var_46_17]
		end
	end

	if not var_46_13 then
		if type(var_46_10) == "string" then
			var_46_13 = var_46_10
		elseif type(var_46_10) == "table" then
			var_46_13 = var_46_10[math.random(1, #var_46_10)]
		end
	end

	if not var_46_15 then
		if type(var_46_9) == "string" then
			var_46_15 = var_46_9
		elseif type(var_46_9) == "table" then
			var_46_15 = var_46_9[math.random(1, #var_46_9)]
		end
	end

	if not var_46_14 then
		if type(var_46_11) == "string" then
			var_46_14 = var_46_11
		elseif type(var_46_11) == "table" then
			var_46_14 = var_46_11[math.random(1, #var_46_11)]
		end
	end

	if arg_46_1 == SpinePaintingConst.drag_type_normal then
		if var_46_5 and #var_46_5 > 0 then
			arg_46_0:SetAlphaData(var_46_5)
		end

		local var_46_18 = arg_46_3.material and arg_46_3.material or nil
		local var_46_19 = arg_46_3.material_time and arg_46_3.material_time or nil

		if var_46_18 then
			if LeanTween.isTweening(go(arg_46_0._tf)) then
				return false
			end

			arg_46_0:getSpineMaterial(var_46_18, function(arg_47_0)
				arg_46_0._skeletonGraphic.material = arg_47_0

				if var_46_19 then
					LeanTween.delayedCall(go(arg_46_0._tf), var_46_19, System.Action(function()
						arg_46_0._skeletonGraphic.material = arg_46_0._baseMaterial

						arg_46_0:changePaintingIdle(var_46_15)
					end))
				end
			end)
		end

		if var_46_7 and #var_46_7 > 0 then
			for iter_46_0, iter_46_1 in ipairs(var_46_7) do
				arg_46_0:SetEmptyAction(iter_46_1)
			end
		end

		if var_46_13 and var_46_13 ~= "" and arg_46_0:checkActionPlayAble(var_46_13, false, 0) then
			print("播放动作 .." .. var_46_13 .. "下一个待机动作 .. " .. var_46_15)

			if var_46_0 then
				pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, {
					flag = true,
					content = {
						chat = var_46_1
					}
				})
			end

			arg_46_0:setEffectVisible(var_46_2, false)
			arg_46_0:SetActionWithFinishCallback(var_46_13, 0, function()
				if var_46_12 and var_46_12 ~= "" then
					arg_46_0:changeSkeletonSkin(var_46_12)
				end

				if var_46_0 then
					pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, {
						flag = false,
						content = {
							chat = var_46_1
						}
					})
				end

				arg_46_0:changePaintingIdle(var_46_15 and var_46_15 or arg_46_0:getIdleName())
				arg_46_0:setEffectVisible(var_46_2, true)

				if var_46_4 and var_46_4 ~= "" then
					arg_46_0:PlayCv(var_46_4)
				end
			end, false, function()
				if var_46_3 and var_46_3 ~= "" then
					arg_46_0:PlayCv(var_46_3)
				end

				if var_46_14 and type(var_46_14) == "string" and arg_46_0._eventTriggerCall then
					arg_46_0._eventTriggerCall(var_46_14)
				end
			end)
		end

		if not var_46_13 or var_46_13 == "" then
			if var_46_12 and var_46_12 ~= "" then
				arg_46_0:changeSkeletonSkin(var_46_12)
			end

			if var_46_15 and var_46_15 ~= "" then
				arg_46_0:changePaintingIdle(var_46_15)
			end

			if var_46_14 and type(var_46_14) == "string" and arg_46_0._eventTriggerCall then
				arg_46_0._eventTriggerCall(var_46_14)
			end

			return false
		end
	end

	return true
end

function var_0_0.SetAlphaData(arg_51_0, arg_51_1)
	for iter_51_0, iter_51_1 in ipairs(arg_51_1) do
		local var_51_0 = iter_51_1[1]
		local var_51_1 = iter_51_1[2]
		local var_51_2 = iter_51_1[3]
		local var_51_3 = arg_51_0:getSlotAlpha(var_51_0)

		if not arg_51_0:getStepSlotAlpha(var_51_0) and var_51_3 then
			local var_51_4
			local var_51_5

			for iter_51_2, iter_51_3 in ipairs(var_51_1) do
				if math.abs(var_51_3 - iter_51_3) <= 0.1 then
					var_51_5 = iter_51_2 + 1
				end

				if var_51_5 == iter_51_2 then
					var_51_4 = iter_51_3
				end
			end

			var_51_4 = var_51_4 or var_51_1[1]

			if var_51_4 then
				arg_51_0:setStepSlotAlpha(var_51_0, var_51_4, var_51_2)
			end
		end
	end
end

function var_0_0.PlayCv(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0._spinePaintingData.ship:getSkinId()
	local var_52_1 = pg.CriMgr.GetCVBankName(ShipWordHelper.RawGetCVKey(var_52_0))
	local var_52_2 = pg.ship_skin_template[var_52_0].group_index
	local var_52_3 = arg_52_1 .. "_" .. var_52_2

	print("try playing cv" .. var_52_1 .. ":" .. var_52_3)
	pg.CriMgr.GetInstance():playCueSheetVoice(var_52_1, var_52_3, true, function(arg_53_0)
		if arg_53_0 then
			print("播放的语音长度为 = " .. arg_53_0:GetLength())
		end
	end)
end

function var_0_0.changeSkeletonSkin(arg_54_0, arg_54_1)
	if arg_54_0._skeletonSkin == arg_54_1 then
		arg_54_0:SetDefaultSkeletonSkin()
	else
		arg_54_0:SetSkeletonSkin(arg_54_1)
	end

	SpinePaintingDrag.SetPaintingInitSkin(arg_54_0.mainSpineAnim.name, arg_54_0._spinePaintingData.ship.id, arg_54_0._skeletonSkin)
end

function var_0_0.setEffectVisible(arg_55_0, arg_55_1, arg_55_2)
	if not arg_55_1 or #arg_55_1 == 0 then
		return
	end

	for iter_55_0 = 1, #arg_55_1 do
		local var_55_0 = findTF(arg_55_0._tf, arg_55_1[iter_55_0])

		if var_55_0 then
			setActive(var_55_0, arg_55_2)
		end
	end
end

function var_0_0.matchDragFlag(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
	local var_56_0 = arg_56_2.hit

	if var_56_0 and var_56_0 ~= arg_56_1 then
		return false
	end

	local var_56_1 = arg_56_2.skin

	if var_56_1 and var_56_1 ~= "" and arg_56_0._skeletonSkin ~= var_56_1 then
		return false
	end

	local var_56_2 = arg_56_2.idle

	if var_56_2 and type(var_56_2) == "string" and arg_56_0:getIdleName() ~= var_56_2 then
		return false
	elseif var_56_2 and type(var_56_2) == "table" and not table.contains(var_56_2, arg_56_0:getIdleName()) then
		return false
	end

	local var_56_3 = arg_56_2.favor

	if var_56_3 and var_56_3 >= 0 then
		local var_56_4 = arg_56_0._spinePaintingData.ship:getCVIntimacy()

		if var_56_4 and var_56_4 < var_56_3 then
			return false
		end
	end

	if arg_56_2.click and arg_56_2.click == tobool(arg_56_3) then
		return false
	end

	return true
end

function var_0_0.OnDragMove(arg_57_0, arg_57_1, arg_57_2)
	return
end

function var_0_0.getSpineMaterial(arg_58_0, arg_58_1, arg_58_2)
	if not arg_58_0._materialDic then
		arg_58_0._materialDic = {}
	end

	if arg_58_0._materialDic[arg_58_1] then
		arg_58_2(arg_58_0._materialDic[arg_58_1])
	else
		arg_58_0._materialDic[arg_58_1] = LoadAny("spinematerials", arg_58_1, typeof(Material))

		arg_58_2(arg_58_0._materialDic[arg_58_1])
	end
end

function var_0_0.changePaintingIdle(arg_59_0, arg_59_1)
	arg_59_0:setIdleName(arg_59_1)
	arg_59_0:SetAction(arg_59_1, 0, true)
	SpinePaintingDrag.SetPaintingInitIdle(arg_59_0.mainSpineAnim.name, arg_59_0._spinePaintingData.ship.id, arg_59_1)
	arg_59_0:changeInAction(false)
end

function var_0_0.SetShopHx(arg_60_0, arg_60_1)
	if arg_60_1 and HXSet.isHx() then
		if arg_60_0:getAnimationExist("shop_hx", arg_60_0._skeletonGraphic) then
			arg_60_0:setIdleName("shop_hx")
			arg_60_0:SetAction(arg_60_0._idleName, 0, true)

			local var_60_0 = arg_60_0._tf.anchoredPosition

			arg_60_0._tf.localPosition = Vector2(100000, 0)

			arg_60_0:updateSkeletonGraphicTime()
			onDelayTick(function()
				arg_60_0._tf.localPosition = arg_60_0._spinePaintingData.pos
			end, 0.05)
		end
	else
		arg_60_0:setIdleName(arg_60_0:getNormalIdleName())
		arg_60_0:SetAction(arg_60_0._idleName, 0, true)
	end
end

function var_0_0.SetAction(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	if not arg_62_0:checkActionPlayAble(arg_62_1, arg_62_3, arg_62_2) then
		return false
	end

	if arg_62_2 and arg_62_2 == 0 then
		arg_62_0.lastPlayAction = arg_62_1
	end

	if arg_62_2 == 0 and arg_62_1 ~= arg_62_0:getIdleName() then
		arg_62_0:changeInAction(true)
	end

	if arg_62_0.multipleFaceFlag and not arg_62_0.inAction then
		arg_62_1 = arg_62_0:getMultipFaceAction(arg_62_1)
	end

	local var_62_0 = arg_62_0._spinePaintingData.ship:getSkinId()
	local var_62_1 = pg.ship_skin_template[var_62_0].voice_lang

	if arg_62_2 == 0 and var_62_1 and #var_62_1 > 0 then
		local var_62_2 = ShipWordHelper.GetLanguageSetting(var_62_0)

		if var_62_2 <= 0 then
			var_62_2 = 1
		end

		local var_62_3 = var_62_1[var_62_2]
		local var_62_4 = arg_62_0:GetVoiceLandAction(arg_62_1, var_62_3)

		if arg_62_0:getAnimationExist(var_62_4, arg_62_0._skeletonGraphic) then
			arg_62_1 = var_62_4
		end
	end

	arg_62_0:updateEffectVisible(arg_62_1)

	if HXSet.isHx() and arg_62_0:getAnimationExist(arg_62_1 .. "_hx") then
		arg_62_1 = arg_62_1 .. "_hx"
	elseif HXSet.isHx() and arg_62_0:getAnimationExist("hx/" .. arg_62_1 .. "_hx") then
		arg_62_1 = "hx/" .. arg_62_1 .. "_hx"
	end

	for iter_62_0, iter_62_1 in ipairs(arg_62_0.spineAnimList) do
		local var_62_5 = iter_62_1:GetComponent("SkeletonGraphic")

		if arg_62_0:getAnimationExist(arg_62_1, var_62_5) then
			iter_62_1:SetAction(arg_62_1, arg_62_2)
		end

		if iter_62_1:GetAnimationState() then
			GetComponent(iter_62_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end

	return true
end

function var_0_0.GetVoiceLandAction(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = ""

	if arg_63_2 == ShipSkin.VOICE_LANG_JP then
		var_63_0 = "_jp"
	elseif arg_63_2 == ShipSkin.VOICE_LANG_CN then
		var_63_0 = "_cn"
	end

	return arg_63_1 .. var_63_0
end

function var_0_0.checkActionPlayAble(arg_64_0, arg_64_1, arg_64_2, arg_64_3)
	if arg_64_3 and arg_64_3 == 0 and arg_64_0.inAction and not arg_64_2 then
		return false
	end

	if arg_64_0.lockLayer and not arg_64_2 and arg_64_0.inAction and arg_64_3 and arg_64_3 > 0 then
		return false
	end

	if arg_64_0.lastPlayAction and arg_64_0.lastPlayAction ~= arg_64_0._idleName and arg_64_3 and arg_64_3 > 0 then
		return false
	end

	if arg_64_0._idleName ~= arg_64_0:getNormalIdleName() and arg_64_1 == "login" then
		return false
	end

	if not arg_64_0._dragPassFlag then
		return false
	end

	if arg_64_0.dragShipFlag and arg_64_0.shipDragData.action_enable then
		local var_64_0 = arg_64_0.shipDragData.action_enable

		for iter_64_0 = 1, #var_64_0 do
			local var_64_1 = var_64_0[iter_64_0]

			if var_64_1.name == arg_64_0._idleName and table.contains(var_64_1.ignore, arg_64_1) then
				return false
			end
		end
	end

	return true
end

function var_0_0.ClearAction(arg_65_0)
	arg_65_0:changeInAction(false)
end

function var_0_0.getSlotAlpha(arg_66_0, arg_66_1)
	local var_66_0 = arg_66_0._skeletonGraphic.Skeleton:FindSlot(arg_66_1)

	if var_66_0 then
		return ReflectionHelp.RefGetProperty(typeof("Spine.Slot"), "A", var_66_0)
	end

	return nil
end

function var_0_0.setSlotAlpha(arg_67_0, arg_67_1, arg_67_2)
	ReflectionHelp.RefSetProperty(typeof("Spine.Slot"), "A", arg_67_1, arg_67_2)
end

function var_0_0.setStepSlotAlpha(arg_68_0, arg_68_1, arg_68_2, arg_68_3)
	if not arg_68_0.slotDic[arg_68_1] then
		arg_68_0.slotDic[arg_68_1] = arg_68_0._skeletonGraphic.Skeleton:FindSlot(arg_68_1)
	end

	if arg_68_0.slotDic[arg_68_1] then
		if not arg_68_3 or arg_68_3 <= 0 then
			print("设置插槽 " .. arg_68_1 .. " alpha = " .. arg_68_2)
			arg_68_0:setSlotAlpha(arg_68_0.slotDic[arg_68_1], arg_68_2)
		else
			local var_68_0 = arg_68_0:getSlotAlpha(arg_68_1)

			table.insert(arg_68_0.stepSlotAlpha, {
				smooth = 0,
				name = arg_68_1,
				slot = arg_68_0.slotDic[arg_68_1],
				current = var_68_0,
				target = arg_68_2,
				time = arg_68_3
			})
		end
	end
end

function var_0_0.getStepSlotAlpha(arg_69_0, arg_69_1)
	for iter_69_0, iter_69_1 in ipairs(arg_69_0.stepSlotAlpha) do
		if iter_69_1.name == arg_69_1 then
			return iter_69_1
		end
	end

	return nil
end

function var_0_0.updateSlotAlpha(arg_70_0)
	for iter_70_0 = #arg_70_0.stepSlotAlpha, 1, -1 do
		local var_70_0 = arg_70_0.stepSlotAlpha[iter_70_0]

		var_70_0.current, var_70_0.smooth = Mathf.SmoothDamp(var_70_0.current, var_70_0.target, var_70_0.smooth, var_70_0.time)

		if math.abs(var_70_0.target - var_70_0.current) <= 0.02 then
			print("设置插槽 " .. var_70_0.name .. " alpha = " .. var_70_0.target)
			arg_70_0:setSlotAlpha(var_70_0.slot, var_70_0.target)

			table.remove(arg_70_0.stepSlotAlpha, iter_70_0).slot = nil
		else
			print("设置插槽 " .. var_70_0.name .. " alpha = " .. var_70_0.current)
			arg_70_0:setSlotAlpha(var_70_0.slot, var_70_0.current)
		end
	end
end

function var_0_0.updateLight(arg_71_0)
	if arg_71_0._lightAnimator and arg_71_0._lightAnimationName and (not arg_71_0._lightValue or math.abs(arg_71_0._lightValue - SpinePaintingConst.painting_lit_value) > 0.001) then
		arg_71_0._lightAnimator:Play(arg_71_0._lightAnimationName, -1, SpinePaintingConst.painting_lit_value)

		arg_71_0._lightValue = SpinePaintingConst.painting_lit_value
	end

	arg_71_0._paintingLitOpening = SpinePaintingConst.painting_lit_opening

	if arg_71_0._paintingLitOpening and arg_71_0.dragDataConfigClient and #arg_71_0.dragDataConfigClient > 0 and not arg_71_0:isInAction() then
		for iter_71_0, iter_71_1 in ipairs(arg_71_0.dragDataConfigClient) do
			if iter_71_1.lit and #iter_71_1.lit > 0 and SpinePaintingConst.painting_lit_value >= iter_71_1.lit[1] and SpinePaintingConst.painting_lit_value <= iter_71_1.lit[2] then
				local var_71_0 = arg_71_0:startDragAction(iter_71_1.hit, not iter_71_1.click)
			end
		end
	end
end

function var_0_0.updateEffectVisible(arg_72_0, arg_72_1)
	if not arg_72_0._effectsTf then
		return
	end

	if isActive(arg_72_0._effectsTf) ~= arg_72_0._effectShowFlag then
		setActive(arg_72_0._effectsTf, arg_72_0._effectShowFlag)
	end

	if arg_72_0.shipEffectActionAble then
		if table.contains(arg_72_0.shipEffectActionAble, arg_72_1) then
			if arg_72_0._effectsTf and isActive(arg_72_0._effectsTf) then
				setActive(arg_72_0._effectsTf, false)
			end

			if arg_72_0._lightEffects and isActive(arg_72_0._lightEffects) then
				setActive(arg_72_0._lightEffects, false)
			end
		else
			if arg_72_0._effectsTf and not isActive(arg_72_0._effectsTf) then
				setActive(arg_72_0._effectsTf, true)
			end

			if arg_72_0._lightEffects and not isActive(arg_72_0._lightEffects) then
				setActive(arg_72_0._lightEffects, true)
			end
		end
	end
end

function var_0_0.isInAction(arg_73_0)
	return arg_73_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_74_0, arg_74_1, arg_74_2, arg_74_3, arg_74_4, arg_74_5)
	if not arg_74_0:checkActionPlayAble(arg_74_1, arg_74_4, arg_74_2) then
		return
	end

	if arg_74_0.mainSpineAnim then
		arg_74_0.mainSpineAnim:SetActionCallBack(nil)
		arg_74_0.mainSpineAnim:SetActionCallBack(function(arg_75_0)
			if arg_75_0 == "finish" and arg_74_3 then
				arg_74_0:changeInAction(false)
				arg_74_3()

				arg_74_3 = nil
			elseif arg_75_0 == "action" and arg_74_5 then
				arg_74_5()

				arg_74_5 = nil
			elseif string.match(arg_75_0, "^bgm_") or string.match(arg_75_0, "^bgmsingle_") then
				if arg_74_0._visible then
					local var_75_0 = string.match(arg_75_0, "^bgm_(.*)$") or string.match(arg_75_0, "^bgmsingle_(.*)$")
					local var_75_1 = string.split(var_75_0, "_")
					local var_75_2 = string.match(arg_75_0, "^bgm_(.*)$") and true or false
					local var_75_3 = "se-skin"
					local var_75_4 = var_75_1[1] .. "_" .. var_75_1[2]
					local var_75_5 = var_75_1[3] and tonumber(var_75_1[3]) or 1

					pg.CriMgr.GetInstance():PlayPaintingBgm(var_75_3, var_75_4, var_75_2, var_75_5, Live2dConst.GetPaintingBgmVolume(arg_74_0._spinePaintingData.ship:getSkinId()))
				end
			elseif string.match(arg_75_0, "^effect_") then
				if string.match(arg_75_0, "^effect_on") then
					arg_74_0._effectShowFlag = false
				elseif string.match(arg_75_0, "^effect_off") then
					arg_74_0._effectShowFlag = true
				end

				arg_74_0:updateEffectVisible(arg_74_1)
				print("change effect " .. tostring(arg_74_0._effectShowFlag))
			elseif string.match(arg_75_0, "^drag_") then
				if string.match(arg_75_0, "^drag_on") then
					arg_74_0._dragPassFlag = false
				elseif string.match(arg_75_0, "^drag_off") then
					arg_74_0._dragPassFlag = true
				end

				print("change drag pass " .. tostring(arg_74_0._dragPassFlag))
			end
		end)
	end

	arg_74_0:SetAction(arg_74_1, arg_74_2, arg_74_4)
end

function var_0_0.SetOnceAction(arg_76_0, arg_76_1, arg_76_2, arg_76_3, arg_76_4)
	if not arg_76_0:checkActionPlayAble(arg_76_1, arg_76_4, 0) then
		return
	end

	arg_76_0:SetActionWithFinishCallback(arg_76_1, 0, function()
		arg_76_0:SetAction(arg_76_0:getIdleName(), 0)

		if arg_76_2 then
			arg_76_2()

			arg_76_2 = nil
		end
	end, arg_76_4, function()
		if arg_76_3 then
			arg_76_3()

			arg_76_3 = nil
		end
	end)
end

function var_0_0.pullInitCallback(arg_79_0, arg_79_1)
	table.insert(arg_79_0._initCallback, arg_79_1)
end

function var_0_0.getAnimationExist(arg_80_0, arg_80_1, arg_80_2)
	local var_80_0

	arg_80_2 = arg_80_2 or arg_80_0._skeletonGraphic

	if arg_80_2 then
		var_80_0 = arg_80_2.Skeleton.Data:FindAnimation(arg_80_1)
	end

	return var_80_0
end

function var_0_0.SetEmptyAction(arg_81_0, arg_81_1)
	if not arg_81_0.spineAnimList then
		return
	end

	for iter_81_0, iter_81_1 in ipairs(arg_81_0.spineAnimList) do
		local var_81_0 = iter_81_1:GetAnimationState()

		if var_81_0 then
			var_81_0:SetEmptyAnimation(arg_81_1, 0)
			GetComponent(iter_81_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.GetSpineTransform(arg_82_0)
	return arg_82_0._tf
end

function var_0_0.SetSkin(arg_83_0, arg_83_1)
	if arg_83_0._skeletonGraphic and arg_83_0._skeletonGraphic.SkeletonData and arg_83_0._skeletonGraphic.SkeletonData:FindSkin(arg_83_1) ~= nil then
		arg_83_0._skeletonGraphic.Skeleton:SetSkin(arg_83_1)
		arg_83_0._skeletonGraphic.Skeleton:SetSlotsToSetupPose()
	end
end

function var_0_0.updateSkeletonGraphicTime(arg_84_0)
	if arg_84_0._skeletonGraphic then
		arg_84_0._skeletonGraphic:Update(Time.deltaTime)
	end
end

function var_0_0.getMultipFaceAction(arg_85_0, arg_85_1)
	if arg_85_0.multipleFaceFlag then
		local var_85_0 = tonumber(arg_85_1)

		if var_85_0 and var_85_0 >= 0 then
			for iter_85_0, iter_85_1 in ipairs(arg_85_0.multipleFaceData) do
				if iter_85_1[1] == arg_85_0:getIdleName() then
					return tostring(var_85_0 + iter_85_1[2])
				end
			end
		end
	end

	return arg_85_1
end

function var_0_0.unloadCueSheet(arg_86_0)
	if not arg_86_0.loadSheets then
		return
	end

	for iter_86_0, iter_86_1 in ipairs(arg_86_0.loadSheets) do
		pg.CriMgr.GetInstance():UnloadCueSheet(iter_86_1)
	end

	arg_86_0.loadSheets = {}
end

function var_0_0.Dispose(arg_87_0)
	arg_87_0._isDisposed = true
	arg_87_0._materialDic = {}

	if arg_87_0.updateLocal then
		arg_87_0._skeletonGraphic.UpdateLocal = arg_87_0._skeletonGraphic.UpdateLocal - arg_87_0.updateLocal
		arg_87_0.updateLocal = nil
	end

	if arg_87_0._spinePaintingData then
		arg_87_0._spinePaintingData:Clear()
	end

	for iter_87_0, iter_87_1 in pairs(arg_87_0._loadSpineDic) do
		PoolMgr.GetInstance():ReturnSpinePainting(iter_87_0, iter_87_1)
	end

	for iter_87_2, iter_87_3 in pairs(arg_87_0._loadUIDic) do
		PoolMgr.GetInstance():ReturnUI(iter_87_2, iter_87_3)
	end

	arg_87_0._loadSpineDic = {}
	arg_87_0._loadUIDic = {}

	arg_87_0:unloadCueSheet()

	if arg_87_0._go ~= nil then
		var_0_1.Destroy(arg_87_0._go)
	end

	if arg_87_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_87_0._bgEffectGo)
	end

	arg_87_0._go = nil
	arg_87_0._tf = nil
	arg_87_0._bgEffectGo = nil
	arg_87_0._bgEffectTf = nil

	if arg_87_0.spineAnim then
		arg_87_0.spineAnim:SetActionCallBack(nil)
	end

	if arg_87_0._slotAlphaTimer and arg_87_0._slotAlphaTimer.running then
		arg_87_0._slotAlphaTimer:Stop()
	end

	arg_87_0._slotAlphaTimer = nil

	if arg_87_0.stepSlotAlpha and #arg_87_0.stepSlotAlpha > 0 then
		for iter_87_4, iter_87_5 in ipairs(arg_87_0.stepSlotAlpha) do
			iter_87_5.slot = nil
		end

		arg_87_0.stepSlotAlpha = {}
	end
end

function var_0_0.getPaintingName(arg_88_0)
	return arg_88_0._spinePaintingData:GetShipName()
end

return var_0_0
