local var_0_0 = class("NewBattleResultYumiaMaterialPage", import("view.base.BaseSubView"))

var_0_0.YUMIA_MATERIAL_DROP_TYPE_LIST = {
	DROP_TYPE_RYZA_DROP
}

function var_0_0.NeedShowYumiaMaterailDrop(arg_1_0)
	for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
		if table.contains(var_0_0.YUMIA_MATERIAL_DROP_TYPE_LIST, iter_1_1.type) then
			return true
		end
	end

	return false
end

function var_0_0.getUIName(arg_2_0)
	return "NewBattleResultYumiaRewardPages"
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.parentTr = arg_3_0._tf.parent
	arg_3_0.itemContainer = arg_3_0:findTF("item/container")
	arg_3_0.itemTpl = arg_3_0:findTF("item/tpl")
	arg_3_0.confirmBtn = arg_3_0:findTF("confirm_btn")
	arg_3_0.lineTxt = arg_3_0:findTF("words/text")

	setText(arg_3_0.confirmBtn:Find("text"), i18n("word_ok"))
end

function var_0_0.SetUp(arg_4_0, arg_4_1)
	arg_4_0:Show()
	seriesAsync({
		function(arg_5_0)
			arg_4_0:playAnima("Anim_NewBattleResultYumiaRewardPages_In", arg_5_0)
		end,
		function(arg_6_0)
			arg_4_0:UpdateItem()
			arg_4_0:UpdateLine()
			arg_4_0:RegisterEvent(arg_6_0)
		end
	}, function()
		arg_4_0:Clear()
		arg_4_0:Destroy()
		arg_4_1()
	end)
end

function var_0_0.Show(arg_8_0)
	var_0_0.super.Show(arg_8_0)

	arg_8_0.parentTr:GetComponent(typeof(Image)).enabled = false

	SetActive(arg_8_0.parentTr:Find("Effect"), false)
end

function var_0_0.dropFilter(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0) do
		if table.contains(var_0_0.YUMIA_MATERIAL_DROP_TYPE_LIST, iter_9_1.type) then
			table.insert(var_9_0, iter_9_1)
		end
	end

	return var_9_0
end

function var_0_0.playAnima(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._tf:GetComponent(typeof(Animation)):Play(arg_10_1)
	arg_10_0._tf:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		arg_10_2()
	end)
end

function var_0_0.UpdateItem(arg_12_0, arg_12_1)
	local var_12_0 = var_0_0.dropFilter(arg_12_0.contextData.drops or {})
	local var_12_1 = {}

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		for iter_12_2 = 1, iter_12_1.count do
			local var_12_2 = Drop.New({
				count = 1,
				type = iter_12_1.type,
				id = iter_12_1.id
			})
			local var_12_3 = cloneTplTo(arg_12_0.itemTpl, arg_12_0.itemContainer)

			setActive(var_12_3, false)
			table.insert(var_12_1, var_12_3)
			updateDrop(var_12_3:Find("IconTpl"), var_12_2)
		end
	end

	local var_12_4 = 1

	arg_12_0.timer = Timer.New(function()
		local var_13_0 = var_12_1[var_12_4]

		setActive(var_13_0, true)
		var_13_0:GetComponent(typeof(Animation)):Play("Anim_NewBattleResultYumiaRewardPages_Tpl_In")

		var_12_4 = var_12_4 + 1
	end, 0.08, #var_12_1)

	arg_12_0.timer:Start()
end

function var_0_0.UpdateLine(arg_14_0)
	local var_14_0 = var_0_0.dropFilter(arg_14_0.contextData.drops or {})
	local var_14_1 = math.random(#var_14_0)
	local var_14_2 = AtelierMaterial.New({
		configId = var_14_0[var_14_1].id
	}):GetVoices()

	if var_14_2 and #var_14_2 > 0 then
		local var_14_3 = var_14_2[math.random(#var_14_2)]
		local var_14_4, var_14_5, var_14_6 = ShipWordHelper.GetWordAndCV(var_14_3[1], var_14_3[2], nil, PLATFORM_CODE ~= PLATFORM_US)

		if var_14_5 then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_14_5)
		end

		setText(arg_14_0.lineTxt, var_14_6)
	end
end

function var_0_0.RegisterEvent(arg_15_0, arg_15_1)
	if arg_15_0.exited then
		return
	end

	local function var_15_0()
		arg_15_0:playAnima("Anim_NewBattleResultYumiaRewardPages_Out", arg_15_1)
	end

	onButton(arg_15_0, arg_15_0._tf, var_15_0, SFX_PANEL)
	onButton(arg_15_0, arg_15_0.confirmBtn, var_15_0, SFX_PANEL)

	if arg_15_0.contextData.autoSkipFlag then
		triggerButton(arg_15_0._tf)
	end
end

function var_0_0.Clear(arg_17_0)
	removeOnButton(arg_17_0._tf)
	removeOnButton(arg_17_0.confirmBtn)
end

function var_0_0.OnDestroy(arg_18_0)
	arg_18_0.exited = true

	if arg_18_0:isShowing() then
		arg_18_0:Hide()
	end

	if arg_18_0.timer then
		arg_18_0.timer:Stop()
	end

	arg_18_0.parentTr:GetComponent(typeof(Image)).enabled = true

	SetActive(arg_18_0.parentTr:Find("Effect"), true)
end

return var_0_0
