local var_0_0 = class("LadyEnv")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.scene = arg_1_1
end

function var_0_0.InitCharacter(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0

	var_2_0.lady = var_2_0.ladyGameObject.transform

	var_2_0.lady:SetParent(arg_2_0.scene.mainCameraTF)
	var_2_0.lady:SetParent(nil)

	var_2_0.ladyHeadIKComp = var_2_0.lady:GetComponent(typeof(HeadAimIK))
	var_2_0.ladyHeadIKComp.AimTarget = arg_2_0.scene.mainCameraTF:Find("AimTarget")
	var_2_0.ladyHeadIKData = {
		DampTime = var_2_0.ladyHeadIKComp.DampTime,
		blinkSpeed = var_2_0.ladyHeadIKComp.blinkSpeed,
		BodyWeight = var_2_0.ladyHeadIKComp.BodyWeight,
		HeadWeight = var_2_0.ladyHeadIKComp.HeadWeight
	}

	local var_2_1 = {}

	table.Foreach(DormConst.boneMap, function(arg_3_0, arg_3_1)
		var_2_1[arg_3_1] = arg_3_0
	end)

	var_2_0.ladyAnimator = var_2_0.lady:GetComponent(typeof(Animator))
	var_2_0.ladyAnimBaseLayerIndex = var_2_0.ladyAnimator:GetLayerIndex("Base Layer")
	var_2_0.ladyAnimFaceLayerIndex = var_2_0.ladyAnimator:GetLayerIndex("Face")
	var_2_0.ladyBoneMaps = {}

	local var_2_2 = var_2_0.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_2_2, function(arg_4_0, arg_4_1)
		if arg_4_1.name == "BodyCollider" then
			var_2_0.ladyCollider = arg_4_1

			setActive(arg_4_1, true)
		elseif arg_4_1.name == "SafeCollider" then
			var_2_0.ladySafeCollider = arg_4_1

			setActive(arg_4_1, false)
		elseif arg_4_1.name == "Interest" then
			var_2_0.ladyInterestRoot = arg_4_1
		elseif arg_4_1.name == "Head Center" then
			var_2_0.ladyHeadCenter = arg_4_1
		end

		if var_2_1[arg_4_1.name] then
			var_2_0.ladyBoneMaps[var_2_1[arg_4_1.name]] = arg_4_1
		end
	end)

	var_2_0.ladyColliders = {}
	var_2_0.ladyTouchColliders = {}

	table.IpairsCArray(var_2_0.lady:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_5_0, arg_5_1)
		if arg_5_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		local var_5_0 = tf(arg_5_1)
		local var_5_1 = var_5_0.name
		local var_5_2 = var_5_1 and string.find(var_5_1, "Collider") or -1
		local var_5_3 = string.sub(var_5_1, 1, var_5_2 - 1)

		if DormConst.BONE_TO_TOUCH[var_5_3] == nil then
			return
		end

		var_2_0.ladyColliders[var_5_3] = var_5_0

		table.insert(var_2_0.ladyTouchColliders, var_5_0)
		setActive(var_5_0, false)
	end)
	arg_2_0.scene:HXCharacter(var_2_0.lady)

	var_2_0.clothComps = {}
	var_2_0.ladyClothCompSettings = {}

	table.IpairsCArray(var_2_0.lady:GetComponentsInChildren(typeof("MagicaCloth2.MagicaCloth"), true), function(arg_6_0, arg_6_1)
		table.insert(var_2_0.clothComps, arg_6_1)

		var_2_0.ladyClothCompSettings[arg_6_1] = {
			enabled = arg_6_1.enabled
		}
	end)

	var_2_0.clothColliderDict = {}
	var_2_0.ladyClothColliderSettings = {}

	local var_2_3 = typeof("MagicaCloth2.MagicaCapsuleCollider")

	table.IpairsCArray(var_2_0.lady:GetComponentsInChildren(var_2_3, true), function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1:GetSize()

		var_2_0.clothColliderDict[arg_7_1.name] = arg_7_1
		var_2_0.ladyClothColliderSettings[arg_7_1] = {
			enabled = arg_7_1.enabled,
			StartRadius = var_7_0.x,
			EndRadius = var_7_0.y
		}
	end)
	var_2_0:EnableCloth(false)

	var_2_0.ladyIKRoot = var_2_0.lady:Find("IKLayers")

	eachChild(var_2_0.ladyIKRoot, function(arg_8_0)
		setActive(arg_8_0, false)
	end)
	GetComponent(var_2_0.lady, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_9_0, arg_9_1)
		if arg_9_1.rawPointerPress.transform == var_2_0.ladyCollider then
			arg_2_0.scene:emit(Dorm3dRoomTemplateScene.CLICK_CHARACTER, arg_2_1)
		else
			local var_9_0 = table.keyof(var_2_0.IKSettings.Colliders, arg_9_1.rawPointerPress.transform)

			arg_2_0.scene:emit(Dorm3dRoomTemplateScene.ON_TOUCH_CHARACTER, var_9_0 or arg_9_1.rawPointerPress.name)
		end
	end)
	var_2_0.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_10_0)
		if var_2_0.nowState and arg_10_0.animatorStateInfo:IsName(var_2_0.nowState) then
			existCall(var_2_0.stateCallback)

			return
		end

		local var_10_0 = arg_10_0.animatorStateInfo

		for iter_10_0, iter_10_1 in pairs(var_2_0.animCallbacks) do
			if var_10_0:IsName(iter_10_0) then
				warning("Active", iter_10_0)

				local var_10_1 = table.removebykey(var_2_0.animCallbacks, iter_10_0)

				existCall(var_10_1)

				return
			end
		end

		if arg_10_0.stringParameter ~= "" then
			switch(arg_10_0.stringParameter, var_2_0.animExtraEvent, function()
				arg_2_0.scene:OnAnimationEvent(arg_10_0)
			end)
		end
	end)

	var_2_0.animEventCallbacks = {}
	var_2_0.animCallbacks = {}
	var_2_0.animExtraEvent = {}

	local function var_2_4(arg_12_0, arg_12_1, arg_12_2)
		arg_2_0.scene.loader:GetPrefab(arg_12_0, arg_12_1, function(arg_13_0)
			arg_13_0.name = arg_12_2
			var_2_0[arg_12_2] = tf(arg_13_0)

			setActive(arg_13_0, false)
			onNextTick(function()
				setParent(var_2_0[arg_12_2], var_2_0.ladyHeadCenter)
			end)
		end)
	end

	var_2_0.effectHeart = var_2_0.ladyHeadCenter:Find("effectHeart")

	if not var_2_0.effectHeart then
		var_2_4("dorm3d/effect/prefab/function/vfx_function_aixin02", "vfx_function_aixin02", "effectHeart")
	end

	var_2_0.ladyWatchFloat = var_2_0.ladyHeadCenter:Find("ladyWatchFloat")

	if not var_2_0.ladyWatchFloat then
		var_2_4("dorm3d/effect/prefab/scene/vfx_talk_mark", "vfx_talk_mark", "ladyWatchFloat")
	end

	if var_2_0.tfPendintItem then
		onNextTick(function()
			setParent(var_2_0.tfPendintItem, var_2_0.lady)
		end)
	end

	var_2_0.ladyOwner = GetComponent(var_2_0.lady, "GraphOwner")
	var_2_0.ladyBlackboard = GetComponent(var_2_0.lady, "Blackboard")

	var_2_0:SetBlackboardValue("groupId", arg_2_1)
	onNextTick(function()
		var_2_0.ladyOwner.enabled = true
	end)

	arg_2_0.characterController = GetOrAddComponent(arg_2_0.ladyGameObject, typeof(CharacterController))
	arg_2_0.characterController.enabled = false
	arg_2_0.characterController.center = Vector3(0, 0.78, 0)
	arg_2_0.characterController.radius = 0.08
	arg_2_0.characterController.height = 1.49
