pg = pg or {}
pg.RepairResMgr = singletonClass("RepairResMgr")

local var_0_0 = pg.RepairResMgr

var_0_0.TYPE_DEFAULT_RES = 2
var_0_0.TYPE_L2D = 4
var_0_0.TYPE_PAINTING = 8
var_0_0.TYPE_CIPHER = 16

function var_0_0.Init(arg_1_0, arg_1_1)
	LoadAndInstantiateAsync("ui", "RepairUI", function(arg_2_0)
		arg_1_0._go = arg_2_0
		arg_1_0._tf = arg_1_0._go.transform

		arg_1_0._go:SetActive(false)

		arg_1_0.contentTxt = arg_1_0._tf:Find("window/content/Text"):GetComponent(typeof(Text))
		arg_1_0.parentTr = pg.UIMgr.GetInstance().OverlayToast

		arg_1_0._go.transform:SetParent(arg_1_0.parentTr, false)

		arg_1_0.closeBtn = arg_1_0._tf:Find("window/top/btnBack")
		arg_1_0.btns = {
			arg_1_0:InitDefaultResBtn(),
			arg_1_0:InitL2dBtn(),
			arg_1_0:InitPaintingBtn(),
			arg_1_0:InitCipherBtn()
		}
		arg_1_0.uiItemList = UIItemList.New(arg_1_0._tf:Find("window/buttons"), arg_1_0._tf:Find("window/buttons/custom_button_1"))

		setText(arg_1_0._tf:Find("window/top/title"), i18n("msgbox_repair_title"))
		arg_1_1()
	end, true, true)
end

function var_0_0.InitDefaultResBtn(arg_3_0)
	return {
		type = var_0_0.TYPE_DEFAULT_RES,
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
end

function var_0_0.InitL2dBtn(arg_5_0)
	return {
		type = var_0_0.TYPE_L2D,
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
end

function var_0_0.InitPaintingBtn(arg_7_0)
	return {
		type = var_0_0.TYPE_PAINTING,
		text = i18n("msgbox_repair_painting"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-painting.csv") then
				BundleWizard.Inst:GetGroupMgr("PAINTING"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
end

function var_0_0.InitCipherBtn(arg_9_0)
	return {
		type = var_0_0.TYPE_CIPHER,
		text = i18n("msgbox_repair_cipher"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-cipher.csv") then
				BundleWizard.Inst:GetGroupMgr("CIPHER"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
end

function var_0_0.Repair(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1 or bit.bor(var_0_0.TYPE_DEFAULT_RES, var_0_0.TYPE_L2D, var_0_0.TYPE_PAINTING, var_0_0.TYPE_CIPHER)
	local var_11_1 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.btns) do
		if bit.band(iter_11_1.type, var_11_0) > 0 then
			table.insert(var_11_1, iter_11_1)
		end
	end

	arg_11_0:Show(var_11_1)
end

function var_0_0.Show(arg_12_0, arg_12_1)
	pg.DelegateInfo.New(arg_12_0)
	arg_12_0._go:SetActive(true)
	pg.UIMgr.GetInstance():BlurPanel(arg_12_0._tf)
	arg_12_0.uiItemList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = arg_12_1[arg_13_1 + 1]

			setText(arg_13_2:Find("Text"), var_13_0.text)
			onButton(arg_12_0, arg_13_2, function()
				if var_13_0.onCallback then
					var_13_0.onCallback()
				end

				arg_12_0:Hide()
			end, SFX_PANEL)
		end
	end)
	arg_12_0.uiItemList:align(#arg_12_1)

	arg_12_0.contentTxt.text = i18n("resource_verify_warn")

	onButton(arg_12_0, arg_12_0._tf, function()
		arg_12_0:Hide()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.closeBtn, function()
		arg_12_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Hide(arg_17_0)
	pg.DelegateInfo.Dispose(arg_17_0)
	arg_17_0._go:SetActive(false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_17_0._tf, arg_17_0.parentTr)
end
