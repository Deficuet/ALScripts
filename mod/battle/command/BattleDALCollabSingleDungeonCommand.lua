ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = class("BattleDALCollabSingleDungeonCommand", var_0_0.Battle.BattleSingleDungeonCommand)

var_0_0.Battle.BattleDALCollabSingleDungeonCommand = var_0_3
var_0_3.__name = "BattleDALCollabSingleDungeonCommand"

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.DoPrologue(arg_2_0)
	pg.UIMgr.GetInstance():Marching()

	local function var_2_0()
		arg_2_0._uiMediator:OpeningEffect(function()
			arg_2_0._uiMediator:ShowAutoBtn()
			arg_2_0._uiMediator:ShowTimer()
			arg_2_0._state:GetCommandByName(var_0_0.Battle.BattleControllerWeaponCommand.__name):TryAutoSub()
			arg_2_0._state:ChangeState(var_0_0.Battle.BattleState.BATTLE_STATE_FIGHT)
			arg_2_0._waveUpdater:Start()

			if arg_2_0._dataProxy:GetInitData().hideAllButtons then
				arg_2_0._dataProxy:DispatchEvent(var_0_0.Event.New(var_0_0.Battle.BattleEvent.HIDE_INTERACTABLE_BUTTONS, {
					isActive = false
				}))
			end
		end)
		arg_2_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE):FleetWarcry()
		arg_2_0._dataProxy:InitAllFleetUnitsWeaponCD()
		arg_2_0._dataProxy:TirggerBattleStartBuffs()
		pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_2_0._shiftTimer)

		arg_2_0._shiftTimer = nil
	end

	local function var_2_1()
		local var_5_0 = arg_2_0._dataProxy:GetInitData().DALAidBuffIDs
		local var_5_1

		for iter_5_0, iter_5_1 in ipairs(var_5_0) do
			var_5_1 = var_0_0.Battle.BattleBuffUnit.New(iter_5_1, 1)
		end

		if var_5_1 then
			local var_5_2 = arg_2_0._dataProxy:GetFleetList()

			for iter_5_2, iter_5_3 in pairs(var_5_2) do
				local var_5_3 = iter_5_3:GetUnitList()
				local var_5_4 = iter_5_3:GetMainList()[1]

				for iter_5_4, iter_5_5 in ipairs(var_5_3) do
					if iter_5_5 == var_5_4 then
						iter_5_5:AddBuff(var_5_1)
						iter_5_5:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_DAL_COLLAB_FLAG_SHIP)
					end
				end
			end

			arg_2_0._shiftTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", -1, 2, var_2_0, true)
		else
			var_2_0()
		end
	end

	arg_2_0._uiMediator:SeaSurfaceShift(45, 0, nil, var_2_1)
end
