local var_0_0 = class("AgoraDecorationView", import("Mod.Island.Core.View.IslandBaseSubView"))

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

function var_0_0.PlayExitAnim(arg_3_0, arg_3_1)
	if arg_3_0.isAniming then
		return
	end

	arg_3_0.isAniming = true

	arg_3_0.dftAniEvent:SetEndEvent(function()
		arg_3_0.isAniming = false

		arg_3_1()
		var_0_0.super.Hide(arg_3_0)
	end)
	arg_3_0.anim:Play("anim_IslandAgoraDecorationUI_Out")
end

function var_0_0.OnSelectedItem(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_0.selectedId

	arg_5_0.selectedId = arg_5_1

	for iter_5_0, iter_5_1 in pairs(arg_5_0.cards) do
		iter_5_1:UpdateSelected(arg_5_0.selectedId)
	end

	if not arg_5_2 then
		arg_5_0:TriggerTag(arg_5_1)

		return
	end

	if arg_5_0.selectedId > 0 and not arg_5_0.isHideState then
		triggerButton(arg_5_0.hideBtn)
		arg_5_0:FoldBtnsAndTop()
	elseif arg_5_3 then
		local var_5_1 = _.detect(arg_5_0.displays, function(arg_6_0)
			return arg_6_0:Contains(arg_5_3)
		end)

		if var_5_1 and var_5_1:GetAvailableCnt() > 0 then
			return
		end

		if arg_5_1 < 0 then
			triggerButton(arg_5_0.showBtn)
		end
	elseif arg_5_1 < 0 then
		triggerButton(arg_5_0.showBtn)
	end
end

function var_0_0.TriggerTag(arg_7_0, arg_7_1)
	if arg_7_1 <= 0 then
		return
	end

	local var_7_0 = arg_7_0:GetView().agora:GetPlaceableItem(arg_7_1)

	if not var_7_0 then
		return
	end

	local var_7_1 = table.indexof(AgoraFurnitureType.PLACEMENT_TYPE, var_7_0:GetType())

	if var_7_1 > 0 then
		triggerToggle(arg_7_0.toggles[var_7_1], true)
	end
end

function var_0_0.OnCreateSameItem(arg_8_0, arg_8_1)
	local var_8_0 = _.detect(arg_8_0.displays, function(arg_9_0)
		return arg_9_0:Contains(arg_8_1)
	end)

	if var_8_0 and var_8_0:GetAvailableCnt() > 0 then
		local var_8_1 = var_8_0:GetAvailableItem()

		arg_8_0:Op("PlaceItemRandonPosition", var_8_1.id)
	end
end

function var_0_0.RegisterEvent(arg_10_0)
	function arg_10_0.scrollRect.onInitItem(arg_11_0)
		arg_10_0:OnInitItem(arg_11_0)
	end

	function arg_10_0.scrollRect.onUpdateItem(arg_12_0, arg_12_1)
		arg_10_0:OnUpdateItem(arg_12_0, arg_12_1)
	end

	function arg_10_0.scrollRect4Theme.onInitItem(arg_13_0)
		arg_10_0:OnInitItem4Theme(arg_13_0)
	end

	function arg_10_0.scrollRect4Theme.onUpdateItem(arg_14_0, arg_14_1)
		arg_10_0:OnUpdateItem4Theme(arg_14_0, arg_14_1)
	end

	onButton(arg_10_0, arg_10_0.agoraSaveBtn, function()
		if arg_10_0:TrySave() then
			arg_10_0:Op("Save")
		end
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.agoraClearBtn, function()
		arg_10_0:ShowMsgbox({
			content = i18n("island_agora_clear_tip"),
			onYes = function()
				arg_10_0:Op("ClearAll")
			end
		})
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.agoraRevertBtn, function()
		arg_10_0:ShowMsgbox({
			content = i18n("island_agora_revert_tip"),
			onYes = function()
				arg_10_0:Op("Revert")
			end
		})
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.capacityBtn, function()
		local var_20_0 = arg_10_0:GetView()
		local var_20_1 = var_20_0.agora:GetPlacedInfoList()
		local var_20_2 = var_20_0.agora:GetMaxCapacity()

		arg_10_0:ShowMsgbox({
			type = IslandMsgBox.TYPE_AGORA_PLACED_LIST,
			list = var_20_1,
			totalCnt = var_20_2
		})
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.agoraShopBtn, function()
		if arg_10_0:GetView():GetController():CheckChange() then
			arg_10_0:Save()
		else
			arg_10_0:PlayExitAnim(function()
				arg_10_0:Op("ExitEditMode")
				arg_10_0:NotifiyIsland(ISLAND_EX_EVT.OPEN_PAGE, IslandShopPage, {
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
	onButton(arg_10_0, arg_10_0.backBtn, function()
		if arg_10_0:GetView():GetController():CheckChange() then
			arg_10_0:Save()
		else
			arg_10_0:PlayExitAnim(function()
				arg_10_0:Op("ExitEditMode")
			end)
		end
	end, SFX_PANEL)
	onInputChanged(arg_10_0, arg_10_0.searchInput, function()
		local var_25_0 = getInputText(arg_10_0.searchInput)

		setActive(arg_10_0.searchClearBtn, var_25_0 ~= "")
		arg_10_0:OnSearch(var_25_0)
	end)
	onButton(arg_10_0, arg_10_0.searchClearBtn, function()
		setInputText(arg_10_0.searchInput, "")

		arg_10_0.indexData.searchKey = ""
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.sortBtn, function()
		arg_10_0.sortPage:ExecuteAction("Show", arg_10_0.indexData, function(arg_28_0)
			arg_10_0:OnSort(arg_28_0)
		end)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.orderBtn, function()
		local var_29_0 = 1 - arg_10_0.indexData.order

		arg_10_0:OnOrder(var_29_0)
	end, SFX_PANEL)

	arg_10_0.isHideState = false
	arg_10_0.isHideBtnAndTop = false

	onButton(arg_10_0, arg_10_0.hideBtn, function()
		arg_10_0.isHideState = true

		arg_10_0.panelAnim:Play("fold")
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.showBtn, function()
		arg_10_0.isHideState = false

		arg_10_0.panelAnim:Play("unfold")

		if arg_10_0.isHideBtnAndTop then
			arg_10_0:UnFoldBtnsAndTop()
		end
	end, SFX_PANEL)
end

function var_0_0.TrySave(arg_32_0)
	local var_32_0 = arg_32_0:GetView():GetController():CanEnterEditMode()

	if not var_32_0 then
		arg_32_0:ShowMsgbox({
			type = IslandMsgBox.TYPE_AOGRA_SAVE_CD,
			duetime = arg_32_0:GetView():GetController().editCdTime,
			onNo = function()
				arg_32_0:Op("RevertAndExit")
			end
		})
	end

	return var_32_0
end

function var_0_0.Save(arg_34_0)
	if arg_34_0:TrySave() then
		arg_34_0:ShowMsgbox({
			content = i18n("island_agora_save_or_exit_tip"),
			noText = i18n("island_agora_exit_and_unsave"),
			yesText = i18n("island_agora_exit_and_save"),
			onYes = function()
				arg_34_0:Op("SaveAndExit")
			end,
			onNo = function()
				arg_34_0:Op("RevertAndExit")
			end
		})
	end
end

function var_0_0.FoldBtnsAndTop(arg_37_0)
	setActive(arg_37_0.agoraSaveBtn, false)
	setActive(arg_37_0.agoraClearBtn, false)
	setActive(arg_37_0.agoraRevertBtn, false)
	setActive(arg_37_0.topPanel, false)

	arg_37_0.isHideBtnAndTop = true
end

function var_0_0.UnFoldBtnsAndTop(arg_38_0)
	setActive(arg_38_0.agoraSaveBtn, true)
	setActive(arg_38_0.agoraClearBtn, true)
	setActive(arg_38_0.agoraRevertBtn, true)
	setActive(arg_38_0.topPanel, true)

	arg_38_0.isHideBtnAndTop = false
end

function var_0_0.InitTags(arg_39_0)
	arg_39_0.toggles = {}

	arg_39_0.tagUIItemList:make(function(arg_40_0, arg_40_1, arg_40_2)
		if arg_40_0 == UIItemList.EventUpdate then
			local var_40_0 = AgoraFurnitureType.PLACEMENT_TYPE[arg_40_1 + 1]

			onToggle(arg_39_0, arg_40_2, function(arg_41_0)
				if arg_41_0 then
					arg_39_0.selectedTagIndex = arg_40_1 + 1

					arg_39_0:GetView():OnTagChange(var_40_0)
					arg_39_0:OnFliter(var_40_0)
				end
			end, SFX_PANEL)
			setText(arg_40_2:Find("sel/Text"), AgoraFurnitureType.Type2CN(var_40_0))
			table.insert(arg_39_0.toggles, arg_40_2)
		end
	end)
	arg_39_0.tagUIItemList:align(#AgoraFurnitureType.PLACEMENT_TYPE)
	onToggle(arg_39_0, arg_39_0.themeBtn, function(arg_42_0)
		if arg_42_0 then
			arg_39_0.selectedTagIndex = nil

			arg_39_0:FlushThemeList()
		end
	end, SFX_PANEL)
end

function var_0_0.OnInitItem4Theme(arg_43_0, arg_43_1)
	local var_43_0 = AgoraDecorationThemeCard.New(arg_43_1)

	onButton(arg_43_0, var_43_0.mainTr, function()
		local var_44_0 = isa(var_43_0.theme, AgoraSystemTheme)
		local var_44_1 = var_44_0 and IslandMsgBox.TYPE_SYSTEM_THEME or IslandMsgBox.TYPE_THEME

		arg_43_0:ShowMsgbox({
			type = var_44_1,
			theme = var_43_0.theme,
			onYes = function()
				arg_43_0:Op("ApplyTheme", var_43_0.theme.id, var_44_0)
			end,
			onDel = function()
				arg_43_0:Op("DeleteTheme", var_43_0.theme.id)
			end
		})
	end, SFX_PANEL)
	onButton(arg_43_0, var_43_0.addTr, function()
		local var_47_0 = arg_43_0:GetView().agora:GetUseableThemeId()

		if not var_47_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_no_pos_place"))

			return
		end

		seriesAsync({
			function(arg_48_0)
				arg_43_0:PrepareToTakeScreenshot()
				arg_43_0:ShootScreen(var_47_0, arg_48_0)
			end,
			function()
				arg_43_0:RevertTakeScreenshot()
				arg_43_0:ShowMsgbox({
					type = IslandMsgBox.TYPE_SAVE_THEME,
					id = var_47_0,
					onYes = function(arg_50_0)
						arg_43_0:Op("SaveTheme", var_47_0, arg_50_0)
					end
				})
			end
		})
	end, SFX_PANEL)

	arg_43_0.themeCards[arg_43_1] = var_43_0
end

function var_0_0.PrepareToTakeScreenshot(arg_51_0)
	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.AGORA_CAMERA_SHOOTSCREEN_NAME)
	arg_51_0:GetView():ShowOrHideContainer(false)
end

function var_0_0.ShootScreen(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = IslandCameraMgr.instance._mainCamera
	local var_52_1 = 426
	local var_52_2 = 320

	BLHX.Rendering.HotUpdate.ScreenShooterPass.TakePhoto(var_52_0, function(arg_53_0)
		local var_53_0

		if arg_53_0.width < var_52_1 or arg_53_0.height < var_52_2 then
			var_53_0 = arg_53_0
		else
			local var_53_1 = arg_53_0.width * 0.5 - var_52_1 * 0.5
			local var_53_2 = arg_53_0.height * 0.5 - var_52_2 * 0.5
			local var_53_3 = arg_53_0:GetPixels(var_53_1, var_53_2, var_52_1, var_52_2)

			var_53_0 = UnityEngine.Texture2D.New(var_52_1, var_52_2)

			var_53_0:SetPixels(var_53_3)
			var_53_0:Apply()
		end

		local var_53_4 = Tex2DExtension.EncodeToJPG(var_53_0)
		local var_53_5 = AgoraCalc.BuildScreenShootSavePath(arg_52_1)

		if PathMgr.FileExists(var_53_5) then
			System.IO.File.Delete(var_53_5)
		end

		System.IO.File.WriteAllBytes(var_53_5, var_53_4)
		arg_52_2()
	end)
end

function var_0_0.RevertTakeScreenshot(arg_54_0)
	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.AGORA_CAMERA_NAME)
	arg_54_0:GetView():ShowOrHideContainer(true)
end

function var_0_0.OnUpdateItem4Theme(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = arg_55_0.themeCards[arg_55_2]

	if not var_55_0 then
		arg_55_0:OnInitItem4Theme(arg_55_2)

		var_55_0 = arg_55_0.themeCards[arg_55_2]
	end

	local var_55_1 = arg_55_0.displayThemes[arg_55_1 + 1]

	var_55_0:Update(var_55_1)
end

function var_0_0.GetDisplayThemes(arg_56_0)
	local var_56_0 = arg_56_0:GetView()
	local var_56_1 = var_56_0.agora:GetThemes()
	local var_56_2 = {}

	for iter_56_0, iter_56_1 in ipairs(var_56_1) do
		table.insert(var_56_2, iter_56_1)
	end

	if var_56_0.agora:GetMaxCustomThemeCnt() > #var_56_1 then
		table.insert(var_56_2, 1, {
			id = -1
		})
	end

	local var_56_3 = var_56_0.agora:GetSystemThemes()

	for iter_56_2, iter_56_3 in ipairs(var_56_3) do
		if iter_56_3:Owned(var_56_0.agora:GetPlaceableList()) then
			table.insert(var_56_2, iter_56_3)
		end
	end

	return var_56_2
end

function var_0_0.OnInitItem(arg_57_0, arg_57_1)
	local var_57_0 = AgoraDecorationCard.New(arg_57_1)
	local var_57_1 = false

	local function var_57_2()
		if var_57_1 then
			arg_57_0.descPage:ExecuteAction("Hide")

			var_57_1 = false
		end
	end

	var_57_0.onClickEvent:RemoveAllListeners()
	var_57_0.onClickEvent:AddListener(function()
		if var_57_1 then
			var_57_2()

			return
		end

		local var_59_0 = var_57_0.valueObject:GetAvailableItem()

		if var_57_0.valueObject:IsOptionalShapeType() then
			arg_57_0.shapeSelectPanel:Show(var_57_0, function(arg_60_0)
				arg_57_0:GetView():EnterPaveTileMode(var_59_0, arg_60_0)
			end)
		elseif var_57_0.valueObject:IsBuilding() then
			if var_59_0 then
				arg_57_0:Op("ReplaceBuilding", var_59_0.id)
			end
		elseif var_57_0.valueObject:IsFoundation() then
			if var_59_0 then
				arg_57_0:Op("ReplaceFoundation", var_59_0.id)
			end
		else
			if var_57_0.valueObject:IsUsing() then
				local var_59_1 = var_57_0.valueObject:GetFirstItem()

				arg_57_0:Op("TrySelectItemById", var_59_1.id)

				return
			end

			if var_59_0 then
				arg_57_0:Op("PlaceItemRandonPosition", var_59_0.id)
			end
		end
	end)
	var_57_0.longPressTriggerEvent:RemoveAllListeners()
	var_57_0.longPressTriggerEvent:AddListener(function()
		var_57_1 = true

		arg_57_0.descPage:ExecuteAction("Show", var_57_0.valueObject, var_57_0._go.transform.position)
	end)
	var_57_0.onReleasedEvent:RemoveAllListeners()
	var_57_0.onReleasedEvent:AddListener(var_57_2)

	arg_57_0.cards[arg_57_1] = var_57_0
end

function var_0_0.OnUpdateItem(arg_62_0, arg_62_1, arg_62_2)
	local var_62_0 = arg_62_0.cards[arg_62_2]

	if not var_62_0 then
		arg_62_0:OnInitItem(arg_62_2)

		var_62_0 = arg_62_0.cards[arg_62_2]
	end

	local var_62_1 = arg_62_0.displays[arg_62_1 + 1]

	var_62_0:Update(var_62_1, arg_62_0.selectedId)
end

function var_0_0.OnFliter(arg_63_0, arg_63_1)
	arg_63_0.indexData.tag = arg_63_1

	arg_63_0.shapeSelectPanel:Hide()
	arg_63_0:FlushList()
end

function var_0_0.OnSort(arg_64_0, arg_64_1)
	arg_64_0.indexData.sortKey = arg_64_1

	arg_64_0:UpdateOrderTxt()
	arg_64_0:FlushList()
end

function var_0_0.OnSearch(arg_65_0, arg_65_1)
	arg_65_0.indexData.searchKey = arg_65_1

	arg_65_0:FlushList()
end

function var_0_0.OnOrder(arg_66_0, arg_66_1)
	arg_66_0.indexData.order = arg_66_1
	arg_66_0.orderBtn.localScale = Vector3(1, arg_66_1 == 1 and 1 or -1, 1)

	arg_66_0:FlushList()
end

function var_0_0.UpdateOrderTxt(arg_67_0)
	arg_67_0.orderTxt.text = AgoraFurnitureType.Sort2CN(arg_67_0.indexData.sortKey)
end

function var_0_0.GetDisplays(arg_68_0)
	local var_68_0 = arg_68_0:GetView()
	local var_68_1 = var_68_0.agora:GetPlaceableList()
	local var_68_2 = {}

	for iter_68_0, iter_68_1 in pairs(var_68_1) do
		if not var_68_2[iter_68_1.configId] then
			var_68_2[iter_68_1.configId] = AgoraDecorationVO.New(iter_68_1.configId, var_68_0)
		end

		var_68_2[iter_68_1.configId]:AddItem(iter_68_1)
	end

	local var_68_3 = {}

	for iter_68_2, iter_68_3 in pairs(var_68_2) do
		if iter_68_3:IsType(arg_68_0.indexData.tag) and iter_68_3:IsMatchSearch(arg_68_0.indexData.searchKey) then
			table.insert(var_68_3, iter_68_3)
		end
	end

	local var_68_4

	if arg_68_0.indexData.sortKey == AgoraFurnitureType.SORT_DEFAULT then
		var_68_4 = {
			function(arg_69_0)
				return arg_69_0:IsUsing() and 0 or 1
			end,
			function(arg_70_0)
				return arg_70_0.id
			end
		}
	else
		var_68_4 = {
			function(arg_71_0)
				return arg_71_0:IsUsing() and 0 or 1
			end,
			function(arg_72_0)
				return arg_72_0:GetSortValue(arg_68_0.indexData.sortKey, arg_68_0.indexData.order)
			end
		}
	end

	table.sort(var_68_3, CompareFuncs(var_68_4))

	return var_68_3
end

function var_0_0.Flush(arg_73_0)
	local var_73_0 = arg_73_0.selectedTagIndex or 1

	triggerToggle(arg_73_0.toggles[var_73_0], true)
	arg_73_0:FlushCapacity()
	arg_73_0:FlushSaveBtn()
end

function var_0_0.FlushList(arg_74_0)
	if not isActive(arg_74_0.scrollRect) then
		return
	end

	arg_74_0.displays = arg_74_0:GetDisplays()

	arg_74_0.scrollRect:SetTotalCount(#arg_74_0.displays)
	setActive(arg_74_0.emptyTr, #arg_74_0.displays == 0)
end

function var_0_0.FlushThemeList(arg_75_0)
	if not isActive(arg_75_0.scrollRect4Theme) then
		return
	end

	arg_75_0.displayThemes = arg_75_0:GetDisplayThemes()

	arg_75_0.scrollRect4Theme:SetTotalCount(#arg_75_0.displayThemes)
	setActive(arg_75_0.emptyTr, false)
end

function var_0_0.FlushCapacity(arg_76_0)
	local var_76_0 = arg_76_0:GetView().agora:GetCapacity()
	local var_76_1 = arg_76_0:GetView().agora:GetMaxCapacity()

	arg_76_0.capacityTxt.text = i18n("island_agora_label_capacity") .. ":<color=#a0ff9d>" .. var_76_0 .. "</color>/" .. var_76_1
end

function var_0_0.FlushSaveBtn(arg_77_0)
	local var_77_0 = arg_77_0:GetView():GetController()

	arg_77_0:AddSaveCdTimer(var_77_0.editCdTime)
end

function var_0_0.AddSaveCdTimer(arg_78_0, arg_78_1)
	arg_78_0:RemoveSaveCdTimer()

	if arg_78_1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
		arg_78_0.agoraSaveCdTxt.text = ""

		setActive(arg_78_0.agoraSaveBtn, true)
		setActive(arg_78_0.agoraSaveCdBtn, false)

		return
	end

	setActive(arg_78_0.agoraSaveBtn, false)
	setActive(arg_78_0.agoraSaveCdBtn, true)

	arg_78_0.saveCdTimer = Timer.New(function()
		local var_79_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if arg_78_1 - var_79_0 <= 0 then
			arg_78_0:RemoveSaveCdTimer()
			arg_78_0:FlushSaveBtn()
		else
			arg_78_0.agoraSaveCdTxt.text = pg.TimeMgr.GetInstance():DescCDTimeForMinute(arg_78_1 - var_79_0)
		end
	end, 1, -1)

	arg_78_0.saveCdTimer:Start()
	arg_78_0.saveCdTimer.func()
end

function var_0_0.RemoveSaveCdTimer(arg_80_0)
	if arg_80_0.saveCdTimer then
		arg_80_0.saveCdTimer:Stop()

		arg_80_0.saveCdTimer = nil
	end
end

function var_0_0.OnDestroy(arg_81_0)
	if arg_81_0.dftAniEvent then
		arg_81_0.dftAniEvent:SetEndEvent(nil)
	end

	arg_81_0:RemoveSaveCdTimer()

	if arg_81_0.sortPage then
		arg_81_0.sortPage:Destroy()

		arg_81_0.sortPage = nil
	end

	if arg_81_0.descPage then
		arg_81_0.descPage:Destroy()

		arg_81_0.descPage = nil
	end

	if arg_81_0.shapeSelectPanel then
		arg_81_0.shapeSelectPanel:Destroy()

		arg_81_0.shapeSelectPanel = nil
	end

	for iter_81_0, iter_81_1 in pairs(arg_81_0.cards or {}) do
		iter_81_1:Dispose()
	end

	arg_81_0.cards = nil

	for iter_81_2, iter_81_3 in pairs(arg_81_0.themeCards or {}) do
		iter_81_3:Dispose()
	end

	arg_81_0.themeCards = nil
end

return var_0_0
