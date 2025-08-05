local var_0_0 = class("AtelierFormulaDetailYumiaView", import("view.activity.Atelier.base.AtelierFormulaDetailView"))
local var_0_1 = import("Mgr.Pool.PoolPlural")

function var_0_0.InitCustom(arg_1_0)
	arg_1_0.atelierFormulaOverlayView = AtelierFormulaOverlayYumiaView.New(arg_1_0.layerFormulaDescriptionPanel, arg_1_0._parentClass)
	arg_1_0.compositePanel = arg_1_0:findTF("Overlay/compositePanel")
	arg_1_0.tipsText = arg_1_0:findTF("tips/Text")

	setText(arg_1_0:findTF("Overlay/compositePanel/backBtn/Text"), i18n("yumia_atelier_tip9"))
	setText(arg_1_0:findTF("Overlay/compositePanel/CompositeBtn/Text"), i18n("yumia_atelier_tip18"))
	setText(arg_1_0:findTF("Overlay/compositePanel/autoBtn/Text"), i18n("yumia_atelier_tip23"))

	arg_1_0.lineGoList = {
		arg_1_0:findTF("ScrollView/Content/lineGo1"),
		arg_1_0:findTF("ScrollView/Content/lineGo2"),
		arg_1_0:findTF("ScrollView/Content/lineGo3")
	}

	SetComponentEnabled(arg_1_0._parentClass.scrollView, typeof(ScrollRect), false)
end

function var_0_0.didEnter(arg_2_0)
	arg_2_0.atelierFormulaOverlayView:didEnter()
	onButton(arg_2_0, arg_2_0:findTF("Overlay/compositePanel/CompositeBtn"), function()
		arg_2_0:OnClickComposite()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0:findTF("Overlay/compositePanel/backBtn"), function()
		arg_2_0._parentClass:OnClickFormulaBack()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0:findTF("Overlay/compositePanel/autoBtn"), function()
		arg_2_0:OnClickAutoFill()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_6_0, arg_6_1)
	setActive(arg_6_0._go, true)

	arg_6_0.unLockLayerIndex = 1

	if not arg_6_0.nodePools then
		arg_6_0.nodePools = {
			core = var_0_1.New(arg_6_0:findTF("coreNode").gameObject, 100),
			material = var_0_1.New(arg_6_0:findTF("materialNode").gameObject, 100)
		}

		table.Foreach(arg_6_0.nodePools, function(arg_7_0, arg_7_1)
			setActive(arg_7_1.prefab, false)
		end)
	end

	arg_6_0.pluralRoot = arg_6_0.pluralRoot or pg.PoolMgr.GetInstance().root
	arg_6_0.nodeList = arg_6_0.nodeList or {}

	_.each(arg_6_0.nodeList, function(arg_8_0)
		local var_8_0 = arg_6_0.nodePools[arg_8_0.GoType]
		local var_8_1 = tf(arg_8_0.GO)

		arg_6_0._parentClass.loader:ClearRequest(var_8_1)

		if not var_8_0:Enqueue(go(arg_8_0.GO)) then
			setParent(go(arg_8_0.GO), arg_6_0.pluralRoot)
			setActive(go(arg_8_0.GO), false)
		end
	end)
	table.clean(arg_6_0.nodeList)
	setAnchoredPosition(arg_6_0.viewContent, Vector2.zero)

	local var_6_0 = 0

	_.each(arg_6_1:GetCircleList(), function(arg_9_0)
		local var_9_0 = AtelierFormulaCircle.New({
			configId = arg_9_0
		})
		local var_9_1
		local var_9_2 = var_9_0:GetNeighbors()[1] == 1 and "core" or "material"
		local var_9_3 = arg_6_0.nodePools[var_9_2]:Dequeue()

		var_9_3.name = arg_9_0

		setActive(var_9_3, true)
		setParent(tf(var_9_3), arg_6_0.viewContent)

		var_6_0 = var_6_0 + 1

		local var_9_4 = {
			Change = true,
			ID = var_6_0,
			Data = var_9_0,
			GO = var_9_3,
			GoType = var_9_2
		}

		table.insert(arg_6_0.nodeList, var_9_4)

		if var_9_0:GetNeighbors()[1] ~= 1 then
			arg_6_0:HideNodeLight(var_9_4)
		end

		setActive(arg_6_0:findTF("select", var_9_3), false)
	end)
	arg_6_0:InitNodeLayer()
	arg_6_0:SetCirclePanel()
	arg_6_0:UpdateFormulaDetail()
	arg_6_0:InitLine(arg_6_1)
	arg_6_0.atelierFormulaOverlayView:RefreshFormulaInfo(arg_6_1)
	arg_6_0:RefreshScrollViewPosition()
