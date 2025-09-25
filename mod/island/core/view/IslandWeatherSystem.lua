local var_0_0 = class("IslandWeatherSystem")
local var_0_1 = 60
local var_0_2 = 240
local var_0_3 = 86400

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.view = arg_1_1
	arg_1_0.TOD = GameObject.Find("/[MainBlock]/[Climat]/day/[Settings]/TOD_Timeline")
	arg_1_0._inited = false

	if arg_1_0.TOD then
		setActive(arg_1_0.TOD, true)
	end

	if not arg_1_0.TOD then
		warning("TOD_Timeline不存在 如果是室内场景 忽略这条警告")

		return
	end

	arg_1_0.director = arg_1_0.TOD:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))
	arg_1_0.speedComp = GetOrAddComponent(arg_1_0.TOD, "TimelineSpeed")

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	local var_2_0 = pg.island_set.island_time_rate.key_value_int

	assert(var_2_0 and var_2_0 > 0, "Invalid island time rate")

	arg_2_0.gameDaySec = math.floor(var_0_3 / var_2_0)

	arg_2_0.director:Stop()

	arg_2_0.director.playOnAwake = false
	arg_2_0.director.extrapolationMode = UnityEngine.Playables.DirectorWrapMode.Loop
	arg_2_0._inited = true

	arg_2_0:Play()
end

function var_0_0.Play(arg_3_0)
	if not arg_3_0._inited then
		return
	end

	local var_3_0 = pg.TimeMgr.GetInstance()
	local var_3_1 = (var_3_0:GetServerTime() - var_3_0._sAnchorTime) % var_0_3 % arg_3_0.gameDaySec
	local var_3_2 = math.floor(var_3_1 / arg_3_0.gameDaySec * var_0_2)

	arg_3_0.director.time = var_3_2 / var_0_1

	arg_3_0.director:Play()
	arg_3_0.speedComp:SetTimelineSpeed(var_0_2 / var_0_1 / arg_3_0.gameDaySec)
end

function var_0_0.Dispose(arg_4_0)
	return
end

return var_0_0
