local var_0_0 = class("BuildingUpgradeLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "BuildingUpgradePanel"
end

function var_0_0.init(arg_2_0)
	arg_2_0.btnUpgrade = arg_2_0:findTF("window/frame/upgrade_btn")

	setText(arg_2_0:findTF("window/frame/costback/label"), i18n("word_consume"))
	setText(arg_2_0:findTF("window/frame/upgrade_btn/Image"), i18n("msgbox_text_upgrade"))

	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.UpdateActivity(arg_3_0, arg_3_1)
	arg_3_0.activity = arg_3_1
end

function var_0_0.didEnter(arg_4_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
	onButton(arg_4_0, arg_4_0:findTF("window/top/btnBack"), function()
		arg_4_0:closeView()
	end)
	onButton(arg_4_0, arg_4_0:findTF("mengban"), function()
		arg_4_0:closeView()
	end)
	arg_4_0:Set(arg_4_0.activity)
end

function var_0_0.Set(arg_7_0, arg_7_1, arg_7_2)
	arg_7_2 = arg_7_2 or arg_7_0.contextData.buildingID

	local var_7_0 = pg.activity_event_building[arg_7_2]

	assert(var_7_0, "Can't Find activity_event_building Config ID: " .. arg_7_2)

	arg_7_0.contextData.buildingID = arg_7_2

	local var_7_1 = #var_7_0.buff
	local var_7_2 = arg_7_1.data1KeyValueList[2][arg_7_2] or 1
	local var_7_3 = var_7_0.material[var_7_2]
	local var_7_4 = var_7_1 <= var_7_2
	local var_7_5 = 0
	local var_7_6 = false

	if not var_7_4 then
		var_7_5 = var_7_3[1][2]

		local var_7_7 = arg_7_1.data1KeyValueList[1][var_7_5] or 0

		var_7_6 = var_7_4 or var_7_7 >= var_7_3[1][3]
	end

	setText(arg_7_0:findTF("window/top/name"), var_7_0.name)
	setText(arg_7_0:findTF("window/top/name/lv"), "Lv." .. var_7_2)
	setScrollText(arg_7_0:findTF("window/frame/describe/text"), var_7_0.desc)
	setText(arg_7_0:findTF("window/frame/content/title/lv/current"), "Lv." .. var_7_2)
	setActive(arg_7_0:findTF("window/frame/content/title/lv/next"), not var_7_4)

	if not var_7_4 then
		setText(arg_7_0:findTF("window/frame/content/title/lv/next"), "Lv." .. var_7_2 + 1)
	end

	local var_7_8 = var_7_0.buff[var_7_2]
	local var_7_9 = pg.benefit_buff_template[var_7_8]

	assert(var_7_9, "Can't Find benefit_buff_template Config ID: " .. var_7_8)
	setText(arg_7_0:findTF("window/frame/content/preview/current"), var_7_9.desc)
	setActive(arg_7_0:findTF("window/frame/content/preview/arrow"), not var_7_4)
	setActive(arg_7_0:findTF("window/frame/content/preview/next"), not var_7_4)

	if not var_7_4 then
		local var_7_10 = var_7_0.buff[var_7_2 + 1]
		local var_7_11 = pg.benefit_buff_template[var_7_10]

		assert(var_7_11, "Can't Find benefit_buff_template Config ID: " .. var_7_10)
		setText(arg_7_0:findTF("window/frame/content/preview/next"), var_7_11.desc)
		arg_7_0.loader:GetSprite(Item.getConfigData(var_7_5).icon, "", arg_7_0:findTF("window/frame/costback/icon"))
	end

	setText(arg_7_0:findTF("window/frame/costback/cost"), not var_7_4 and var_7_0.material[var_7_2][1][3] or 0)
	onButton(arg_7_0, arg_7_0.btnUpgrade, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("building_upgrade_tip"),
			onYes = function()
				if var_7_4 then
					return
				elseif var_7_6 then
					arg_7_0:emit(BuildingUpgradeMediator.ACTIVITY_OPERATION, {
						cmd = 1,
						activity_id = arg_7_0.activity.id,
						arg1 = arg_7_2
					})
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("building_tip"))
				end
			end
		})
	end)
	setGray(arg_7_0.btnUpgrade, var_7_4)
	setButtonEnabled(arg_7_0.btnUpgrade, not var_7_4)
end

function var_0_0.willExit(arg_10_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_10_0._tf)
end

return var_0_0
