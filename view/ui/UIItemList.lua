local var_0_0 = class("UIItemList")

var_0_0.EventInit = 1
var_0_0.EventUpdate = 2
var_0_0.EventExcess = 3

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	assert(not IsNil(arg_1_1))
	assert(not IsNil(arg_1_2))

	arg_1_0.container = arg_1_1
	arg_1_0.item = arg_1_2
	arg_1_0.currentCount = 0
end

function var_0_0.make(arg_2_0, arg_2_1)
	assert(arg_2_1 == nil or type(arg_2_1) == "function")

	arg_2_0.callback = arg_2_1
end

function var_0_0.align(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_1 >= 0)

	local var_3_0 = arg_3_0.container
	local var_3_1 = var_3_0.childCount

	for iter_3_0 = var_3_1, arg_3_1 - 1 do
		local var_3_2 = cloneTplTo(arg_3_0.item, var_3_0)
	end

	if arg_3_0.callback then
		for iter_3_1 = arg_3_0.currentCount, arg_3_1 - 1 do
			local var_3_3 = var_3_0:GetChild(iter_3_1)

			arg_3_0.callback(var_0_0.EventInit, iter_3_1, var_3_3)
		end

		for iter_3_2 = arg_3_1, arg_3_0.currentCount - 1 do
			local var_3_4 = var_3_0:GetChild(iter_3_2)

			arg_3_0.callback(var_0_0.EventExcess, iter_3_2, var_3_4)
		end

		arg_3_0.currentCount = arg_3_1
	end

	arg_3_2 = arg_3_2 or 0

	for iter_3_3 = arg_3_1, var_3_1 - 1 do
		local var_3_5 = var_3_0:GetChild(iter_3_3)

		setActive(var_3_5, false)
	end

	if arg_3_2 > 0 then
		for iter_3_4 = 0, arg_3_1 - 1 do
			local var_3_6 = var_3_0:GetChild(iter_3_4)

			setActive(var_3_6, false)
		end

		local var_3_7 = 0

		arg_3_0:StopTimer()

		arg_3_0.timer = Timer.New(function()
			local var_4_0 = var_3_0:GetChild(var_3_7)

			setActive(var_4_0, true)

			if arg_3_0.callback then
				arg_3_0.callback(var_0_0.EventUpdate, var_3_7, var_4_0)
			end

			var_3_7 = var_3_7 + 1

			if var_3_7 >= arg_3_1 then
				arg_3_0:StopTimer()
			end
		end, arg_3_2, arg_3_1)

		arg_3_0.timer.func()
		arg_3_0.timer:Start()
	else
		for iter_3_5 = 0, arg_3_1 - 1 do
			local var_3_8 = var_3_0:GetChild(iter_3_5)

			setActive(var_3_8, true)

			if arg_3_0.callback then
				arg_3_0.callback(var_0_0.EventUpdate, iter_3_5, var_3_8)
			end
		end
	end
end

function var_0_0.each(arg_5_0, arg_5_1)
	for iter_5_0 = arg_5_0.container.childCount - 1, 0, -1 do
		local var_5_0 = arg_5_0.container:GetChild(iter_5_0)

		arg_5_1(iter_5_0, var_5_0)
	end
end

function var_0_0.eachActive(arg_6_0, arg_6_1)
	for iter_6_0 = 0, arg_6_0.container.childCount - 1 do
		local var_6_0 = arg_6_0.container:GetChild(iter_6_0)

		if isActive(var_6_0) then
			arg_6_1(iter_6_0, var_6_0)
		end
	end
end

function var_0_0.StaticAlign(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = UIItemList.New(arg_7_0, arg_7_1)

	var_7_0:make(arg_7_3)
	var_7_0:align(arg_7_2)
end

function var_0_0.StopTimer(arg_8_0)
	if arg_8_0.timer then
		arg_8_0.timer:Stop()

		arg_8_0.timer = nil
	end
end

function var_0_0.Dispose(arg_9_0)
	arg_9_0:StopTimer()
end

return var_0_0
