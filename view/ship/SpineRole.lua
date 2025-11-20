local var_0_0 = class("SpineRole")

var_0_0.STATE_EMPTY = 0
var_0_0.STATE_LOADING = 1
var_0_0.STATE_INITED = 2
var_0_0.STATE_DISPOSE = 3

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.state = var_0_0.STATE_EMPTY

	if arg_1_1 then
		arg_1_0.ship = arg_1_1
		arg_1_0.prefabName = arg_1_0.ship:getPrefab(arg_1_2)
	end
end

function var_0_0.SetData(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.prefabName = arg_2_1
	arg_2_0.attachmentData = arg_2_2
end

var_0_0.ORBIT_KEY_UI = "orbit_ui"
var_0_0.ORBIT_KEY_SLG = "orbit_slg"

function var_0_0.Load(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_2 == nil then
		arg_3_2 = true
	end

	PoolMgr.GetInstance():GetSpineChar(arg_3_0.prefabName, arg_3_2, function(arg_4_0)
		assert(arg_4_0, "没有这个角色的模型  " .. arg_3_0.prefabName)

		if arg_3_0.state == var_0_0.STATE_DISPOSE then
			PoolMgr.GetInstance():ReturnSpineChar(arg_3_0.prefabName, arg_4_0)
		else
			arg_3_0._modelRoot = GameObject.New(arg_3_0.prefabName .. "_root")

			arg_3_0._modelRoot:AddComponent(typeof(RectTransform))

			arg_3_0._model = arg_4_0
			arg_3_0._model.transform.localScale = Vector3.one
			arg_3_0._modelScale = Vector3.one

			arg_3_0._model.transform:SetParent(arg_3_0._modelRoot.transform, false)

			arg_3_0._model.transform.localPosition = Vector3.zero

			arg_3_0:Init()

			if arg_3_1 then
				arg_3_1()
			end

			arg_3_0:AttachOrbit(arg_3_3)
			arg_3_0:sortAttachmentGO()
		end
	end)
end

function var_0_0.LoadLite(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_2 == nil then
		arg_5_2 = true
	end

	PoolMgr.GetInstance():GetSpineChar(arg_5_0.prefabName, arg_5_2, function(arg_6_0)
		assert(arg_6_0, "没有这个角色的模型  " .. arg_5_0.prefabName)

		if arg_5_0.state == var_0_0.STATE_DISPOSE then
			PoolMgr.GetInstance():ReturnSpineChar(arg_5_0.prefabName, arg_6_0)
		else
			arg_5_0._modelRoot = arg_6_0
			arg_5_0._model = arg_6_0
			arg_5_0._model.transform.localScale = Vector3.one
			arg_5_0._modelScale = Vector3.one
			arg_5_0._model.transform.localPosition = Vector3.zero

			arg_5_0:Init()

			if arg_5_1 then
				arg_5_1()
			end
		end
	end)
end

function var_0_0.Init(arg_7_0)
	arg_7_0.state = var_0_0.STATE_INITED
	arg_7_0._modleGraphic = arg_7_0._model:GetComponent("SkeletonGraphic")
	arg_7_0._modleAnim = arg_7_0._model:GetComponent("SpineAnimUI")
	arg_7_0._attachmentList = {}
	arg_7_0._visible = true
end

function var_0_0.AttachOrbit(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1 or var_0_0.ORBIT_KEY_UI
	local var_8_1 = arg_8_0:GetAttachmentList()

	for iter_8_0, iter_8_1 in pairs(var_8_1) do
		local var_8_2 = iter_8_1.config
		local var_8_3 = iter_8_1.index
		local var_8_4 = var_8_2[var_8_0]

		if var_8_0 ~= var_0_0.ORBIT_KEY_UI and var_8_4 == "" then
			var_8_4 = var_8_2.orbit_ui
			var_8_0 = var_0_0.ORBIT_KEY_UI
		end

		if var_8_4 ~= "" then
			local var_8_5 = var_8_2.orbit_ui_bound[1]
			local var_8_6 = arg_8_0._modleGraphic.Skeleton:FindBoneIndex("char1_" .. var_8_5)
			local var_8_7 = arg_8_0._modleGraphic.Skeleton:FindBoneIndex("char2_" .. var_8_5)
			local var_8_8 = var_8_2.double_char_bone
			local var_8_9 = ys.Battle.BattleResourceManager.GetOrbitPath(var_8_4)

			if var_8_6 >= 0 or var_8_7 > 0 then
				if var_8_7 >= 0 and var_8_8 and #var_8_8 > 0 and var_8_8[1] == 1 then
					arg_8_0:loadOrbitUI(var_8_9, var_8_0, var_8_4, "char2" .. "_" .. var_8_5, var_8_3, var_8_2)
				end

				if var_8_8 and #var_8_8 > 0 and var_8_8[2] == 1 then
					arg_8_0:loadOrbitUI(var_8_9, var_8_0, var_8_4, var_8_5, var_8_3, var_8_2)
				end

				if var_8_6 >= 0 and var_8_8 and #var_8_8 > 0 and var_8_8[3] == 1 then
					arg_8_0:loadOrbitUI(var_8_9, var_8_0, var_8_4, "char1" .. "_" .. var_8_5, var_8_3, var_8_2)
				end
			else
				arg_8_0:loadOrbitUI(var_8_9, var_8_0, var_8_4, var_8_5, var_8_3, var_8_2)
			end
		end
	end
end

function var_0_0.loadOrbitUI(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6)
	ResourceMgr.Inst:getAssetAsync(arg_9_1, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_10_0)
		if arg_9_0.state == var_0_0.STATE_DISPOSE then
			-- block empty
		else
			local var_10_0 = arg_9_2 .. "_bound"
			local var_10_1 = arg_9_6[var_10_0][1]
			local var_10_2 = arg_9_6[var_10_0][2]
			local var_10_3 = Object.Instantiate(arg_10_0)
			local var_10_4 = var_10_3:GetComponentsInChildren(typeof(Spine.Unity.SkeletonGraphic)):ToTable()

			for iter_10_0, iter_10_1 in ipairs(var_10_4) do
				iter_10_1.raycastTarget = false
			end

			var_10_3.transform.localPosition = Vector2(var_10_2[1], var_10_2[2])
			var_10_3.transform.localScale = Vector3.one

			local var_10_5 = SpineAnimUI.AddFollower(arg_9_4, arg_9_0._model.transform, var_10_3.transform)

			arg_9_0._attachmentList[var_10_5] = {
				p = arg_9_3,
				hiddenActionList = arg_9_6.orbit_hidden_action,
				index = arg_9_5,
				back = arg_9_6.orbit_ui_back
			}

			local var_10_6 = var_10_5:GetComponent("Spine.Unity.BoneFollowerGraphic")

			if arg_9_6.orbit_rotate then
				var_10_6.followBoneRotation = true

				local var_10_7 = var_10_3.transform.localEulerAngles

				var_10_3.transform.localEulerAngles = Vector3(var_10_7.x, var_10_7.y, var_10_7.z - 90)
			else
				var_10_6.followBoneRotation = false
			end

			if arg_9_6.orbit_ui_back == 1 then
				var_10_5:SetParent(arg_9_0._modelRoot.transform, false)
				var_10_5:SetAsFirstSibling()
			else
				var_10_5:SetParent(arg_9_0._modelRoot.transform, false)
				var_10_5:SetAsLastSibling()
			end

			SetActive(var_10_5, arg_9_0._visible)
			arg_9_0:sortAttachmentGO()
		end
	end), true, true)
end

function var_0_0.sortAttachmentGO(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0._attachmentList) do
		table.insert(var_11_0, {
			tf = iter_11_0,
			index = iter_11_1.index,
			back = iter_11_1.back,
			p = iter_11_1.p
		})
	end

	table.sort(var_11_0, function(arg_12_0, arg_12_1)
		return arg_12_0.index < arg_12_1.index
	end)

	for iter_11_2, iter_11_3 in ipairs(var_11_0) do
		if iter_11_3.back ~= 1 then
			iter_11_3.tf:SetAsLastSibling()

			break
		end
	end
end

function var_0_0.GetAttachmentList(arg_13_0)
	if arg_13_0.ship then
		return arg_13_0.ship:getAttachmentPrefab()
	else
		return arg_13_0.attachmentData or {}
	end
end

function var_0_0.CheckInited(arg_14_0)
	return arg_14_0.state == var_0_0.STATE_INITED
end

function var_0_0.GetName(arg_15_0)
	if arg_15_0:CheckInited() then
		return arg_15_0._modelRoot.name
	end
end

function var_0_0.SetName(arg_16_0, arg_16_1)
	if arg_16_0:CheckInited() then
		arg_16_0._modelRoot.name = arg_16_1
	end
end

function var_0_0.GetRoleModel(arg_17_0)
	if arg_17_0:CheckInited() then
		return arg_17_0._model
	end

	return nil
end

function var_0_0.GetRootModel(arg_18_0)
	if arg_18_0:CheckInited() then
		return arg_18_0._modelRoot
	end

	return nil
end

function var_0_0.GetSpineAnimUI(arg_19_0)
	if arg_19_0:CheckInited() then
		return arg_19_0._modleAnim
	end

	return nil
end

function var_0_0.SetSiblingIndex(arg_20_0, arg_20_1)
	if arg_20_0:CheckInited() then
		arg_20_0._modelRoot.transform:SetSiblingIndex(arg_20_1)
	end
end

function var_0_0.SetParent(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0:CheckInited() then
		SetParent(tf(arg_21_0._modelRoot), tf(arg_21_1), arg_21_2 and true or false)
	end
end

function var_0_0.SetRaycastTarget(arg_22_0, arg_22_1)
	if arg_22_0:CheckInited() then
		arg_22_0._modleGraphic.raycastTarget = arg_22_1
	end
end

function var_0_0.GetSkeletonGraphic(arg_23_0)
	if arg_23_0:CheckInited() then
		return arg_23_0._modleGraphic
	end
end

function var_0_0.ModifyName(arg_24_0, arg_24_1)
	if arg_24_0:CheckInited() then
		arg_24_0._modelRoot.name = arg_24_1
	end
end

function var_0_0.SetVisible(arg_25_0, arg_25_1)
	if arg_25_0:CheckInited() then
		arg_25_0._visible = arg_25_1
		arg_25_0._modleGraphic.color = Color.New(1, 1, 1, arg_25_1 and 1 or 0)

		for iter_25_0, iter_25_1 in pairs(arg_25_0._attachmentList) do
			SetActive(iter_25_0, arg_25_1)
		end
	end
end

function var_0_0.SetAnchoredPosition3D(arg_26_0, arg_26_1)
	if arg_26_0:CheckInited() then
		arg_26_0._modelRoot.transform.anchoredPosition3D = arg_26_1
	end
end

function var_0_0.SetAction(arg_27_0, arg_27_1)
	if not arg_27_0:CheckInited() then
		return
	end

	local var_27_0 = math.sign(arg_27_0._modelRoot.transform.localScale.x)
	local var_27_1, var_27_2 = SpineAnimUtil.GetCharAnimationDirect(arg_27_0._modleGraphic, var_27_0, arg_27_1)

	if var_27_2 then
		arg_27_0._model.transform.localScale = Vector3(var_27_0, arg_27_0._modelScale.y, arg_27_0._modelScale.z)
	else
		arg_27_0._model.transform.localScale = arg_27_0._modelScale
	end

	print("root朝向 =" .. var_27_0 .. "，model朝向 =" .. var_27_0 .. "播放动作:" .. var_27_1)
	arg_27_0._modleAnim:SetAction(var_27_1, 0)

	arg_27_0._action = arg_27_1

	arg_27_0:HiddenAttachmentByAction(arg_27_1)
end

function var_0_0.SetActionOnce(arg_28_0, arg_28_1)
	if not arg_28_0:CheckInited() then
		return
	end

	arg_28_0._modleGraphic.AnimationState:SetAnimation(0, arg_28_1, false)
	arg_28_0:HiddenAttachmentByAction(arg_28_1)
end

function var_0_0.SetActionCallBack(arg_29_0, arg_29_1)
	if not arg_29_0:CheckInited() then
		return
	end

	arg_29_0._modleAnim:SetActionCallBack(arg_29_1)
end

function var_0_0.HiddenAttachmentByAction(arg_30_0, arg_30_1)
	for iter_30_0, iter_30_1 in pairs(arg_30_0._attachmentList) do
		SetActive(iter_30_0, not table.contains(iter_30_1.hiddenActionList, arg_30_1))
	end
end

function var_0_0.SetSizeDelta(arg_31_0, arg_31_1)
	if arg_31_0:CheckInited() then
		rtf(arg_31_0._modelRoot).sizeDelta = arg_31_1
	end
end

function var_0_0.SetLocalScale(arg_32_0, arg_32_1)
	if arg_32_0:CheckInited() then
		arg_32_0._modelRoot.transform.localScale = arg_32_1

		if arg_32_0._action then
			arg_32_0:SetAction(arg_32_0._action)
		end
	end
end

function var_0_0.GetLocalScale(arg_33_0)
	if arg_33_0:CheckInited() then
		return arg_33_0._modelRoot.transform.localScale
	end
end

function var_0_0.SetLocalPosition(arg_34_0, arg_34_1)
	if arg_34_0:CheckInited() then
		arg_34_0._modelRoot.transform.localPosition = arg_34_1
	end
end

function var_0_0.SetAsFirstSibling(arg_35_0)
	if arg_35_0:CheckInited() then
		arg_35_0._modelRoot.transform:SetAsFirstSibling()
	end
end

function var_0_0.SetLayer(arg_36_0, arg_36_1)
	if arg_36_0:CheckInited() then
		pg.ViewUtils.SetLayer(arg_36_0._modelRoot.transform, arg_36_1)
	end
end

function var_0_0.TweenShining(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4, arg_37_5, arg_37_6, arg_37_7, arg_37_8, arg_37_9, arg_37_10)
	if arg_37_0:CheckInited() then
		arg_37_0:StopTweenShining()

		local var_37_0 = arg_37_0._modleGraphic.material
		local var_37_1 = LeanTween.value(arg_37_0._modelRoot, arg_37_3, arg_37_4, arg_37_1):setEase(LeanTweenType.easeInOutSine):setOnUpdate(System.Action_float(function(arg_38_0)
			if arg_37_7 then
				var_37_0:SetColor("_Color", Color.Lerp(arg_37_5, arg_37_6, arg_38_0))
			else
				arg_37_0._modleGraphic.color = Color.Lerp(arg_37_5, arg_37_6, arg_38_0)
			end

			existCall(arg_37_9, arg_38_0)
		end)):setOnComplete(System.Action(function()
			arg_37_0._tweenShiningId = nil

			if arg_37_8 then
				if arg_37_7 then
					var_37_0:SetColor("_Color", arg_37_5)
				else
					arg_37_0._modleGraphic.color = arg_37_5
				end
			end

			existCall(arg_37_10)
		end))

		if arg_37_2 then
			var_37_1:setLoopPingPong(arg_37_2)
		end

		arg_37_0._tweenShiningId = var_37_1.uniqueId
	end
end

function var_0_0.StopTweenShining(arg_40_0)
	if arg_40_0:CheckInited() and arg_40_0._tweenShiningId then
		LeanTween.cancel(arg_40_0._tweenShiningId, true)

		arg_40_0._tweenShiningId = nil
	end
end

function var_0_0.ChangeMaterial(arg_41_0, arg_41_1)
	if not arg_41_0:CheckInited() then
		return
	end

	if not arg_41_0._stageMaterial then
		arg_41_0._stageMaterial = arg_41_0._modleGraphic.material
	end

	arg_41_0._modleGraphic.material = arg_41_1
end

function var_0_0.RevertMaterial(arg_42_0)
	if not arg_42_0:CheckInited() then
		return
	end

	if not arg_42_0._stageMaterial then
		return
	end

	arg_42_0._modleGraphic.material = arg_42_0._stageMaterial
end

function var_0_0.CreateInterface(arg_43_0)
	arg_43_0._mouseChild = GameObject("mouseChild")

	arg_43_0._mouseChild.transform:SetParent(arg_43_0._modelRoot.transform, false)

	arg_43_0._mouseChild.transform.localPosition = Vector3.zero
	arg_43_0._modelClick = GetOrAddComponent(arg_43_0._mouseChild, "ModelDrag")
	arg_43_0._modelPress = GetOrAddComponent(arg_43_0._mouseChild, "UILongPressTrigger")
	arg_43_0._dragDelegate = GetOrAddComponent(arg_43_0._mouseChild, "EventTriggerListener")

	arg_43_0._modelClick:Init()

	local var_43_0 = GetOrAddComponent(arg_43_0._mouseChild, typeof(RectTransform))

	var_43_0.pivot = Vector2(0.5, 0)
	var_43_0.anchoredPosition = Vector2(0, 0)
	var_43_0.localScale = Vector2(100, 100)
	var_43_0.sizeDelta = Vector2(3, 3)

	return arg_43_0._modelClick, arg_43_0._modelPress, arg_43_0._dragDelegate
end

function var_0_0.resumeRole(arg_44_0)
	if arg_44_0._modleAnim and arg_44_0._modleAnim:GetAnimationState() then
		arg_44_0._modleAnim:Resume()
	end
end

function var_0_0.GetInterface(arg_45_0)
	return arg_45_0._modelClick, arg_45_0._modelPress, arg_45_0._dragDelegate
end

function var_0_0.EnableInterface(arg_46_0)
	arg_46_0._mouseChild:GetComponent(typeof(Image)).enabled = true
end

function var_0_0.DisableInterface(arg_47_0)
	arg_47_0._mouseChild:GetComponent(typeof(Image)).enabled = false
end

function var_0_0.Dispose(arg_48_0)
	if arg_48_0.state == var_0_0.STATE_INITED then
		arg_48_0:StopTweenShining()
		arg_48_0:RevertMaterial()
		PoolMgr.GetInstance():ReturnSpineChar(arg_48_0.prefabName, arg_48_0._model)
		arg_48_0:SetVisible(true)
		arg_48_0._modleGraphic.material:SetColor("_Color", Color.New(0, 0, 0, 0))

		arg_48_0._modleGraphic.color = Color.New(1, 1, 1, 1)

		for iter_48_0, iter_48_1 in pairs(arg_48_0._attachmentList) do
			Object.Destroy(iter_48_0.gameObject)
		end

		arg_48_0._model = nil
		arg_48_0.prefabName = nil
		arg_48_0.ship = nil
		arg_48_0.attachmentData = nil
		arg_48_0._modleGraphic = nil
		arg_48_0._modleAnim = nil
		arg_48_0._attachmentList = nil
	end

	arg_48_0.state = var_0_0.STATE_DISPOSE
end

return var_0_0
