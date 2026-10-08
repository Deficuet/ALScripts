local var_0_0 = class("Dorm3dARScene", import("view.base.BaseUI"))
local var_0_1 = "ARScene2|common/ar"

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

function var_0_0.getResource(arg_2_0)
	local var_2_0 = var_0_0.super.getResource(arg_2_0)
	local var_2_1, var_2_2 = unpack(string.split(var_0_1, "|"))

	table.insert(var_2_0, string.lower("dorm3d/scenesres/scenes/" .. var_2_2 .. "/" .. var_2_1 .. "_scene"))
	table.insert(var_2_0, string.lower(string.format("ui/dorm3dloading")))
	table.insert(var_2_0, string.lower(string.format("dorm3dholylight/eff_smoke_114")))

	local var_2_3 = getProxy(ApartmentProxy):getRoom(arg_2_0.contextData.roomId)
	local var_2_4 = getProxy(ApartmentProxy):getApartment(arg_2_0.contextData.groupId)
	local var_2_5 = var_2_4:getConfig("asset_name")
	local var_2_6 = var_2_4:GetSkinModelID(var_2_3:getConfig("tag"))
	local var_2_7 = pg.dorm3d_resource[var_2_6].model_id

	assert(var_2_7)

	for iter_2_0, iter_2_1 in ipairs(Dorm3dHxHelper.GetMaterialResources(arg_2_0.contextData.groupId)) do
		table.insert(var_2_0, iter_2_1)
	end

	table.insert(var_2_0, string.lower(string.format("dorm3d/character/%s/prefabs/%s", var_2_5, var_2_7)))

	return var_2_0
end

function var_0_0.forceGC(arg_3_0)
	return true
end

function var_0_0.loadingQueue(arg_4_0)
	return function(arg_5_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_6_0)
			return arg_5_0(arg_6_0)
		end)
	end
end

function var_0_0.Ctor(arg_7_0, ...)
	var_0_0.super.Ctor(arg_7_0, ...)

	arg_7_0.loader = AutoLoader.New()
	arg_7_0.hxHelper = Dorm3dHxHelper.New(arg_7_0.loader)
end

function var_0_0.preload(arg_8_0, arg_8_1)
	arg_8_0.room = getProxy(ApartmentProxy):getRoom(arg_8_0.contextData.roomId)

	local var_8_0, var_8_1 = unpack(string.split(var_0_1, "|"))

	seriesAsync({
		function(arg_9_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_8_1 .. "/" .. var_8_0 .. "_scene"), var_8_0, LoadSceneMode.Additive, function(arg_10_0, arg_10_1)
				arg_9_0()
			end)
		end,
		function(arg_11_0)
			arg_8_0:LoadCharacter({
				arg_8_0.contextData.groupId
			}, arg_11_0)
		end,
		function(arg_12_0)
			local var_12_0 = GameObject.Find("FakeAR/Main Camera")
			local var_12_1 = GameObject.Find("AR/XR Origin/Camera Offset/Main Camera")

			if var_12_0 then
				originalPrint("Fix Fake AR Camera Data")
				HotfixHelper.FixARCameraData(var_12_0)
			end

			if var_12_1 then
				originalPrint("Fix True AR Camera Data")
				HotfixHelper.FixARCameraData(var_12_1)
			end

			arg_12_0()
		end
	}, arg_8_1)
end

function var_0_0.LoadCharacter(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.ladyDict = {}
	arg_13_0.skinDict = {}

	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_1) do
		local var_13_1 = arg_13_0

		arg_13_0.ladyDict[iter_13_1] = var_13_1

		local var_13_2 = getProxy(ApartmentProxy):getApartment(iter_13_1)
		local var_13_3 = var_13_2:getConfig("asset_name")
		local var_13_4 = var_13_2:GetSkinModelID(arg_13_0.room:getConfig("tag"))
		local var_13_5 = pg.dorm3d_resource[var_13_4].model_id

		assert(var_13_5)
		table.insert(var_13_0, function(arg_14_0)
			arg_13_0.hxHelper:LoadMaterials(iter_13_1, arg_14_0)
		end)

		var_13_1.skinId = var_13_4
		var_13_1.skinIdList = {
			var_13_4
		}

		table.insert(var_13_0, function(arg_15_0)
			local var_15_0 = string.format("dorm3d/character/%s/prefabs/%s", var_13_3, var_13_5)

			arg_13_0.loader:GetPrefab(var_15_0, "", function(arg_16_0)
				var_13_1.ladyGameObject = arg_16_0

				setActive(arg_16_0.transform, false)

				arg_13_0.skinDict[var_13_4] = {
					ladyGameObject = arg_16_0
				}

				arg_15_0()
			end)
		end)
	end

	parallelAsync(var_13_0, arg_13_2)
