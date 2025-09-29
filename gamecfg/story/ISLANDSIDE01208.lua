return {
	id = "ISLANDSIDE01208",
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
			animation = "rest",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "呼……真是帮大忙了……",
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
			say = "谢谢指挥官，也帮我转达对露西的感谢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shy",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "然后……虽然称不上是什么回礼……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "但请指挥官和露西一起享用这几杯柑橘咖啡吧！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
