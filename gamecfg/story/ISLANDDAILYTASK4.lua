return {
	id = "ISLANDDAILYTASK4",
	mode = 10,
	map = {
		{
			100400,
			10010040
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
			animation = "talk",
			characterId = 100400,
			subName = "农田管理员",
			say = "辛苦指挥官了……我也会加倍努力管理好农场的。",
			face2Face = {
				{
					0,
					100400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "争取早日让岛上的大家都吃上种类丰富的新鲜蔬菜。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "这是我唯一能帮上指挥官的了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
