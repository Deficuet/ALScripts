local var_0_0 = class("BattleGateCardPuzzle")

ys.Battle.BattleGateCardPuzzle = var_0_0
var_0_0.__name = "BattleGateCardPuzzle"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.combatID
	local var_1_1 = ys.Battle.BattleDataFunction.GetPuzzleDungeonTemplate(var_1_0)
	local var_1_2 = var_1_1.dungeon_id
	local var_1_3 = {
		CardPuzzleShip.New({
			configId = var_1_1.scout_id
		}),
		CardPuzzleShip.New({
			configId = var_1_1.main_id
		})
	}
	local var_1_4 = var_1_1.deck
	local var_1_5 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_1.relic) do
		table.insert(var_1_5, CardPuzzleGift.New({
			configId = iter_1_1
		}))
	end

	;(function(arg_2_0)
		local var_2_0 = {
			hp = 1,
			cardPuzzleFleet = var_1_3,
			prefabFleet = {},
			cards = var_1_4,
			relics = var_1_5,
			stageId = var_1_2,
			system = SYSTEM_CARDPUZZLE,
			puzzleCombatID = var_1_0
		}

		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_2_0)
	end)()
end

function var_0_0.Exit(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.statistics._battleScore

	if var_3_0 >= ys.Battle.BattleConst.BattleScore.S then
		local var_3_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CARD_PUZZLE)

		arg_3_1:sendNotification(GAME.ACT_CARD_PUZZLE, {
			cmd = 1,
			activity_id = var_3_1 and var_3_1.id,
			arg1 = arg_3_0.puzzleCombatID
		})
	end

	local var_3_2 = {
		system = SYSTEM_CARDPUZZLE,
		score = var_3_0
	}

	arg_3_1:sendNotification(GAME.FINISH_STAGE_DONE, var_3_2)
end

function var_0_0.GetPreloadList(arg_4_0)
	local var_4_0 = {}
	local var_4_1 = {}
	local var_4_2 = ys.Battle.BattleResourceManager.GetInstance()
	local var_4_3 = arg_4_0.cards

	for iter_4_0, iter_4_1 in ipairs(var_4_3) do
		local var_4_4 = ys.Battle.BattleDataFunction.GetPuzzleCardDataTemplate(iter_4_1).effect[1]
		local var_4_5 = ys.Battle.BattleDataFunction.GetCardRes(var_4_4)

		for iter_4_2, iter_4_3 in ipairs(var_4_5) do
			table.insert(var_4_5, iter_4_3)
		end
	end

	for iter_4_4, iter_4_5 in ipairs(arg_4_0.cardPuzzleFleet) do
		local var_4_6 = iter_4_5:getConfig("id")
		local var_4_7 = ys.Battle.BattleDataFunction.GetPuzzleShipDataTemplate(var_4_6)

		table.insert(var_4_1, var_4_7.skin_id)
		table.insert(var_4_0, var_4_2.GetShipResource(var_4_7.id, var_4_7.skin_id, true))
	end

	table.insert(var_4_0, var_4_2.GetUIPath("CardTowerCardCombat"))
	table.insert(var_4_0, var_4_2.GetFXPath("kapai_weizhi"))

	return var_4_0, var_4_1
end

return var_0_0
