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
	arg_7_0:SetDefaultSkeletonSkin()
end

function var_0_0.getNormalIdleName(arg_9_0)
	return "normal"
end

local function var_0_3(arg_10_0, arg_10_1)
	arg_10_0._bgEffectGo = arg_10_1
	arg_10_0._bgEffectTf = tf(arg_10_1)

	HotfixHelper.SetLayerRecursively(arg_10_0._bgEffectGo, LayerMask.NameToLayer("UI"))
	arg_10_0._bgEffectTf:SetParent(arg_10_0._spinePaintingData.effectParent, true)

	arg_10_0._bgEffectTf.localScale = arg_10_0._spinePaintingData.bgEffectScale
	arg_10_0._bgEffectTf.localPosition = arg_10_0._spinePaintingData.bgEffectPos
end

function var_0_0.Ctor(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0._spinePaintingData = arg_11_1
	arg_11_0._loadSpineDic = {}
	arg_11_0._loadUIDic = {}
	arg_11_0._initCallback = {}

	parallelAsync({
		function(arg_12_0)
			local var_12_0 = arg_11_0._spinePaintingData:GetShipName()
			local var_12_1, var_12_2 = HXSet.autoHxShift("spinepainting/", var_12_0)
			local var_12_3 = var_12_1 .. var_12_2

			PoolMgr.GetInstance():GetSpinePainting(var_12_0, true, function(arg_13_0)
				arg_11_0._loadSpineDic[var_12_0] = arg_13_0

				var_0_2(arg_11_0, arg_13_0)
				arg_12_0()
			end)
		end,
		function(arg_14_0)
			local var_14_0 = arg_11_0._spinePaintingData.bgEffectName

			if var_14_0 ~= nil then
				PoolMgr.GetInstance():GetUI(var_14_0, true, function(arg_15_0)
					arg_11_0._loadUIDic[var_14_0] = arg_15_0

					var_0_3(arg_11_0, arg_15_0)
					arg_14_0()
				end)
			else
				arg_14_0()
			end
		end
	}, function()
		setActive(arg_11_0._spinePaintingData.parent, true)
		setActive(arg_11_0._spinePaintingData.effectParent, true)

		arg_11_0._initFlag = true

		arg_11_0:updateLink()

		for iter_16_0, iter_16_1 in ipairs(arg_11_0._initCallback) do
			iter_16_1()
		end

		arg_11_0._initCallback = {}

		if arg_11_2 then
			arg_11_2(arg_11_0)
		end
	end)
end

function var_0_0.updateLink(arg_17_0)
	arg_17_0.slotOverride = {}

	local var_17_0 = arg_17_0._spinePaintingData.ship:getSkinId()
	local var_17_1 = ChangeSkinLink.CHANGE_SKIN_LINK_DATA[var_17_0]

	if var_17_1 then
		local var_17_2 = var_17_1.link_id
		local var_17_3 = var_17_1.relations

		if var_17_1.link_type == ChangeSkinLink.L2D_TYPE then
			local var_17_4

			if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 then
				var_17_4 = ChangeSkinLink.GetSaveL2dData(arg_17_0._spinePaintingData.ship.id, var_17_2)
			else
				var_17_4 = ChangeSkinLink.L2D_PARAMETER_DIC[arg_17_0._spinePaintingData.ship.id]
			end

			var_17_4 = var_17_4 or {}

			for iter_17_0, iter_17_1 in ipairs(var_17_3) do
				local var_17_5 = iter_17_1.type

				if var_17_5 == ChangeSkinLink.change_parameter_link_slot then
					local var_17_6 = true
					local var_17_7 = iter_17_1.link_parameter
					local var_17_8 = iter_17_1.slot_list

					for iter_17_2, iter_17_3 in ipairs(var_17_7) do
						local var_17_9 = iter_17_3.name
						local var_17_10 = iter_17_3.num

						if (var_17_4[var_17_9] and var_17_4[var_17_9] or 0) ~= var_17_10 then
							var_17_6 = false
						end
					end

					if var_17_6 then
						for iter_17_4, iter_17_5 in ipairs(var_17_8) do
							table.insert(arg_17_0.slotOverride, iter_17_5)
						end
					end
				elseif var_17_5 == ChangeSkinLink.change_parameter_link_skin then
					local var_17_11 = true
					local var_17_12 = iter_17_1.link_parameter
					local var_17_13 = iter_17_1.skeleton_skin

					for iter_17_6, iter_17_7 in ipairs(var_17_12) do
						local var_17_14 = iter_17_7.name
						local var_17_15 = iter_17_7.num

						if (var_17_4[var_17_14] and var_17_4[var_17_14] or 0) ~= var_17_15 then
							var_17_11 = false
						end
					end

					if var_17_11 then
						arg_17_0:SetSkeletonSkin(var_17_13)
					end
				end
			end
		end
	end
end

function var_0_0.setL2dSlot(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0._skeletonGraphic.Skeleton:SetAttachment(arg_18_1, arg_18_2)
end

function var_0_0.onUpdateLocal(arg_19_0)
	if arg_19_0.slotOverride then
		for iter_19_0, iter_19_1 in ipairs(arg_19_0.slotOverride) do
			arg_19_0:setL2dSlot(iter_19_1[1], iter_19_1[2])
		end
	end
end

function var_0_0.SetVisible(arg_20_0, arg_20_1)
	setActive(arg_20_0._spinePaintingData.effectParent, arg_20_1)
	pg.ViewUtils.SetLayer(arg_20_0._tf, arg_20_1 and Layer.UI or Layer.UIHidden)
	setActiveViaLayer(arg_20_0._spinePaintingData.effectParent, arg_20_1)

	if arg_20_0._skeletonGraphic then
		arg_20_0._skeletonGraphic.timeScale = arg_20_1 and 1 or 0
	end

	if not arg_20_1 then
		arg_20_0.mainSpineAnim:SetActionCallBack(nil)

		arg_20_0.inAction = false
		arg_20_0.clickActionList = {}

		if LeanTween.isTweening(go(arg_20_0._tf)) then
			LeanTween.cancel(go(arg_20_0._tf))
		end

		if arg_20_0._baseShader then
			if arg_20_0._skeletonGraphic then
				arg_20_0._skeletonGraphic.material.shader = arg_20_0._baseShader
			end

			arg_20_0._baseShader = nil
		end

		arg_20_0._displayWord = false
	else
		arg_20_0._skeletonGraphic:Update(Time.deltaTime)
	end

	arg_20_0:playPaintingInitIdle()
end

function var_0_0.getInitFlag(arg_21_0)
	return arg_21_0._initFlag
end

function var_0_0.playPaintingInitIdle(arg_22_0)
	local var_22_0 = SpinePaintingDrag.GetPaintingInitIdle(arg_22_0.mainSpineAnim.name, arg_22_0._spinePaintingData.ship.id)
	local var_22_1 = arg_22_0:getNormalIdleName()

	if var_22_0 then
		local var_22_2 = PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1)

		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_22_0._idleName ~= var_22_0 then
			var_22_1 = var_22_0
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_22_0._idleName ~= arg_22_0:getNormalIdleName() then
			var_22_1 = arg_22_0:getNormalIdleName()
		end
	else
		var_22_1 = arg_22_0:getNormalIdleName()
	end

	if var_22_1 then
		arg_22_0:setIdleName(var_22_1)
		arg_22_0:SetAction(arg_22_0._idleName, 0, true)

		arg_22_0.inAction = false
	end
end

function var_0_0.getIdleName(arg_23_0)
	return arg_23_0._idleName
end

function var_0_0.setIdleName(arg_24_0, arg_24_1)
	arg_24_0._idleName = arg_24_1

	arg_24_0:updateHitArea()
end

function var_0_0.getReplaceWord(arg_25_0)
	if arg_25_0.replaceWord and table.contains(arg_25_0.replaceWord, arg_25_0._idleName) then
		return true
	end

	return false
end

function var_0_0.updateHitArea(arg_26_0)
	if arg_26_0.dragShipFlag then
		local var_26_0 = arg_26_0.shipDragData.drag_data.type
		local var_26_1 = arg_26_0.shipDragData.drag_data.config_client

		if var_26_0 == SpinePaintingConst.drag_type_normal then
			for iter_26_0 = 1, #var_26_1 do
				local var_26_2 = var_26_1[iter_26_0]
				local var_26_3 = var_26_2.hit
				local var_26_4 = var_26_2.active

				if var_26_3 and not var_26_4 then
					local var_26_5 = findTF(arg_26_0._tf, "hitArea/" .. var_26_3)

					if var_26_5 then
						setActive(var_26_5, var_26_2.idle == arg_26_0._idleName)
					else
						print("hit area " .. var_26_3 .. "is not exist")
					end
				end
			end
		end
	end
end

function var_0_0.checkListAction(arg_27_0)
	if #arg_27_0.clickActionList > 0 then
		local var_27_0 = table.remove(arg_27_0.clickActionList, 1)

		arg_27_0:SetActionWithFinishCallback(var_27_0, 0, function()
			arg_27_0:checkListAction()
		end, true)
	else
		arg_27_0:SetAction(arg_27_0:getNormalIdleName(), 0, true)

		arg_27_0.inAction = false
	end
end

function var_0_0.displayWord(arg_29_0, arg_29_1)
	arg_29_0._displayWord = arg_29_1
end

function var_0_0.readyDragAction(arg_30_0, arg_30_1, arg_30_2)
	if arg_30_0.inAction or arg_30_0._displayWord then
		return false
	end

	if arg_30_0.dragShipFlag then
		return (arg_30_0:startDragAction(arg_30_1))
	end

	return false
end

function var_0_0.SetSkeletonSkin(arg_31_0, arg_31_1)
	arg_31_0._skeletonSkin = arg_31_1

	arg_31_0._skeletonGraphic.Skeleton:SetSkin(arg_31_1)
	arg_31_0:updateSkeletonGraphicTime()
end

function var_0_0.SetDefaultSkeletonSkin(arg_32_0)
	local var_32_0 = arg_32_0._spinePaintingData:GetShipSkinConfig().skeleton_default_skin

	if not var_32_0 or var_32_0 == "" then
		var_32_0 = "1"
	end

	local var_32_1 = arg_32_0._skeletonGraphic.SkeletonData:FindSkin(var_32_0)

	if var_32_1 and var_32_1 ~= nil then
		arg_32_0:SetSkeletonSkin(var_32_0)
	end
end

function var_0_0.startDragAction(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0.shipDragData.drag_data
	local var_33_1 = var_33_0.type

	if var_33_1 == SpinePaintingConst.drag_type_normal or var_33_1 == SpinePaintingConst.drag_type_rgb then
		return arg_33_0:changePaintingNormal(var_33_0, arg_33_1)
	elseif var_33_1 == SpinePaintingConst.drag_type_list then
		arg_33_0.clickActionList = Clone(var_33_0.config_client)

		return arg_33_0:checkListAction()
	end

	return false
end

function var_0_0.GetDragDataConfig(arg_34_0, arg_34_1)
	if arg_34_0.shipDragData then
		return arg_34_0.shipDragData[arg_34_1]
	end

	return nil
end

function var_0_0.setEventTriggerCallback(arg_35_0, arg_35_1)
	arg_35_0._eventTriggerCall = arg_35_1
end

function var_0_0.changePaintingNormal(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = arg_36_0:getIdleName()
	local var_36_1 = arg_36_1.config_client
	local var_36_2 = arg_36_1.type

	for iter_36_0, iter_36_1 in ipairs(var_36_1) do
		if arg_36_0:matchDragFlag(var_36_0, arg_36_2, iter_36_1) then
			return arg_36_0:doDragAction(var_36_2, arg_36_1, iter_36_1)
		end
	end

	return false
end

function var_0_0.doDragAction(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	local var_37_0 = arg_37_3.change_idle
	local var_37_1

	if type(arg_37_3.action) == "string" then
		var_37_1 = arg_37_3.action
	elseif type(arg_37_3.action) == "table" then
		var_37_1 = arg_37_3.action[math.random(1, #arg_37_3.action)]
	end

	local var_37_2 = arg_37_3.event
	local var_37_3 = arg_37_3.fold
	local var_37_4 = arg_37_3.effect_hide
	local var_37_5 = arg_37_3.cv

	if arg_37_1 == SpinePaintingConst.drag_type_normal then
		if var_37_1 and var_37_1 ~= "" and arg_37_0:ablePlayAction(var_37_1, false, 0) then
			if var_37_3 then
				pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, true)
			end

			arg_37_0:setEffectVisible(var_37_4, false)
			arg_37_0:SetActionWithFinishCallback(var_37_1, 0, function()
				if var_37_3 then
					pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, false)
				end

				arg_37_0:changePaintingIdle(var_37_0)
				arg_37_0:setEffectVisible(var_37_4, true)
			end, false, function()
				if var_37_5 and var_37_5 ~= "" then
					local var_39_0 = arg_37_0._spinePaintingData.ship:getSkinId()
					local var_39_1 = pg.CriMgr.GetCVBankName(ShipWordHelper.RawGetCVKey(var_39_0))
					local var_39_2 = pg.ship_skin_template[var_39_0].group_index
					local var_39_3 = var_37_5 .. "_" .. var_39_2

					print("try playing cv" .. var_39_1 .. ":" .. var_39_3)
					pg.CriMgr.GetInstance():playCueSheetVoice(var_39_1, var_39_3, true, function(arg_40_0)
						if arg_40_0 then
							print("播放的语音长度为 = " .. arg_40_0:GetLength())
						end
					end)
				end

				if var_37_2 and var_37_2 ~= "" and arg_37_0._eventTriggerCall then
					arg_37_0._eventTriggerCall(var_37_2)
				end
			end)
		else
			if var_37_0 and var_37_0 ~= "" then
				arg_37_0:changePaintingIdle(var_37_0)
			end

			if var_37_2 and var_37_2 ~= "" and arg_37_0._eventTriggerCall then
				arg_37_0._eventTriggerCall(var_37_2)
			end

			return false
		end
	elseif arg_37_1 == SpinePaintingConst.drag_type_rgb then
		local var_37_6 = arg_37_2.material

		if LeanTween.isTweening(go(arg_37_0._tf)) then
			return false
		end

		arg_37_0:getSpineMaterial(var_37_6, function(arg_41_0)
			arg_37_0._skeletonGraphic.material = arg_41_0

			LeanTween.delayedCall(go(arg_37_0._tf), 0.5, System.Action(function()
				arg_37_0._skeletonGraphic.material = arg_37_0._baseMaterial

				arg_37_0:changePaintingIdle(var_37_0)
			end))
		end)
	end

	return true
end

function var_0_0.setEffectVisible(arg_43_0, arg_43_1, arg_43_2)
	if not arg_43_1 or #arg_43_1 == 0 then
		return
	end

	for iter_43_0 = 1, #arg_43_1 do
		local var_43_0 = findTF(arg_43_0._tf, arg_43_1[iter_43_0])

		if var_43_0 then
			setActive(var_43_0, arg_43_2)
		end
	end
end

function var_0_0.matchDragFlag(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0 = arg_44_3.hit

	if var_44_0 and var_44_0 ~= arg_44_2 then
		return false
	end

	local var_44_1 = arg_44_3.is_default
	local var_44_2 = arg_44_3.idle

	if not arg_44_1 and var_44_1 then
		return true
	elseif arg_44_1 == var_44_2 then
		return true
	end

	return false
end

function var_0_0.getSpineMaterial(arg_45_0, arg_45_1, arg_45_2)
	if not arg_45_0._materialDic then
		arg_45_0._materialDic = {}
	end

	if arg_45_0._materialDic[arg_45_1] then
		arg_45_2(arg_45_0._materialDic[arg_45_1])
	else
		arg_45_0._materialDic[arg_45_1] = LoadAny("spinematerials", arg_45_1, typeof(Material))

		arg_45_2(arg_45_0._materialDic[arg_45_1])
	end
end

function var_0_0.changePaintingIdle(arg_46_0, arg_46_1)
	arg_46_0:setIdleName(arg_46_1)
	arg_46_0:SetAction(arg_46_1, 0, true)
	SpinePaintingDrag.SetPaintingInitIdle(arg_46_0.mainSpineAnim.name, arg_46_0._spinePaintingData.ship.id, arg_46_1)

	arg_46_0.inAction = false
end

function var_0_0.SetAction(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	if not arg_47_0:ablePlayAction(arg_47_1, arg_47_3, arg_47_2) then
		return false
	end

	if arg_47_2 and arg_47_2 == 0 then
		arg_47_0.lastPlayAction = arg_47_1
	end

	if arg_47_2 == 0 and arg_47_1 ~= arg_47_0:getIdleName() then
		arg_47_0.inAction = true
	end

	if arg_47_0.multipleFaceFlag and not arg_47_0.inAction then
		arg_47_1 = arg_47_0:getMultipFaceAction(arg_47_1)
	end

	local var_47_0 = arg_47_0._spinePaintingData.ship:getSkinId()
	local var_47_1 = pg.ship_skin_template[var_47_0].voice_lang

	if arg_47_2 == 0 and var_47_1 and #var_47_1 > 0 then
		local var_47_2 = ShipWordHelper.GetLanguageSetting(var_47_0)

		if var_47_2 <= 0 then
			var_47_2 = 1
		end

		local var_47_3 = var_47_1[var_47_2]
		local var_47_4 = arg_47_0:GetVoiceLandAction(arg_47_1, var_47_3)

		if arg_47_0:getAnimationExist(var_47_4) then
			arg_47_1 = var_47_4
		end
	end

	arg_47_0:updateEffectVisible(arg_47_1)

	for iter_47_0, iter_47_1 in ipairs(arg_47_0.spineAnimList) do
		iter_47_1:SetAction(arg_47_1, arg_47_2)

		if iter_47_1:GetAnimationState() then
			GetComponent(iter_47_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end

	return true
end

function var_0_0.GetVoiceLandAction(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = ""

	if arg_48_2 == ShipSkin.VOICE_LANG_JP then
		var_48_0 = "_jp"
	elseif arg_48_2 == ShipSkin.VOICE_LANG_CN then
		var_48_0 = "_cn"
	end

	return arg_48_1 .. var_48_0
end

function var_0_0.ablePlayAction(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	if arg_49_3 and arg_49_3 == 0 and arg_49_0.inAction and not arg_49_2 then
		return false
	end

	if arg_49_0.lockLayer and not arg_49_2 and arg_49_0.inAction and arg_49_3 and arg_49_3 > 0 then
		return false
	end

	if arg_49_0.lastPlayAction and arg_49_0.lastPlayAction ~= arg_49_0._idleName and arg_49_3 and arg_49_3 > 0 then
		return false
	end

	if arg_49_0._idleName ~= arg_49_0:getNormalIdleName() and arg_49_1 == "login" then
		return false
	end

	if arg_49_0.dragShipFlag and arg_49_0.shipDragData.action_enable then
		local var_49_0 = arg_49_0.shipDragData.action_enable

		for iter_49_0 = 1, #var_49_0 do
			local var_49_1 = var_49_0[iter_49_0]

			if var_49_1.name == arg_49_0._idleName and table.contains(var_49_1.ignore, arg_49_1) then
				return false
			end
		end
	end

	return true
end

function var_0_0.updateEffectVisible(arg_50_0, arg_50_1)
	if arg_50_0.shipEffectActionAble and arg_50_0._effectsTf then
		if table.contains(arg_50_0.shipEffectActionAble, arg_50_1) then
			if isActive(arg_50_0._effectsTf) then
				setActive(arg_50_0._effectsTf, false)
			end
		elseif not isActive(arg_50_0._effectsTf) then
			setActive(arg_50_0._effectsTf, true)
		end
	end
end

function var_0_0.isInAction(arg_51_0)
	return arg_51_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_52_0, arg_52_1, arg_52_2, arg_52_3, arg_52_4, arg_52_5)
	if not arg_52_0:ablePlayAction(arg_52_1, arg_52_4, arg_52_2) then
		return
	end

	if arg_52_0.mainSpineAnim then
		arg_52_0.mainSpineAnim:SetActionCallBack(function(arg_53_0)
			if arg_53_0 == "finish" and arg_52_3 then
				arg_52_0.inAction = false

				arg_52_0.mainSpineAnim:SetActionCallBack(nil)
				arg_52_3()

				arg_52_3 = nil
			elseif arg_53_0 == "action" and arg_52_5 then
				arg_52_5()

				arg_52_5 = nil
			end
		end)
	end

	arg_52_0:SetAction(arg_52_1, arg_52_2, arg_52_4)
end

function var_0_0.SetOnceAction(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4)
	if not arg_54_0:ablePlayAction(arg_54_1, arg_54_4, 0) then
		return
	end

	arg_54_0:SetActionWithFinishCallback(arg_54_1, 0, function()
		arg_54_0:SetAction(arg_54_0:getIdleName(), 0)

		if arg_54_2 then
			arg_54_2()

			arg_54_2 = nil
		end
	end, arg_54_4, function()
		if arg_54_3 then
			arg_54_3()

			arg_54_3 = nil
		end
	end)
end

function var_0_0.pullInitCallback(arg_57_0, arg_57_1)
	table.insert(arg_57_0._initCallback, arg_57_1)
end

function var_0_0.getAnimationExist(arg_58_0, arg_58_1)
	if not arg_58_0._mainAnimationData then
		arg_58_0._mainAnimationData = arg_58_0.mainSpineAnim:GetAnimationState()
	end

	local var_58_0

	if arg_58_0._skeletonGraphic then
		var_58_0 = arg_58_0._skeletonGraphic.Skeleton.Data:FindAnimation(arg_58_1)
	end

	return var_58_0
end

function var_0_0.SetEmptyAction(arg_59_0, arg_59_1)
	if not arg_59_0.spineAnimList then
		return
	end

	for iter_59_0, iter_59_1 in ipairs(arg_59_0.spineAnimList) do
		local var_59_0 = iter_59_1:GetAnimationState()

		if var_59_0 then
			var_59_0:SetEmptyAnimation(arg_59_1, 0)
			GetComponent(iter_59_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.GetSpineTrasform(arg_60_0)
	return arg_60_0._tf
end

function var_0_0.SetSkin(arg_61_0, arg_61_1)
	if arg_61_0._skeletonGraphic and arg_61_0._skeletonGraphic.SkeletonData and arg_61_0._skeletonGraphic.SkeletonData:FindSkin(arg_61_1) ~= nil then
		arg_61_0._skeletonGraphic.Skeleton:SetSkin(arg_61_1)
		arg_61_0._skeletonGraphic.Skeleton:SetSlotsToSetupPose()
	end
end

function var_0_0.updateSkeletonGraphicTime(arg_62_0)
	if arg_62_0._skeletonGraphic then
		arg_62_0._skeletonGraphic:Update(Time.deltaTime)
	end
end

function var_0_0.getMultipFaceAction(arg_63_0, arg_63_1)
	if arg_63_0.multipleFaceFlag then
		local var_63_0 = tonumber(arg_63_1)

		if var_63_0 and var_63_0 >= 0 then
			for iter_63_0, iter_63_1 in ipairs(arg_63_0.multipleFaceData) do
				if iter_63_1[1] == arg_63_0:getIdleName() then
					return tostring(var_63_0 + iter_63_1[2])
				end
			end
		end
	end

	return arg_63_1
end

function var_0_0.Dispose(arg_64_0)
	arg_64_0._materialDic = {}

	if arg_64_0.updateLocal then
		arg_64_0._skeletonGraphic.UpdateLocal = arg_64_0._skeletonGraphic.UpdateLocal - arg_64_0.updateLocal
		arg_64_0.updateLocal = nil
	end

	if arg_64_0._spinePaintingData then
		arg_64_0._spinePaintingData:Clear()
	end

	for iter_64_0, iter_64_1 in pairs(arg_64_0._loadSpineDic) do
		PoolMgr.GetInstance():ReturnSpinePainting(iter_64_0, iter_64_1)
	end

	for iter_64_2, iter_64_3 in pairs(arg_64_0._loadUIDic) do
		PoolMgr.GetInstance():ReturnUI(iter_64_2, iter_64_3)
	end

	arg_64_0._loadSpineDic = {}
	arg_64_0._loadUIDic = {}

	if arg_64_0._go ~= nil then
		var_0_1.Destroy(arg_64_0._go)
	end

	if arg_64_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_64_0._bgEffectGo)
	end

	arg_64_0._go = nil
	arg_64_0._tf = nil
	arg_64_0._bgEffectGo = nil
	arg_64_0._bgEffectTf = nil

	if arg_64_0.spineAnim then
		arg_64_0.spineAnim:SetActionCallBack(nil)
	end
end

function var_0_0.getPaintingName(arg_65_0)
	return arg_65_0._spinePaintingData:GetShipName()
end

return var_0_0
