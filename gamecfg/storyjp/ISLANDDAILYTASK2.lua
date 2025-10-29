return {
	id = "ISLANDDAILYTASK2",
	mode = 10,
	map = {
		{
			100600,
			10040022
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
			characterId = 100600,
			subName = "鉱山管理人",
			say = "あっ！指揮官、ちょうどいいタイミング！",
			face2Face = {
				{
					0,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "うん……量も十分！さすがだね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "これなら鉱山の委託にちゃんと対応できるよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
