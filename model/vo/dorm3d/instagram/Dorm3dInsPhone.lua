local var_0_0 = class("Dorm3dInsPhone", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1
	arg_1_0.configId = arg_1_1
	arg_1_0.isLock = true
end

function var_0_0.ExtendsData(arg_2_0, arg_2_1)
	arg_2_0.time = arg_2_1.time
	arg_2_0.isRead = arg_2_1.read_flag == 1
	arg_2_0.isLock = false
end

function var_0_0.Unlock(arg_3_0, arg_3_1)
	arg_3_0.time = arg_3_1
	arg_3_0.isRead = false
	arg_3_0.isLock = false
end

function var_0_0.bindConfigTable(arg_4_0)
	return pg.dorm3d_ins_telephone_group
end

function var_0_0.ShouldTip(arg_5_0)
	return not arg_5_0.isLock and not arg_5_0.isRead
end

function var_0_0.IsLock(arg_6_0)
	return arg_6_0.isLock
end

function var_0_0.GetName(arg_7_0)
	return arg_7_0:getConfig("name")
end

function var_0_0.GetDesc(arg_8_0)
	return arg_8_0:getConfig("unlock_desc")
end

function var_0_0.GetContent(arg_9_0)
	return arg_9_0:getConfig("content")
end

function var_0_0.GetDay(arg_10_0)
	local var_10_0 = math.floor((pg.TimeMgr.GetInstance():GetServerTime() - arg_10_0.time) / 86400)

	return var_10_0 == 0 and i18n("dorm3d_privatechat_visit_time_now") or i18n("dorm3d_privatechat_visit_time", var_10_0)
end

return var_0_0
