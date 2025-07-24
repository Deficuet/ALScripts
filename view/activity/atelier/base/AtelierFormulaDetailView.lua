local var_0_0 = class("AtelierFormulaDetailView", import("view.base.BasePanel"))
local var_0_1 = import("Mgr.Pool.PoolPlural")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject
	arg_1_0._tf = arg_1_1
	arg_1_0._parentClass = arg_1_2
	arg_1_0.bundleName = arg_1_2.bundleName
	arg_1_0.commonBundleName = arg_1_2.commonBundleName

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
	arg_1_0:InitStr()

	arg_1_0.layerFormulaDescriptionPanel = arg_1_0:findTF("Overlay/Description")

	arg_1_0:InitCustom()
end

function var_0_0.InitCustom(arg_2_0)
	arg_2_0.atelierFormulaOverlayView = AtelierFormulaOverlayView.New(arg_2_0.layerFormulaDescriptionPanel, arg_2_0._parentClass)
end

function var_0_0.Init(arg_3_0)
	arg_3_0.viewContent = arg_3_0:findTF("Content", arg_3_0._parentClass.scrollView)

	setActive(arg_3_0._go, false)
end

function var_0_0.SetContextData(arg_4_0, arg_4_1)
	arg_4_0.contextData = arg_4_1

	arg_4_0.atelierFormulaOverlayView:SetContextData(arg_4_1)
end

function var_0_0.SetActivity(arg_5_0, arg_5_1)
	arg_5_0.activity = arg_5_1

	arg_5_0.atelierFormulaOverlayView:SetActivity(arg_5_1)
end

function var_0_0.didEnter(arg_6_0)
	onButton(arg_6_0, arg_6_0:findTF("Composite"), function()
		arg_6_0:OnClickComposite()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0:findTF("AutoFill"), function()
		arg_6_0:OnClickAutoFill()
	end, SFX_PANEL)
	arg_6_0.atelierFormulaOverlayView:didEnter()
end

function var_0_0.Show(arg_9_0, arg_9_1)
	setActive(arg_9_0._go, true)
	arg_9_0.atelierFormulaOverlayView:RefreshFormulaInfo(arg_9_1)

	arg_9_0.unLockLayerIndex = 1

	if not arg_9_0.nodePools then
		arg_9_0.nodePools = {
			circle = var_0_1.New(arg_9_0:findTF("CircleNode").gameObject, 100),
			hexagon = var_0_1.New(arg_9_0:findTF("HexagonNode").gameObject, 100),
			anyHexagon = var_0_1.New(arg_9_0:findTF("AnyHexagonNode").gameObject, 100),
			doubleHexagon = var_0_1.New(arg_9_0:findTF("DoubleHexagonNode").gameObject, 100)
		}

		table.Foreach(arg_9_0.nodePools, function(arg_10_0, arg_10_1)
			setActive(arg_10_1.prefab, false)
		end)
	end

	arg_9_0.pluralRoot = arg_9_0.pluralRoot or pg.PoolMgr.GetInstance().root
	arg_9_0.nodeList = arg_9_0.nodeList or {}

	_.each(arg_9_0.nodeList, function(arg_11_0)
		local var_11_0 = arg_9_0.nodePools[arg_9_0.poolNames[arg_11_0.Data:GetType()]]
		local var_11_1 = tf(arg_11_0.GO)

		SetComponentEnabled(arg_9_0:findTF("Item", var_11_1), typeof(Image), false)
		arg_9_0._parentClass.loader:ClearRequest(arg_9_0:findTF("Ring", var_11_1))
		arg_9_0:CleanNodeLinks(arg_11_0)
		arg_9_0._parentClass.loader:ClearRequest(var_11_1)

		if not var_11_0:Enqueue(go(arg_11_0.GO)) then
			setParent(go(arg_11_0.GO), arg_9_0.pluralRoot)
			setActive(go(arg_11_0.GO), false)
		end
	end)
	table.clean(arg_9_0.nodeList)
	setAnchoredPosition(arg_9_0.viewContent, Vector2.zero)

	local var_9_0 = 0

	_.each(arg_9_1:GetCircleList(), function(arg_12_0)
		local var_12_0 = AtelierFormulaCircle.New({
			configId = arg_12_0
		})
		local var_12_1 = arg_9_0.nodePools[arg_9_0.poolNames[var_12_0:GetType()]]:Dequeue()

		var_12_1.name = arg_12_0

		setActive(var_12_1, true)
		setParent(tf(var_12_1), arg_9_0.viewContent)

		var_9_0 = var_9_0 + 1

		local var_12_2 = {
			Change = true,
			ID = var_9_0,
			Data = var_12_0,
			GO = var_12_1
		}

		table.insert(arg_9_0.nodeList, var_12_2)
	end)
	arg_9_0:InitNodeLayer()
	arg_9_0:SetCirclePanel()
	arg_9_0:UpdateFormulaDetail()
