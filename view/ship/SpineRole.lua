local var_0_0 = class("SpineRole")

var_0_0.STATE_EMPTY = 0
var_0_0.STATE_LOADING = 1
var_0_0.STATE_INITED = 2
var_0_0.STATE_DISPOSE = 3

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.state = var_0_0.STATE_EMPTY

	if arg_1_1 then
		arg_1_0.ship = arg_1_1
		arg_1_0.prefabName = arg_1_0.ship:getPrefab()
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
			arg_3_0.modelRoot = GameObject.New(arg_3_0.prefabName .. "_root")

			arg_3_0.modelRoot:AddComponent(typeof(RectTransform))

			arg_3_0.model = arg_4_0
			arg_3_0.model.transform.localScale = Vector3.one

			arg_3_0.model.transform:SetParent(arg_3_0.modelRoot.transform, false)

			arg_3_0.model.transform.localPosition = Vector3.zero

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
			arg_5_0.model = arg_6_0
			arg_5_0.model.transform.localScale = Vector3.one
			arg_5_0.model.transform.localPosition = Vector3.zero

			arg_5_0:Init()

			if arg_5_1 then
				arg_5_1()
			end
		end
	end)
end

function var_0_0.Init(arg_7_0)
	arg_7_0.state = var_0_0.STATE_INITED
	arg_7_0._modleGraphic = arg_7_0.model:GetComponent("SkeletonGraphic")
	arg_7_0._modleAnim = arg_7_0.model:GetComponent("SpineAnimUI")
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
			local var_8_5 = ys.Battle.BattleResourceManager.GetOrbitPath(var_8_4)

			ResourceMgr.Inst:getAssetAsync(var_8_5, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_9_0)
				if arg_8_0.state == var_0_0.STATE_DISPOSE then
					-- block empty
				else
					local var_9_0 = var_8_0 .. "_bound"
					local var_9_1 = var_8_2[var_9_0][1]
					local var_9_2 = var_8_2[var_9_0][2]
					local var_9_3 = Object.Instantiate(arg_9_0)
					local var_9_4 = var_9_3:GetComponentsInChildren(typeof(Spine.Unity.SkeletonGraphic)):ToTable()

					for iter_9_0, iter_9_1 in ipairs(var_9_4) do
						iter_9_1.raycastTarget = false
					end

					var_9_3.transform.localPosition = Vector2(var_9_2[1], var_9_2[2])

					local var_9_5 = SpineAnimUI.AddFollower(var_9_1, arg_8_0.model.transform, var_9_3.transform)

					var_9_3.transform.localScale = Vector3.one
					arg_8_0._attachmentList[var_9_5] = {
						p = var_8_4,
						hiddenActionList = var_8_2.orbit_hidden_action,
						index = var_8_3,
						back = var_8_2.orbit_ui_back
					}

					local var_9_6 = var_9_5:GetComponent("Spine.Unity.BoneFollowerGraphic")

					if var_8_2.orbit_rotate then
						var_9_6.followBoneRotation = true

						local var_9_7 = var_9_3.transform.localEulerAngles

						var_9_3.transform.localEulerAngles = Vector3(var_9_7.x, var_9_7.y, var_9_7.z - 90)
					else
						var_9_6.followBoneRotation = false
					end

					if var_8_2.orbit_ui_back == 1 then
						var_9_5:SetParent(arg_8_0.modelRoot.transform, false)
						var_9_5:SetAsFirstSibling()
					else
						var_9_5:SetParent(arg_8_0.modelRoot.transform, false)
						var_9_5:SetAsLastSibling()
					end

					SetActive(var_9_5, arg_8_0._visible)
					arg_8_0:sortAttachmentGO()
				end
			end), true, true)
		end
	end
end

function var_0_0.sortAttachmentGO(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0._attachmentList) do
		table.insert(var_10_0, {
			tf = iter_10_0,
			index = iter_10_1.index,
			back = iter_10_1.back,
			p = iter_10_1.p
		})
	end

	table.sort(var_10_0, function(arg_11_0, arg_11_1)
		return arg_11_0.index < arg_11_1.index
	end)

	for iter_10_2, iter_10_3 in ipairs(var_10_0) do
		if iter_10_3.back ~= 1 then
			iter_10_3.tf:SetAsLastSibling()

			break
		end
	end
