return {
	id = "ISLANDSIDESTORY2001002_2",
	mode = 10,
	map = {
		{
			100700,
			10040002
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
			subName = "林场管理员",
			characterId = 100700,
			say = "没有想到真的有机会和指挥官一起……伐木……",
			animation = "clap",
			face2Face = {
				{
					0,
					100700
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100700,
			subName = "林场管理员",
			say = "我……那我是不是应该表现得更专业、精细一些呢……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "做自己就好，只要精神起来，工作就会更有意义。",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
