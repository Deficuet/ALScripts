return {
	id = "ISLANDSIDESTORY2002005_1",
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
			say = "我突然发现一个问题……",
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
			say = "咱们好像都没有画框，画画好了放哪？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100200,
			subName = "订单管理员",
			say = "欸？卷起来放手里就可以了呀。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "……不行，你专门为我画的画必须要好好保存。",
			characterId = 0,
			animation = "shakehead",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "你先画着，我去做个画框。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
