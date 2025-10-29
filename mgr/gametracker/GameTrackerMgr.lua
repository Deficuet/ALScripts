pg = pg or {}
pg.GameTrackerMgr = singletonClass("GameTrackerMgr")

local var_0_0 = pg.GameTrackerMgr

GameTrackerBuilder = import("Mgr.GameTracker.GameTrackerBuilder")

local var_0_1 = 300
local var_0_2 = 20
local var_0_3 = "GameTrackerMgr"
local var_0_4 = "^"

function var_0_0.Init(arg_1_0, arg_1_1)
	arg_1_0.readBuffer = {}
	arg_1_0.writeBuffer = {}
	arg_1_0.duration = var_0_1
	arg_1_0.passed = 0

	arg_1_0:SetUp()
	arg_1_1()
end

function var_0_0.Record(arg_2_0, arg_2_1)
	if not arg_2_1 then
		return
	end

	table.insert(arg_2_0.readBuffer, arg_2_1)
	arg_2_0:Cache()

	if #arg_2_0.readBuffer >= var_0_2 then
		arg_2_0:Synchronization()
	end
end

function var_0_0.Synchronization(arg_3_0)
	arg_3_0.passed = 0

	arg_3_0:Send()
end

function var_0_0.Dispose(arg_4_0)
	if arg_4_0.handle then
		UpdateBeat:RemoveListener(arg_4_0.handle)
	end

	arg_4_0.readBuffer = {}
	arg_4_0.writeBuffer = {}
	arg_4_0.passed = 0
end

function var_0_0.SetUp(arg_5_0)
	if not arg_5_0.handle then
		arg_5_0.handle = UpdateBeat:CreateListener(arg_5_0.Update, arg_5_0)
	end

	UpdateBeat:AddListener(arg_5_0.handle)
end

function var_0_0.Update(arg_6_0)
	arg_6_0.passed = arg_6_0.passed + Time.deltaTime

	if arg_6_0.passed >= arg_6_0.duration then
		arg_6_0.passed = 0

		arg_6_0:Synchronization()
	end
end

function var_0_0.Send(arg_7_0)
	if #arg_7_0.readBuffer <= 0 then
		return
	end

	if not pg.ConnectionMgr.GetInstance():isConnected() then
		return
	end

	arg_7_0:FillBuffer()
	arg_7_0:ClearCache()
	pg.m02:sendNotification(GAME.GAME_TRACK, {
		infos = arg_7_0.writeBuffer
	})
end

function var_0_0.FillBuffer(arg_8_0)
	arg_8_0.writeBuffer = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.readBuffer) do
		table.insert(arg_8_0.writeBuffer, iter_8_1)
	end

	arg_8_0.readBuffer = {}
end

function var_0_0.Cache(arg_9_0)
	local var_9_0 = arg_9_0.readBuffer or {}

	if #var_9_0 <= 0 then
		return
	end

	local var_9_1 = _.map(var_9_0, function(arg_10_0)
		return GameTrackerBuilder.SerializedItem(arg_10_0)
	end)
	local var_9_2 = table.concat(var_9_1, var_0_4)

	if not getProxy(PlayerProxy) then
		return
	end

	if not getProxy(PlayerProxy):getRawData() then
		return
	end

	local var_9_3 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString(var_0_3 .. var_9_3, var_9_2)
	PlayerPrefs.Save()
end

function var_0_0.ClearCache(arg_11_0)
	local var_11_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString(var_0_3 .. var_11_0, "")
	PlayerPrefs.Save()
end

function var_0_0.FetchCache(arg_12_0)
	local var_12_0 = getProxy(PlayerProxy):getRawData().id
	local var_12_1 = PlayerPrefs.GetString(var_0_3 .. var_12_0, "")

	if not var_12_1 or var_12_1 == "" then
		return
	end

	arg_12_0.readBuffer = {}

	local var_12_2 = string.split(var_12_1, var_0_4)
	local var_12_3 = _.map(var_12_2, function(arg_13_0)
		return GameTrackerBuilder.DeSerializedItem(arg_13_0)
	end)

	for iter_12_0, iter_12_1 in ipairs(var_12_3) do
		if iter_12_1 then
			table.insert(arg_12_0.readBuffer, 1, iter_12_1)
		end
	end
end
