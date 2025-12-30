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
		arg_5_0:Log("CreateRefreshHandler")
		NotchAdapt.AdjustUI()

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

	if not arg_8_2.blurCamList then
		if arg_8_2.globalBlur or #arg_8_2.pbList > 0 then
			arg_8_2.blurCamList = {
				var_0_0.UIMgr.CameraLevel,
				var_0_0.UIMgr.CameraUI
			}
		else
			arg_8_2.blurCamList = {}
		end
	end

	local var_8_0 = arg_8_2.type

	assert(var_8_0 and LayerWeightConst.TYPE_DIC[var_8_0])
	arg_8_0:Log(string.format("ui:%s 加入了ui层级管理\n%s", arg_8_1.name, PrintTable(arg_8_2)))

	local var_8_1 = arg_8_0:DelList(arg_8_1)

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

function var_0_1.SortStoreUIs(arg_11_0)
	arg_11_0:Log("-----------------------------------------")
	mergeSort(arg_11_0.storeUIs, CompareFuncs({
		function(arg_12_0)
			return arg_11_0.groupWeightDic[arg_12_0.groupName]
		end,
		function(arg_13_0)
			return arg_13_0.groupDelta
		end
	}, true))
	arg_11_0:Log(PrintTable(arg_11_0.storeUIs))
	arg_11_0:Log("-----------------------------------------")
end

function var_0_1.LayerSortHandler(arg_14_0)
	arg_14_0:SortStoreUIs()

	arg_14_0.indexDic = {}

	local var_14_0
	local var_14_1
	local var_14_2 = {}
	local var_14_3 = false
	local var_14_4 = false
	local var_14_5 = false
	local var_14_6 = {}

	for iter_14_0 = #arg_14_0.storeUIs, 1, -1 do
		local var_14_7 = arg_14_0.storeUIs[iter_14_0]
		local var_14_8 = var_14_7.ui
		local var_14_9 = var_14_7.parent
		local var_14_10 = var_14_7.type
		local var_14_11 = var_14_7.overlayType
		local var_14_12 = var_14_7.groupName
		local var_14_13 = var_14_7.globalBlur
		local var_14_14 = var_14_7.lockGlobalBlur
		local var_14_15 = var_14_7.staticBlur
		local var_14_16 = var_14_7.blurCamList
		local var_14_17 = var_14_7.pbList
		local var_14_18 = var_14_7.stopTop

		var_14_1 = var_14_1 or var_14_12

		if not var_14_0 then
			if var_14_12 ~= var_14_1 then
				var_14_0 = iter_14_0 + 1
			elseif var_14_13 or var_14_18 or var_14_1 == LayerWeightConst.GROUP_TOP then
				var_14_0 = iter_14_0
			end
		end

		local var_14_19 = not var_14_0 or var_14_0 <= iter_14_0

		var_14_4 = var_14_4 or var_14_14

		if var_14_19 then
			var_14_3 = var_14_3 or var_14_13
			var_14_5 = var_14_5 or var_14_15

			table.insertto(var_14_6, var_14_16)

			if #var_14_17 > 0 then
				table.insertto(var_14_2, var_14_17)
			end
		end

		local var_14_20 = var_14_8

		if var_14_11 == LayerWeightConst.OVERLAY_UI_ADAPT then
			var_14_20 = arg_14_0:GetAdaptObjFromUI(var_14_8) or arg_14_0:GetAdaptObj(var_14_8)
		end

		local var_14_21 = switch(var_14_10, {
			[LayerWeightConst.UI_TYPE_SUB] = function()
				if var_14_19 then
					if var_14_9 then
						arg_14_0:SetSpecificParent(var_14_20, var_14_9)
					else
						return arg_14_0.OverlayMain
					end
				else
					return arg_14_0.lvCamera.enabled and arg_14_0.lvOrigin or arg_14_0.uiOrigin
				end
			end,
			[LayerWeightConst.UI_TYPE_SYSTEM] = function()
				return arg_14_0.uiMain
			end
		}, function()
			assert(false)
		end)

		if var_14_21 then
			arg_14_0:SetSpecificParent(var_14_20, var_14_21, 0)
		end
	end

	arg_14_0:SequentizationUIIndex()

	if not var_14_4 then
		var_0_0.UIMgr.GetInstance():SetCameraBlurLock(var_14_4)
	end

	if not var_14_3 and #var_14_2 > 0 then
		var_0_0.UIMgr.GetInstance():PartialBlurTfs(var_14_2)
	else
		var_0_0.UIMgr.GetInstance():ShutdownPartialBlur()
	end

	for iter_14_1, iter_14_2 in ipairs({
		var_0_0.UIMgr.CameraUI,
		var_0_0.UIMgr.CameraLevel
	}) do
		if var_14_3 and table.contains(var_14_6, iter_14_2) then
			var_0_0.UIMgr.GetInstance():BlurCamera(iter_14_2, var_14_5)
		else
			var_0_0.UIMgr.GetInstance():UnblurCamera(iter_14_2)
		end
	end

	if var_14_4 then
		var_0_0.UIMgr.GetInstance():SetCameraBlurLock(var_14_4)
	end
end

function var_0_1.SetSpecificParent(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if arg_18_3 then
		arg_18_0.indexDic[arg_18_2] = arg_18_0.indexDic[arg_18_2] or {}

		table.insert(arg_18_0.indexDic[arg_18_2], 1, arg_18_1)
	else
		SetParent(arg_18_1, arg_18_2, false)
	end
end

function var_0_1.SequentizationUIIndex(arg_19_0)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.indexDic) do
		for iter_19_2, iter_19_3 in ipairs(iter_19_1) do
			SetParent(iter_19_3, iter_19_0, false)

			if iter_19_3:GetSiblingIndex() ~= iter_19_2 - 1 then
				iter_19_3:SetSiblingIndex(iter_19_2 - 1)
			end
		end
	end

	arg_19_0.indexDic = nil
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
