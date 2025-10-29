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
			subName = "カフェ店員",
			say = "ふぅ……本当に助かったよ…",
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
			subName = "カフェ店員",
			characterId = 101200,
			say = "ありがとう、指揮官。ルシタニアにもありがとうって伝えておいてくれる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shy",
			characterId = 101200,
			subName = "カフェ店員",
			say = "それと…ちゃんとしたお返しではないけど…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "このシトラスコーヒーを二人にあげる！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
