return {
	id = "ISLANDDAILYTASK8",
	mode = 10,
	map = {
		{
			101300,
			10030003
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			animation = "amaze",
			characterId = 101300,
			subName = "集会岛向导",
			say = "哇！指挥官！你找到我要的东西了！",
			face2Face = {
				{
					0,
					101300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会岛向导",
			characterId = 101300,
			say = "快让我看看是什么好吃的~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会岛向导",
			characterId = 101300,
			say = "太棒啦！看着就很美味！谢谢你指挥官！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101300,
			subName = "集会岛向导",
			say = "嘿嘿~补充完能量，又能活力满满地带大家游玩集会岛啦！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
