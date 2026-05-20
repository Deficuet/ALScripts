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
			local var_8_1, var_8_2 = HXSet.autoHxShift("spinepainting/", var_8_0)
			local var_8_3 = var_8_1 .. var_8_2

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

	arg_13_0:playPaintingInitIdle()
	arg_13_0:playPaintingInitSkin()

	arg_13_0.slotDic = {}
	arg_13_0.stepSlotAlpha = {}
	arg_13_0._slotAlphaTimer = Timer.New(function()
		arg_13_0:updateSlotAlpha()
	end, 0.03333333333333333, -1)

	arg_13_0._slotAlphaTimer:Start()
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
	arg_22_0._visible = arg_22_1

	if arg_22_0._spinePaintingData.effectParent then
		setActive(arg_22_0._spinePaintingData.effectParent, arg_22_1)
	end

	pg.ViewUtils.SetLayer(arg_22_0._tf, arg_22_1 and Layer.UI or Layer.UIHidden)
	setActiveViaLayer(arg_22_0._spinePaintingData.effectParent, arg_22_1)

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

function var_0_0.playPaintingInitIdle(arg_23_0)
	local var_23_0 = SpinePaintingDrag.GetPaintingInitIdle(arg_23_0.mainSpineAnim.name, arg_23_0._spinePaintingData.ship.id)
	local var_23_1 = arg_23_0:getNormalIdleName()

	if var_23_0 then
		local var_23_2 = PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1)

		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_23_0._idleName ~= var_23_0 then
			var_23_1 = var_23_0
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_23_0._idleName ~= arg_23_0:getNormalIdleName() then
			var_23_1 = arg_23_0:getNormalIdleName()
		end
	else
		var_23_1 = arg_23_0:getNormalIdleName()
	end

	if var_23_1 then
		arg_23_0:setIdleName(var_23_1)
		arg_23_0:SetActionWithFinishCallback(arg_23_0._idleName, 0, nil, true, nil)

		arg_23_0.inAction = false
	end
end

function var_0_0.playPaintingInitSkin(arg_24_0)
	local var_24_0 = SpinePaintingDrag.GetPaintingInitSkin(arg_24_0.mainSpineAnim.name, arg_24_0._spinePaintingData.ship.id)
	local var_24_1 = arg_24_0:GetDefaultSkeletonSkin()

	if var_24_0 then
		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_24_0:GetDefaultSkeletonSkin() ~= var_24_0 then
			var_24_1 = var_24_0
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_24_0._skeletonSkin ~= arg_24_0:GetDefaultSkeletonSkin() then
			var_24_1 = arg_24_0:GetDefaultSkeletonSkin()
		end
	else
		var_24_1 = arg_24_0:GetDefaultSkeletonSkin()
	end

	if var_24_1 and arg_24_0._skeletonGraphic and arg_24_0._skeletonGraphic.SkeletonData and arg_24_0._skeletonGraphic.SkeletonData:FindSkin(var_24_1) ~= nil then
		arg_24_0:SetSkeletonSkin(var_24_1)
	end
end

function var_0_0.getIdleName(arg_25_0)
	return arg_25_0._idleName
end

function var_0_0.setIdleName(arg_26_0, arg_26_1)
	arg_26_0._idleName = arg_26_1

	arg_26_0:updateHitArea()
end

function var_0_0.getReplaceWord(arg_27_0)
	if arg_27_0.replaceWord and table.contains(arg_27_0.replaceWord, arg_27_0._idleName) then
		return true
	end

	return false
end

function var_0_0.updateHitArea(arg_28_0)
	if arg_28_0.dragShipFlag then
		local var_28_0 = arg_28_0.shipDragData.drag_data.type
		local var_28_1 = arg_28_0.shipDragData.drag_data.config_client

		if var_28_0 == SpinePaintingConst.drag_type_normal then
			for iter_28_0 = 1, #var_28_1 do
				local var_28_2 = var_28_1[iter_28_0]
				local var_28_3 = var_28_2.hit
				local var_28_4 = var_28_2.active

				if var_28_3 and not var_28_4 then
					local var_28_5 = findTF(arg_28_0._tf, "hitArea/" .. var_28_3)

					if var_28_5 then
						setActive(var_28_5, var_28_2.idle == arg_28_0._idleName)
					else
						print("hit area " .. var_28_3 .. "is not exist")
					end
				end
			end
		end
	end
