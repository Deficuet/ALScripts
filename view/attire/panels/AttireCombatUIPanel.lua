local var_0_0 = class("AttireCombatUIPanel", import(".AttireFramePanel"))
local var_0_1 = setmetatable

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = {}

	var_1_0.__cname = "UICARD"

	local function var_1_1(arg_2_0)
		pg.DelegateInfo.New(arg_2_0)

		arg_2_0._go = arg_1_0
		arg_2_0.info = findTF(arg_2_0._go, "info")
		arg_2_0.empty = findTF(arg_2_0._go, "empty")
		arg_2_0.icon = findTF(arg_2_0._go, "info/icon")
		arg_2_0.selected = findTF(arg_2_0._go, "info/selected")
		arg_2_0.nameTxt = findTF(arg_2_0._go, "info/nameMask/name")
		arg_2_0.descTxt = findTF(arg_2_0._go, "info/desc")
		arg_2_0.conditionTxt = findTF(arg_2_0._go, "info/condition")
		arg_2_0.tags = {
			findTF(arg_2_0._go, "info/tags/new"),
			findTF(arg_2_0._go, "info/tags/e")
		}
		arg_2_0.crossPrint = findTF(arg_2_0._go, "prints/odd")
		arg_2_0.notOwn = findTF(arg_2_0._go, "info/notOwn")
		arg_2_0.tipsGo = findTF(arg_2_0._go, "info/tips")
		arg_2_0.tipsText = findTF(arg_2_0._go, "info/tips/text")
		arg_2_0.toggleItem = findTF(arg_2_0._go, "info/elementList/main_toggle")
		arg_2_0.toggleList = UIItemList.New(findTF(arg_2_0._go, "info/elementList"), arg_2_0.toggleItem)

		arg_2_0.toggleList:make(function(arg_3_0, arg_3_1, arg_3_2)
			if arg_3_0 == UIItemList.EventUpdate then
				local var_3_0 = arg_2_0.uiStyle:getConfig("rare_display")
				local var_3_1 = var_3_0[arg_3_1 + 1]

				arg_1_1:GetSpriteQuiet("ui/combatskinrare", CombatSkinConst.TYPE_ICON_NAME[var_3_1], findTF(arg_3_2, "on"))
				arg_1_1:GetSpriteQuiet("ui/combatskinrare", string.format("%s_unselected", CombatSkinConst.TYPE_ICON_NAME[var_3_1]), findTF(arg_3_2, "off"))
				onToggle(arg_2_0, arg_3_2, function(arg_4_0)
					setText(arg_2_0.tipsText, i18n("battleui_display" .. var_3_0[arg_3_1 + 1]))

					local var_4_0 = findTF(arg_2_0._go, "info"):InverseTransformPoint(arg_3_2.transform.position)

					setLocalPosition(arg_2_0.tipsGo, var_4_0 + Vector3(24, 46, 0))
					arg_2_0:ShowTips(arg_4_0)
				end)
			end
		end)

		arg_2_0.handle = UpdateBeat:CreateListener(arg_2_0.UpdateClick, arg_2_0)

		UpdateBeat:AddListener(arg_2_0.handle)
	end

	function var_1_0.ShowTips(arg_5_0, arg_5_1)
		setActive(arg_5_0.tipsGo, arg_5_1)
	end

	function var_1_0.isEmpty(arg_6_0)
		return not arg_6_0.uiStyle or arg_6_0.uiStyle.id == -1
	end

	function var_1_0.Update(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5)
		arg_7_0.uiStyle = arg_7_1

		if arg_7_0:isEmpty() then
			setActive(arg_7_0.info, false)
			setActive(arg_7_0.empty, true)

			return
		else
			setActive(arg_7_0.info, true)
			setActive(arg_7_0.empty, false)
		end

		LoadImageSpriteAsync("combatuistyle/" .. arg_7_1:getConfig("icon"), arg_7_0.icon, true)
		setScrollText(arg_7_0.nameTxt, arg_7_1:getConfig("name"))
		setText(arg_7_0.descTxt, arg_7_1:getConfig("desc"))
		setText(arg_7_0.conditionTxt, arg_7_1:getConfig("unlock"))

		local var_7_0 = arg_7_2:getAttireByType(arg_7_1:getType())

		setActive(arg_7_0.tags[2], arg_7_1:isOwned() and var_7_0 == arg_7_1.id)
		setActive(arg_7_0.tags[1], arg_7_1:isNew())
		setActive(arg_7_0.crossPrint, not arg_7_3 and math.fmod(arg_7_4 + 1, arg_7_5) ~= 0)
		setActive(arg_7_0.notOwn, not arg_7_1:isOwned())

		local var_7_1 = arg_7_1:getConfig("rare")

		arg_1_1:GetSpriteQuiet("ui/combatskinrare", string.format("rare_%s", var_7_1), findTF(arg_7_0._go, "info/rareImage"))

		local var_7_2 = arg_7_1:getConfig("rare_display")

		arg_7_0.toggleList:align(#var_7_2)
	end

	function var_1_0.UpdateClick(arg_8_0)
		if UnityEngine.Input.GetMouseButtonDown(0) then
			arg_8_0.toggleList:each(function(arg_9_0, arg_9_1)
				GetComponent(arg_9_1, typeof(Toggle)).isOn = false
			end)
		end
	end

	function var_1_0.Dispose(arg_10_0)
		UpdateBeat:RemoveListener(arg_10_0.handle)
		pg.DelegateInfo.Dispose(arg_10_0)
	end

	function var_1_0.UpdateSelected(arg_11_0, arg_11_1)
		setActive(arg_11_0.selected, arg_11_1)
	end

	function var_1_0.IsOwned(arg_12_0)
		return arg_12_0.uiStyle:isOwned()
	end

	var_1_1(var_1_0)

	return var_1_0
end

function var_0_0.OnInit(arg_13_0)
	arg_13_0.listPanel = arg_13_0._tf:Find("list_panel")
	arg_13_0.scolrect = arg_13_0.listPanel:Find("scrollrect"):GetComponent("LScrollRect")
	arg_13_0.confirmBtn = arg_13_0.listPanel:Find("confirm")
	arg_13_0.previewBtn = arg_13_0.listPanel:Find("preview")
	arg_13_0.lockBtn = arg_13_0.listPanel:Find("lock")
	arg_13_0.alwaysShowStickToggle = arg_13_0.listPanel:Find("AlwaysShowStick")

	setText(arg_13_0.alwaysShowStickToggle:Find("Text"), i18n("combatUI_stick_set"))

	local var_13_0 = getProxy(SettingsProxy)

	arg_13_0.isShowStickInCombat = var_13_0:IsShowStickInCombat()

	triggerToggle(arg_13_0.alwaysShowStickToggle, arg_13_0.isShowStickInCombat)
	onToggle(arg_13_0, arg_13_0.alwaysShowStickToggle, function(arg_14_0)
		arg_13_0.isShowStickInCombat = arg_14_0

		var_13_0:SetShowStickInCombat(arg_14_0)
	end)

	function arg_13_0.scolrect.onInitItem(arg_15_0)
		arg_13_0:OnInitItem(arg_15_0)
	end

	function arg_13_0.scolrect.onUpdateItem(arg_16_0, arg_16_1)
		arg_13_0:OnUpdateItem(arg_16_0, arg_16_1)
	end

	function arg_13_0.scolrect.onReturnItem(arg_17_0, arg_17_1)
		arg_13_0:OnReturnItem(arg_17_0, arg_17_1)
	end

	arg_13_0.cards = {}
	arg_13_0.totalCount = arg_13_0._tf:Find("total_count/Text"):GetComponent(typeof(Text))
	arg_13_0.preview = arg_13_0._tf:Find("preview")
	arg_13_0.sea = arg_13_0._tf:Find("preview/sea")
	arg_13_0.rawImage = arg_13_0.sea:GetComponent("RawImage")
	arg_13_0.uiLayer = arg_13_0._tf:Find("preview/ui")

	setText(arg_13_0.preview:Find("bg/title/Image"), i18n("word_preview"))
	setText(arg_13_0.confirmBtn:Find("Text"), i18n("attire_combatui_confirm"))
	setText(arg_13_0.previewBtn:Find("Text"), i18n("attire_combatui_preview"))
	setText(arg_13_0.lockBtn:Find("Text"), i18n("index_not_obtained"))
	setActive(arg_13_0.preview, false)
	setActive(arg_13_0.rawImage, false)
	onButton(arg_13_0, arg_13_0.preview, function()
		arg_13_0:onBackPressed()
	end)

	arg_13_0.loader = AutoLoader.New()
end

function var_0_0.getUIName(arg_19_0)
	return "AttireCombatUIUI"
end

function var_0_0.GetData(arg_20_0)
	return arg_20_0.rawAttireVOs.combatUIStyles
end

function var_0_0.OnInitItem(arg_21_0, arg_21_1)
	local var_21_0 = var_0_2(arg_21_1, arg_21_0.loader)

	arg_21_0.cards[arg_21_1] = var_21_0

	onButton(arg_21_0, var_21_0._go, function()
		if not var_21_0:isEmpty() then
			if arg_21_0.card then
				arg_21_0.card:UpdateSelected(false)
			end

			arg_21_0.contextData.iconFrameId = var_21_0.uiStyle.id

			arg_21_0:UpdateDesc(var_21_0)
			var_21_0:UpdateSelected(true)

			arg_21_0.card = var_21_0

			if var_21_0:IsOwned() then
				setActive(arg_21_0.confirmBtn, true)
				setActive(arg_21_0.lockBtn, false)
			else
				setActive(arg_21_0.confirmBtn, false)
				setActive(arg_21_0.lockBtn, true)
			end
		end
	end, SFX_PANEL)
end

function var_0_0.OnReturnItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.cards[arg_23_2]

	if var_23_0 then
		var_23_0:Dispose()
	end

	arg_23_0.cards[arg_23_2] = nil
end

function var_0_0.GetColumn(arg_24_0)
	return 2
end

function var_0_0.OnUpdateItem(arg_25_0, arg_25_1, arg_25_2)
	var_0_0.super.OnUpdateItem(arg_25_0, arg_25_1, arg_25_2)

	local var_25_0 = arg_25_0.playerVO:getAttireByType(AttireConst.TYPE_COMBAT_UI_STYLE)
	local var_25_1 = arg_25_0.cards[arg_25_2]

	if var_25_1.uiStyle.id == var_25_0 then
		triggerButton(var_25_1._go)
	end
end

function var_0_0.GetDisplayVOs(arg_26_0)
	local var_26_0 = {}
	local var_26_1 = 0

	for iter_26_0, iter_26_1 in pairs(arg_26_0:GetData()) do
		table.insert(var_26_0, iter_26_1)

		if iter_26_1:getState() == AttireFrame.STATE_UNLOCK and iter_26_1.id >= 0 then
			var_26_1 = var_26_1 + 1
		end
	end

	return var_26_0, var_26_1
end

function var_0_0.UpdateDesc(arg_27_0, arg_27_1)
	if arg_27_1:isEmpty() then
		return
	end

	onButton(arg_27_0, arg_27_0.confirmBtn, function()
		local var_28_0 = arg_27_1.uiStyle:getType()

		arg_27_0:emit(AttireMediator.ON_APPLY, var_28_0, arg_27_1.uiStyle.id)
	end, SFX_PANEL)

	local var_27_0 = Ship.New({
		id = 100001,
		configId = 100001,
		skin_id = 100000
	})
	local var_27_1 = Ship.New({
		id = 100011,
		configId = 100011,
		skin_id = 100010
	})
	local var_27_2 = arg_27_1.uiStyle:getConfig("key")

	onButton(arg_27_0, arg_27_0.previewBtn, function()
		arg_27_0.combatPreview = CombatPreviewLayer.New(pg.UIMgr.GetInstance().OverlayMain)

		arg_27_0.combatPreview:ExecuteAction("Show", arg_27_1.uiStyle:getConfig("id"), function()
			arg_27_0.combatPreview:Destroy()

			arg_27_0.combatPreview = nil
		end)
	end, SFX_PANEL)
end

function var_0_0.onBackPressed(arg_31_0)
	if arg_31_0.combatPreview then
		arg_31_0.combatPreview:Destroy()

		arg_31_0.combatPreview = nil

		return true
	end
end

function var_0_0.OnDestroy(arg_32_0)
	arg_32_0.loader:Clear()
end

return var_0_0
