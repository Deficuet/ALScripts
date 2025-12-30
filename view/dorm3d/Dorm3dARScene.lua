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
		end,
		function(arg_11_0)
			local var_11_0 = GameObject.Find("FakeAR/Main Camera")
			local var_11_1 = GameObject.Find("AR/XR Origin/Camera Offset/Main Camera")

			if var_11_0 then
				originalPrint("Fix Fake AR Camera Data")
				HotfixHelper.FixARCameraData(var_11_0)
			end

			if var_11_1 then
				originalPrint("Fix True AR Camera Data")
				HotfixHelper.FixARCameraData(var_11_1)
			end

			arg_11_0()
		end
	}, arg_7_1)
end

function var_0_0.LoadCharacter(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.hxMatDict = {}
	arg_12_0.ladyDict = {}
	arg_12_0.skinDict = {}

	local var_12_0 = {}

	for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
		local var_12_1 = arg_12_0

		arg_12_0.ladyDict[iter_12_1] = var_12_1

		local var_12_2 = getProxy(ApartmentProxy):getApartment(iter_12_1)
		local var_12_3 = var_12_2:getConfig("asset_name")
		local var_12_4 = var_12_2:GetSkinModelID(arg_12_0.room:getConfig("tag"))
		local var_12_5 = pg.dorm3d_resource[var_12_4].model_id

		assert(var_12_5)

		for iter_12_2, iter_12_3 in ipairs({
			"common",
			var_12_5
		}) do
			local var_12_6 = string.format("dorm3d/character/%s/res/%s", var_12_3, iter_12_3)

			if checkABExist(var_12_6) then
				table.insert(var_12_0, function(arg_13_0)
					arg_12_0.loader:LoadBundle(var_12_6, function(arg_14_0)
						for iter_14_0, iter_14_1 in ipairs(arg_14_0:GetAllAssetNames()) do
							local var_14_0, var_14_1, var_14_2 = string.find(iter_14_1, "material_hx[/\\](.*).mat")

							if var_14_0 then
								arg_12_0.hxMatDict[var_14_2] = {
									arg_14_0,
									iter_14_1
								}
							end
						end

						arg_13_0()
					end)
				end)
			end
		end

		var_12_1.skinId = var_12_4
		var_12_1.skinIdList = {
			var_12_4
		}

		table.insert(var_12_0, function(arg_15_0)
			local var_15_0 = string.format("dorm3d/character/%s/prefabs/%s", var_12_3, var_12_5)

			arg_12_0.loader:GetPrefab(var_15_0, "", function(arg_16_0)
				var_12_1.ladyGameObject = arg_16_0

				setActive(arg_16_0.transform, false)

				arg_12_0.skinDict[var_12_4] = {
					ladyGameObject = arg_16_0
				}

				arg_15_0()
			end)
		end)
	end

	parallelAsync(var_12_0, arg_12_2)
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
	arg_17_0:HXCharacter(arg_17_0.lady)
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

function var_0_0.HXCharacter(arg_20_0, arg_20_1)
	if not HXSet.isHx() then
		return
	end

	Dorm3dHxHelper.ShowHolyLight({
		arg_20_1
	}, arg_20_0.holyLightRoot)

	if Dorm3dHxHelper.ReplaceCharacterParts(arg_20_1) then
		return
	end

	local var_20_0 = arg_20_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer))

	table.IpairsCArray(var_20_0, function(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_1.sharedMaterials
		local var_21_1 = false

		table.IpairsCArray(var_21_0, function(arg_22_0, arg_22_1)
			local var_22_0 = arg_22_1.name

			if not arg_20_0.hxMatDict[var_22_0] then
				return
			end

			var_21_1 = true

			local var_22_1, var_22_2 = unpack(arg_20_0.hxMatDict[var_22_0])
			local var_22_3 = var_22_1:LoadAssetSync(var_22_2, typeof(Material), false, false)

			var_21_0[arg_22_0] = var_22_3

			warning("Replace HX Material", arg_20_0.hxMatDict[var_22_0][2])
		end)

		if var_21_1 then
			arg_21_1.sharedMaterials = var_21_0
		end
	end)
end

function var_0_0.OnAnimationEvent(arg_23_0, arg_23_1)
	if arg_23_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_23_0 = arg_23_1.stringParameter
	local var_23_1 = table.removebykey(arg_23_0.animEventCallbacks, var_23_0)

	existCall(var_23_1)
end

function var_0_0.init(arg_24_0)
	arg_24_0:findUI()
	arg_24_0:addListener()
end

function var_0_0.PlaySingleAction(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = string.find(arg_25_1, "^Face_")

	if tobool(var_25_0) then
		arg_25_0:PlayFaceAnim(arg_25_1, arg_25_2)

		return
	end

	arg_25_0.animNameMap = arg_25_0.animNameMap or {}
	arg_25_0.animNameMap[arg_25_0.ladyAnimator.StringToHash(arg_25_1)] = arg_25_1

	local var_25_1 = {}

	if not arg_25_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_25_0.ladyAnimBaseLayerIndex):IsName(arg_25_1) then
		table.insert(var_25_1, function(arg_26_0)
			arg_25_0.nowState = arg_25_1
			arg_25_0.stateCallback = arg_26_0

			arg_25_0.ladyAnimator:CrossFadeInFixedTime(arg_25_1, 0.25, arg_25_0.ladyAnimBaseLayerIndex)
		end)
		table.insert(var_25_1, function(arg_27_0)
			arg_25_0.nowState = nil
			arg_25_0.stateCallback = nil

			arg_27_0()
		end)
	end

	seriesAsync(var_25_1, arg_25_2)
end

function var_0_0.SwitchAnim(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = string.find(arg_28_1, "^Face_")

	if tobool(var_28_0) then
		arg_28_0:PlayFaceAnim(arg_28_1, arg_28_2)

		return
	end

	arg_28_0.animNameMap = arg_28_0.animNameMap or {}
	arg_28_0.animNameMap[arg_28_0.ladyAnimator.StringToHash(arg_28_1)] = arg_28_1

	local var_28_1 = {}

	table.insert(var_28_1, function(arg_29_0)
		arg_28_0.nowState = arg_28_1
		arg_28_0.stateCallback = arg_29_0

		arg_28_0.ladyAnimator:PlayInFixedTime(arg_28_1, arg_28_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_28_1, function(arg_30_0)
		arg_28_0.nowState = nil
		arg_28_0.stateCallback = nil

		arg_30_0()
	end)
	seriesAsync(var_28_1, arg_28_2)
end

function var_0_0.PlayFaceAnim(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.ladyAnimator:CrossFadeInFixedTime(arg_31_1, 0.2, arg_31_0.ladyAnimFaceLayerIndex)
	existCall(arg_31_2)
end

function var_0_0.SetARUIActive(arg_32_0, arg_32_1)
	setActive(arg_32_0.backBtn, arg_32_1)
	setActive(arg_32_0.menuListTF, arg_32_1)
	setActive(arg_32_0.tipTextTF, arg_32_1)
end

function var_0_0.SetARUIActiveWhenInit(arg_33_0, arg_33_1)
	setActive(arg_33_0.resetBtn, false)
end

function var_0_0.ResetCharPos(arg_34_0)
	if arg_34_0.ARCheck then
		arg_34_0.lady.localPosition = Vector3.zero
		arg_34_0.lady.localRotation = Vector3(0, 180, 0)
	else
		arg_34_0.lady.localPosition = Vector3(0, 0, 2)
		arg_34_0.lady.localRotation = Vector3(0, 180, 0)
	end
end

function var_0_0.didEnter(arg_35_0)
	arg_35_0:emit(Dorm3dARMediator.IN_ITAR_PHOTO)
end

function var_0_0.SetARLite(arg_36_0, arg_36_1)
	arg_36_0.ARState = arg_36_1
	arg_36_0.ARCheck = table.contains(var_0_0.AR_PASS_CODE, arg_36_1)

	if GraphApiHelper.IsUsingVulkan() then
		arg_36_0.ARCheck = false

		warning("ar not allow on vulkan.")
	end
end

function var_0_0.InitARPlane(arg_37_0)
	arg_37_0._initState = true

	if arg_37_0.lady then
		setActive(arg_37_0.lady, false)
	end

	arg_37_0:SetARUIActiveWhenInit(false)

	local var_37_0 = GameObject.Find("AR")

	SetActive(var_37_0, arg_37_0.ARCheck)

	local var_37_1 = GameObject.Find("FakeAR")

	SetActive(var_37_1, not arg_37_0.ARCheck)

	if arg_37_0.ARCheck then
		originalPrint("AR CHECK SUCCESS, INIT AR")
		arg_37_0.aiHelperSC:Init()
		arg_37_0:emit(Dorm3dARMediator.INIT_AR_PLANE)
	else
		originalPrint("AR CHECK FAIL")
		arg_37_0:InitARFinish()
		arg_37_0:EnabledDrag()
	end

	if PLATFORM == PLATFORM_WINDOWSEDITOR then
		arg_37_0:InitARFinish()
	end
end

function var_0_0.Reset(arg_38_0)
	arg_38_0._initState = true

	if arg_38_0.lady then
		setActive(arg_38_0.lady, false)
	end

	arg_38_0:SetARUIActiveWhenInit(false)

	if arg_38_0.ARCheck then
		arg_38_0.aiHelperSC:ResetAll()
	end
end

function var_0_0.InitARFinish(arg_39_0)
	setActive(arg_39_0.tipsLabel, false)
	arg_39_0:emit(Dorm3dARMediator.AR_INIT_FINISH)
	arg_39_0:InitCharacter(arg_39_0.contextData.groupId)

	if arg_39_0.ARCheck then
		local var_39_0 = GameObject.Find("Tpl(Clone)").transform

		arg_39_0.lady:SetParent(var_39_0)
	else
		arg_39_0.lady:SetParent(arg_39_0.tpl)
	end

	arg_39_0:ResetCharPos()
	arg_39_0:SetARUIActiveWhenInit(true)

	arg_39_0._initState = false
end

function var_0_0.willExit(arg_40_0)
	arg_40_0.loader:Clear()

	if arg_40_0.ARCheck then
		arg_40_0.aiHelperSC:ResetAll()
		arg_40_0.aiHelperSC:Destroy()
	end

	local var_40_0 = GameObject.Find("Tpl(Clone)")

	if var_40_0 then
		Destroy(var_40_0)
	end

	local var_40_1, var_40_2 = unpack(string.split(var_0_1, "|"))

	SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_40_2 .. "/" .. var_40_1 .. "_scene"), var_40_1)

	if arg_40_0.luHandle then
		LateUpdateBeat:RemoveListener(arg_40_0.luHandle)
	end
end

function var_0_0.findUI(arg_41_0)
	arg_41_0.backBtn = arg_41_0._tf:Find("BackBtn")
	arg_41_0.menuListTF = arg_41_0._tf:Find("MenuList")
	arg_41_0.initARBtn = arg_41_0.menuListTF:Find("InitARBtn")
	arg_41_0.resetBtn = arg_41_0.menuListTF:Find("ResetBtn")
	arg_41_0.tipTextTF = arg_41_0._tf:Find("TipText")
	arg_41_0.tipsLabel = arg_41_0.tipTextTF:Find("tipsText")
	arg_41_0.tipsText = arg_41_0.tipTextTF:Find("tipsText/text")

	setActive(arg_41_0.tipsLabel, false)

	arg_41_0.fakeARCanvas = GameObject.Find("FakeAR/Main Camera/ARCanvas").transform

	setSizeDelta(arg_41_0.fakeARCanvas, Vector2(Screen.width, Screen.height))

	arg_41_0.fakeARCamera = GameObject.Find("FakeAR/Main Camera"):GetComponent("Camera")
	arg_41_0.drag = arg_41_0._tf:Find("drag")

	local var_41_0 = GameObject.Find("ARScriptHandle")

	arg_41_0.aiHelperSC = GetComponent(var_41_0, "ARHelper")
	arg_41_0.aiHelperSC.tplPrefab = GameObject.Find("Tpl")
	arg_41_0.tpl = GameObject.Find("Tpl").transform
	arg_41_0.holyLightRoot = arg_41_0._tf:Find("HolyLightRoot")
end

function var_0_0.addListener(arg_42_0)
	onButton(arg_42_0, arg_42_0.backBtn, function()
		arg_42_0:closeView()
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.resetBtn, function()
		arg_42_0:Reset()
	end, SFX_PANEL)

	function arg_42_0.aiHelperSC.planeCountCB(arg_45_0, arg_45_1)
		if not (arg_45_0 > 0) then
			setActive(arg_42_0.tipsLabel, true)
			setText(arg_42_0.tipsText, i18n("AR_plane_check"))
		elseif not arg_45_1 then
			setActive(arg_42_0.tipsLabel, true)
			setText(arg_42_0.tipsText, i18n("AR_plane_long_press_to_summon"))
		elseif arg_42_0._initState then
			arg_42_0:InitARFinish()
		end
	end

	function arg_42_0.aiHelperSC.distanceCB(arg_46_0)
		if arg_46_0 < 0.3 then
			arg_42_0.distanceFlag = true

			setActive(arg_42_0.lady, false)
			setActive(arg_42_0.tipsLabel, true)
			setText(arg_42_0.tipsText, i18n("AR_plane_distance_near"))
		elseif arg_42_0.distanceFlag then
			setActive(arg_42_0.tipsLabel, false)
			setActive(arg_42_0.lady, true)

			arg_42_0.distanceFlag = false
		end
	end

	function arg_42_0.aiHelperSC.insPrefabFailCB()
		warning("距离过近，呼出角色失败")
		pg.TipsMgr.GetInstance():ShowTips(i18n("AR_plane_summon_fail_by_near"))
	end

	function arg_42_0.aiHelperSC.insPrefabSuccCB()
		setActive(arg_42_0.tipsLabel, false)
		pg.TipsMgr.GetInstance():ShowTips(i18n("AR_plane_summon_success"))
		arg_42_0.aiHelperSC:StopPlaneCheck()
	end
end

function var_0_0.EnabledDrag(arg_49_0)
	arg_49_0.lady.localScale = Vector3(5, 5, 5)

	local var_49_0 = LuaHelper.GetWorldCorners(arg_49_0._tf:GetComponent("RectTransform"))
	local var_49_1 = var_49_0[2].x - var_49_0[0].x
	local var_49_2 = var_49_0[2].y - var_49_0[0].y

	arg_49_0.widthRate = var_49_1 / pg.CameraFixMgr.GetInstance().actualWidth
	arg_49_0.heightRate = var_49_2 / pg.CameraFixMgr.GetInstance().actualHeight
	arg_49_0.halfWidth = var_49_1 / 2
	arg_49_0.halfHeight = var_49_2 / 2
	arg_49_0.isEnableDrag = true

	local var_49_3 = arg_49_0.drag.gameObject

	GetOrAddComponent(var_49_3, typeof(Button))

	arg_49_0.zoom = GetOrAddComponent(arg_49_0._tf, typeof(PinchZoom))
	arg_49_0.zoom.enabled = true

	local var_49_4 = GetOrAddComponent(var_49_3, typeof(EventTriggerListener))
	local var_49_5 = Vector3(0, 0, 0)

	var_49_4:AddBeginDragFunc(function(arg_50_0, arg_50_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if arg_49_0.zoom.processing then
			return
		end

		setButtonEnabled(var_49_3, false)

		if Input.touchCount > 1 then
			return
		end

		local var_50_0 = var_0_0.Screen2Local(var_49_3.transform.parent, arg_50_1.position)

		var_49_5 = arg_49_0.drag.localPosition - var_50_0
	end)
	var_49_4:AddDragFunc(function(arg_51_0, arg_51_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if arg_49_0.zoom.processing then
			return
		end

		if Input.touchCount > 1 then
			return
		end

		local var_51_0 = var_0_0.Screen2Local(var_49_3.transform.parent, arg_51_1.position)

		arg_49_0.drag.localPosition = Vector3(var_51_0.x, var_51_0.y, 0) + var_49_5
		arg_49_0.tpl.localPosition = arg_49_0:GetUI2Char(arg_51_1.position)
	end)
	var_49_4:AddDragEndFunc(function()
		setButtonEnabled(var_49_3, true)
	end)

	var_49_4.enabled = true
	Input.multiTouchEnabled = true
	arg_49_0.fakeARCamera.orthographicSize = 8
	arg_49_0.fakeARCamera.orthographic = true
	arg_49_0.luHandle = LateUpdateBeat:CreateListener(function()
		if arg_49_0.zoom.processing then
			local var_53_0 = arg_49_0.drag.localScale.x

			arg_49_0.tpl.localScale = Vector3(var_53_0, var_53_0, var_53_0)
		end
	end, arg_49_0)

	LateUpdateBeat:AddListener(arg_49_0.luHandle)
end

function var_0_0.GetUI2Char(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0.widthRate * arg_54_1.x - arg_54_0.halfWidth
	local var_54_1 = arg_54_0.heightRate * arg_54_1.y - arg_54_0.halfHeight

	return Vector3(var_54_0, var_54_1, 2)
end

function var_0_0.Screen2Local(arg_55_0, arg_55_1)
	local var_55_0 = GameObject.Find("UICamera"):GetComponent("Camera")
	local var_55_1 = arg_55_0:GetComponent("RectTransform")
	local var_55_2 = LuaHelper.ScreenToLocal(var_55_1, arg_55_1, var_55_0)

	return Vector3(var_55_2.x, var_55_2.y, 0)
end

return var_0_0
