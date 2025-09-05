pg = pg or {}

local var_0_0 = pg

var_0_0.LayerWeightMgr = singletonClass("LayerWeightMgr")

local var_0_1 = var_0_0.LayerWeightMgr

var_0_1.DEBUG = false
var_0_1.ADAPT_TAG = "(Adapt)"
var_0_1.RECYCLE_ADAPT_TAG = "recycleAdapt"

function var_0_1.Init(arg_1_0, arg_1_1)
	arg_1_0.baseParent = tf(GameObject.Find("UICamera/Canvas"))

	local var_1_0 = tf(GameObject.Find("UICamera/Canvas/UIMain"))

	arg_1_0.uiOrigin = tf(instantiate(var_1_0))
	arg_1_0.uiOrigin.name = "UIOrigin"

	arg_1_0.uiOrigin:SetParent(arg_1_0.baseParent, false)

	arg_1_0.originCanvas = GetOrAddComponent(arg_1_0.uiOrigin, typeof(Canvas))
	arg_1_0.originCanvas.overrideSorting = true
	arg_1_0.originCanvas.sortingOrder = 200
	arg_1_0.originCast = GetOrAddComponent(arg_1_0.uiOrigin, typeof(GraphicRaycaster))
	arg_1_0.lvCameraTf = tf(GameObject.Find("LevelCamera"))
	arg_1_0.lvParent = tf(GameObject.Find("LevelCamera/Canvas"))
	arg_1_0.lvCamera = GetOrAddComponent(arg_1_0.lvCameraTf, typeof(Camera))
	arg_1_0.adaptPool = {}
	arg_1_0.UIMain = rtf(GameObject.Find("UICamera/Canvas/UIMain"))
	arg_1_0.OverlayMain = rtf(GameObject.Find("OverlayCamera/Overlay/UIMain"))
	arg_1_0.OverlayAdapt = rtf(GameObject.Find("OverlayCamera/Overlay/UIAdapt"))
	arg_1_0.OverlayTop = rtf(GameObject.Find("OverlayCamera/Overlay/UIOverlay"))
	arg_1_0.storeUIs = {}

	if arg_1_1 ~= nil then
		arg_1_1()
	end
end

function var_0_1.CreateRefreshHandler(arg_2_0)
	if not arg_2_0.luHandle then
		arg_2_0.luHandle = LateUpdateBeat:CreateListener(arg_2_0.Refresh, arg_2_0)

		LateUpdateBeat:AddListener(arg_2_0.luHandle)
	end
end

function var_0_1.ClearRefreshHandler(arg_3_0)
	if arg_3_0.luHandle then
		LateUpdateBeat:RemoveListener(arg_3_0.luHandle)

		arg_3_0.luHandle = nil
	end
end

function var_0_1.Refresh(arg_4_0)
	arg_4_0:LayerSortHandler()
	arg_4_0:ClearRefreshHandler()
end

