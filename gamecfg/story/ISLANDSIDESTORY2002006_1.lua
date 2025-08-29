return {
	id = "ISLANDSIDESTORY2002006_1",
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
			subName = "订单管理员",
			characterId = 100200,
			say = "画好啦~！",
			animation = "hi",
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
			characterId = 0,
			say = "嗯！果然，这么漂亮的画就得配上漂亮的相框嘛！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "curious",
			characterId = 100200,
			subName = "订单管理员",
			say = "嘿嘿，指挥官这么喜欢我的画吗~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "这幅画可是免费送给指挥官了哦，指挥官不表示点什么吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "你想要什么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "elation",
			characterId = 100200,
			subName = "订单管理员",
			say = "哼哼，我突然有闻到咖啡的香味哦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "好好，还请稍等片刻，你的咖啡马上就到~",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
