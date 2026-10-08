local var_0_0 = class("CombatPreviewLayer", import("view.base.BaseSubView"))
local var_0_1 = 12
local var_0_2 = 3
local var_0_3 = Vector3(0, 1, 40)

function var_0_0.getUIName(arg_1_0)
	return "CombatPreviewUI"
end

function var_0_0.PushAllResource()
	local var_2_0 = {}

	local function var_2_1(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	for iter_2_0, iter_2_1 in ipairs(pg.item_data_battleui.all) do
		local var_2_2 = pg.item_data_battleui[iter_2_1]

		if var_2_2 and noEmptyStr(var_2_2.key) then
			var_2_1("ui/CombatUI" .. var_2_2.key)
			var_2_1("ui/CombatHPBar" .. var_2_2.key)
			var_2_1(ys.Battle.BattleResourceManager.GetUIPath("CombatHPPop" .. var_2_2.key))
		end
	end

	return var_2_0
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.OverlayMain = pg.UIMgr.GetInstance().OverlayMain

	setParent(arg_4_0._go, arg_4_0.OverlayMain)
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)

	arg_4_0.preview = arg_4_0._tf:Find("preview")
	arg_4_0.uiLayer = arg_4_0._tf:Find("preview/ui")
	arg_4_0.sea = arg_4_0._tf:Find("preview/sea")
	arg_4_0.rawImage = arg_4_0.sea:GetComponent("RawImage")

	setText(arg_4_0.preview:Find("bg/title/Image"), i18n("word_preview"))
	onButton(arg_4_0, arg_4_0.preview, function()
		arg_4_0.callBack()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.callBack = arg_6_2

	local var_6_0 = pg.item_data_battleui[arg_6_1].key
	local var_6_1 = "CombatUI" .. var_6_0
	local var_6_2 = "CombatHPBar" .. var_6_0
	local var_6_3
	local var_6_4
	local var_6_5

	seriesAsync({
		function(arg_7_0)
			PoolMgr.GetInstance():GetUI(var_6_2, true, function(arg_8_0)
				var_6_4 = arg_8_0

				arg_7_0()
			end)
		end,
		function(arg_9_0)
			PoolMgr.GetInstance():GetUI(var_6_2, true, function(arg_10_0)
				var_6_5 = arg_10_0

				arg_9_0()
			end)
		end,
		function(arg_11_0)
			PoolMgr.GetInstance():GetUI(var_6_1, true, function(arg_12_0)
				var_6_3 = arg_12_0

				arg_11_0()
			end)
		end
	}, function()
		var_6_3.transform:SetParent(arg_6_0.uiLayer, false)
		var_6_4.transform:SetParent(arg_6_0.uiLayer, false)
		var_6_5.transform:SetParent(arg_6_0.uiLayer, false)

		local var_13_0 = arg_6_0.sea.rect.width
		local var_13_1 = arg_6_0.sea.rect.height

		var_6_3.transform.localScale = Vector3(var_13_0 / 1920, var_13_1 / 1080, 1)
		arg_6_0.previewer = CombatUIPreviewer.New(arg_6_0.rawImage)

		arg_6_0.previewer:setDisplayWeapon({
			100
		})
		arg_6_0.previewer:setCombatUI(var_6_3, var_6_4, var_6_5, var_6_0)

		local var_13_2 = Ship.New({
			id = 100001,
			configId = 100001,
			skin_id = 100000
		})
		local var_13_3 = Ship.New({
			id = 100011,
			configId = 100011,
			skin_id = 100010
		})

		arg_6_0.previewer:load(40000, var_13_2, var_13_3, {}, function()
			return
		end)
	end)
end

function var_0_0.OnDestroy(arg_15_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_15_0._tf)

	if arg_15_0.previewer then
		arg_15_0.previewer:clear()

		arg_15_0.previewer = nil
	end
end

return var_0_0
