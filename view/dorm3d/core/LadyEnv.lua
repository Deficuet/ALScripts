local var_0_0 = class("LadyEnv", import("view.dorm3d.Core.BaseLadyEnv"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.super.Ctor(arg_1_0, arg_1_1.event, arg_1_1)
end

function var_0_0.InitCharacter(arg_2_0, arg_2_1)
	arg_2_0:InitCharacterRoot()
	arg_2_0:InitCharacterAimIK()
	arg_2_0:InitCharacterAnimator()
	arg_2_0:InitCharacterHierarchy()
	arg_2_0:InitCharacterCollider()
	arg_2_0:InitCharacterCloth()
	arg_2_0:InitCharacterIKRoot()
	arg_2_0:InitCharacterTouchEvent(arg_2_1)
	arg_2_0:InitCharacterAnimationEvent()
	arg_2_0:InitCharacterEffects()
	arg_2_0:InitCharacterBlackboard(arg_2_1)
	arg_2_0:InitCharacterLayer()
	arg_2_0:InitCharacterController()
	arg_2_0:InitCharacterTransparency()
	arg_2_0:InitCharacterAnimationDispatcher()
end

function var_0_0.InitCharacterRoot(arg_3_0)
	arg_3_0.lady = arg_3_0.ladyGameObject.transform

	arg_3_0.lady:SetParent(arg_3_0:Get("mainCameraTF"))
	arg_3_0.lady:SetParent(nil)
end

function var_0_0.InitCharacterAimIK(arg_4_0)
	arg_4_0.ladyHeadIKComp = arg_4_0.lady:GetComponent(typeof(HeadAimIK))
	arg_4_0.ladyHeadIKComp.AimTarget = arg_4_0:Get("mainCameraTF"):Find("AimTarget")
	arg_4_0.ladyHeadIKData = {
		DampTime = arg_4_0.ladyHeadIKComp.DampTime,
		blinkSpeed = arg_4_0.ladyHeadIKComp.blinkSpeed,
		BodyWeight = arg_4_0.ladyHeadIKComp.BodyWeight,
		HeadWeight = arg_4_0.ladyHeadIKComp.HeadWeight
	}
end

function var_0_0.InitCharacterAnimator(arg_5_0)
	arg_5_0.ladyAnimator = arg_5_0.lady:GetComponent(typeof(Animator))
	arg_5_0.ladyAnimBaseLayerIndex = arg_5_0.ladyAnimator:GetLayerIndex("Base Layer")
	arg_5_0.ladyAnimFaceLayerIndex = arg_5_0.ladyAnimator:GetLayerIndex("Face")
end

function var_0_0.InitCharacterHierarchy(arg_6_0)
	local var_6_0 = {}

	table.Foreach(DormConst.boneMap, function(arg_7_0, arg_7_1)
		var_6_0[arg_7_1] = arg_7_0
	end)

	arg_6_0.ladyBoneMaps = {}

	local var_6_1 = arg_6_0.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_6_1, function(arg_8_0, arg_8_1)
		if arg_8_1.name == "BodyCollider" then
			arg_6_0.ladyCollider = arg_8_1

			setActive(arg_8_1, true)
		elseif arg_8_1.name == "SafeCollider" then
			arg_6_0.ladySafeCollider = arg_8_1

			setActive(arg_8_1, false)
		elseif arg_8_1.name == "Interest" then
			arg_6_0.ladyInterestRoot = arg_8_1
		elseif arg_8_1.name == "Head Center" then
			arg_6_0.ladyHeadCenter = arg_8_1
		end

		if var_6_0[arg_8_1.name] then
			arg_6_0.ladyBoneMaps[var_6_0[arg_8_1.name]] = arg_8_1
		end
	end)
end

function var_0_0.InitCharacterCollider(arg_9_0)
	arg_9_0.ladyColliders = {}
	arg_9_0.ladyTouchColliders = {}

	table.IpairsCArray(arg_9_0.lady:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_10_0, arg_10_1)
		if arg_10_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		local var_10_0 = tf(arg_10_1)
		local var_10_1 = var_10_0.name
		local var_10_2 = var_10_1 and string.find(var_10_1, "Collider") or -1
		local var_10_3 = string.sub(var_10_1, 1, var_10_2 - 1)

		if DormConst.BONE_TO_TOUCH[var_10_3] == nil then
			return
		end

		arg_9_0.ladyColliders[var_10_3] = var_10_0

		table.insert(arg_9_0.ladyTouchColliders, var_10_0)
		setActive(var_10_0, false)
	end)
