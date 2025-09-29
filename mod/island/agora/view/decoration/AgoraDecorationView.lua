local var_0_0 = class("AgoraDecorationView", import("Mod.Island.Core.View.IslandASynLoadSubView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandAgoraDecorationUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	arg_2_0.scrollRect = arg_2_0._tf:Find("panel/main/scrollrect"):GetComponent("LScrollRect")
	arg_2_0.scrollRect4Theme = arg_2_0._tf:Find("panel/main/scrollrect_theme"):GetComponent("LScrollRect")
	arg_2_0.emptyTr = arg_2_0._tf:Find("panel/main/empty")
	arg_2_0.agoraSaveBtn = arg_2_0._tf:Find("panel/btns/save")
	arg_2_0.agoraSaveCdBtn = arg_2_0._tf:Find("panel/btns/save_cd")
	arg_2_0.agoraSaveCdTxt = arg_2_0._tf:Find("panel/btns/save_cd/Text"):GetComponent(typeof(Text))
	arg_2_0.agoraClearBtn = arg_2_0._tf:Find("panel/btns/clear")
	arg_2_0.agoraRevertBtn = arg_2_0._tf:Find("panel/btns/revert")
	arg_2_0.topPanel = arg_2_0._tf:Find("top")
	arg_2_0.agoraShopBtn = arg_2_0._tf:Find("top/shop")
	arg_2_0.backBtn = arg_2_0._tf:Find("top/back")
	arg_2_0.capacityBtn = arg_2_0._tf:Find("top/capacity")
	arg_2_0.capacityTxt = arg_2_0._tf:Find("top/capacity/Text"):GetComponent(typeof(Text))
	arg_2_0.themeBtn = arg_2_0._tf:Find("panel/main/bg/theme")
	arg_2_0.hideBtn = arg_2_0._tf:Find("panel/main/bg/hide")
	arg_2_0.showBtn = arg_2_0._tf:Find("panel/btns/show")
	arg_2_0.tagUIItemList = UIItemList.New(arg_2_0._tf:Find("panel/main/bg/tags"), arg_2_0._tf:Find("panel/main/bg/tags/1_1"))
	arg_2_0.searchInput = arg_2_0._tf:Find("panel/main/bg/search/search")
	arg_2_0.searchClearBtn = arg_2_0._tf:Find("panel/main/bg/search/search/clear")
	arg_2_0.sortBtn = arg_2_0._tf:Find("panel/main/bg/order")
	arg_2_0.orderBtn = arg_2_0._tf:Find("panel/main/bg/order/icon")
	arg_2_0.orderTxt = arg_2_0._tf:Find("panel/main/bg/order/Text_1"):GetComponent(typeof(Text))
	arg_2_0.sortPage = AgoraDecorationSortPage.New(arg_2_0._tf)
	arg_2_0.descPage = AgoraFurnitureDescPage.New(arg_2_0._tf)
	arg_2_0.shapeSelectPanel = AgoraDecorationShapePage.New(arg_2_0._tf:Find("shapeTpl"))

	setText(arg_2_0.agoraClearBtn:Find("Text"), i18n("island_agora_btn_label_clear"))
	setText(arg_2_0.agoraRevertBtn:Find("Text"), i18n("island_agora_btn_label_revert"))
	setText(arg_2_0.agoraSaveBtn:Find("Text"), i18n("island_agora_btn_label_save"))
	setText(arg_2_0._tf:Find("top/title/Text"), i18n("island_agora_title"))
	setText(arg_2_0._tf:Find("panel/main/bg/search/search/holder"), i18n("island_agora_label_search"))
	setText(arg_2_0._tf:Find("panel/main/bg/theme/unsel/Text"), i18n("island_agora_label_theme"))
	setText(arg_2_0._tf:Find("panel/main/bg/theme/sel/Text"), i18n("island_agora_label_theme"))
	setText(arg_2_0.emptyTr:Find("empty_1/Text"), i18n("island_agora_label_empty_tip"))

	arg_2_0.anim = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.dftAniEvent = arg_2_0.anim:GetComponent(typeof(DftAniEvent))
	arg_2_0.panelAnim = arg_2_0._tf:Find("panel"):GetComponent(typeof(Animation))
	arg_2_0.cards = {}
	arg_2_0.themeCards = {}
	arg_2_0.indexData = {
		tag = 1,
		searchKey = "",
		sortKey = 1,
		order = 1
	}

	arg_2_0:RegisterEvent()
	arg_2_0:UpdateOrderTxt()
	arg_2_0:InitTags()
end

function var_0_0.OnShow(arg_3_0)
	IslandGuideChecker.CheckGuide("ISLAND_GUIDE_27")
end

function var_0_0.PlayExitAnim(arg_4_0, arg_4_1)
	if arg_4_0.isAniming then
		return
	end

	arg_4_0.isAniming = true

	arg_4_0.dftAniEvent:SetEndEvent(function()
		arg_4_0.isAniming = false

		var_0_0.super.Hide(arg_4_0)
		arg_4_1()
	end)
	arg_4_0.anim:Play("anim_IslandAgoraDecorationUI_Out")
end

function var_0_0.OnSelectedItem(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = arg_6_0.selectedId

	arg_6_0.selectedId = arg_6_1

	for iter_6_0, iter_6_1 in pairs(arg_6_0.cards) do
		iter_6_1:UpdateSelected(arg_6_0.selectedId)
	end

	if not arg_6_2 then
		arg_6_0:TriggerTag(arg_6_1)

		return
	end

	if arg_6_0.selectedId > 0 and not arg_6_0.isHideState then
		triggerButton(arg_6_0.hideBtn)
		arg_6_0:FoldBtnsAndTop()
	elseif arg_6_3 then
		local var_6_1 = _.detect(arg_6_0.displays, function(arg_7_0)
			return arg_7_0:Contains(arg_6_3)
		end)

		if var_6_1 and var_6_1:GetAvailableCnt() > 0 then
			return
		end

		if arg_6_1 < 0 then
			triggerButton(arg_6_0.showBtn)
		end
	elseif arg_6_1 < 0 then
		triggerButton(arg_6_0.showBtn)
	end
end

function var_0_0.TriggerTag(arg_8_0, arg_8_1)
	if arg_8_1 <= 0 then
		return
	end

	local var_8_0 = arg_8_0:GetView().agora:GetPlaceableItem(arg_8_1)

	if not var_8_0 then
		return
	end

	local var_8_1 = table.indexof(AgoraFurnitureType.PLACEMENT_TYPE, var_8_0:GetType())

	if var_8_1 > 0 then
		triggerToggle(arg_8_0.toggles[var_8_1], true)
	end
end

function var_0_0.OnCreateSameItem(arg_9_0, arg_9_1)
	local var_9_0 = _.detect(arg_9_0.displays, function(arg_10_0)
		return arg_10_0:Contains(arg_9_1)
	end)

	if var_9_0 and var_9_0:GetAvailableCnt() > 0 then
		local var_9_1 = var_9_0:GetAvailableItem()

		arg_9_0:Op("PlaceItemRandonPosition", var_9_1.id)
	end
end

function var_0_0.RegisterEvent(arg_11_0)
	function arg_11_0.scrollRect.onInitItem(arg_12_0)
		arg_11_0:OnInitItem(arg_12_0)
	end

	function arg_11_0.scrollRect.onUpdateItem(arg_13_0, arg_13_1)
		arg_11_0:OnUpdateItem(arg_13_0, arg_13_1)
	end

	function arg_11_0.scrollRect4Theme.onInitItem(arg_14_0)
		arg_11_0:OnInitItem4Theme(arg_14_0)
	end

	function arg_11_0.scrollRect4Theme.onUpdateItem(arg_15_0, arg_15_1)
		arg_11_0:OnUpdateItem4Theme(arg_15_0, arg_15_1)
	end

	onButton(arg_11_0, arg_11_0.agoraSaveBtn, function()
		if arg_11_0:TrySave() then
			arg_11_0:Op("Save")
		end
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.agoraClearBtn, function()
		arg_11_0:ShowMsgbox({
			content = i18n("island_agora_clear_tip"),
			onYes = function()
				arg_11_0:Op("ClearAll")
			end
		})
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.agoraRevertBtn, function()
		arg_11_0:ShowMsgbox({
			content = i18n("island_agora_revert_tip"),
			onYes = function()
				arg_11_0:Op("Revert")
			end
		})
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.capacityBtn, function()
		local var_21_0 = arg_11_0:GetView()
		local var_21_1 = var_21_0.agora:GetPlacedInfoList()
		local var_21_2 = var_21_0.agora:GetMaxCapacity()

		arg_11_0:ShowMsgbox({
			type = IslandMsgBox.TYPE_AGORA_PLACED_LIST,
			list = var_21_1,
			totalCnt = var_21_2
		})
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.agoraShopBtn, function()
		if arg_11_0:GetView():GetController():CheckChange() then
			arg_11_0:Save()
		else
			arg_11_0:PlayExitAnim(function()
				arg_11_0:Op("ExitEditMode")
				arg_11_0:NotifiyIsland(ISLAND_EX_EVT.OPEN_PAGE, IslandShopPage, {
					1,
					2,
					3,
					4,
					5
				}, {
					10111,
					40111,
					50111,
					10122
				})
			end)
		end
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.backBtn, function()
		if arg_11_0:GetView():GetController():CheckChange() then
			arg_11_0:Save()
		else
			arg_11_0:PlayExitAnim(function()
				arg_11_0:Op("ExitEditMode")
			end)
		end
	end, SFX_PANEL)
	onInputChanged(arg_11_0, arg_11_0.searchInput, function()
		local var_26_0 = getInputText(arg_11_0.searchInput)

		setActive(arg_11_0.searchClearBtn, var_26_0 ~= "")
		arg_11_0:OnSearch(var_26_0)
	end)
	onButton(arg_11_0, arg_11_0.searchClearBtn, function()
		setInputText(arg_11_0.searchInput, "")

		arg_11_0.indexData.searchKey = ""
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.sortBtn, function()
		arg_11_0.sortPage:ExecuteAction("Show", arg_11_0.indexData, function(arg_29_0)
			arg_11_0:OnSort(arg_29_0)
		end)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.orderBtn, function()
		local var_30_0 = 1 - arg_11_0.indexData.order

		arg_11_0:OnOrder(var_30_0)
	end, SFX_PANEL)

	arg_11_0.isHideState = false
	arg_11_0.isHideBtnAndTop = false

	onButton(arg_11_0, arg_11_0.hideBtn, function()
		arg_11_0.isHideState = true

		arg_11_0.panelAnim:Play("fold")
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.showBtn, function()
		arg_11_0.isHideState = false

		arg_11_0.panelAnim:Play("unfold")

		if arg_11_0.isHideBtnAndTop then
			arg_11_0:UnFoldBtnsAndTop()
		end
	end, SFX_PANEL)
end

function var_0_0.TrySave(arg_33_0)
	local var_33_0 = arg_33_0:GetView():GetController():CanEnterEditMode()

	if not var_33_0 then
		arg_33_0:ShowMsgbox({
			type = IslandMsgBox.TYPE_AOGRA_SAVE_CD,
			duetime = arg_33_0:GetView():GetController().editCdTime,
			onNo = function()
				arg_33_0:Op("RevertAndExit")
			end
		})
	end

	return var_33_0
end

function var_0_0.Save(arg_35_0)
	if arg_35_0:TrySave() then
		arg_35_0:ShowMsgbox({
			content = i18n("island_agora_save_or_exit_tip"),
			noText = i18n("island_agora_exit_and_unsave"),
			yesText = i18n("island_agora_exit_and_save"),
			onYes = function()
				arg_35_0:Op("SaveAndExit")
			end,
			onNo = function()
				arg_35_0:Op("RevertAndExit")
			end
		})
	end
end

function var_0_0.FoldBtnsAndTop(arg_38_0)
	setActive(arg_38_0.agoraSaveBtn, false)
	setActive(arg_38_0.agoraClearBtn, false)
	setActive(arg_38_0.agoraRevertBtn, false)
	setActive(arg_38_0.topPanel, false)

	arg_38_0.isHideBtnAndTop = true
end

function var_0_0.UnFoldBtnsAndTop(arg_39_0)
	setActive(arg_39_0.agoraSaveBtn, true)
	setActive(arg_39_0.agoraClearBtn, true)
	setActive(arg_39_0.agoraRevertBtn, true)
	setActive(arg_39_0.topPanel, true)

	arg_39_0.isHideBtnAndTop = false
end

function var_0_0.InitTags(arg_40_0)
	arg_40_0.toggles = {}

	arg_40_0.tagUIItemList:make(function(arg_41_0, arg_41_1, arg_41_2)
		if arg_41_0 == UIItemList.EventUpdate then
			local var_41_0 = AgoraFurnitureType.PLACEMENT_TYPE[arg_41_1 + 1]

			onToggle(arg_40_0, arg_41_2, function(arg_42_0)
				if arg_42_0 then
					arg_40_0.selectedTagIndex = arg_41_1 + 1

					arg_40_0:Op("NotifiyAgora", ISLAND_AGORA_EVT.TAG_CHANGE, var_41_0)
					arg_40_0:OnFliter(var_41_0)
				end
			end, SFX_PANEL)
			setText(arg_41_2:Find("sel/Text"), AgoraFurnitureType.Type2CN(var_41_0))
			table.insert(arg_40_0.toggles, arg_41_2)
		end
	end)
	arg_40_0.tagUIItemList:align(#AgoraFurnitureType.PLACEMENT_TYPE)
	onToggle(arg_40_0, arg_40_0.themeBtn, function(arg_43_0)
		if arg_43_0 then
			arg_40_0.selectedTagIndex = nil

			arg_40_0:FlushThemeList()
		end
	end, SFX_PANEL)
end

function var_0_0.OnInitItem4Theme(arg_44_0, arg_44_1)
	local var_44_0 = AgoraDecorationThemeCard.New(arg_44_1)

	onButton(arg_44_0, var_44_0.mainTr, function()
		local var_45_0 = isa(var_44_0.theme, AgoraSystemTheme)
		local var_45_1 = var_45_0 and IslandMsgBox.TYPE_SYSTEM_THEME or IslandMsgBox.TYPE_THEME

		arg_44_0:ShowMsgbox({
			type = var_45_1,
			theme = var_44_0.theme,
			onYes = function()
				arg_44_0:Op("ApplyTheme", var_44_0.theme.id, var_45_0)
			end,
			onDel = function()
				arg_44_0:Op("DeleteTheme", var_44_0.theme.id)
			end
		})
	end, SFX_PANEL)
	onButton(arg_44_0, var_44_0.addTr, function()
		local var_48_0 = arg_44_0:GetView().agora:GetUseableThemeId()

		if not var_48_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_no_pos_place"))

			return
		end

		seriesAsync({
			function(arg_49_0)
				arg_44_0:PrepareToTakeScreenshot()
				arg_44_0:ShootScreen(var_48_0, arg_49_0)
			end,
			function()
				arg_44_0:RevertTakeScreenshot()
				arg_44_0:ShowMsgbox({
					type = IslandMsgBox.TYPE_SAVE_THEME,
					id = var_48_0,
					onYes = function(arg_51_0)
						arg_44_0:Op("SaveTheme", var_48_0, arg_51_0)
					end
				})
			end
		})
	end, SFX_PANEL)

	arg_44_0.themeCards[arg_44_1] = var_44_0
end

function var_0_0.PrepareToTakeScreenshot(arg_52_0)
	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.AGORA_CAMERA_SHOOTSCREEN_NAME)
	arg_52_0:GetView():ShowOrHideContainer(false)
end

function var_0_0.ShootScreen(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = IslandCameraMgr.instance._mainCamera
	local var_53_1 = 426
	local var_53_2 = 320

	BLHX.Rendering.HotUpdate.ScreenShooterPass.TakePhoto(var_53_0, function(arg_54_0)
		local var_54_0

		if arg_54_0.width < var_53_1 or arg_54_0.height < var_53_2 then
			var_54_0 = arg_54_0
		else
			local var_54_1 = arg_54_0.width * 0.5 - var_53_1 * 0.5
			local var_54_2 = arg_54_0.height * 0.5 - var_53_2 * 0.5
			local var_54_3 = arg_54_0:GetPixels(var_54_1, var_54_2, var_53_1, var_53_2)

			var_54_0 = UnityEngine.Texture2D.New(var_53_1, var_53_2)

			var_54_0:SetPixels(var_54_3)
			var_54_0:Apply()
		end

		local var_54_4 = Tex2DExtension.EncodeToJPG(var_54_0)
		local var_54_5 = AgoraCalc.BuildScreenShootSavePath(arg_53_1)

		if PathMgr.FileExists(var_54_5) then
			System.IO.File.Delete(var_54_5)
		end

		System.IO.File.WriteAllBytes(var_54_5, var_54_4)
		arg_53_2()
	end)
end

function var_0_0.RevertTakeScreenshot(arg_55_0)
	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.AGORA_CAMERA_NAME)
	arg_55_0:GetView():ShowOrHideContainer(true)
end

function var_0_0.OnUpdateItem4Theme(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = arg_56_0.themeCards[arg_56_2]

	if not var_56_0 then
		arg_56_0:OnInitItem4Theme(arg_56_2)

		var_56_0 = arg_56_0.themeCards[arg_56_2]
	end

	local var_56_1 = arg_56_0.displayThemes[arg_56_1 + 1]

	var_56_0:Update(var_56_1)
end

function var_0_0.GetDisplayThemes(arg_57_0)
	local var_57_0 = arg_57_0:GetView()
	local var_57_1 = var_57_0.agora:GetThemes()
	local var_57_2 = {}

	for iter_57_0, iter_57_1 in ipairs(var_57_1) do
		table.insert(var_57_2, iter_57_1)
	end

	if var_57_0.agora:GetMaxCustomThemeCnt() > #var_57_1 then
		table.insert(var_57_2, 1, {
			id = -1
		})
	end

	return var_57_2
end

function var_0_0.OnInitItem(arg_58_0, arg_58_1)
	local var_58_0 = AgoraDecorationCard.New(arg_58_1)
	local var_58_1 = false

	local function var_58_2()
		if var_58_1 then
			arg_58_0.descPage:ExecuteAction("Hide")

			var_58_1 = false
		end
	end

	var_58_0.onClickEvent:RemoveAllListeners()
	var_58_0.onClickEvent:AddListener(function()
		if var_58_1 then
			var_58_2()

			return
		end

		local var_60_0 = var_58_0.valueObject:GetAvailableItem()

		if var_60_0 then
			arg_58_0:Op("ClearNew", var_60_0.id)
		end

		if var_58_0.valueObject:IsOptionalShapeType() then
			arg_58_0.shapeSelectPanel:Show(var_58_0, function(arg_61_0)
				arg_58_0:GetView():EnterPaveTileMode(var_60_0, arg_61_0)
			end)
		elseif var_58_0.valueObject:IsBuilding() then
			if var_60_0 then
				arg_58_0:Op("ReplaceBuilding", var_60_0.id)
			end
		elseif var_58_0.valueObject:IsFoundation() then
			if var_60_0 then
				arg_58_0:Op("ReplaceFoundation", var_60_0.id)
			end
		else
			if var_58_0.valueObject:IsUsing() then
				local var_60_1 = var_58_0.valueObject:GetFirstItem()

				arg_58_0:Op("TrySelectItemById", var_60_1.id)

				return
			end

			if var_60_0 then
				arg_58_0:Op("PlaceItemRandonPosition", var_60_0.id)
			end
		end
	end)
	var_58_0.longPressTriggerEvent:RemoveAllListeners()
	var_58_0.longPressTriggerEvent:AddListener(function()
		var_58_1 = true

		arg_58_0.descPage:ExecuteAction("Show", var_58_0.valueObject, var_58_0._go.transform.position)
	end)
	var_58_0.onReleasedEvent:RemoveAllListeners()
	var_58_0.onReleasedEvent:AddListener(var_58_2)

	arg_58_0.cards[arg_58_1] = var_58_0
end

function var_0_0.OnUpdateItem(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = arg_63_0.cards[arg_63_2]

	if not var_63_0 then
		arg_63_0:OnInitItem(arg_63_2)

		var_63_0 = arg_63_0.cards[arg_63_2]
	end

	local var_63_1 = arg_63_0.displays[arg_63_1 + 1]

	var_63_0:Update(var_63_1, arg_63_0.selectedId)
end

function var_0_0.OnFliter(arg_64_0, arg_64_1)
	arg_64_0.indexData.tag = arg_64_1

	arg_64_0.shapeSelectPanel:Hide()
	arg_64_0:FlushList()
end

function var_0_0.OnSort(arg_65_0, arg_65_1)
	arg_65_0.indexData.sortKey = arg_65_1

	arg_65_0:UpdateOrderTxt()
	arg_65_0:FlushList()
end

function var_0_0.OnSearch(arg_66_0, arg_66_1)
	arg_66_0.indexData.searchKey = arg_66_1

	arg_66_0:FlushList()
end

function var_0_0.OnOrder(arg_67_0, arg_67_1)
	arg_67_0.indexData.order = arg_67_1
	arg_67_0.orderBtn.localScale = Vector3(1, arg_67_1 == 1 and 1 or -1, 1)

	arg_67_0:FlushList()
end

function var_0_0.UpdateOrderTxt(arg_68_0)
	arg_68_0.orderTxt.text = AgoraFurnitureType.Sort2CN(arg_68_0.indexData.sortKey)
end

function var_0_0.GetDisplays(arg_69_0)
	local var_69_0 = arg_69_0:GetView()
	local var_69_1 = var_69_0.agora:GetPlaceableList()
	local var_69_2 = {}

	for iter_69_0, iter_69_1 in pairs(var_69_1) do
		if not var_69_2[iter_69_1.configId] then
			var_69_2[iter_69_1.configId] = AgoraDecorationVO.New(iter_69_1.configId, var_69_0)
		end

		var_69_2[iter_69_1.configId]:AddItem(iter_69_1)
	end

	local var_69_3 = {}

	for iter_69_2, iter_69_3 in pairs(var_69_2) do
		if iter_69_3:IsType(arg_69_0.indexData.tag) and iter_69_3:IsMatchSearch(arg_69_0.indexData.searchKey) then
			table.insert(var_69_3, iter_69_3)
		end
	end

	local var_69_4

	if arg_69_0.indexData.sortKey == AgoraFurnitureType.SORT_DEFAULT then
		var_69_4 = {
			function(arg_70_0)
				return arg_70_0:IsUsing() and 0 or 1
			end,
			function(arg_71_0)
				return arg_71_0:IsNew() and 0 or 1
			end,
			function(arg_72_0)
				return -1 * arg_72_0:GetRarity()
			end,
			function(arg_73_0)
				return -1 * arg_73_0.id
			end
		}
	else
		var_69_4 = {
			function(arg_74_0)
				return arg_74_0:IsUsing() and 0 or 1
			end,
			function(arg_75_0)
				return arg_75_0:IsNew() and 0 or 1
			end,
			function(arg_76_0)
				return -1 * arg_76_0:GetSortValue(arg_69_0.indexData.sortKey, arg_69_0.indexData.order)
			end,
			function(arg_77_0)
				return -1 * arg_77_0.id
			end
		}
	end

	table.sort(var_69_3, CompareFuncs(var_69_4))

	return var_69_3
end

function var_0_0.Flush(arg_78_0)
	local var_78_0 = arg_78_0.selectedTagIndex or 1

	triggerToggle(arg_78_0.toggles[var_78_0], true)
	arg_78_0:FlushCapacity()
	arg_78_0:FlushSaveBtn()
	arg_78_0.anim:Play("anim_IslandAgoraDecorationUI_In")
end

function var_0_0.FlushCard(arg_79_0, arg_79_1)
	for iter_79_0, iter_79_1 in pairs(arg_79_0.cards or {}) do
		if iter_79_1.valueObject:Contains(arg_79_1) then
			iter_79_1:Update(iter_79_1.valueObject, arg_79_0.selectedId)

			break
		end
	end
end

function var_0_0.FlushList(arg_80_0)
	if not isActive(arg_80_0.scrollRect) then
		return
	end

	arg_80_0.displays = arg_80_0:GetDisplays()

	arg_80_0.scrollRect:SetTotalCount(#arg_80_0.displays)
	setActive(arg_80_0.emptyTr, #arg_80_0.displays == 0)
end

function var_0_0.FlushThemeList(arg_81_0)
	if not isActive(arg_81_0.scrollRect4Theme) then
		return
	end

	arg_81_0.displayThemes = arg_81_0:GetDisplayThemes()

	arg_81_0.scrollRect4Theme:SetTotalCount(#arg_81_0.displayThemes)
	setActive(arg_81_0.emptyTr, false)
end

function var_0_0.FlushCapacity(arg_82_0)
	local var_82_0 = arg_82_0:GetView().agora:GetCapacity()
	local var_82_1 = arg_82_0:GetView().agora:GetMaxCapacity()

	arg_82_0.capacityTxt.text = i18n("island_agora_capacity") .. ":<color=#a0ff9d>" .. var_82_0 .. "</color>/" .. var_82_1
end

function var_0_0.FlushSaveBtn(arg_83_0)
	local var_83_0 = arg_83_0:GetView():GetController()

	arg_83_0:AddSaveCdTimer(var_83_0.editCdTime)
end

function var_0_0.AddSaveCdTimer(arg_84_0, arg_84_1)
	arg_84_0:RemoveSaveCdTimer()

	if arg_84_1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
		arg_84_0.agoraSaveCdTxt.text = ""

		setActive(arg_84_0.agoraSaveBtn, true)
		setActive(arg_84_0.agoraSaveCdBtn, false)

		return
	end

	setActive(arg_84_0.agoraSaveBtn, false)
	setActive(arg_84_0.agoraSaveCdBtn, true)

	arg_84_0.saveCdTimer = Timer.New(function()
		local var_85_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if arg_84_1 - var_85_0 <= 0 then
			arg_84_0:RemoveSaveCdTimer()
			arg_84_0:FlushSaveBtn()
		else
			arg_84_0.agoraSaveCdTxt.text = pg.TimeMgr.GetInstance():DescCDTimeForMinute(arg_84_1 - var_85_0)
		end
	end, 1, -1)

	arg_84_0.saveCdTimer:Start()
	arg_84_0.saveCdTimer.func()
end

function var_0_0.RemoveSaveCdTimer(arg_86_0)
	if arg_86_0.saveCdTimer then
		arg_86_0.saveCdTimer:Stop()

		arg_86_0.saveCdTimer = nil
	end
end

function var_0_0.OnDestroy(arg_87_0)
	ClearLScrollrect(arg_87_0.scrollRect)
	ClearLScrollrect(arg_87_0.scrollRect4Theme)

	if arg_87_0.dftAniEvent then
		arg_87_0.dftAniEvent:SetEndEvent(nil)
	end

	arg_87_0:RemoveSaveCdTimer()

	if arg_87_0.sortPage then
		arg_87_0.sortPage:Destroy()

		arg_87_0.sortPage = nil
	end

	if arg_87_0.descPage then
		arg_87_0.descPage:Destroy()

		arg_87_0.descPage = nil
	end

	if arg_87_0.shapeSelectPanel then
		arg_87_0.shapeSelectPanel:Destroy()

		arg_87_0.shapeSelectPanel = nil
	end

	for iter_87_0, iter_87_1 in pairs(arg_87_0.cards or {}) do
		iter_87_1:Dispose()
	end

	arg_87_0.cards = nil

	for iter_87_2, iter_87_3 in pairs(arg_87_0.themeCards or {}) do
		iter_87_3:Dispose()
	end

	arg_87_0.themeCards = nil
end

return var_0_0
