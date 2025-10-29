local var_0_0 = class("IslandSceneContext")

function var_0_0.Ctor(arg_1_0, arg_1_1, ...)
	arg_1_0.class = arg_1_1
	arg_1_0.args = packEx(...)
	arg_1_0.subpages = {}
	arg_1_0.__visible = true
	arg_1_0.__openPrevWhenClose = true
	arg_1_0.__delRecordWhenClose = true
end

function var_0_0.DisabelOpenPrevWhenClose(arg_2_0)
	arg_2_0.__openPrevWhenClose = false
end

function var_0_0.DisabelDelRecordWhenClose(arg_3_0)
	arg_3_0.__delRecordWhenClose = false
end

function var_0_0.GetDelRecordWhenClose(arg_4_0)
	local var_4_0 = arg_4_0.__delRecordWhenClose

	arg_4_0.__delRecordWhenClose = true

	return var_4_0
end

function var_0_0.GetOpenPrevWhenClose(arg_5_0)
	local var_5_0 = arg_5_0.__openPrevWhenClose

	arg_5_0.__openPrevWhenClose = true

	return var_5_0
end

function var_0_0.AddSubPage(arg_6_0, arg_6_1, ...)
	local var_6_0 = _.detect(arg_6_0.subpages, function(arg_7_0)
		return arg_6_1.__cname == arg_7_0.class.__cname
	end)

	if var_6_0 then
		var_6_0.__visible = true

		return
	end

	local var_6_1 = IslandSceneContext.New(arg_6_1, ...)

	table.insert(arg_6_0.subpages, var_6_1)
end

function var_0_0.GetSubPages(arg_8_0)
	return arg_8_0.subpages
end

function var_0_0.GetData(arg_9_0)
	return arg_9_0.args
end

return var_0_0