end

function var_0_0.InitCharacterCloth(arg_11_0)
	arg_11_0.clothComps = {}
	arg_11_0.ladyClothCompSettings = {}

	table.IpairsCArray(arg_11_0.lady:GetComponentsInChildren(typeof("MagicaCloth2.MagicaCloth"), true), function(arg_12_0, arg_12_1)
		table.insert(arg_11_0.clothComps, arg_12_1)

		arg_11_0.ladyClothCompSettings[arg_12_1] = {
			enabled = arg_12_1.enabled
		}
	end)

	arg_11_0.clothColliderDict = {}
	arg_11_0.ladyClothColliderSettings = {}

	local var_11_0 = typeof("MagicaCloth2.MagicaCapsuleCollider")

	table.IpairsCArray(arg_11_0.lady:GetComponentsInChildren(var_11_0, true), function(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_1:GetSize()

		arg_11_0.clothColliderDict[arg_13_1.name] = arg_13_1
		arg_11_0.ladyClothColliderSettings[arg_13_1] = {
			enabled = arg_13_1.enabled,
			StartRadius = var_13_0.x,
			EndRadius = var_13_0.y
		}
	end)
	arg_11_0:EnableCloth(false)
end

function var_0_0.InitCharacterIKRoot(arg_14_0)
	arg_14_0.ladyIKRoot = arg_14_0.lady:Find("IKLayers")

	eachChild(arg_14_0.ladyIKRoot, function(arg_15_0)
		setActive(arg_15_0, false)
	end)
end

function var_0_0.InitCharacterTouchEvent(arg_16_0, arg_16_1)
	GetComponent(arg_16_0.lady, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_17_0, arg_17_1)
		if arg_17_1.rawPointerPress.transform == arg_16_0.ladyCollider then
			arg_16_0:Emit(Dorm3dRoomTemplateScene.CLICK_CHARACTER, arg_16_1)
		end
	end)
end

function var_0_0.InitCharacterAnimationEvent(arg_18_0)
	arg_18_0.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_19_0)
		if arg_18_0.nowState and arg_19_0.animatorStateInfo:IsName(arg_18_0.nowState) then
			existCall(arg_18_0.stateCallback)

			return
		end

		local var_19_0 = arg_19_0.animatorStateInfo

		for iter_19_0, iter_19_1 in pairs(arg_18_0.animCallbacks) do
			if var_19_0:IsName(iter_19_0) then
				warning("Active", iter_19_0)

				local var_19_1 = table.removebykey(arg_18_0.animCallbacks, iter_19_0)

				existCall(var_19_1)

				return
			end
		end

		if arg_19_0.stringParameter ~= "" then
			arg_18_0:Func("OnAnimationEvent", arg_19_0)
		end
	end)

	arg_18_0.animEventCallbacks = {}
	arg_18_0.animCallbacks = {}
end

function var_0_0.InitCharacterEffects(arg_20_0)
	local function var_20_0(arg_21_0, arg_21_1, arg_21_2)
		arg_20_0:Get("loader"):GetPrefab(arg_21_0, arg_21_1, function(arg_22_0)
			arg_22_0.name = arg_21_2
			arg_20_0[arg_21_2] = tf(arg_22_0)

			setActive(arg_22_0, false)
			onNextTick(function()
				setParent(arg_20_0[arg_21_2], arg_20_0.ladyHeadCenter)
			end)
		end)
	end

	arg_20_0.effectHeart = arg_20_0.ladyHeadCenter:Find("effectHeart")

	if not arg_20_0.effectHeart then
		var_20_0("dorm3d/effect/prefab/function/vfx_function_aixin02", "vfx_function_aixin02", "effectHeart")
	end

	arg_20_0.ladyWatchFloat = arg_20_0.ladyHeadCenter:Find("ladyWatchFloat")

	if not arg_20_0.ladyWatchFloat then
		var_20_0("dorm3d/effect/prefab/function/vfx_talk_mark", "vfx_talk_mark", "ladyWatchFloat")
	end

	if arg_20_0.tfPendintItem then
		onNextTick(function()
			setParent(arg_20_0.tfPendintItem, arg_20_0.lady)
		end)
	end
