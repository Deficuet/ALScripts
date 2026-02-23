local var_0_0 = class("LadyEnv", import("view.dorm3d.Core.BaseLadyEnv"))

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
			arg_2_0:Func("OnAnimationEvent", arg_10_0)
		end
	end)

	arg_2_0.animEventCallbacks = {}
	arg_2_0.animCallbacks = {}

	local function var_2_3(arg_11_0, arg_11_1, arg_11_2)
		arg_2_0:Get("loader"):GetPrefab(arg_11_0, arg_11_1, function(arg_12_0)
			arg_12_0.name = arg_11_2
			arg_2_0[arg_11_2] = tf(arg_12_0)

			setActive(arg_12_0, false)
			onNextTick(function()
				setParent(arg_2_0[arg_11_2], arg_2_0.ladyHeadCenter)
			end)
		end)
	end

	arg_2_0.effectHeart = arg_2_0.ladyHeadCenter:Find("effectHeart")

	if not arg_2_0.effectHeart then
		var_2_3("dorm3d/effect/prefab/function/vfx_function_aixin02", "vfx_function_aixin02", "effectHeart")
	end

	arg_2_0.ladyWatchFloat = arg_2_0.ladyHeadCenter:Find("ladyWatchFloat")

	if not arg_2_0.ladyWatchFloat then
		var_2_3("dorm3d/effect/prefab/function/vfx_talk_mark", "vfx_talk_mark", "ladyWatchFloat")
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
	arg_2_0.animationEventDispatcher = GetOrAddComponent(arg_2_0.lady, typeof(DormAnimationEventDispatcher))
	arg_2_0.animationEventDispatcher.listenLayer = arg_2_0.ladyAnimBaseLayerIndex
end

function var_0_0.SetZone(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.ladyBaseZone = arg_16_1
	arg_16_0.ladyActiveZone = arg_16_2 or arg_16_1
end

function var_0_0.SwitchCharacterSkin(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = arg_17_0.skinIdList

	assert(table.contains(var_17_0, arg_17_2))

	local var_17_1 = arg_17_0:GetCurrentAnim()
	local var_17_2 = arg_17_0.skinId
	local var_17_3 = arg_17_0:Get("skinDict")[var_17_2].ladyGameObject
	local var_17_4 = var_17_3.transform.position
	local var_17_5 = var_17_3.transform.rotation
	local var_17_6 = arg_17_0.ladyBlackboard

	setActive(var_17_3, false)

	arg_17_0.skinId = arg_17_2

	setActive(arg_17_0:Get("skinDict")[arg_17_2].ladyGameObject, true)

	arg_17_0.ladyGameObject = arg_17_0:Get("skinDict")[arg_17_2].ladyGameObject
	arg_17_0.ladyCollider = nil

	arg_17_0:InitCharacter(arg_17_1)
	pg.NodeCanvasMgr.GetInstance():CopyAllBlackBoardValue(var_17_6, arg_17_0.ladyBlackboard)
	arg_17_0.ladyAnimator:Play(var_17_1, arg_17_0.ladyAnimBaseLayerIndex)
	arg_17_0.ladyAnimator:Update(0)
	arg_17_0.lady:SetPositionAndRotation(var_17_4, var_17_5)
	arg_17_0:Func("InitHolyLight")
	existCall(arg_17_3)
end

function var_0_0.SetBlackboardValue(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.blackboard = arg_18_0.blackboard or {}
	arg_18_0.blackboard[arg_18_1] = arg_18_2

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_18_1, arg_18_2, arg_18_0.ladyBlackboard)
end

function var_0_0.GetBlackboardValue(arg_19_0, arg_19_1)
	arg_19_0.blackboard = arg_19_0.blackboard or {}

	return arg_19_0.blackboard[arg_19_1]
end

function var_0_0.GetCurrentAnim(arg_20_0)
	return arg_20_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_20_0.ladyAnimBaseLayerIndex).shortNameHash
end

function var_0_0.EnableCloth(arg_21_0, arg_21_1, arg_21_2)
	arg_21_1 = arg_21_1 or {}

	table.Foreach(arg_21_0.clothComps, function(arg_22_0, arg_22_1)
		if arg_22_1 == nil then
			return
		end

		setActive(arg_22_1, arg_21_1[arg_22_0] == 1)
	end)
	table.Foreach(arg_21_0.clothColliderDict, function(arg_23_0, arg_23_1)
		if arg_23_1 == nil then
			return
		end

		setActive(arg_23_1, false)
	end)

	if arg_21_2 then
		table.Foreach(arg_21_2, function(arg_24_0, arg_24_1)
			local var_24_0 = arg_21_0.clothColliderDict[arg_24_1[1]]

			if var_24_0 == nil then
				return
			end

			setActive(var_24_0, arg_24_1[2] == 1)

			if arg_24_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_24_0, arg_24_1[3], arg_24_1[4])
		end)
	end
