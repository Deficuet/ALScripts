return {
	id = 2074013,
	stages = {
		{
			stageIndex = 1,
			backGroundStageID = 1,
			timeCount = 180,
			totalArea = {
				-70,
				20,
				90,
				70
			},
			playerArea = {
				-70,
				20,
				37,
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
					triggerType = 1,
					waveIndex = 201,
					preWaves = {},
					triggerParams = {
						timeout = 18
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
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16904301,
							delay = 0.1,
							corrdinate = {
								-10,
								0,
								50
							},
							bossData = {
								hpBarNum = 40,
								icon = ""
							},
							buffList = {
								200914,
								201140
							},
							phase = {
								{
									switchParam = 1,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 4,
									addWeapon = {
										3440401
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 6,
									addWeapon = {
										3440402
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 2,
									removeWeapon = {
										3440401,
										3440402
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 8,
									addWeapon = {
										3440403
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 1,
									switchParam = 3,
									removeWeapon = {
										3440403
									}
								}
							}
						}
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 103,
					conditionType = 0,
					preWaves = {
						500,
						101
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16904302,
							delay = 0.1,
							corrdinate = {
								-10,
								0,
								50
							},
							bossData = {
								hpBarNum = 60,
								icon = ""
							},
							buffList = {
								200914
							},
							phase = {
								{
									switchParam = 1,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 6,
									addWeapon = {
										3440404
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 0.5,
									removeWeapon = {
										3440404
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 5,
									addWeapon = {
										3440405
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 3,
									removeWeapon = {
										3440405
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 2,
									addWeapon = {
										3440406
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 4,
									addWeapon = {
										3440407
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 8,
									addWeapon = {
										3440408
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 1,
									switchParam = 1.5,
									removeWeapon = {
										3440406,
										3440407,
										3440408
									}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
					key = true,
					waveIndex = 900,
					preWaves = {
						103
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {}
}
