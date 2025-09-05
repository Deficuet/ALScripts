local var_0_0 = class("IslandShipMainPage", import(".IslandBaseShipDisplayPage"))

var_0_0.OPEN_PAGE = "IslandShipMainPage:OPEN_PAGE"
var_0_0.SELECT_SHIP = "IslandShipMainPage:SELECT_SHIP"
var_0_0.CLOSE_DOCK = "IslandShipMainPage:CLOSE_DOCK"
var_0_0.PAGE_DRESS = 1
var_0_0.PAGE_INFO = 2
var_0_0.PAGE_STATUS = 3
var_0_0.PAGE_PROFILE = 4

function var_0_0.getUIName(arg_1_0)
	return "IslandShipMainUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("adapt/left_panel/back")
	arg_2_0.homeBtn = arg_2_0:findTF("adapt/home")
	arg_2_0.leftPanel = arg_2_0:findTF("adapt/left_panel")
	arg_2_0.dockBtn = arg_2_0:findTF("adapt/left_panel/dock_btn")
	arg_2_0.togglePanel = arg_2_0:findTF("adapt/toggles")
	arg_2_0.shipRect = arg_2_0:findTF("adapt/left_panel/ships"):GetComponent("LScrollRect")
	arg_2_0.shipContainer = arg_2_0:findTF("adapt/left_panel/ships/content")

	function arg_2_0.shipRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.shipRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	arg_2_0.toggles = {
		[var_0_0.PAGE_INFO] = arg_2_0:findTF("adapt/toggles/info"),
		[var_0_0.PAGE_DRESS] = arg_2_0:findTF("adapt/toggles/dress"),
		[var_0_0.PAGE_STATUS] = arg_2_0:findTF("adapt/toggles/gift"),
		[var_0_0.PAGE_PROFILE] = arg_2_0:findTF("adapt/toggles/data")
	}
	arg_2_0.pages = {
		[var_0_0.PAGE_INFO] = IslandShipInfoPage,
		[var_0_0.PAGE_DRESS] = IslandShipDressUpPageNew,
		[var_0_0.PAGE_STATUS] = IslandShipStatusPage,
		[var_0_0.PAGE_PROFILE] = IslandShipProfilePage
	}
	arg_2_0.cards = {}

	setActive(arg_2_0.togglePanel, true)
	setText(arg_2_0:findTF("adapt/left_panel/title/Text"), i18n("island_word_ship_desc"))
end

function var_0_0.GetSmoothRotateObject(arg_5_0)
	return GetOrAddComponent(arg_5_0:findTF("adapt/char"), typeof(SmoothRotateObject))
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddListener(var_0_0.CLOSE_DOCK, arg_6_0.OnCloseDock)
	arg_6_0:AddListener(var_0_0.OPEN_PAGE, arg_6_0.OnTriggerPage)
	arg_6_0:AddListener(IslandShipMainPage.SELECT_SHIP, arg_6_0.OnSelectShip)
	arg_6_0:AddListener(IslandCharacterAgency.ADD_SHIP, arg_6_0.OnAddShip)
	arg_6_0:AddListener(GAME.ISLAND_UPGRADE_SKILL_DONE, arg_6_0.OnSkillUpgrade)
end

function var_0_0.RemoveListeners(arg_7_0)
	arg_7_0:RemoveListener(var_0_0.CLOSE_DOCK, arg_7_0.OnCloseDock)
	arg_7_0:RemoveListener(var_0_0.OPEN_PAGE, arg_7_0.OnTriggerPage)
	arg_7_0:RemoveListener(IslandShipMainPage.SELECT_SHIP, arg_7_0.OnSelectShip)
	arg_7_0:RemoveListener(IslandCharacterAgency.ADD_SHIP, arg_7_0.OnAddShip)
	arg_7_0:RemoveListener(GAME.ISLAND_UPGRADE_SKILL_DONE, arg_7_0.OnSkillUpgrade)
end

function var_0_0.OnCloseDock(arg_8_0)
	arg_8_0:SetVisible(arg_8_0.leftPanel, true)
end

function var_0_0.OnSkillUpgrade(arg_9_0)
	for iter_9_0, iter_9_1 in pairs(arg_9_0.cards) do
		iter_9_1:FlushRedDot()
	end
end

function var_0_0.OnGotExtra(arg_10_0)
	if not arg_10_0.contextData.selectedId then
		return
	end

	local var_10_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_10_0.contextData.selectedId)

	arg_10_0:FlushExtraAward(var_10_0)
