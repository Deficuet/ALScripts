local var_0_0 = class("IslandDressCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.go = arg_1_1
	arg_1_0.tf = arg_1_1.transform
	arg_1_0.selectGos = {
		arg_1_0.tf:Find("select")
	}
	arg_1_0.canSendTF = arg_1_0.tf:Find("canSend")
	arg_1_0.ownNumTF = arg_1_0.tf:Find("icon/count_bg")
	arg_1_0.ownNumText = arg_1_0.ownNumTF:Find("count")
	arg_1_0.redDot = arg_1_0.tf:Find("red_dot")
	arg_1_0.shipHoldTF = arg_1_0.tf:Find("shipHold")
	arg_1_0.shipIcon = arg_1_0.shipHoldTF:Find("ship_icon")
	arg_1_0.exclusionTF = arg_1_0.tf:Find("exclusion_item")
end

local var_0_1 = {
	"white",
	"blue",
	"purple",
	"golden"
}

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.configId = arg_2_1

	local var_2_0 = pg.island_dress_template[arg_2_1]

	arg_2_0.configType = var_2_0.type

	setText(arg_2_0.tf:Find("Text"), var_2_0.name)

	if var_2_0.icon ~= "" then
		GetImageSpriteFromAtlasAsync(string.format("island/IslandDressIcon/%s", var_2_0.icon), "", arg_2_0.tf:Find("icon"))
	end

	if var_2_0.quality ~= 0 then
		GetImageSpriteFromAtlasAsync(string.format("island/IslandDressIcon/%s", var_0_1[var_2_0.quality]), "", arg_2_0.tf:Find("frame"))
	end

	arg_2_0:UpdateSelected(arg_2_2)
end

function var_0_0.UpdateSelected(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.selectGos) do
		setActive(iter_3_1, arg_3_1)
	end
end

function var_0_0.Dispose(arg_4_0)
	return
end

return var_0_0
