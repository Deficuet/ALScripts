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

	if var_24_1 and arg_24_0._skeletonGraphic and arg_24_0._skeletonGraphic.SkeletonData then
		if arg_24_0._skeletonGraphic.SkeletonData:FindSkin(var_24_1) ~= nil then
			arg_24_0:SetSkeletonSkin(var_24_1)
		elseif arg_24_0._skeletonGraphic.SkeletonData:FindSkin("default") ~= nil then
			arg_24_0:SetSkeletonSkin("default")
		end
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
						local var_28_6 = true
						local var_28_7 = true

						if var_28_2.idle and type(var_28_2.idle) == "string" then
							var_28_6 = var_28_2.idle == arg_28_0._idleName
						elseif var_28_2.idle and type(var_28_2.idle) == "table" then
							var_28_6 = table.contains(var_28_2.idle, arg_28_0._idleName)
						end

						if var_28_2.skin and type(var_28_2.skin) == "string" then
							var_28_7 = var_28_2.skin == arg_28_0._skeletonSkin
						elseif var_28_2.skin and type(var_28_2.skin) == "table" then
							var_28_7 = table.contains(var_28_2.skin, arg_28_0._skeletonSkin)
						end

						setActive(var_28_5, var_28_6 and var_28_7)
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
	arg_33_0:updateHitArea()
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
	local var_40_0 = arg_40_3.fold
	local var_40_1 = arg_40_3.effect_hide
	local var_40_2 = arg_40_3.action_cv
	local var_40_3 = arg_40_3.finish_cv
	local var_40_4 = arg_40_3.alpha_data and arg_40_3.alpha_data or nil
	local var_40_5 = arg_40_3.skin_change and arg_40_3.skin_change or nil
	local var_40_6 = arg_40_3.clear_track and arg_40_3.clear_track or nil
	local var_40_7 = arg_40_3.idle and arg_40_3.idle or nil
	local var_40_8 = arg_40_3.change_idle
	local var_40_9 = arg_40_3.action
	local var_40_10 = arg_40_3.event
	local var_40_11 = var_40_5
	local var_40_12
	local var_40_13
	local var_40_14

	if type(var_40_8) == "table" and type(var_40_9) == "table" then
		local var_40_15 = math.random(1, #var_40_9)

		var_40_12 = var_40_9[var_40_15]
		var_40_14 = var_40_8[var_40_15]
	elseif type(var_40_7) == "table" and type(var_40_9) == "table" then
		local var_40_16 = table.indexof(var_40_7, arg_40_0:getIdleName())

		var_40_12 = var_40_9[var_40_16]

		if type(var_40_8) == "table" then
			var_40_14 = var_40_8[var_40_16]
		end
	end

	if not var_40_12 then
		if type(var_40_9) == "string" then
			var_40_12 = var_40_9
		elseif type(var_40_9) == "table" then
			var_40_12 = var_40_9[math.random(1, #var_40_9)]
		end
	end

	if not var_40_14 then
		if type(var_40_8) == "string" then
			var_40_14 = var_40_8
		elseif type(var_40_8) == "table" then
			var_40_14 = var_40_8[math.random(1, #var_40_8)]
		end
	end

	if not var_40_13 then
		if type(var_40_10) == "string" then
			var_40_13 = var_40_10
		elseif type(var_40_10) == "table" then
			var_40_13 = var_40_10[math.random(1, #var_40_10)]
		end
	end

	if arg_40_1 == SpinePaintingConst.drag_type_normal then
		if var_40_4 and #var_40_4 > 0 then
			arg_40_0:SetAlphaData(var_40_4)
		end

		local var_40_17 = arg_40_3.material and arg_40_3.material or nil
		local var_40_18 = arg_40_3.material_time and arg_40_3.material_time or nil

		if var_40_17 then
			if LeanTween.isTweening(go(arg_40_0._tf)) then
				return false
			end

			arg_40_0:getSpineMaterial(var_40_17, function(arg_41_0)
				arg_40_0._skeletonGraphic.material = arg_41_0

				if var_40_18 then
					LeanTween.delayedCall(go(arg_40_0._tf), var_40_18, System.Action(function()
						arg_40_0._skeletonGraphic.material = arg_40_0._baseMaterial

						arg_40_0:changePaintingIdle(var_40_14)
					end))
				end
			end)
		end

		if var_40_6 and #var_40_6 > 0 then
			for iter_40_0, iter_40_1 in ipairs(var_40_6) do
				arg_40_0:SetEmptyAction(iter_40_1)
			end
		end

		if var_40_12 and var_40_12 ~= "" and arg_40_0:checkActionPlayAble(var_40_12, false, 0) then
			print("播放动作 .." .. var_40_12 .. "下一个待机动作 .. " .. var_40_14)

			if var_40_0 then
				pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, true)
			end

			arg_40_0:setEffectVisible(var_40_1, false)
			arg_40_0:SetActionWithFinishCallback(var_40_12, 0, function()
				if var_40_11 and var_40_11 ~= "" then
					arg_40_0:changeSkeletonSkin(var_40_11)
				end

				if var_40_0 then
					pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, false)
				end

				arg_40_0:changePaintingIdle(var_40_14 and var_40_14 or arg_40_0:getIdleName())
				arg_40_0:setEffectVisible(var_40_1, true)

				if var_40_3 and var_40_3 ~= "" then
					arg_40_0:PlayCv(var_40_3)
				end
			end, false, function()
				if var_40_2 and var_40_2 ~= "" then
					arg_40_0:PlayCv(var_40_2)
				end

				if var_40_13 and type(var_40_13) == "string" and arg_40_0._eventTriggerCall then
					arg_40_0._eventTriggerCall(var_40_13)
				end
			end)
		end

		if not var_40_12 or var_40_12 == "" then
			if var_40_11 and var_40_11 ~= "" then
				arg_40_0:changeSkeletonSkin(var_40_11)
			end

			if var_40_14 and var_40_14 ~= "" then
				arg_40_0:changePaintingIdle(var_40_14)
			end

			if var_40_13 and type(var_40_13) == "string" and arg_40_0._eventTriggerCall then
				arg_40_0._eventTriggerCall(var_40_13)
			end

			return false
		end
	end

	return true
end

function var_0_0.SetAlphaData(arg_45_0, arg_45_1)
	for iter_45_0, iter_45_1 in ipairs(arg_45_1) do
		local var_45_0 = iter_45_1[1]
		local var_45_1 = iter_45_1[2]
		local var_45_2 = iter_45_1[3]
		local var_45_3 = arg_45_0:getSlotAlpha(var_45_0)

		if not arg_45_0:getStepSlotAlha(var_45_0) and var_45_3 then
			local var_45_4
			local var_45_5

			for iter_45_2, iter_45_3 in ipairs(var_45_1) do
				if math.abs(var_45_3 - iter_45_3) <= 0.1 then
					var_45_5 = iter_45_2 + 1
				end

				if var_45_5 == iter_45_2 then
					var_45_4 = iter_45_3
				end
			end

			var_45_4 = var_45_4 or var_45_1[1]

			if var_45_4 then
				arg_45_0:setStepSlotAlpha(var_45_0, var_45_4, var_45_2)
			end
		end
	end
end

function var_0_0.PlayCv(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0._spinePaintingData.ship:getSkinId()
	local var_46_1 = pg.CriMgr.GetCVBankName(ShipWordHelper.RawGetCVKey(var_46_0))
	local var_46_2 = pg.ship_skin_template[var_46_0].group_index
	local var_46_3 = arg_46_1 .. "_" .. var_46_2

	print("try playing cv" .. var_46_1 .. ":" .. var_46_3)
	pg.CriMgr.GetInstance():playCueSheetVoice(var_46_1, var_46_3, true, function(arg_47_0)
		if arg_47_0 then
			print("播放的语音长度为 = " .. arg_47_0:GetLength())
		end
	end)
end

function var_0_0.changeSkeletonSkin(arg_48_0, arg_48_1)
	if arg_48_0._skeletonSkin == arg_48_1 then
		arg_48_0:SetDefaultSkeletonSkin()
	else
		arg_48_0:SetSkeletonSkin(arg_48_1)
	end

	SpinePaintingDrag.SetPaintingInitSkin(arg_48_0.mainSpineAnim.name, arg_48_0._spinePaintingData.ship.id, arg_48_0._skeletonSkin)
end

function var_0_0.setEffectVisible(arg_49_0, arg_49_1, arg_49_2)
	if not arg_49_1 or #arg_49_1 == 0 then
		return
	end

	for iter_49_0 = 1, #arg_49_1 do
		local var_49_0 = findTF(arg_49_0._tf, arg_49_1[iter_49_0])

		if var_49_0 then
			setActive(var_49_0, arg_49_2)
		end
	end
end

function var_0_0.matchDragFlag(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	local var_50_0 = arg_50_2.hit

	if var_50_0 and var_50_0 ~= arg_50_1 then
		return false
	end

	local var_50_1 = arg_50_2.skin

	if var_50_1 and var_50_1 ~= "" and arg_50_0._skeletonSkin ~= var_50_1 then
		return false
	end

	local var_50_2 = arg_50_2.idle

	if var_50_2 and type(var_50_2) == "string" and arg_50_0:getIdleName() ~= var_50_2 then
		return false
	elseif var_50_2 and type(var_50_2) == "table" and not table.contains(var_50_2, arg_50_0:getIdleName()) then
		return false
	end

	local var_50_3 = arg_50_2.favor

	if var_50_3 and var_50_3 >= 0 then
		local var_50_4 = arg_50_0._spinePaintingData.ship:getCVIntimacy()

		if var_50_4 and var_50_4 < var_50_3 then
			return false
		end
	end

	if arg_50_2.click and arg_50_2.click == tobool(arg_50_3) then
		return false
	end

	return true
end

function var_0_0.OnDragMove(arg_51_0, arg_51_1, arg_51_2)
	return
end

function var_0_0.getSpineMaterial(arg_52_0, arg_52_1, arg_52_2)
	if not arg_52_0._materialDic then
		arg_52_0._materialDic = {}
	end

	if arg_52_0._materialDic[arg_52_1] then
		arg_52_2(arg_52_0._materialDic[arg_52_1])
	else
		arg_52_0._materialDic[arg_52_1] = LoadAny("spinematerials", arg_52_1, typeof(Material))

		arg_52_2(arg_52_0._materialDic[arg_52_1])
	end
end

function var_0_0.changePaintingIdle(arg_53_0, arg_53_1)
	arg_53_0:setIdleName(arg_53_1)
	arg_53_0:SetAction(arg_53_1, 0, true)
	SpinePaintingDrag.SetPaintingInitIdle(arg_53_0.mainSpineAnim.name, arg_53_0._spinePaintingData.ship.id, arg_53_1)

	arg_53_0.inAction = false
end

function var_0_0.SetShopHx(arg_54_0, arg_54_1)
	if arg_54_1 and HXSet.isHx() then
		if arg_54_0:getAnimationExist("shop_hx") then
			arg_54_0:setIdleName("shop_hx")
			arg_54_0:SetAction(arg_54_0._idleName, 0, true)

			local var_54_0 = arg_54_0._tf.anchoredPosition

			arg_54_0._tf.anchoredPosition = Vector2(100000, 0)

			arg_54_0:updateSkeletonGraphicTime()
			onDelayTick(function()
				arg_54_0._tf.anchoredPosition = var_54_0
			end, 0.05)
		end
	else
		arg_54_0:setIdleName(arg_54_0:getNormalIdleName())
		arg_54_0:SetAction(arg_54_0._idleName, 0, true)
	end
end

function var_0_0.SetAction(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
	if not arg_56_0:checkActionPlayAble(arg_56_1, arg_56_3, arg_56_2) then
		return false
	end

	if arg_56_2 and arg_56_2 == 0 then
		arg_56_0.lastPlayAction = arg_56_1
	end

	if arg_56_2 == 0 and arg_56_1 ~= arg_56_0:getIdleName() then
		arg_56_0.inAction = true
	end

	if arg_56_0.multipleFaceFlag and not arg_56_0.inAction then
		arg_56_1 = arg_56_0:getMultipFaceAction(arg_56_1)
	end

	local var_56_0 = arg_56_0._spinePaintingData.ship:getSkinId()
	local var_56_1 = pg.ship_skin_template[var_56_0].voice_lang

	if arg_56_2 == 0 and var_56_1 and #var_56_1 > 0 then
		local var_56_2 = ShipWordHelper.GetLanguageSetting(var_56_0)

		if var_56_2 <= 0 then
			var_56_2 = 1
		end

		local var_56_3 = var_56_1[var_56_2]
		local var_56_4 = arg_56_0:GetVoiceLandAction(arg_56_1, var_56_3)

		if arg_56_0:getAnimationExist(var_56_4) then
			arg_56_1 = var_56_4
		end
	end

	arg_56_0:updateEffectVisible(arg_56_1)

	for iter_56_0, iter_56_1 in ipairs(arg_56_0.spineAnimList) do
		iter_56_1:SetAction(arg_56_1, arg_56_2)

		if iter_56_1:GetAnimationState() then
			GetComponent(iter_56_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end

	return true
end

function var_0_0.GetVoiceLandAction(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = ""

	if arg_57_2 == ShipSkin.VOICE_LANG_JP then
		var_57_0 = "_jp"
	elseif arg_57_2 == ShipSkin.VOICE_LANG_CN then
		var_57_0 = "_cn"
	end

	return arg_57_1 .. var_57_0
end

function var_0_0.checkActionPlayAble(arg_58_0, arg_58_1, arg_58_2, arg_58_3)
	if arg_58_3 and arg_58_3 == 0 and arg_58_0.inAction and not arg_58_2 then
		return false
	end

	if arg_58_0.lockLayer and not arg_58_2 and arg_58_0.inAction and arg_58_3 and arg_58_3 > 0 then
		return false
	end

	if arg_58_0.lastPlayAction and arg_58_0.lastPlayAction ~= arg_58_0._idleName and arg_58_3 and arg_58_3 > 0 then
		return false
	end

	if arg_58_0._idleName ~= arg_58_0:getNormalIdleName() and arg_58_1 == "login" then
		return false
	end

	if arg_58_0.dragShipFlag and arg_58_0.shipDragData.action_enable then
		local var_58_0 = arg_58_0.shipDragData.action_enable

		for iter_58_0 = 1, #var_58_0 do
			local var_58_1 = var_58_0[iter_58_0]

			if var_58_1.name == arg_58_0._idleName and table.contains(var_58_1.ignore, arg_58_1) then
				return false
			end
		end
	end

	return true
end

function var_0_0.ClearAction(arg_59_0)
	arg_59_0.inAction = false
end

function var_0_0.getSlotAlpha(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_0._skeletonGraphic.Skeleton:FindSlot(arg_60_1)

	if var_60_0 then
		return ReflectionHelp.RefGetProperty(typeof("Spine.Slot"), "A", var_60_0)
	end

	return nil
end

function var_0_0.setSlotAlpha(arg_61_0, arg_61_1, arg_61_2)
	ReflectionHelp.RefSetProperty(typeof("Spine.Slot"), "A", arg_61_1, arg_61_2)
end

function var_0_0.setStepSlotAlpha(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	if not arg_62_0.slotDic[arg_62_1] then
		arg_62_0.slotDic[arg_62_1] = arg_62_0._skeletonGraphic.Skeleton:FindSlot(arg_62_1)
	end

	if arg_62_0.slotDic[arg_62_1] then
		if not arg_62_3 or arg_62_3 <= 0 then
			print("设置插槽 " .. arg_62_1 .. " alpha = " .. arg_62_2)
			arg_62_0:setSlotAlpha(arg_62_0.slotDic[arg_62_1], arg_62_2)
		else
			local var_62_0 = arg_62_0:getSlotAlpha(arg_62_1)

			table.insert(arg_62_0.stepSlotAlpha, {
				smooth = 0,
				name = arg_62_1,
				slot = arg_62_0.slotDic[arg_62_1],
				current = var_62_0,
				target = arg_62_2,
				time = arg_62_3
			})
		end
	end
end

function var_0_0.getStepSlotAlha(arg_63_0, arg_63_1)
	for iter_63_0, iter_63_1 in ipairs(arg_63_0.stepSlotAlpha) do
		if iter_63_1.name == arg_63_1 then
			return iter_63_1
		end
	end

	return nil
end

function var_0_0.updateSlotAlpha(arg_64_0)
	for iter_64_0 = #arg_64_0.stepSlotAlpha, 1, -1 do
		local var_64_0 = arg_64_0.stepSlotAlpha[iter_64_0]

		var_64_0.current, var_64_0.smooth = Mathf.SmoothDamp(var_64_0.current, var_64_0.target, var_64_0.smooth, var_64_0.time)

		if math.abs(var_64_0.target - var_64_0.current) <= 0.02 then
			print("设置插槽 " .. var_64_0.name .. " alpha = " .. var_64_0.target)
			arg_64_0:setSlotAlpha(var_64_0.slot, var_64_0.target)

			table.remove(arg_64_0.stepSlotAlpha, iter_64_0).slot = nil
		else
			print("设置插槽 " .. var_64_0.name .. " alpha = " .. var_64_0.current)
			arg_64_0:setSlotAlpha(var_64_0.slot, var_64_0.current)
		end
	end
end

function var_0_0.updateEffectVisible(arg_65_0, arg_65_1)
	if arg_65_0.shipEffectActionAble and arg_65_0._effectsTf then
		if table.contains(arg_65_0.shipEffectActionAble, arg_65_1) then
			if isActive(arg_65_0._effectsTf) then
				setActive(arg_65_0._effectsTf, false)
			end
		elseif not isActive(arg_65_0._effectsTf) then
			setActive(arg_65_0._effectsTf, true)
		end
	end
end

function var_0_0.isInAction(arg_66_0)
	return arg_66_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_67_0, arg_67_1, arg_67_2, arg_67_3, arg_67_4, arg_67_5)
	if not arg_67_0:checkActionPlayAble(arg_67_1, arg_67_4, arg_67_2) then
		return
	end

	if arg_67_0.mainSpineAnim then
		arg_67_0.mainSpineAnim:SetActionCallBack(function(arg_68_0)
			if arg_68_0 == "finish" and arg_67_3 then
				arg_67_0.inAction = false

				arg_67_0.mainSpineAnim:SetActionCallBack(nil)
				arg_67_3()

				arg_67_3 = nil
			elseif arg_68_0 == "action" and arg_67_5 then
				arg_67_5()

				arg_67_5 = nil
			elseif (string.match(arg_68_0, "^bgm_") or string.match(arg_68_0, "^bgmsingle_")) and arg_67_0._visible then
				local var_68_0 = string.match(arg_68_0, "^bgm_(.*)$") or string.match(arg_68_0, "^bgmsingle_(.*)$")
				local var_68_1 = string.split(var_68_0, "_")
				local var_68_2 = string.match(arg_68_0, "^bgm_(.*)$") and true or false
				local var_68_3 = "se-skin"
				local var_68_4 = var_68_1[1] .. "_" .. var_68_1[2]
				local var_68_5 = var_68_1[3] and tonumber(var_68_1[3]) or 1

				pg.CriMgr.GetInstance():PlayPaintingBgm(var_68_3, var_68_4, var_68_2, var_68_5, Live2dConst.GetPaintingBgmVolume(arg_67_0._spinePaintingData.ship:getSkinId()))
			end
		end)
	end

	arg_67_0:SetAction(arg_67_1, arg_67_2, arg_67_4)
end

function var_0_0.SetOnceAction(arg_69_0, arg_69_1, arg_69_2, arg_69_3, arg_69_4)
	if not arg_69_0:checkActionPlayAble(arg_69_1, arg_69_4, 0) then
		return
	end

	arg_69_0:SetActionWithFinishCallback(arg_69_1, 0, function()
		arg_69_0:SetAction(arg_69_0:getIdleName(), 0)

		if arg_69_2 then
			arg_69_2()

			arg_69_2 = nil
		end
	end, arg_69_4, function()
		if arg_69_3 then
			arg_69_3()

			arg_69_3 = nil
		end
	end)
end

function var_0_0.pullInitCallback(arg_72_0, arg_72_1)
	table.insert(arg_72_0._initCallback, arg_72_1)
end

function var_0_0.getAnimationExist(arg_73_0, arg_73_1)
	if not arg_73_0._mainAnimationData then
		arg_73_0._mainAnimationData = arg_73_0.mainSpineAnim:GetAnimationState()
	end

	local var_73_0

	if arg_73_0._skeletonGraphic then
		var_73_0 = arg_73_0._skeletonGraphic.Skeleton.Data:FindAnimation(arg_73_1)
	end

	return var_73_0
end

function var_0_0.SetEmptyAction(arg_74_0, arg_74_1)
	if not arg_74_0.spineAnimList then
		return
	end

	for iter_74_0, iter_74_1 in ipairs(arg_74_0.spineAnimList) do
		local var_74_0 = iter_74_1:GetAnimationState()

		if var_74_0 then
			var_74_0:SetEmptyAnimation(arg_74_1, 0)
			GetComponent(iter_74_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.GetSpineTransform(arg_75_0)
	return arg_75_0._tf
end

function var_0_0.SetSkin(arg_76_0, arg_76_1)
	if arg_76_0._skeletonGraphic and arg_76_0._skeletonGraphic.SkeletonData and arg_76_0._skeletonGraphic.SkeletonData:FindSkin(arg_76_1) ~= nil then
		arg_76_0._skeletonGraphic.Skeleton:SetSkin(arg_76_1)
		arg_76_0._skeletonGraphic.Skeleton:SetSlotsToSetupPose()
	end
end

function var_0_0.updateSkeletonGraphicTime(arg_77_0)
	if arg_77_0._skeletonGraphic then
		arg_77_0._skeletonGraphic:Update(Time.deltaTime)
	end
end

function var_0_0.getMultipFaceAction(arg_78_0, arg_78_1)
	if arg_78_0.multipleFaceFlag then
		local var_78_0 = tonumber(arg_78_1)

		if var_78_0 and var_78_0 >= 0 then
			for iter_78_0, iter_78_1 in ipairs(arg_78_0.multipleFaceData) do
				if iter_78_1[1] == arg_78_0:getIdleName() then
					return tostring(var_78_0 + iter_78_1[2])
				end
			end
		end
	end

	return arg_78_1
end

function var_0_0.unloadCueSheet(arg_79_0)
	if not arg_79_0.loadSheets then
		return
	end

	for iter_79_0, iter_79_1 in ipairs(arg_79_0.loadSheets) do
		pg.CriMgr.GetInstance():UnloadCueSheet(iter_79_1)
	end

	arg_79_0.loadSheets = {}
end

function var_0_0.Dispose(arg_80_0)
	arg_80_0._materialDic = {}

	if arg_80_0.updateLocal then
		arg_80_0._skeletonGraphic.UpdateLocal = arg_80_0._skeletonGraphic.UpdateLocal - arg_80_0.updateLocal
		arg_80_0.updateLocal = nil
	end

	if arg_80_0._spinePaintingData then
		arg_80_0._spinePaintingData:Clear()
	end

	for iter_80_0, iter_80_1 in pairs(arg_80_0._loadSpineDic) do
		PoolMgr.GetInstance():ReturnSpinePainting(iter_80_0, iter_80_1)
	end

	for iter_80_2, iter_80_3 in pairs(arg_80_0._loadUIDic) do
		PoolMgr.GetInstance():ReturnUI(iter_80_2, iter_80_3)
	end

	arg_80_0._loadSpineDic = {}
	arg_80_0._loadUIDic = {}

	arg_80_0:unloadCueSheet()

	if arg_80_0._go ~= nil then
		var_0_1.Destroy(arg_80_0._go)
	end

	if arg_80_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_80_0._bgEffectGo)
	end

	arg_80_0._go = nil
	arg_80_0._tf = nil
	arg_80_0._bgEffectGo = nil
	arg_80_0._bgEffectTf = nil

	if arg_80_0.spineAnim then
		arg_80_0.spineAnim:SetActionCallBack(nil)
	end

	if arg_80_0._slotAlphaTimer then
		arg_80_0._slotAlphaTimer:Stop()

		arg_80_0._slotAlphaTimer = nil
	end

	if arg_80_0.stepSlotAlpha and #arg_80_0.stepSlotAlpha > 0 then
		for iter_80_4, iter_80_5 in ipairs(arg_80_0._slotAlphaTimer) do
			iter_80_5.slot = nil
		end

		arg_80_0._slotAlphaTimer = {}
	end
end

function var_0_0.getPaintingName(arg_81_0)
	return arg_81_0._spinePaintingData:GetShipName()
end

return var_0_0