end

function var_0_0.PlaySingleAction(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	warning("Play", arg_25_1)

	local var_25_0 = string.find(arg_25_1, "^Face_")
	local var_25_1 = tobool(var_25_0)

	if not var_25_1 then
		local var_25_2 = string.find(arg_25_1, "^face_")

		var_25_1 = tobool(var_25_2)
	end

	if var_25_1 then
		arg_25_0:PlayFaceAnim(arg_25_1, arg_25_2)

		return
	end

	if arg_25_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_25_0.ladyAnimBaseLayerIndex):IsName(arg_25_1) then
		return
	end

	existCall(arg_25_0.animExtraItemCallback)

	arg_25_0.animExtraItemCallback = nil

	local var_25_3 = arg_25_0:GetBlackboardValue("groupId")
	local var_25_4 = _.detect(pg.dorm3d_anim_extraitem.get_id_list_by_ship_id[var_25_3] or {}, function(arg_26_0)
		return pg.dorm3d_anim_extraitem[arg_26_0].anim == arg_25_1
	end)
	local var_25_5 = var_25_4 and pg.dorm3d_anim_extraitem[var_25_4]
	local var_25_6

	arg_25_3 = arg_25_3 or DormConst.DEFAULT_ANIM_FADE_IN_TIME

	seriesAsync({
		function(arg_27_0)
			if not var_25_5 or var_25_5.item_prefab == "" then
				arg_27_0()

				return
			end

			local var_27_0 = string.lower("dorm3d/furniture/item/" .. var_25_5.item_prefab)

			arg_25_0:Get("loader"):GetPrefab(var_27_0, "", function(arg_28_0)
				setParent(arg_28_0, arg_25_0.lady)

				if var_25_5.item_shield ~= "" then
					var_25_6 = {}

					for iter_28_0, iter_28_1 in ipairs(var_25_5.item_shield) do
						local var_28_0 = arg_25_0:Get("modelRoot"):Find(iter_28_1)

						if not var_28_0 then
							warning(string.format("dorm3d_anim_extraitem:%d without hide item:%s", var_25_5.id, iter_28_1))
						else
							var_25_6[iter_28_1] = isActive(var_28_0)

							setActive(var_28_0, false)
						end
					end
				end

				function arg_25_0.animExtraItemCallback()
					arg_25_0:Get("loader"):ClearRequest("AnimExtraItem")

					if var_25_6 then
						for iter_29_0, iter_29_1 in pairs(var_25_6) do
							setActive(arg_25_0:Get("modelRoot"):Find(iter_29_0), iter_29_1)
						end
					end
				end

				arg_27_0()
			end, "AnimExtraItem")
		end,
		function(arg_30_0)
			arg_25_0.nowState = arg_25_1
			arg_25_0.stateCallback = arg_30_0

			if IsUnityEditor and not arg_25_0.ladyAnimator:HasState(arg_25_0.ladyAnimBaseLayerIndex, Animator.StringToHash(arg_25_1)) then
				errorMsg("！！！！！！！！动画不存在>>>>>>>>>>>>>", arg_25_1)
			end

			arg_25_0.ladyAnimator:CrossFadeInFixedTime(arg_25_1, arg_25_3, arg_25_0.ladyAnimBaseLayerIndex)
		end,
		function(arg_31_0)
			arg_25_0.nowState = nil
			arg_25_0.stateCallback = nil

			existCall(arg_25_0.animExtraItemCallback)

			arg_25_0.animExtraItemCallback = nil

			arg_31_0()
		end,
		arg_25_2
	})
end