end

function var_0_0.OnAddShip(arg_11_0)
	arg_11_0:Flush()

	if not arg_11_0.contextData.selectedId then
		-- block empty
	end
end

function var_0_0.OnSelectShip(arg_12_0, arg_12_1)
	local var_12_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_12_1)

	arg_12_0:ClickCard(var_12_0, arg_12_1)
end

function var_0_0.OnTriggerPage(arg_13_0, arg_13_1)
	arg_13_0:TriggerPage(arg_13_1)
end

function var_0_0.OnInit(arg_14_0)
	onButton(arg_14_0, arg_14_0.homeBtn, function()
		arg_14_0:OnHome()
	end, SFX_PANEL)
	setActive(arg_14_0.homeBtn, not ISLAND_PLAYER_TESTING)
	onButton(arg_14_0, arg_14_0.backBtn, function()
		if arg_14_0.childPage then
			arg_14_0.childPage:CheckInReturn(function()
				arg_14_0:Hide()

				arg_14_0.childPage = nil
			end)
		else
			arg_14_0:Hide()
		end
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.dockBtn, function()
		arg_14_0:OpenPage(IslandDockPage)
		arg_14_0:SetVisible(arg_14_0.leftPanel, false)
	end, SFX_PANEL)

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.toggles) do
		onToggle(arg_14_0, iter_14_1, function(arg_19_0)
			if arg_19_0 then
				if arg_14_0.childPage then
					arg_14_0.childPage:CheckInReturn(function()
						arg_14_0:SwitchPage(iter_14_0)
					end)
				else
					arg_14_0:SwitchPage(iter_14_0)
				end
			end
		end, SFX_PANEL)
	end
end

function var_0_0.SwitchPage(arg_21_0, arg_21_1)
	if not arg_21_0.contextData.selectedId then
		return
	end

	if arg_21_0.page then
		arg_21_0:ClosePage(arg_21_0.page)

		arg_21_0.page = nil
	end

	local var_21_0 = arg_21_0.pages[arg_21_1]

	if arg_21_1 == 1 then
		if not arg_21_0.shipDressHelper then
			arg_21_0.shipDressHelper = IslandShipDressHelperNew.New()
		end

		arg_21_0.shipDressHelper:SetShipId(arg_21_0.contextData.selectedId)
		arg_21_0.shipDressHelper:OnRoleLoaded(arg_21_0.role.transform, arg_21_0.modelData)

		arg_21_0.childPage = arg_21_0:OpenPage(var_21_0, arg_21_0.contextData.selectedId, false, arg_21_0.shipDressHelper, function(arg_22_0)
			arg_21_0:SetObjInitRotaion(arg_22_0)
		end)
	else
		arg_21_0:OpenPage(var_21_0, arg_21_0.contextData.selectedId)

		arg_21_0.childPage = nil
	end

	arg_21_0.page = var_21_0
end

function var_0_0.TriggerPage(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.toggles[arg_23_1]

	triggerToggle(var_23_0, true)
end

function var_0_0.Show(arg_24_0)
	var_0_0.super.Show(arg_24_0)
	arg_24_0:Flush()
end

function var_0_0.Flush(arg_25_0)
	local var_25_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	arg_25_0:FlushShips(var_25_0)
	arg_25_0:ActiveDefaultCard()
end

function var_0_0.ActiveDefaultCard(arg_26_0)
	if arg_26_0.contextData.selectedId then
		local var_26_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_26_0.contextData.selectedId)

		arg_26_0.contextData.selectedId = nil

		arg_26_0:UpdateMainView(var_26_0)
		setActive(arg_26_0.togglePanel, true)
	end
end

function var_0_0.OnInitItem(arg_27_0, arg_27_1)
	local var_27_0 = IslandMiniShipCard.New(arg_27_1)

	onButton(arg_27_0, var_27_0.go, function()
		if arg_27_0.childPage then
			arg_27_0.childPage:CheckInReturn(function()
				arg_27_0.childPage = nil

				arg_27_0:ClickCard(var_27_0.ship, var_27_0.configId)
			end)
		else
			arg_27_0:ClickCard(var_27_0.ship, var_27_0.configId)
		end
	end, SFX_PANEL)

	arg_27_0.cards[arg_27_1] = var_27_0
end