end

function var_0_0.UpdateNodeView(arg_10_0, arg_10_1)
	local var_10_0 = tf(arg_10_1.GO)
	local var_10_1 = arg_10_1.Data
	local var_10_2 = var_10_1:GetElementName()
	local var_10_3 = arg_10_0:IsLockNode(arg_10_1)

	setActive(arg_10_1.GO, not var_10_3)

	local var_10_4 = arg_10_1.Instance

	if table.contains(arg_10_0.nodeLayer[1], arg_10_1.ID) then
		-- block empty
	else
		local var_10_5 = var_10_1:GetType()

		if var_10_5 == AtelierFormulaCircle.TYPE.NONE then
			arg_10_0:RefreshElement(arg_10_1)
			arg_10_0:HideCategory(arg_10_1)
		elseif var_10_5 == AtelierFormulaCircle.TYPE.ELEMENT then
			arg_10_0:RefreshElement(arg_10_1)
			arg_10_0:HideCategory(arg_10_1)
		elseif var_10_5 == AtelierFormulaCircle.TYPE.CATEGORY then
			arg_10_0:RefreshElement(arg_10_1)
			arg_10_0:RefreshCategory(arg_10_1)
		elseif var_10_5 == AtelierFormulaCircle.TYPE.ELEMENT_CATEGORY then
			arg_10_0:RefreshElement(arg_10_1)
			arg_10_0:RefreshCategory(arg_10_1)
		end

		if var_10_4 == nil then
			arg_10_0:AddStarList(arg_10_1)
		end
	end

	onButton(arg_10_0, var_10_0, function()
		if var_10_3 then
			return
		end

		arg_10_0._parentClass:ShowMaterialSelectWindow(var_10_0, arg_10_1, arg_10_0.nodeList)
	end, SFX_PANEL)
end

function var_0_0.RefreshElement(arg_12_0, arg_12_1)
	local var_12_0 = tf(arg_12_1.GO)
	local var_12_1 = arg_12_1.Data
	local var_12_2 = var_12_1:GetProp()

	GetImageSpriteFromAtlasAsync("ui/ateliercommonyumiaui_atlas", "slot_" .. AtelierFormulaCircle.ELEMENT_NAME[var_12_2], arg_12_0:findTF("icon", var_12_0))

	local var_12_3 = arg_12_0:findTF("light", var_12_0)

	setImageColor(var_12_3, var_12_1:GetElementLightColor(instance))
end

function var_0_0.RefreshCategory(arg_13_0, arg_13_1)
	local var_13_0 = tf(arg_13_1.GO)
	local var_13_1 = arg_13_1.Data:GetCategory()

	if var_13_1 ~= 0 then
		GetImageSpriteFromAtlasAsync("ui/ateliercommonyumiaui_atlas", "category" .. var_13_1, arg_13_0:findTF("categoryBg/category", var_13_0))
	end

	setActive(arg_13_0:findTF("categoryBg", var_13_0), true)
end

function var_0_0.HideCategory(arg_14_0, arg_14_1)
	local var_14_0 = tf(arg_14_1.GO)

	setActive(arg_14_0:findTF("categoryBg", var_14_0), false)
end

function var_0_0.DisPlayUnlockEffect(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.unLockLayerIndex = arg_15_1

	arg_15_0:RefreshLine()

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.nodeLayer[arg_15_1]) do
		local var_15_0 = arg_15_0.nodeList[iter_15_1]

		arg_15_0:UpdateNodeView(var_15_0)
	end

	existCall(arg_15_2)
end

