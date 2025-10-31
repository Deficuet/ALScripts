local var_0_0 = class("LadyEnv", import("view.dorm3d.Extra.BaseExtraSystem"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.super.Ctor(arg_1_0, arg_1_1.event, arg_1_1)
end

function var_0_0.InitCharacter(arg_2_0, arg_2_1)
	arg_2_0.lady = arg_2_0.ladyGameObject.transform

	arg_2_0.lady:SetParent(arg_2_0:Get("mainCameraTF"))
	arg_2_0.lady:SetParent(nil)

	arg_2_0.ladyHeadIKComp = arg_2_0.lady:GetComponent(typeof(HeadAimIK))
	arg_2_0.ladyHeadIKComp.AimTarget = arg_2_0:Get("mainCameraTF"):Find("AimTarget")
	arg_2_0.ladyHeadIKData = {
		DampTime = arg_2_0.ladyHeadIKComp.DampTime,
		blinkSpeed = arg_2_0.ladyHeadIKComp.blinkSpeed,
		BodyWeight = arg_2_0.ladyHeadIKComp.BodyWeight,
		HeadWeight = arg_2_0.ladyHeadIKComp.HeadWeight
	}

	local var_2_0 = {}

	table.Foreach(DormConst.boneMap, function(arg_3_0, arg_3_1)
		var_2_0[arg_3_1] = arg_3_0
	end)

	arg_2_0.ladyAnimator = arg_2_0.lady:GetComponent(typeof(Animator))
	arg_2_0.ladyAnimBaseLayerIndex = arg_2_0.ladyAnimator:GetLayerIndex("Base Layer")
	arg_2_0.ladyAnimFaceLayerIndex = arg_2_0.ladyAnimator:GetLayerIndex("Face")
	arg_2_0.ladyBoneMaps = {}

	local var_2_1 = arg_2_0.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_2_1, function(arg_4_0, arg_4_1)
		if arg_4_1.name == "BodyCollider" then
			arg_2_0.ladyCollider = arg_4_1

			setActive(arg_4_1, true)
		elseif arg_4_1.name == "SafeCollider" then
			arg_2_0.ladySafeCollider = arg_4_1

			setActive(arg_4_1, false)
		elseif arg_4_1.name == "Interest" then
			arg_2_0.ladyInterestRoot = arg_4_1
		elseif arg_4_1.name == "Head Center" then
			arg_2_0.ladyHeadCenter = arg_4_1
		end

		if var_2_0[arg_4_1.name] then
			arg_2_0.ladyBoneMaps[var_2_0[arg_4_1.name]] = arg_4_1
		end
	end)

	arg_2_0.ladyColliders = {}
	arg_2_0.ladyTouchColliders = {}

	table.IpairsCArray(arg_2_0.lady:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_5_0, arg_5_1)
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

		arg_2_0.ladyColliders[var_5_3] = var_5_0

		table.insert(arg_2_0.ladyTouchColliders, var_5_0)
		setActive(var_5_0, false)
	end)

	arg_2_0.clothComps = {}
	arg_2_0.ladyClothCompSettings = {}

	table.IpairsCArray(arg_2_0.lady:GetComponentsInChildren(typeof("MagicaCloth2.MagicaCloth"), true), function(arg_6_0, arg_6_1)
		table.insert(arg_2_0.clothComps, arg_6_1)

		arg_2_0.ladyClothCompSettings[arg_6_1] = {
			enabled = arg_6_1.enabled
		}
	end)

	arg_2_0.clothColliderDict = {}
	arg_2_0.ladyClothColliderSettings = {}

	local var_2_2 = typeof("MagicaCloth2.MagicaCapsuleCollider")

	table.IpairsCArray(arg_2_0.lady:GetComponentsInChildren(var_2_2, true), function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1:GetSize()

		arg_2_0.clothColliderDict[arg_7_1.name] = arg_7_1
		arg_2_0.ladyClothColliderSettings[arg_7_1] = {
			enabled = arg_7_1.enabled,
			StartRadius = var_7_0.x,
			EndRadius = var_7_0.y
		}
	end)
	arg_2_0:EnableCloth(false)

	arg_2_0.ladyIKRoot = arg_2_0.lady:Find("IKLayers")

	eachChild(arg_2_0.ladyIKRoot, function(arg_8_0)
		setActive(arg_8_0, false)
	end)
	GetComponent(arg_2_0.lady, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_9_0, arg_9_1)
		if arg_9_1.rawPointerPress.transform == arg_2_0.ladyCollider then
			arg_2_0:Emit(Dorm3dRoomTemplateScene.CLICK_CHARACTER, arg_2_1)
		else
			local var_9_0 = table.keyof(arg_2_0.IKSettings.Colliders, arg_9_1.rawPointerPress.transform)

			arg_2_0:Emit(Dorm3dRoomTemplateScene.ON_TOUCH_CHARACTER, var_9_0 or arg_9_1.rawPointerPress.name)
		end
	end)
	arg_2_0.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_10_0)
		if arg_2_0.nowState and arg_10_0.animatorStateInfo:IsName(arg_2_0.nowState) then
			existCall(arg_2_0.stateCallback)

			return
		end

		local var_10_0 = arg_10_0.animatorStateInfo

		for iter_10_0, iter_10_1 in pairs(arg_2_0.animCallbacks) do
			if var_10_0:IsName(iter_10_0) then
				warning("Active", iter_10_0)

				local var_10_1 = table.removebykey(arg_2_0.animCallbacks, iter_10_0)

				existCall(var_10_1)

				return
			end
		end

		if arg_10_0.stringParameter ~= "" then
			switch(arg_10_0.stringParameter, arg_2_0.animExtraEvent, function()
				arg_2_0:Func("OnAnimationEvent", arg_10_0)
			end)
		end
	end)

	arg_2_0.animEventCallbacks = {}
	arg_2_0.animCallbacks = {}
	arg_2_0.animExtraEvent = {}

	local function var_2_3(arg_12_0, arg_12_1, arg_12_2)
		arg_2_0:Get("loader"):GetPrefab(arg_12_0, arg_12_1, function(arg_13_0)
			arg_13_0.name = arg_12_2
			arg_2_0[arg_12_2] = tf(arg_13_0)

			setActive(arg_13_0, false)
			onNextTick(function()
				setParent(arg_2_0[arg_12_2], arg_2_0.ladyHeadCenter)
			end)
		end)
	end

	arg_2_0.effectHeart = arg_2_0.ladyHeadCenter:Find("effectHeart")

	if not arg_2_0.effectHeart then
		var_2_3("dorm3d/effect/prefab/function/vfx_function_aixin02", "vfx_function_aixin02", "effectHeart")
	end

	arg_2_0.ladyWatchFloat = arg_2_0.ladyHeadCenter:Find("ladyWatchFloat")

	if not arg_2_0.ladyWatchFloat then
		var_2_3("dorm3d/effect/prefab/scene/vfx_talk_mark", "vfx_talk_mark", "ladyWatchFloat")
	end

	if arg_2_0.tfPendintItem then
		onNextTick(function()
			setParent(arg_2_0.tfPendintItem, arg_2_0.lady)
		end)
	end

	arg_2_0.ladyOwner = GetComponent(arg_2_0.lady, "GraphOwner")
	arg_2_0.ladyBlackboard = GetComponent(arg_2_0.lady, "Blackboard")

	arg_2_0:SetBlackboardValue("groupId", arg_2_1)
	onNextTick(function()
		arg_2_0.ladyOwner.enabled = true
	end)
	pg.ViewUtils.SetLayer(arg_2_0.lady, Layer.Character3D)

	arg_2_0.characterController = GetOrAddComponent(arg_2_0.ladyGameObject, typeof(CharacterController))
	arg_2_0.characterController.enabled = false
	arg_2_0.characterController.center = DormConst.CHARACTER_CONTROLLER.center
	arg_2_0.characterController.radius = DormConst.CHARACTER_CONTROLLER.radius
	arg_2_0.characterController.height = DormConst.CHARACTER_CONTROLLER.height
	arg_2_0.characterController.stepOffset = DormConst.CHARACTER_CONTROLLER.stepOffset
	arg_2_0.transparencyComp = GetOrAddComponent(arg_2_0.lady, typeof(CharacterTransparency))
	arg_2_0.transparencyComp.player = arg_2_0:Get("player")
	arg_2_0.transparencyComp.minDistance = DormConst.TRANSPARENCY_MIN_DISTANCE
	arg_2_0.transparencyComp.maxDistance = DormConst.TRANSPARENCY_MAX_DISTANCE
