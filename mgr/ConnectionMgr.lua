pg = pg or {}

local var_0_0 = pg

var_0_0.ConnectionMgr = singletonClass("ConnectionMgr")

local var_0_1 = var_0_0.ConnectionMgr
local var_0_2 = createLog("ConnectionMgr", LOG_CONNECTION)
local var_0_3
local var_0_4
local var_0_5
local var_0_6
local var_0_7 = false
local var_0_8 = {}
local var_0_9
local var_0_10
local var_0_11
local var_0_12

var_0_1.needStartSend = false

local var_0_13
local var_0_14
local var_0_15
local var_0_16

function var_0_1.Connect(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	var_0_1.erroCode = arg_1_4
	var_0_16 = arg_1_3
	var_0_3 = Connection.New(arg_1_1, arg_1_2)

	var_0_0.UIMgr.GetInstance():LoadingOn()
	var_0_3.onConnected:AddListener(function()
		var_0_0.UIMgr.GetInstance():LoadingOff()
		originalPrint("Network Connected.")

		var_0_5 = arg_1_1
		var_0_6 = arg_1_2
		var_0_4 = var_0_4 or var_0_0.SendWindow.New(arg_1_0, 0)

		var_0_3.onData:AddListener(var_0_4.onData)

		if PLATFORM_CODE == PLATFORM_CHT then
			var_0_13 = var_0_0.IPAddress.New()
		end

		var_0_15 = -1
		var_0_7 = true
		var_0_10 = false

		arg_1_3()
		arg_1_0:resetHBTimer()
	end)
	var_0_3.onData:AddListener(arg_1_0.onData)
	var_0_3.onError:AddListener(arg_1_0.onError)
	var_0_3.onDisconnected:AddListener(arg_1_0.onDisconnected)

	var_0_10 = true

	var_0_3:Connect()
	originalPrint("connect to - " .. arg_1_1 .. ":" .. arg_1_2)
end

function var_0_1.ConnectByProxy(arg_3_0)
	VersionMgr.Inst:SetUseProxy(true)

	if arg_3_0:GetLastHost() ~= nil and arg_3_0:GetLastPort() ~= "" then
		originalPrint("switch proxy! reason: first connect error")
		arg_3_0:Connect(arg_3_0:GetLastHost(), arg_3_0:GetLastPort(), var_0_16)
	else
		originalPrint("not proxy -> logout")
		var_0_0.m02:sendNotification(GAME.LOGOUT, {
			code = var_0_1.erroCode or 3
		})
	end
end

function var_0_1.ConnectByDomain(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = LuaHelper.getHostByDomain(arg_4_1)
	local var_4_1 = DEFAULT_PORT

	arg_4_0:Connect(var_4_0, var_4_1, arg_4_2)
end

function var_0_1.Reconnect(arg_5_0, arg_5_1)
	if not var_0_5 or not var_0_6 then
		warning("Network is not connected.")

		return
	end

	if var_0_10 then
		warning("connecting, please wait...")

		return
	end

	if var_0_7 and var_0_3 ~= nil then
		warning("Network is connected.")

		return
	end

	var_0_11 = arg_5_1

	arg_5_0:stopHBTimer()
	var_0_4:stopTimer()
	originalPrint("reconnect --> " .. arg_5_0:GetLastHost() .. ":" .. arg_5_0:GetLastPort())
	arg_5_0:Connect(arg_5_0:GetLastHost(), arg_5_0:GetLastPort(), function()
		local var_6_0 = getProxy(UserProxy)
		local var_6_1 = var_6_0:getData()
		local var_6_2 = var_0_0.SdkMgr.GetInstance():GetChannelUID()

		if var_6_2 == "" then
			var_6_2 = PLATFORM_LOCAL
		end

		if not var_6_1 or not var_6_1:isLogin() then
			if var_0_4.currentCS == 10020 and var_0_12 ~= DISCONNECT_TIME_OUT then
				arg_5_0.needStartSend = false

				var_0_4:StartSend()
			else
				var_0_0.m02:sendNotification(GAME.LOGOUT, {
					code = 3
				})
			end

			return
		end

		var_0_4:Send(10022, {
			platform = var_6_2,
			account_id = var_6_1.uid,
			server_ticket = var_6_1.token,
			serverid = var_6_1.server,
			check_key = HashUtil.CalcMD5(var_6_1.token .. AABBUDUD),
			device_id = var_0_0.SdkMgr.GetInstance():GetDeviceId()
		}, 10023, function(arg_7_0)
			if arg_7_0.result == 0 then
				originalPrint("reconnect success: " .. arg_7_0.user_id, " - ", arg_7_0.server_ticket)

				var_6_1.token = arg_7_0.server_ticket

				var_6_0:setLastLogin(var_6_1)
				arg_5_1()
				var_0_4:RemoveLoginPacket()

				if var_0_12 ~= DISCONNECT_TIME_OUT and var_0_4:getPacketIdx() > 0 then
					arg_5_0.needStartSend = false

					var_0_4:Send(11001, {
						timestamp = 1
					}, 11002, function(arg_8_0)
						var_0_0.TimeMgr.GetInstance():SetServerTime(arg_8_0.timestamp, arg_8_0.monday_0oclock_timestamp)
						var_0_0.m02:sendNotification(GAME.CHANGE_CHAT_ROOM, 0)
					end)

					local var_7_0 = nowWorld()

					if var_7_0 and var_7_0.type ~= World.TypeBase then
						WorldConst.ReqWorldForServer()
					end

					NewEducateHelper.ReqDataForServer()
				elseif arg_5_0.needStartSend then
					arg_5_0.needStartSend = false

					var_0_4:StartSend()
				end

				var_0_12 = nil

				local var_7_1 = getProxy(PlayerProxy)

				if var_7_1 and var_7_1:getInited() then
					var_0_0.SecondaryPWDMgr.GetInstance():FetchData()
				end

				var_0_0.NewGuideMgr.GetInstance():Resume()
				var_0_0.m02:sendNotification(GAME.ON_RECONNECTION)
				var_0_0.m02:sendNotification(GAME.ON_APPLICATION_PAUSE, false)
			else
				originalPrint("reconnect failed: " .. arg_7_0.result)
				var_0_0.m02:sendNotification(GAME.LOGOUT, {
					code = 199,
					tip = arg_7_0.result
				})
			end
		end, false, false)
	end)
end

function var_0_1.onDisconnected(arg_9_0, arg_9_1)
	originalPrint("Network onDisconnected: " .. tostring(arg_9_0))

	var_0_12 = arg_9_1

	if var_0_3 then
		if not arg_9_0 then
			var_0_3.onDisconnected:RemoveAllListeners()
		end

		var_0_3:Dispose()

		var_0_3 = nil
	end

	if arg_9_0 then
		var_0_7 = false
	end

	if var_0_10 then
		var_0_0.UIMgr.GetInstance():LoadingOff()
	end

	var_0_10 = false
end

function var_0_1.onData(arg_10_0)
	if var_0_8[arg_10_0.cmd] then
		local var_10_0 = var_0_0.Packer.GetInstance():Unpack(arg_10_0.cmd, arg_10_0:getLuaStringBuffer())

		for iter_10_0, iter_10_1 in ipairs(var_0_8[arg_10_0.cmd]) do
			iter_10_1(var_10_0)
		end
	end
end

function var_0_1.onError(arg_11_0)
	arg_11_0 = tostring(arg_11_0)

	originalPrint("Network Error: " .. arg_11_0)

	if var_0_3 then
		var_0_3:Dispose()

		var_0_3 = nil
	end

	local function var_11_0()
		var_0_0.m02:sendNotification(GAME.LOGOUT, {
			code = var_0_1.erroCode or 3
		})
	end

	local function var_11_1()
		return
	end

	if var_0_10 then
		var_0_10 = false
		var_11_1 = var_0_11
	end

	var_0_0.ConnectionMgr.GetInstance():CheckProxyCounter()

	if var_0_5 and var_0_6 then
		var_0_0.ConnectionMgr.GetInstance():stopHBTimer()

		if table.contains({
			"NotSocket"
		}, arg_11_0) then
			var_0_0.ConnectionMgr.GetInstance():Reconnect(var_11_1)
		else
			var_0_0.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				content = i18n("reconnect_tip", arg_11_0),
				onYes = function()
					var_0_0.ConnectionMgr.GetInstance():Reconnect(var_11_1)
				end,
				onNo = var_11_0
			})
			var_0_0.NewStoryMgr.GetInstance():Stop()
			var_0_0.NewGuideMgr.GetInstance():Pause()
		end
	else
		var_0_0.ConnectionMgr.GetInstance():ConnectByProxy()
	end
