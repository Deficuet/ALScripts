local var_0_0 = class("PlayerAttire", import(".BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.display or {}

	arg_1_0.icon = arg_1_1.icon or var_1_0.icon

	if arg_1_1.character then
		arg_1_0.characters = underscore.map(arg_1_1.character, function(arg_2_0)
			return arg_2_0.key
		end)
		arg_1_0.phantoms = underscore.map(arg_1_1.character, function(arg_3_0)
			return arg_3_0.value
		end)
		arg_1_0.character = arg_1_0.characters[1]
		arg_1_0.phantomId = arg_1_0.phantoms[1] or 0
	end

	arg_1_0.skinId = arg_1_1.skin_id or var_1_0.skin or 0

	if arg_1_0.skinId == 0 then
		local var_1_1 = pg.ship_data_statistics[arg_1_0.icon]

		if var_1_1 then
			arg_1_0.skinId = var_1_1.skin_id
		end
	end

	arg_1_0.remoulded = false

	if arg_1_1.remoulded and arg_1_1.remoulded == 1 or var_1_0.transform_flag and var_1_0.transform_flag == 1 then
		arg_1_0.remoulded = true
	end

	arg_1_0.propose = arg_1_1.propose and arg_1_1.propose > 0 or var_1_0.marry_flag and var_1_0.marry_flag > 0
	arg_1_0.proposeTime = arg_1_1.propose or var_1_0.marry_flag
	arg_1_0.iconFrame = arg_1_1.icon_frame or var_1_0.icon_frame or 0
	arg_1_0.chatFrame = arg_1_1.chat_frame or var_1_0.chat_frame or 0
	arg_1_0.iconTheme = arg_1_1.icon_theme or var_1_0.icon_theme or 0
end

return var_0_0
