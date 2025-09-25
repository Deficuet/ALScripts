local var_0_0 = class("MainEquipmentChangeSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0 = ItemShowPanel.ConfigData

	if not var_1_0.isOpen then
		arg_1_1()

		return
	end

	local var_1_1 = var_1_0.equipID

	if PlayerPrefs.GetInt("ItemIconChange_" .. var_1_1, 0) == 0 then
		local function var_1_2()
			arg_1_1()
			PlayerPrefs.SetInt("ItemIconChange_" .. var_1_1, 1)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			hideClose = true,
			type = MSGBOX_TYPE_JUST_FOR_SHOW,
			title = pg.MsgboxMgr.TITLE_INFORMATION,
			onClose = var_1_2,
			onYes = var_1_2
		})
	else
		arg_1_1()
	end
end

return var_0_0