end

function var_0_0.GetAttachmentList(arg_12_0)
	if arg_12_0.ship then
		return arg_12_0.ship:getAttachmentPrefab()
	else
		return arg_12_0.attachmentData or {}
	end
end

function var_0_0.CheckInited(arg_13_0)
	return arg_13_0.state == var_0_0.STATE_INITED
end

function var_0_0.GetName(arg_14_0)
	return arg_14_0.modelRoot.name
end

function var_0_0.SetParent(arg_15_0, arg_15_1)
	if arg_15_0:CheckInited() then
		SetParent(arg_15_0.modelRoot, arg_15_1, false)
	end
end

function var_0_0.SetRaycastTarget(arg_16_0, arg_16_1)
	if arg_16_0:CheckInited() then
		arg_16_0._modleGraphic.raycastTarget = arg_16_1
	end
end

function var_0_0.ModifyName(arg_17_0, arg_17_1)
	if arg_17_0:CheckInited() then
		arg_17_0.modelRoot.name = arg_17_1
	end
end

function var_0_0.SetVisible(arg_18_0, arg_18_1)
	if arg_18_0:CheckInited() then
		arg_18_0._visible = arg_18_1
		arg_18_0._modleGraphic.color = Color.New(1, 1, 1, arg_18_1 and 1 or 0)

		for iter_18_0, iter_18_1 in pairs(arg_18_0._attachmentList) do
			SetActive(iter_18_0, arg_18_1)
		end
	end
end

function var_0_0.SetAction(arg_19_0, arg_19_1)
	if not arg_19_0:CheckInited() then
		return
	end

	arg_19_0._modleAnim:SetAction(arg_19_1, 0)
	arg_19_0:HiddenAttachmentByAction(arg_19_1)
end

function var_0_0.SetActionOnce(arg_20_0, arg_20_1)
	if not arg_20_0:CheckInited() then
		return
	end

	arg_20_0._modleGraphic.AnimationState:SetAnimation(0, arg_20_1, false)
	arg_20_0:HiddenAttachmentByAction(arg_20_1)
end

function var_0_0.SetActionCallBack(arg_21_0, arg_21_1)
	if not arg_21_0:CheckInited() then
		return
	end

	arg_21_0._modleAnim:SetActionCallBack(arg_21_1)
end

function var_0_0.HiddenAttachmentByAction(arg_22_0, arg_22_1)
	for iter_22_0, iter_22_1 in pairs(arg_22_0._attachmentList) do
		SetActive(iter_22_0, not table.contains(iter_22_1.hiddenActionList, arg_22_1))
	end
end

function var_0_0.SetSizeDelta(arg_23_0, arg_23_1)
	if arg_23_0:CheckInited() then
		rtf(arg_23_0.modelRoot).sizeDelta = arg_23_1
	end
end

function var_0_0.SetLocalScale(arg_24_0, arg_24_1)
	if arg_24_0:CheckInited() then
		arg_24_0.modelRoot.transform.localScale = arg_24_1
	end
end

function var_0_0.SetLocalPos(arg_25_0, arg_25_1)
	if arg_25_0:CheckInited() then
		arg_25_0.modelRoot.transform.localPosition = arg_25_1
	end
end

function var_0_0.SetLayer(arg_26_0, arg_26_1)
	if arg_26_0:CheckInited() then
		pg.ViewUtils.SetLayer(arg_26_0.modelRoot.transform, arg_26_1)
	end
end

function var_0_0.TweenShining(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4, arg_27_5, arg_27_6, arg_27_7, arg_27_8, arg_27_9, arg_27_10)
	if arg_27_0:CheckInited() then
		arg_27_0:StopTweenShining()

		local var_27_0 = arg_27_0._modleGraphic.material
		local var_27_1 = LeanTween.value(arg_27_0.modelRoot, arg_27_3, arg_27_4, arg_27_1):setEase(LeanTweenType.easeInOutSine):setOnUpdate(System.Action_float(function(arg_28_0)
			if arg_27_7 then
				var_27_0:SetColor("_Color", Color.Lerp(arg_27_5, arg_27_6, arg_28_0))
			else
				arg_27_0._modleGraphic.color = Color.Lerp(arg_27_5, arg_27_6, arg_28_0)
			end

			existCall(arg_27_9, arg_28_0)
		end)):setOnComplete(System.Action(function()
			arg_27_0._tweenShiningId = nil

			if arg_27_8 then
				if arg_27_7 then
					var_27_0:SetColor("_Color", arg_27_5)
				else
					arg_27_0._modleGraphic.color = arg_27_5
				end
			end

			existCall(arg_27_10)
		end))

		if arg_27_2 then
			var_27_1:setLoopPingPong(arg_27_2)
		end

		arg_27_0._tweenShiningId = var_27_1.uniqueId
	end
