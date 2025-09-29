return {
	id = "ISLANDDAILYTASK1",
	mode = 10,
	map = {
		{
			100700,
			10040002
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
			animation = "nod",
			characterId = 100700,
			subName = "林场管理员",
			say = "多谢指挥官了……",
			face2Face = {
				{
					0,
					100700
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "林场管理员",
			characterId = 100700,
			say = "之后我会认真管理好这片林场的~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "林场管理员",
			characterId = 100700,
			say = "这样大家就不会为木材发愁了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