function var_0_0.PlayFaceAnim(arg_32_0, arg_32_1, arg_32_2)
	if IsUnityEditor and not arg_32_0.ladyAnimator:HasState(arg_32_0.ladyAnimFaceLayerIndex, Animator.StringToHash(arg_32_1)) then
		errorMsg("！！！！！！！！动画不存在>>>>>>>>>>>>>", arg_32_1)
	end

	arg_32_0.ladyAnimator:CrossFadeInFixedTime(arg_32_1, 0, arg_32_0.ladyAnimFaceLayerIndex)
	existCall(arg_32_2)
end

function var_0_0.SwitchAnim(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = string.find(arg_33_1, "^Face_")

	if tobool(var_33_0) then
		arg_33_0:PlayFaceAnim(arg_33_1, arg_33_2)

		return
	end

	existCall(arg_33_0.animExtraItemCallback)

	arg_33_0.animExtraItemCallback = nil

	local var_33_1 = {}

	table.insert(var_33_1, function(arg_34_0)
		arg_33_0.nowState = arg_33_1
		arg_33_0.stateCallback = arg_34_0

		arg_33_0.ladyAnimator:PlayInFixedTime(arg_33_1, arg_33_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_33_1, function(arg_35_0)
		arg_33_0.nowState = nil
		arg_33_0.stateCallback = nil

		arg_35_0()
	end)
	seriesAsync(var_33_1, arg_33_2)
end

function var_0_0.RevertClothComps(arg_36_0)
	table.Foreach(arg_36_0.ladyClothCompSettings, function(arg_37_0, arg_37_1)
		arg_37_0.enabled = arg_37_1.enabled
	end)
	table.Foreach(arg_36_0.ladyClothColliderSettings, function(arg_38_0, arg_38_1)
		arg_38_0.enabled = arg_38_1.enabled

		var_0_0.SetMagicaCollider(arg_38_0, arg_38_1.StartRadius, arg_38_1.EndRadius)
	end)
end

function var_0_0.SetMagicaCollider(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = typeof("MagicaCloth2.MagicaCapsuleCollider")
	local var_39_1 = arg_39_0:GetSize()

	var_39_1.x = arg_39_1
	var_39_1.y = arg_39_2

	arg_39_0:SetSize(var_39_1)
end

function var_0_0.MoveToTarget(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	arg_40_2 = arg_40_2 or DormConst.LADY_MOVE_SPEED
	arg_40_3 = arg_40_3 or DormConst.LADY_ROTATE_SPEED

	local var_40_0 = arg_40_1 - arg_40_0.lady.position

	var_40_0.y = 0

	if var_40_0 ~= Vector3.zero then
		local var_40_1 = Quaternion.LookRotation(var_40_0)

		arg_40_0.lady.rotation = Quaternion.Slerp(arg_40_0.lady.rotation, var_40_1, Time.deltaTime * arg_40_3)
	end

	local var_40_2 = var_40_0.normalized * arg_40_2

	arg_40_0.characterController:Move(var_40_2 * Time.deltaTime)
end

function var_0_0.SetCurrentIkTimelineStatus(arg_41_0, arg_41_1)
	arg_41_0.currentIkTimelineStatus = arg_41_1
end

function var_0_0.CheckIkTimelineStatus(arg_42_0, arg_42_1)
	if not arg_42_0.currentIkTimelineStatus then
		return true
	end

	return arg_42_0.currentIkTimelineStatus ~= arg_42_1
end

function var_0_0.SetCollisible(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0.ladyCollider:GetComponent(typeof(UnityEngine.CapsuleCollider))

	if arg_43_1 then
		var_43_0.excludeLayers = LayerMask.GetMask("Nothing")
		arg_43_0.characterController.excludeLayers = LayerMask.GetMask("Nothing")
	else
		var_43_0.excludeLayers = LayerMask.GetMask("Player")
		arg_43_0.characterController.excludeLayers = LayerMask.GetMask("Player")
	end
end

function var_0_0.EnableCharacterTransparency(arg_44_0, arg_44_1)
	arg_44_0.transparencyComp.Enable = arg_44_1
end

function var_0_0.BlockCanWatch(arg_45_0, arg_45_1)
	arg_45_0.blockCanWatch = arg_45_1
end

function var_0_0.SetPosition(arg_46_0, arg_46_1)
	arg_46_0.lady.position = arg_46_1
end

function var_0_0.SetRotation(arg_47_0, arg_47_1)
	arg_47_0.lady.rotation = arg_47_1
end

return var_0_0
