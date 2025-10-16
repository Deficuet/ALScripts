local var_0_0 = class("BuildingCafeUpgradeLayer", import(".BuildingUpgradeLayer"))
local var_0_1 = {
	17,
	18
}

function var_0_0.Set(arg_1_0, arg_1_1, arg_1_2)
	arg_1_2 = arg_1_2 or arg_1_0.contextData.buildingID

	local var_1_0 = pg.activity_event_building[arg_1_2]

	assert(var_1_0, "Can't Find activity_event_building Config ID: " .. arg_1_2)

	arg_1_0.contextData.buildingID = arg_1_2

	local var_1_1 = #var_1_0.buff
	local var_1_2 = arg_1_1.data1KeyValueList[2][arg_1_2] or 1
	local var_1_3 = var_1_0.material[var_1_2]

	assert(#var_1_3 == 1)

	local var_1_4 = var_1_3[1][2]
	local var_1_5 = arg_1_1.data1KeyValueList[1][var_1_4] or 0
	local var_1_6 = var_1_1 <= var_1_2
	local var_1_7 = var_1_6 or var_1_5 >= var_1_3[1][3]
	local var_1_8 = table.indexof(var_0_1, arg_1_2)
	local var_1_9 = var_0_1[3 - var_1_8]
	local var_1_10 = arg_1_1.data1KeyValueList[2][var_1_9] or 1
	local var_1_11 = var_1_2 <= var_1_10
	local var_1_12 = var_1_2 + var_1_10

	setText(arg_1_0._tf:Find("window/top/name"), var_1_0.name)
	setText(arg_1_0._tf:Find("window/top/name/lv"), "Lv." .. var_1_2)
	setScrollText(arg_1_0._tf:Find("window/frame/describe/text"), var_1_0.desc)
	setText(arg_1_0._tf:Find("window/frame/content/title/lv/current"), "Lv." .. var_1_2)
	setActive(arg_1_0._tf:Find("window/frame/content/title/lv/next"), not var_1_6)

	if not var_1_6 then
		setText(arg_1_0._tf:Find("window/frame/content/title/lv/next"), "Lv." .. var_1_2 + 1)
	end

	local var_1_13 = var_1_0.buff[var_1_2]
	local var_1_14 = pg.benefit_buff_template[var_1_13]

	assert(var_1_14, "Can't Find benefit_buff_template Config ID: " .. var_1_13)
	setText(arg_1_0._tf:Find("window/frame/content/preview/current"), var_1_14.desc)
	setActive(arg_1_0._tf:Find("window/frame/content/preview/arrow"), not var_1_6)
	setActive(arg_1_0._tf:Find("window/frame/content/preview/next"), not var_1_6)

	if not var_1_6 then
		local var_1_15 = var_1_0.buff[var_1_2 + 1]
		local var_1_16 = pg.benefit_buff_template[var_1_15]

		assert(var_1_16, "Can't Find benefit_buff_template Config ID: " .. var_1_15)
		setText(arg_1_0._tf:Find("window/frame/content/preview/next"), var_1_16.desc)
	end

	arg_1_0.loader:GetSprite(Item.getConfigData(var_1_4).icon, "", arg_1_0._tf:Find("window/frame/costback/icon"))
	setText(arg_1_0._tf:Find("window/frame/costback/cost"), var_1_0.material[var_1_2] or 0)
	onButton(arg_1_0, arg_1_0.btnUpgrade, function()
		if not var_1_11 then
			local var_2_0 = pg.activity_event_building[var_1_9].name

			pg.TipsMgr.GetInstance():ShowTips(i18n("backhill_cantupbuilding", var_2_0))

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("building_upgrade_tip"),
			onYes = function()
				if var_1_6 then
					return
				elseif var_1_7 then
					arg_1_0:emit(BuildingUpgradeMediator.ACTIVITY_OPERATION, {
						cmd = 1,
						activity_id = arg_1_0.activity.id,
						arg1 = arg_1_2
					})
				elseif var_1_12 < 8 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("backhill_notenoughbuilding"))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("building_tip"))
				end
			end
		})
	end)
	setGray(arg_1_0.btnUpgrade, var_1_6 or not var_1_11)
	setButtonEnabled(arg_1_0.btnUpgrade, not var_1_6)
end

return var_0_0
