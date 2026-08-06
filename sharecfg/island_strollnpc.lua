pg = pg or {}
pg.island_strollnpc = rawget(pg, "island_strollnpc") or setmetatable({
	__name = "island_strollnpc"
}, confNEO)
pg.island_strollnpc.all = {
	1001,
	1008,
	1009,
	1010,
	1012,
	10117,
	10517,
	10703,
	19903,
	20121,
	20212,
	20403,
	20603,
	29903,
	30129,
	30407,
	30707,
	31201,
	40303,
	50108,
	50204,
	50205,
	60802,
	70104,
	90107,
	90111,
	30311,
	30312,
	49902,
	49906,
	10205,
	10110,
	50107,
	50201,
	50601,
	300900,
	300901,
	300902,
	300903,
	300301,
	300401,
	300402,
	300403,
	300404,
	300405,
	300501,
	960001,
	990001,
	990002,
	990003
}
pg.base = pg.base or {}
pg.base.island_strollnpc = {}

;(function()
	pg.base.island_strollnpc[1001] = {
		behaviourTree = "",
		mapId = "",
		id = 1001,
		unit_id = 100100,
		action_feedback = 0,
		unlock = 0
	}
	pg.base.island_strollnpc[1008] = {
		behaviourTree = "",
		mapId = "",
		id = 1008,
		unit_id = 100800,
		action_feedback = 0,
		unlock = 0
	}
	pg.base.island_strollnpc[1009] = {
		behaviourTree = "",
		mapId = "",
		id = 1009,
		unit_id = 100900,
		action_feedback = 0,
		unlock = 0
	}
	pg.base.island_strollnpc[1010] = {
		behaviourTree = "",
		mapId = "",
		id = 1010,
		unit_id = 101000,
		action_feedback = 0,
		unlock = 0
	}
	pg.base.island_strollnpc[1012] = {
		behaviourTree = "",
		mapId = "",
		id = 1012,
		unit_id = 101200,
		action_feedback = 0,
		unlock = 0
	}
	pg.base.island_strollnpc[10117] = {
		id = 10117,
		behaviourTree = "",
		unit_id = 1011700,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				17
			}
		}
	}
	pg.base.island_strollnpc[10517] = {
		id = 10517,
		behaviourTree = "",
		unit_id = 1051700,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				1
			}
		}
	}
	pg.base.island_strollnpc[10703] = {
		id = 10703,
		behaviourTree = "",
		unit_id = 1070300,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1004,
				1
			}
		}
	}
	pg.base.island_strollnpc[19903] = {
		id = 19903,
		behaviourTree = "",
		unit_id = 1990300,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				19
			}
		}
	}
	pg.base.island_strollnpc[20121] = {
		id = 20121,
		behaviourTree = "",
		unit_id = 2012100,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				18
			}
		}
	}
	pg.base.island_strollnpc[20212] = {
		id = 20212,
		behaviourTree = "",
		unit_id = 2021200,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1001,
				6
			}
		}
	}
	pg.base.island_strollnpc[20403] = {
		id = 20403,
		behaviourTree = "",
		unit_id = 2040300,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				3
			}
		}
	}
	pg.base.island_strollnpc[20603] = {
		id = 20603,
		behaviourTree = "",
		unit_id = 2060300,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				0
			}
		}
	}
	pg.base.island_strollnpc[29903] = {
		id = 29903,
		behaviourTree = "",
		unit_id = 2990300,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1001,
				0
			}
		}
	}
	pg.base.island_strollnpc[30129] = {
		id = 30129,
		behaviourTree = "",
		unit_id = 3012900,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1001,
				1
			}
		}
	}
	pg.base.island_strollnpc[30407] = {
		id = 30407,
		behaviourTree = "",
		unit_id = 3040700,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				10
			}
		}
	}
	pg.base.island_strollnpc[30707] = {
		id = 30707,
		behaviourTree = "",
		unit_id = 3070700,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1005,
				2
			}
		}
	}
	pg.base.island_strollnpc[31201] = {
		id = 31201,
		behaviourTree = "",
		unit_id = 3120100,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1005,
				1
			}
		}
	}
	pg.base.island_strollnpc[40303] = {
		id = 40303,
		behaviourTree = "",
		unit_id = 4030300,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1004,
				2
			}
		}
	}
	pg.base.island_strollnpc[50108] = {
		id = 50108,
		behaviourTree = "",
		unit_id = 5010800,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1004,
				6
			}
		}
	}
	pg.base.island_strollnpc[50204] = {
		id = 50204,
		behaviourTree = "",
		unit_id = 5020400,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				2
			}
		}
	}
	pg.base.island_strollnpc[50205] = {
		id = 50205,
		behaviourTree = "",
		unit_id = 5020500,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				11
			}
		}
	}
	pg.base.island_strollnpc[60802] = {
		id = 60802,
		behaviourTree = "",
		unit_id = 6080200,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1005,
				0
			}
		}
	}
	pg.base.island_strollnpc[70104] = {
		id = 70104,
		behaviourTree = "",
		unit_id = 7010400,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1004,
				0
			}
		}
	}
	pg.base.island_strollnpc[90107] = {
		id = 90107,
		behaviourTree = "",
		unit_id = 9010700,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				20
			}
		}
	}
	pg.base.island_strollnpc[90111] = {
		id = 90111,
		behaviourTree = "",
		unit_id = 9011100,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				12
			}
		}
	}
	pg.base.island_strollnpc[30311] = {
		id = 30311,
		behaviourTree = "",
		unit_id = 3031100,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1004,
				4
			}
		}
	}
	pg.base.island_strollnpc[30312] = {
		id = 30312,
		behaviourTree = "",
		unit_id = 3031200,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				13
			}
		}
	}
	pg.base.island_strollnpc[49902] = {
		id = 49902,
		behaviourTree = "",
		unit_id = 4990200,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1004,
				3
			}
		}
	}
	pg.base.island_strollnpc[49906] = {
		id = 49906,
		behaviourTree = "",
		unit_id = 4990600,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1004,
				5
			}
		}
	}
	pg.base.island_strollnpc[10205] = {
		id = 10205,
		behaviourTree = "",
		unit_id = 1020500,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1005,
				3
			}
		}
	}
	pg.base.island_strollnpc[10110] = {
		id = 10110,
		behaviourTree = "",
		unit_id = 1011000,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1001,
				3
			}
		}
	}
	pg.base.island_strollnpc[50107] = {
		id = 50107,
		behaviourTree = "",
		unit_id = 5010700,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1001,
				5
			}
		}
	}
	pg.base.island_strollnpc[50201] = {
		id = 50201,
		behaviourTree = "",
		unit_id = 5020100,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1005,
				4
			}
		}
	}
	pg.base.island_strollnpc[50601] = {
		id = 50601,
		behaviourTree = "",
		unit_id = 5060100,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1001,
				4
			}
		}
	}
	pg.base.island_strollnpc[300900] = {
		behaviourTree = "",
		mapId = "",
		id = 300900,
		unit_id = 300900,
		action_feedback = 0,
		unlock = 0
	}
	pg.base.island_strollnpc[300901] = {
		behaviourTree = "",
		mapId = "",
		id = 300901,
		unit_id = 300901,
		action_feedback = 0,
		unlock = 0
	}
	pg.base.island_strollnpc[300902] = {
		behaviourTree = "",
		mapId = "",
		id = 300902,
		unit_id = 300902,
		action_feedback = 0,
		unlock = 0
	}
	pg.base.island_strollnpc[300903] = {
		behaviourTree = "",
		mapId = "",
		id = 300903,
		unit_id = 300903,
		action_feedback = 0,
		unlock = 0
	}
	pg.base.island_strollnpc[300301] = {
		id = 300301,
		behaviourTree = "",
		unit_id = 300300,
		action_feedback = 0,
		unlock = 0,
		mapId = {
			{
				1002,
				4
			}
		}
	}
	pg.base.island_strollnpc[300401] = {
		id = 300401,
		behaviourTree = "island/nodecanvas/scene_stroll_luzhangjiu",
		unit_id = 300400,
		action_feedback = 0,
		unlock = 0,
		mapId = {
			{
				1002,
				5,
				100
			}
		}
	}
	pg.base.island_strollnpc[300402] = {
		id = 300402,
		behaviourTree = "island/nodecanvas/scene_stroll_luzhangjiu",
		unit_id = 300400,
		action_feedback = 0,
		unlock = 0,
		mapId = {
			{
				1002,
				6,
				100
			}
		}
	}
	pg.base.island_strollnpc[300403] = {
		id = 300403,
		behaviourTree = "island/nodecanvas/scene_stroll_luzhangjiu",
		unit_id = 300400,
		action_feedback = 0,
		unlock = 0,
		mapId = {
			{
				1002,
				7,
				100
			}
		}
	}
	pg.base.island_strollnpc[300404] = {
		id = 300404,
		behaviourTree = "island/nodecanvas/scene_stroll_luzhangjiu",
		unit_id = 300400,
		action_feedback = 0,
		unlock = 0,
		mapId = {
			{
				1002,
				8,
				100
			}
		}
	}
	pg.base.island_strollnpc[300405] = {
		id = 300405,
		behaviourTree = "island/nodecanvas/scene_stroll_luzhangjiu",
		unit_id = 300400,
		action_feedback = 0,
		unlock = 0,
		mapId = {
			{
				1002,
				9,
				100
			}
		}
	}
	pg.base.island_strollnpc[300501] = {
		id = 300501,
		behaviourTree = "",
		unit_id = 300500,
		action_feedback = 0,
		unlock = 0,
		mapId = {
			{
				1001,
				2
			}
		}
	}
	pg.base.island_strollnpc[960001] = {
		id = 960001,
		behaviourTree = "",
		unit_id = 96000100,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				21
			}
		}
	}
	pg.base.island_strollnpc[990001] = {
		id = 990001,
		behaviourTree = "",
		unit_id = 99000100,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				15
			}
		}
	}
	pg.base.island_strollnpc[990002] = {
		id = 990002,
		behaviourTree = "",
		unit_id = 99000200,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				16
			}
		}
	}
	pg.base.island_strollnpc[990003] = {
		id = 990003,
		behaviourTree = "",
		unit_id = 99000300,
		action_feedback = 1,
		unlock = -1,
		mapId = {
			{
				1002,
				14
			}
		}
	}
end)()