end

function var_0_0.InitCharacter(arg_17_0, arg_17_1)
	arg_17_0.lady = arg_17_0.ladyGameObject.transform

	arg_17_0.lady:SetParent(arg_17_0.mainCameraTF)
	arg_17_0.lady:SetParent(nil)
	setActive(arg_17_0.lady, true)

	arg_17_0.ladyAnimator = arg_17_0.lady:GetComponent(typeof(Animator))
	arg_17_0.ladyAnimBaseLayerIndex = arg_17_0.ladyAnimator:GetLayerIndex("Base Layer")
	arg_17_0.ladyAnimFaceLayerIndex = arg_17_0.ladyAnimator:GetLayerIndex("Face")
	arg_17_0.ladyBoneMaps = {}

	local var_17_0 = arg_17_0.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_17_0, function(arg_18_0, arg_18_1)
		if arg_18_1.name == "BodyCollider" then
			arg_17_0.ladyCollider = arg_18_1
		elseif arg_18_1.name == "Interest" then
			arg_17_0.ladyInterestRoot = arg_18_1
		elseif arg_18_1.name == "Head Center" then
			arg_17_0.ladyHeadCenter = arg_18_1
		end
	end)
	arg_17_0:HXCharacter(arg_17_0.lady, arg_17_0.skinId)
	arg_17_0.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_19_0)
		if arg_17_0.nowState and arg_19_0.animatorStateInfo:IsName(arg_17_0.nowState) then
			existCall(arg_17_0.stateCallback)

			return
		end

		local var_19_0 = arg_19_0.animatorStateInfo

		for iter_19_0, iter_19_1 in pairs(arg_17_0.animCallbacks) do
			if var_19_0:IsName(iter_19_0) then
				warning("Active", iter_19_0)

				local var_19_1 = table.removebykey(arg_17_0.animCallbacks, iter_19_0)

				existCall(var_19_1)

				return
			end
		end

		if arg_19_0.stringParameter ~= "" then
			arg_17_0:OnAnimationEvent(arg_19_0)
		end
	end)

	arg_17_0.animEventCallbacks = {}
	arg_17_0.animCallbacks = {}
end

function var_0_0.HXCharacter(arg_20_0, arg_20_1, arg_20_2)
	if not HXSet.isHx() then
		return
	end

	Dorm3dHxHelper.ShowHolyLight({
		arg_20_1
	}, arg_20_0.holyLightRoot)
	arg_20_0.hxHelper:Apply(arg_20_1, arg_20_2)
end

function var_0_0.OnAnimationEvent(arg_21_0, arg_21_1)
	if arg_21_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_21_0 = arg_21_1.stringParameter
	local var_21_1 = table.removebykey(arg_21_0.animEventCallbacks, var_21_0)

	existCall(var_21_1)
end

function var_0_0.init(arg_22_0)
	arg_22_0:findUI()
	arg_22_0:addListener()
end

function var_0_0.PlaySingleAction(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = string.find(arg_23_1, "^Face_")

	if tobool(var_23_0) then
		arg_23_0:PlayFaceAnim(arg_23_1, arg_23_2)

		return
	end

	arg_23_0.animNameMap = arg_23_0.animNameMap or {}
	arg_23_0.animNameMap[arg_23_0.ladyAnimator.StringToHash(arg_23_1)] = arg_23_1

	local var_23_1 = {}

	if not arg_23_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_23_0.ladyAnimBaseLayerIndex):IsName(arg_23_1) then
		table.insert(var_23_1, function(arg_24_0)
			arg_23_0.nowState = arg_23_1
			arg_23_0.stateCallback = arg_24_0

			arg_23_0.ladyAnimator:CrossFadeInFixedTime(arg_23_1, 0.25, arg_23_0.ladyAnimBaseLayerIndex)
		end)
		table.insert(var_23_1, function(arg_25_0)
			arg_23_0.nowState = nil
			arg_23_0.stateCallback = nil

			arg_25_0()
		end)
	end

	seriesAsync(var_23_1, arg_23_2)
