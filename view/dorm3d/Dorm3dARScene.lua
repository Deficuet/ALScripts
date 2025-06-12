local var_0_0 = class("Dorm3dARScene", import("view.base.BaseUI"))
local var_0_1 = "ARScene|common/ar"

var_0_0.AR_FAIL_CODE = {
	[0] = "None",
	"Unsupported",
	"CheckingAvailability",
	"NeedsInstall",
	"Installing",
	[-1] = "pc editor"
}
var_0_0.AR_PASS_CODE = {
	5,
	6,
	7
}

function var_0_0.getUIName(arg_1_0)
	return "Dorm3DARUI"
end

function var_0_0.forceGC(arg_2_0)
	return true
end

function var_0_0.loadingQueue(arg_3_0)
	return function(arg_4_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_5_0)
			return arg_4_0(arg_5_0)
		end)
	end
end

function var_0_0.Ctor(arg_6_0, ...)
	var_0_0.super.Ctor(arg_6_0, ...)

	arg_6_0.loader = AutoLoader.New()
end

function var_0_0.preload(arg_7_0, arg_7_1)
	arg_7_0.room = getProxy(ApartmentProxy):getRoom(arg_7_0.contextData.roomId)

	local var_7_0, var_7_1 = unpack(string.split(var_0_1, "|"))

	seriesAsync({
		function(arg_8_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_7_1 .. "/" .. var_7_0 .. "_scene"), var_7_0, LoadSceneMode.Additive, function(arg_9_0, arg_9_1)
				arg_8_0()
			end)
		end,
		function(arg_10_0)
			arg_7_0:LoadCharacter({
				arg_7_0.contextData.groupId
			}, arg_10_0)
		end
	}, arg_7_1)
end

function var_0_0.LoadCharacter(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.hxMatDict = {}
	arg_11_0.ladyDict = {}
	arg_11_0.skinDict = {}

	local var_11_0 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		local var_11_1 = arg_11_0

		arg_11_0.ladyDict[iter_11_1] = var_11_1

		local var_11_2 = getProxy(ApartmentProxy):getApartment(iter_11_1)
		local var_11_3 = var_11_2:getConfig("asset_name")
		local var_11_4 = var_11_2:GetSkinModelID(arg_11_0.room:getConfig("tag"))
		local var_11_5 = pg.dorm3d_resource[var_11_4].model_id

		assert(var_11_5)

		for iter_11_2, iter_11_3 in ipairs({
			"common",
			var_11_5
		}) do
			local var_11_6 = string.format("dorm3d/character/%s/res/%s", var_11_3, iter_11_3)

			if checkABExist(var_11_6) then
				table.insert(var_11_0, function(arg_12_0)
					arg_11_0.loader:LoadBundle(var_11_6, function(arg_13_0)
						for iter_13_0, iter_13_1 in ipairs(arg_13_0:GetAllAssetNames()) do
							local var_13_0, var_13_1, var_13_2 = string.find(iter_13_1, "material_hx[/\\](.*).mat")

							if var_13_0 then
								arg_11_0.hxMatDict[var_13_2] = {
									arg_13_0,
									iter_13_1
								}
							end
						end

						arg_12_0()
					end)
				end)
			end
		end

		var_11_1.skinId = var_11_4
		var_11_1.skinIdList = {
			var_11_4
		}

		table.insert(var_11_0, function(arg_14_0)
			local var_14_0 = string.format("dorm3d/character/%s/prefabs/%s", var_11_3, var_11_5)

			arg_11_0.loader:GetPrefab(var_14_0, "", function(arg_15_0)
				var_11_1.ladyGameObject = arg_15_0

				setActive(arg_15_0.transform, false)

				arg_11_0.skinDict[var_11_4] = {
					ladyGameObject = arg_15_0
				}

				arg_14_0()
			end)
		end)
	end

	parallelAsync(var_11_0, arg_11_2)
end

function var_0_0.InitCharacter(arg_16_0, arg_16_1)
	arg_16_0.lady = arg_16_0.ladyGameObject.transform

	arg_16_0.lady:SetParent(arg_16_0.mainCameraTF)
	arg_16_0.lady:SetParent(nil)
	setActive(arg_16_0.lady, true)

	arg_16_0.ladyAnimator = arg_16_0.lady:GetComponent(typeof(Animator))
	arg_16_0.ladyAnimBaseLayerIndex = arg_16_0.ladyAnimator:GetLayerIndex("Base Layer")
	arg_16_0.ladyAnimFaceLayerIndex = arg_16_0.ladyAnimator:GetLayerIndex("Face")
	arg_16_0.ladyBoneMaps = {}

	local var_16_0 = arg_16_0.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_16_0, function(arg_17_0, arg_17_1)
		if arg_17_1.name == "BodyCollider" then
			arg_16_0.ladyCollider = arg_17_1
		elseif arg_17_1.name == "Interest" then
			arg_16_0.ladyInterestRoot = arg_17_1
		elseif arg_17_1.name == "Head Center" then
			arg_16_0.ladyHeadCenter = arg_17_1
		end
	end)
	arg_16_0:HXCharacter(arg_16_0.lady)
	arg_16_0.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_18_0)
		if arg_16_0.nowState and arg_18_0.animatorStateInfo:IsName(arg_16_0.nowState) then
			existCall(arg_16_0.stateCallback)

			return
		end

		local var_18_0 = arg_18_0.animatorStateInfo

		for iter_18_0, iter_18_1 in pairs(arg_16_0.animCallbacks) do
			if var_18_0:IsName(iter_18_0) then
				warning("Active", iter_18_0)

				local var_18_1 = table.removebykey(arg_16_0.animCallbacks, iter_18_0)

				existCall(var_18_1)

				return
			end
		end

		if arg_18_0.stringParameter ~= "" then
			arg_16_0:OnAnimationEvent(arg_18_0)
		end
	end)

	arg_16_0.animEventCallbacks = {}
	arg_16_0.animCallbacks = {}
