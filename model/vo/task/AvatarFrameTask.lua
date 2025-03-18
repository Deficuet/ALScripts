local var_0_0 = class("AvatarFrameTask", import(".Task"))

var_0_0.type_task_level = "task_level"
var_0_0.type_task_ship = "task_ship"
var_0_0.fillter_task_type = {
	var_0_0.type_task_level,
	var_0_0.type_task_ship
}

local var_0_1 = var_0_0.fillter_task_type
local var_0_2 = "avatar_task_level"
local var_0_3 = {
	"avatar_upgrad_1",
	"avatar_upgrad_2",
	"avatar_upgrad_3"
}
local var_0_4 = "avatar_task_ship_1"
local var_0_5 = "avatar_task_ship_2"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._actId = arg_1_1
	arg_1_0.configId = arg_1_2
	arg_1_0.id = arg_1_3.id
	arg_1_0.progress = arg_1_3.progress or 0
	arg_1_0.acceptTime = arg_1_3.accept_time or 0
	arg_1_0.submitTime = arg_1_3.submit_time or 0
end

function var_0_0.IsActEnd(arg_2_0)
	local var_2_0 = pg.activity_event_avatarframe[arg_2_0.configId].link_event
	local var_2_1 = getProxy(ActivityProxy):getActivityById(var_2_0)

	return not var_2_1 or var_2_1:isEnd()
end

function var_0_0.updateProgress(arg_3_0, arg_3_1)
	arg_3_0.progress = arg_3_1 or 0
end

function var_0_0.isFinish(arg_4_0)
	return arg_4_0:getProgress() >= arg_4_0:getConfig("target_num")
end

function var_0_0.getProgress(arg_5_0)
	return arg_5_0.progress or 0
end

function var_0_0.isReceive(arg_6_0)
	return false
end

function var_0_0.getTaskStatus(arg_7_0)
	if arg_7_0.progress >= arg_7_0:getConfig("target_num") then
		return 1
	end

	return 0
end

function var_0_0.onAdded(arg_8_0)
	return
end

function var_0_0.setTaskFinish(arg_9_0)
	arg_9_0.submitTime = 1

	arg_9_0:updateProgress(arg_9_0:getConfig("target_num"))
end

function var_0_0.updateProgress(arg_10_0, arg_10_1)
	arg_10_0.progress = arg_10_1
end

function var_0_0.isSelectable(arg_11_0)
	return false
end

function var_0_0.judgeOverflow(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	return false, false
end

function var_0_0.IsUrTask(arg_13_0)
	return false
end

function var_0_0.GetRealType(arg_14_0)
	return 6
end

function var_0_0.IsOverflowShipExpItem(arg_15_0)
	return false
end

function var_0_0.ShowOnTaskScene(arg_16_0)
	return true
end

function var_0_0.getConfig(arg_17_0, arg_17_1)
	if not arg_17_0.configData then
		local var_17_0 = pg.activity_event_avatarframe[arg_17_0.configId]

		if not var_17_0 then
			print("avatart id = " .. arg_17_0.configId .. " is not found")

			return
		end

		local var_17_1 = arg_17_0:getTypeData(var_17_0, arg_17_0.id)

		if not var_17_1 then
			return
		end

		local var_17_2 = Clone(var_17_0.award_display)

		var_17_2[1][3] = var_17_1.award_num
		arg_17_0.configData = {
			level = 1,
			sub_type = 0,
			item_id = var_17_0.pt_id,
			desc = var_17_1.desc,
			target_num = var_17_1.target_num,
			award_num = var_17_1.award_num,
			scene = var_17_1.scene,
			award_display = var_17_2
		}
	end

	return arg_17_0.configData[arg_17_1]
end

function var_0_0.getTypeData(arg_18_0, arg_18_1, arg_18_2)
	for iter_18_0 = 1, #var_0_1 do
		local var_18_0 = var_0_1[iter_18_0]
		local var_18_1 = arg_18_1[var_18_0]

		for iter_18_1, iter_18_2 in ipairs(var_18_1) do
			if iter_18_2[1] == arg_18_2 then
				arg_18_0.avatarType = var_18_0

				return arg_18_0:createData(var_18_0, iter_18_2)
			end
		end
	end
end

function var_0_0.isAvatarTask(arg_19_0)
	return true
end

function var_0_0.getActId(arg_20_0)
	return arg_20_0._actId
end

function var_0_0.createData(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0

	if arg_21_1 == var_0_0.type_task_level then
		local var_21_1, var_21_2, var_21_3, var_21_4, var_21_5, var_21_6 = unpack(arg_21_2)
		local var_21_7 = ""

		if var_21_3 > 0 and var_21_3 <= #var_0_3 then
			var_21_7 = pg.gametip[var_0_3[var_21_3]].tip
		end

		local var_21_8 = var_21_2 * 10 + 1
		local var_21_9 = pg.ship_data_statistics[var_21_8].name
		local var_21_10
		local var_21_11

		for iter_21_0, iter_21_1 in ipairs(var_21_4) do
			assert(pg.chapter_template[iter_21_1] ~= nil, "找不到chapterid = " .. iter_21_1)

			var_21_11 = var_21_11 or {
				"ACTIVITY_MAP",
				{
					pg.chapter_template[iter_21_1].act_id
				}
			}

			if not var_21_10 then
				var_21_10 = pg.chapter_template[iter_21_1].chapter_name
			else
				var_21_10 = var_21_10 .. "," .. pg.chapter_template[iter_21_1].chapter_name
			end
		end

		var_21_0 = {
			target_num = var_21_5,
			award_num = var_21_6,
			scene = var_21_11,
			desc = i18n("avatar_task_level", var_21_7, var_21_9, var_21_10, var_21_5)
		}
	elseif arg_21_1 == var_0_0.type_task_ship then
		local var_21_12, var_21_13, var_21_14, var_21_15 = unpack(arg_21_2)
		local var_21_16 = var_21_13 * 10 + 1
		local var_21_17 = pg.ship_data_statistics[var_21_16].name

		if var_21_14 == 1 then
			var_21_0 = {
				award_num = var_21_15,
				desc = i18n(var_0_4, var_21_17)
			}
		elseif var_21_14 == 2 then
			var_21_0 = {
				award_num = var_21_15,
				desc = i18n(var_0_5, var_21_17),
				scene = {
					"DOCKYARD",
					{
						mode = "overview"
					}
				}
			}
		end
	end

	return setmetatable(var_21_0, {
		__index = {
			award_num = 1,
			target_num = 1,
			desc = ""
		}
	})
end

return var_0_0
