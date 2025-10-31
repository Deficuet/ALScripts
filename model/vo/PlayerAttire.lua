local var_0_0 = class("PlayerAttire", import(".BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0:Flush(arg_1_1)
end

function var_0_0.Flush(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.display or {}

	arg_2_0.icon = arg_2_1.icon or var_2_0.icon

	if arg_2_1.character then
		arg_2_0.characters = underscore.map(arg_2_1.character, function(arg_3_0)
			return arg_3_0.key
		end)
		arg_2_0.phantoms = underscore.map(arg_2_1.character, function(arg_4_0)
			return arg_4_0.value
		end)
		arg_2_0.character = arg_2_0.characters[1]
		arg_2_0.phantomId = arg_2_0.phantoms[1] or 0
	end

	arg_2_0.skinId = arg_2_1.skin_id or var_2_0.skin or 0

	if arg_2_0.skinId == 0 then
		local var_2_1 = pg.ship_data_statistics[arg_2_0.icon]

		if var_2_1 then
			arg_2_0.skinId = var_2_1.skin_id
		end
	end

	arg_2_0.remoulded = false

	if arg_2_1.remoulded and arg_2_1.remoulded == 1 or var_2_0.transform_flag and var_2_0.transform_flag == 1 then
		arg_2_0.remoulded = true
	end

	arg_2_0.propose = arg_2_1.propose and arg_2_1.propose > 0 or var_2_0.marry_flag and var_2_0.marry_flag > 0
	arg_2_0.proposeTime = arg_2_1.propose or var_2_0.marry_flag
	arg_2_0.iconFrame = arg_2_1.icon_frame or var_2_0.icon_frame or 0
	arg_2_0.chatFrame = arg_2_1.chat_frame or var_2_0.chat_frame or 0
	arg_2_0.iconTheme = arg_2_1.icon_theme or var_2_0.icon_theme or 0
	arg_2_0.attireInfo = {}
	arg_2_0.attireInfo[AttireConst.TYPE_ICON_FRAME] = arg_2_0.iconFrame
	arg_2_0.attireInfo[AttireConst.TYPE_CHAT_FRAME] = arg_2_0.chatFrame
end

function var_0_0.getPainting(arg_5_0)
	return pg.ship_skin_template[arg_5_0.skinId].painting
end

return var_0_0