end

function var_0_0.SwitchAnim(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = string.find(arg_26_1, "^Face_")

	if tobool(var_26_0) then
		arg_26_0:PlayFaceAnim(arg_26_1, arg_26_2)

		return
	end

	arg_26_0.animNameMap = arg_26_0.animNameMap or {}
	arg_26_0.animNameMap[arg_26_0.ladyAnimator.StringToHash(arg_26_1)] = arg_26_1

	local var_26_1 = {}

	table.insert(var_26_1, function(arg_27_0)
		arg_26_0.nowState = arg_26_1
		arg_26_0.stateCallback = arg_27_0

		arg_26_0.ladyAnimator:PlayInFixedTime(arg_26_1, arg_26_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_26_1, function(arg_28_0)
		arg_26_0.nowState = nil
		arg_26_0.stateCallback = nil

		arg_28_0()
	end)
	seriesAsync(var_26_1, arg_26_2)
end

function var_0_0.PlayFaceAnim(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0.ladyAnimator:CrossFadeInFixedTime(arg_29_1, 0.2, arg_29_0.ladyAnimFaceLayerIndex)
	existCall(arg_29_2)
end

function var_0_0.SetARUIActive(arg_30_0, arg_30_1)
	setActive(arg_30_0.backBtn, arg_30_1)
	setActive(arg_30_0.menuListTF, arg_30_1)
	setActive(arg_30_0.tipTextTF, arg_30_1)
end

function var_0_0.SetARUIActiveWhenInit(arg_31_0, arg_31_1)
	setActive(arg_31_0.resetBtn, false)
end

function var_0_0.ResetCharPos(arg_32_0)
	if arg_32_0.ARCheck then
		arg_32_0.lady.localPosition = Vector3.zero
		arg_32_0.lady.localRotation = Vector3(0, 180, 0)
	else
		arg_32_0.lady.localPosition = Vector3(0, 0, 2)
		arg_32_0.lady.localRotation = Vector3(0, 180, 0)
	end
end

function var_0_0.didEnter(arg_33_0)
	arg_33_0:emit(Dorm3dARMediator.IN_ITAR_PHOTO)
end

function var_0_0.SetARLite(arg_34_0, arg_34_1)
	arg_34_0.ARState = arg_34_1
	arg_34_0.ARCheck = table.contains(var_0_0.AR_PASS_CODE, arg_34_1)

	if GraphApiHelper.IsUsingVulkan() then
		arg_34_0.ARCheck = false

		warning("ar not allow on vulkan.")
	end
end

function var_0_0.InitARPlane(arg_35_0)
	arg_35_0._initState = true

	if arg_35_0.lady then
		setActive(arg_35_0.lady, false)
	end

	arg_35_0:SetARUIActiveWhenInit(false)

	local var_35_0 = GameObject.Find("AR")

	SetActive(var_35_0, arg_35_0.ARCheck)

	local var_35_1 = GameObject.Find("FakeAR")

	SetActive(var_35_1, not arg_35_0.ARCheck)

	if arg_35_0.ARCheck then
		originalPrint("AR CHECK SUCCESS, INIT AR")
		arg_35_0.aiHelperSC:Init()
		arg_35_0:emit(Dorm3dARMediator.INIT_AR_PLANE)
	else
		originalPrint("AR CHECK FAIL")
		arg_35_0:InitARFinish()
		arg_35_0:EnabledDrag()
	end

	if PLATFORM == PLATFORM_WINDOWSEDITOR then
		arg_35_0:InitARFinish()
	end
end

function var_0_0.Reset(arg_36_0)
	arg_36_0._initState = true

	if arg_36_0.lady then
		setActive(arg_36_0.lady, false)
	end

	arg_36_0:SetARUIActiveWhenInit(false)

	if arg_36_0.ARCheck then
		arg_36_0.aiHelperSC:ResetAll()
	end
end

function var_0_0.InitARFinish(arg_37_0)
	setActive(arg_37_0.tipsLabel, false)
	arg_37_0:emit(Dorm3dARMediator.AR_INIT_FINISH)
	arg_37_0:InitCharacter(arg_37_0.contextData.groupId)

	if arg_37_0.ARCheck then
		local var_37_0 = GameObject.Find("Tpl(Clone)").transform

		arg_37_0.lady:SetParent(var_37_0)
	else
		arg_37_0.lady:SetParent(arg_37_0.tpl)
	end

	arg_37_0:ResetCharPos()
	arg_37_0:SetARUIActiveWhenInit(true)

	arg_37_0._initState = false
end

function var_0_0.willExit(arg_38_0)
	arg_38_0.loader:Clear()

	arg_38_0.hxHelper = nil

	if arg_38_0.ARCheck then
		arg_38_0.aiHelperSC:ResetAll()
		arg_38_0.aiHelperSC:Destroy()
	end

	local var_38_0 = GameObject.Find("Tpl(Clone)")

	if var_38_0 then
		Destroy(var_38_0)
	end

	local var_38_1, var_38_2 = unpack(string.split(var_0_1, "|"))

	SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_38_2 .. "/" .. var_38_1 .. "_scene"), var_38_1)

	if arg_38_0.luHandle then
		LateUpdateBeat:RemoveListener(arg_38_0.luHandle)
	end
end

function var_0_0.findUI(arg_39_0)
	arg_39_0.backBtn = arg_39_0._tf:Find("BackBtn")
	arg_39_0.menuListTF = arg_39_0._tf:Find("MenuList")
	arg_39_0.initARBtn = arg_39_0.menuListTF:Find("InitARBtn")
	arg_39_0.resetBtn = arg_39_0.menuListTF:Find("ResetBtn")
	arg_39_0.tipTextTF = arg_39_0._tf:Find("TipText")
	arg_39_0.tipsLabel = arg_39_0.tipTextTF:Find("tipsText")
	arg_39_0.tipsText = arg_39_0.tipTextTF:Find("tipsText/text")

	setActive(arg_39_0.tipsLabel, false)

	arg_39_0.fakeARCanvas = GameObject.Find("FakeAR/Main Camera/ARCanvas").transform

	setSizeDelta(arg_39_0.fakeARCanvas, Vector2(Screen.width, Screen.height))

	arg_39_0.fakeARCamera = GameObject.Find("FakeAR/Main Camera"):GetComponent("Camera")
	arg_39_0.drag = arg_39_0._tf:Find("drag")

	local var_39_0 = GameObject.Find("ARScriptHandle")

	arg_39_0.aiHelperSC = GetComponent(var_39_0, "ARHelper")
	arg_39_0.aiHelperSC.tplPrefab = GameObject.Find("Tpl")
	arg_39_0.tpl = GameObject.Find("Tpl").transform
	arg_39_0.holyLightRoot = arg_39_0._tf:Find("HolyLightRoot")
end

function var_0_0.addListener(arg_40_0)
	onButton(arg_40_0, arg_40_0.backBtn, function()
		arg_40_0:closeView()
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.resetBtn, function()
		arg_40_0:Reset()
	end, SFX_PANEL)

	function arg_40_0.aiHelperSC.planeCountCB(arg_43_0, arg_43_1)
		if not (arg_43_0 > 0) then
			setActive(arg_40_0.tipsLabel, true)
			setText(arg_40_0.tipsText, i18n("AR_plane_check"))
		elseif not arg_43_1 then
			setActive(arg_40_0.tipsLabel, true)
			setText(arg_40_0.tipsText, i18n("AR_plane_long_press_to_summon"))
		elseif arg_40_0._initState then
			arg_40_0:InitARFinish()
		end
	end

	function arg_40_0.aiHelperSC.distanceCB(arg_44_0)
		if arg_44_0 < 0.3 then
			arg_40_0.distanceFlag = true

			setActive(arg_40_0.lady, false)
			setActive(arg_40_0.tipsLabel, true)
			setText(arg_40_0.tipsText, i18n("AR_plane_distance_near"))
		elseif arg_40_0.distanceFlag then
			setActive(arg_40_0.tipsLabel, false)
			setActive(arg_40_0.lady, true)

			arg_40_0.distanceFlag = false
		end
	end

	function arg_40_0.aiHelperSC.insPrefabFailCB()
		warning("距离过近，呼出角色失败")
		pg.TipsMgr.GetInstance():ShowTips(i18n("AR_plane_summon_fail_by_near"))
	end

	function arg_40_0.aiHelperSC.insPrefabSuccCB()
		setActive(arg_40_0.tipsLabel, false)
		pg.TipsMgr.GetInstance():ShowTips(i18n("AR_plane_summon_success"))
		arg_40_0.aiHelperSC:StopPlaneCheck()
	end
end

function var_0_0.EnabledDrag(arg_47_0)
	arg_47_0.lady.localScale = Vector3(5, 5, 5)

	local var_47_0 = LuaHelper.GetWorldCorners(arg_47_0._tf:GetComponent("RectTransform"))
	local var_47_1 = var_47_0[2].x - var_47_0[0].x
	local var_47_2 = var_47_0[2].y - var_47_0[0].y

	arg_47_0.widthRate = var_47_1 / pg.CameraFixMgr.GetInstance().actualWidth
	arg_47_0.heightRate = var_47_2 / pg.CameraFixMgr.GetInstance().actualHeight
	arg_47_0.halfWidth = var_47_1 / 2
	arg_47_0.halfHeight = var_47_2 / 2
	arg_47_0.isEnableDrag = true

	local var_47_3 = arg_47_0.drag.gameObject

	GetOrAddComponent(var_47_3, typeof(Button))

	arg_47_0.zoom = GetOrAddComponent(arg_47_0._tf, typeof(PinchZoom))
	arg_47_0.zoom.enabled = true

	local var_47_4 = GetOrAddComponent(var_47_3, typeof(EventTriggerListener))
	local var_47_5 = Vector3(0, 0, 0)

	var_47_4:AddBeginDragFunc(function(arg_48_0, arg_48_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if arg_47_0.zoom.processing then
			return
		end

		setButtonEnabled(var_47_3, false)

		if Input.touchCount > 1 then
			return
		end

		local var_48_0 = var_0_0.Screen2Local(var_47_3.transform.parent, arg_48_1.position)

		var_47_5 = arg_47_0.drag.localPosition - var_48_0
	end)
	var_47_4:AddDragFunc(function(arg_49_0, arg_49_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if arg_47_0.zoom.processing then
			return
		end

		if Input.touchCount > 1 then
			return
		end

		local var_49_0 = var_0_0.Screen2Local(var_47_3.transform.parent, arg_49_1.position)

		arg_47_0.drag.localPosition = Vector3(var_49_0.x, var_49_0.y, 0) + var_47_5
		arg_47_0.tpl.localPosition = arg_47_0:GetUI2Char(arg_49_1.position)
	end)
	var_47_4:AddDragEndFunc(function()
		setButtonEnabled(var_47_3, true)
	end)

	var_47_4.enabled = true
	Input.multiTouchEnabled = true
	arg_47_0.fakeARCamera.orthographicSize = 8
	arg_47_0.fakeARCamera.orthographic = true
	arg_47_0.luHandle = LateUpdateBeat:CreateListener(function()
		if arg_47_0.zoom.processing then
			local var_51_0 = arg_47_0.drag.localScale.x

			arg_47_0.tpl.localScale = Vector3(var_51_0, var_51_0, var_51_0)
		end
	end, arg_47_0)

	LateUpdateBeat:AddListener(arg_47_0.luHandle)
end

function var_0_0.GetUI2Char(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0.widthRate * arg_52_1.x - arg_52_0.halfWidth
	local var_52_1 = arg_52_0.heightRate * arg_52_1.y - arg_52_0.halfHeight

	return Vector3(var_52_0, var_52_1, 2)
end

function var_0_0.Screen2Local(arg_53_0, arg_53_1)
	local var_53_0 = GameObject.Find("UICamera"):GetComponent("Camera")
	local var_53_1 = arg_53_0:GetComponent("RectTransform")
	local var_53_2 = LuaHelper.ScreenToLocal(var_53_1, arg_53_1, var_53_0)

	return Vector3(var_53_2.x, var_53_2.y, 0)
end

return var_0_0
