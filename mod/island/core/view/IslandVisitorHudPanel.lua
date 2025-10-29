local var_0_0 = class("IslandVisitorHudPanel", import("Mod.Island.Core.View.IslandBaseHudPanel"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandVisitorHud"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.nameTF = arg_2_0._tf:Find("name")
	arg_2_0.playerId = tonumber(arg_2_0.param1)

	if not arg_2_0.playerId then
		return
	end

	local var_2_0 = getProxy(IslandProxy):GetIsland()
	local var_2_1 = getProxy(IslandProxy):GetSharedIsland()

	arg_2_0.name = (var_2_0:GetVisitorAgency():GetPlayer(arg_2_0.playerId) or var_2_1:GetVisitorAgency():GetPlayer(arg_2_0.playerId)):GetName()

	setText(arg_2_0.nameTF, arg_2_0.name)
end

return var_0_0
