local var_0_0 = class("WSInventoryItem")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.go = arg_1_1
	arg_1_0.bg = findTF(arg_1_1, "bg")
	arg_1_0.countTF = findTF(arg_1_1, "bg/icon_bg/count")
	arg_1_0.nameTF = findTF(arg_1_1, "bg/name")
end

function var_0_0.update(arg_2_0, arg_2_1)
	arg_2_0.itemVO = arg_2_1

	updateWorldItem(rtf(arg_2_0.bg), arg_2_1)

	arg_2_0.go.name = tostring(arg_2_1.id)

	setText(arg_2_0.countTF, arg_2_1.count > 0 and arg_2_1.count or "")
	setText(arg_2_0.nameTF, shortenString(getText(findTF(arg_2_0.bg, "name")), 5))
end

function var_0_0.clear(arg_3_0)
	return
end

function var_0_0.dispose(arg_4_0)
	return
end

return var_0_0
