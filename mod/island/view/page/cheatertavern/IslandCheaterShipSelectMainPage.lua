local var_0_0 = class("IslandCheaterShipSelectMainPage", import("..ship.IslandShipMainPage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)
end

function var_0_0.AddListeners(arg_2_0)
	var_0_0.super.AddListeners(arg_2_0)
	arg_2_0:AddListener(CheaterTavernEvent.CLOSE_SHIP_SELECT_PAGE, arg_2_0.SetNeedNotLoadUI)
end

function var_0_0.RemoveListeners(arg_3_0)
	var_0_0.super.RemoveListeners(arg_3_0)
	arg_3_0:RemoveListener(CheaterTavernEvent.CLOSE_SHIP_SELECT_PAGE, arg_3_0.SetNeedNotLoadUI)
end

function var_0_0.Show(arg_4_0, arg_4_1)
	arg_4_0.changeDressType = arg_4_1

	var_0_0.super.Show(arg_4_0)
	setActive(arg_4_0.togglePanel, false)

	arg_4_0.needLoadUI = true
end

function var_0_0.FlushShips(arg_5_0, arg_5_1)
	arg_5_0.displays = {}
	arg_5_0.displays = arg_5_1:GetUnlockOrCanUnlockShipConfigIds()

	local var_5_0

	if #arg_5_0.displays > 0 then
		var_5_0 = arg_5_1:GetShipById(arg_5_0.displays[1])
	end

	arg_5_0.contextData.selectedId = arg_5_0.contextData.selectedId or var_5_0 and var_5_0.configId

	for iter_5_0 = #arg_5_0.displays, 1, -1 do
		local var_5_1 = arg_5_0.displays[iter_5_0]

		if var_5_1 and getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(var_5_1) == nil then
			table.remove(arg_5_0.displays, iter_5_0)
		end
	end

	arg_5_0.shipRect:SetTotalCount(#arg_5_0.displays)
end

function var_0_0.UpdateMainView(arg_6_0, arg_6_1)
	if arg_6_0.contextData.selectedId == arg_6_1.configId then
		return
	end

	if not arg_6_0.shipDressHelper then
		arg_6_0.shipDressHelper = IslandShipDressHelperNew.New()
	end

	arg_6_0.shipDressHelper:SetShipId(arg_6_1.configId)
	arg_6_0:LoadCharacter(arg_6_1:GetModel())

	arg_6_0.contextData.selectedId = arg_6_1.configId

	arg_6_0:TriggerPage(IslandShipMainPage.PAGE_DRESS)
end

function var_0_0.SwitchPage(arg_7_0, arg_7_1)
	if not arg_7_0.contextData.selectedId then
		return
	end

	if arg_7_0.page then
		arg_7_0:ClosePage(arg_7_0.page)

		arg_7_0.page = nil
	end

	local var_7_0 = arg_7_0.pages[arg_7_1]

	if arg_7_1 == 1 then
		arg_7_0.childPage = arg_7_0:OpenPage(var_7_0, arg_7_0.contextData.selectedId, false, arg_7_0.shipDressHelper, function(arg_8_0)
			arg_7_0:SetObjInitRotaion(arg_8_0)
		end, arg_7_0.changeDressType)
	else
		arg_7_0:OpenPage(var_7_0, arg_7_0.contextData.selectedId)

		arg_7_0.childPage = nil
	end

	arg_7_0.page = var_7_0
end

function var_0_0.OnHide(arg_9_0)
	var_0_0.super.OnHide(arg_9_0)
end

function var_0_0.ClearCharacterScene(arg_10_0, arg_10_1)
	if arg_10_0.isLoadCharacterScene then
		if arg_10_0.needLoadUI then
			pg.SceneAnimMgr.GetInstance():CommonSceneChange("Dorm3DLoading", function(arg_11_0)
				arg_10_0:ClearCharacterContainer()
				arg_10_0:UnLoadCharacterScene(function()
					arg_10_0:ActivityPlayerCamera()
					existCall(arg_10_1)
					arg_11_0()
				end)
			end)
		else
			arg_10_0:ClearCharacterContainer()
			arg_10_0:UnLoadCharacterScene(function()
				arg_10_0:ActivityPlayerCamera()
				existCall(arg_10_1)
			end)
		end

		arg_10_0:ResetCameraMask()
		arg_10_0:emitCore(ISLAND_EVT.REFRESH_WEATHER_SYSTEM)
	end

	arg_10_0.isLoadCharacterScene = false
end

function var_0_0.SetNeedNotLoadUI(arg_14_0)
	arg_14_0.needLoadUI = false
end

return var_0_0
