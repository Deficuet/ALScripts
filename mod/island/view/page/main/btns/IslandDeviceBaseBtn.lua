local var_0_0 = class("IslandDeviceBaseBtn", import(".IslandMainBaseBtn"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._tf = arg_1_1
	arg_1_0.event = arg_1_2
	arg_1_0.configId = arg_1_3
	arg_1_0.config = pg.island_main_btns[arg_1_0.configId]
	arg_1_0.lockTF = arg_1_0._tf:Find("lock")

	local var_1_0 = arg_1_0.lockTF:Find("Text")

	if var_1_0 then
		setText(var_1_0, i18n("island_freight_btn_locked"))
	end

	arg_1_0.unlockTF = arg_1_0._tf:Find("unlock")
	arg_1_0.tipTF = arg_1_0.unlockTF:Find("tip")
	arg_1_0.nameTF = arg_1_0._tf:Find("name")

	local var_1_1 = arg_1_0.nameTF and arg_1_0.nameTF:GetComponent(typeof(Text))

	if var_1_1 then
		var_1_1.text = arg_1_0.config.name
	end

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	onButton(arg_2_0, arg_2_0._tf, function()
		if not arg_2_0:IsUnlock() then
			return
		end

		arg_2_0:OnClick()
	end, SFX_PANEL)
end

function var_0_0.UnlockCheck(arg_4_0)
	local var_4_0 = arg_4_0:IsUnlock()

	setActive(arg_4_0.lockTF, not var_4_0)
	setActive(arg_4_0.unlockTF, var_4_0)

	if var_4_0 then
		arg_4_0:FlushDataUI()
	end
end

function var_0_0.FlushDataUI(arg_5_0)
	return
end

return var_0_0
