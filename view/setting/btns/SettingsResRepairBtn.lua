local var_0_0 = class("SettingsResRepairBtn")

function var_0_0.InitTpl(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.tpl
	local var_1_1 = arg_1_1.container
	local var_1_2 = arg_1_1.iconSP

	arg_1_0._tf = cloneTplTo(var_1_0, var_1_1, "REPAIR")
	arg_1_0._go = arg_1_0._tf.gameObject

	setImageSprite(arg_1_0._tf:Find("icon"), var_1_2)
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	arg_2_0:InitTpl(arg_2_1)
	pg.DelegateInfo.New(arg_2_0)

	arg_2_0.Progress = arg_2_0._tf:Find("progress")
	arg_2_0.ProgressHandle = arg_2_0._tf:Find("progress/handle")
	arg_2_0.Info1 = arg_2_0._tf:Find("status")
	arg_2_0.Info2 = arg_2_0._tf:Find("version")
	arg_2_0.LabelNew = arg_2_0._tf:Find("version/new")
	arg_2_0.Dot = arg_2_0._tf:Find("new")
	arg_2_0.Loading = arg_2_0._tf:Find("loading")

	setText(arg_2_0._tf:Find("title"), i18n("repair_setting_label"))

	local var_2_0 = false
	local var_2_1 = arg_2_0._tf:Find("BG")
	local var_2_2 = arg_2_0._tf:Find("BGDel")

	setActive(var_2_1, not var_2_0)
	setActive(var_2_2, var_2_0)

	local var_2_3 = arg_2_0._tf:Find("status")
	local var_2_4 = arg_2_0._tf:Find("version")

	setAnchoredPosition(var_2_3, var_2_0 and {
		y = -106
	} or {
		y = -135
	})
	setAnchoredPosition(var_2_4, var_2_0 and {
		y = -160
	} or {
		y = -198
	})
	arg_2_0:Init()
end

function var_0_0.Init(arg_3_0)
	arg_3_0:UpdateRepairStatus()
	onButton(arg_3_0, arg_3_0._tf, function()
		pg.RepairResMgr.GetInstance():Repair()
	end, SFX_PANEL)
	setActive(findTF(arg_3_0._tf, "DelBtn"), false)
end

function var_0_0.UpdateRepairStatus(arg_5_0)
	setSlider(arg_5_0.Progress, 0, 1, 0)
	setActive(arg_5_0.Dot, false)
	setActive(arg_5_0.Loading, false)

	local var_5_0 = i18n("word_files_repair")
	local var_5_1 = ""

	setText(arg_5_0.Info1, var_5_0)
	setText(arg_5_0.Info2, var_5_1)

	local var_5_2 = 1

	setSlider(arg_5_0.Progress, 0, 1, var_5_2)
	setActive(arg_5_0.ProgressHandle, var_5_2 ~= 0 and var_5_2 ~= 1)
	setActive(arg_5_0.Dot, false)
	setActive(arg_5_0.Loading, false)
	setActive(arg_5_0.LabelNew, false)
end

function var_0_0.Dispose(arg_6_0)
	pg.DelegateInfo.Dispose(arg_6_0)
end

return var_0_0