end

function var_0_0.checkListAction(arg_29_0)
	if #arg_29_0.clickActionList > 0 then
		local var_29_0 = table.remove(arg_29_0.clickActionList, 1)

		arg_29_0:SetActionWithFinishCallback(var_29_0, 0, function()
			arg_29_0:checkListAction()
		end, true)
	else
		arg_29_0:SetAction(arg_29_0:getNormalIdleName(), 0, true)

		arg_29_0.inAction = false
	end
end

function var_0_0.displayWord(arg_31_0, arg_31_1)
	arg_31_0._displayWord = arg_31_1
end

function var_0_0.readyDragAction(arg_32_0, arg_32_1, arg_32_2)
	if arg_32_0.inAction or arg_32_0._displayWord then
		return false
	end

	if arg_32_0.dragShipFlag then
		return arg_32_0:startDragAction(arg_32_1, arg_32_2)
	end

	return false
end

function var_0_0.SetSkeletonSkin(arg_33_0, arg_33_1)
	arg_33_0._skeletonSkin = arg_33_1

	arg_33_0:SetSkin(arg_33_1)
	arg_33_0:updateSkeletonGraphicTime()
end

function var_0_0.SetDefaultSkeletonSkin(arg_34_0)
	local var_34_0 = arg_34_0._spinePaintingData:GetShipSkinConfig().skeleton_default_skin

	if not var_34_0 or var_34_0 == "" then
		var_34_0 = "1"
	end

	local var_34_1 = arg_34_0._skeletonGraphic.SkeletonData:FindSkin(var_34_0)

	if var_34_1 and var_34_1 ~= nil then
		arg_34_0:SetSkeletonSkin(var_34_0)
	end
end

function var_0_0.GetDefaultSkeletonSkin(arg_35_0)
	local var_35_0 = arg_35_0._spinePaintingData:GetShipSkinConfig().skeleton_default_skin

	if not var_35_0 or var_35_0 == "" then
		var_35_0 = "1"
	end

	return var_35_0
end

