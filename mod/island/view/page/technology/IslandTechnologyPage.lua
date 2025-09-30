local var_0_0 = class("IslandTechnologyPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTechnologyUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.rtTop = arg_2_0._tf:Find("adapt/top")

	setText(arg_2_0.rtTop:Find("title/Text"), i18n("island_technology_title"))

	arg_2_0.centreToggleTF = arg_2_0._tf:Find("adapt/types/1")
	arg_2_0.centreTipTF = arg_2_0.centreToggleTF:Find("tip")

	local var_2_0 = arg_2_0._tf:Find("adapt/types/content")

	arg_2_0.typeUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	local var_2_1 = arg_2_0._tf:Find("adapt/pages")

	arg_2_0.pages = {}

	local var_2_2 = setmetatable({
		onItemClick = function(arg_3_0, arg_3_1)
			arg_2_0.detailPanel:ExecuteAction("Show", arg_3_0, arg_3_1)
		end
	}, {
		__index = arg_2_0.contextData
	})

	arg_2_0.pages[IslandTechBelong.CENTRE] = IslandTechCentrePanel.New(var_2_1, arg_2_0.event, var_2_2)

	for iter_2_0, iter_2_1 in ipairs(IslandTechBelong.COMMON_SHOW_TYPES) do
		arg_2_0.pages[iter_2_1] = IslandTechTreePanel.New(var_2_1, arg_2_0.event, setmetatable({
			type = iter_2_1
		}, {
			__index = var_2_2
		}))
	end

	arg_2_0.quickPanel = IslandTechQuickPanel.New(arg_2_0._tf, arg_2_0.event, setmetatable({
		onGetAwardDone = function(arg_4_0)
			arg_2_0:OpenPage(IslandTechAwardPage, arg_4_0)
		end
	}, {
		__index = arg_2_0.contextData
	}))

	arg_2_0.quickPanel:RegisterView(arg_2_0.viewComponent)

	arg_2_0.detailPanel = IslandTechDetailPanel.New(arg_2_0._tf, arg_2_0.event, setmetatable({
		onSelecteShip = function()
			arg_2_0:OpenPage(IslandShipSelectPage, {
				confirmFunc = function(arg_6_0)
					arg_2_0.detailPanel:ExecuteAction("OnShipSelected", arg_6_0[1])
				end
			})
		end,
		onFinishImmd = function(arg_7_0)
			arg_2_0:emit(IslandMediator.ON_FINISH_TECH_IMMD, arg_7_0, function()
				arg_2_0:OpenPage(IslandTechAwardPage, arg_7_0)
			end)
		end,
		onGetAwardDone = function(arg_9_0)
			arg_2_0:OpenPage(IslandTechAwardPage, arg_9_0)
		end,
		openTicketPage = function(arg_10_0)
			arg_2_0:OpenPage(IslandTicketUsePage, IslandUseTicketCommand.TYPES.APPOINT, arg_10_0)
		end
	}, {
		__index = arg_2_0.contextData
	}))

	arg_2_0.detailPanel:RegisterView(arg_2_0.viewComponent)
end

function var_0_0.OnInit(arg_11_0)
	onButton(arg_11_0, arg_11_0.rtTop:Find("back"), function()
		arg_11_0:Hide()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.rtTop:Find("home"), function()
		arg_11_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onToggle(arg_11_0, arg_11_0.centreToggleTF, function(arg_14_0)
		if arg_14_0 and arg_11_0.curPage ~= IslandTechBelong.CENTRE then
			arg_11_0.curPage = IslandTechBelong.CENTRE

			arg_11_0:SwitchPage()
		end
	end, SFX_PANEL)

	arg_11_0.commonTypes = IslandTechBelong.COMMON_SHOW_TYPES

	arg_11_0.typeUIList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventInit then
			arg_11_0:InitTypeItem(arg_15_1, arg_15_2)
		elseif arg_15_0 == UIItemList.EventUpdate then
			arg_11_0:UpdateTypeItem(arg_15_1, arg_15_2)
		end
	end)
end

function var_0_0.AddListeners(arg_16_0)
	arg_16_0:AddListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_16_0.Flush)
	arg_16_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_16_0.Flush)
	arg_16_0:AddListener(GAME.ISLAND_FINISH_TECH_IMMD_DONE, arg_16_0.CheckAutoUnlock)
	arg_16_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_16_0.Flush)
	arg_16_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_16_0.CheckAutoUnlock)
