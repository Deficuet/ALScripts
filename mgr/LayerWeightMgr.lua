pg = pg or {}

local var_0_0 = pg

var_0_0.LayerWeightMgr = singletonClass("LayerWeightMgr")

local var_0_1 = var_0_0.LayerWeightMgr

var_0_1.DEBUG = false
var_0_1.ADAPT_TAG = "(Adapt)"
var_0_1.RECYCLE_ADAPT_TAG = "recycleAdapt"

function var_0_1.Init(arg_1_0, arg_1_1)
	arg_1_0.baseParent = tf(GameObject.Find("UICamera/Canvas"))
	arg_1_0.uiMain = arg_1_0.baseParent:Find("UIMain")
	arg_1_0.uiOrigin = tf(instantiate(arg_1_0.uiMain, arg_1_0.baseParent, false))
	arg_1_0.uiOrigin.name = "UIOrigin"

	local var_1_0 = GetOrAddComponent(arg_1_0.uiOrigin, typeof(Canvas))

	var_1_0.overrideSorting = true
	var_1_0.sortingOrder = 200

	GetOrAddComponent(arg_1_0.uiOrigin, typeof(GraphicRaycaster))

	arg_1_0.lvCamera = GetOrAddComponent(GameObject.Find("LevelCamera"), typeof(Camera))
	arg_1_0.lvParent = tf(arg_1_0.lvCamera):Find("Canvas")
	arg_1_0.lvOrigin = tf(instantiate(arg_1_0.uiOrigin, arg_1_0.lvParent, false))
	arg_1_0.lvOrigin.name = "LevelOrigin"
	GetOrAddComponent(arg_1_0.lvOrigin, typeof(Canvas)).sortingOrder = 5000
	arg_1_0.adaptPool = {}

	local var_1_1 = rtf(GameObject.Find("OverlayCamera/Overlay"))

	arg_1_0.OverlayMain = var_1_1:Find("UIMain")
	arg_1_0.OverlayAdapt = var_1_1:Find("UIAdapt")
	arg_1_0.OverlayTop = var_1_1:Find("UIOverlay")
	arg_1_0.groupWeightDic = setmetatable({}, {
		__index = function(arg_2_0, arg_2_1)
			if arg_2_1 == LayerWeightConst.GROUP_TOP then
				return arg_2_0[arg_1_0.groupStack[#arg_1_0.groupStack]] + 1
			else
				return 0
			end
		end
	})
	arg_1_0.groupStack = {}
	arg_1_0.storeUIs = {}

	existCall(arg_1_1)
end

function var_0_1.RegisterGroupWeight(arg_3_0, arg_3_1)
	if arg_3_0.groupWeightDic[arg_3_1] > 0 then
		return
	end

	arg_3_0.groupWeightDic[arg_3_1] = arg_3_0.groupWeightDic[LayerWeightConst.GROUP_TOP]

	table.insert(arg_3_0.groupStack, arg_3_1)
end

function var_0_1.RemoveGroupWeight(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0.storeUIs) do
		if iter_4_1.groupName == arg_4_1 then
			return
		end
	end

	arg_4_0.groupWeightDic[arg_4_1] = nil

	table.removebyvalue(arg_4_0.groupStack, arg_4_1)
end

function var_0_1.CreateRefreshHandler(arg_5_0)
	if not arg_5_0.luHandle then
		arg_5_0.luHandle = LateUpdateBeat:CreateListener(arg_5_0.Refresh, arg_5_0)

		LateUpdateBeat:AddListener(arg_5_0.luHandle)
	end
end

function var_0_1.ClearRefreshHandler(arg_6_0)
	if arg_6_0.luHandle then
		LateUpdateBeat:RemoveListener(arg_6_0.luHandle)

		arg_6_0.luHandle = nil
	end
end

function var_0_1.Refresh(arg_7_0)
	arg_7_0:LayerSortHandler()
	arg_7_0:ClearRefreshHandler()
end

function var_0_1.Add2Overlay(arg_8_0, arg_8_1, arg_8_2)
	arg_8_2.ui = arg_8_1
	arg_8_2.type = arg_8_2.type
	arg_8_2.pbList = arg_8_2.pbList or {}
	arg_8_2.overlayType = arg_8_2.overlayType or LayerWeightConst.OVERLAY_UI_MAIN
	arg_8_2.groupName = arg_8_2.groupName or LayerWeightConst.GROUP_TOP
	arg_8_2.groupDelta = arg_8_2.groupDelta or 0

	local var_8_0 = arg_8_0.lvCamera.enabled and {
		var_0_0.UIMgr.CameraLevel
	} or {
		var_0_0.UIMgr.CameraUI
	}

	arg_8_2.blurCamList = arg_8_2.blurCamList or var_8_0

	local var_8_1 = arg_8_2.type

	assert(var_8_1 and LayerWeightConst.TYPE_DIC[var_8_1])
	arg_8_0:Log(string.format("ui:%s 加入了ui层级管理\n%s", arg_8_1.name, PrintTable(arg_8_2)))

	local var_8_2 = arg_8_0:DelList(arg_8_1)

	arg_8_0:ClearBlurData(var_8_2)
	table.insert(arg_8_0.storeUIs, arg_8_2)
	arg_8_0:CreateRefreshHandler()

	if arg_8_2.force then
		arg_8_0:Refresh()
	end
end

function var_0_1.DelFromOverlay(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0:Log(string.format("ui:%s 退出了ui层级管理", arg_9_1.name))

	local var_9_0 = arg_9_0:DelList(arg_9_1)

	if var_9_0 ~= nil then
		local var_9_1 = var_9_0.ui

		if not arg_9_0:GetAdaptObjFromUI(var_9_1) then
			local var_9_2 = var_9_1
		end

		arg_9_0:CheckRecycleAdaptObj(var_9_1, arg_9_2)
		arg_9_0:ClearBlurData(var_9_0)
	end

	arg_9_0:CreateRefreshHandler()
end

function var_0_1.DelList(arg_10_0, arg_10_1)
	local var_10_0

	for iter_10_0 = #arg_10_0.storeUIs, 1, -1 do
		if arg_10_0.storeUIs[iter_10_0].ui == arg_10_1 then
			var_10_0 = arg_10_0.storeUIs[iter_10_0]

			table.remove(arg_10_0.storeUIs, iter_10_0)

			break
		end
	end

	return var_10_0
end

function var_0_1.ClearBlurData(arg_11_0, arg_11_1)
	if arg_11_1 == nil then
		return
	end

	if arg_11_1.pbList ~= nil then
		var_0_0.UIMgr.GetInstance():RevertPBMaterial(arg_11_1.pbList)
	end

	local var_11_0 = arg_11_1.lockGlobalBlur

	if var_11_0 then
		local var_11_1 = arg_11_1.blurCamList

		for iter_11_0, iter_11_1 in ipairs({
			var_0_0.UIMgr.CameraUI,
			var_0_0.UIMgr.CameraLevel
		}) do
			if table.contains(var_11_1, iter_11_1) then
				var_0_0.UIMgr.GetInstance():UnblurCamera(iter_11_1, var_11_0)
			end
		end
	end
end

function var_0_1.SortStoreUIs(arg_12_0)
	arg_12_0:Log("-----------------------------------------")
	mergeSort(arg_12_0.storeUIs, CompareFuncs({
		function(arg_13_0)
			return arg_12_0.groupWeightDic[arg_13_0.groupName]
		end,
		function(arg_14_0)
			return arg_14_0.groupDelta
		end
	}, true))
	arg_12_0:Log(PrintTable(arg_12_0.storeUIs))
	arg_12_0:Log("-----------------------------------------")
end

function var_0_1.LayerSortHandler(arg_15_0)
	arg_15_0:SortStoreUIs()

	local var_15_0
	local var_15_1
	local var_15_2 = {}
	local var_15_3 = false
	local var_15_4 = false
	local var_15_5 = false
	local var_15_6 = {}

	for iter_15_0 = #arg_15_0.storeUIs, 1, -1 do
		local var_15_7 = arg_15_0.storeUIs[iter_15_0]
		local var_15_8 = var_15_7.ui
		local var_15_9 = var_15_7.parent
		local var_15_10 = var_15_7.type
		local var_15_11 = var_15_7.overlayType
		local var_15_12 = var_15_7.groupName
		local var_15_13 = var_15_7.globalBlur
		local var_15_14 = var_15_7.lockGlobalBlur
		local var_15_15 = var_15_7.staticBlur
		local var_15_16 = var_15_7.blurCamList
		local var_15_17 = var_15_7.pbList
		local var_15_18 = var_15_7.stopTop

		var_15_1 = var_15_1 or var_15_12

		if not var_15_0 then
			if var_15_12 ~= var_15_1 then
				var_15_0 = iter_15_0 + 1
			elseif var_15_13 or var_15_18 or var_15_1 == LayerWeightConst.GROUP_TOP then
				var_15_0 = iter_15_0
			end
		end

		local var_15_19 = not var_15_0 or var_15_0 <= iter_15_0

		if var_15_19 then
			var_15_3 = var_15_3 or var_15_13
			var_15_4 = var_15_4 or var_15_14
			var_15_5 = var_15_5 or var_15_15

			table.insertto(var_15_6, var_15_16)
		end

		if #var_15_17 > 0 then
			if var_15_19 then
				table.insertto(var_15_2, var_15_17)
			else
				var_0_0.UIMgr.GetInstance():RevertPBMaterial(var_15_17)
			end
		end

		local var_15_20 = var_15_8

		if var_15_11 == LayerWeightConst.OVERLAY_UI_ADAPT then
			var_15_20 = arg_15_0:GetAdaptObjFromUI(var_15_8) or arg_15_0:GetAdaptObj(var_15_8)
		end

		local var_15_21 = switch(var_15_10, {
			[LayerWeightConst.UI_TYPE_SUB] = function()
				if var_15_19 then
					if var_15_9 then
						arg_15_0:SetSpecificParent(var_15_20, var_15_9)
					else
						return arg_15_0.OverlayMain
					end
				else
					return arg_15_0.lvCamera.enabled and arg_15_0.lvOrigin or arg_15_0.uiOrigin
				end
			end,
			[LayerWeightConst.UI_TYPE_SYSTEM] = function()
				return arg_15_0.uiMain
			end
		}, function()
			assert(false)
		end)

		if var_15_21 then
			arg_15_0:SetSpecificParent(var_15_20, var_15_21, 0)
		end
	end

	if not var_15_3 and #var_15_2 > 0 then
		var_0_0.UIMgr.GetInstance():PartialBlurTfs(var_15_2)
	else
		var_0_0.UIMgr.GetInstance():ShutdownPartialBlur()
	end

	if var_15_3 then
		for iter_15_1, iter_15_2 in ipairs({
			var_0_0.UIMgr.CameraUI,
			var_0_0.UIMgr.CameraLevel
		}) do
			if table.contains(var_15_6, iter_15_2) then
				var_0_0.UIMgr.GetInstance():BlurCamera(iter_15_2, var_15_5, var_15_4)
			else
				var_0_0.UIMgr.GetInstance():UnblurCamera(iter_15_2)
			end
		end
	else
		for iter_15_3, iter_15_4 in ipairs({
			var_0_0.UIMgr.CameraUI,
			var_0_0.UIMgr.CameraLevel
		}) do
			var_0_0.UIMgr.GetInstance():UnblurCamera(iter_15_4)
		end
	end
end

function var_0_1.SetSpecificParent(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	SetParent(arg_19_1, arg_19_2, false)

	if arg_19_3 then
		arg_19_1:SetSiblingIndex(arg_19_3)
	end
end

function var_0_1.GetAdaptObj(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0:GetAdatpObjName(arg_20_1)
	local var_20_1

	if #arg_20_0.adaptPool > 0 then
		var_20_1 = table.remove(arg_20_0.adaptPool, #arg_20_0.adaptPool)
		var_20_1.name = var_20_0
	else
		var_20_1 = GameObject.New(var_20_0, typeof(RectTransform), typeof(NotchAdapt)).transform
	end

	var_20_1.anchorMin = Vector2.zero
	var_20_1.anchorMax = Vector2.one
	var_20_1.pivot = Vector2(0.5, 0.5)
	var_20_1.offsetMax = Vector2.zero
	var_20_1.offsetMin = Vector2.zero
	var_20_1.localPosition = Vector3.zero

	SetActive(var_20_1, true)
	SetParent(arg_20_1, var_20_1, false)

	return var_20_1
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
