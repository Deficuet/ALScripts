return {
	id = "ISLANDDAILYTASK6",
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
			characterId = 101200,
			subName = "カフェ店員",
			say = "指揮官……必要な食材を持ってきてくれたんだね",
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
			animation = "think",
			characterId = 101200,
			subName = "カフェ店員",
			say = "うん……すごくいいね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "これでお客さんたちに、もっと美味しいものを提供できる……指揮官、本当にありがとう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "心を込めて仕上げるからね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
