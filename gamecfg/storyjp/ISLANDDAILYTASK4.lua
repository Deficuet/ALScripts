return {
	id = "ISLANDDAILYTASK4",
	mode = 10,
	map = {
		{
			100400,
			10010040
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
			animation = "talk",
			characterId = 100400,
			subName = "畑管理人",
			say = "指揮官、本当にお疲れさまでした……私も努力して農場をしっかり管理していきます",
			face2Face = {
				{
					0,
					100400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "できるだけ早く、島の皆さんに新鮮で種類豊富なお野菜を食べてもらえるようにします",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "これが指揮官のために私ができる唯一のことですから。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
