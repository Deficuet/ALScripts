return {
	id = "ISLANDSIDE01106",
	mode = 10,
	map = {
		{
			100800,
			10060002
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
			characterId = 0,
			say = "阿莫玛，看，牛奶、时蔬、肉类……都在这里了。",
			animation = "talk",
			face2Face = {
				{
					0,
					100800
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100800,
			subName = "商区管理员",
			say = "很好……品质都很不错，完美符合需求。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "商区管理员",
			characterId = 100800,
			say = "指挥官，你看……商区的店铺也全都建设好了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "嗯……很不错，宽敞明亮，充满了生活的烟火气和满足感。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100800,
			subName = "商区管理员",
			say = "是啊，从只有一家餐馆的商区，到现在的饮品店、简餐店、烤肉店……真的越来越繁华了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "这可都是你精心规划的成果。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 100800,
			subName = "商区管理员",
			say = "不，这是指挥官和大家共同努力的结果。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "商区管理员",
			characterId = 100800,
			say = "谢谢你……指挥官。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
