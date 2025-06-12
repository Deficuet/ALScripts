local var_0_0 = class("IdolPTPage", import(".TemplatePage.PtTemplatePage"))

var_0_0.RefreshTime = 300

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.lableList = arg_1_0:findTF("list", arg_1_0.bg)
	arg_1_0.lableItems = {}

	for iter_1_0 = 0, arg_1_0.lableList.childCount - 1 do
		table.insert(arg_1_0.lableItems, arg_1_0.lableList:GetChild(iter_1_0))
	end

	arg_1_0.linkBtn = arg_1_0:findTF("btn_link", arg_1_0.bg)
end

function var_0_0.OnDataSetting(arg_2_0)
	return (var_0_0.super.OnDataSetting(arg_2_0))
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.displayBtn, function()
		arg_3_0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
			type = arg_3_0.ptData.type,
			dropList = arg_3_0.ptData.dropList,
			targets = arg_3_0.ptData.targets,
			level = arg_3_0.ptData.level,
			count = arg_3_0.ptData.count,
			resId = arg_3_0.ptData.resId
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.battleBtn, function()
		arg_3_0:emit(ActivityMediator.BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.getBtn, function()
		local var_6_0, var_6_1 = arg_3_0.ptData:GetResProgress()

		arg_3_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1,
			activity_id = arg_3_0.ptData:GetId(),
			arg1 = var_6_1
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.linkBtn, function()
		arg_3_0:emit(ActivityMediator.OPEN_LAYER, Context.New({
			viewComponent = InstagramLayer,
			mediator = InstagramMediator,
			data = {
				id = ActivityConst.IDOL_INS_ID
			}
		}))
	end)
end

function var_0_0.OnUpdateFlush(arg_8_0)
	var_0_0.super.OnUpdateFlush(arg_8_0)

	local var_8_0 = arg_8_0.linkAct

	if var_8_0 and not var_8_0:isEnd() then
		local var_8_1 = {}
		local var_8_2 = math.floor(#var_8_0.data1_list / 2)

		for iter_8_0 = 1, var_8_2 do
			local var_8_3 = var_8_0.data1_list[2 * iter_8_0 - 1]

			var_8_1[var_8_3] = (var_8_1[var_8_3] or 0) + (var_8_0.data1_list[2 * iter_8_0] or 0)
		end

		local var_8_4 = {}

		for iter_8_1, iter_8_2 in pairs(var_8_1) do
			table.insert(var_8_4, {
				name = iter_8_1,
				count = iter_8_2
			})
		end

		table.sort(var_8_4, function(arg_9_0, arg_9_1)
			if arg_9_0.count == arg_9_1.count then
				return arg_9_0.name < arg_9_1.name
			else
				return arg_9_0.count > arg_9_1.count
			end
		end)

		local var_8_5 = math.min(#var_8_4, #arg_8_0.lableItems)

		for iter_8_3 = 1, var_8_5 do
			local var_8_6 = arg_8_0.lableItems[iter_8_3]

			setText(var_8_6:Find("name"), "#" .. tostring(ShipGroup.getDefaultShipNameByGroupID(var_8_4[iter_8_3].name)) .. "#")
			setText(var_8_6:Find("Text"), arg_8_0:TransFormat(var_8_4[iter_8_3].count))
		end

		for iter_8_4 = var_8_5 + 1, #arg_8_0.lableItems do
			local var_8_7 = arg_8_0.lableItems[iter_8_4]

			setText(var_8_7:Find("name"), "")
			setText(var_8_7:Find("Text"), "0")
		end
	end

	arg_8_0:GetWorldRank(arg_8_0.RefreshTime)
end

function var_0_0.TransFormat(arg_10_0, arg_10_1)
	arg_10_1 = tonumber(arg_10_1) or 0

	local var_10_0 = math.floor(arg_10_1 / 1000)
	local var_10_1 = arg_10_1 % 10

	if var_10_0 >= 1 then
		return var_10_0 .. (var_10_1 > 0 and "." .. var_10_1 or "") .. "K"
	else
		return arg_10_1
	end
end

function var_0_0.GetWorldRank(arg_11_0, arg_11_1)
	if not arg_11_0.linkAct or arg_11_0.linkAct:isEnd() then
		return
	end

	local var_11_0 = arg_11_0.linkAct.id

	if arg_11_1 <= pg.TimeMgr.GetInstance():GetServerTime() - (getProxy(ActivityProxy).requestTime[var_11_0] or 0) then
		arg_11_0:emit(ActivityMediator.FETCH_INSTARGRAM, {
			activity_id = var_11_0
		})
	end
end

function var_0_0.NeedTip()
	local var_12_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.IDOL_PT_ID)

	if var_12_0 and not var_12_0:isEnd() then
		return var_12_0:readyToAchieve()
	end
end

return var_0_0
