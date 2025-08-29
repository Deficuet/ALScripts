local var_0_0 = class("IslandBuildingTestPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandBuildingTestUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("back")
	arg_2_0.entrancesTF = arg_2_0:findTF("entrances")
	arg_2_0.entraceUIList = UIItemList.New(arg_2_0.entrancesTF, arg_2_0:findTF("tpl", arg_2_0.entrancesTF))
	arg_2_0.optionsTF = arg_2_0:findTF("options")
	arg_2_0.optionsTitle = arg_2_0:findTF("title", arg_2_0.optionsTF)
	arg_2_0.unlockBtn = arg_2_0:findTF("unlock", arg_2_0.optionsTF)
	arg_2_0.upgradeBtn = arg_2_0:findTF("upgrade", arg_2_0.optionsTF)
	arg_2_0.productionBtn = arg_2_0:findTF("production", arg_2_0.optionsTF)
	arg_2_0.makeBtn = arg_2_0:findTF("make", arg_2_0.optionsTF)
	arg_2_0.returnBtn = arg_2_0:findTF("return", arg_2_0.optionsTF)
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		if isActive(arg_3_0.optionsTF) then
			setActive(arg_3_0.entrancesTF, true)
			setActive(arg_3_0.optionsTF, false)
		else
			arg_3_0:Hide()
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.returnBtn, function()
		setActive(arg_3_0.entrancesTF, true)
		setActive(arg_3_0.optionsTF, false)
	end, SFX_PANEL)
	arg_3_0.entraceUIList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventInit then
			local var_6_0 = arg_3_0.buildings[arg_6_1 + 1]

			arg_6_2.name = tostring(var_6_0.id)

			setText(arg_3_0:findTF("Text", arg_6_2), var_6_0:GetName())
			onButton(arg_3_0, arg_6_2, function()
				arg_3_0:ShowOptions(var_6_0)
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.ShowOptions(arg_8_0, arg_8_1)
	arg_8_0.selectedBuilding = arg_8_1

	setActive(arg_8_0.entrancesTF, false)
	setActive(arg_8_0.optionsTF, true)
	arg_8_0:FlushOptions()
end

function var_0_0.Show(arg_9_0)
	var_0_0.super.Show(arg_9_0)
	arg_9_0:Flush()
end

function var_0_0.Flush(arg_10_0)
	arg_10_0.buildings = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuildingList()

	arg_10_0.entraceUIList:align(#arg_10_0.buildings)
	setActive(arg_10_0.entrancesTF, true)
	setActive(arg_10_0.optionsTF, false)
end

function var_0_0.FlushOptions(arg_11_0)
	setText(arg_11_0.optionsTitle, arg_11_0.selectedBuilding:GetName())

	local var_11_0 = arg_11_0.selectedBuilding:IsUnlock()

	setActive(arg_11_0.unlockBtn, not var_11_0)
	onButton(arg_11_0, arg_11_0.unlockBtn, function()
		if arg_11_0.selectedBuilding:CanUnlock() then
			arg_11_0:emit(IslandMediator.ON_UNLOCK_BUILDING, arg_11_0.selectedBuilding.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_level_to_unlock", arg_11_0.selectedBuilding:GetUnlockLv()))
		end
	end, SFX_PANEL)

	local var_11_1 = arg_11_0.selectedBuilding:CanUpgrade()

	setActive(arg_11_0.upgradeBtn, var_11_0 and var_11_1)

	if var_11_0 and var_11_1 then
		onButton(arg_11_0, arg_11_0.upgradeBtn, function()
			arg_11_0:emit(IslandMediator.ON_UPGRADE_BUILDING, arg_11_0.selectedBuilding.id)
		end, SFX_PANEL)
	end

	setActive(arg_11_0.makeBtn, var_11_0)
	onButton(arg_11_0, arg_11_0.makeBtn, function()
		arg_11_0:OpenPage(IslandMakePage, arg_11_0.selectedBuilding)
	end, SFX_PANEL)
	setActive(arg_11_0.productionBtn, false)
	onButton(arg_11_0, arg_11_0.productionBtn, function()
		arg_11_0:OpenPage(IslandProductionPage, arg_11_0.selectedBuilding)
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_16_0)
	return
end

return var_0_0
