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
			subName = "森の管理人",
			say = "指揮官さん、本当にありがとうございます……",
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
			subName = "森の管理人",
			characterId = 100700,
			say = "これからも伐採場をしっかりと管理しますね〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "森の管理人",
			characterId = 100700,
			say = "これでもう皆さんが木材に困ることはなくなるはずです",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