end

function var_0_0.InitCharacterBlackboard(arg_25_0, arg_25_1)
	arg_25_0.ladyOwner = GetComponent(arg_25_0.lady, "GraphOwner")
	arg_25_0.ladyBlackboard = GetComponent(arg_25_0.lady, "Blackboard")

	arg_25_0:SetBlackboardValue("groupId", arg_25_1)
	onNextTick(function()
		arg_25_0.ladyOwner.enabled = true
	end)
end

function var_0_0.InitCharacterLayer(arg_27_0)
	pg.ViewUtils.SetLayer(arg_27_0.lady, Layer.Character3D)
end

function var_0_0.InitCharacterController(arg_28_0)
	arg_28_0.characterController = GetOrAddComponent(arg_28_0.ladyGameObject, typeof(CharacterController))
	arg_28_0.characterController.enabled = false
	arg_28_0.characterController.center = DormConst.CHARACTER_CONTROLLER.center
	arg_28_0.characterController.radius = DormConst.CHARACTER_CONTROLLER.radius
	arg_28_0.characterController.height = DormConst.CHARACTER_CONTROLLER.height
	arg_28_0.characterController.stepOffset = DormConst.CHARACTER_CONTROLLER.stepOffset
end

function var_0_0.InitCharacterTransparency(arg_29_0)
	arg_29_0.transparencyComp = GetOrAddComponent(arg_29_0.lady, typeof(CharacterTransparency))
	arg_29_0.transparencyComp.player = arg_29_0:Get("player")
	arg_29_0.transparencyComp.minDistance = DormConst.TRANSPARENCY_MIN_DISTANCE
	arg_29_0.transparencyComp.maxDistance = DormConst.TRANSPARENCY_MAX_DISTANCE
end

function var_0_0.InitCharacterAnimationDispatcher(arg_30_0)
	arg_30_0.animationEventDispatcher = GetOrAddComponent(arg_30_0.lady, typeof(DormAnimationEventDispatcher))
	arg_30_0.animationEventDispatcher.listenLayer = arg_30_0.ladyAnimBaseLayerIndex
end

function var_0_0.SwitchCharacterSkin(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = arg_31_0.skinIdList

	assert(table.contains(var_31_0, arg_31_2))

	local var_31_1 = arg_31_0:GetCurrentAnim()
	local var_31_2 = arg_31_0.skinId
	local var_31_3 = arg_31_0:Get("skinDict")[var_31_2].ladyGameObject
	local var_31_4 = var_31_3.transform.position
	local var_31_5 = var_31_3.transform.rotation
	local var_31_6 = arg_31_0.ladyBlackboard

	setActive(var_31_3, false)

	arg_31_0.skinId = arg_31_2

	setActive(arg_31_0:Get("skinDict")[arg_31_2].ladyGameObject, true)

	arg_31_0.ladyGameObject = arg_31_0:Get("skinDict")[arg_31_2].ladyGameObject
	arg_31_0.ladyCollider = nil

	arg_31_0:InitCharacter(arg_31_1)
	arg_31_0:Func("HXCharacter", arg_31_0.lady, arg_31_0.skinId)
	pg.NodeCanvasMgr.GetInstance():CopyAllBlackBoardValue(var_31_6, arg_31_0.ladyBlackboard)
	arg_31_0.ladyAnimator:Play(var_31_1, arg_31_0.ladyAnimBaseLayerIndex)
	arg_31_0.ladyAnimator:Update(0)
	arg_31_0.lady:SetPositionAndRotation(var_31_4, var_31_5)
	arg_31_0:Func("InitHolyLight")
	existCall(arg_31_3)
end

function var_0_0.SetBlackboardValue(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0.blackboard = arg_32_0.blackboard or {}
	arg_32_0.blackboard[arg_32_1] = arg_32_2

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_32_1, arg_32_2, arg_32_0.ladyBlackboard)
end

function var_0_0.GetBlackboardValue(arg_33_0, arg_33_1)
	arg_33_0.blackboard = arg_33_0.blackboard or {}

	return arg_33_0.blackboard[arg_33_1]
end

function var_0_0.GetCurrentAnim(arg_34_0)
	return arg_34_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_34_0.ladyAnimBaseLayerIndex).shortNameHash
end