end

function var_0_1.Send(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4, arg_15_5, arg_15_6)
	local function var_15_0(arg_16_0)
		if arg_16_0.result == 9998 then
			var_0_0.m02:sendNotification(GAME.EXTRA_PROTO_RESULT, {
				result = arg_16_0.result
			})
		else
			arg_15_4(arg_16_0)
		end
	end

	if not var_0_4 then
		warning("sendWindow is nil. msgid " .. arg_15_1)

		return
	end

	var_0_4:Queue(arg_15_1, arg_15_2, arg_15_3, var_15_0, arg_15_5, nil, arg_15_6)
end

function var_0_1.setPacketIdx(arg_17_0, arg_17_1)
	var_0_4:setPacketIdx(arg_17_1)
end

function var_0_1.On(arg_18_0, arg_18_1, arg_18_2)
	if var_0_8[arg_18_1] == nil then
		var_0_8[arg_18_1] = {}
	end

	table.insert(var_0_8[arg_18_1], arg_18_2)
end

function var_0_1.Off(arg_19_0, arg_19_1, arg_19_2)
	if var_0_8[arg_19_1] == nil then
		return
	end

	if arg_19_2 == nil then
		var_0_8[arg_19_1] = nil
	else
		for iter_19_0, iter_19_1 in ipairs(var_0_8[arg_19_1]) do
			if iter_19_1 == arg_19_2 then
				table.remove(var_0_8[arg_19_1], iter_19_0)

				break
			end
		end
	end
