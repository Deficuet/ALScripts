return {
	id = "ISLANDSIDE01307",
	mode = 10,
	map = {
		{
			101400,
			10050003
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
			animation = "clap",
			characterId = 101400,
			subName = "農園管理人",
			say = "これで種まきは終わりっと…肥料のことは私がやるね",
			face2Face = {
				{
					0,
					101400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "あとは、ラベンダーが成長するのを待つだけ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
