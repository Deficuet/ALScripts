local var_0_0 = {}

var_0_0.HIDE_VIEWER = true
var_0_0.PLAY_ROOM_TYPE = {
	ALL = 0,
	COMMON = 1,
	PERSON = 2,
	MATCH = 3
}
var_0_0.PLAY_ROOM_STATE = {
	ALL = 3,
	PLAYING = 1,
	WAIT = 0,
	FULL = 2
}
var_0_0.ROOM_SORT_TYPE = {
	ROOM_VIEWER_CNT = 2,
	ROOM_PLAYER_SUM = 1,
	ROOM_CREATE_TIME = 3
}
var_0_0.ROOM_FILTER_TYPE = {
	ROOM = 2,
	SORT = 1,
	STATE = 3
}
var_0_0.SORT_TEXT = {
	[var_0_0.ROOM_SORT_TYPE.ROOM_PLAYER_SUM] = i18n("match_ui_room_filter1"),
	[var_0_0.ROOM_SORT_TYPE.ROOM_VIEWER_CNT] = i18n("match_ui_room_filter2"),
	[var_0_0.ROOM_SORT_TYPE.ROOM_CREATE_TIME] = i18n("match_ui_room_filter3")
}
var_0_0.GAME_TYPE = {
	CHEATER_TAVERN = 101
}

return var_0_0