function var_0_1.Add2Overlay(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_3.type = arg_5_1
	arg_5_3.ui = arg_5_2
	arg_5_3.pbList = arg_5_3.pbList or {}
	arg_5_3.weight = arg_5_3.weight or LayerWeightConst.BASE_LAYER
	arg_5_3.overlayType = arg_5_3.overlayType or LayerWeightConst.OVERLAY_UI_MAIN
	arg_5_3.visible = true

	local var_5_0

	if arg_5_0.lvCamera.enabled then
		var_5_0 = {
			var_0_0.UIMgr.CameraLevel
		}
	else
		var_5_0 = {
			var_0_0.UIMgr.CameraUI
		}
	end

	arg_5_3.blurCamList = arg_5_3.blurCamList or var_5_0

	if arg_5_1 == LayerWeightConst.UI_TYPE_SYSTEM and #arg_5_0.storeUIs > 0 or arg_5_1 == LayerWeightConst.UI_TYPE_SUB or arg_5_1 == LayerWeightConst.UI_TYPE_OVERLAY_FOREVER then
		arg_5_0:Log("ui：" .. arg_5_2.gameObject.name .. " 加入了ui层级管理, weight:" .. arg_5_3.weight)

		local var_5_1 = arg_5_0:DelList(arg_5_2)

		arg_5_0:ClearBlurData(var_5_1)
		table.insert(arg_5_0.storeUIs, arg_5_3)
		arg_5_0:CreateRefreshHandler()

		if arg_5_3.force then
			arg_5_0:Refresh()
		end
	end
end

function var_0_1.DelFromOverlay(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0:Log("ui：" .. arg_6_1.gameObject.name .. " 去除了ui层级管理")

	local var_6_0 = arg_6_0:DelList(arg_6_1)

	if var_6_0 ~= nil then
		local var_6_1 = var_6_0.ui
		local var_6_2 = arg_6_0:GetAdaptObjFromUI(var_6_1)

		if var_6_2 == nil then
			var_6_2 = var_6_1
		end

		local var_6_3 = GetOrAddComponent(var_6_2, typeof(CanvasGroup))

		var_6_3.interactable = true
		var_6_3.blocksRaycasts = true

		arg_6_0:CheckRecycleAdaptObj(var_6_1, arg_6_2)
		arg_6_0:ClearBlurData(var_6_0)
	end

	arg_6_0:CreateRefreshHandler()
end

function var_0_1.DelList(arg_7_0, arg_7_1)
	local var_7_0

	for iter_7_0 = #arg_7_0.storeUIs, 1, -1 do
		if arg_7_0.storeUIs[iter_7_0].ui == arg_7_1 then
			var_7_0 = arg_7_0.storeUIs[iter_7_0]

			table.remove(arg_7_0.storeUIs, iter_7_0)

			break
		end
	end

	return var_7_0
end

function var_0_1.ClearBlurData(arg_8_0, arg_8_1)
	if arg_8_1 == nil then
		return
	end

	if arg_8_1.pbList ~= nil then
		var_0_0.UIMgr.GetInstance():RevertPBMaterial(arg_8_1.pbList)
	end

	local var_8_0 = arg_8_1.lockGlobalBlur

	if var_8_0 then
		local var_8_1 = arg_8_1.blurCamList

		for iter_8_0, iter_8_1 in ipairs({
			var_0_0.UIMgr.CameraUI,
			var_0_0.UIMgr.CameraLevel
		}) do
			if table.contains(var_8_1, iter_8_1) then
				var_0_0.UIMgr.GetInstance():UnblurCamera(iter_8_1, var_8_0)
			end
		end
	end
end

function var_0_1.LayerSortHandler(arg_9_0)
	arg_9_0:switchOriginParent()
	arg_9_0:SortStoreUIs()

	local var_9_0 = false
	local var_9_1 = false
	local var_9_2 = {}
	local var_9_3
	local var_9_4 = false
	local var_9_5 = false
	local var_9_6 = false
	local var_9_7 = {}
	local var_9_8
	local var_9_9 = 0
	local var_9_10 = 0
	local var_9_11 = #arg_9_0.storeUIs

	for iter_9_0 = #arg_9_0.storeUIs, 1, -1 do
		local var_9_12 = arg_9_0.storeUIs[iter_9_0]
		local var_9_13 = var_9_12.type
		local var_9_14 = var_9_12.ui
		local var_9_15 = var_9_12.pbList
		local var_9_16 = var_9_12.globalBlur
		local var_9_17 = var_9_12.lockGlobalBlur
		local var_9_18 = var_9_12.groupName
		local var_9_19 = var_9_12.overlayType
		local var_9_20 = var_9_12.hideLowerLayer
		local var_9_21 = var_9_12.staticBlur
		local var_9_22 = var_9_12.blurCamList
		local var_9_23 = var_9_12.visible
		local var_9_24 = var_9_12.parent
		local var_9_25 = iter_9_0 == var_9_11

		if var_9_13 == LayerWeightConst.UI_TYPE_SYSTEM then
			var_9_0 = true
		end

		if var_9_25 then
			if var_9_18 ~= nil then
				var_9_3 = var_9_18
			end

			var_9_4 = var_9_16
			var_9_5 = var_9_17
			var_9_6 = var_9_21
			var_9_7 = var_9_22

			local var_9_26 = var_9_12
		end

		local function var_9_27()
			arg_9_0:ShowOrHideTF(var_9_14, true)

			if var_9_24 ~= nil then
				arg_9_0:SetSpecificParent(var_9_14, var_9_24)
			elseif var_9_19 == LayerWeightConst.OVERLAY_UI_TOP then
				arg_9_0:SetToOverlayParent(var_9_14, var_9_19)
			else
				arg_9_0:SetToOverlayParent(var_9_14, var_9_19, var_9_9)
			end

			if var_9_23 and not var_9_16 and #var_9_15 > 0 then
				table.insertto(var_9_2, var_9_15)
			end
		end

		local function var_9_28()
			arg_9_0:SetToOrigin(var_9_14, var_9_19, var_9_10, var_9_12.interactableAlways)

			if var_9_0 or var_9_1 then
				arg_9_0:ShowOrHideTF(var_9_14, false)
			else
				arg_9_0:ShowOrHideTF(var_9_14, true)

				if #var_9_15 > 0 then
					var_0_0.UIMgr.GetInstance():RevertPBMaterial(var_9_15)
				end
			end
		end

		if var_9_13 == LayerWeightConst.UI_TYPE_SUB then
			if var_9_25 then
				var_9_27()
			elseif var_9_3 ~= nil and var_9_3 == var_9_18 then
				var_9_27()
			else
				var_9_28()
			end
		elseif var_9_13 == LayerWeightConst.UI_TYPE_OVERLAY_FOREVER then
			if var_9_25 then
				var_9_11 = iter_9_0 - 1

				var_9_27()
			elseif var_9_3 ~= nil and var_9_3 == var_9_18 then
				var_9_27()
			else
				var_9_28()
			end
		end

		if var_9_20 then
			var_9_1 = true
		end
	end

	if #var_9_2 > 0 then
		var_0_0.UIMgr.GetInstance():PartialBlurTfs(var_9_2)
	else
		var_0_0.UIMgr.GetInstance():ShutdownPartialBlur()
	end

	if var_9_4 then
		for iter_9_1, iter_9_2 in ipairs({
			var_0_0.UIMgr.CameraUI,
			var_0_0.UIMgr.CameraLevel
		}) do
			if table.contains(var_9_7, iter_9_2) then
				var_0_0.UIMgr.GetInstance():BlurCamera(iter_9_2, var_9_6, var_9_5)
			else
				var_0_0.UIMgr.GetInstance():UnblurCamera(iter_9_2)
			end
		end
	else
		for iter_9_3, iter_9_4 in ipairs({
			var_0_0.UIMgr.CameraUI,
			var_0_0.UIMgr.CameraLevel
		}) do
			var_0_0.UIMgr.GetInstance():UnblurCamera(iter_9_4)
		end
	end
end

function var_0_1.SetSpecificParent(arg_12_0, arg_12_1, arg_12_2)
	SetParent(arg_12_1, arg_12_2, false)

	local var_12_0 = GetOrAddComponent(arg_12_1, typeof(CanvasGroup))

	var_12_0.interactable = true
	var_12_0.blocksRaycasts = true
end

function var_0_1.SetToOverlayParent(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0

	if arg_13_2 == LayerWeightConst.OVERLAY_UI_ADAPT then
		var_13_0 = arg_13_0:GetAdaptObjFromUI(arg_13_1)

		if var_13_0 ~= nil then
			var_13_0 = arg_13_1.parent

			SetParent(var_13_0, arg_13_0.OverlayMain, false)
		else
			var_13_0 = arg_13_0:GetAdaptObj(arg_13_0:GetAdatpObjName(arg_13_1))

			SetParent(arg_13_1, var_13_0, false)
			SetParent(var_13_0, arg_13_0.OverlayMain, false)
		end
	elseif arg_13_2 == LayerWeightConst.OVERLAY_UI_TOP then
		var_13_0 = arg_13_1

		SetParent(var_13_0, arg_13_0.OverlayTop, false)
	else
		var_13_0 = arg_13_1

		SetParent(var_13_0, arg_13_0.OverlayMain, false)
	end

	if arg_13_3 ~= nil then
		var_13_0:SetSiblingIndex(arg_13_3)
	end

	local var_13_1 = GetOrAddComponent(var_13_0, typeof(CanvasGroup))

	var_13_1.interactable = true
	var_13_1.blocksRaycasts = true
end

function var_0_1.SetToOrigin(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	local var_14_0

	if arg_14_2 == LayerWeightConst.OVERLAY_UI_ADAPT then
		var_14_0 = arg_14_0:GetAdaptObjFromUI(arg_14_1)

		if var_14_0 ~= nil then
			var_14_0 = arg_14_1.parent
		else
			var_14_0 = arg_14_0:GetAdaptObj(arg_14_0:GetAdatpObjName(arg_14_1))

			SetParent(arg_14_1, var_14_0, false)
		end
	else
		var_14_0 = arg_14_1
	end

	SetParent(var_14_0, arg_14_0.uiOrigin, false)

	if arg_14_3 ~= nil then
		var_14_0:SetSiblingIndex(arg_14_3)
	end

	local var_14_1 = GetOrAddComponent(var_14_0, typeof(CanvasGroup))

	var_14_1.interactable = arg_14_4
	var_14_1.blocksRaycasts = arg_14_4
end

function var_0_1.SortStoreUIs(arg_15_0)
	arg_15_0:Log("-----------------------------------------")
	mergeSort(arg_15_0.storeUIs, CompareFuncs({
		function(arg_16_0)
			return arg_16_0.weight
		end
	}, true))

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.storeUIs) do
		arg_15_0:Log(iter_15_1.ui.gameObject.name .. "   globalBlur:" .. tostring(iter_15_1.globalBlur))
	end

	arg_15_0:Log("-----------------------------------------")
end

function var_0_1.ShowOrHideTF(arg_17_0, arg_17_1, arg_17_2)
	GetOrAddComponent(arg_17_1, typeof(CanvasGroup)).alpha = arg_17_2 and 1 or 0
end

function var_0_1.SetVisibleViaLayer(arg_18_0, arg_18_1, arg_18_2)
	setActiveViaLayer(arg_18_1, arg_18_2)

	for iter_18_0, iter_18_1 in pairs(arg_18_0.storeUIs) do
		if iter_18_1.ui == arg_18_1 then
			iter_18_1.visible = arg_18_2

			arg_18_0:CreateRefreshHandler()
		end
	end
end

function var_0_1.switchOriginParent(arg_19_0)
	if arg_19_0.lvCamera.enabled then
		arg_19_0.uiOrigin:SetParent(arg_19_0.lvParent, false)

		arg_19_0.originCanvas.sortingOrder = 5000
	else
		arg_19_0.uiOrigin:SetParent(arg_19_0.baseParent, false)

		arg_19_0.originCanvas.sortingOrder = 200
	end
end

function var_0_1.GetAdaptObj(arg_20_0, arg_20_1)
	local var_20_0

	if #arg_20_0.adaptPool > 0 then
		var_20_0 = table.remove(arg_20_0.adaptPool, #arg_20_0.adaptPool)
		var_20_0.name = arg_20_1
	else
		var_20_0 = GameObject.New(arg_20_1, typeof(RectTransform), typeof(NotchAdapt)).transform
	end

	var_20_0.anchorMin = Vector2.zero
	var_20_0.anchorMax = Vector2.one
	var_20_0.pivot = Vector2(0.5, 0.5)
	var_20_0.offsetMax = Vector2.zero
	var_20_0.offsetMin = Vector2.zero
	var_20_0.localPosition = Vector3.zero

	SetActive(var_20_0, true)
	arg_20_0:ShowOrHideTF(var_20_0, true)

	return var_20_0
end

function var_0_1.CheckRecycleAdaptObj(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0:GetAdaptObjFromUI(arg_21_1)

	if arg_21_2 ~= nil then
		SetParent(arg_21_1, arg_21_2, false)
	end

	if var_21_0 ~= nil then
		if #arg_21_0.adaptPool < 4 then
			table.insert(arg_21_0.adaptPool, var_21_0)
			SetParent(var_21_0, arg_21_0.OverlayAdapt, false)

			var_21_0.name = var_0_1.RECYCLE_ADAPT_TAG

			SetActive(var_21_0, false)
		else
			Destroy(var_21_0)
		end
	end
end

function var_0_1.GetAdaptObjFromUI(arg_22_0, arg_22_1)
	if arg_22_1.parent ~= nil and arg_22_1.parent.name == arg_22_0:GetAdatpObjName(arg_22_1) then
		return arg_22_1.parent
	end

	return nil
end

function var_0_1.GetAdatpObjName(arg_23_0, arg_23_1)
	return arg_23_1.name .. var_0_1.ADAPT_TAG
end

function var_0_1.Log(arg_24_0, arg_24_1)
	if not var_0_1.DEBUG then
		return
	end

	originalPrint(arg_24_1)
end