function var_0_0.FillNodeAndPlayAnim(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	arg_16_0._parentClass:LoadingOn()

	arg_16_1.ChangeInstance = arg_16_1.ChangeInstance or tobool(arg_16_1.Instance) ~= tobool(arg_16_2)
	arg_16_1.Instance = arg_16_2
	arg_16_1.Change = true

	local var_16_0 = {}
	local var_16_1 = {}

	seriesAsync({
		function(arg_17_0)
			table.ParallelIpairsAsync({
				"ui/laisha_ui_wupinzhiru",
				"ui/laisha_ui_baoshi"
			}, function(arg_18_0, arg_18_1, arg_18_2)
				var_16_0[arg_18_0] = arg_16_0._parentClass.loader:GetPrefab(arg_18_1, "", function(arg_19_0)
					setParent(arg_19_0, tf(arg_16_1.GO))
					setAnchoredPosition(arg_19_0, Vector2.zero)

					var_16_1[arg_18_0] = arg_19_0

					setActive(arg_19_0, false)
					arg_18_2()
				end)
			end, arg_17_0)
		end,
		function(arg_20_0)
			setActive(var_16_1[1], true)
			arg_16_0:PlayStarAnimation(arg_16_1)
			arg_16_0._parentClass:managedTween(LeanTween.delayedCall, function()
				if not arg_16_4 then
					for iter_21_0, iter_21_1 in ipairs(arg_16_0.nodeLayer[arg_16_0.unLockLayerIndex]) do
						arg_16_0:UpdateNodeView(arg_16_0.nodeList[iter_21_1])
					end
				else
					arg_16_0:UpdateNodeView(arg_16_1)
				end

				arg_16_0._parentClass:PlaySoundEffect(arg_16_0._parentClass.soundStr.formulaDetailFill)
				arg_20_0()
			end, 0.2, nil)
		end,
		function(arg_22_0)
			setActive(var_16_1[2], true)
			arg_16_0._parentClass:managedTween(LeanTween.delayedCall, function()
				arg_22_0()
			end, 0.5, nil)
		end,
		function(arg_24_0)
			arg_16_0._parentClass.loader:ClearRequest(var_16_0[1])
			arg_16_0._parentClass.loader:ClearRequest(var_16_0[2])
			arg_16_0._parentClass:LoadingOff()
			arg_16_0:RefreshBtn()
			existCall(arg_16_3)
		end
	})
end

function var_0_0.InitLine(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1:GetShapeID()

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.lineGoList) do
		setActive(iter_25_1, iter_25_0 == var_25_0)

		if iter_25_0 == var_25_0 then
			arg_25_0.lineGo = iter_25_1
		end
	end

	arg_25_0:RefreshLine()
end

function var_0_0.RefreshLine(arg_26_0)
	for iter_26_0 = 0, arg_26_0.lineGo.childCount - 1 do
		setActive(arg_26_0.lineGo:GetChild(iter_26_0), iter_26_0 < arg_26_0.unLockLayerIndex - 1)
	end
end

function var_0_0.RefreshBtn(arg_27_0)
	return
end

function var_0_0.RefreshScrollViewPosition(arg_28_0)
	if arg_28_0.nodeList[1].Instance == nil then
		setAnchoredPosition(arg_28_0._parentClass.scrollView, Vector2.zero)
		setAnchoredPosition(arg_28_0.viewContent, Vector2.zero)
		arg_28_0.atelierFormulaOverlayView:Show(true)
		arg_28_0._parentClass:ShowTopBar(false)
		arg_28_0:HideCompositePanel()
		setText(arg_28_0.tipsText, i18n("yumia_atelier_tip7"))
	else
		arg_28_0:HideDescriptionView()
		arg_28_0:ShowCompositePanel()
		setText(arg_28_0.tipsText, i18n("yumia_atelier_tip17"))
	end
end

function var_0_0.HideDescriptionView(arg_29_0)
	arg_29_0.atelierFormulaOverlayView:Show(false)
	arg_29_0._parentClass:ShowTopBar(true)
	setAnchoredPosition(arg_29_0._parentClass.scrollView, Vector2(-397, 0))
end

function var_0_0.ShowCompositePanel(arg_30_0)
	setActive(arg_30_0.compositePanel, true)
end

function var_0_0.HideCompositePanel(arg_31_0)
	setActive(arg_31_0.compositePanel, false)
end

function var_0_0.AddStarList(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_1.Data
	local var_32_1 = var_32_0:GetStarList()
	local var_32_2 = arg_32_0:findTF("starContant", arg_32_1.GO)

	arg_32_0:HideStarList(arg_32_1)

	if type(var_32_1) ~= "table" then
		return
	end

	for iter_32_0, iter_32_1 in ipairs(var_32_0:GetStarList()) do
		local var_32_3 = iter_32_0 <= var_32_2.childCount and var_32_2:GetChild(iter_32_0 - 1) or cloneTplTo(var_32_2:GetChild(0), var_32_2)

		setActive(var_32_3, true)
		setAnchoredPosition(var_32_3, Vector2(unpack(iter_32_1)))
	end
end

function var_0_0.PlayStarAnimation(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_1.Data:GetStarList()

	arg_33_0:ShowNodeLight(arg_33_1)

	if type(var_33_0) ~= "table" then
		return
	end

	local var_33_1 = arg_33_0:findTF("starContant", arg_33_1.GO)

	for iter_33_0 = 0, var_33_1.childCount - 1 do
		arg_33_0._parentClass:managedTween(LeanTween.moveLocal, nil, var_33_1:GetChild(iter_33_0).gameObject, Vector3.zero, 0.5)
	end

	arg_33_0._parentClass:managedTween(LeanTween.delayedCall, function()
		arg_33_0:HideStarList(arg_33_1)
	end, 0.5, nil)
end

function var_0_0.HideStarList(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0:findTF("starContant", arg_35_1.GO)

	for iter_35_0 = 0, var_35_0.childCount - 1 do
		setActive(var_35_0:GetChild(iter_35_0), false)
	end
end

function var_0_0.ShowNodeLight(arg_36_0, arg_36_1)
	if arg_36_1.Data:GetNeighbors()[1] == 1 then
		return
	end

	setActive(arg_36_0:findTF("light", arg_36_1.GO), true)
end

function var_0_0.HideNodeLight(arg_37_0, arg_37_1)
	setActive(arg_37_0:findTF("light", arg_37_1.GO), false)
end

function var_0_0.InitStr(arg_38_0)
	arg_38_0.ringEffect = {
		[AtelierFormulaCircle.ELEMENT_TYPE.PYRO] = "laisha_ui_huo",
		[AtelierFormulaCircle.ELEMENT_TYPE.CRYO] = "laisha_ui_bing",
		[AtelierFormulaCircle.ELEMENT_TYPE.ELECTRO] = "laisha_ui_lei",
		[AtelierFormulaCircle.ELEMENT_TYPE.ANEMO] = "laisha_ui_feng",
		[AtelierFormulaCircle.ELEMENT_TYPE.SAIREN] = "laisha_ui_sairen"
	}
	arg_38_0.deployEffect = "laisha_ui_wupinshanguang"
	arg_38_0.unlockEffect = "laisha_ui_jiesuo"
	arg_38_0.circleTypeList = {
		AtelierFormulaCircle.TYPE.ELEMENT_CATEGORY,
		AtelierFormulaCircle.TYPE.CATEGORY,
		AtelierFormulaCircle.TYPE.ELEMENT,
		AtelierFormulaCircle.TYPE.NONE
	}
end

function var_0_0.InitNodeLayer(arg_39_0)
	arg_39_0.nodeLayer = {
		{}
	}

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.nodeList) do
		local var_39_0 = iter_39_1.Data:GetNeighbors()

		arg_39_0.nodeLayer[var_39_0[1]] = arg_39_0.nodeLayer[var_39_0[1]] or {}

		table.insert(arg_39_0.nodeLayer[var_39_0[1]], iter_39_0)
	end
end

function var_0_0.SetCirclePanel(arg_40_0)
	local var_40_0 = 280

	arg_40_0:SetCirclePosition()
	setSizeDelta(arg_40_0.viewContent, (arg_40_0.viewMax + Vector2.New(var_40_0, var_40_0)) * 2)
end

function var_0_0.SetCirclePosition(arg_41_0)
	local var_41_0 = 0
	local var_41_1 = 0

	_.each(arg_41_0.nodeList, function(arg_42_0)
		local var_42_0 = arg_42_0.Data:GetNeighbors()
		local var_42_1 = Vector2(var_42_0[2], var_42_0[3])

		setAnchoredPosition(arg_42_0.GO, var_42_1)

		var_41_0 = math.max(var_41_0, math.abs(var_42_0[2]))
		var_41_1 = math.max(var_41_1, math.abs(var_42_0[3]))
	end)

	arg_41_0.viewMax = Vector2(var_41_0, var_41_1)
end

return var_0_0
