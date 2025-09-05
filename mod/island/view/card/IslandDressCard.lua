local var_0_0 = class("IslandDressCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.go = arg_1_1
	arg_1_0.tf = arg_1_1.transform
	arg_1_0.selectGos = {
		arg_1_0.tf:Find("select")
	}
	arg_1_0.canSendTF = arg_1_0.tf:Find("canSend")
	arg_1_0.ownNum = arg_1_0.canSendTF:Find("ownNum")
	arg_1_0.redDot = arg_1_0.tf:Find("red_dot")
end

local var_0_1 = {
	"white",
	"blue",
	"purple",
	"golden"
}

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.isSend = arg_2_3
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
	arg_2_0:FlushRedDot()
end

function var_0_0.FlushRedDot(arg_3_0)
	local var_3_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetHasDressData(arg_3_0.configId)
	local var_3_1 = var_3_0 and var_3_0.read == 0 or false
	local var_3_2 = not arg_3_0.isSend and var_3_1

	setActive(arg_3_0.redDot, var_3_2)
end

function var_0_0.UpdateSelected(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 == arg_4_0.configId

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.selectGos) do
		setActive(iter_4_1, var_4_0)
	end
end

function var_0_0.Dispose(arg_5_0)
	return
end

return var_0_0
