return {
	id = "ISLANDSIDE01008",
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
			characterId = 0,
			say = "（新鮮なニンジンなら、農場にたくさんあるはずだ）",
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
			say = "指揮官？今畑から戻ってきたところです。何か食材が必要ですか？",
			characterId = 100400,
			subName = "畑管理人",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――新鮮なニンジンが欲しいんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "ニンジンですか？ちょうど今日収穫したばかりですよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100400,
			subName = "畑管理人",
			say = "こちらです。どうぞ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "必要な分を遠慮なくお持ちください〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
