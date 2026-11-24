local var_0_0 = class("PuzzleActivity", import("model.vo.Activity"))

var_0_0.CMD_COMPLETE = 1
var_0_0.CMD_ACTIVATE = 2
var_0_0.CMD_UNLCOK_TIP = 3
var_0_0.CMD_EARN_EXTRA = 4
var_0_0.CONFIG_ID_TYPE = {
	EASTER_EGG = 3,
	PUZZLE = 1
}

function var_0_0.GetPicturePuzzleIds(arg_1_0)
	local var_1_0 = arg_1_0.id
	local var_1_1 = pg.activity_event_picturepuzzle[var_1_0]

	assert(var_1_1, "Can't Find activity_event_picturepuzzle 's ID : " .. (var_1_0 or "NIL"))

	local var_1_2 = Clone(var_1_1.pickup_picturepuzzle)

	table.insertto(var_1_2, var_1_1.drop_picturepuzzle)

	return var_1_2
end

return var_0_0
