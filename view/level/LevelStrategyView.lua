local var_0_0 = class("LevelStrategyView", import("..base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "LevelStrategyView"
end

function var_0_0.downloadLevelStrategyRes(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = pg.strategy_data_template[arg_2_1.id]
	local var_2_1 = {}

	if var_2_0 and noEmptyStr(var_2_0.icon) then
		local var_2_2 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.StrategyIcon, var_2_0.icon)

		table.insert(var_2_1, var_2_2)
	end

	SplitPackConst.DownloadByLuaArr(var_2_1, function()
		if arg_2_0._state == var_0_0.STATES.DESTROY then
			return
		end

		arg_2_2(var_2_0)
	end)
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0:InitUI()
	setActive(arg_4_0._tf, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.OnDestroy(arg_5_0)
	arg_5_0.onConfirm = nil
	arg_5_0.onCancel = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_5_0._tf, arg_5_0._parentTf)
end

function var_0_0.setCBFunc(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.onConfirm = arg_6_1
	arg_6_0.onCancel = arg_6_2
end

function var_0_0.InitUI(arg_7_0)
	arg_7_0.icon = arg_7_0._tf:Find("window/panel/item/icon_bg/icon")
	arg_7_0.count = arg_7_0._tf:Find("window/panel/item/icon_bg/count")
	arg_7_0.name = arg_7_0._tf:Find("window/panel/item/name")
	arg_7_0.desc = arg_7_0._tf:Find("window/panel/item/desc")
	arg_7_0.btnCancel = arg_7_0._tf:Find("window/panel/actions/cancel_button")
	arg_7_0.btnUse = arg_7_0._tf:Find("window/panel/actions/use_button")
	arg_7_0.btnBack = arg_7_0._tf:Find("top/btnBack")
	arg_7_0.tips = arg_7_0._tf:Find("window/panel/tips")
	arg_7_0.txSwitch = findTF(arg_7_0.btnUse, "switch")
	arg_7_0.txUse = findTF(arg_7_0.btnUse, "use")
end

function var_0_0.set(arg_8_0, arg_8_1)
	arg_8_0.strategy = arg_8_1

	arg_8_0:downloadLevelStrategyRes(arg_8_1, function(arg_9_0)
		arg_8_0:setAfterDownload(arg_8_1, arg_9_0)
	end)
end

function var_0_0.setAfterDownload(arg_10_0, arg_10_1, arg_10_2)
	GetImageSpriteFromAtlasAsync("strategyicon/" .. arg_10_2.icon, "", arg_10_0.icon)

	if arg_10_2.type == 1 then
		setText(arg_10_0.count, "")
		setActive(arg_10_0.tips, true)
		setActive(arg_10_0.txSwitch, true)
		setActive(arg_10_0.txUse, false)
	else
		setText(arg_10_0.count, arg_10_1.count)
		setActive(arg_10_0.tips, false)
		setActive(arg_10_0.txSwitch, false)
		setActive(arg_10_0.txUse, true)
	end

	setText(arg_10_0.name, arg_10_2.name)
	setText(arg_10_0.desc, arg_10_2.desc)
	onButton(arg_10_0, arg_10_0.btnBack, function()
		if arg_10_0.onCancel then
			arg_10_0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.btnCancel, function()
		if arg_10_0.onCancel then
			arg_10_0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.btnUse, function()
		if arg_10_0.onConfirm then
			arg_10_0.onConfirm()
		end
	end, SFX_CONFIRM)
end

return var_0_0
