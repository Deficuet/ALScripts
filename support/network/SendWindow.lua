pg = pg or {}

local var_0_0 = pg

var_0_0.SendWindow = class("SendWindow")

local var_0_1 = var_0_0.SendWindow
local var_0_2

function var_0_1.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.connectionMgr = arg_1_1
	arg_1_0.packetIdx = defaultValue(arg_1_2, 0)
	arg_1_0.isSending = false
	arg_1_0.toSends = {}
	arg_1_0.retryCount = 0
	var_0_2 = {}
end

function var_0_1.setPacketIdx(arg_2_0, arg_2_1)
	arg_2_0.packetIdx = arg_2_1
end

function var_0_1.getPacketIdx(arg_3_0)
	return arg_3_0.packetIdx
end

function var_0_1.incPacketIdx(arg_4_0)
	arg_4_0.packetIdx = arg_4_0.packetIdx + 1
end

function var_0_1.Queue(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5, arg_5_6, arg_5_7)
	table.insert(arg_5_0.toSends, {
		arg_5_1,
		arg_5_2,
		arg_5_3,
		arg_5_4 and function(arg_6_0)
			table.remove(arg_5_0.toSends, 1)
			arg_5_4(arg_6_0)

			if arg_6_0 and arg_6_0.result and arg_6_0.result == 0 or arg_5_3 == 20012 then
				var_0_0.SeriesGuideMgr.GetInstance():receiceProtocol(arg_5_3, arg_5_2, arg_6_0)
			end
		end,
		arg_5_5,
		arg_5_6,
		arg_5_7
	})

	if arg_5_0.isSending then
		return
	end

	arg_5_0:StartSend()
end

function var_0_1.RemoveLoginPacket(arg_7_0)
	if #arg_7_0.toSends > 0 and arg_7_0.toSends[1][1] == 10022 then
		table.remove(arg_7_0.toSends, 1)
	end
end

function var_0_1.StartSend(arg_8_0)
	if #arg_8_0.toSends > 0 then
		arg_8_0:Send(unpack(arg_8_0.toSends[1]))
	else
		warning("No more packets to send.")
	end
end

function var_0_1.Send(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6, arg_9_7)
	arg_9_0.isSending = true
	arg_9_0.currentCS = arg_9_1

	if arg_9_0.connectionMgr:isConnecting() then
		arg_9_0.connectionMgr.needStartSend = true

		return
	end

	local var_9_0 = arg_9_0.connectionMgr:getConnection()

	if not var_9_0 then
		arg_9_0.connectionMgr.needStartSend = true

		arg_9_0.connectionMgr:Reconnect(function()
			return
		end)

		return
	end

	arg_9_5 = defaultValue(arg_9_5, true)
	arg_9_6 = defaultValue(arg_9_6, true)
	arg_9_7 = defaultValue(arg_9_7, SEND_TIMEOUT)

	local var_9_1 = arg_9_0:getPacketIdx()

	if arg_9_3 ~= nil then
		var_0_0.UIMgr.GetInstance():LoadingOn()

		local var_9_2

		if arg_9_5 then
			var_9_2 = arg_9_3 .. "_" .. var_9_1
		else
			var_9_2 = arg_9_3
		end

		local var_9_3

		var_0_2[var_9_2] = function(arg_11_0)
			arg_9_0.isSending = false

			var_0_0.UIMgr.GetInstance():LoadingOff()
			arg_9_0.connectionMgr:resetHBTimer()

			if var_9_3 then
				var_9_3:Stop()
			end

			arg_9_4(arg_11_0)

			if arg_9_6 and not arg_9_0.isSending and #arg_9_0.toSends > 0 then
				arg_9_0:StartSend()
			end
		end
		var_9_3 = Timer.New(function()
			var_0_0.UIMgr.GetInstance():LoadingOff()

			var_0_2[var_9_2] = nil

			arg_9_0:setPacketIdx(var_9_1)

			if arg_9_0.retryCount > 3 then
				arg_9_0.connectionMgr.onDisconnected(false, DISCONNECT_TIME_OUT)

				arg_9_0.retryCount = 0
			end

			if PLATFORM_CODE == PLATFORM_CHT then
				arg_9_0.connectionMgr.SwitchProxy()
			end

			warning("Network is timedOut, resend: " .. var_9_1 .. ", protocal: " .. arg_9_1)

			arg_9_0.retryCount = arg_9_0.retryCount + 1

			arg_9_0:StartSend()
		end, arg_9_7, 1)

		var_9_3:Start()
	else
		arg_9_5 = false
	end

	local var_9_4 = var_0_0.Packer.GetInstance():GetProtocolWithName("cs_" .. arg_9_1)

	local function var_9_5(arg_13_0, arg_13_1)
		for iter_13_0, iter_13_1 in pairs(arg_13_1) do
			if type(iter_13_1) == "table" then
				if arg_13_0[iter_13_0].add then
					for iter_13_2, iter_13_3 in ipairs(iter_13_1) do
						var_9_5(arg_13_0[iter_13_0]:add(), iter_13_3)
					end
				elseif arg_13_0[iter_13_0].append then
					for iter_13_4, iter_13_5 in ipairs(iter_13_1) do
						arg_13_0[iter_13_0]:append(iter_13_5)
					end
				else
					var_9_5(arg_13_0[iter_13_0], iter_13_1)
				end
			else
				arg_13_0[iter_13_0] = iter_13_1
			end
		end
	end

	local var_9_6 = var_9_4:GetMessage()

	var_9_5(var_9_6, arg_9_2)

	if arg_9_5 then
		var_9_0:Send(var_0_0.Packer.GetInstance():Pack(var_9_1, var_9_4:GetId(), var_9_6))
		originalPrint("Network sent protocol: " .. arg_9_1 .. " with idx: " .. var_9_1)
		arg_9_0:incPacketIdx()
	else
		var_9_0:Send(var_0_0.Packer.GetInstance():Pack(0, var_9_4:GetId(), var_9_6))
		originalPrint("Network sent protocol: " .. arg_9_1 .. " without idx")
	end

	if not arg_9_3 then
		table.remove(arg_9_0.toSends, 1)

		if #arg_9_0.toSends > 0 then
			arg_9_0:StartSend()
		else
			arg_9_0.isSending = false
		end
	end
end

function var_0_1.stopTimer(arg_14_0)
	if arg_14_0.timer then
		arg_14_0.timer:Stop()

		arg_14_0.timer = nil
	end
end

function var_0_1.onData(arg_15_0)
	originalPrint("Network Receive idx: " .. arg_15_0.idx .. " cmd: " .. arg_15_0.cmd)

	local var_15_0 = var_0_0.Packer.GetInstance():Unpack(arg_15_0.cmd, arg_15_0:getLuaStringBuffer())
	local var_15_1 = arg_15_0.cmd .. "_" .. arg_15_0.idx

	if var_0_2[var_15_1] then
		local var_15_2 = var_0_2[var_15_1]

		var_0_2[var_15_1] = nil

		var_15_2(var_15_0)
	elseif var_0_2[arg_15_0.cmd] then
		local var_15_3 = var_0_2[arg_15_0.cmd]

		var_0_2[arg_15_0.cmd] = nil

		var_15_3(var_15_0)
	end
end
