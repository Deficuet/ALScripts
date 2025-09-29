return {
	id = "ISLAND1001006_1",
	mode = 10,
	map = {
		{
			100600,
			10040032
		},
		{
			100700,
			10040031
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
			say = "乔安，我们来了。",
			animation = "hi",
			face2Face = {
				{
					0,
					100600
				}
			},
			turnto = {
				{
					100700,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "木材……也一起带来了。",
			characterId = 100700,
			subName = "林场管理员",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "太棒了，两位都辛苦了！材料齐活~",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "这下可以正式开始修复交通线啦！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "我们也来帮忙吧……",
			characterId = 100700,
			subName = "林场管理员",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "嗯，这样应该会快一些。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
