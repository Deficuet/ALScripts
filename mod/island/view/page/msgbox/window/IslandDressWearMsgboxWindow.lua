local var_0_0 = class("IslandDressWearMsgboxWindow", import(".IslandCommonMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommonMsgBoxForDressWear"
end

local var_0_1 = {
	"white",
	"blue",
	"purple",
	"golden"
}

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.dressRect = arg_2_0._tf:Find("dress_container/dress"):GetComponent("LScrollRect")

	function arg_2_0.dressRect.onUpdateItem(arg_3_0, arg_3_1)
		arg_2_0:OnDressUpdateItem(arg_3_0, arg_3_1)
	end
end

function var_0_0.OnShow(arg_4_0)
	var_0_0.super.OnShow(arg_4_0)

	local var_4_0 = arg_4_0.settings

	arg_4_0.dressRect:SetTotalCount(#arg_4_0.settings.needconfirmDressList, 0)
end

function var_0_0.OnDressUpdateItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_2.transform
	local var_5_1 = arg_5_0.settings.needconfirmDressList[arg_5_1 + 1]
	local var_5_2 = pg.island_dress_template[var_5_1.dress_id]

	if var_5_2.icon ~= "" then
		GetImageSpriteFromAtlasAsync(string.format("island/IslandDressIcon/%s", var_5_2.icon), "", var_5_0:Find("icon"))
	end

	if var_5_2.quality ~= 0 then
		GetImageSpriteFromAtlasAsync(string.format("island/IslandDressIcon/%s", var_0_1[var_5_2.quality]), "", var_5_0:Find("frame"))
	end

	local var_5_3 = IslandShip.StaticGetPrefab(var_5_1.ship_id)

	GetImageSpriteFromAtlasAsync("island/IslandShipIcon/" .. var_5_3, "", var_5_0:Find("shipHold/ship_icon"))
end

function var_0_0.OnDestroy(arg_6_0)
	var_0_0.super.OnDestroy(arg_6_0)
	ClearLScrollrect(arg_6_0.dressRect)
end

return var_0_0