function var_0_0.ClickCard(arg_30_0, arg_30_1, arg_30_2)
	if arg_30_1 then
		arg_30_0:ClearSelected(arg_30_0.contextData.selectedId)
		arg_30_0:UpdateMainView(arg_30_1)
		arg_30_0:MarkSelected(arg_30_2)
	else
		arg_30_0:UpdateUnlockView(arg_30_2)
	end
end

function var_0_0.ClearSelected(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in pairs(arg_31_0.cards) do
		if iter_31_1.configId == arg_31_1 then
			iter_31_1:UpdateSelected(nil)

			break
		end
	end
end

function var_0_0.MarkSelected(arg_32_0, arg_32_1)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.cards) do
		if iter_32_1.configId == arg_32_1 then
			iter_32_1:UpdateSelected(iter_32_1.configId)

			break
		end
	end
end

function var_0_0.OnUpdateItem(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_0.cards[arg_33_2]

	if not var_33_0 then
		arg_33_0:OnInitItem(arg_33_2)

		var_33_0 = arg_33_0.cards[arg_33_2]
	end

	local var_33_1 = arg_33_0.displays[arg_33_1 + 1]

	if not var_33_1 then
		return
	end

	var_33_0:Update(var_33_1, arg_33_0.contextData.selectedId)
end

function var_0_0.FlushShips(arg_34_0, arg_34_1)
	arg_34_0.displays = {}
	arg_34_0.displays = arg_34_1:GetUnlockOrCanUnlockShipConfigIds()

	local var_34_0

	if #arg_34_0.displays > 0 then
		var_34_0 = arg_34_1:GetShipById(arg_34_0.displays[1])
	end

	arg_34_0.contextData.selectedId = arg_34_0.contextData.selectedId or var_34_0 and var_34_0.configId

	arg_34_0.shipRect:SetTotalCount(#arg_34_0.displays)
end

function var_0_0.CalcShipLayout(arg_35_0)
	local var_35_0 = arg_35_0.shipContainer.rect.height
	local var_35_1 = arg_35_0.shipRect.gameObject.transform

	if var_35_0 < var_35_1.rect.height then
		local var_35_2 = (arg_35_0._tf.rect.height - var_35_0) * 0.5

		var_35_1.offsetMax = Vector2(var_35_1.offsetMax.x, -var_35_2)
		var_35_1.offsetMin = Vector2(var_35_1.offsetMin.x, var_35_2)
	end
end

function var_0_0.UpdateMainView(arg_36_0, arg_36_1)
	if arg_36_0.contextData.selectedId == arg_36_1.configId then
		return
	end

	arg_36_0:LoadCharacter(arg_36_1:GetModel())

	arg_36_0.contextData.selectedId = arg_36_1.configId

	arg_36_0:TriggerPage(var_0_0.PAGE_INFO)
end

function var_0_0.UpdateUnlockView(arg_37_0, arg_37_1)
	local var_37_0 = pg.island_chara_template[arg_37_1].name

	arg_37_0:ShowMsgBox({
		content = i18n("island_open_ship_tip"),
		onYes = function()
			arg_37_0:Hide()
			arg_37_0:emit(IslandBaseMediator.SWITCH_MAP, IslandConst.LABORATORY_MAP_ID, IslandConst.LETTEROFINVITATION_SP)
		end
	})
end

function var_0_0.OnDestroy(arg_39_0)
	var_0_0.super.OnDestroy(arg_39_0)

	for iter_39_0, iter_39_1 in pairs(arg_39_0.cards or {}) do
		iter_39_1:Dispose()
	end

	arg_39_0.cards = nil

	if arg_39_0.timer then
		arg_39_0.timer:Stop()
	end

	if arg_39_0.shipDressHelper then
		arg_39_0.shipDressHelper:Destroy()
	end
end

function var_0_0.OnCharLoaded(arg_40_0)
	if arg_40_0.shipDressHelper then
		arg_40_0.shipDressHelper:OnRoleLoaded(arg_40_0.role.transform, arg_40_0.modelData)
	end
end

function var_0_0.SetObjInitRotaion(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0:GetSmoothRotateObject()

	var_41_0.rotationSpeed = 5

	ReflectionHelp.RefSetProperty(typeof(SmoothRotateObject), "targetRotation", var_41_0, arg_41_1)

	if arg_41_0.timer then
		arg_41_0.timer:Stop()
	end

	arg_41_0.timer = Timer.New(function()
		local var_42_0 = pg.island_set.character_detail_camera_speed.key_value_int

		var_41_0.rotationSpeed = var_42_0
	end, 0.5, 1)

	arg_41_0.timer:Start()
end

return var_0_0
