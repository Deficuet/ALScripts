local var_0_0 = class("StarsCityCollectPage", import("view.activity.CorePage.EscapeManor.EscapeManorCollectPage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.msgBox = StarsCityCollectMsgBox.New(arg_1_0._tf, arg_1_0.event)
end

function var_0_0.AddSpecialBtnListener(arg_2_0)
	local var_2_0 = arg_2_0.activity:getConfig("config_client")

	arg_2_0.furnitureThemeBtn = arg_2_0.btnList:Find("furniture_theme")

	if arg_2_0.furnitureThemeBtn and var_2_0.furniture_theme_link then
		onButton(arg_2_0, arg_2_0.furnitureThemeBtn, function()
			local var_3_0 = var_2_0.furniture_theme_link
			local var_3_1 = var_3_0[1]
			local var_3_2 = var_3_0[2]
			local var_3_3 = var_3_0[3]

			arg_2_0:DoSkip(var_3_1, var_3_2)
		end, SFX_PANEL)
	end

	arg_2_0.medalBtn = arg_2_0.btnList:Find("medal")

	if arg_2_0.medalBtn and var_2_0.medal_link then
		onButton(arg_2_0, arg_2_0.medalBtn, function()
			local var_4_0 = var_2_0.medal_link
			local var_4_1 = var_4_0[1]
			local var_4_2 = var_4_0[2]
			local var_4_3 = var_4_0[3]

			arg_2_0:DoSkip(var_4_1, var_4_2)
		end, SFX_PANEL)
	end

	arg_2_0.equipSkinBoxBtn = arg_2_0.btnList:Find("equip_skin_box")

	if arg_2_0.equipSkinBoxBtn and var_2_0.equipskin_box_link then
		local var_2_1 = Drop.New({
			type = var_2_0.equipskin_box_link.drop_type,
			id = var_2_0.equipskin_box_link.drop_id
		}):getOwnedCount()

		onButton(arg_2_0, arg_2_0.equipSkinBoxBtn, function()
			arg_2_0.msgBox:ExecuteAction("Show", {
				drop_type = var_2_0.equipskin_box_link.drop_type,
				drop_id = var_2_0.equipskin_box_link.drop_id,
				count = var_2_1,
				skipable_list = var_2_0.equipskin_box_link.list
			})
		end, SFX_PANEL)
	end
end

return var_0_0