end

function var_0_0.SwitchCharacterSkin(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = arg_17_0
	local var_17_1 = var_17_0.skinIdList

	assert(table.contains(var_17_1, arg_17_2))

	local var_17_2 = arg_17_0:GetCurrentAnim()
	local var_17_3 = var_17_0.skinId
	local var_17_4 = arg_17_0.scene.skinDict[var_17_3].ladyGameObject
	local var_17_5 = var_17_4.transform.position
	local var_17_6 = var_17_4.transform.rotation
	local var_17_7 = var_17_0.ladyBlackboard

	setActive(var_17_4, false)

	var_17_0.skinId = arg_17_2

	setActive(arg_17_0.scene.skinDict[arg_17_2].ladyGameObject, true)

	var_17_0.ladyGameObject = arg_17_0.scene.skinDict[arg_17_2].ladyGameObject
	var_17_0.ladyCollider = nil

	arg_17_0:InitCharacter(arg_17_1)
	pg.NodeCanvasMgr.GetInstance():CopyAllBlackBoardValue(var_17_7, var_17_0.ladyBlackboard)
	var_17_0.ladyAnimator:Play(var_17_2, var_17_0.ladyAnimBaseLayerIndex)
	var_17_0.ladyAnimator:Update(0)
	var_17_0.lady:SetPositionAndRotation(var_17_5, var_17_6)
	existCall(arg_17_3)
end

function var_0_0.SetBlackboardValue(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0

	var_18_0.blackboard = var_18_0.blackboard or {}
	var_18_0.blackboard[arg_18_1] = arg_18_2

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_18_1, arg_18_2, var_18_0.ladyBlackboard)
end

function var_0_0.GetBlackboardValue(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0

	var_19_0.blackboard = var_19_0.blackboard or {}

	return var_19_0.blackboard[arg_19_1]
end

function var_0_0.HideCharacterPart(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0
	local var_20_1, var_20_2 = Dorm3dSkin.New({
		configId = arg_20_1
	}):GetActiveAndHiddenPartNames(arg_20_2)

	if var_20_0.lady == nil then
		var_20_0.lady = var_20_0.ladyGameObject.transform
	end

	_.each(var_20_1, function(arg_21_0)
		setActive(var_20_0.lady:Find(arg_21_0), true)
	end)
	_.each(var_20_2, function(arg_22_0)
		setActive(var_20_0.lady:Find(arg_22_0), false)
	end)
end

function var_0_0.GetCurrentAnim(arg_23_0)
	return arg_23_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_23_0.ladyAnimBaseLayerIndex).shortNameHash
end

function var_0_0.EnableCloth(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0

	arg_24_1 = arg_24_1 or {}

	table.Foreach(var_24_0.clothComps, function(arg_25_0, arg_25_1)
		if arg_25_1 == nil then
			return
		end

		setActive(arg_25_1, arg_24_1[arg_25_0] == 1)
	end)
	table.Foreach(var_24_0.clothColliderDict, function(arg_26_0, arg_26_1)
		if arg_26_1 == nil then
			return
		end

		setActive(arg_26_1, false)
	end)

	if arg_24_2 then
		table.Foreach(arg_24_2, function(arg_27_0, arg_27_1)
			local var_27_0 = var_24_0.clothColliderDict[arg_27_1[1]]

			if var_27_0 == nil then
				return
			end

			setActive(var_27_0, arg_27_1[2] == 1)

			if arg_27_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_27_0, arg_27_1[3], arg_27_1[4])
		end)
	end
end

function var_0_0.PlaySingleAction(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0

	warning("Play", arg_28_1)

	local var_28_1 = string.find(arg_28_1, "^Face_")
	local var_28_2 = tobool(var_28_1)

	if not var_28_2 then
		local var_28_3 = string.find(arg_28_1, "^face_")

		var_28_2 = tobool(var_28_3)
	end

	if var_28_2 then
		arg_28_0:PlayFaceAnim(arg_28_1, arg_28_2)

		return
	end

	if var_28_0.ladyAnimator:GetCurrentAnimatorStateInfo(var_28_0.ladyAnimBaseLayerIndex):IsName(arg_28_1) then
		return
	end

	existCall(var_28_0.animExtraItemCallback)

	var_28_0.animExtraItemCallback = nil

	local var_28_4 = arg_28_0:GetBlackboardValue("groupId")
	local var_28_5 = _.detect(pg.dorm3d_anim_extraitem.get_id_list_by_ship_id[var_28_4] or {}, function(arg_29_0)
		return pg.dorm3d_anim_extraitem[arg_29_0].anim == arg_28_1
	end)
	local var_28_6 = var_28_5 and pg.dorm3d_anim_extraitem[var_28_5]
	local var_28_7

	seriesAsync({
		function(arg_30_0)
			if not var_28_6 or var_28_6.item_prefab == "" then
				arg_30_0()

				return
			end

			local var_30_0 = string.lower("dorm3d/furniture/item/" .. var_28_6.item_prefab)

			arg_28_0.scene.loader:GetPrefab(var_30_0, "", function(arg_31_0)
				setParent(arg_31_0, var_28_0.lady)

				if var_28_6.item_shield ~= "" then
					var_28_7 = {}

					for iter_31_0, iter_31_1 in ipairs(var_28_6.item_shield) do
						local var_31_0 = arg_28_0.scene.modelRoot:Find(iter_31_1)

						if not var_31_0 then
							warning(string.format("dorm3d_anim_extraitem:%d without hide item:%s", var_28_6.id, iter_31_1))
						else
							var_28_7[iter_31_1] = isActive(var_31_0)

							setActive(var_31_0, false)
						end
					end
				end

				function var_28_0.animExtraItemCallback()
					arg_28_0.scene.loader:ClearRequest("AnimExtraItem")

					if var_28_7 then
						for iter_32_0, iter_32_1 in pairs(var_28_7) do
							setActive(arg_28_0.scene.modelRoot:Find(iter_32_0), iter_32_1)
						end
					end
				end

				arg_30_0()
			end, "AnimExtraItem")
		end,
		function(arg_33_0)
			var_28_0.nowState = arg_28_1
			var_28_0.stateCallback = arg_33_0

			var_28_0.ladyAnimator:CrossFadeInFixedTime(arg_28_1, 0.25, var_28_0.ladyAnimBaseLayerIndex)
		end,
		function(arg_34_0)
			var_28_0.nowState = nil
			var_28_0.stateCallback = nil

			existCall(var_28_0.animExtraItemCallback)

			var_28_0.animExtraItemCallback = nil

			arg_34_0()
		end,
		arg_28_2
	})
end

function var_0_0.PlayFaceAnim(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_0

	var_35_0.ladyAnimator:CrossFadeInFixedTime(arg_35_1, 0, var_35_0.ladyAnimFaceLayerIndex)
	existCall(arg_35_2)
end

function var_0_0.SwitchAnim(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = arg_36_0
	local var_36_1 = string.find(arg_36_1, "^Face_")

	if tobool(var_36_1) then
		arg_36_0:PlayFaceAnim(arg_36_1, arg_36_2)

		return
	end

	existCall(var_36_0.animExtraItemCallback)

	var_36_0.animExtraItemCallback = nil

	local var_36_2 = {}

	table.insert(var_36_2, function(arg_37_0)
		var_36_0.nowState = arg_36_1
		var_36_0.stateCallback = arg_37_0

		var_36_0.ladyAnimator:PlayInFixedTime(arg_36_1, var_36_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_36_2, function(arg_38_0)
		var_36_0.nowState = nil
		var_36_0.stateCallback = nil

		arg_38_0()
	end)
	seriesAsync(var_36_2, arg_36_2)
end

function var_0_0.RegisterAnimExtraEvent(arg_39_0, arg_39_1, arg_39_2)
	arg_39_0.animExtraEvent[arg_39_1] = arg_39_2
end

function var_0_0.RevertClothComps(arg_40_0)
	local var_40_0 = arg_40_0

	table.Foreach(var_40_0.ladyClothCompSettings, function(arg_41_0, arg_41_1)
		arg_41_0.enabled = arg_41_1.enabled
	end)
	table.Foreach(var_40_0.ladyClothColliderSettings, function(arg_42_0, arg_42_1)
		arg_42_0.enabled = arg_42_1.enabled

		var_0_0.SetMagicaCollider(arg_42_0, arg_42_1.StartRadius, arg_42_1.EndRadius)
	end)
end

function var_0_0.SetMagicaCollider(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = typeof("MagicaCloth2.MagicaCapsuleCollider")
	local var_43_1 = arg_43_0:GetSize()

	var_43_1.x = arg_43_1
	var_43_1.y = arg_43_2

	arg_43_0:SetSize(var_43_1)
end

function var_0_0.MoveToTarget(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_1 - arg_44_0.lady.position

	if var_44_0 ~= Vector3.zero then
		local var_44_1 = Quaternion.LookRotation(var_44_0)

		arg_44_0.lady.rotation = Quaternion.Slerp(arg_44_0.lady.rotation, var_44_1, Time.deltaTime * DormConst.LADY_ROTATE_SPEED)
	end

	local var_44_2 = var_44_0.normalized * DormConst.LADY_MOVE_SPEED

	arg_44_0.characterController:Move(var_44_2 * Time.deltaTime)
end

function var_0_0.SetCurrentIkTimelineStatus(arg_45_0, arg_45_1)
	arg_45_0.currentIkTimelineStatus = arg_45_1
end

function var_0_0.CheckIkTimelineStatus(arg_46_0, arg_46_1)
	if not arg_46_0.currentIkTimelineStatus then
		return true
	end

	return arg_46_0.currentIkTimelineStatus ~= arg_46_1
end

return var_0_0