function var_0_0.startDragAction(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = arg_36_0.shipDragData.drag_data
	local var_36_1 = var_36_0.type

	if var_36_1 == SpinePaintingConst.drag_type_normal then
		return arg_36_0:changePaintingNormal(var_36_0, arg_36_1, arg_36_2)
	elseif var_36_1 == SpinePaintingConst.drag_type_list then
		arg_36_0.clickActionList = Clone(var_36_0.config_client)

		return arg_36_0:checkListAction()
	end

	return false
end

function var_0_0.GetDragDataConfig(arg_37_0, arg_37_1)
	if arg_37_0.shipDragData then
		return arg_37_0.shipDragData[arg_37_1]
	end

	return nil
end

function var_0_0.setEventTriggerCallback(arg_38_0, arg_38_1)
	arg_38_0._eventTriggerCall = arg_38_1
end

function var_0_0.changePaintingNormal(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0 = arg_39_1.config_client
	local var_39_1 = arg_39_1.type

	for iter_39_0, iter_39_1 in ipairs(var_39_0) do
		if arg_39_0:matchDragFlag(arg_39_2, iter_39_1, arg_39_3) then
			return arg_39_0:doDragAction(var_39_1, arg_39_1, iter_39_1, arg_39_3)
		end
	end

	return false
end

function var_0_0.doDragAction(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4)
	local var_40_0 = arg_40_3.change_idle
	local var_40_1 = arg_40_3.fold
	local var_40_2 = arg_40_3.effect_hide
	local var_40_3 = arg_40_3.action_cv
	local var_40_4 = arg_40_3.finish_cv
	local var_40_5 = arg_40_3.alpha_data and arg_40_3.alpha_data or nil
	local var_40_6 = arg_40_3.skin_change and arg_40_3.skin_change or nil
	local var_40_7 = arg_40_3.clear_track and arg_40_3.clear_track or nil
	local var_40_8

	if type(arg_40_3.action) == "string" then
		var_40_8 = arg_40_3.action
	elseif type(arg_40_3.action) == "table" then
		var_40_8 = arg_40_3.action[math.random(1, #arg_40_3.action)]
	end

	local var_40_9

	if type(arg_40_3.event) == "string" then
		var_40_9 = arg_40_3.event
	elseif type(arg_40_3.event) == "table" then
		var_40_9 = arg_40_3.event[math.random(1, #arg_40_3.event)]
	end

	if arg_40_1 == SpinePaintingConst.drag_type_normal then
		if var_40_5 and #var_40_5 > 0 then
			for iter_40_0, iter_40_1 in ipairs(var_40_5) do
				local var_40_10 = iter_40_1[1]
				local var_40_11 = iter_40_1[2]
				local var_40_12 = iter_40_1[3]
				local var_40_13 = arg_40_0:getSlotAlpha(var_40_10)

				if not arg_40_0:getStepSlotAlha(var_40_10) and var_40_13 then
					local var_40_14
					local var_40_15

					for iter_40_2, iter_40_3 in ipairs(var_40_11) do
						if math.abs(var_40_13 - iter_40_3) <= 0.1 then
							var_40_15 = iter_40_2 + 1
						end

						if var_40_15 == iter_40_2 then
							var_40_14 = iter_40_3
						end
					end

					var_40_14 = var_40_14 or var_40_11[1]

					if var_40_14 then
						arg_40_0:setStepSlotAlpha(var_40_10, var_40_14, var_40_12)
					end
				end
			end
		end

		local var_40_16 = arg_40_3.material and arg_40_3.material or nil
		local var_40_17 = arg_40_3.material_time and arg_40_3.material_time or nil

		if var_40_16 then
			if LeanTween.isTweening(go(arg_40_0._tf)) then
				return false
			end

			arg_40_0:getSpineMaterial(var_40_16, function(arg_41_0)
				arg_40_0._skeletonGraphic.material = arg_41_0

				if var_40_17 then
					LeanTween.delayedCall(go(arg_40_0._tf), var_40_17, System.Action(function()
						arg_40_0._skeletonGraphic.material = arg_40_0._baseMaterial

						arg_40_0:changePaintingIdle(var_40_0)
					end))
				end
			end)
		end

		if var_40_7 and #var_40_7 > 0 then
			for iter_40_4, iter_40_5 in ipairs(var_40_7) do
				arg_40_0:SetEmptyAction(iter_40_5)
			end
		end

		if var_40_8 and var_40_8 ~= "" and arg_40_0:checkActionPlayAble(var_40_8, false, 0) then
			if var_40_1 then
				pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, true)
			end

			arg_40_0:setEffectVisible(var_40_2, false)
			arg_40_0:SetActionWithFinishCallback(var_40_8, 0, function()
				if var_40_6 and var_40_6 ~= "" then
					arg_40_0:changeSkeletonSkin(var_40_6)
				end

				if var_40_1 then
					pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, false)
				end

				arg_40_0:changePaintingIdle(var_40_0 and var_40_0 or arg_40_0:getIdleName())
				arg_40_0:setEffectVisible(var_40_2, true)

				if var_40_4 and var_40_4 ~= "" then
					arg_40_0:PlayCv(var_40_4)
				end
			end, false, function()
				if var_40_3 and var_40_3 ~= "" then
					arg_40_0:PlayCv(var_40_3)
				end

				if var_40_9 and type(var_40_9) == "string" and arg_40_0._eventTriggerCall then
					arg_40_0._eventTriggerCall(var_40_9)
				end
			end)
		end

		if not var_40_8 or var_40_8 == "" then
			if var_40_6 and var_40_6 ~= "" then
				arg_40_0:changeSkeletonSkin(var_40_6)
			end

			if var_40_0 and var_40_0 ~= "" then
				arg_40_0:changePaintingIdle(var_40_0)
			end

			if var_40_9 and type(var_40_9) == "string" and arg_40_0._eventTriggerCall then
				arg_40_0._eventTriggerCall(var_40_9)
			end

			return false
		end
	end

	return true
end

function var_0_0.PlayCv(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_0._spinePaintingData.ship:getSkinId()
	local var_45_1 = pg.CriMgr.GetCVBankName(ShipWordHelper.RawGetCVKey(var_45_0))
	local var_45_2 = pg.ship_skin_template[var_45_0].group_index
	local var_45_3 = arg_45_1 .. "_" .. var_45_2

	print("try playing cv" .. var_45_1 .. ":" .. var_45_3)
	pg.CriMgr.GetInstance():playCueSheetVoice(var_45_1, var_45_3, true, function(arg_46_0)
		if arg_46_0 then
			print("播放的语音长度为 = " .. arg_46_0:GetLength())
		end
	end)
end

function var_0_0.changeSkeletonSkin(arg_47_0, arg_47_1)
	if arg_47_0._skeletonSkin == arg_47_1 then
		arg_47_0:SetDefaultSkeletonSkin()
	else
		arg_47_0:SetSkeletonSkin(arg_47_1)
	end

	SpinePaintingDrag.SetPaintingInitSkin(arg_47_0.mainSpineAnim.name, arg_47_0._spinePaintingData.ship.id, arg_47_0._skeletonSkin)
end

function var_0_0.setEffectVisible(arg_48_0, arg_48_1, arg_48_2)
	if not arg_48_1 or #arg_48_1 == 0 then
		return
	end

	for iter_48_0 = 1, #arg_48_1 do
		local var_48_0 = findTF(arg_48_0._tf, arg_48_1[iter_48_0])

		if var_48_0 then
			setActive(var_48_0, arg_48_2)
		end
	end
end

function var_0_0.matchDragFlag(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	local var_49_0 = arg_49_2.hit

	if var_49_0 and var_49_0 ~= arg_49_1 then
		return false
	end

	local var_49_1 = arg_49_2.skin

	if var_49_1 and var_49_1 ~= "" and arg_49_0._skeletonSkin ~= var_49_1 then
		return false
	end

	local var_49_2 = arg_49_2.idle

	if var_49_2 and var_49_2 ~= "" and arg_49_0:getIdleName() ~= var_49_2 then
		return false
	end

	local var_49_3 = arg_49_2.is_default

	if arg_49_0:getIdleName() ~= arg_49_0:getNormalIdleName() and var_49_3 and var_49_3 ~= "" then
		return false
	end

	local var_49_4 = arg_49_2.favor

	if var_49_4 and var_49_4 >= 0 then
		local var_49_5 = arg_49_0._spinePaintingData.ship:getCVIntimacy()

		if var_49_5 and var_49_5 < var_49_4 then
			return false
		end
	end

	if arg_49_2.click and arg_49_2.click == tobool(arg_49_3) then
		return false
	end

	return true
end

function var_0_0.OnDragMove(arg_50_0, arg_50_1, arg_50_2)
	return
end

function var_0_0.getSpineMaterial(arg_51_0, arg_51_1, arg_51_2)
	if not arg_51_0._materialDic then
		arg_51_0._materialDic = {}
	end

	if arg_51_0._materialDic[arg_51_1] then
		arg_51_2(arg_51_0._materialDic[arg_51_1])
	else
		arg_51_0._materialDic[arg_51_1] = LoadAny("spinematerials", arg_51_1, typeof(Material))

		arg_51_2(arg_51_0._materialDic[arg_51_1])
	end
end

function var_0_0.changePaintingIdle(arg_52_0, arg_52_1)
	arg_52_0:setIdleName(arg_52_1)
	arg_52_0:SetAction(arg_52_1, 0, true)
	SpinePaintingDrag.SetPaintingInitIdle(arg_52_0.mainSpineAnim.name, arg_52_0._spinePaintingData.ship.id, arg_52_1)

	arg_52_0.inAction = false
end

function var_0_0.SetShopHx(arg_53_0, arg_53_1)
	if arg_53_1 and HXSet.isHx() then
		if arg_53_0:getAnimationExist("shop_hx") then
			arg_53_0:setIdleName("shop_hx")
			arg_53_0:SetAction(arg_53_0._idleName, 0, true)

			local var_53_0 = arg_53_0._tf.anchoredPosition

			arg_53_0._tf.anchoredPosition = Vector2(100000, 0)

			arg_53_0:updateSkeletonGraphicTime()
			onDelayTick(function()
				arg_53_0._tf.anchoredPosition = var_53_0
			end, 0.05)
		end
	else
		arg_53_0:setIdleName(arg_53_0:getNormalIdleName())
		arg_53_0:SetAction(arg_53_0._idleName, 0, true)
	end
end

function var_0_0.SetAction(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	if not arg_55_0:checkActionPlayAble(arg_55_1, arg_55_3, arg_55_2) then
		return false
	end

	if arg_55_2 and arg_55_2 == 0 then
		arg_55_0.lastPlayAction = arg_55_1
	end

	if arg_55_2 == 0 and arg_55_1 ~= arg_55_0:getIdleName() then
		arg_55_0.inAction = true
	end

	if arg_55_0.multipleFaceFlag and not arg_55_0.inAction then
		arg_55_1 = arg_55_0:getMultipFaceAction(arg_55_1)
	end

	local var_55_0 = arg_55_0._spinePaintingData.ship:getSkinId()
	local var_55_1 = pg.ship_skin_template[var_55_0].voice_lang

	if arg_55_2 == 0 and var_55_1 and #var_55_1 > 0 then
		local var_55_2 = ShipWordHelper.GetLanguageSetting(var_55_0)

		if var_55_2 <= 0 then
			var_55_2 = 1
		end

		local var_55_3 = var_55_1[var_55_2]
		local var_55_4 = arg_55_0:GetVoiceLandAction(arg_55_1, var_55_3)

		if arg_55_0:getAnimationExist(var_55_4) then
			arg_55_1 = var_55_4
		end
	end

	arg_55_0:updateEffectVisible(arg_55_1)

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.spineAnimList) do
		iter_55_1:SetAction(arg_55_1, arg_55_2)

		if iter_55_1:GetAnimationState() then
			GetComponent(iter_55_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end

	return true
end

function var_0_0.GetVoiceLandAction(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = ""

	if arg_56_2 == ShipSkin.VOICE_LANG_JP then
		var_56_0 = "_jp"
	elseif arg_56_2 == ShipSkin.VOICE_LANG_CN then
		var_56_0 = "_cn"
	end

	return arg_56_1 .. var_56_0
end

function var_0_0.checkActionPlayAble(arg_57_0, arg_57_1, arg_57_2, arg_57_3)
	if arg_57_3 and arg_57_3 == 0 and arg_57_0.inAction and not arg_57_2 then
		return false
	end

	if arg_57_0.lockLayer and not arg_57_2 and arg_57_0.inAction and arg_57_3 and arg_57_3 > 0 then
		return false
	end

	if arg_57_0.lastPlayAction and arg_57_0.lastPlayAction ~= arg_57_0._idleName and arg_57_3 and arg_57_3 > 0 then
		return false
	end

	if arg_57_0._idleName ~= arg_57_0:getNormalIdleName() and arg_57_1 == "login" then
		return false
	end

	if arg_57_0.dragShipFlag and arg_57_0.shipDragData.action_enable then
		local var_57_0 = arg_57_0.shipDragData.action_enable

		for iter_57_0 = 1, #var_57_0 do
			local var_57_1 = var_57_0[iter_57_0]

			if var_57_1.name == arg_57_0._idleName and table.contains(var_57_1.ignore, arg_57_1) then
				return false
			end
		end
	end

	return true
end

function var_0_0.ClearAction(arg_58_0)
	arg_58_0.inAction = false
end

function var_0_0.getSlotAlpha(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_0._skeletonGraphic.Skeleton:FindSlot(arg_59_1)

	if var_59_0 then
		return ReflectionHelp.RefGetProperty(typeof("Spine.Slot"), "A", var_59_0)
	end

	return nil
end

function var_0_0.setSlotAlpha(arg_60_0, arg_60_1, arg_60_2)
	ReflectionHelp.RefSetProperty(typeof("Spine.Slot"), "A", arg_60_1, arg_60_2)
end

function var_0_0.setStepSlotAlpha(arg_61_0, arg_61_1, arg_61_2, arg_61_3)
	if not arg_61_0.slotDic[arg_61_1] then
		arg_61_0.slotDic[arg_61_1] = arg_61_0._skeletonGraphic.Skeleton:FindSlot(arg_61_1)
	end

	if arg_61_0.slotDic[arg_61_1] then
		if not arg_61_3 or arg_61_3 <= 0 then
			print("设置插槽 " .. arg_61_1 .. " alpha = " .. arg_61_2)
			arg_61_0:setSlotAlpha(arg_61_0.slotDic[arg_61_1], arg_61_2)
		else
			local var_61_0 = arg_61_0:getSlotAlpha(arg_61_1)

			table.insert(arg_61_0.stepSlotAlpha, {
				smooth = 0,
				name = arg_61_1,
				slot = arg_61_0.slotDic[arg_61_1],
				current = var_61_0,
				target = arg_61_2,
				time = arg_61_3
			})
		end
	end
end

function var_0_0.getStepSlotAlha(arg_62_0, arg_62_1)
	for iter_62_0, iter_62_1 in ipairs(arg_62_0.stepSlotAlpha) do
		if iter_62_1.name == arg_62_1 then
			return iter_62_1
		end
	end

	return nil
end

function var_0_0.updateSlotAlpha(arg_63_0)
	for iter_63_0 = #arg_63_0.stepSlotAlpha, 1, -1 do
		local var_63_0 = arg_63_0.stepSlotAlpha[iter_63_0]

		var_63_0.current, var_63_0.smooth = Mathf.SmoothDamp(var_63_0.current, var_63_0.target, var_63_0.smooth, var_63_0.time)

		if math.abs(var_63_0.target - var_63_0.current) <= 0.02 then
			print("设置插槽 " .. var_63_0.name .. " alpha = " .. var_63_0.target)
			arg_63_0:setSlotAlpha(var_63_0.slot, var_63_0.target)

			table.remove(arg_63_0.stepSlotAlpha, iter_63_0).slot = nil
		else
			print("设置插槽 " .. var_63_0.name .. " alpha = " .. var_63_0.current)
			arg_63_0:setSlotAlpha(var_63_0.slot, var_63_0.current)
		end
	end
end

function var_0_0.updateEffectVisible(arg_64_0, arg_64_1)
	if arg_64_0.shipEffectActionAble and arg_64_0._effectsTf then
		if table.contains(arg_64_0.shipEffectActionAble, arg_64_1) then
			if isActive(arg_64_0._effectsTf) then
				setActive(arg_64_0._effectsTf, false)
			end
		elseif not isActive(arg_64_0._effectsTf) then
			setActive(arg_64_0._effectsTf, true)
		end
	end
end

function var_0_0.isInAction(arg_65_0)
	return arg_65_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_66_0, arg_66_1, arg_66_2, arg_66_3, arg_66_4, arg_66_5)
	if not arg_66_0:checkActionPlayAble(arg_66_1, arg_66_4, arg_66_2) then
		return
	end

	if arg_66_0.mainSpineAnim then
		arg_66_0.mainSpineAnim:SetActionCallBack(function(arg_67_0)
			if arg_67_0 == "finish" and arg_66_3 then
				arg_66_0.inAction = false

				arg_66_0.mainSpineAnim:SetActionCallBack(nil)
				arg_66_3()

				arg_66_3 = nil
			elseif arg_67_0 == "action" and arg_66_5 then
				arg_66_5()

				arg_66_5 = nil
			elseif (string.match(arg_67_0, "^bgm_") or string.match(arg_67_0, "^bgmsingle_")) and arg_66_0._visible then
				local var_67_0 = string.match(arg_67_0, "^bgm_(.*)$") or string.match(arg_67_0, "^bgmsingle_(.*)$")
				local var_67_1 = string.split(var_67_0, "_")
				local var_67_2 = string.match(arg_67_0, "^bgm_(.*)$") and true or false
				local var_67_3 = "se-skin"
				local var_67_4 = var_67_1[1] .. "_" .. var_67_1[2]
				local var_67_5 = var_67_1[3] and tonumber(var_67_1[3]) or 1

				pg.CriMgr.GetInstance():PlayPaintingBgm(var_67_3, var_67_4, var_67_2, var_67_5, Live2dConst.GetPaintingBgmVolume(arg_66_0._spinePaintingData.ship:getSkinId()))
			end
		end)
	end

	arg_66_0:SetAction(arg_66_1, arg_66_2, arg_66_4)
end

function var_0_0.SetOnceAction(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4)
	if not arg_68_0:checkActionPlayAble(arg_68_1, arg_68_4, 0) then
		return
	end

	arg_68_0:SetActionWithFinishCallback(arg_68_1, 0, function()
		arg_68_0:SetAction(arg_68_0:getIdleName(), 0)

		if arg_68_2 then
			arg_68_2()

			arg_68_2 = nil
		end
	end, arg_68_4, function()
		if arg_68_3 then
			arg_68_3()

			arg_68_3 = nil
		end
	end)
end

function var_0_0.pullInitCallback(arg_71_0, arg_71_1)
	table.insert(arg_71_0._initCallback, arg_71_1)
end

function var_0_0.getAnimationExist(arg_72_0, arg_72_1)
	if not arg_72_0._mainAnimationData then
		arg_72_0._mainAnimationData = arg_72_0.mainSpineAnim:GetAnimationState()
	end

	local var_72_0

	if arg_72_0._skeletonGraphic then
		var_72_0 = arg_72_0._skeletonGraphic.Skeleton.Data:FindAnimation(arg_72_1)
	end

	return var_72_0
end

function var_0_0.SetEmptyAction(arg_73_0, arg_73_1)
	if not arg_73_0.spineAnimList then
		return
	end

	for iter_73_0, iter_73_1 in ipairs(arg_73_0.spineAnimList) do
		local var_73_0 = iter_73_1:GetAnimationState()

		if var_73_0 then
			var_73_0:SetEmptyAnimation(arg_73_1, 0)
			GetComponent(iter_73_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.GetSpineTrasform(arg_74_0)
	return arg_74_0._tf
end

function var_0_0.SetSkin(arg_75_0, arg_75_1)
	if arg_75_0._skeletonGraphic and arg_75_0._skeletonGraphic.SkeletonData and arg_75_0._skeletonGraphic.SkeletonData:FindSkin(arg_75_1) ~= nil then
		arg_75_0._skeletonGraphic.Skeleton:SetSkin(arg_75_1)
		arg_75_0._skeletonGraphic.Skeleton:SetSlotsToSetupPose()
	end
end

function var_0_0.updateSkeletonGraphicTime(arg_76_0)
	if arg_76_0._skeletonGraphic then
		arg_76_0._skeletonGraphic:Update(Time.deltaTime)
	end
end

function var_0_0.getMultipFaceAction(arg_77_0, arg_77_1)
	if arg_77_0.multipleFaceFlag then
		local var_77_0 = tonumber(arg_77_1)

		if var_77_0 and var_77_0 >= 0 then
			for iter_77_0, iter_77_1 in ipairs(arg_77_0.multipleFaceData) do
				if iter_77_1[1] == arg_77_0:getIdleName() then
					return tostring(var_77_0 + iter_77_1[2])
				end
			end
		end
	end

	return arg_77_1
end

function var_0_0.unloadCueSheet(arg_78_0)
	if not arg_78_0.loadSheets then
		return
	end

	for iter_78_0, iter_78_1 in ipairs(arg_78_0.loadSheets) do
		pg.CriMgr.GetInstance():UnloadCueSheet(iter_78_1)
	end

	arg_78_0.loadSheets = {}
end

function var_0_0.Dispose(arg_79_0)
	arg_79_0._materialDic = {}

	if arg_79_0.updateLocal then
		arg_79_0._skeletonGraphic.UpdateLocal = arg_79_0._skeletonGraphic.UpdateLocal - arg_79_0.updateLocal
		arg_79_0.updateLocal = nil
	end

	if arg_79_0._spinePaintingData then
		arg_79_0._spinePaintingData:Clear()
	end

	for iter_79_0, iter_79_1 in pairs(arg_79_0._loadSpineDic) do
		PoolMgr.GetInstance():ReturnSpinePainting(iter_79_0, iter_79_1)
	end

	for iter_79_2, iter_79_3 in pairs(arg_79_0._loadUIDic) do
		PoolMgr.GetInstance():ReturnUI(iter_79_2, iter_79_3)
	end

	arg_79_0._loadSpineDic = {}
	arg_79_0._loadUIDic = {}

	arg_79_0:unloadCueSheet()

	if arg_79_0._go ~= nil then
		var_0_1.Destroy(arg_79_0._go)
	end

	if arg_79_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_79_0._bgEffectGo)
	end

	arg_79_0._go = nil
	arg_79_0._tf = nil
	arg_79_0._bgEffectGo = nil
	arg_79_0._bgEffectTf = nil

	if arg_79_0.spineAnim then
		arg_79_0.spineAnim:SetActionCallBack(nil)
	end

	if arg_79_0._slotAlphaTimer then
		arg_79_0._slotAlphaTimer:Stop()

		arg_79_0._slotAlphaTimer = nil
	end

	if arg_79_0.stepSlotAlpha and #arg_79_0.stepSlotAlpha > 0 then
		for iter_79_4, iter_79_5 in ipairs(arg_79_0._slotAlphaTimer) do
			iter_79_5.slot = nil
		end

		arg_79_0._slotAlphaTimer = {}
	end
end

function var_0_0.getPaintingName(arg_80_0)
	return arg_80_0._spinePaintingData:GetShipName()
end

return var_0_0
