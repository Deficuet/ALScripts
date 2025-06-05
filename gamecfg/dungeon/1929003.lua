return {
	map_id = 10001,
	id = 1929003,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 180,
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
				45,
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
					conditionType = 0,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16739003,
							delay = 0,
							sickness = 0.5,
							corrdinate = {
								-10,
								0,
								65
							},
							bossData = {
								hpBarNum = 50,
								icon = ""
							},
							buffList = {},
							phase = {
								{
									switchParam = 1,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 15,
									setAI = 70267,
									addWeapon = {
										3279301,
										3279302,
										3279303,
										3279304,
										3279305,
										3279306
									}
								},
								{
									switchParam = 3.5,
									switchTo = 3,
									index = 2,
									switchType = 1,
									setAI = 70197,
									addBuff = {
										200825
									},
									removeWeapon = {
										3279301,
										3279302,
										3279303,
										3279304,
										3279305,
										3279306
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 8,
									addWeapon = {
										3279314
									}
								},
								{
									index = 4,
									switchParam = 1,
									switchTo = 1,
									switchType = 1,
									removeBuff = {
										200825
									},
									removeWeapon = {
										3279314
									}
								}
							}
						},
						{
							monsterTemplateID = 16739004,
							delay = 0,
							sickness = 0.5,
							corrdinate = {
								-10,
								0,
								35
							},
							bossData = {
								hpBarNum = 50,
								icon = ""
							},
							buffList = {},
							phase = {
								{
									switchParam = 1,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 15,
									setAI = 70268,
									addWeapon = {
										3279307,
										3279308,
										3279311,
										3279312,
										3279313
									}
								},
								{
									switchParam = 2,
									switchTo = 3,
									index = 2,
									switchType = 1,
									setAI = 70196,
									addBuff = {
										200825
									},
									removeWeapon = {
										3279307,
										3279308,
										3279311,
										3279312,
										3279313
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 9.5,
									addWeapon = {
										3279315
									}
								},
								{
									index = 4,
									switchParam = 1,
									switchTo = 1,
									switchType = 1,
									removeBuff = {
										200825
									},
									removeWeapon = {
										3279315
									}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
					waveIndex = 900,
					conditionType = 1,
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
