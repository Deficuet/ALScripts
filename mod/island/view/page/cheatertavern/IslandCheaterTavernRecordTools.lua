local var_0_0 = {}

var_0_0.LOST = 0
var_0_0.WIN = 1
var_0_0.LEAVE = 2

function var_0_0.StartGame()
	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildCheaterTavernGame(0, 0))

	var_0_0.startTime = pg.TimeMgr.GetInstance():GetServerTime()
	var_0_0.scoreBefore = PlayRoomTools.GetPtScrore(PlayRoomTools.GetGameTypeID())
	var_0_0.turnCnt = 0
	var_0_0.roundCnt = 0
	var_0_0.duration = 0
end

function var_0_0.StopPlayTime()
	local var_2_0 = pg.TimeMgr.GetInstance():GetServerTime() - var_0_0.startTime

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildCheaterTavernGame(1, var_2_0))
end

function var_0_0.RecordResult(arg_3_0)
	var_0_0.StopPlayTime()

	local var_3_0 = PlayRoomTools.GetPtScrore(PlayRoomTools.GetGameTypeID())

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildCheaterTavernResult(arg_3_0, var_0_0.scoreBefore, var_3_0, var_0_0.turnCnt, var_0_0.roundCnt, var_0_0.duration))
end

function var_0_0.AddTurnCnt()
	var_0_0.turnCnt = var_0_0.turnCnt + 1
end

function var_0_0.AddRoundCnt()
	var_0_0.roundCnt = var_0_0.roundCnt + 1
end

function var_0_0.StartPutCardTime()
	var_0_0.putCardTime = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.StopPutCardTime()
	var_0_0.duration = var_0_0.duration + (pg.TimeMgr.GetInstance():GetServerTime() - var_0_0.putCardTime)
end

return var_0_0