function var_0_0.EnableCloth(arg_35_0, arg_35_1, arg_35_2)
	arg_35_1 = arg_35_1 or {}

	table.Foreach(arg_35_0.clothComps, function(arg_36_0, arg_36_1)
		if arg_36_1 == nil then
			return
		end

		setActive(arg_36_1, arg_35_1[arg_36_0] == 1)
	end)
	table.Foreach(arg_35_0.clothColliderDict, function(arg_37_0, arg_37_1)
		if arg_37_1 == nil then
			return
		end

		setActive(arg_37_1, false)
	end)

	if arg_35_2 then
		table.Foreach(arg_35_2, function(arg_38_0, arg_38_1)
			local var_38_0 = arg_35_0.clothColliderDict[arg_38_1[1]]

			if var_38_0 == nil then
				return
			end

			setActive(var_38_0, arg_38_1[2] == 1)

			if arg_38_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_38_0, arg_38_1[3], arg_38_1[4])
		end)
	end
end

function var_0_0.PlaySingleAction(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	warning("Play", arg_39_1)

	local var_39_0 = string.find(arg_39_1, "^Face_")
	local var_39_1 = tobool(var_39_0)

	if not var_39_1 then
		local var_39_2 = string.find(arg_39_1, "^face_")

		var_39_1 = tobool(var_39_2)
	end

	if var_39_1 then
		arg_39_0:PlayFaceAnim(arg_39_1, arg_39_2)

		return
	end

	if arg_39_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_39_0.ladyAnimBaseLayerIndex):IsName(arg_39_1) then
		return
	end

	existCall(arg_39_0.animExtraItemCallback)

	arg_39_0.animExtraItemCallback = nil

	local var_39_3 = arg_39_0:GetBlackboardValue("groupId")
	local var_39_4 = _.detect(pg.dorm3d_anim_extraitem.get_id_list_by_ship_id[var_39_3] or {}, function(arg_40_0)
		return pg.dorm3d_anim_extraitem[arg_40_0].anim == arg_39_1
	end)
	local var_39_5 = var_39_4 and pg.dorm3d_anim_extraitem[var_39_4]
	local var_39_6

	arg_39_3 = arg_39_3 or DormConst.DEFAULT_ANIM_FADE_IN_TIME

	seriesAsync({
		function(arg_41_0)
			if not var_39_5 or var_39_5.item_prefab == "" then
				arg_41_0()

				return
			end

			local var_41_0 = string.lower("dorm3d/furniture/item/" .. var_39_5.item_prefab)

			arg_39_0:Get("loader"):GetPrefab(var_41_0, "", function(arg_42_0)
				setParent(arg_42_0, arg_39_0.lady)

				if var_39_5.item_shield ~= "" then
					var_39_6 = {}

					for iter_42_0, iter_42_1 in ipairs(var_39_5.item_shield) do
						local var_42_0 = arg_39_0:Get("modelRoot"):Find(iter_42_1)

						if not var_42_0 then
							warning(string.format("dorm3d_anim_extraitem:%d without hide item:%s", var_39_5.id, iter_42_1))
						else
							var_39_6[iter_42_1] = isActive(var_42_0)

							setActive(var_42_0, false)
						end
					end
				end

				function arg_39_0.animExtraItemCallback()
					arg_39_0:Get("loader"):ClearRequest("AnimExtraItem")

					if var_39_6 then
						for iter_43_0, iter_43_1 in pairs(var_39_6) do
							setActive(arg_39_0:Get("modelRoot"):Find(iter_43_0), iter_43_1)
						end
					end
				end

				arg_41_0()
			end, "AnimExtraItem")
		end,
		function(arg_44_0)
			arg_39_0.nowState = arg_39_1
			arg_39_0.stateCallback = arg_44_0

			if IsUnityEditor and not arg_39_0.ladyAnimator:HasState(arg_39_0.ladyAnimBaseLayerIndex, Animator.StringToHash(arg_39_1)) then
				errorMsg("！！！！！！！！动画不存在>>>>>>>>>>>>>", arg_39_1)
			end

			arg_39_0.ladyAnimator:CrossFadeInFixedTime(arg_39_1, arg_39_3, arg_39_0.ladyAnimBaseLayerIndex)
		end,
		function(arg_45_0)
			arg_39_0.nowState = nil
			arg_39_0.stateCallback = nil

			existCall(arg_39_0.animExtraItemCallback)

			arg_39_0.animExtraItemCallback = nil

			arg_45_0()
		end,
		arg_39_2
	})