end

function var_0_0.HXCharacter(arg_19_0, arg_19_1)
	if not HXSet.isHx() then
		return
	end

	local var_19_0 = arg_19_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer))

	table.IpairsCArray(var_19_0, function(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_1.sharedMaterials
		local var_20_1 = false

		table.IpairsCArray(var_20_0, function(arg_21_0, arg_21_1)
			local var_21_0 = arg_21_1.name

			if not arg_19_0.hxMatDict[var_21_0] then
				return
			end

			var_20_1 = true

			local var_21_1, var_21_2 = unpack(arg_19_0.hxMatDict[var_21_0])
			local var_21_3 = var_21_1:LoadAssetSync(var_21_2, typeof(Material), false, false)

			var_20_0[arg_21_0] = var_21_3

			warning("Replace HX Material", arg_19_0.hxMatDict[var_21_0][2])
		end)

		if var_20_1 then
			arg_20_1.sharedMaterials = var_20_0
		end
	end)
end

function var_0_0.OnAnimationEvent(arg_22_0, arg_22_1)
	if arg_22_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_22_0 = arg_22_1.stringParameter
	local var_22_1 = table.removebykey(arg_22_0.animEventCallbacks, var_22_0)

	existCall(var_22_1)
end

function var_0_0.init(arg_23_0)
	arg_23_0:findUI()
	arg_23_0:addListener()
end

function var_0_0.PlaySingleAction(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = string.find(arg_24_1, "^Face_")

	if tobool(var_24_0) then
		arg_24_0:PlayFaceAnim(arg_24_1, arg_24_2)

		return
	end

	arg_24_0.animNameMap = arg_24_0.animNameMap or {}
	arg_24_0.animNameMap[arg_24_0.ladyAnimator.StringToHash(arg_24_1)] = arg_24_1

	local var_24_1 = {}

	if not arg_24_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_24_0.ladyAnimBaseLayerIndex):IsName(arg_24_1) then
		table.insert(var_24_1, function(arg_25_0)
			arg_24_0.nowState = arg_24_1
			arg_24_0.stateCallback = arg_25_0

			arg_24_0.ladyAnimator:CrossFadeInFixedTime(arg_24_1, 0.25, arg_24_0.ladyAnimBaseLayerIndex)
		end)
		table.insert(var_24_1, function(arg_26_0)
			arg_24_0.nowState = nil
			arg_24_0.stateCallback = nil

			arg_26_0()
		end)
	end

	seriesAsync(var_24_1, arg_24_2)
end

function var_0_0.SwitchAnim(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = string.find(arg_27_1, "^Face_")

	if tobool(var_27_0) then
		arg_27_0:PlayFaceAnim(arg_27_1, arg_27_2)

		return
	end

	arg_27_0.animNameMap = arg_27_0.animNameMap or {}
	arg_27_0.animNameMap[arg_27_0.ladyAnimator.StringToHash(arg_27_1)] = arg_27_1

	local var_27_1 = {}

	table.insert(var_27_1, function(arg_28_0)
		arg_27_0.nowState = arg_27_1
		arg_27_0.stateCallback = arg_28_0

		arg_27_0.ladyAnimator:PlayInFixedTime(arg_27_1, arg_27_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_27_1, function(arg_29_0)
		arg_27_0.nowState = nil
		arg_27_0.stateCallback = nil

		arg_29_0()
	end)
	seriesAsync(var_27_1, arg_27_2)
end

function var_0_0.PlayFaceAnim(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0.ladyAnimator:CrossFadeInFixedTime(arg_30_1, 0.2, arg_30_0.ladyAnimFaceLayerIndex)
	existCall(arg_30_2)
end

function var_0_0.SetARUIActive(arg_31_0, arg_31_1)
	setActive(arg_31_0.backBtn, arg_31_1)
	setActive(arg_31_0.menuListTF, arg_31_1)
	setActive(arg_31_0.tipTextTF, arg_31_1)
end

function var_0_0.SetARUIActiveWhenInit(arg_32_0, arg_32_1)
	setActive(arg_32_0.resetBtn, arg_32_1)
end

function var_0_0.ResetCharPos(arg_33_0)
	arg_33_0.lady.localPosition = Vector3.zero
	arg_33_0.lady.localRotation = Vector3.zero
end

function var_0_0.didEnter(arg_34_0)
	arg_34_0:emit(Dorm3dARMediator.IN_ITAR_PHOTO)
end

function var_0_0.SetARLite(arg_35_0, arg_35_1)
	arg_35_0.ARState = arg_35_1
	arg_35_0.ARCheck = table.contains(var_0_0.AR_PASS_CODE, arg_35_1)
end

function var_0_0.InitARPlane(arg_36_0)
	arg_36_0._initState = true

	if arg_36_0.lady then
		setActive(arg_36_0.lady, false)
	end

	arg_36_0:SetARUIActiveWhenInit(false)

	if arg_36_0.ARCheck then
		originalPrint("AR CHECK SUCCESS, INIT AR")
		setActive(arg_36_0.snapShot, false)
		arg_36_0.aiHelperSC:Init()
		arg_36_0:emit(Dorm3dARMediator.INIT_AR_PLANE)
	else
		originalPrint("AR CHECK FAIL")
		setActive(arg_36_0.snapShot, true)
		arg_36_0:InitARFinish()
		arg_36_0:EnabledDrag()
	end

	if PLATFORM == PLATFORM_WINDOWSEDITOR then
		arg_36_0:InitARFinish()
	end
end

function var_0_0.Reset(arg_37_0)
	arg_37_0._initState = true

	if arg_37_0.lady then
		setActive(arg_37_0.lady, false)
	end

	arg_37_0:SetARUIActiveWhenInit(false)
	arg_37_0.aiHelperSC:ResetAll()
end

function var_0_0.InitARFinish(arg_38_0)
	setActive(arg_38_0.tipsLabel, false)
	arg_38_0:emit(Dorm3dARMediator.AR_INIT_FINISH)
	arg_38_0:InitCharacter(arg_38_0.contextData.groupId)

	if arg_38_0.ARCheck then
		local var_38_0 = GameObject.Find("Tpl(Clone)").transform

		arg_38_0.lady:SetParent(var_38_0)
	else
		arg_38_0.lady:SetParent(arg_38_0.tpl)
	end

	arg_38_0:ResetCharPos()
	arg_38_0:SetARUIActiveWhenInit(true)

	arg_38_0._initState = false
end

function var_0_0.willExit(arg_39_0)
	arg_39_0.loader:Clear()
	arg_39_0.aiHelperSC:Destroy()

	local var_39_0, var_39_1 = unpack(string.split(var_0_1, "|"))

	SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_39_1 .. "/" .. var_39_0 .. "_scene"), var_39_0)

	if arg_39_0.luHandle then
		LateUpdateBeat:RemoveListener(arg_39_0.luHandle)
	end
end

function var_0_0.findUI(arg_40_0)
	arg_40_0.backBtn = arg_40_0:findTF("BackBtn")
	arg_40_0.menuListTF = arg_40_0:findTF("MenuList")
	arg_40_0.initARBtn = arg_40_0:findTF("InitARBtn", arg_40_0.menuListTF)
	arg_40_0.resetBtn = arg_40_0:findTF("ResetBtn", arg_40_0.menuListTF)
	arg_40_0.tipTextTF = arg_40_0:findTF("TipText")
	arg_40_0.tipsLabel = arg_40_0:findTF("tipsText", arg_40_0.tipTextTF)
	arg_40_0.tipsText = arg_40_0:findTF("tipsText/text", arg_40_0.tipTextTF)

	setActive(arg_40_0.tipsLabel, false)

	arg_40_0.snapShot = GameObject.Find("ARCanvas").transform
	arg_40_0.arCamera = GameObject.Find("Main Camera"):GetComponent("Camera")

	setActive(arg_40_0.snapShot, false)

	arg_40_0.drag = arg_40_0:findTF("drag")

	local var_40_0 = GameObject.Find("ARScriptHandle")

	arg_40_0.aiHelperSC = GetComponent(var_40_0, "ARHelper")
	arg_40_0.aiHelperSC.tplPrefab = GameObject.Find("Tpl")
	arg_40_0.tpl = GameObject.Find("Tpl").transform
end

function var_0_0.addListener(arg_41_0)
	onButton(arg_41_0, arg_41_0.backBtn, function()
		arg_41_0:closeView()
	end, SFX_PANEL)
	onButton(arg_41_0, arg_41_0.resetBtn, function()
		arg_41_0:Reset()
	end, SFX_PANEL)

	function arg_41_0.aiHelperSC.planeCountCB(arg_44_0, arg_44_1)
		local var_44_0 = arg_44_0 > 0

		setActive(arg_41_0.tipsLabel, true)
		arg_41_0.aiHelperSC:ShowAllPlane(true)

		if not var_44_0 then
			setText(arg_41_0.tipsText, i18n("AR_plane_check"))
		elseif not arg_44_1 then
			setText(arg_41_0.tipsText, i18n("AR_plane_long_press_to_summon"))
		elseif arg_41_0._initState then
			arg_41_0:InitARFinish()
		end
	end

	function arg_41_0.aiHelperSC.distanceCB(arg_45_0)
		if arg_45_0 < 0.3 then
			arg_41_0.distanceFlag = true

			setActive(arg_41_0.lady, false)
			setActive(arg_41_0.tipsLabel, true)
			setText(arg_41_0.tipsText, i18n("AR_plane_distance_near"))
		elseif arg_41_0.distanceFlag then
			setActive(arg_41_0.tipsLabel, false)
			setActive(arg_41_0.lady, true)

			arg_41_0.distanceFlag = false
		end
	end

	function arg_41_0.aiHelperSC.insPrefabFailCB()
		warning("距离过近，呼出角色失败")
		pg.TipsMgr.GetInstance():ShowTips(i18n("AR_plane_summon_fail_by_near"))
	end

	function arg_41_0.aiHelperSC.insPrefabSuccCB()
		arg_41_0.aiHelperSC:ShowAllPlane(false)
		pg.TipsMgr.GetInstance():ShowTips(i18n("AR_plane_summon_success"))
		arg_41_0.aiHelperSC:StopPlaneCheck()
	end
end

function var_0_0.EnabledDrag(arg_48_0)
	arg_48_0.lady.localScale = Vector3(5, 5, 5)

	local var_48_0 = LuaHelper.GetWorldCorners(arg_48_0._tf:GetComponent("RectTransform"))
	local var_48_1 = var_48_0[2].x - var_48_0[0].x
	local var_48_2 = var_48_0[2].y - var_48_0[0].y

	arg_48_0.widthRate = var_48_1 / pg.CameraFixMgr.GetInstance().actualWidth
	arg_48_0.heightRate = var_48_2 / pg.CameraFixMgr.GetInstance().actualHeight
	arg_48_0.halfWidth = var_48_1 / 2
	arg_48_0.halfHeight = var_48_2 / 2
	arg_48_0.isEnableDrag = true

	local var_48_3 = arg_48_0.drag.gameObject

	arg_48_0.zoom = GetOrAddComponent(arg_48_0._tf, typeof(PinchZoom))
	arg_48_0.zoom.enabled = true

	local var_48_4 = GetOrAddComponent(var_48_3, typeof(EventTriggerListener))
	local var_48_5 = Vector3(0, 0, 0)

	var_48_4:AddBeginDragFunc(function(arg_49_0, arg_49_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if arg_48_0.zoom.processing then
			return
		end

		setButtonEnabled(var_48_3, false)

		if Input.touchCount > 1 then
			return
		end

		local var_49_0 = var_0_0.Screen2Local(var_48_3.transform.parent, arg_49_1.position)

		var_48_5 = arg_48_0.drag.localPosition - var_49_0
	end)
	var_48_4:AddDragFunc(function(arg_50_0, arg_50_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if arg_48_0.zoom.processing then
			return
		end

		if Input.touchCount > 1 then
			return
		end

		local var_50_0 = var_0_0.Screen2Local(var_48_3.transform.parent, arg_50_1.position)

		arg_48_0.drag.localPosition = Vector3(var_50_0.x, var_50_0.y, 0) + var_48_5
		arg_48_0.tpl.localPosition = arg_48_0:GetUI2Char(arg_50_1.position)
	end)
	var_48_4:AddDragEndFunc(function()
		setButtonEnabled(var_48_3, true)
	end)

	var_48_4.enabled = true
	Input.multiTouchEnabled = true
	arg_48_0.arCamera.orthographicSize = 8
	arg_48_0.arCamera.orthographic = true
	arg_48_0.luHandle = LateUpdateBeat:CreateListener(function()
		if arg_48_0.zoom.processing then
			local var_52_0 = arg_48_0.drag.localScale.x

			arg_48_0.tpl.localScale = Vector3(var_52_0, var_52_0, var_52_0)
		end
	end, arg_48_0)

	LateUpdateBeat:AddListener(arg_48_0.luHandle)
end

function var_0_0.GetUI2Char(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_0.widthRate * arg_53_1.x - arg_53_0.halfWidth
	local var_53_1 = arg_53_0.heightRate * arg_53_1.y - arg_53_0.halfHeight

	return Vector3(var_53_0, var_53_1, 2)
end

function var_0_0.Screen2Local(arg_54_0, arg_54_1)
	local var_54_0 = GameObject.Find("UICamera"):GetComponent("Camera")
	local var_54_1 = arg_54_0:GetComponent("RectTransform")
	local var_54_2 = LuaHelper.ScreenToLocal(var_54_1, arg_54_1, var_54_0)

	return Vector3(var_54_2.x, var_54_2.y, 0)
end

return var_0_0
