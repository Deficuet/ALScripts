return {
	id = "ISLAND1001011",
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
			animation = "hi",
			say = "帕特莉，看你这么忙，港口订单都归你统筹？",
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
			animation = "amaze",
			characterId = 100200,
			subName = "订单管理员",
			say = "指挥官？！啊对，港口的订单是我在管理哦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "不过你怎么突然来开发区了？也不提前说一声，不然大家肯定都会来港口迎接你的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "看大家这阵仗，怕是人人都抽不开身，你们应该顾不上迎接……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "嗯，也是，订单量足足暴涨了三倍呢~",
			characterId = 100200,
			subName = "订单管理员",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "（可我记得港区这周明明就没给{namecode:98:明石}下过订单。）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "（那这些货都是运到哪里去的……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "嗯？指挥官看得这么入神……该不是来查账的吧？",
			characterId = 100200,
			subName = "订单管理员",
			animation = "curious",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "不、我来是为了交乔安她们的订单，这些都是乔安和奥布莱恩准备的货物。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "啊，还是加急件呢！真是多谢指挥官了~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "不过即使是指挥官送来的，我也会好好核对清楚的哦~",
			characterId = 100200,
			subName = "订单管理员",
			animation = "elation",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "接下来就麻烦指挥官挨个提交一下订单啦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
