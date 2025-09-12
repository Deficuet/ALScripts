return {
	map_id = 10001,
	id = 1965001,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 300,
			passCondition = 1,
			backGroundStageID = 1,
			totalArea = {
				-80,
				20,
				90,
				70
			},
			playerArea = {
				-80,
				20,
				60,
				68
			},
			enemyArea = {},
			fleetCorrdinate = {
				-80,
				0,
				75
			},
			waves = {
				{
					triggerType = 1,
					waveIndex = 100,
					preWaves = {},
					triggerParams = {
						timeout = 0.5
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 101,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16775001,
							delay = 0.1,
							corrdinate = {
								-10,
								0,
								50
							},
							bossData = {
								hpBarNum = 100,
								icon = ""
							},
							buffList = {
								200825
							},
							phase = {
								{
									index = 0,
									switchType = 1,
									switchTo = 1,
									switchParam = 1.5
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 6,
									setAI = 75016,
									addWeapon = {
										3315101,
										3315102
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 4,
									addWeapon = {
										3315103,
										3315104,
										3315105
									}
								},
								{
									switchParam = 15,
									switchTo = 4,
									index = 3,
									switchType = 1,
									setAI = 70252,
									addWeapon = {
										3315109,
										3315110
									},
									removeBuff = {
										200825
									},
									removeWeapon = {
										3315101,
										3315102
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 4,
									addBuff = {
										200825
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 2,
									removeWeapon = {
										3315103,
										3315104,
										3315105,
										3315109,
										3315110
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 5,
									addWeapon = {
										3315106,
										3315107
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 15,
									addWeapon = {
										3315108
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 1,
									switchParam = 4,
									removeWeapon = {
										3315106,
										3315107,
										3315108
									}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
					waveIndex = 900,
					preWaves = {
						101
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {}
}
