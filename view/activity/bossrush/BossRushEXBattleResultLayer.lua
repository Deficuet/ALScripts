local var_0_0 = class("BossRushEXBattleResultLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "BattleResultBossRushEXUI"
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

	local var_3_1 = var_3_0 and var_3_0:GetFinalResults() or {}
	local var_3_2 = var_3_0 and var_3_0:GetEXScores()
	local var_3_3 = 0

	arg_3_0.retPaintings = {}

	_.each(_.range(#var_3_2), function(arg_5_0)
		local var_5_0 = arg_3_0._tf:Find("List"):GetChild(arg_5_0 - 1)
		local var_5_1 = arg_3_0._tf:Find("Paintings"):GetChild(arg_5_0 - 1)
		local var_5_2 = var_5_0:Find("content/text")
		local var_5_3 = var_5_0:Find("content/desc")
		local var_5_4 = var_5_1:Find("mask/painting")

		setActive(var_5_0, arg_5_0 <= #var_3_2)
		setActive(var_5_1, arg_5_0 <= #var_3_2)

		if arg_5_0 > #var_3_2 then
			return
		end

		setText(var_5_2, var_3_2[arg_5_0])
		setText(var_5_3, i18n("series_enemy_score") .. " ")

		var_3_3 = var_3_3 + var_3_2[arg_5_0]

		local var_5_5 = (function()
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

		arg_3_0:setPainting(var_5_4, var_5_5)
		table.insert(arg_3_0.retPaintings, {
			var_5_4,
			var_5_5
		})
	end)
	setText(arg_3_0._tf:Find("TotalScore/Text"), var_3_3)
	arg_3_0:loadUI()
end

function var_0_0.shareEx(arg_8_0)
	return
end

function var_0_0.setPainting(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	setPaintingPrefabAsync(arg_9_1, arg_9_2, "biandui", arg_9_3)
end

function var_0_0.retPainting(arg_10_0, arg_10_1, arg_10_2)
	retPaintingPrefab(arg_10_1, arg_10_2)
end

function var_0_0.onBackPressed(arg_11_0)
	triggerButton(arg_11_0._tf:Find("Confirm"))
end

function var_0_0.willExit(arg_12_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_12_0._tf)

	if arg_12_0.retPaintings and #arg_12_0.retPaintings > 0 then
		for iter_12_0, iter_12_1 in ipairs(arg_12_0.retPaintings) do
			arg_12_0:retPainting(iter_12_1[1], iter_12_1[2])
		end
	end
end

function var_0_0.loadUI(arg_13_0)
	PoolMgr.GetInstance():GetUI("ShareUI", false, function(arg_14_0)
		local var_14_0 = arg_14_0.transform
		local var_14_1 = var_14_0:Find("panel")
		local var_14_2 = var_14_0:Find("panel_pink")

		setParent(var_14_0, arg_13_0._tf)

		local var_14_3 = var_14_0:Find("deck")

		setActive(var_14_1, false)
		setActive(var_14_2, false)

		local var_14_4 = var_14_0:Find("deck/logo")

		GetComponent(var_14_4, "Image"):SetNativeSize()

		local var_14_5 = pg.share_template[pg.ShareMgr.TypeBossRushEX]

		assert(var_14_5, "share_template not exist: " .. pg.ShareMgr.TypeBossRushEX)

		local var_14_6 = getProxy(PlayerProxy):getRawData()
		local var_14_7 = getProxy(UserProxy):getRawData()
		local var_14_8 = getProxy(ServerProxy):getRawData()[var_14_7 and var_14_7.server or 0]
		local var_14_9 = var_14_6 and var_14_6.name or ""
		local var_14_10 = var_14_8 and var_14_8.name or ""
		local var_14_11 = pg.ShareMgr.ANCHORS_TYPE[var_14_5.deck] or {
			0.5,
			0.5,
			0.5,
			0.5
		}

		var_14_3.anchorMin = Vector2(var_14_11[1], var_14_11[2])
		var_14_3.anchorMax = Vector2(var_14_11[3], var_14_11[4])

		setText(var_14_3:Find("name/value"), var_14_9)
		setText(var_14_3:Find("server/value"), var_14_10)
		setText(var_14_3:Find("lv/value"), var_14_6.level)

		if PLATFORM_CODE == PLATFORM_CHT or PLATFORM_CODE == PLATFORM_CH then
			setActive(var_14_3:Find("code_bg"), true)
		else
			setActive(var_14_3:Find("code_bg"), false)
		end

		var_14_3.anchoredPosition3D = Vector3(var_14_5.qrcode_location[1], var_14_5.qrcode_location[2], -100)
		var_14_3.anchoredPosition = Vector2(var_14_5.qrcode_location[1], var_14_5.qrcode_location[2])
	end)
end

return var_0_0
