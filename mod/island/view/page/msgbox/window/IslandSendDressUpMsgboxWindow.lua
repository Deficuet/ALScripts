local var_0_0 = class("IslandSendDressUpMsgboxWindow", import(".IslandCommonMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommonMsgBoxForSendDress"
end

local var_0_1 = {
	"white",
	"blue",
	"purple",
	"golden"
}

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.itemFrameTF = arg_2_0._tf:Find("item/icon_bg/frame")
	arg_2_0.itemIconTF = arg_2_0._tf:Find("item/icon_bg/icon")
	arg_2_0.ownNum = arg_2_0._tf:Find("own/ownCount")
end

function var_0_0.OnShow(arg_3_0)
	var_0_0.super.OnShow(arg_3_0)

	local var_3_0 = arg_3_0.settings

	arg_3_0:FlushDressItem(var_3_0)
end

function var_0_0.FlushDressItem(arg_4_0, arg_4_1)
	local var_4_0 = pg.island_dress_template[arg_4_1.configId]

	if var_4_0.icon ~= "" then
		GetImageSpriteFromAtlasAsync(string.format("island/IslandDressIcon/%s", var_4_0.icon), "", arg_4_0.itemIconTF)
	end

	if var_4_0.quality ~= 0 then
		GetImageSpriteFromAtlasAsync(string.format("island/IslandDressIcon/%s", var_0_1[var_4_0.quality]), "", arg_4_0.itemFrameTF)
	end

	local var_4_1 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	setText(arg_4_0.ownNum, var_4_1:GetOwnDressCountByDressId(arg_4_1.configId))
end

return var_0_0
