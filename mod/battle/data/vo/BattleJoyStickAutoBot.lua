ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleJoyStickAutoBot = class("BattleJoyStickAutoBot")

local var_0_1 = var_0_0.Battle.BattleJoyStickAutoBot

var_0_1.__name = "BattleJoyStickAutoBot"
var_0_1.COUNTER_MAIN = "CounterMainRandomStrategy"
var_0_1.RANDOM = "RandomStrategy"
var_0_1.AUTO_PILOT = "AutoPilotStrategy"
var_0_1.IDLE = "IdleStrategy"

function var_0_1.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._dataProxy = arg_1_1
	arg_1_0._fleetVO = arg_1_2

	arg_1_0:init()
end

function var_0_1.UpdateFleetArea(arg_2_0)
	if arg_2_0._strategy then
		arg_2_0._strategy:SetBoardBound(arg_2_0._fleetVO:GetFleetBound())
	end
end

function var_0_1.FleetFormationUpdate(arg_3_0)
	if arg_3_0._strategy:GetStrategyType() == var_0_1.AUTO_PILOT then
		arg_3_0:SwitchStrategy(var_0_1.AUTO_PILOT)
	end
end

function var_0_1.SetActive(arg_4_0, arg_4_1)
	arg_4_0._active = arg_4_1

	if arg_4_1 then
		local function var_4_0()
			return arg_4_0._strategy:Output()
		end

		arg_4_0._fleetVO:SetMotionSource(var_4_0)
	else
		arg_4_0._fleetVO:SetMotionSource()
	end
end

function var_0_1.SwitchStrategy(arg_6_0, arg_6_1)
	if arg_6_0._strategy then
		arg_6_0._strategy:Dispose()
	end

	arg_6_0._strategy = var_0_0.Battle[arg_6_1].New(arg_6_0._fleetVO)

	arg_6_0:UpdateFleetArea()
	arg_6_0._strategy:Input(arg_6_0._dataProxy:GetFoeShipList(), arg_6_0._dataProxy:GetFoeAircraftList())
end

function var_0_1.init(arg_7_0)
	arg_7_0._active = false
	arg_7_0._uiMgr = pg.UIMgr.GetInstance()
end

function var_0_1.Dispose(arg_8_0)
	if arg_8_0._strategy then
		arg_8_0._strategy:Dispose()
	end

	arg_8_0._dataProxy = nil
	arg_8_0._uiMediator = nil
	arg_8_0._uiMgr = nil
end
