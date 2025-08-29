local var_0_0 = class("IslandAniamtionOpCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.tipTr = arg_1_0._tf:Find("tip")
	arg_1_0.cutoffTr = arg_1_0._tf:Find("cut_off ")
	arg_1_0.item1 = arg_1_0._tf:Find("1/main")
	arg_1_0.item2 = arg_1_0._tf:Find("2/main")
	arg_1_0.layoutElement = arg_1_0._tf:GetComponent(typeof(LayoutElement))
	arg_1_0.baseHeight = arg_1_0.layoutElement.preferredHeight
	arg_1_0.cutOffHeight = arg_1_0.cutoffTr:GetComponent(typeof(LayoutElement)).preferredHeight
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = arg_2_1[1]
	local var_2_1 = arg_2_1[2]

	arg_2_0.firstId = var_2_0
	arg_2_0.secondId = var_2_1

	arg_2_0:UpdateItem(arg_2_0.item1, var_2_0)
	arg_2_0:UpdateItem(arg_2_0.item2, var_2_1)
	arg_2_0:UpdateSelected(arg_2_2)
	setActive(arg_2_0.tipTr, false)

	local var_2_2 = var_2_0 and var_2_0 == arg_2_3 or var_2_1 and var_2_1 == arg_2_3

	setActive(arg_2_0.cutoffTr, var_2_2)

	arg_2_0.layoutElement.preferredHeight = var_2_2 and arg_2_0.baseHeight + arg_2_0.cutOffHeight or arg_2_0.baseHeight
end

function var_0_0.UpdateItem(arg_3_0, arg_3_1, arg_3_2)
	setActive(arg_3_1, arg_3_2)

	if not arg_3_2 then
		return
	end

	local var_3_0 = pg.island_action[arg_3_2]

	setText(arg_3_1:Find("Text"), var_3_0.name)
	setActive(arg_3_1:Find("double"), var_3_0.type == IslandConst.ANIMATION_OP_DOUBLE)

	if var_3_0.resource ~= arg_3_0.resource then
		LoadImageSpriteAsync("island/IslandActionIcon/" .. var_3_0.resource, arg_3_1:Find("icon"), true)

		arg_3_0.resource = var_3_0.resource
	end
end

function var_0_0.UpdateSelected(arg_4_0, arg_4_1)
	setActive(arg_4_0.item1:Find("sel"), arg_4_0.firstId and arg_4_1 == arg_4_0.firstId)
	setActive(arg_4_0.item2:Find("sel"), arg_4_0.secondId and arg_4_1 == arg_4_0.secondId)
end

function var_0_0.Dispose(arg_5_0)
	return
end

return var_0_0
