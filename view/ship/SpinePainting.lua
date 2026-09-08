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
		isEmpty = function(arg_5_0)
			return arg_5_0.ship == nil
		end,
		Clear = function(arg_6_0)
			arg_6_0.ship = nil
			arg_6_0.parent = nil
			arg_6_0.scale = nil
			arg_6_0.pos = nil
			arg_6_0.bgEffectName = nil
			arg_6_0.bgEffectPos = nil
			arg_6_0.bgEffectScale = nil
			arg_6_0.effectParent = nil
		end
	}

	var_1_0:SetData(arg_1_0)

	return var_1_0
end

function var_0_0.Ctor(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0._spinePaintingData = arg_7_1
	arg_7_0._loadSpineDic = {}
	arg_7_0._loadUIDic = {}
	arg_7_0._initCallback = {}
	arg_7_0.loadSheets = {}
	arg_7_0._visible = true

	parallelAsync({
		function(arg_8_0)
			local var_8_0 = arg_7_0._spinePaintingData:GetShipName()

			PoolMgr.GetInstance():GetSpinePainting(var_8_0, true, function(arg_9_0)
				arg_7_0._loadSpineDic[var_8_0] = arg_9_0

				arg_7_0:init(arg_9_0)
				arg_8_0()
			end)
		end,
		function(arg_10_0)
			local var_10_0 = arg_7_0._spinePaintingData.bgEffectName

			if var_10_0 ~= nil then
				PoolMgr.GetInstance():GetUI(var_10_0, true, function(arg_11_0)
					arg_7_0._loadUIDic[var_10_0] = arg_11_0

					arg_7_0:initBgEffect(arg_11_0)
					arg_10_0()
				end)
			else
				arg_10_0()
			end
		end
	}, function()
		setActive(arg_7_0._spinePaintingData.parent, true)
		setActive(arg_7_0._spinePaintingData.effectParent, true)

		arg_7_0._initFlag = true

		arg_7_0:updateLink()

		for iter_12_0, iter_12_1 in ipairs(arg_7_0._initCallback) do
			iter_12_1()
		end

		arg_7_0._initCallback = {}

		if arg_7_2 then
			arg_7_2(arg_7_0)
		end
	end)
end

function var_0_0.init(arg_13_0, arg_13_1)
	arg_13_0._go = arg_13_1
	arg_13_0._tf = tf(arg_13_1)

	HotfixHelper.SetLayerRecursively(arg_13_0._go, LayerMask.NameToLayer("UI"))
	arg_13_0._tf:SetParent(arg_13_0._spinePaintingData.parent, true)

	arg_13_0._tf.localScale = arg_13_0._spinePaintingData.scale
	arg_13_0._tf.localPosition = arg_13_0._spinePaintingData.pos
	arg_13_0.spineAnimList = {}

	local var_13_0 = arg_13_0._tf:GetComponent(typeof(ItemList)).prefabItem:ToTable()

	for iter_13_0, iter_13_1 in ipairs(var_13_0) do
		arg_13_0.spineAnimList[#arg_13_0.spineAnimList + 1] = GetOrAddComponent(iter_13_1, "SpineAnimUI")
	end

	local var_13_1 = #arg_13_0.spineAnimList

	assert(var_13_1 > 0, "动态立绘至少要保证有一个spine动画，请检查" .. arg_13_0._spinePaintingData:GetShipName())

	if var_13_1 == 1 then
		arg_13_0.mainSpineAnim = arg_13_0.spineAnimList[1]
	else
		arg_13_0.mainSpineAnim = arg_13_0.spineAnimList[#arg_13_0.spineAnimList]
	end

	arg_13_0._skeletonGraphic = arg_13_0.mainSpineAnim:GetComponent("SkeletonGraphic")

	function arg_13_0.updateLocal()
		arg_13_0:onUpdateLocal()
	end

	arg_13_0._skeletonGraphic.UpdateLocal = arg_13_0._skeletonGraphic.UpdateLocal + arg_13_0.updateLocal
	arg_13_0._baseMaterial = arg_13_0._skeletonGraphic.material
	arg_13_0._idleName = arg_13_0:getNormalIdleName()
	arg_13_0.shipDragData = SpinePaintingConst.ship_drag_datas[arg_13_0._spinePaintingData:GetShipName()]
	arg_13_0.dragShipFlag = false
	arg_13_0.lockLayer = false

	if arg_13_0.shipDragData then
		arg_13_0.dragShipFlag = arg_13_0.shipDragData.drag_data and arg_13_0.shipDragData.drag_data.type
		arg_13_0.lockLayer = arg_13_0.shipDragData.drag_data.lock_layer
		arg_13_0.replaceWord = arg_13_0.shipDragData.replace_word
	end

	arg_13_0.multipleFaceFlag = false

	if arg_13_0.shipDragData and arg_13_0.shipDragData.multiple_face and arg_13_0.shipDragData.multiple_face ~= "" then
		local var_13_2 = arg_13_0.shipDragData.multiple_face.name

		arg_13_0.multipleFaceFlag = table.contains(var_13_2, arg_13_0.mainSpineAnim.name)
		arg_13_0.multipleFaceData = arg_13_0.shipDragData.multiple_face.data
	end

	arg_13_0.shipEffectActionAble = SpinePaintingConst.ship_effect_action_able[arg_13_0._spinePaintingData:GetShipName()]
	arg_13_0._effectsTf = findTF(arg_13_0._tf, "effects")
	arg_13_0._effectShowFlag = true
	arg_13_0._dragPassFlag = true
	arg_13_0._lightTf = findTF(arg_13_0._tf, "light")

	if arg_13_0._lightTf then
		arg_13_0._lightAnimator = arg_13_0._lightTf:GetComponent(typeof(Animator))
		arg_13_0._lightAnimationName = arg_13_0._lightAnimator.runtimeAnimatorController.animationClips[0].name

		arg_13_0._lightAnimator:Play(arg_13_0._lightAnimationName, -1, SpinePaintingConst.painting_lit_value)

		arg_13_0._lightEffectsTf = findTF(arg_13_0._tf, "light/effects")
		arg_13_0._lightSliderEffectsTf = findTF(arg_13_0._tf, "light/slider_effects")
		arg_13_0._lightSliderTf = findTF(arg_13_0._tf, "light/slider")
	end

	arg_13_0:playPaintingInitIdle()
	arg_13_0:playPaintingInitSkin()

	arg_13_0.slotDic = {}
	arg_13_0.stepSlotAlpha = {}
	arg_13_0._slotAlphaTimer = Timer.New(function()
		arg_13_0:updateSlotAlpha()
	end, 0.016666666666666666, -1)

	arg_13_0._slotAlphaTimer:Start()
	arg_13_0:SetDefaultSkeletonSkin()
end

function var_0_0.initBgEffect(arg_16_0, arg_16_1)
	arg_16_0._bgEffectGo = arg_16_1
	arg_16_0._bgEffectTf = tf(arg_16_1)

	HotfixHelper.SetLayerRecursively(arg_16_0._bgEffectGo, LayerMask.NameToLayer("UI"))
	arg_16_0._bgEffectTf:SetParent(arg_16_0._spinePaintingData.effectParent, true)

	arg_16_0._bgEffectTf.localScale = arg_16_0._spinePaintingData.bgEffectScale
	arg_16_0._bgEffectTf.localPosition = arg_16_0._spinePaintingData.bgEffectPos
end

function var_0_0.getInitFlag(arg_17_0)
	return arg_17_0._initFlag
end

function var_0_0.getNormalIdleName(arg_18_0)
	if HXSet.isHx() and arg_18_0.shipDragData and arg_18_0.shipDragData.hx_idle then
		return arg_18_0.shipDragData.hx_idle
	end

	return "normal"
end

function var_0_0.updateLink(arg_19_0)
	arg_19_0.slotOverride = {}

	local var_19_0 = arg_19_0._spinePaintingData.ship:getSkinId()
	local var_19_1 = ChangeSkinLink.CHANGE_SKIN_LINK_DATA[var_19_0]

	if var_19_1 then
		local var_19_2 = var_19_1.link_id
		local var_19_3 = var_19_1.relations

		if var_19_1.link_type == ChangeSkinLink.L2D_TYPE then
			local var_19_4

			if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 then
				var_19_4 = ChangeSkinLink.GetSaveL2dData(arg_19_0._spinePaintingData.ship.id, var_19_2)
			else
				var_19_4 = ChangeSkinLink.L2D_PARAMETER_DIC[arg_19_0._spinePaintingData.ship.id]
			end

			var_19_4 = var_19_4 or {}

			for iter_19_0, iter_19_1 in ipairs(var_19_3) do
				local var_19_5 = iter_19_1.type

				if var_19_5 == ChangeSkinLink.change_parameter_link_slot then
					local var_19_6 = true
					local var_19_7 = iter_19_1.link_parameter
					local var_19_8 = iter_19_1.slot_list

					for iter_19_2, iter_19_3 in ipairs(var_19_7) do
						local var_19_9 = iter_19_3.name
						local var_19_10 = iter_19_3.num

						if (var_19_4[var_19_9] and var_19_4[var_19_9] or 0) ~= var_19_10 then
							var_19_6 = false
						end
					end

					if var_19_6 then
						for iter_19_4, iter_19_5 in ipairs(var_19_8) do
							table.insert(arg_19_0.slotOverride, iter_19_5)
						end
					end
				elseif var_19_5 == ChangeSkinLink.change_parameter_link_skin then
					local var_19_11 = true
					local var_19_12 = iter_19_1.link_parameter
					local var_19_13 = iter_19_1.skeleton_skin

					for iter_19_6, iter_19_7 in ipairs(var_19_12) do
						local var_19_14 = iter_19_7.name
						local var_19_15 = iter_19_7.num

						if (var_19_4[var_19_14] and var_19_4[var_19_14] or 0) ~= var_19_15 then
							var_19_11 = false
						end
					end

					if var_19_11 then
						arg_19_0:SetSkeletonSkin(var_19_13)
					end
				end
			end
		end
	end
end

function var_0_0.setL2dSlot(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0._skeletonGraphic.Skeleton:SetAttachment(arg_20_1, arg_20_2)
end

function var_0_0.onUpdateLocal(arg_21_0)
	if arg_21_0.slotOverride then
		for iter_21_0, iter_21_1 in ipairs(arg_21_0.slotOverride) do
			arg_21_0:setL2dSlot(iter_21_1[1], iter_21_1[2])
		end
	end
end

function var_0_0.SetVisible(arg_22_0, arg_22_1)
	local function var_22_0()
		arg_22_0._visible = arg_22_1

		if arg_22_0._spinePaintingData.effectParent then
			setActive(arg_22_0._spinePaintingData.effectParent, arg_22_1)
		end

		pg.ViewUtils.SetLayer(arg_22_0._tf, arg_22_1 and Layer.UI or Layer.UIHidden)
		setActiveViaLayer(arg_22_0._spinePaintingData.effectParent, arg_22_1)

		arg_22_0._lightValue = nil
		arg_22_0._effectShowFlag = true
		arg_22_0._dragPassFlag = true

		if arg_22_0._skeletonGraphic then
			arg_22_0._skeletonGraphic.timeScale = arg_22_1 and 1 or 0
		end

		if not arg_22_1 then
			arg_22_0.mainSpineAnim:SetActionCallBack(nil)

			arg_22_0.inAction = false
			arg_22_0.clickActionList = {}

			if LeanTween.isTweening(go(arg_22_0._tf)) then
				LeanTween.cancel(go(arg_22_0._tf))
			end

			if arg_22_0._baseShader then
				if arg_22_0._skeletonGraphic then
					arg_22_0._skeletonGraphic.material.shader = arg_22_0._baseShader
				end

				arg_22_0._baseShader = nil
			end

			arg_22_0._displayWord = false
		else
			arg_22_0._skeletonGraphic:Update(Time.deltaTime)
		end

		arg_22_0:playPaintingInitIdle()
		arg_22_0:playPaintingInitSkin()
		arg_22_0:updateLink()

		if not arg_22_1 then
			arg_22_0:unloadCueSheet()
			pg.CriMgr.GetInstance():DisposePaintingBgm()
		end
	end

	onDelayTick(var_22_0, 0.05)
end

function var_0_0.playPaintingInitIdle(arg_24_0)
	local var_24_0 = SpinePaintingDrag.GetPaintingInitIdle(arg_24_0.mainSpineAnim.name, arg_24_0._spinePaintingData.ship.id)
	local var_24_1 = arg_24_0:getNormalIdleName()

	if var_24_0 then
		local var_24_2 = PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1)

		if var_24_2 == 1 and arg_24_0._idleName ~= var_24_0 then
			var_24_1 = var_24_0
		elseif var_24_2 ~= 1 and arg_24_0._idleName ~= arg_24_0:getNormalIdleName() then
			var_24_1 = arg_24_0:getNormalIdleName()
		end
	else
		var_24_1 = arg_24_0:getNormalIdleName()
	end

	if var_24_1 then
		arg_24_0:setIdleName(var_24_1)
		arg_24_0:SetActionWithFinishCallback(arg_24_0._idleName, 0, nil, true, nil)

		arg_24_0.inAction = false
	end
end

function var_0_0.playPaintingInitSkin(arg_25_0)
	local var_25_0 = SpinePaintingDrag.GetPaintingInitSkin(arg_25_0.mainSpineAnim.name, arg_25_0._spinePaintingData.ship.id)
	local var_25_1 = arg_25_0:GetDefaultSkeletonSkin()

	if var_25_0 then
		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_25_0:GetDefaultSkeletonSkin() ~= var_25_0 then
			var_25_1 = var_25_0
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_25_0._skeletonSkin ~= arg_25_0:GetDefaultSkeletonSkin() then
			var_25_1 = arg_25_0:GetDefaultSkeletonSkin()
		end
	else
		var_25_1 = arg_25_0:GetDefaultSkeletonSkin()
	end

	if var_25_1 and arg_25_0._skeletonGraphic and arg_25_0._skeletonGraphic.SkeletonData then
		if arg_25_0._skeletonGraphic.SkeletonData:FindSkin(var_25_1) ~= nil then
			arg_25_0:SetSkeletonSkin(var_25_1)
		elseif arg_25_0._skeletonGraphic.SkeletonData:FindSkin("default") ~= nil then
			arg_25_0:SetSkeletonSkin("default")
		end
	end
end

function var_0_0.getIdleName(arg_26_0)
	return arg_26_0._idleName
end

function var_0_0.setIdleName(arg_27_0, arg_27_1)
	arg_27_0._idleName = arg_27_1

	arg_27_0:updateHitArea()
end

function var_0_0.getReplaceWord(arg_28_0)
	if arg_28_0.replaceWord and table.contains(arg_28_0.replaceWord, arg_28_0._idleName) then
		return true
	end

	return false
end

function var_0_0.updateHitArea(arg_29_0)
	if arg_29_0.dragShipFlag then
		local var_29_0 = arg_29_0.shipDragData.drag_data.type
		local var_29_1 = arg_29_0.shipDragData.drag_data.config_client

		if var_29_0 == SpinePaintingConst.drag_type_normal then
			for iter_29_0 = 1, #var_29_1 do
				local var_29_2 = var_29_1[iter_29_0]
				local var_29_3 = var_29_2.hit
				local var_29_4 = var_29_2.active

				if var_29_3 and not var_29_4 then
					local var_29_5 = findTF(arg_29_0._tf, "hitArea/" .. var_29_3)

					if var_29_5 then
						local var_29_6 = true
						local var_29_7 = true

						if var_29_2.idle and type(var_29_2.idle) == "string" then
							var_29_6 = var_29_2.idle == arg_29_0._idleName
						elseif var_29_2.idle and type(var_29_2.idle) == "table" then
							var_29_6 = table.contains(var_29_2.idle, arg_29_0._idleName)
						end

						if var_29_2.skin and type(var_29_2.skin) == "string" then
							var_29_7 = var_29_2.skin == arg_29_0._skeletonSkin
						elseif var_29_2.skin and type(var_29_2.skin) == "table" then
							var_29_7 = table.contains(var_29_2.skin, arg_29_0._skeletonSkin)
						end

						setActive(var_29_5, var_29_6 and var_29_7)
					else
						print("hit area " .. var_29_3 .. "is not exist")
					end
				end
			end
		end
	end
end

function var_0_0.checkListAction(arg_30_0)
	if #arg_30_0.clickActionList > 0 then
		local var_30_0 = table.remove(arg_30_0.clickActionList, 1)

		arg_30_0:SetActionWithFinishCallback(var_30_0, 0, function()
			arg_30_0:checkListAction()
		end, true)
	else
		arg_30_0:SetAction(arg_30_0:getNormalIdleName(), 0, true)

		arg_30_0.inAction = false
	end
end

function var_0_0.displayWord(arg_32_0, arg_32_1)
	arg_32_0._displayWord = arg_32_1
end

function var_0_0.readyDragAction(arg_33_0, arg_33_1, arg_33_2)
	if arg_33_0.inAction or arg_33_0._displayWord then
		return false
	end

	if arg_33_0.dragShipFlag then
		return arg_33_0:startDragAction(arg_33_1, arg_33_2)
	end

	return false
end

function var_0_0.SetSkeletonSkin(arg_34_0, arg_34_1)
	arg_34_0._skeletonSkin = arg_34_1

	arg_34_0:SetSkin(arg_34_1)
	arg_34_0:updateSkeletonGraphicTime()
	arg_34_0:updateHitArea()
end

function var_0_0.SetDefaultSkeletonSkin(arg_35_0)
	arg_35_0:SetSkeletonSkin(arg_35_0:GetDefaultSkeletonSkin())
end

function var_0_0.GetDefaultSkeletonSkin(arg_36_0)
	local var_36_0 = arg_36_0._spinePaintingData:GetShipSkinConfig().skeleton_default_skin

	if not var_36_0 or var_36_0 == "" then
		var_36_0 = arg_36_0._skeletonGraphic.SkeletonData:FindSkin("1") and "1" or "default"
	end

	return var_36_0
end

function var_0_0.startDragAction(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_0.shipDragData.drag_data
	local var_37_1 = var_37_0.type

	if var_37_1 == SpinePaintingConst.drag_type_normal then
		return arg_37_0:changePaintingNormal(var_37_0, arg_37_1, arg_37_2)
	elseif var_37_1 == SpinePaintingConst.drag_type_list then
		arg_37_0.clickActionList = Clone(var_37_0.config_client)

		return arg_37_0:checkListAction()
	end

	return false
end

function var_0_0.GetDragDataConfig(arg_38_0, arg_38_1)
	if arg_38_0.shipDragData then
		return arg_38_0.shipDragData[arg_38_1]
	end

	return nil
end

function var_0_0.setEventTriggerCallback(arg_39_0, arg_39_1)
	arg_39_0._eventTriggerCall = arg_39_1
end

function var_0_0.changePaintingNormal(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	local var_40_0 = arg_40_1.config_client
	local var_40_1 = arg_40_1.type

	for iter_40_0, iter_40_1 in ipairs(var_40_0) do
		if arg_40_0:matchDragFlag(arg_40_2, iter_40_1, arg_40_3) then
			return arg_40_0:doDragAction(var_40_1, arg_40_1, iter_40_1, arg_40_3)
		end
	end

	return false
end

function var_0_0.doDragAction(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4)
	local var_41_0 = arg_41_3.fold
	local var_41_1 = arg_41_3.fold_chat and arg_41_3.fold_chat or nil
	local var_41_2 = arg_41_3.effect_hide
	local var_41_3 = arg_41_3.action_cv
	local var_41_4 = arg_41_3.finish_cv
	local var_41_5 = arg_41_3.alpha_data and arg_41_3.alpha_data or nil
	local var_41_6 = arg_41_3.skin_change and arg_41_3.skin_change or nil
	local var_41_7 = arg_41_3.clear_track and arg_41_3.clear_track or nil
	local var_41_8 = arg_41_3.idle and arg_41_3.idle or nil
	local var_41_9 = arg_41_3.change_idle
	local var_41_10 = arg_41_3.action
	local var_41_11 = arg_41_3.event
	local var_41_12 = var_41_6
	local var_41_13
	local var_41_14
	local var_41_15

	if type(var_41_9) == "table" and type(var_41_10) == "table" then
		local var_41_16 = math.random(1, #var_41_10)

		var_41_13 = var_41_10[var_41_16]
		var_41_15 = var_41_9[var_41_16]
	elseif type(var_41_8) == "table" and type(var_41_10) == "table" then
		local var_41_17 = table.indexof(var_41_8, arg_41_0:getIdleName())

		var_41_13 = var_41_10[var_41_17]

		if type(var_41_9) == "table" then
			var_41_15 = var_41_9[var_41_17]
		end
	end

	if not var_41_13 then
		if type(var_41_10) == "string" then
			var_41_13 = var_41_10
		elseif type(var_41_10) == "table" then
			var_41_13 = var_41_10[math.random(1, #var_41_10)]
		end
	end

	if not var_41_15 then
		if type(var_41_9) == "string" then
			var_41_15 = var_41_9
		elseif type(var_41_9) == "table" then
			var_41_15 = var_41_9[math.random(1, #var_41_9)]
		end
	end

	if not var_41_14 then
		if type(var_41_11) == "string" then
			var_41_14 = var_41_11
		elseif type(var_41_11) == "table" then
			var_41_14 = var_41_11[math.random(1, #var_41_11)]
		end
	end

	if arg_41_1 == SpinePaintingConst.drag_type_normal then
		if var_41_5 and #var_41_5 > 0 then
			arg_41_0:SetAlphaData(var_41_5)
		end

		local var_41_18 = arg_41_3.material and arg_41_3.material or nil
		local var_41_19 = arg_41_3.material_time and arg_41_3.material_time or nil

		if var_41_18 then
			if LeanTween.isTweening(go(arg_41_0._tf)) then
				return false
			end

			arg_41_0:getSpineMaterial(var_41_18, function(arg_42_0)
				arg_41_0._skeletonGraphic.material = arg_42_0

				if var_41_19 then
					LeanTween.delayedCall(go(arg_41_0._tf), var_41_19, System.Action(function()
						arg_41_0._skeletonGraphic.material = arg_41_0._baseMaterial

						arg_41_0:changePaintingIdle(var_41_15)
					end))
				end
			end)
		end

		if var_41_7 and #var_41_7 > 0 then
			for iter_41_0, iter_41_1 in ipairs(var_41_7) do
				arg_41_0:SetEmptyAction(iter_41_1)
			end
		end

		if var_41_13 and var_41_13 ~= "" and arg_41_0:checkActionPlayAble(var_41_13, false, 0) then
			print("播放动作 .." .. var_41_13 .. "下一个待机动作 .. " .. var_41_15)

			if var_41_0 then
				pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, {
					flag = true,
					content = {
						chat = var_41_1
					}
				})
			end

			arg_41_0:setEffectVisible(var_41_2, false)
			arg_41_0:SetActionWithFinishCallback(var_41_13, 0, function()
				if var_41_12 and var_41_12 ~= "" then
					arg_41_0:changeSkeletonSkin(var_41_12)
				end

				if var_41_0 then
					pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, {
						flag = false,
						content = {
							chat = var_41_1
						}
					})
				end

				arg_41_0:changePaintingIdle(var_41_15 and var_41_15 or arg_41_0:getIdleName())
				arg_41_0:setEffectVisible(var_41_2, true)

				if var_41_4 and var_41_4 ~= "" then
					arg_41_0:PlayCv(var_41_4)
				end
			end, false, function()
				if var_41_3 and var_41_3 ~= "" then
					arg_41_0:PlayCv(var_41_3)
				end

				if var_41_14 and type(var_41_14) == "string" and arg_41_0._eventTriggerCall then
					arg_41_0._eventTriggerCall(var_41_14)
				end
			end)
		end

		if not var_41_13 or var_41_13 == "" then
			if var_41_12 and var_41_12 ~= "" then
				arg_41_0:changeSkeletonSkin(var_41_12)
			end

			if var_41_15 and var_41_15 ~= "" then
				arg_41_0:changePaintingIdle(var_41_15)
			end

			if var_41_14 and type(var_41_14) == "string" and arg_41_0._eventTriggerCall then
				arg_41_0._eventTriggerCall(var_41_14)
			end

			return false
		end
	end

	return true
end

function var_0_0.SetAlphaData(arg_46_0, arg_46_1)
	for iter_46_0, iter_46_1 in ipairs(arg_46_1) do
		local var_46_0 = iter_46_1[1]
		local var_46_1 = iter_46_1[2]
		local var_46_2 = iter_46_1[3]
		local var_46_3 = arg_46_0:getSlotAlpha(var_46_0)

		if not arg_46_0:getStepSlotAlpha(var_46_0) and var_46_3 then
			local var_46_4
			local var_46_5

			for iter_46_2, iter_46_3 in ipairs(var_46_1) do
				if math.abs(var_46_3 - iter_46_3) <= 0.1 then
					var_46_5 = iter_46_2 + 1
				end

				if var_46_5 == iter_46_2 then
					var_46_4 = iter_46_3
				end
			end

			var_46_4 = var_46_4 or var_46_1[1]

			if var_46_4 then
				arg_46_0:setStepSlotAlpha(var_46_0, var_46_4, var_46_2)
			end
		end
	end
end

function var_0_0.PlayCv(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0._spinePaintingData.ship:getSkinId()
	local var_47_1 = pg.CriMgr.GetCVBankName(ShipWordHelper.RawGetCVKey(var_47_0))
	local var_47_2 = pg.ship_skin_template[var_47_0].group_index
	local var_47_3 = arg_47_1 .. "_" .. var_47_2

	print("try playing cv" .. var_47_1 .. ":" .. var_47_3)
	pg.CriMgr.GetInstance():playCueSheetVoice(var_47_1, var_47_3, true, function(arg_48_0)
		if arg_48_0 then
			print("播放的语音长度为 = " .. arg_48_0:GetLength())
		end
	end)
end

function var_0_0.changeSkeletonSkin(arg_49_0, arg_49_1)
	if arg_49_0._skeletonSkin == arg_49_1 then
		arg_49_0:SetDefaultSkeletonSkin()
	else
		arg_49_0:SetSkeletonSkin(arg_49_1)
	end

	SpinePaintingDrag.SetPaintingInitSkin(arg_49_0.mainSpineAnim.name, arg_49_0._spinePaintingData.ship.id, arg_49_0._skeletonSkin)
end

function var_0_0.setEffectVisible(arg_50_0, arg_50_1, arg_50_2)
	if not arg_50_1 or #arg_50_1 == 0 then
		return
	end

	for iter_50_0 = 1, #arg_50_1 do
		local var_50_0 = findTF(arg_50_0._tf, arg_50_1[iter_50_0])

		if var_50_0 then
			setActive(var_50_0, arg_50_2)
		end
	end
end

function var_0_0.matchDragFlag(arg_51_0, arg_51_1, arg_51_2, arg_51_3)
	local var_51_0 = arg_51_2.hit

	if var_51_0 and var_51_0 ~= arg_51_1 then
		return false
	end

	local var_51_1 = arg_51_2.skin

	if var_51_1 and var_51_1 ~= "" and arg_51_0._skeletonSkin ~= var_51_1 then
		return false
	end

	local var_51_2 = arg_51_2.idle

	if var_51_2 and type(var_51_2) == "string" and arg_51_0:getIdleName() ~= var_51_2 then
		return false
	elseif var_51_2 and type(var_51_2) == "table" and not table.contains(var_51_2, arg_51_0:getIdleName()) then
		return false
	end

	local var_51_3 = arg_51_2.favor

	if var_51_3 and var_51_3 >= 0 then
		local var_51_4 = arg_51_0._spinePaintingData.ship:getCVIntimacy()

		if var_51_4 and var_51_4 < var_51_3 then
			return false
		end
	end

	if arg_51_2.click and arg_51_2.click == tobool(arg_51_3) then
		return false
	end

	return true
end

function var_0_0.OnDragMove(arg_52_0, arg_52_1, arg_52_2)
	return
end

function var_0_0.getSpineMaterial(arg_53_0, arg_53_1, arg_53_2)
	if not arg_53_0._materialDic then
		arg_53_0._materialDic = {}
	end

	if arg_53_0._materialDic[arg_53_1] then
		arg_53_2(arg_53_0._materialDic[arg_53_1])
	else
		arg_53_0._materialDic[arg_53_1] = LoadAny("spinematerials", arg_53_1, typeof(Material))

		arg_53_2(arg_53_0._materialDic[arg_53_1])
	end
end

function var_0_0.changePaintingIdle(arg_54_0, arg_54_1)
	arg_54_0:setIdleName(arg_54_1)
	arg_54_0:SetAction(arg_54_1, 0, true)
	SpinePaintingDrag.SetPaintingInitIdle(arg_54_0.mainSpineAnim.name, arg_54_0._spinePaintingData.ship.id, arg_54_1)

	arg_54_0.inAction = false
end

function var_0_0.SetShopHx(arg_55_0, arg_55_1)
	if arg_55_1 and HXSet.isHx() then
		if arg_55_0:getAnimationExist("shop_hx", arg_55_0._skeletonGraphic) then
			arg_55_0:setIdleName("shop_hx")
			arg_55_0:SetAction(arg_55_0._idleName, 0, true)

			local var_55_0 = arg_55_0._tf.anchoredPosition

			arg_55_0._tf.anchoredPosition = Vector2(100000, 0)

			arg_55_0:updateSkeletonGraphicTime()
			onDelayTick(function()
				arg_55_0._tf.anchoredPosition = var_55_0
			end, 0.05)
		end
	else
		arg_55_0:setIdleName(arg_55_0:getNormalIdleName())
		arg_55_0:SetAction(arg_55_0._idleName, 0, true)
	end
end

function var_0_0.SetAction(arg_57_0, arg_57_1, arg_57_2, arg_57_3)
	if not arg_57_0:checkActionPlayAble(arg_57_1, arg_57_3, arg_57_2) then
		return false
	end

	if arg_57_2 and arg_57_2 == 0 then
		arg_57_0.lastPlayAction = arg_57_1
	end

	if arg_57_2 == 0 and arg_57_1 ~= arg_57_0:getIdleName() then
		arg_57_0.inAction = true
	end

	if arg_57_0.multipleFaceFlag and not arg_57_0.inAction then
		arg_57_1 = arg_57_0:getMultipFaceAction(arg_57_1)
	end

	local var_57_0 = arg_57_0._spinePaintingData.ship:getSkinId()
	local var_57_1 = pg.ship_skin_template[var_57_0].voice_lang

	if arg_57_2 == 0 and var_57_1 and #var_57_1 > 0 then
		local var_57_2 = ShipWordHelper.GetLanguageSetting(var_57_0)

		if var_57_2 <= 0 then
			var_57_2 = 1
		end

		local var_57_3 = var_57_1[var_57_2]
		local var_57_4 = arg_57_0:GetVoiceLandAction(arg_57_1, var_57_3)

		if arg_57_0:getAnimationExist(var_57_4, arg_57_0._skeletonGraphic) then
			arg_57_1 = var_57_4
		end
	end

	arg_57_0:updateEffectVisible(arg_57_1)

	if HXSet.isHx() and arg_57_0:getAnimationExist(arg_57_1 .. "_hx") then
		arg_57_1 = arg_57_1 .. "_hx"
	end

	for iter_57_0, iter_57_1 in ipairs(arg_57_0.spineAnimList) do
		local var_57_5 = iter_57_1:GetComponent("SkeletonGraphic")

		if arg_57_0:getAnimationExist(arg_57_1, var_57_5) then
			iter_57_1:SetAction(arg_57_1, arg_57_2)
		end

		if iter_57_1:GetAnimationState() then
			GetComponent(iter_57_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end

	return true
end

function var_0_0.GetVoiceLandAction(arg_58_0, arg_58_1, arg_58_2)
	local var_58_0 = ""

	if arg_58_2 == ShipSkin.VOICE_LANG_JP then
		var_58_0 = "_jp"
	elseif arg_58_2 == ShipSkin.VOICE_LANG_CN then
		var_58_0 = "_cn"
	end

	return arg_58_1 .. var_58_0
end

function var_0_0.checkActionPlayAble(arg_59_0, arg_59_1, arg_59_2, arg_59_3)
	if arg_59_3 and arg_59_3 == 0 and arg_59_0.inAction and not arg_59_2 then
		return false
	end

	if arg_59_0.lockLayer and not arg_59_2 and arg_59_0.inAction and arg_59_3 and arg_59_3 > 0 then
		return false
	end

	if arg_59_0.lastPlayAction and arg_59_0.lastPlayAction ~= arg_59_0._idleName and arg_59_3 and arg_59_3 > 0 then
		return false
	end

	if arg_59_0._idleName ~= arg_59_0:getNormalIdleName() and arg_59_1 == "login" then
		return false
	end

	if not arg_59_0._dragPassFlag then
		return false
	end

	if arg_59_0.dragShipFlag and arg_59_0.shipDragData.action_enable then
		local var_59_0 = arg_59_0.shipDragData.action_enable

		for iter_59_0 = 1, #var_59_0 do
			local var_59_1 = var_59_0[iter_59_0]

			if var_59_1.name == arg_59_0._idleName and table.contains(var_59_1.ignore, arg_59_1) then
				return false
			end
		end
	end

	return true
end

function var_0_0.ClearAction(arg_60_0)
	arg_60_0.inAction = false
end

function var_0_0.getSlotAlpha(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_0._skeletonGraphic.Skeleton:FindSlot(arg_61_1)

	if var_61_0 then
		return ReflectionHelp.RefGetProperty(typeof("Spine.Slot"), "A", var_61_0)
	end

	return nil
end

function var_0_0.setSlotAlpha(arg_62_0, arg_62_1, arg_62_2)
	ReflectionHelp.RefSetProperty(typeof("Spine.Slot"), "A", arg_62_1, arg_62_2)
end

function var_0_0.setStepSlotAlpha(arg_63_0, arg_63_1, arg_63_2, arg_63_3)
	if not arg_63_0.slotDic[arg_63_1] then
		arg_63_0.slotDic[arg_63_1] = arg_63_0._skeletonGraphic.Skeleton:FindSlot(arg_63_1)
	end

	if arg_63_0.slotDic[arg_63_1] then
		if not arg_63_3 or arg_63_3 <= 0 then
			print("设置插槽 " .. arg_63_1 .. " alpha = " .. arg_63_2)
			arg_63_0:setSlotAlpha(arg_63_0.slotDic[arg_63_1], arg_63_2)
		else
			local var_63_0 = arg_63_0:getSlotAlpha(arg_63_1)

			table.insert(arg_63_0.stepSlotAlpha, {
				smooth = 0,
				name = arg_63_1,
				slot = arg_63_0.slotDic[arg_63_1],
				current = var_63_0,
				target = arg_63_2,
				time = arg_63_3
			})
		end
	end
end

function var_0_0.getStepSlotAlpha(arg_64_0, arg_64_1)
	for iter_64_0, iter_64_1 in ipairs(arg_64_0.stepSlotAlpha) do
		if iter_64_1.name == arg_64_1 then
			return iter_64_1
		end
	end

	return nil
end

function var_0_0.updateSlotAlpha(arg_65_0)
	for iter_65_0 = #arg_65_0.stepSlotAlpha, 1, -1 do
		local var_65_0 = arg_65_0.stepSlotAlpha[iter_65_0]

		var_65_0.current, var_65_0.smooth = Mathf.SmoothDamp(var_65_0.current, var_65_0.target, var_65_0.smooth, var_65_0.time)

		if math.abs(var_65_0.target - var_65_0.current) <= 0.02 then
			print("设置插槽 " .. var_65_0.name .. " alpha = " .. var_65_0.target)
			arg_65_0:setSlotAlpha(var_65_0.slot, var_65_0.target)

			table.remove(arg_65_0.stepSlotAlpha, iter_65_0).slot = nil
		else
			print("设置插槽 " .. var_65_0.name .. " alpha = " .. var_65_0.current)
			arg_65_0:setSlotAlpha(var_65_0.slot, var_65_0.current)
		end
	end
end

function var_0_0.updateLight(arg_66_0)
	if arg_66_0._lightAnimator and arg_66_0._lightAnimationName and (not arg_66_0._lightValue or math.abs(arg_66_0._lightValue - SpinePaintingConst.painting_lit_value) > 0.001) then
		arg_66_0._lightAnimator:Play(arg_66_0._lightAnimationName, -1, SpinePaintingConst.painting_lit_value)

		arg_66_0._lightValue = SpinePaintingConst.painting_lit_value
	end

	arg_66_0._litSettingFlag = SpinePaintingConst.painting_lit_setting

	if arg_66_0._lightEffectsTf and isActive(arg_66_0._lightEffectsTf) ~= arg_66_0._effectShowFlag then
		setActive(arg_66_0._lightEffectsTf, arg_66_0._effectShowFlag)
	end

	if arg_66_0._lightSliderTf and isActive(arg_66_0._lightSliderTf) ~= arg_66_0._litSettingFlag then
		setActive(arg_66_0._lightSliderTf, arg_66_0._litSettingFlag)
	end

	if arg_66_0._lightSliderEffectsTf then
		local var_66_0 = arg_66_0._effectShowFlag and arg_66_0._litSettingFlag

		if isActive(arg_66_0._lightSliderEffectsTf) ~= var_66_0 then
			setActive(arg_66_0._lightSliderEffectsTf, var_66_0)
		end
	end
end

function var_0_0.updateEffectVisible(arg_67_0, arg_67_1)
	if not arg_67_0._effectsTf then
		return
	end

	if isActive(arg_67_0._effectsTf) ~= arg_67_0._effectShowFlag then
		setActive(arg_67_0._effectsTf, arg_67_0._effectShowFlag)
	end

	if arg_67_0.shipEffectActionAble then
		if table.contains(arg_67_0.shipEffectActionAble, arg_67_1) then
			if arg_67_0._effectsTf and isActive(arg_67_0._effectsTf) then
				setActive(arg_67_0._effectsTf, false)
			end
		elseif arg_67_0._effectsTf and not isActive(arg_67_0._effectsTf) then
			setActive(arg_67_0._effectsTf, true)
		end
	end
end

function var_0_0.isInAction(arg_68_0)
	return arg_68_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_69_0, arg_69_1, arg_69_2, arg_69_3, arg_69_4, arg_69_5)
	if not arg_69_0:checkActionPlayAble(arg_69_1, arg_69_4, arg_69_2) then
		return
	end

	if arg_69_0.mainSpineAnim then
		arg_69_0.mainSpineAnim:SetActionCallBack(nil)
		arg_69_0.mainSpineAnim:SetActionCallBack(function(arg_70_0)
			if arg_70_0 == "finish" and arg_69_3 then
				arg_69_0.inAction = false

				arg_69_3()

				arg_69_3 = nil
			elseif arg_70_0 == "action" and arg_69_5 then
				arg_69_5()

				arg_69_5 = nil
			elseif string.match(arg_70_0, "^bgm_") or string.match(arg_70_0, "^bgmsingle_") then
				if arg_69_0._visible then
					local var_70_0 = string.match(arg_70_0, "^bgm_(.*)$") or string.match(arg_70_0, "^bgmsingle_(.*)$")
					local var_70_1 = string.split(var_70_0, "_")
					local var_70_2 = string.match(arg_70_0, "^bgm_(.*)$") and true or false
					local var_70_3 = "se-skin"
					local var_70_4 = var_70_1[1] .. "_" .. var_70_1[2]
					local var_70_5 = var_70_1[3] and tonumber(var_70_1[3]) or 1

					pg.CriMgr.GetInstance():PlayPaintingBgm(var_70_3, var_70_4, var_70_2, var_70_5, Live2dConst.GetPaintingBgmVolume(arg_69_0._spinePaintingData.ship:getSkinId()))
				end
			elseif string.match(arg_70_0, "^effect_") then
				if string.match(arg_70_0, "^effect_on") then
					arg_69_0._effectShowFlag = false
				elseif string.match(arg_70_0, "^effect_off") then
					arg_69_0._effectShowFlag = true
				end

				arg_69_0:updateEffectVisible(arg_69_1)
				print("change effect " .. tostring(arg_69_0._effectShowFlag))
			elseif string.match(arg_70_0, "^drag_") then
				if string.match(arg_70_0, "^drag_on") then
					arg_69_0._dragPassFlag = false
				elseif string.match(arg_70_0, "^drag_off") then
					arg_69_0._dragPassFlag = true
				end

				print("change drag pass " .. tostring(arg_69_0._dragPassFlag))
			end
		end)
	end

	arg_69_0:SetAction(arg_69_1, arg_69_2, arg_69_4)
end

function var_0_0.SetOnceAction(arg_71_0, arg_71_1, arg_71_2, arg_71_3, arg_71_4)
	if not arg_71_0:checkActionPlayAble(arg_71_1, arg_71_4, 0) then
		return
	end

	arg_71_0:SetActionWithFinishCallback(arg_71_1, 0, function()
		arg_71_0:SetAction(arg_71_0:getIdleName(), 0)

		if arg_71_2 then
			arg_71_2()

			arg_71_2 = nil
		end
	end, arg_71_4, function()
		if arg_71_3 then
			arg_71_3()

			arg_71_3 = nil
		end
	end)
end

function var_0_0.pullInitCallback(arg_74_0, arg_74_1)
	table.insert(arg_74_0._initCallback, arg_74_1)
end

function var_0_0.getAnimationExist(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0

	arg_75_2 = arg_75_2 or arg_75_0._skeletonGraphic

	if arg_75_2 then
		var_75_0 = arg_75_2.Skeleton.Data:FindAnimation(arg_75_1)
	end

	return var_75_0
end

function var_0_0.SetEmptyAction(arg_76_0, arg_76_1)
	if not arg_76_0.spineAnimList then
		return
	end

	for iter_76_0, iter_76_1 in ipairs(arg_76_0.spineAnimList) do
		local var_76_0 = iter_76_1:GetAnimationState()

		if var_76_0 then
			var_76_0:SetEmptyAnimation(arg_76_1, 0)
			GetComponent(iter_76_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.GetSpineTransform(arg_77_0)
	return arg_77_0._tf
end

function var_0_0.SetSkin(arg_78_0, arg_78_1)
	if arg_78_0._skeletonGraphic and arg_78_0._skeletonGraphic.SkeletonData and arg_78_0._skeletonGraphic.SkeletonData:FindSkin(arg_78_1) ~= nil then
		arg_78_0._skeletonGraphic.Skeleton:SetSkin(arg_78_1)
		arg_78_0._skeletonGraphic.Skeleton:SetSlotsToSetupPose()
	end
end

function var_0_0.updateSkeletonGraphicTime(arg_79_0)
	if arg_79_0._skeletonGraphic then
		arg_79_0._skeletonGraphic:Update(Time.deltaTime)
	end
end

function var_0_0.getMultipFaceAction(arg_80_0, arg_80_1)
	if arg_80_0.multipleFaceFlag then
		local var_80_0 = tonumber(arg_80_1)

		if var_80_0 and var_80_0 >= 0 then
			for iter_80_0, iter_80_1 in ipairs(arg_80_0.multipleFaceData) do
				if iter_80_1[1] == arg_80_0:getIdleName() then
					return tostring(var_80_0 + iter_80_1[2])
				end
			end
		end
	end

	return arg_80_1
end

function var_0_0.unloadCueSheet(arg_81_0)
	if not arg_81_0.loadSheets then
		return
	end

	for iter_81_0, iter_81_1 in ipairs(arg_81_0.loadSheets) do
		pg.CriMgr.GetInstance():UnloadCueSheet(iter_81_1)
	end

	arg_81_0.loadSheets = {}
end

function var_0_0.Dispose(arg_82_0)
	arg_82_0._materialDic = {}

	if arg_82_0.updateLocal then
		arg_82_0._skeletonGraphic.UpdateLocal = arg_82_0._skeletonGraphic.UpdateLocal - arg_82_0.updateLocal
		arg_82_0.updateLocal = nil
	end

	if arg_82_0._spinePaintingData then
		arg_82_0._spinePaintingData:Clear()
	end

	for iter_82_0, iter_82_1 in pairs(arg_82_0._loadSpineDic) do
		PoolMgr.GetInstance():ReturnSpinePainting(iter_82_0, iter_82_1)
	end

	for iter_82_2, iter_82_3 in pairs(arg_82_0._loadUIDic) do
		PoolMgr.GetInstance():ReturnUI(iter_82_2, iter_82_3)
	end

	arg_82_0._loadSpineDic = {}
	arg_82_0._loadUIDic = {}

	arg_82_0:unloadCueSheet()

	if arg_82_0._go ~= nil then
		var_0_1.Destroy(arg_82_0._go)
	end

	if arg_82_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_82_0._bgEffectGo)
	end

	arg_82_0._go = nil
	arg_82_0._tf = nil
	arg_82_0._bgEffectGo = nil
	arg_82_0._bgEffectTf = nil

	if arg_82_0.spineAnim then
		arg_82_0.spineAnim:SetActionCallBack(nil)
	end

	if arg_82_0._slotAlphaTimer then
		arg_82_0._slotAlphaTimer:Stop()

		arg_82_0._slotAlphaTimer = nil
	end

	if arg_82_0.stepSlotAlpha and #arg_82_0.stepSlotAlpha > 0 then
		for iter_82_4, iter_82_5 in ipairs(arg_82_0._slotAlphaTimer) do
			iter_82_5.slot = nil
		end

		arg_82_0._slotAlphaTimer = {}
	end
end

function var_0_0.getPaintingName(arg_83_0)
	return arg_83_0._spinePaintingData:GetShipName()
end

return var_0_0
