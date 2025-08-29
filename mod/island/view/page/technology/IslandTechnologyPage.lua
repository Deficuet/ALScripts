local var_0_0 = class("IslandTechnologyPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTechnologyUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.centreToggleTF = arg_2_0._tf:Find("types/1")
	arg_2_0.centreTipTF = arg_2_0.centreToggleTF:Find("tip")

	local var_2_0 = arg_2_0._tf:Find("types/content")

	arg_2_0.typeUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	local var_2_1 = arg_2_0._tf:Find("pages")

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
		onGetAwardDone = function()
			arg_2_0:OpenPage(IslandTechAwardPage)
		end
	}, {
		__index = arg_2_0.contextData
	}))
	arg_2_0.detailPanel = IslandTechDetailPanel.New(arg_2_0._tf, arg_2_0.event, setmetatable({
		onSelecteShip = function()
			arg_2_0:OpenPage(IslandShipSelectPage, 1, {}, nil, function(arg_6_0)
				arg_2_0.detailPanel:ExecuteAction("OnShipSelected", arg_6_0[1])
			end)
		end,
		onFinishImmd = function(arg_7_0)
			arg_2_0:emit(IslandMediator.ON_FINISH_TECH_IMMD, arg_7_0, function()
				arg_2_0:OpenPage(IslandTechAwardPage, arg_7_0)
			end)
		end,
		onGetAwardDone = function(arg_9_0)
			arg_2_0:OpenPage(IslandTechAwardPage, arg_9_0)
		end
	}, {
		__index = arg_2_0.contextData
	}))
end

function var_0_0.OnInit(arg_10_0)
	onButton(arg_10_0, arg_10_0._tf:Find("top/back"), function()
		arg_10_0:Hide()
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0._tf:Find("top/home"), function()
		arg_10_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onToggle(arg_10_0, arg_10_0.centreToggleTF, function(arg_13_0)
		if arg_13_0 then
			arg_10_0.curPage = IslandTechBelong.CENTRE

			arg_10_0:SwitchPage()
		end
	end, SFX_PANEL)

	arg_10_0.commonTypes = IslandTechBelong.COMMON_SHOW_TYPES

	arg_10_0.typeUIList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventInit then
			arg_10_0:InitTypeItem(arg_14_1, arg_14_2)
		elseif arg_14_0 == UIItemList.EventUpdate then
			arg_10_0:UpdateTypeItem(arg_14_1, arg_14_2)
		end
	end)
end

function var_0_0.AddListeners(arg_15_0)
	arg_15_0:AddListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_15_0.Flush)
	arg_15_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_15_0.Flush)
	arg_15_0:AddListener(GAME.ISLAND_FINISH_TECH_IMMD_DONE, arg_15_0.CheckAutoUnlock)
	arg_15_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_15_0.Flush)
	arg_15_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_15_0.CheckAutoUnlock)
end

function var_0_0.RemoveListeners(arg_16_0)
	arg_16_0:RemoveListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_16_0.Flush)
	arg_16_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_16_0.Flush)
	arg_16_0:RemoveListener(GAME.ISLAND_FINISH_TECH_IMMD_DONE, arg_16_0.CheckAutoUnlock)
	arg_16_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_16_0.Flush)
	arg_16_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_16_0.CheckAutoUnlock)
end

function var_0_0.InitTypeItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.commonTypes[arg_17_1 + 1]

	arg_17_2.name = var_17_0

	local var_17_1 = IslandTechBelong.Names[var_17_0]

	setText(arg_17_2:Find("unsel"), var_17_1)
	setText(arg_17_2:Find("sel/content/Text"), var_17_1)
	LoadImageSpriteAsync("island/islandtechnology/tech_type_" .. IslandTechBelong.Fields[var_17_0], arg_17_2:Find("sel/content/Image"), true)
	onToggle(arg_17_0, arg_17_2, function(arg_18_0)
		if arg_18_0 then
			arg_17_0.curPage = var_17_0

			arg_17_0:SwitchPage()
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateTypeItem(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.commonTypes[arg_19_1 + 1]

	setActive(arg_19_2:Find("unsel/tip"), arg_19_0:IsReceiveByType(var_19_0))
	setActive(arg_19_2:Find("sel/tip"), arg_19_0:IsReceiveByType(var_19_0))
end

function var_0_0.IsReceiveByType(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.techAgency:GetTechnologys()) do
		if iter_20_1:getConfig("tech_belong") == arg_20_1 and iter_20_1:GetStatus() == IslandTechnology.STATUS.RECEIVE then
			return true
		end
	end

	return false
end

function var_0_0.FlushCentreTip(arg_21_0)
	setActive(arg_21_0.centreTipTF, arg_21_0:IsReceiveByType(IslandTechBelong.CENTRE))
end

function var_0_0.SwitchPage(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(arg_22_0.pages) do
		if iter_22_0 == arg_22_0.curPage then
			iter_22_1:ExecuteAction("Show")
		else
			iter_22_1:ExecuteAction("Hide")
		end
	end
end

function var_0_0.OnShow(arg_23_0)
	triggerToggle(arg_23_0.centreToggleTF, true)
	arg_23_0.quickPanel:ExecuteAction("Show")
	arg_23_0:CheckAutoUnlock()
end

function var_0_0.CheckAutoUnlock(arg_24_0)
	getProxy(IslandProxy):GetIsland():GetTechnologyAgency():TryAutoUnlock(function()
		arg_24_0:Flush()
	end)
end

function var_0_0.Flush(arg_26_0)
	arg_26_0.techAgency = getProxy(IslandProxy):GetIsland():GetTechnologyAgency()

	arg_26_0.typeUIList:align(#arg_26_0.commonTypes)
	arg_26_0:FlushCentreTip()
	arg_26_0.pages[arg_26_0.curPage]:ExecuteAction("Flush")
	arg_26_0.quickPanel:ExecuteAction("Flush")

	if arg_26_0.detailPanel:isShowing() then
		arg_26_0.detailPanel:ExecuteAction("Flush")
	end
end

function var_0_0.OnHide(arg_27_0)
	arg_27_0.quickPanel:ExecuteAction("Hide")
	arg_27_0.detailPanel:ExecuteAction("Hide")
end

function var_0_0.OnDisable(arg_28_0)
	arg_28_0:OnHide()
end

function var_0_0.OnDestroy(arg_29_0)
	if arg_29_0.quickPanel then
		arg_29_0.quickPanel:Destroy()

		arg_29_0.quickPanel = nil
	end

	if arg_29_0.detailPanel then
		arg_29_0.detailPanel:Destroy()

		arg_29_0.detailPanel = nil
	end

	for iter_29_0, iter_29_1 in pairs(arg_29_0.pages) do
		if iter_29_1 then
			iter_29_1:Destroy()

			iter_29_1 = nil
		end
	end
end

return var_0_0
