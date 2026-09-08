local var_0_0 = class("ReversePacmanConst")

var_0_0.TIME_INTERVAL = 0.016666666666666666
var_0_0.GRID_SIZE = {
	x = 35,
	y = 35
}
var_0_0.GRID_SIZE_2 = {
	x = 22,
	y = 22
}
var_0_0.GRID = {
	ROAD = "road",
	BLOCK = "block",
	DEPLOY = "deploy",
	SPAWN = "spawn"
}
var_0_0.TAG = {
	CORNER = "corner",
	CORRIDOR = "corridor",
	JUNCTION = "junction",
	DEAD_END = "deadEnd",
	ISOLATED = "isolated"
}
var_0_0.DIR = {
	RIGHT = 2,
	UP = 1,
	LEFT = 4,
	DOWN = 3
}
var_0_0.DIR_VECTORS = {
	[var_0_0.DIR.UP] = {
		x = 0,
		y = -1
	},
	[var_0_0.DIR.RIGHT] = {
		x = 1,
		y = 0
	},
	[var_0_0.DIR.DOWN] = {
		x = 0,
		y = 1
	},
	[var_0_0.DIR.LEFT] = {
		x = -1,
		y = 0
	}
}
var_0_0.ROLE = {
	SHIP = "ship",
	MONSTER = "monster"
}
var_0_0.BUFF = {
	BLOCK = 2,
	GIANT = 3,
	SPEED = 1
}
var_0_0.BUFF_EDU = 4
var_0_0.STATE = {
	SETTLEMENT = "settlement",
	RUNNING = "running",
	INIT = "init",
	PREPARE = "prepare",
	CAPTURE = "capture",
	EXIT = "exit"
}
var_0_0.EVENT = {
	CAST = "cast",
	GRAPH_CHANGED = "graphChanged",
	PICK = "pick",
	SHIP_PERFORMANCE = "shipPerformance",
	CAPTURE = "capture"
}
var_0_0.SHIP_PERFORMANCE_TYPE = {
	FAR = 3,
	CAPTURE = 2,
	NEAR = 1
}
var_0_0.SHIP_PERFORMANCE_RANGE = {
	[var_0_0.SHIP_PERFORMANCE_TYPE.NEAR] = var_0_0.GRID_SIZE.x * 3,
	[var_0_0.SHIP_PERFORMANCE_TYPE.FAR] = var_0_0.GRID_SIZE.x * 8
}
var_0_0.SHIP_PERFORMANCE_COOLDOWN = 3
var_0_0.SHIP_PERFORMANCE_GLOBAL_COOLDOWN = 2
var_0_0.GAMEPLAY_TIME_SCALE = {
	FAST_TRIGGER_REMAIN_TIME = 30,
	NORMAL = 1,
	FAST = 2
}

function var_0_0.GetGameplayTimeScale(arg_1_0)
	if arg_1_0 ~= nil and arg_1_0 < var_0_0.GAMEPLAY_TIME_SCALE.FAST_TRIGGER_REMAIN_TIME then
		return var_0_0.GAMEPLAY_TIME_SCALE.FAST
	end

	return var_0_0.GAMEPLAY_TIME_SCALE.NORMAL
end

var_0_0.TAG_SPEED_FACTOR = {
	[var_0_0.TAG.ISOLATED] = 1,
	[var_0_0.TAG.DEAD_END] = 1,
	[var_0_0.TAG.CORRIDOR] = 1.1,
	[var_0_0.TAG.CORNER] = 0.9,
	[var_0_0.TAG.JUNCTION] = 0.8
}
var_0_0.ROLE_RADIUS = {
	[var_0_0.ROLE.SHIP] = 25,
	[var_0_0.ROLE.MONSTER] = 30
}
var_0_0.GRADE = {
	C = "C",
	A = "A",
	S = "S",
	B = "B"
}
var_0_0.RESULT_TYPE = {
	SUCCESS = 1,
	FAIL = 2
}
var_0_0.MONSTER_TRAP_MIN_COMPONENT_NODES = 12
var_0_0.MONSTER_TRAP_COMPONENT_RATIO = 0.1

function var_0_0.GetGrade(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1 > 0 and calcFloor(arg_2_0 / arg_2_1 * 100) or 0
	local var_2_1 = arg_2_2[1] or 80
	local var_2_2 = arg_2_2[2] or 50
	local var_2_3 = arg_2_2[3] or 30

	if var_2_1 <= var_2_0 then
		return var_0_0.GRADE.S
	end

	if var_2_2 <= var_2_0 then
		return var_0_0.GRADE.A
	end

	if var_2_3 <= var_2_0 then
		return var_0_0.GRADE.B
	end

	return var_0_0.GRADE.C
end

return var_0_0
