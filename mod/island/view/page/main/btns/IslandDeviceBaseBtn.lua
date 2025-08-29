local var_0_0 = class("IslandDeviceBaseBtn", import(".IslandMainBaseBtn"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._tf = arg_1_1
	arg_1_0.event = arg_1_2
	arg_1_0.configId = arg_1_3
	arg_1_0.config = pg.island_main_btns[arg_1_0.configId]
	arg_1_0.tipTF = arg_1_0._tf:Find("tip")
	arg_1_0.iconTF = arg_1_0._tf:Find("icon")
	arg_1_0.nameTF = arg_1_0._tf:Find("name")

	setText(arg_1_0.nameTF, arg_1_0.config.name)
	arg_1_0:Init()
end

return var_0_0
