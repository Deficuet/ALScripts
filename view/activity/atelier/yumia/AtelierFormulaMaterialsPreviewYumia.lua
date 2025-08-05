local var_0_0 = class("AtelierFormulaMaterialsYumiaPreview", import("view.activity.Atelier.base.AtelierFormulaMaterialsPreview"))

function var_0_0.InitCustom(arg_1_0)
	setText(arg_1_0:findTF("Frame/closeText"), i18n("yumia_atelier_tip13"))
	setText(arg_1_0:findTF("Frame/Text"), i18n("yumia_atelier_tip11"))
	setText(arg_1_0:findTF("Frame/Text_1"), i18n("yumia_atelier_tip12"))
end

function var_0_0.didEnter(arg_2_0)
	onButton(arg_2_0, arg_2_0:findTF("BG"), function()
		arg_2_0:HideMaterialsPreview(true)
	end, SFX_CANCEL)
end

function var_0_0.ShowMaterialsPreview(arg_4_0, arg_4_1)
	GetComponent(arg_4_0._tf, typeof(Animation)):Play("Anim_AtelierCompositeYumiaUI_FormulaMaterialPreview_In")
	setActive(arg_4_0._go, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)

	local var_4_0 = arg_4_0.activity:GetItems()
	local var_4_1 = arg_4_0.activity:GetFormulas()[arg_4_0.contextData.formulaId]
	local var_4_2 = AtelierMaterial.bindConfigTable()
	local var_4_3 = {}
	local var_4_4 = {}
	local var_4_5 = {}

	local function var_4_6(arg_5_0)
		local var_5_0 = var_4_5[arg_5_0:GetConfigID()] or Clone(var_4_0[arg_5_0:GetConfigID()])

		assert(var_5_0, "Using Unexist material")

		var_5_0.count = var_5_0.count - 1
		var_4_5[arg_5_0:GetConfigID()] = var_5_0
	end

	_.each(arg_4_1, function(arg_6_0)
		local var_6_0 = arg_6_0.Data:GetLimitItemID()

		if var_6_0 ~= 0 then
			local var_6_1 = var_4_5[var_6_0] or var_4_0[var_6_0]

			if var_6_1 and var_6_1.count > 0 then
				var_4_3[var_6_0] = (var_4_3[var_6_0] or 0) + 1

				var_4_6(var_6_1)
			else
				var_4_4[var_6_0] = (var_4_4[var_6_0] or 0) + 1
			end
		end
	end)

	local function var_4_7(arg_7_0)
		if arg_7_0.Instance then
			if arg_7_0.Data:GetLimitItemID() == 0 then
				var_4_3[arg_7_0.Instance:GetConfigID()] = (var_4_3[arg_7_0.Instance:GetConfigID()] or 0) + 1

				var_4_6(arg_7_0.Instance)
			end

			return
		end

		local var_7_0 = arg_7_0.Data
		local var_7_1

		for iter_7_0, iter_7_1 in ipairs(var_4_2.all) do
			local var_7_2 = var_4_5[iter_7_1] or var_4_0[iter_7_1] or AtelierMaterial.New({
				configId = iter_7_1
			})

			if var_7_2:IsNormal() and var_7_0:CanUseMaterial(var_7_2, var_4_1, arg_4_0.contextData.versionIndex) then
				var_7_1 = var_7_1 or iter_7_1

				if var_7_2.count > 0 then
					var_4_3[var_7_1] = (var_4_3[var_7_1] or 0) + 1

					var_4_6(var_7_2)

					return
				end
			end
		end

		if var_7_1 then
			var_4_4[var_7_1] = (var_4_4[var_7_1] or 0) + 1
		else
			assert(false, string.format("节点 %s 找不到合适的材料", var_7_0:GetConfigID()))
		end
	end

	_.each(arg_4_1, function(arg_8_0)
		if arg_8_0.Data:GetType() == AtelierFormulaCircle.TYPE.NORMAL then
			var_4_7(arg_8_0)
		end
	end)
	_.each(arg_4_1, function(arg_9_0)
		if arg_9_0.Data:GetType() == AtelierFormulaCircle.TYPE.ANY then
			var_4_7(arg_9_0)
		end
	end)
	_.each(arg_4_1, function(arg_10_0)
		if arg_10_0.Data:GetType() == AtelierFormulaCircle.TYPE.ELEMENT_CATEGORY then
			var_4_7(arg_10_0)
		end
	end)
	_.each(arg_4_1, function(arg_11_0)
		if arg_11_0.Data:GetType() == AtelierFormulaCircle.TYPE.CATEGORY then
			var_4_7(arg_11_0)
		end
	end)
	_.each(arg_4_1, function(arg_12_0)
		if arg_12_0.Data:GetType() == AtelierFormulaCircle.TYPE.ELEMENT then
			var_4_7(arg_12_0)
		end
	end)
	_.each(arg_4_1, function(arg_13_0)
		if arg_13_0.Data:GetType() == AtelierFormulaCircle.TYPE.NONE then
			var_4_7(arg_13_0)
		end
	end)

	local function var_4_8(arg_14_0, arg_14_1)
		return arg_14_0 < arg_14_1
	end

	local var_4_9 = {}

	for iter_4_0, iter_4_1 in pairs(var_4_3) do
		table.insert(var_4_9, iter_4_0)
	end

	local var_4_10 = {}

	for iter_4_2, iter_4_3 in pairs(var_4_4) do
		table.insert(var_4_10, iter_4_2)
	end

	table.sort(var_4_9, var_4_8)
	table.sort(var_4_10, var_4_8)

	local function var_4_11()
		local var_15_0 = arg_4_0:findTF("Frame/Scroll/Content")

		setActive(var_15_0.parent, #var_4_9 > 0)

		if #var_4_9 == 0 then
			return
		end

		local var_15_1 = CustomIndexLayer.Clone2Full(var_15_0, #var_4_9)

		table.Foreach(var_15_1, function(arg_16_0, arg_16_1)
			local var_16_0 = var_4_9[arg_16_0]
			local var_16_1 = AtelierMaterial.New({
				configId = var_16_0
			})

			var_16_1.count = var_4_3[var_16_0]

			arg_4_0._parentClass:UpdateRyzaItem(arg_16_1, var_16_1, true)
			onButton(arg_4_0, arg_16_1, function()
				arg_4_0._parentClass:ShowItemDetail(var_16_1)
			end, SFX_PANEL)
		end)
	end

	local function var_4_12()
		local var_18_0 = arg_4_0:findTF("Frame/LackScroll/Content")

		setActive(var_18_0.parent, #var_4_10 > 0)

		if #var_4_10 == 0 then
			return
		end

		local var_18_1 = CustomIndexLayer.Clone2Full(var_18_0, #var_4_10)

		table.Foreach(var_18_1, function(arg_19_0, arg_19_1)
			local var_19_0 = var_4_10[arg_19_0]
			local var_19_1 = AtelierMaterial.New({
				configId = var_19_0
			})

			var_19_1.count = var_4_4[var_19_0]

			arg_4_0._parentClass:UpdateRyzaItem(arg_19_1, var_19_1, true)
			onButton(arg_4_0, arg_19_1, function()
				arg_4_0._parentClass:ShowItemDetail(var_19_1)
			end, SFX_PANEL)
		end)
	end

	var_4_11()
	var_4_12()
	arg_4_0:AddTimer(#var_4_9, #var_4_10)
end

function var_0_0.HideMaterialsPreview(arg_21_0, arg_21_1)
	if not isActive(arg_21_0._go) then
		return
	end

	local var_21_0 = GetComponent(arg_21_0._tf, typeof(Animation))

	var_21_0:Play("Anim_AtelierCompositeYumiaUI_FormulaMaterialPreview_Out")
	pg.UIMgr.GetInstance():LoadingOn(false)

	if not arg_21_1 then
		arg_21_0:StopCloseTimer()
		pg.UIMgr.GetInstance():LoadingOff()
		arg_21_0:StopTimer()
		var_0_0.super.HideMaterialsPreview(arg_21_0)

		return
	end

	arg_21_0.closeTimer = FrameTimer.New(function()
		if not var_21_0:IsPlaying("Anim_AtelierCompositeYumiaUI_FormulaMaterialPreview_Out") then
			arg_21_0:StopCloseTimer()
			pg.UIMgr.GetInstance():LoadingOff()
			arg_21_0:StopTimer()
			var_0_0.super.HideMaterialsPreview(arg_21_0)
		end
	end, 1, -1)

	arg_21_0.closeTimer:Start()

	return true
end

function var_0_0.StopCloseTimer(arg_23_0)
	if arg_23_0.closeTimer then
		arg_23_0.closeTimer:Stop()

		arg_23_0.closeTimer = nil
	end
end

function var_0_0.AddTimer(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = 0
	local var_24_1 = arg_24_0:findTF("Frame/Scroll/Content")
	local var_24_2 = arg_24_0:findTF("Frame/LackScroll/Content")

	arg_24_0.timer = FrameTimer.New(function()
		local var_25_0 = 0

		for iter_25_0 = 0, var_24_1.childCount - 1 do
			if var_24_1:GetChild(iter_25_0).gameObject.activeSelf then
				var_25_0 = var_25_0 + 1
			end
		end

		local var_25_1 = math.min(var_25_0, math.min(arg_24_1, 8))
		local var_25_2 = 0

		for iter_25_1 = 0, var_24_2.childCount - 1 do
			if var_24_2:GetChild(iter_25_1).gameObject.activeSelf then
				var_25_2 = var_25_2 + 1
			end
		end

		local var_25_3 = math.min(var_25_2, math.min(arg_24_2, 8))

		if var_25_1 <= arg_24_1 and var_25_3 <= arg_24_2 then
			arg_24_0:StopTimer()
			arg_24_0:AddTimer2()
		end
	end, 1, -1)

	arg_24_0.timer:Start()
end

function var_0_0.AddTimer2(arg_26_0)
	local var_26_0 = arg_26_0:findTF("Frame/Scroll/Content")
	local var_26_1 = arg_26_0:findTF("Frame/LackScroll/Content")
	local var_26_2 = var_26_0.childCount
	local var_26_3 = var_26_1.childCount

	for iter_26_0 = 0, var_26_2 - 1 do
		SetComponentEnabled(var_26_0:GetChild(iter_26_0), typeof(Animation), false)

		GetComponent(var_26_0:GetChild(iter_26_0), typeof(CanvasGroup)).alpha = 0
	end

	for iter_26_1 = 0, var_26_3 - 1 do
		SetComponentEnabled(var_26_1:GetChild(iter_26_1), typeof(Animation), false)

		GetComponent(var_26_1:GetChild(iter_26_1), typeof(CanvasGroup)).alpha = 0
	end

	local var_26_4 = 0

	arg_26_0.timer = Timer.New(function()
		if var_26_4 >= var_26_2 and var_26_4 >= var_26_3 then
			arg_26_0:StopTimer()

			return
		end

		if var_26_4 < var_26_2 then
			local var_27_0 = GetComponent(var_26_0:GetChild(var_26_4), typeof(Animation))

			var_27_0.enabled = true

			var_27_0:Stop()
			var_27_0:Play("Anim_AtelierStoreYumiaUI_Tpl_In")
		end

		if var_26_4 < var_26_3 then
			local var_27_1 = GetComponent(var_26_1:GetChild(var_26_4), typeof(Animation))

			var_27_1.enabled = true

			var_27_1:Stop()
			var_27_1:Play("Anim_AtelierStoreYumiaUI_Tpl_In")
		end

		var_26_4 = var_26_4 + 1
	end, 0.08, -1)

	arg_26_0.timer:Start()
end

function var_0_0.StopTimer(arg_28_0)
	if arg_28_0.timer then
		arg_28_0.timer:Stop()

		arg_28_0.timer = nil
	end
end

return var_0_0
