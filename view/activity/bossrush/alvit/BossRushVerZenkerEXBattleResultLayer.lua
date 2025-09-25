local var_0_0 = class("BossRushVerZenkerEXBattleResultLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "BattleResultBossRushVerZenKerEXUI"
end

function var_0_0.init(arg_2_0)
	setText(arg_2_0._tf:Find("TotalScore/Desc"), i18n("series_enemy_total_score"))
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)

	local var_3_0 = arg_3_0.contextData.seriesData

	onButton(arg_3_0, arg_3_0._tf:Find("Confirm"), function()
		arg_3_0:emit(BossRushBattleResultMediator.ON_SETTLE)
	end, SFX_PANEL)
	setText(arg_3_0._tf:Find("Confirm/Text"), i18n("battle_result_confirm"))

	local var_3_1 = var_3_0 and var_3_0:GetFinalResults() or {}
	local var_3_2 = var_3_0 and var_3_0:GetEXScores()
	local var_3_3 = 0

	arg_3_0.retPaintings = {}

	_.each(_.range(#var_3_2), function(arg_5_0)
		local var_5_0 = arg_3_0._tf:Find("Paintings"):GetChild(arg_5_0 - 1)
		local var_5_1 = var_5_0:Find("content/text")
		local var_5_2 = var_5_0:Find("content/desc")
		local var_5_3 = var_5_0:Find("mask/painting")

		setActive(var_5_0, arg_5_0 <= #var_3_2)

		if arg_5_0 > #var_3_2 then
			return
		end

		setText(var_5_1, var_3_2[arg_5_0])
		setText(var_5_2, i18n("series_enemy_score") .. " ")

		var_3_3 = var_3_3 + var_3_2[arg_5_0]

		local var_5_4 = (function()
			local var_6_0 = var_3_1[arg_5_0]

			if not var_6_0 then
				return
			end

			local var_6_1 = (function()
				if var_6_0.mvp ~= 0 then
					return var_6_0.mvp
				end

				return var_6_0.newShips[1] and var_6_0.newShips[1].id or nil
			end)()

			if not var_6_1 then
				return
			end

			local var_6_2 = getProxy(BayProxy):RawGetShipById(var_6_1)

			if not var_6_2 then
				return
			end

			return var_6_2:getPainting()
		end)() or "changdao"

		arg_3_0:setPainting(var_5_3, var_5_4)
		table.insert(arg_3_0.retPaintings, {
			var_5_3,
			var_5_4
		})
	end)
	setText(arg_3_0._tf:Find("TotalScore/Text"), var_3_3)
	arg_3_0:loadUI()
end

function var_0_0.setPainting(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	setPaintingPrefabAsync(arg_8_1, arg_8_2, "biandui", arg_8_3)
end

function var_0_0.retPainting(arg_9_0, arg_9_1, arg_9_2)
	retPaintingPrefab(arg_9_1, arg_9_2)
end

function var_0_0.onBackPressed(arg_10_0)
	triggerButton(arg_10_0._tf:Find("Confirm"))
end

function var_0_0.willExit(arg_11_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0._tf)

	if arg_11_0.retPaintings and #arg_11_0.retPaintings > 0 then
		for iter_11_0, iter_11_1 in ipairs(arg_11_0.retPaintings) do
			arg_11_0:retPainting(iter_11_1[1], iter_11_1[2])
		end
	end
end

function var_0_0.loadUI(arg_12_0)
	local var_12_0 = getProxy(PlayerProxy):getRawData()
	local var_12_1 = getProxy(UserProxy):getRawData()
	local var_12_2 = getProxy(ServerProxy):getRawData()[var_12_1 and var_12_1.server or 0]
	local var_12_3 = var_12_0 and var_12_0.name or ""
	local var_12_4 = var_12_2 and var_12_2.name or ""
	local var_12_5 = arg_12_0._tf:Find("share")

	setText(var_12_5:Find("name/value"), var_12_3)
	setText(var_12_5:Find("server"), i18n("zengke_series_serverinfo"))
	setText(var_12_5:Find("server/value"), var_12_4)
	setText(var_12_5:Find("lv/value"), var_12_0.level)
end

return var_0_0
