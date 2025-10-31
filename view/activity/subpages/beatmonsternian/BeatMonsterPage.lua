local var_0_0 = class("BeatMonsterPage", import("....base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
end

function var_0_0.OnFirstFlush(arg_2_0)
	return
end

function var_0_0.OnUpdateFlush(arg_3_0)
	arg_3_0:Show()

	local var_3_0 = arg_3_0.activity
	local var_3_1 = arg_3_0:PacketData(var_3_0)

	if not arg_3_0.controller then
		arg_3_0.controller = BeatMonsterController.New()

		arg_3_0.controller.mediator:SetUI(arg_3_0._go)
		arg_3_0.controller:SetUp(var_3_1, function(arg_4_0)
			arg_3_0:emit(ActivityMainScene.LOCK_ACT_MAIN, arg_4_0)
		end)
	else
		arg_3_0.controller:NetData(var_3_1)
	end
end

function var_0_0.PacketData(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:GetDataConfig("hp")
	local var_5_1 = var_5_0 - arg_5_1.data3
	local var_5_2 = arg_5_1:GetCountForHitMonster()
	local var_5_3 = arg_5_1:GetDataConfig("story")

	return {
		hp = math.max(var_5_1, 0),
		maxHp = var_5_0,
		leftCount = var_5_2,
		storys = var_5_3
	}
end

function var_0_0.OnDestroy(arg_6_0)
	arg_6_0.controller:Dispose()
end

return var_0_0