end

function var_0_0.StopTweenShining(arg_30_0)
	if arg_30_0:CheckInited() and arg_30_0._tweenShiningId then
		LeanTween.cancel(arg_30_0._tweenShiningId, true)

		arg_30_0._tweenShiningId = nil
	end
end

function var_0_0.ChangeMaterial(arg_31_0, arg_31_1)
	if not arg_31_0:CheckInited() then
		return
	end

	if not arg_31_0._stageMaterial then
		arg_31_0._stageMaterial = arg_31_0._modleGraphic.material
	end

	arg_31_0._modleGraphic.material = arg_31_1
end

function var_0_0.RevertMaterial(arg_32_0)
	if not arg_32_0:CheckInited() then
		return
	end

	if not arg_32_0._stageMaterial then
		return
	end

	arg_32_0._modleGraphic.material = arg_32_0._stageMaterial
end

function var_0_0.CreateInterface(arg_33_0)
	arg_33_0._mouseChild = GameObject("mouseChild")

	arg_33_0._mouseChild.transform:SetParent(arg_33_0.modelRoot.transform, false)

	arg_33_0._mouseChild.transform.localPosition = Vector3.zero
	arg_33_0._modelClick = GetOrAddComponent(arg_33_0._mouseChild, "ModelDrag")
	arg_33_0._modelPress = GetOrAddComponent(arg_33_0._mouseChild, "UILongPressTrigger")
	arg_33_0._dragDelegate = GetOrAddComponent(arg_33_0._mouseChild, "EventTriggerListener")

	arg_33_0._modelClick:Init()

	local var_33_0 = GetOrAddComponent(arg_33_0._mouseChild, typeof(RectTransform))

	var_33_0.pivot = Vector2(0.5, 0)
	var_33_0.anchoredPosition = Vector2(0, 0)
	var_33_0.localScale = Vector2(100, 100)
	var_33_0.sizeDelta = Vector2(3, 3)

	return arg_33_0._modelClick, arg_33_0._modelPress, arg_33_0._dragDelegate
end

function var_0_0.resumeRole(arg_34_0)
	if arg_34_0._modleAnim and arg_34_0._modleAnim:GetAnimationState() then
		arg_34_0._modleAnim:Resume()
	end
end

function var_0_0.GetInterface(arg_35_0)
	return arg_35_0._modelClick, arg_35_0._modelPress, arg_35_0._dragDelegate
end

function var_0_0.EnableInterface(arg_36_0)
	arg_36_0._mouseChild:GetComponent(typeof(Image)).enabled = true
end

function var_0_0.DisableInterface(arg_37_0)
	arg_37_0._mouseChild:GetComponent(typeof(Image)).enabled = false
end

function var_0_0.Dispose(arg_38_0)
	if arg_38_0.state == var_0_0.STATE_INITED then
		arg_38_0:StopTweenShining()
		arg_38_0:RevertMaterial()
		PoolMgr.GetInstance():ReturnSpineChar(arg_38_0.prefabName, arg_38_0.model)
		arg_38_0:SetVisible(true)
		arg_38_0._modleGraphic.material:SetColor("_Color", Color.New(0, 0, 0, 0))

		arg_38_0._modleGraphic.color = Color.New(1, 1, 1, 1)

		for iter_38_0, iter_38_1 in pairs(arg_38_0._attachmentList) do
			Object.Destroy(iter_38_0.gameObject)
		end

		arg_38_0.model = nil
		arg_38_0.prefabName = nil
		arg_38_0.ship = nil
		arg_38_0.attachmentData = nil
		arg_38_0._modleGraphic = nil
		arg_38_0._modleAnim = nil
		arg_38_0._attachmentList = nil
	end

	arg_38_0.state = var_0_0.STATE_DISPOSE
end

return var_0_0