end

function var_0_0.PlayFaceAnim(arg_46_0, arg_46_1, arg_46_2)
	if IsUnityEditor and not arg_46_0.ladyAnimator:HasState(arg_46_0.ladyAnimFaceLayerIndex, Animator.StringToHash(arg_46_1)) then
		errorMsg("！！！！！！！！动画不存在>>>>>>>>>>>>>", arg_46_1)
	end

	arg_46_0.ladyAnimator:CrossFadeInFixedTime(arg_46_1, 0, arg_46_0.ladyAnimFaceLayerIndex)
	existCall(arg_46_2)
end

function var_0_0.SwitchAnim(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	local var_47_0 = string.find(arg_47_1, "^Face_")

	if tobool(var_47_0) then
		arg_47_0:PlayFaceAnim(arg_47_1, arg_47_2)

		return
	end

	existCall(arg_47_0.animExtraItemCallback)

	arg_47_0.animExtraItemCallback = nil

	local var_47_1 = {}

	table.insert(var_47_1, function(arg_48_0)
		arg_47_0.nowState = arg_47_1
		arg_47_0.stateCallback = arg_48_0

		arg_47_0.ladyAnimator:PlayInFixedTime(arg_47_1, arg_47_0.ladyAnimBaseLayerIndex, arg_47_3 and 0 or -math.huge)
	end)
	table.insert(var_47_1, function(arg_49_0)
		arg_47_0.nowState = nil
		arg_47_0.stateCallback = nil

		arg_49_0()
	end)
	seriesAsync(var_47_1, arg_47_2)
end

function var_0_0.RevertClothComps(arg_50_0)
	table.Foreach(arg_50_0.ladyClothCompSettings, function(arg_51_0, arg_51_1)
		arg_51_0.enabled = arg_51_1.enabled
	end)
	table.Foreach(arg_50_0.ladyClothColliderSettings, function(arg_52_0, arg_52_1)
		arg_52_0.enabled = arg_52_1.enabled

		var_0_0.SetMagicaCollider(arg_52_0, arg_52_1.StartRadius, arg_52_1.EndRadius)
	end)
end

function var_0_0.SetMagicaCollider(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = typeof("MagicaCloth2.MagicaCapsuleCollider")
	local var_53_1 = arg_53_0:GetSize()

	var_53_1.x = arg_53_1
	var_53_1.y = arg_53_2

	arg_53_0:SetSize(var_53_1)
end

function var_0_0.MoveToTarget(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	arg_54_2 = arg_54_2 or DormConst.LADY_MOVE_SPEED
	arg_54_3 = arg_54_3 or DormConst.LADY_ROTATE_SPEED

	local var_54_0 = arg_54_1 - arg_54_0.lady.position

	var_54_0.y = 0

	if var_54_0 ~= Vector3.zero then
		local var_54_1 = Quaternion.LookRotation(var_54_0)

		arg_54_0.lady.rotation = Quaternion.Slerp(arg_54_0.lady.rotation, var_54_1, Time.deltaTime * arg_54_3)
	end

	local var_54_2 = var_54_0.normalized * arg_54_2

	arg_54_0.characterController:Move(var_54_2 * Time.deltaTime)
end

function var_0_0.SetCollisible(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_0.ladyCollider:GetComponent(typeof(UnityEngine.CapsuleCollider))

	if arg_55_1 then
		var_55_0.excludeLayers = LayerMask.GetMask("Nothing")
		arg_55_0.characterController.excludeLayers = LayerMask.GetMask("Nothing")
	else
		var_55_0.excludeLayers = LayerMask.GetMask("Player")
		arg_55_0.characterController.excludeLayers = LayerMask.GetMask("Player")
	end
end

function var_0_0.EnableCharacterTransparency(arg_56_0, arg_56_1)
	arg_56_0.transparencyComp.Enable = arg_56_1
end

function var_0_0.BlockCanWatch(arg_57_0, arg_57_1)
	arg_57_0.blockCanWatch = arg_57_1
end

function var_0_0.SetPosition(arg_58_0, arg_58_1)
	arg_58_0.lady.position = arg_58_1
end

function var_0_0.SetRotation(arg_59_0, arg_59_1)
	arg_59_0.lady.rotation = arg_59_1
end

return var_0_0
