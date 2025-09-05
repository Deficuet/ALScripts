return {
	id = "ISLANDSIDESTORY2003002_1",
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
			say = "指挥官你来了，服务器宕机的原因已经调查出来了。",
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
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "因为运行强度过高，服务器的电力系统过载报废了……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "我问了乔安，想要修好电力系统，需要有足够的银矿才行。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "矿山那边一时也没有这么多银矿……这该怎么办才好……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "收集银矿的事就交给我吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "happy",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "指挥官你正好有时间吗？有你帮忙，感觉就安心了许多。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "采集完成后，就去矿山找乔安吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