end

function var_0_0.OnClickComposite(arg_13_0)
	if not _.all(arg_13_0.nodeList, function(arg_14_0)
		return arg_14_0.Instance
	end) then
		arg_13_0._parentClass:ShowMaterialsPreview()

		return
	end

	if not arg_13_0.activity:GetFormulas()[arg_13_0.contextData.formulaId]:IsAvaliable() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_composite_invalid"))

		return
	end

	arg_13_0._parentClass:ShowCompositeConfirmWindow(arg_13_0.nodeList)
end

function var_0_0.OnClickAutoFill(arg_15_0)
	arg_15_0.temps = {}

	local var_15_0 = {}

	_.each(arg_15_0.nodeList, function(arg_16_0)
		local var_16_0 = arg_16_0.Instance

		if var_16_0 then
			arg_15_0:UseMat(var_16_0)
		else
			table.insert(var_15_0, arg_16_0)
		end
	end)

	if #var_15_0 <= 0 then
		return
	end

	arg_15_0:AutoFillAllNode(var_15_0)
end

function var_0_0.UseMat(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.temps[arg_17_1:GetConfigID()] or Clone(arg_17_0.activity:GetItems()[arg_17_1:GetConfigID()])

	var_17_0.count = var_17_0.count - 1
	arg_17_0.temps[arg_17_1:GetConfigID()] = var_17_0
end

function var_0_0.FillNode(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = {}

	table.insert(var_18_0, function(arg_19_0)
		arg_18_0:FillNodeAndPlayAnim(arg_18_1, AtelierMaterial.New({
			count = 1,
			configId = arg_18_2:GetConfigID()
		}), arg_19_0, true)
	end)

	local var_18_1 = arg_18_0.unLockLayerIndex
	local var_18_2 = _.select(arg_18_0.nodeLayer[var_18_1], function(arg_20_0)
		return arg_18_0.nodeList[arg_20_0].Instance == nil
	end)

	if var_18_1 < #arg_18_0.nodeLayer and #var_18_2 == 1 and var_18_2[1] == arg_18_1.ID then
		table.insert(var_18_0, function(arg_21_0)
			arg_18_0:DisPlayUnlockEffect(var_18_1 + 1, arg_21_0)
		end)
	end

	table.insert(var_18_0, function(arg_22_0)
		arg_18_0:UpdateFormulaDetail()
		arg_22_0()
	end)
	seriesAsync(var_18_0)
end

function var_0_0.AutoFillAllNode(arg_23_0, arg_23_1)
	local var_23_0 = {}
	local var_23_1 = false

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.nodeLayer) do
		local var_23_2 = {}

		for iter_23_2, iter_23_3 in ipairs(iter_23_1) do
			local var_23_3 = arg_23_0.nodeList[iter_23_3]

			if var_23_3 and var_23_3.Instance ~= nil then
				-- block empty
			else
				table.insert(var_23_2, var_23_3)
			end
		end

		if #var_23_2 > 0 then
			local var_23_4 = false

			if iter_23_0 == 1 then
				for iter_23_4, iter_23_5 in ipairs(var_23_2) do
					local var_23_5 = iter_23_5.Data
					local var_23_6 = var_23_5:GetLimitItemID()

					if var_23_6 ~= 0 then
						local var_23_7 = arg_23_0.temps[var_23_6] or arg_23_0.activity:GetItems()[var_23_6]

						if var_23_7 and var_23_7.count > 0 then
							arg_23_0:UseMat(var_23_7)
							table.insert(var_23_0, function(arg_24_0)
								arg_23_0:FillNodeAndPlayAnim(iter_23_5, AtelierMaterial.New({
									count = 1,
									configId = var_23_6
								}), arg_24_0, true)
							end)
						else
							var_23_4 = true
						end
					else
						local var_23_8 = arg_23_0.activity:GetFormulas()[arg_23_0.contextData.formulaId]

						for iter_23_6, iter_23_7 in ipairs(arg_23_0.circleTypeList) do
							if var_23_5:GetType() == iter_23_7 then
								local var_23_9 = false

								for iter_23_8, iter_23_9 in ipairs(pg.activity_ryza_item.all) do
									local var_23_10 = arg_23_0.temps[iter_23_9] or arg_23_0.activity:GetItems()[iter_23_9]

									if var_23_10 and var_23_10.count > 0 and var_23_10:IsNormal() and var_23_5:CanUseMaterial(var_23_10, var_23_8, arg_23_0.contextData.versionIndex) then
										arg_23_0:UseMat(var_23_10)
										table.insert(var_23_0, function(arg_25_0)
											arg_23_0:FillNodeAndPlayAnim(iter_23_5, AtelierMaterial.New({
												count = 1,
												configId = var_23_10:GetConfigID()
											}), arg_25_0, true)
										end)

										var_23_9 = true

										break
									end
								end

								if not var_23_9 then
									var_23_4 = true
								end
							end
						end
					end
				end
			else
				table.insert(var_23_0, function(arg_26_0)
					arg_23_0._parentClass:PlaySoundEffect(arg_23_0._parentClass.soundStr.formulaDetail)
					arg_26_0()
				end)

				local var_23_11 = arg_23_0.activity:GetFormulas()[arg_23_0.contextData.formulaId]
				local var_23_12 = {}

				for iter_23_10, iter_23_11 in ipairs(arg_23_0.circleTypeList) do
					_.each(var_23_2, function(arg_27_0)
						local var_27_0 = arg_27_0.Data

						if var_27_0:GetType() == iter_23_11 then
							local var_27_1 = false

							for iter_27_0, iter_27_1 in ipairs(pg.activity_ryza_item.all) do
								local var_27_2 = arg_23_0.temps[iter_27_1] or arg_23_0.activity:GetItems()[iter_27_1]

								if var_27_2 and var_27_2.count > 0 and var_27_2:IsNormal() and var_27_0:CanUseMaterial(var_27_2, var_23_11, arg_23_0.contextData.versionIndex) then
									arg_23_0:UseMat(var_27_2)
									table.insert(var_23_12, function()
										arg_23_0:FillNodeAndPlayAnim(arg_27_0, AtelierMaterial.New({
											count = 1,
											configId = var_27_2:GetConfigID()
										}), true)
									end)

									var_27_1 = true

									break
								end
							end

							if not var_27_1 then
								var_23_4 = true
							end
						end
					end)
				end

				if #var_23_12 > 0 then
					table.insert(var_23_0, function(arg_29_0)
						for iter_29_0, iter_29_1 in ipairs(var_23_12) do
							iter_29_1()
						end

						arg_23_0._parentClass:managedTween(LeanTween.delayedCall, function()
							arg_29_0()
						end, 0.7, nil)
					end)
				end
			end

			if var_23_4 then
				var_23_1 = true

				table.insert(var_23_0, function(arg_31_0)
					pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_material_not_enough"))
					arg_31_0()
				end)

				break
			end

			if iter_23_0 < #arg_23_0.nodeLayer then
				table.insert(var_23_0, function(arg_32_0)
					arg_23_0:DisPlayUnlockEffect(iter_23_0 + 1, arg_32_0)
				end)
			end
		end
	end

	if #var_23_0 > 0 and (#var_23_0 ~= 1 or not var_23_1) then
		table.insert(var_23_0, 1, function(arg_33_0)
			arg_23_0._parentClass:DispalyChat(arg_23_0._parentClass.chatText.selectMaterial)
			arg_33_0()
		end)
	end

	seriesAsync(var_23_0)
end

function var_0_0.FillNodeAndPlayAnim(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	arg_34_0._parentClass:LoadingOn()

	arg_34_1.ChangeInstance = arg_34_1.ChangeInstance or tobool(arg_34_1.Instance) ~= tobool(arg_34_2)
	arg_34_1.Instance = arg_34_2
	arg_34_1.Change = true

	local var_34_0 = {}
	local var_34_1 = {}

	seriesAsync({
		function(arg_35_0)
			table.ParallelIpairsAsync({
				"ui/laisha_ui_wupinzhiru",
				"ui/laisha_ui_baoshi"
			}, function(arg_36_0, arg_36_1, arg_36_2)
				var_34_0[arg_36_0] = arg_34_0._parentClass.loader:GetPrefab(arg_36_1, "", function(arg_37_0)
					setParent(arg_37_0, tf(arg_34_1.GO))
					setAnchoredPosition(arg_37_0, Vector2.zero)

					var_34_1[arg_36_0] = arg_37_0

					setActive(arg_37_0, false)
					arg_36_2()
				end)
			end, arg_35_0)
		end,
		function(arg_38_0)
			setActive(var_34_1[1], true)
			arg_34_0._parentClass:managedTween(LeanTween.delayedCall, function()
				if not arg_34_4 then
					for iter_39_0, iter_39_1 in ipairs(arg_34_0.nodeLayer[arg_34_0.unLockLayerIndex]) do
						arg_34_0:UpdateNodeView(arg_34_0.nodeList[iter_39_1])
					end
				else
					arg_34_0:UpdateNodeView(arg_34_1)
				end

				arg_34_0._parentClass:PlaySoundEffect(arg_34_0._parentClass.soundStr.formulaDetailFill)
				arg_38_0()
			end, 0.2, nil)
		end,
		function(arg_40_0)
			setActive(var_34_1[2], true)
			arg_34_0._parentClass:managedTween(LeanTween.delayedCall, function()
				arg_40_0()
			end, 0.5, nil)
		end,
		function(arg_42_0)
			arg_34_0._parentClass.loader:ClearRequest(var_34_0[1])
			arg_34_0._parentClass.loader:ClearRequest(var_34_0[2])
			arg_34_0._parentClass:LoadingOff()
			arg_34_0:RefreshBtn()
			existCall(arg_34_3)
		end
	})
end

function var_0_0.DisPlayUnlockEffect(arg_43_0, arg_43_1, arg_43_2)
	arg_43_0._parentClass:LoadingOn()

	local var_43_0 = {}

	for iter_43_0, iter_43_1 in ipairs(arg_43_0.nodeLayer[arg_43_1]) do
		local var_43_1 = arg_43_0.nodeList[iter_43_1]
		local var_43_2 = arg_43_0._parentClass.loader:GetPrefab("ui/" .. arg_43_0.unlockEffect, "", function(arg_44_0)
			setParent(arg_44_0, tf(var_43_1.GO))
			setAnchoredPosition(arg_44_0, Vector2.zero)
		end)

		table.insert(var_43_0, var_43_2)
	end

	arg_43_0._parentClass:managedTween(LeanTween.delayedCall, function()
		arg_43_0._parentClass:PlaySoundEffect(arg_43_0._parentClass.soundStr.formulaDetailUnlock)
	end, 0.7, nil)
	arg_43_0._parentClass:managedTween(LeanTween.delayedCall, function()
		_.each(var_43_0, function(arg_47_0)
			arg_43_0._parentClass.loader:ClearRequest(arg_47_0)
		end)
		arg_43_0._parentClass:LoadingOff()

		arg_43_0.unLockLayerIndex = arg_43_1

		existCall(arg_43_2)
	end, 1.7, nil)
end

function var_0_0.UpdateFormulaDetail(arg_48_0)
	_.each(arg_48_0.nodeList, function(arg_49_0)
		arg_48_0:UpdateNodeView(arg_49_0)
	end)
	arg_48_0:RefreshBtn()
end

function var_0_0.RefreshBtn(arg_50_0)
	local var_50_0 = #arg_50_0.nodeList
	local var_50_1 = #_.select(arg_50_0.nodeList, function(arg_51_0)
		return arg_51_0.Instance ~= nil
	end)

	setText(arg_50_0:findTF("Bar/Text"), i18n("ryza_tip_put_materials", var_50_1, var_50_0))
	setGray(arg_50_0:findTF("AutoFill"), not arg_50_0.activity:GetFormulas()[arg_50_0.contextData.formulaId]:IsAvaliable())
	setActive(arg_50_0:findTF("Composite/Disabled"), var_50_1 < var_50_0)
end

function var_0_0.UpdateNodeView(arg_52_0, arg_52_1)
	arg_52_0:RefreshNodeLinks(arg_52_1)

	local var_52_0 = tf(arg_52_1.GO)
	local var_52_1 = arg_52_1.Data
	local var_52_2 = var_52_1:GetElementName()
	local var_52_3 = arg_52_0:IsLockNode(arg_52_1)

	setActive(arg_52_0:findTF("Lock", var_52_0), var_52_3)

	if var_52_3 then
		if var_52_1:GetType() ~= AtelierFormulaCircle.TYPE.ANY then
			arg_52_0._parentClass.loader:GetSpriteQuiet(arg_52_0.commonBundleName, "element_" .. var_52_2, arg_52_0:findTF("Lock/Require/Icon", var_52_0))
		end

		setText(arg_52_0:findTF("Lock/Require/Text", var_52_0), "X" .. var_52_1:GetLevel())
	end

	for iter_52_0 = 3, var_52_1:GetLevel() + 1, -1 do
		local var_52_4 = arg_52_0:findTF("Slots", var_52_0):GetChild(iter_52_0 - 1)

		arg_52_0._parentClass.loader:GetSpriteQuiet(arg_52_0.bundleName, "slot_BLOCKED", arg_52_0:findTF("Image", var_52_4))
	end

	local var_52_5 = arg_52_1.Instance
	local var_52_6 = arg_52_0:findTF("Item", var_52_0)

	if not var_52_5 then
		if var_52_1:GetType() == AtelierFormulaCircle.TYPE.ANY then
			setActive(arg_52_0:findTF("All", var_52_0), true)
		else
			setActive(arg_52_0:findTF("Icon", var_52_0), true)
			arg_52_0._parentClass.loader:GetSpriteQuiet(arg_52_0.bundleName, "icon_" .. var_52_2, arg_52_0:findTF("Icon", var_52_0), true)
		end

		setActive(var_52_6, false)

		if var_52_1:GetType() == AtelierFormulaCircle.TYPE.BASE or var_52_1:GetType() == AtelierFormulaCircle.TYPE.SAIREN then
			local var_52_7 = AtelierMaterial.New({
				configId = var_52_1:GetLimitItemID()
			})

			setActive(arg_52_0:findTF("Name", var_52_0), true)
			setScrollText(arg_52_0:findTF("Name/Rect/Text", var_52_0), var_52_7:GetName())
		else
			setActive(arg_52_0:findTF("Name", var_52_0), false)
		end

		for iter_52_1 = 1, var_52_1:GetLevel() do
			local var_52_8 = arg_52_0:findTF("Slots", var_52_0):GetChild(iter_52_1 - 1)

			arg_52_0._parentClass.loader:GetSpriteQuiet(arg_52_0.bundleName, "slot_NULL", arg_52_0:findTF("Image", var_52_8))
		end
	else
		local var_52_9 = var_52_1:GetRingElement(var_52_5)
		local var_52_10 = AtelierFormulaCircle.ELEMENT_NAME[var_52_9]

		if var_52_1:GetType() == AtelierFormulaCircle.TYPE.ANY then
			setActive(arg_52_0:findTF("All", var_52_0), false)
		else
			setActive(arg_52_0:findTF("Icon", var_52_0), false)
		end

		setActive(var_52_6, true)

		local var_52_11

		if var_52_1:GetType() == AtelierFormulaCircle.TYPE.BASE or var_52_1:GetType() == AtelierFormulaCircle.TYPE.SAIREN then
			var_52_11 = var_52_5:GetBaseCircleTransform()
		else
			var_52_11 = var_52_5:GetNormalCircleTransform()
		end

		setLocalScale(var_52_6, Vector3.New(unpack(var_52_11, 1, 3)))
		setAnchoredPosition(var_52_6, Vector2.New(unpack(var_52_11, 4, 5)))
		arg_52_0._parentClass.loader:GetSpriteQuiet(var_52_5:GetIconPath(), "", var_52_6, true)
		setActive(arg_52_0:findTF("Name", var_52_0), true)
		setScrollText(arg_52_0:findTF("Name/Rect/Text", var_52_0), var_52_5:GetName())

		for iter_52_2 = 1, var_52_1:GetLevel() do
			local var_52_12 = arg_52_0:findTF("Slots", var_52_0):GetChild(iter_52_2 - 1)

			arg_52_0._parentClass.loader:GetSpriteQuiet(arg_52_0.bundleName, "slot_" .. var_52_10, arg_52_0:findTF("Image", var_52_12))
		end
	end

	local var_52_13 = arg_52_0:findTF("Ring", var_52_0)

	setImageColor(var_52_13, var_52_1:GetElementRingColor(var_52_5))

	if arg_52_1.Change then
		local var_52_14 = arg_52_1.Data:GetRingElement(var_52_5)

		if var_52_3 then
			var_52_14 = nil
		end

		if arg_52_0.ringEffect[var_52_14] then
			local var_52_15 = arg_52_1.Data:GetType() == AtelierFormulaCircle.TYPE.BASE and "_o" or "_6"

			arg_52_0._parentClass.loader:GetPrefab("ui/" .. arg_52_0.ringEffect[var_52_14] .. var_52_15, "", function(arg_53_0)
				setParent(arg_53_0, var_52_13)
				setAnchoredPosition(arg_53_0, Vector2.zero)
			end, var_52_13)
		else
			arg_52_0._parentClass.loader:ClearRequest(var_52_13)
		end

		arg_52_0:RefreshNodeLinkEffects(var_52_0, arg_52_1, var_52_3)

		arg_52_1.Change = nil
	end

	if arg_52_1.ChangeInstance then
		if var_52_5 then
			arg_52_0._parentClass.loader:GetPrefab("ui/" .. arg_52_0.deployEffect, "", function(arg_54_0)
				setParent(arg_54_0, var_52_6)
				setAnchoredPosition(arg_54_0, Vector2.zero)
			end, var_52_0)
		else
			arg_52_0._parentClass.loader:ClearRequest(var_52_0)
		end

		arg_52_1.ChangeInstance = nil
	end

	onButton(arg_52_0, var_52_0, function()
		if var_52_3 then
			return
		end

		arg_52_0._parentClass:ShowMaterialSelectWindow(var_52_0, arg_52_1, arg_52_0.nodeList)
	end, SFX_PANEL)
end

function var_0_0.IsLockNode(arg_56_0, arg_56_1)
	local var_56_0 = 1

	for iter_56_0, iter_56_1 in ipairs(arg_56_0.nodeLayer) do
		if _.detect(iter_56_1, function(arg_57_0)
			return arg_56_0.nodeList[arg_57_0] == arg_56_1
		end) ~= ni then
			var_56_0 = iter_56_0

			break
		end
	end

	if var_56_0 > arg_56_0.unLockLayerIndex then
		return true
	end

	return false
end

function var_0_0.willExit(arg_58_0)
	arg_58_0.atelierFormulaOverlayView:willExit()

	arg_58_0.atelierFormulaOverlayView = nil

	arg_58_0:detach()
end

function var_0_0.InitStr(arg_59_0)
	arg_59_0.poolNames = {
		[AtelierFormulaCircle.TYPE.BASE] = "circle",
		[AtelierFormulaCircle.TYPE.NORMAL] = "hexagon",
		[AtelierFormulaCircle.TYPE.SAIREN] = "doubleHexagon",
		[AtelierFormulaCircle.TYPE.ANY] = "anyHexagon",
		[AtelierFormulaCircle.TYPE.NONE] = "circle",
		[AtelierFormulaCircle.TYPE.ELEMENT] = "hexagon",
		[AtelierFormulaCircle.TYPE.CATEGORY] = "doubleHexagon",
		[AtelierFormulaCircle.TYPE.ELEMENT_CATEGORY] = "doubleHexagon"
	}
	arg_59_0.lineEffect = {
		"laisha_ui_lianjie01",
		"laisha_ui_lianjie02",
		"laisha_ui_lianjie_qiehuan"
	}
	arg_59_0.ringEffect = {
		[AtelierFormulaCircle.ELEMENT_TYPE.PYRO] = "laisha_ui_huo",
		[AtelierFormulaCircle.ELEMENT_TYPE.CRYO] = "laisha_ui_bing",
		[AtelierFormulaCircle.ELEMENT_TYPE.ELECTRO] = "laisha_ui_lei",
		[AtelierFormulaCircle.ELEMENT_TYPE.ANEMO] = "laisha_ui_feng",
		[AtelierFormulaCircle.ELEMENT_TYPE.SAIREN] = "laisha_ui_sairen"
	}
	arg_59_0.deployEffect = "laisha_ui_wupinshanguang"
	arg_59_0.unlockEffect = "laisha_ui_jiesuo"
	arg_59_0.circleTypeList = {
		AtelierFormulaCircle.TYPE.BASE,
		AtelierFormulaCircle.TYPE.NORMAL,
		AtelierFormulaCircle.TYPE.SAIREN,
		AtelierFormulaCircle.TYPE.ANY
	}
end

function var_0_0.InitNodeLayer(arg_60_0)
	arg_60_0.nodeLayer = {
		{}
	}

	for iter_60_0, iter_60_1 in pairs(arg_60_0.nodeList) do
		local var_60_0 = iter_60_1.Data:GetType()

		if var_60_0 == AtelierFormulaCircle.TYPE.BASE or var_60_0 == AtelierFormulaCircle.TYPE.SAIREN then
			arg_60_0.nodeLayer[1] = arg_60_0.nodeLayer[1] or {}

			table.insert(arg_60_0.nodeLayer[1], iter_60_0)
		else
			arg_60_0.nodeLayer[2] = arg_60_0.nodeLayer[2] or {}

			table.insert(arg_60_0.nodeLayer[2], iter_60_0)
		end
	end

	for iter_60_2 = #arg_60_0.nodeLayer, 1, -1 do
		if #arg_60_0.nodeLayer[iter_60_2] == 0 then
			table.remove(arg_60_0.nodeLayer, iter_60_2)
		end
	end
end

function var_0_0.SetCirclePanel(arg_61_0)
	local var_61_0 = 280
	local var_61_1 = math.deg2Rad * 30

	arg_61_0.axisX, arg_61_0.axisY = var_61_0 * Vector2.New(math.cos(var_61_1), math.sin(var_61_1)), var_61_0 * Vector2(0, 1)
	arg_61_0.viewMax = Vector2.zero

	arg_61_0:SetCirclePosition(arg_61_0.nodeList[1], Vector2.zero)
	setSizeDelta(arg_61_0.viewContent, (arg_61_0.viewMax + Vector2.New(var_61_0, var_61_0)) * 2)
end

local var_0_2 = {
	{
		0,
		1
	},
	{
		-1,
		1
	},
	{
		-1,
		0
	},
	{
		0,
		-1
	},
	{
		1,
		-1
	},
	{
		1,
		0
	}
}

function var_0_0.SetCirclePosition(arg_62_0, arg_62_1, arg_62_2)
	setAnchoredPosition(arg_62_1.GO, arg_62_2)

	local var_62_0 = arg_62_1.Data:GetNeighbors()

	arg_62_1.links = {}

	_.each(var_62_0, function(arg_63_0)
		local var_63_0 = arg_63_0[1]
		local var_63_1 = arg_63_0[2]
		local var_63_2 = var_0_2[var_63_0]
		local var_63_3 = var_63_2[1] * arg_62_0.axisX + var_63_2[2] * arg_62_0.axisY
		local var_63_4 = _.detect(arg_62_0.nodeList, function(arg_64_0)
			return arg_64_0.Data:GetConfigID() == var_63_1
		end)

		var_63_4.prevLink = {
			(var_63_0 + 2) % 5 + 1,
			arg_62_1
		}
		arg_62_1.links[var_63_0] = var_63_4

		local var_63_5 = arg_62_2 + var_63_3

		arg_62_0:SetCirclePosition(var_63_4, var_63_5)

		arg_62_0.viewMax = Vector2.Max(arg_62_0.viewMax, -var_63_5)
		arg_62_0.viewMax = Vector2.Max(arg_62_0.viewMax, var_63_5)
	end)
end

function var_0_0.RefreshNodeLinks(arg_65_0, arg_65_1)
	local var_65_0 = tf(arg_65_1.GO)

	for iter_65_0 = 1, 6 do
		setActive(var_65_0:Find("Links"):GetChild(iter_65_0 - 1), false)
	end

	local var_65_1 = arg_65_1.Data

	_.each(var_65_1:GetNeighbors(), function(arg_66_0)
		setActive(arg_65_0:findTF("Links", var_65_0):GetChild(arg_66_0[1] - 1), true)
	end)
end

function var_0_0.RefreshNodeLinkEffects(arg_67_0, arg_67_1, arg_67_2, arg_67_3)
	table.Foreach(arg_67_2.links, function(arg_68_0, arg_68_1)
		local var_68_0 = arg_67_0:findTF("Links/" .. arg_68_0, arg_67_1)
		local var_68_1 = arg_67_0.lineEffect[3]

		if arg_68_1.Lock and arg_67_3 then
			var_68_1 = arg_67_0.lineEffect[1]
		elseif not arg_68_1.Lock and not arg_67_3 then
			var_68_1 = arg_67_0.lineEffect[2]
		end

		arg_67_0._parentClass.loader:GetPrefab("ui/" .. var_68_1, "", function(arg_69_0)
			setParent(arg_69_0, arg_67_0:findTF("Link", var_68_0))
			setAnchoredPosition(arg_69_0, Vector2.New(0, -15))
		end, var_68_0)
	end)
end

function var_0_0.CleanNodeLinks(arg_70_0, arg_70_1)
	table.Foreach(arg_70_1.links, function(arg_71_0)
		local var_71_0 = arg_70_0:findTF("Links/" .. arg_71_0, nodeTF)

		arg_70_0._parentClass.loader:ClearRequest(var_71_0)
	end)
end

return var_0_0
