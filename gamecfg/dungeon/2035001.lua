return {
	id = 2025001,
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
							monsterTemplateID = 16855001,
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
								200825,
								201779
							},
							phase = {
								{
									index = 0,
									switchType = 1,
									switchTo = 1,
									switchParam = 1.5
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 13,
									addWeapon = {
										3395101
									}
								},
								{
									index = 2,
									switchParam = 3,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3395102
									},
									removeWeapon = {
										3395101
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 12,
									addWeapon = {
										3395103
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 3,
									removeWeapon = {
										3395102,
										3395103
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 9,
									addWeapon = {
										3395104,
										3395105
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 0.5,
									removeWeapon = {
										3395104,
										3395105
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 9,
									addWeapon = {
										3395104,
										3395105
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 1,
									switchParam = 1,
									removeWeapon = {
										3395104,
										3395105
									}
								},
								{
									index = 21,
									switchType = 1,
									switchTo = 22,
									switchParam = 3
								},
								{
									index = 22,
									switchParam = 5,
									switchTo = 23,
									switchType = 1,
									addBuff = {
										201781
									},
									addWeapon = {
										3395106
									}
								},
								{
									index = 23,
									switchType = 1,
									switchTo = 24,
									switchParam = 0.5,
									removeWeapon = {
										3395106
									}
								},
								{
									index = 24,
									switchType = 1,
									switchTo = 25,
									switchParam = 5,
									addWeapon = {
										3395107,
										3395108
									}
								},
								{
									index = 25,
									switchType = 1,
									switchTo = 22,
									switchParam = 300,
									addWeapon = {
										3395109
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
