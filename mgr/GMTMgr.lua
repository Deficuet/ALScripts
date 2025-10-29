pg = pg or {}
pg.GMTMgr = singletonClass("GMTMgr")

local var_0_0 = pg.GMTMgr

var_0_0.TYPE_DEFAULT_RES = 2
var_0_0.TYPE_L2D = 4
var_0_0.TYPE_PAINTING = 8
var_0_0.TYPE_CIPHER = 16

function var_0_0.Init(arg_1_0, arg_1_1)
	arg_1_0._gmtTimer = Timer.New(function()
		arg_1_0:onTimer()
	end, 1, -1)

	if arg_1_1 then
		arg_1_1()
	end
end

function var_0_0.initUI(arg_3_0, arg_3_1)
	if arg_3_0._go == nil then
		PoolMgr.GetInstance():GetUI("GMTUI", true, function(arg_4_0)
			arg_3_0._go = arg_4_0

			arg_3_0._go:SetActive(false)

			arg_3_0._textTf = findTF(arg_3_0._go, "ad/text")

			local var_4_0 = GameObject.Find("OverlayCamera/Overlay/UITop")

			arg_3_0._go.transform:SetParent(var_4_0.transform, false)

			arg_3_0._animator = GetComponent(arg_3_0._go, typeof(Animator))

			arg_3_1()
		end)
	end
end

function var_0_0.onTimer(arg_5_0)
	arg_5_0._subTime = arg_5_0._gmtTime - pg.TimeMgr.GetInstance():GetServerTime()

	if arg_5_0._go == nil then
		arg_5_0:initUI(function()
			arg_5_0:showTip()
		end)
	else
		arg_5_0:showTip()
	end

	if arg_5_0._subTime < 0 and arg_5_0._gmtTimer.running then
		arg_5_0._gmtTimer:Stop()
		arg_5_0._go:SetActive(false)
	end
end

function var_0_0.showGMT(arg_7_0, arg_7_1)
	local var_7_0 = pg.gameset.maintenance_message.description

	arg_7_0._onceTime = Clone(var_7_0[1])
	arg_7_0._repeatTime = Clone(var_7_0[2])
	arg_7_0._gmtTime = arg_7_1

	if not arg_7_0._gmtTimer.running then
		arg_7_0._gmtTimer:Start()
	end

	arg_7_0._triggerStop = false
end

function var_0_0.showTip(arg_8_0)
	print(arg_8_0._subTime)

	local var_8_0 = false

	if arg_8_0.focusShowTip then
		var_8_0 = true
		arg_8_0.focusShowTip = false
	end

	if arg_8_0._subTime <= arg_8_0._repeatTime then
		var_8_0 = true
	else
		for iter_8_0 = #arg_8_0._onceTime, 1, -1 do
			if arg_8_0._subTime <= arg_8_0._onceTime[iter_8_0] then
				table.remove(arg_8_0._onceTime, iter_8_0)

				var_8_0 = true
			end
		end
	end

	if not var_8_0 then
		return
	end

	arg_8_0._go:SetActive(false)
	arg_8_0._go:SetActive(true)

	if arg_8_0._subTime > arg_8_0._repeatTime then
		arg_8_0._animator:SetTrigger("once")
	elseif not arg_8_0._triggerStop then
		arg_8_0._triggerStop = true

		arg_8_0._animator:SetTrigger("repeat")
	end

	local var_8_1 = arg_8_0:getTimeTip()

	setText(arg_8_0._textTf, var_8_1)
end

function var_0_0.getTimeTip(arg_9_0)
	if arg_9_0._subTime > 0 then
		local var_9_0 = math.floor(arg_9_0._subTime / 3600)
		local var_9_1 = math.floor(arg_9_0._subTime / 60)
		local var_9_2 = arg_9_0._subTime % 60
		local var_9_3

		if var_9_0 > 0 then
			var_9_3 = tostring(var_9_0) .. i18n("word_hour")
		elseif var_9_1 > 0 then
			var_9_3 = tostring(var_9_1) .. i18n("word_minute")
		else
			var_9_3 = tostring(var_9_2) .. i18n("word_second")
		end

		return i18n("maintenance_message_text", var_9_3)
	end

	return i18n("maintenance_message_stop_text")
end
