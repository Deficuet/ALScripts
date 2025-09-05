return {
	id = "ISLANDSIDESTORY2003001_2",
	mode = 10,
	map = {
		{
			101200,
			10090008
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
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "您好，岛屿基地的事务遇到什么困难了吗？",
			animation = "hi",
			face2Face = {
				{
					0,
					101200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "基地的服务器宕机了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "服务器，终于还是不堪重负了吗……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "必须得尽快修好才行，否则，岛屿基地的科研工作一定会受到影响。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "我这就去调查服务器出问题的原因。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
