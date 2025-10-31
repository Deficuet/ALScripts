local var_0_0 = class("CombatPreviewLayer", import("view.base.BaseSubView"))
local var_0_1 = 12
local var_0_2 = 3
local var_0_3 = Vector3(0, 1, 40)

function var_0_0.getUIName(arg_1_0)
	return "CombatPreviewUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.OverlayMain = pg.UIMgr.GetInstance().OverlayMain

	setParent(arg_2_0._go, arg_2_0.OverlayMain)
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf)

	arg_2_0.preview = arg_2_0._tf:Find("preview")
	arg_2_0.uiLayer = arg_2_0._tf:Find("preview/ui")
	arg_2_0.sea = arg_2_0._tf:Find("preview/sea")
	arg_2_0.rawImage = arg_2_0.sea:GetComponent("RawImage")

	setText(arg_2_0.preview:Find("bg/title/Image"), i18n("word_preview"))
	onButton(arg_2_0, arg_2_0.preview, function()
		arg_2_0.callBack()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.callBack = arg_4_2

	local var_4_0 = pg.item_data_battleui[arg_4_1].key
	local var_4_1 = "CombatUI" .. var_4_0
	local var_4_2 = "CombatHPBar" .. var_4_0
	local var_4_3
	local var_4_4
	local var_4_5

	seriesAsync({
		function(arg_5_0)
			PoolMgr.GetInstance():GetUI(var_4_2, true, function(arg_6_0)
				var_4_4 = arg_6_0

				arg_5_0()
			end)
		end,
		function(arg_7_0)
			PoolMgr.GetInstance():GetUI(var_4_2, true, function(arg_8_0)
				var_4_5 = arg_8_0

				arg_7_0()
			end)
		end,
		function(arg_9_0)
			PoolMgr.GetInstance():GetUI(var_4_1, true, function(arg_10_0)
				var_4_3 = arg_10_0

				arg_9_0()
			end)
		end
	}, function()
		var_4_3.transform:SetParent(arg_4_0.uiLayer, false)
		var_4_4.transform:SetParent(arg_4_0.uiLayer, false)
		var_4_5.transform:SetParent(arg_4_0.uiLayer, false)

		local var_11_0 = arg_4_0.sea.rect.width
		local var_11_1 = arg_4_0.sea.rect.height

		var_4_3.transform.localScale = Vector3(var_11_0 / 1920, var_11_1 / 1080, 1)
		arg_4_0.previewer = CombatUIPreviewer.New(arg_4_0.rawImage)

		arg_4_0.previewer:setDisplayWeapon({
			100
		})
		arg_4_0.previewer:setCombatUI(var_4_3, var_4_4, var_4_5, var_4_0)

		local var_11_2 = Ship.New({
			id = 100001,
			configId = 100001,
			skin_id = 100000
		})
		local var_11_3 = Ship.New({
			id = 100011,
			configId = 100011,
			skin_id = 100010
		})

		arg_4_0.previewer:load(40000, var_11_2, var_11_3, {}, function()
			return
		end)
	end)
end

function var_0_0.OnDestroy(arg_13_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf)

	if arg_13_0.previewer then
		arg_13_0.previewer:clear()

		arg_13_0.previewer = nil
	end
end

return var_0_0