end

function var_0_0.RemoveListeners(arg_17_0)
	arg_17_0:RemoveListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_17_0.Flush)
	arg_17_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_17_0.Flush)
	arg_17_0:RemoveListener(GAME.ISLAND_FINISH_TECH_IMMD_DONE, arg_17_0.CheckAutoUnlock)
	arg_17_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_17_0.Flush)
	arg_17_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_17_0.CheckAutoUnlock)
end

function var_0_0.InitTypeItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.commonTypes[arg_18_1 + 1]

	arg_18_2.name = var_18_0

	local var_18_1 = IslandTechBelong.Names[var_18_0]

	setText(arg_18_2:Find("unsel"), var_18_1)
	setText(arg_18_2:Find("sel/content/Text"), var_18_1)
	LoadImageSpriteAsync("island/islandtechnology/tech_type_" .. IslandTechBelong.Fields[var_18_0], arg_18_2:Find("sel/content/Image"), true)
	onToggle(arg_18_0, arg_18_2, function(arg_19_0)
		if arg_19_0 and arg_18_0.curPage ~= var_18_0 then
			arg_18_0.curPage = var_18_0

			arg_18_0:SwitchPage()
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateTypeItem(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.commonTypes[arg_20_1 + 1]

	setActive(arg_20_2:Find("unsel/tip"), arg_20_0:IsReceiveByType(var_20_0))
	setActive(arg_20_2:Find("sel/tip"), arg_20_0:IsReceiveByType(var_20_0))
end

function var_0_0.IsReceiveByType(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in pairs(arg_21_0.techAgency:GetTechnologys()) do
		if iter_21_1:getConfig("tech_belong") == arg_21_1 and iter_21_1:GetStatus() == IslandTechnology.STATUS.RECEIVE then
			return true
		end
	end

	return false
end

function var_0_0.FlushCentreTip(arg_22_0)
	setActive(arg_22_0.centreTipTF, arg_22_0:IsReceiveByType(IslandTechBelong.CENTRE))
end

function var_0_0.SwitchPage(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.pages) do
		if iter_23_0 == arg_23_0.curPage then
			iter_23_1:ExecuteAction("Show")
		else
			iter_23_1:ExecuteAction("Hide")
		end
	end
end

function var_0_0.OnShow(arg_24_0)
	triggerToggle(arg_24_0.centreToggleTF, true)
	arg_24_0.quickPanel:ExecuteAction("Show")
	arg_24_0:CheckAutoUnlock()
end

function var_0_0.CheckAutoUnlock(arg_25_0)
	getProxy(IslandProxy):GetIsland():GetTechnologyAgency():TryAutoUnlock(function()
		arg_25_0:Flush()
	end)
end

function var_0_0.Flush(arg_27_0)
	arg_27_0.techAgency = getProxy(IslandProxy):GetIsland():GetTechnologyAgency()

	arg_27_0.typeUIList:align(#arg_27_0.commonTypes)
	arg_27_0:FlushCentreTip()
	arg_27_0.pages[arg_27_0.curPage]:ExecuteAction("Flush")
	arg_27_0.quickPanel:ExecuteAction("Flush")

	if arg_27_0.detailPanel:isShowing() then
		arg_27_0.detailPanel:ExecuteAction("Flush")
	end
end

function var_0_0.OnHide(arg_28_0)
	arg_28_0.quickPanel:ExecuteAction("Hide")
	arg_28_0.detailPanel:ExecuteAction("Hide")
end

function var_0_0.OnDisable(arg_29_0)
	arg_29_0:OnHide()
end

function var_0_0.OnDestroy(arg_30_0)
	if arg_30_0.quickPanel then
		arg_30_0.quickPanel:Destroy()

		arg_30_0.quickPanel = nil
	end

	if arg_30_0.detailPanel then
		arg_30_0.detailPanel:Destroy()

		arg_30_0.detailPanel = nil
	end

	for iter_30_0, iter_30_1 in pairs(arg_30_0.pages) do
		if iter_30_1 then
			iter_30_1:Destroy()

			iter_30_1 = nil
		end
	end
end

return var_0_0
