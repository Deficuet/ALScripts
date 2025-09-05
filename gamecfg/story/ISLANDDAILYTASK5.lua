return {
	id = "ISLANDDAILYTASK5",
	mode = 10,
	map = {
		{
			100500,
			10010003
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
			subName = "牧场管理员",
			characterId = 100500,
			say = "哇——！是指挥官！是给我的牧场动物们带吃的东西来了吗？",
			animation = "nod",
			face2Face = {
				{
					0,
					100500
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100500,
			subName = "牧场管理员",
			say = "啊，不是的话也没关系，只要是指挥官带来的东西，梅莉都很喜欢哦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "helation",
			characterId = 100500,
			subName = "牧场管理员",
			say = "动物们也是！有你在，牧场一定会越来越热闹的~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
