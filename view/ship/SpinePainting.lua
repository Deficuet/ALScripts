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

local function var_0_2(arg_7_0, arg_7_1)
	arg_7_0._go = arg_7_1
	arg_7_0._tf = tf(arg_7_1)

	HotfixHelper.SetLayerRecursively(arg_7_0._go, LayerMask.NameToLayer("UI"))
	arg_7_0._tf:SetParent(arg_7_0._spinePaintingData.parent, true)

	arg_7_0._tf.localScale = arg_7_0._spinePaintingData.scale
	arg_7_0._tf.localPosition = arg_7_0._spinePaintingData.pos
	arg_7_0.spineAnimList = {}

	local var_7_0 = arg_7_0._tf:GetComponent(typeof(ItemList)).prefabItem:ToTable()

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		arg_7_0.spineAnimList[#arg_7_0.spineAnimList + 1] = GetOrAddComponent(iter_7_1, "SpineAnimUI")
	end

	local var_7_1 = #arg_7_0.spineAnimList

	assert(var_7_1 > 0, "动态立绘至少要保证有一个spine动画，请检查" .. arg_7_0._spinePaintingData:GetShipName())

	if var_7_1 == 1 then
		arg_7_0.mainSpineAnim = arg_7_0.spineAnimList[1]
	else
		arg_7_0.mainSpineAnim = arg_7_0.spineAnimList[#arg_7_0.spineAnimList]
	end

	arg_7_0._skeletonGraphic = arg_7_0.mainSpineAnim:GetComponent("SkeletonGraphic")

	function arg_7_0.updateLocal()
		arg_7_0:onUpdateLocal()
	end

	arg_7_0._skeletonGraphic.UpdateLocal = arg_7_0._skeletonGraphic.UpdateLocal + arg_7_0.updateLocal
	arg_7_0._baseMaterial = arg_7_0._skeletonGraphic.material
	arg_7_0._idleName = arg_7_0:getNormalIdleName()
	arg_7_0.shipDragData = SpinePaintingConst.ship_drag_datas[arg_7_0._spinePaintingData:GetShipName()]
	arg_7_0.dragShipFlag = false
	arg_7_0.lockLayer = false

	if arg_7_0.shipDragData then
		arg_7_0.dragShipFlag = arg_7_0.shipDragData.drag_data and arg_7_0.shipDragData.drag_data.type
		arg_7_0.lockLayer = arg_7_0.shipDragData.drag_data.lock_layer
		arg_7_0.replaceWord = arg_7_0.shipDragData.replace_word
	end

	arg_7_0.multipleFaceFlag = false

	if arg_7_0.shipDragData and arg_7_0.shipDragData.multiple_face and arg_7_0.shipDragData.multiple_face ~= "" then
		local var_7_2 = arg_7_0.shipDragData.multiple_face.name

		arg_7_0.multipleFaceFlag = table.contains(var_7_2, arg_7_0.mainSpineAnim.name)
		arg_7_0.multipleFaceData = arg_7_0.shipDragData.multiple_face.data
	end

	arg_7_0.shipEffectActionAble = SpinePaintingConst.ship_effect_action_able[arg_7_0._spinePaintingData:GetShipName()]
	arg_7_0._effectsTf = findTF(arg_7_0._tf, "effects")

	arg_7_0:playPaintingInitIdle()
	arg_7_0:playPaintingInitSkin()

	arg_7_0.slotDic = {}
	arg_7_0.stepSlotAlpha = {}
	arg_7_0._slotAlphaTimer = Timer.New(function()
		arg_7_0:updateSlotAlpha()
	end, 0.03333333333333333, -1)

	arg_7_0._slotAlphaTimer:Start()
end

function var_0_0.getNormalIdleName(arg_10_0)
	return "normal"
end

local function var_0_3(arg_11_0, arg_11_1)
	arg_11_0._bgEffectGo = arg_11_1
	arg_11_0._bgEffectTf = tf(arg_11_1)

	HotfixHelper.SetLayerRecursively(arg_11_0._bgEffectGo, LayerMask.NameToLayer("UI"))
	arg_11_0._bgEffectTf:SetParent(arg_11_0._spinePaintingData.effectParent, true)

	arg_11_0._bgEffectTf.localScale = arg_11_0._spinePaintingData.bgEffectScale
	arg_11_0._bgEffectTf.localPosition = arg_11_0._spinePaintingData.bgEffectPos
end

function var_0_0.Ctor(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0._spinePaintingData = arg_12_1
	arg_12_0._loadSpineDic = {}
	arg_12_0._loadUIDic = {}
	arg_12_0._initCallback = {}

	parallelAsync({
		function(arg_13_0)
			local var_13_0 = arg_12_0._spinePaintingData:GetShipName()
			local var_13_1, var_13_2 = HXSet.autoHxShift("spinepainting/", var_13_0)
			local var_13_3 = var_13_1 .. var_13_2

			PoolMgr.GetInstance():GetSpinePainting(var_13_0, true, function(arg_14_0)
				arg_12_0._loadSpineDic[var_13_0] = arg_14_0

				var_0_2(arg_12_0, arg_14_0)
				arg_13_0()
			end)
		end,
		function(arg_15_0)
			local var_15_0 = arg_12_0._spinePaintingData.bgEffectName

			if var_15_0 ~= nil then
				PoolMgr.GetInstance():GetUI(var_15_0, true, function(arg_16_0)
					arg_12_0._loadUIDic[var_15_0] = arg_16_0

					var_0_3(arg_12_0, arg_16_0)
					arg_15_0()
				end)
			else
				arg_15_0()
			end
		end
	}, function()
		setActive(arg_12_0._spinePaintingData.parent, true)
		setActive(arg_12_0._spinePaintingData.effectParent, true)

		arg_12_0._initFlag = true

		arg_12_0:updateLink()

		for iter_17_0, iter_17_1 in ipairs(arg_12_0._initCallback) do
			iter_17_1()
		end

		arg_12_0._initCallback = {}

		if arg_12_2 then
			arg_12_2(arg_12_0)
		end
	end)
end

function var_0_0.updateLink(arg_18_0)
	arg_18_0.slotOverride = {}

	local var_18_0 = arg_18_0._spinePaintingData.ship:getSkinId()
	local var_18_1 = ChangeSkinLink.CHANGE_SKIN_LINK_DATA[var_18_0]

	if var_18_1 then
		local var_18_2 = var_18_1.link_id
		local var_18_3 = var_18_1.relations

		if var_18_1.link_type == ChangeSkinLink.L2D_TYPE then
			local var_18_4

			if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 then
				var_18_4 = ChangeSkinLink.GetSaveL2dData(arg_18_0._spinePaintingData.ship.id, var_18_2)
			else
				var_18_4 = ChangeSkinLink.L2D_PARAMETER_DIC[arg_18_0._spinePaintingData.ship.id]
			end

			var_18_4 = var_18_4 or {}

			for iter_18_0, iter_18_1 in ipairs(var_18_3) do
				local var_18_5 = iter_18_1.type

				if var_18_5 == ChangeSkinLink.change_parameter_link_slot then
					local var_18_6 = true
					local var_18_7 = iter_18_1.link_parameter
					local var_18_8 = iter_18_1.slot_list

					for iter_18_2, iter_18_3 in ipairs(var_18_7) do
						local var_18_9 = iter_18_3.name
						local var_18_10 = iter_18_3.num

						if (var_18_4[var_18_9] and var_18_4[var_18_9] or 0) ~= var_18_10 then
							var_18_6 = false
						end
					end

					if var_18_6 then
						for iter_18_4, iter_18_5 in ipairs(var_18_8) do
							table.insert(arg_18_0.slotOverride, iter_18_5)
						end
					end
				elseif var_18_5 == ChangeSkinLink.change_parameter_link_skin then
					local var_18_11 = true
					local var_18_12 = iter_18_1.link_parameter
					local var_18_13 = iter_18_1.skeleton_skin

					for iter_18_6, iter_18_7 in ipairs(var_18_12) do
						local var_18_14 = iter_18_7.name
						local var_18_15 = iter_18_7.num

						if (var_18_4[var_18_14] and var_18_4[var_18_14] or 0) ~= var_18_15 then
							var_18_11 = false
						end
					end

					if var_18_11 then
						arg_18_0:SetSkeletonSkin(var_18_13)
					end
				end
			end
		end
	end
end

function var_0_0.setL2dSlot(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0._skeletonGraphic.Skeleton:SetAttachment(arg_19_1, arg_19_2)
end

function var_0_0.onUpdateLocal(arg_20_0)
	if arg_20_0.slotOverride then
		for iter_20_0, iter_20_1 in ipairs(arg_20_0.slotOverride) do
			arg_20_0:setL2dSlot(iter_20_1[1], iter_20_1[2])
		end
	end
end

function var_0_0.SetVisible(arg_21_0, arg_21_1)
	if arg_21_0._spinePaintingData.effectParent then
		setActive(arg_21_0._spinePaintingData.effectParent, arg_21_1)
	end

	pg.ViewUtils.SetLayer(arg_21_0._tf, arg_21_1 and Layer.UI or Layer.UIHidden)
	setActiveViaLayer(arg_21_0._spinePaintingData.effectParent, arg_21_1)

	if arg_21_0._skeletonGraphic then
		arg_21_0._skeletonGraphic.timeScale = arg_21_1 and 1 or 0
	end

	if not arg_21_1 then
		arg_21_0.mainSpineAnim:SetActionCallBack(nil)

		arg_21_0.inAction = false
		arg_21_0.clickActionList = {}

		if LeanTween.isTweening(go(arg_21_0._tf)) then
			LeanTween.cancel(go(arg_21_0._tf))
		end

		if arg_21_0._baseShader then
			if arg_21_0._skeletonGraphic then
				arg_21_0._skeletonGraphic.material.shader = arg_21_0._baseShader
			end

			arg_21_0._baseShader = nil
		end

		arg_21_0._displayWord = false
	else
		arg_21_0._skeletonGraphic:Update(Time.deltaTime)
	end

	arg_21_0:playPaintingInitIdle()
	arg_21_0:playPaintingInitSkin()
end

function var_0_0.getInitFlag(arg_22_0)
	return arg_22_0._initFlag
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
		arg_23_0:SetAction(arg_23_0._idleName, 0, true)

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
	local var_40_3 = arg_40_3.cv
	local var_40_4 = arg_40_3.alpha_data and arg_40_3.alpha_data or nil
	local var_40_5 = arg_40_3.skin_change and arg_40_3.skin_change or nil
	local var_40_6 = arg_40_3.clear_track and arg_40_3.clear_track or nil
	local var_40_7

	if type(arg_40_3.action) == "string" then
		var_40_7 = arg_40_3.action
	elseif type(arg_40_3.action) == "table" then
		var_40_7 = arg_40_3.action[math.random(1, #arg_40_3.action)]
	end

	local var_40_8

	if type(arg_40_3.event) == "string" then
		var_40_8 = arg_40_3.event
	elseif type(arg_40_3.event) == "table" then
		var_40_8 = arg_40_3.event[math.random(1, #arg_40_3.event)]
	end

	if arg_40_1 == SpinePaintingConst.drag_type_normal then
		if var_40_4 and #var_40_4 > 0 then
			for iter_40_0, iter_40_1 in ipairs(var_40_4) do
				local var_40_9 = iter_40_1[1]
				local var_40_10 = iter_40_1[2]
				local var_40_11 = iter_40_1[3]
				local var_40_12 = arg_40_0:getSlotAlpha(var_40_9)

				if not arg_40_0:getStepSlotAlha(var_40_9) and var_40_12 then
					local var_40_13
					local var_40_14

					for iter_40_2, iter_40_3 in ipairs(var_40_10) do
						if math.abs(var_40_12 - iter_40_3) <= 0.1 then
							var_40_14 = iter_40_2 + 1
						end

						if var_40_14 == iter_40_2 then
							var_40_13 = iter_40_3
						end
					end

					var_40_13 = var_40_13 or var_40_10[1]

					if var_40_13 then
						arg_40_0:setStepSlotAlpha(var_40_9, var_40_13, var_40_11)
					end
				end
			end
		end

		local var_40_15 = arg_40_3.material and arg_40_3.material or nil
		local var_40_16 = arg_40_3.material_time and arg_40_3.material_time or nil

		if var_40_15 then
			if LeanTween.isTweening(go(arg_40_0._tf)) then
				return false
			end

			arg_40_0:getSpineMaterial(var_40_15, function(arg_41_0)
				arg_40_0._skeletonGraphic.material = arg_41_0

				if var_40_16 then
					LeanTween.delayedCall(go(arg_40_0._tf), var_40_16, System.Action(function()
						arg_40_0._skeletonGraphic.material = arg_40_0._baseMaterial

						arg_40_0:changePaintingIdle(var_40_0)
					end))
				end
			end)
		end

		if var_40_6 and #var_40_6 > 0 then
			for iter_40_4, iter_40_5 in ipairs(var_40_6) do
				arg_40_0:SetEmptyAction(iter_40_5)
			end
		end

		if var_40_7 and var_40_7 ~= "" and arg_40_0:checkActionPlayAble(var_40_7, false, 0) then
			if var_40_1 then
				pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, true)
			end

			arg_40_0:setEffectVisible(var_40_2, false)
			arg_40_0:SetActionWithFinishCallback(var_40_7, 0, function()
				if var_40_5 and var_40_5 ~= "" then
					arg_40_0:changeSkeletonSkin(var_40_5)
				end

				if var_40_1 then
					pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, false)
				end

				arg_40_0:changePaintingIdle(var_40_0 and var_40_0 or arg_40_0:getIdleName())
				arg_40_0:setEffectVisible(var_40_2, true)
			end, false, function()
				if var_40_3 and var_40_3 ~= "" then
					local var_44_0 = arg_40_0._spinePaintingData.ship:getSkinId()
					local var_44_1 = pg.CriMgr.GetCVBankName(ShipWordHelper.RawGetCVKey(var_44_0))
					local var_44_2 = pg.ship_skin_template[var_44_0].group_index
					local var_44_3 = var_40_3 .. "_" .. var_44_2

					print("try playing cv" .. var_44_1 .. ":" .. var_44_3)
					pg.CriMgr.GetInstance():playCueSheetVoice(var_44_1, var_44_3, true, function(arg_45_0)
						if arg_45_0 then
							print("播放的语音长度为 = " .. arg_45_0:GetLength())
						end
					end)
				end

				if var_40_8 and type(var_40_8) == "string" and arg_40_0._eventTriggerCall then
					arg_40_0._eventTriggerCall(var_40_8)
				end
			end)
		end

		if not var_40_7 or var_40_7 == "" then
			if var_40_5 and var_40_5 ~= "" then
				arg_40_0:changeSkeletonSkin(var_40_5)
			end

			if var_40_0 and var_40_0 ~= "" then
				arg_40_0:changePaintingIdle(var_40_0)
			end

			if var_40_8 and type(var_40_8) == "string" and arg_40_0._eventTriggerCall then
				arg_40_0._eventTriggerCall(var_40_8)
			end

			return false
		end
	end

	return true
end

function var_0_0.changeSkeletonSkin(arg_46_0, arg_46_1)
	if arg_46_0._skeletonSkin == arg_46_1 then
		arg_46_0:SetDefaultSkeletonSkin()
	else
		arg_46_0:SetSkeletonSkin(arg_46_1)
	end

	SpinePaintingDrag.SetPaintingInitSkin(arg_46_0.mainSpineAnim.name, arg_46_0._spinePaintingData.ship.id, arg_46_0._skeletonSkin)
end

function var_0_0.setEffectVisible(arg_47_0, arg_47_1, arg_47_2)
	if not arg_47_1 or #arg_47_1 == 0 then
		return
	end

	for iter_47_0 = 1, #arg_47_1 do
		local var_47_0 = findTF(arg_47_0._tf, arg_47_1[iter_47_0])

		if var_47_0 then
			setActive(var_47_0, arg_47_2)
		end
	end
end

function var_0_0.matchDragFlag(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	local var_48_0 = arg_48_2.hit

	if var_48_0 and var_48_0 ~= arg_48_1 then
		return false
	end

	local var_48_1 = arg_48_2.skin

	if var_48_1 and var_48_1 ~= "" and arg_48_0._skeletonSkin ~= var_48_1 then
		return false
	end

	local var_48_2 = arg_48_2.idle

	if var_48_2 and var_48_2 ~= "" and arg_48_0:getIdleName() ~= var_48_2 then
		return false
	end

	local var_48_3 = arg_48_2.is_default

	if arg_48_0:getIdleName() ~= arg_48_0:getNormalIdleName() and var_48_3 and var_48_3 ~= "" then
		return false
	end

	local var_48_4 = arg_48_2.favor

	if var_48_4 and var_48_4 >= 0 then
		local var_48_5 = arg_48_0._spinePaintingData.ship:getCVIntimacy()

		if var_48_5 and var_48_5 < var_48_4 then
			return false
		end
	end

	if arg_48_2.click and arg_48_2.click == tobool(arg_48_3) then
		return false
	end

	return true
end

function var_0_0.OnDragMove(arg_49_0, arg_49_1, arg_49_2)
	return
end

function var_0_0.getSpineMaterial(arg_50_0, arg_50_1, arg_50_2)
	if not arg_50_0._materialDic then
		arg_50_0._materialDic = {}
	end

	if arg_50_0._materialDic[arg_50_1] then
		arg_50_2(arg_50_0._materialDic[arg_50_1])
	else
		arg_50_0._materialDic[arg_50_1] = LoadAny("spinematerials", arg_50_1, typeof(Material))

		arg_50_2(arg_50_0._materialDic[arg_50_1])
	end
end

function var_0_0.changePaintingIdle(arg_51_0, arg_51_1)
	arg_51_0:setIdleName(arg_51_1)
	arg_51_0:SetAction(arg_51_1, 0, true)
	SpinePaintingDrag.SetPaintingInitIdle(arg_51_0.mainSpineAnim.name, arg_51_0._spinePaintingData.ship.id, arg_51_1)

	arg_51_0.inAction = false
end

function var_0_0.SetShopHx(arg_52_0, arg_52_1)
	if arg_52_1 and HXSet.isHx() then
		if arg_52_0:getAnimationExist("shop_hx") then
			arg_52_0:setIdleName("shop_hx")
			arg_52_0:SetAction(arg_52_0._idleName, 0, true)

			local var_52_0 = arg_52_0._tf.anchoredPosition

			arg_52_0._tf.anchoredPosition = Vector2(100000, 0)

			arg_52_0:updateSkeletonGraphicTime()
			onDelayTick(function()
				arg_52_0._tf.anchoredPosition = var_52_0
			end, 0.05)
		end
	else
		arg_52_0:setIdleName(arg_52_0:getNormalIdleName())
		arg_52_0:SetAction(arg_52_0._idleName, 0, true)
	end
end

function var_0_0.SetAction(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	if not arg_54_0:checkActionPlayAble(arg_54_1, arg_54_3, arg_54_2) then
		return false
	end

	if arg_54_2 and arg_54_2 == 0 then
		arg_54_0.lastPlayAction = arg_54_1
	end

	if arg_54_2 == 0 and arg_54_1 ~= arg_54_0:getIdleName() then
		arg_54_0.inAction = true
	end

	if arg_54_0.multipleFaceFlag and not arg_54_0.inAction then
		arg_54_1 = arg_54_0:getMultipFaceAction(arg_54_1)
	end

	local var_54_0 = arg_54_0._spinePaintingData.ship:getSkinId()
	local var_54_1 = pg.ship_skin_template[var_54_0].voice_lang

	if arg_54_2 == 0 and var_54_1 and #var_54_1 > 0 then
		local var_54_2 = ShipWordHelper.GetLanguageSetting(var_54_0)

		if var_54_2 <= 0 then
			var_54_2 = 1
		end

		local var_54_3 = var_54_1[var_54_2]
		local var_54_4 = arg_54_0:GetVoiceLandAction(arg_54_1, var_54_3)

		if arg_54_0:getAnimationExist(var_54_4) then
			arg_54_1 = var_54_4
		end
	end

	arg_54_0:updateEffectVisible(arg_54_1)

	for iter_54_0, iter_54_1 in ipairs(arg_54_0.spineAnimList) do
		iter_54_1:SetAction(arg_54_1, arg_54_2)

		if iter_54_1:GetAnimationState() then
			GetComponent(iter_54_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end

	return true
end

function var_0_0.GetVoiceLandAction(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = ""

	if arg_55_2 == ShipSkin.VOICE_LANG_JP then
		var_55_0 = "_jp"
	elseif arg_55_2 == ShipSkin.VOICE_LANG_CN then
		var_55_0 = "_cn"
	end

	return arg_55_1 .. var_55_0
end

function var_0_0.checkActionPlayAble(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
	if arg_56_3 and arg_56_3 == 0 and arg_56_0.inAction and not arg_56_2 then
		return false
	end

	if arg_56_0.lockLayer and not arg_56_2 and arg_56_0.inAction and arg_56_3 and arg_56_3 > 0 then
		return false
	end

	if arg_56_0.lastPlayAction and arg_56_0.lastPlayAction ~= arg_56_0._idleName and arg_56_3 and arg_56_3 > 0 then
		return false
	end

	if arg_56_0._idleName ~= arg_56_0:getNormalIdleName() and arg_56_1 == "login" then
		return false
	end

	if arg_56_0.dragShipFlag and arg_56_0.shipDragData.action_enable then
		local var_56_0 = arg_56_0.shipDragData.action_enable

		for iter_56_0 = 1, #var_56_0 do
			local var_56_1 = var_56_0[iter_56_0]

			if var_56_1.name == arg_56_0._idleName and table.contains(var_56_1.ignore, arg_56_1) then
				return false
			end
		end
	end

	return true
end

function var_0_0.ClearAction(arg_57_0)
	arg_57_0.inAction = false
end

function var_0_0.getSlotAlpha(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_0._skeletonGraphic.Skeleton:FindSlot(arg_58_1)

	if var_58_0 then
		return ReflectionHelp.RefGetProperty(typeof("Spine.Slot"), "A", var_58_0)
	end

	return nil
end

function var_0_0.setSlotAlpha(arg_59_0, arg_59_1, arg_59_2)
	ReflectionHelp.RefSetProperty(typeof("Spine.Slot"), "A", arg_59_1, arg_59_2)
end

function var_0_0.setStepSlotAlpha(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	if not arg_60_0.slotDic[arg_60_1] then
		arg_60_0.slotDic[arg_60_1] = arg_60_0._skeletonGraphic.Skeleton:FindSlot(arg_60_1)
	end

	if arg_60_0.slotDic[arg_60_1] then
		if not arg_60_3 or arg_60_3 <= 0 then
			print("设置插槽 " .. arg_60_1 .. " alpha = " .. arg_60_2)
			arg_60_0:setSlotAlpha(arg_60_0.slotDic[arg_60_1], arg_60_2)
		else
			local var_60_0 = arg_60_0:getSlotAlpha(arg_60_1)

			table.insert(arg_60_0.stepSlotAlpha, {
				smooth = 0,
				name = arg_60_1,
				slot = arg_60_0.slotDic[arg_60_1],
				current = var_60_0,
				target = arg_60_2,
				time = arg_60_3
			})
		end
	end
end

function var_0_0.getStepSlotAlha(arg_61_0, arg_61_1)
	for iter_61_0, iter_61_1 in ipairs(arg_61_0.stepSlotAlpha) do
		if iter_61_1.name == arg_61_1 then
			return iter_61_1
		end
	end

	return nil
end

function var_0_0.updateSlotAlpha(arg_62_0)
	for iter_62_0 = #arg_62_0.stepSlotAlpha, 1, -1 do
		local var_62_0 = arg_62_0.stepSlotAlpha[iter_62_0]

		var_62_0.current, var_62_0.smooth = Mathf.SmoothDamp(var_62_0.current, var_62_0.target, var_62_0.smooth, var_62_0.time)

		if math.abs(var_62_0.target - var_62_0.current) <= 0.02 then
			print("设置插槽 " .. var_62_0.name .. " alpha = " .. var_62_0.target)
			arg_62_0:setSlotAlpha(var_62_0.slot, var_62_0.target)

			table.remove(arg_62_0.stepSlotAlpha, iter_62_0).slot = nil
		else
			print("设置插槽 " .. var_62_0.name .. " alpha = " .. var_62_0.current)
			arg_62_0:setSlotAlpha(var_62_0.slot, var_62_0.current)
		end
	end
end

function var_0_0.updateEffectVisible(arg_63_0, arg_63_1)
	if arg_63_0.shipEffectActionAble and arg_63_0._effectsTf then
		if table.contains(arg_63_0.shipEffectActionAble, arg_63_1) then
			if isActive(arg_63_0._effectsTf) then
				setActive(arg_63_0._effectsTf, false)
			end
		elseif not isActive(arg_63_0._effectsTf) then
			setActive(arg_63_0._effectsTf, true)
		end
	end
end

function var_0_0.isInAction(arg_64_0)
	return arg_64_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_65_0, arg_65_1, arg_65_2, arg_65_3, arg_65_4, arg_65_5)
	if not arg_65_0:checkActionPlayAble(arg_65_1, arg_65_4, arg_65_2) then
		return
	end

	if arg_65_0.mainSpineAnim then
		arg_65_0.mainSpineAnim:SetActionCallBack(function(arg_66_0)
			if arg_66_0 == "finish" and arg_65_3 then
				arg_65_0.inAction = false

				arg_65_0.mainSpineAnim:SetActionCallBack(nil)
				arg_65_3()

				arg_65_3 = nil
			elseif arg_66_0 == "action" and arg_65_5 then
				arg_65_5()

				arg_65_5 = nil
			end
		end)
	end

	arg_65_0:SetAction(arg_65_1, arg_65_2, arg_65_4)
end

function var_0_0.SetOnceAction(arg_67_0, arg_67_1, arg_67_2, arg_67_3, arg_67_4)
	if not arg_67_0:checkActionPlayAble(arg_67_1, arg_67_4, 0) then
		return
	end

	arg_67_0:SetActionWithFinishCallback(arg_67_1, 0, function()
		arg_67_0:SetAction(arg_67_0:getIdleName(), 0)

		if arg_67_2 then
			arg_67_2()

			arg_67_2 = nil
		end
	end, arg_67_4, function()
		if arg_67_3 then
			arg_67_3()

			arg_67_3 = nil
		end
	end)
end

function var_0_0.pullInitCallback(arg_70_0, arg_70_1)
	table.insert(arg_70_0._initCallback, arg_70_1)
end

function var_0_0.getAnimationExist(arg_71_0, arg_71_1)
	if not arg_71_0._mainAnimationData then
		arg_71_0._mainAnimationData = arg_71_0.mainSpineAnim:GetAnimationState()
	end

	local var_71_0

	if arg_71_0._skeletonGraphic then
		var_71_0 = arg_71_0._skeletonGraphic.Skeleton.Data:FindAnimation(arg_71_1)
	end

	return var_71_0
end

function var_0_0.SetEmptyAction(arg_72_0, arg_72_1)
	if not arg_72_0.spineAnimList then
		return
	end

	for iter_72_0, iter_72_1 in ipairs(arg_72_0.spineAnimList) do
		local var_72_0 = iter_72_1:GetAnimationState()

		if var_72_0 then
			var_72_0:SetEmptyAnimation(arg_72_1, 0)
			GetComponent(iter_72_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.GetSpineTrasform(arg_73_0)
	return arg_73_0._tf
end

function var_0_0.SetSkin(arg_74_0, arg_74_1)
	if arg_74_0._skeletonGraphic and arg_74_0._skeletonGraphic.SkeletonData and arg_74_0._skeletonGraphic.SkeletonData:FindSkin(arg_74_1) ~= nil then
		arg_74_0._skeletonGraphic.Skeleton:SetSkin(arg_74_1)
		arg_74_0._skeletonGraphic.Skeleton:SetSlotsToSetupPose()
	end
end

function var_0_0.updateSkeletonGraphicTime(arg_75_0)
	if arg_75_0._skeletonGraphic then
		arg_75_0._skeletonGraphic:Update(Time.deltaTime)
	end
end

function var_0_0.getMultipFaceAction(arg_76_0, arg_76_1)
	if arg_76_0.multipleFaceFlag then
		local var_76_0 = tonumber(arg_76_1)

		if var_76_0 and var_76_0 >= 0 then
			for iter_76_0, iter_76_1 in ipairs(arg_76_0.multipleFaceData) do
				if iter_76_1[1] == arg_76_0:getIdleName() then
					return tostring(var_76_0 + iter_76_1[2])
				end
			end
		end
	end

	return arg_76_1
end

function var_0_0.Dispose(arg_77_0)
	arg_77_0._materialDic = {}

	if arg_77_0.updateLocal then
		arg_77_0._skeletonGraphic.UpdateLocal = arg_77_0._skeletonGraphic.UpdateLocal - arg_77_0.updateLocal
		arg_77_0.updateLocal = nil
	end

	if arg_77_0._spinePaintingData then
		arg_77_0._spinePaintingData:Clear()
	end

	for iter_77_0, iter_77_1 in pairs(arg_77_0._loadSpineDic) do
		PoolMgr.GetInstance():ReturnSpinePainting(iter_77_0, iter_77_1)
	end

	for iter_77_2, iter_77_3 in pairs(arg_77_0._loadUIDic) do
		PoolMgr.GetInstance():ReturnUI(iter_77_2, iter_77_3)
	end

	arg_77_0._loadSpineDic = {}
	arg_77_0._loadUIDic = {}

	if arg_77_0._go ~= nil then
		var_0_1.Destroy(arg_77_0._go)
	end

	if arg_77_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_77_0._bgEffectGo)
	end

	arg_77_0._go = nil
	arg_77_0._tf = nil
	arg_77_0._bgEffectGo = nil
	arg_77_0._bgEffectTf = nil

	if arg_77_0.spineAnim then
		arg_77_0.spineAnim:SetActionCallBack(nil)
	end

	if arg_77_0._slotAlphaTimer then
		arg_77_0._slotAlphaTimer:Stop()

		arg_77_0._slotAlphaTimer = nil
	end

	if arg_77_0.stepSlotAlpha and #arg_77_0.stepSlotAlpha > 0 then
		for iter_77_4, iter_77_5 in ipairs(arg_77_0._slotAlphaTimer) do
			iter_77_5.slot = nil
		end

		arg_77_0._slotAlphaTimer = {}
	end
end

function var_0_0.getPaintingName(arg_78_0)
	return arg_78_0._spinePaintingData:GetShipName()
end

return var_0_0