end

function var_0_1.Disconnect(arg_20_0)
	arg_20_0:stopHBTimer()

	var_0_8 = {}

	originalPrint("Manually Disconnect !!!")

	if var_0_3 then
		var_0_3:Dispose()

		var_0_3 = nil
	end

	var_0_5 = nil
	var_0_6 = nil
	lastProxyHost = nil
	lastProxyPort = nil
	var_0_4 = nil
	var_0_7 = false
end

function var_0_1.getConnection(arg_21_0)
	return var_0_3
end

function var_0_1.isConnecting(arg_22_0)
	return var_0_10
end

function var_0_1.isConnected(arg_23_0)
	return var_0_7
end

function var_0_1.stopHBTimer(arg_24_0)
	if var_0_9 then
		var_0_9:Stop()

		var_0_9 = nil
	end
end

function var_0_1.resetHBTimer(arg_25_0)
	arg_25_0:stopHBTimer()

	var_0_9 = Timer.New(function()
		var_0_14 = TimeUtil.GetSystemTime()

		arg_25_0:Send(10100, {
			need_request = 1
		}, 10101, function(arg_27_0)
			local var_27_0 = TimeUtil.GetSystemTime() - var_0_14

			if var_0_15 == -1 then
				var_0_15 = var_27_0
			else
				var_0_15 = (var_27_0 + var_0_15) / 2
			end
		end, false)
	end, HEART_BEAT_TIMEOUT, -1, true)

	var_0_9:Start()
end

function var_0_1.GetPingDelay(arg_28_0)
	return var_0_15
end

local var_0_17 = 0
local var_0_18 = 2
local var_0_19
local var_0_20

function var_0_1.SetProxyHost(arg_29_0, arg_29_1, arg_29_2)
	var_0_19 = arg_29_1
	var_0_20 = arg_29_2

	originalPrint("Proxy host --> " .. var_0_19 .. ":" .. var_0_20)
end

function var_0_1.GetLastHost(arg_30_0)
	if VersionMgr.Inst:OnProxyUsing() and var_0_19 ~= nil and var_0_19 ~= "" then
		return var_0_19
	end

	return var_0_5
end

function var_0_1.GetLastPort(arg_31_0)
	if VersionMgr.Inst:OnProxyUsing() and var_0_20 ~= nil and var_0_20 ~= 0 then
		return var_0_20
	end

	return var_0_6
end

function var_0_1.CheckProxyCounter(arg_32_0)
	var_0_17 = var_0_17 + 1

	originalPrint("proxyCounter: " .. var_0_17)

	if not VersionMgr.Inst:OnProxyUsing() then
		if var_0_17 == var_0_18 then
			originalPrint("switch proxy! reason: " .. var_0_18 .. " error limit")
			VersionMgr.Inst:SetUseProxy(true)
		end
	else
		VersionMgr.Inst:SetUseProxy(false)

		var_0_17 = 0
	end
end

function var_0_1.SwitchProxy(arg_33_0)
	if var_0_13 and var_0_13:IsSpecialIP() then
		if not VersionMgr.Inst:OnProxyUsing() then
			originalPrint("switch proxy! reason: tw specialIP send timeout")
			VersionMgr.Inst:SetUseProxy(true)
		else
			VersionMgr.Inst:SetUseProxy(false)
		end

		var_0_1.onDisconnected(false, DISCONNECT_TIME_OUT)
	end
end