end

function var_0_0.SetZone(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0.ladyBaseZone = arg_17_1
	arg_17_0.ladyActiveZone = arg_17_2 or arg_17_1
end

function var_0_0.SwitchCharacterSkin(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_0.skinIdList

	assert(table.contains(var_18_0, arg_18_2))

	local var_18_1 = arg_18_0:GetCurrentAnim()
	local var_18_2 = arg_18_0.skinId
	local var_18_3 = arg_18_0:Get("skinDict")[var_18_2].ladyGameObject
	local var_18_4 = var_18_3.transform.position
	local var_18_5 = var_18_3.transform.rotation
	local var_18_6 = arg_18_0.ladyBlackboard

	setActive(var_18_3, false)

	arg_18_0.skinId = arg_18_2

	setActive(arg_18_0:Get("skinDict")[arg_18_2].ladyGameObject, true)

	arg_18_0.ladyGameObject = arg_18_0:Get("skinDict")[arg_18_2].ladyGameObject
	arg_18_0.ladyCollider = nil

	arg_18_0:InitCharacter(arg_18_1)
	pg.NodeCanvasMgr.GetInstance():CopyAllBlackBoardValue(var_18_6, arg_18_0.ladyBlackboard)
	arg_18_0.ladyAnimator:Play(var_18_1, arg_18_0.ladyAnimBaseLayerIndex)
	arg_18_0.ladyAnimator:Update(0)
	arg_18_0.lady:SetPositionAndRotation(var_18_4, var_18_5)
	existCall(arg_18_3)
end

function var_0_0.SetBlackboardValue(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.blackboard = arg_19_0.blackboard or {}
	arg_19_0.blackboard[arg_19_1] = arg_19_2

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_19_1, arg_19_2, arg_19_0.ladyBlackboard)
end

function var_0_0.GetBlackboardValue(arg_20_0, arg_20_1)
	arg_20_0.blackboard = arg_20_0.blackboard or {}

	return arg_20_0.blackboard[arg_20_1]
end

function var_0_0.HideCharacterPart(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0, var_21_1 = Dorm3dSkin.New({
		configId = arg_21_1
	}):GetActiveAndHiddenPartNames(arg_21_2)

	if arg_21_0.lady == nil then
		arg_21_0.lady = arg_21_0.ladyGameObject.transform
	end

	_.each(var_21_0, function(arg_22_0)
		setActive(arg_21_0.lady:Find(arg_22_0), true)
	end)
	_.each(var_21_1, function(arg_23_0)
		setActive(arg_21_0.lady:Find(arg_23_0), false)
	end)
end

function var_0_0.GetCurrentAnim(arg_24_0)
	return arg_24_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_24_0.ladyAnimBaseLayerIndex).shortNameHash
end

function var_0_0.EnableCloth(arg_25_0, arg_25_1, arg_25_2)
	arg_25_1 = arg_25_1 or {}

	table.Foreach(arg_25_0.clothComps, function(arg_26_0, arg_26_1)
		if arg_26_1 == nil then
			return
		end

		setActive(arg_26_1, arg_25_1[arg_26_0] == 1)
	end)
	table.Foreach(arg_25_0.clothColliderDict, function(arg_27_0, arg_27_1)
		if arg_27_1 == nil then
			return
		end

		setActive(arg_27_1, false)
	end)

	if arg_25_2 then
		table.Foreach(arg_25_2, function(arg_28_0, arg_28_1)
			local var_28_0 = arg_25_0.clothColliderDict[arg_28_1[1]]

			if var_28_0 == nil then
				return
			end

			setActive(var_28_0, arg_28_1[2] == 1)

			if arg_28_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_28_0, arg_28_1[3], arg_28_1[4])
		end)
	end
end

function var_0_0.PlaySingleAction(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	warning("Play", arg_29_1)

	local var_29_0 = string.find(arg_29_1, "^Face_")
	local var_29_1 = tobool(var_29_0)

	if not var_29_1 then
		local var_29_2 = string.find(arg_29_1, "^face_")

		var_29_1 = tobool(var_29_2)
	end

	if var_29_1 then
		arg_29_0:PlayFaceAnim(arg_29_1, arg_29_2)

		return
	end

	if arg_29_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_29_0.ladyAnimBaseLayerIndex):IsName(arg_29_1) then
		return
	end

	existCall(arg_29_0.animExtraItemCallback)

	arg_29_0.animExtraItemCallback = nil

	local var_29_3 = arg_29_0:GetBlackboardValue("groupId")
	local var_29_4 = _.detect(pg.dorm3d_anim_extraitem.get_id_list_by_ship_id[var_29_3] or {}, function(arg_30_0)
		return pg.dorm3d_anim_extraitem[arg_30_0].anim == arg_29_1
	end)
	local var_29_5 = var_29_4 and pg.dorm3d_anim_extraitem[var_29_4]
	local var_29_6

	arg_29_3 = arg_29_3 or DormConst.DEFAULT_ANIM_FADE_IN_TIME

	seriesAsync({
		function(arg_31_0)
			if not var_29_5 or var_29_5.item_prefab == "" then
				arg_31_0()

				return
			end

			local var_31_0 = string.lower("dorm3d/furniture/item/" .. var_29_5.item_prefab)

			arg_29_0:Get("loader"):GetPrefab(var_31_0, "", function(arg_32_0)
				setParent(arg_32_0, arg_29_0.lady)

				if var_29_5.item_shield ~= "" then
					var_29_6 = {}

					for iter_32_0, iter_32_1 in ipairs(var_29_5.item_shield) do
						local var_32_0 = arg_29_0:Get("modelRoot"):Find(iter_32_1)

						if not var_32_0 then
							warning(string.format("dorm3d_anim_extraitem:%d without hide item:%s", var_29_5.id, iter_32_1))
						else
							var_29_6[iter_32_1] = isActive(var_32_0)

							setActive(var_32_0, false)
						end
					end
				end

				function arg_29_0.animExtraItemCallback()
					arg_29_0:Get("loader"):ClearRequest("AnimExtraItem")

					if var_29_6 then
						for iter_33_0, iter_33_1 in pairs(var_29_6) do
							setActive(arg_29_0:Get("modelRoot"):Find(iter_33_0), iter_33_1)
						end
					end
				end

				arg_31_0()
			end, "AnimExtraItem")
		end,
		function(arg_34_0)
			arg_29_0.nowState = arg_29_1
			arg_29_0.stateCallback = arg_34_0

			if IsUnityEditor and not arg_29_0.ladyAnimator:HasState(arg_29_0.ladyAnimBaseLayerIndex, Animator.StringToHash(arg_29_1)) then
				errorMsg("！！！！！！！！动画不存在>>>>>>>>>>>>>", arg_29_1)
			end

			arg_29_0.ladyAnimator:CrossFadeInFixedTime(arg_29_1, arg_29_3, arg_29_0.ladyAnimBaseLayerIndex)
		end,
		function(arg_35_0)
			arg_29_0.nowState = nil
			arg_29_0.stateCallback = nil

			existCall(arg_29_0.animExtraItemCallback)

			arg_29_0.animExtraItemCallback = nil

			arg_35_0()
		end,
		arg_29_2
	})
end

function var_0_0.PlayFaceAnim(arg_36_0, arg_36_1, arg_36_2)
	if IsUnityEditor and not arg_36_0.ladyAnimator:HasState(arg_36_0.ladyAnimFaceLayerIndex, Animator.StringToHash(arg_36_1)) then
		errorMsg("！！！！！！！！动画不存在>>>>>>>>>>>>>", arg_36_1)
	end

	arg_36_0.ladyAnimator:CrossFadeInFixedTime(arg_36_1, 0, arg_36_0.ladyAnimFaceLayerIndex)
	existCall(arg_36_2)
end

function var_0_0.SwitchAnim(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = string.find(arg_37_1, "^Face_")

	if tobool(var_37_0) then
		arg_37_0:PlayFaceAnim(arg_37_1, arg_37_2)

		return
	end

	existCall(arg_37_0.animExtraItemCallback)

	arg_37_0.animExtraItemCallback = nil

	local var_37_1 = {}

	table.insert(var_37_1, function(arg_38_0)
		arg_37_0.nowState = arg_37_1
		arg_37_0.stateCallback = arg_38_0

		arg_37_0.ladyAnimator:PlayInFixedTime(arg_37_1, arg_37_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_37_1, function(arg_39_0)
		arg_37_0.nowState = nil
		arg_37_0.stateCallback = nil

		arg_39_0()
	end)
	seriesAsync(var_37_1, arg_37_2)
end

function var_0_0.RegisterAnimExtraEvent(arg_40_0, arg_40_1, arg_40_2)
	arg_40_0.animExtraEvent[arg_40_1] = arg_40_2
end

function var_0_0.RevertClothComps(arg_41_0)
	table.Foreach(arg_41_0.ladyClothCompSettings, function(arg_42_0, arg_42_1)
		arg_42_0.enabled = arg_42_1.enabled
	end)
	table.Foreach(arg_41_0.ladyClothColliderSettings, function(arg_43_0, arg_43_1)
		arg_43_0.enabled = arg_43_1.enabled

		var_0_0.SetMagicaCollider(arg_43_0, arg_43_1.StartRadius, arg_43_1.EndRadius)
	end)
end

function var_0_0.SetMagicaCollider(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = typeof("MagicaCloth2.MagicaCapsuleCollider")
	local var_44_1 = arg_44_0:GetSize()

	var_44_1.x = arg_44_1
	var_44_1.y = arg_44_2

	arg_44_0:SetSize(var_44_1)
end

function var_0_0.MoveToTarget(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	arg_45_2 = arg_45_2 or DormConst.LADY_MOVE_SPEED
	arg_45_3 = arg_45_3 or DormConst.LADY_ROTATE_SPEED

	local var_45_0 = arg_45_1 - arg_45_0.lady.position

	var_45_0.y = 0

	if var_45_0 ~= Vector3.zero then
		local var_45_1 = Quaternion.LookRotation(var_45_0)

		arg_45_0.lady.rotation = Quaternion.Slerp(arg_45_0.lady.rotation, var_45_1, Time.deltaTime * arg_45_3)
	end

	local var_45_2 = var_45_0.normalized * arg_45_2

	arg_45_0.characterController:Move(var_45_2 * Time.deltaTime)
end

function var_0_0.SetCurrentIkTimelineStatus(arg_46_0, arg_46_1)
	arg_46_0.currentIkTimelineStatus = arg_46_1
end

function var_0_0.CheckIkTimelineStatus(arg_47_0, arg_47_1)
	if not arg_47_0.currentIkTimelineStatus then
		return true
	end

	return arg_47_0.currentIkTimelineStatus ~= arg_47_1
end

function var_0_0.SetCollisible(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_0.ladyCollider:GetComponent(typeof(UnityEngine.CapsuleCollider))

	if arg_48_1 then
		var_48_0.excludeLayers = LayerMask.GetMask("Nothing")
		arg_48_0.characterController.excludeLayers = LayerMask.GetMask("Nothing")
	else
		var_48_0.excludeLayers = LayerMask.GetMask("Player")
		arg_48_0.characterController.excludeLayers = LayerMask.GetMask("Player")
	end
end

function var_0_0.EnableCharacterTransparency(arg_49_0, arg_49_1)
	arg_49_0.transparencyComp.Enable = arg_49_1
end

function var_0_0.BlockCanWatch(arg_50_0, arg_50_1)
	arg_50_0.blockCanWatch = arg_50_1
end

function var_0_0.SetPosition(arg_51_0, arg_51_1)
	arg_51_0.lady.position = arg_51_1
end

function var_0_0.SetRotation(arg_52_0, arg_52_1)
	arg_52_0.lady.rotation = arg_52_1
end

return var_0_0
