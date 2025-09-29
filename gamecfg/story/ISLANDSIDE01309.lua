return {
	id = "ISLANDSIDE01309",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			say = "这是繁荫苗圃的薰衣草订单需要的货物。",
			animation = "talk",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "note",
			characterId = 100200,
			subName = "订单管理员",
			say = "我这就清点下~不错，一件不少！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "虽然差一点就要超过截止时间了，不过……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "订单管理员",
			say = "极限完成当然也是完成啦！辛苦你们了~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
