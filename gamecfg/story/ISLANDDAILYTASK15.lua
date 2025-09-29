return {
	id = "ISLANDDAILYTASK15",
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
			animation = "hi",
			characterId = 100200,
			subName = "订单管理员",
			say = "啊，指挥官你来啦~",
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
			subName = "订单管理员",
			characterId = 100200,
			say = "旁边的这些就是给岛上大家的物资了，本应由我来给大家送过去的……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "但是你现在走不开对么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "订单管理员",
			say = "没错~港口又新来的一批货物，我正在清点呢……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "等忙完再去送的话……就没办法把物资及时送到每个人的手里了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "我来帮你把货送给大家吧，交给我就好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "我就知道指挥官会帮我的~这里面也有你的那一份哦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100200,
			subName = "订单管理员",
			say = "等送完再打开吧~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
