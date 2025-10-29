return {
	id = "ISLANDSIDE01201",
	mode = 10,
	map = {
		{
			101100,
			10050002
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
			say = "――どうしたの？そんな思い詰めたような顔をして…",
			face2Face = {
				{
					0,
					101100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 101100,
			subName = "果樹園管理人",
			say = "あ、指揮官、ちょっと手伝ってくれませんか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果樹園管理人",
			characterId = 101100,
			say = "実は、剪定バサミが壊れてしまって……今からホメリックのところに行けたりしませんか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101100,
			subName = "果樹園管理人",
			say = "まだまだやることがあるせいで、今は果樹園から離れられなくて……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――分かった、今行くよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101100,
			subName = "果樹園管理人",
			say = "ありがとうございます！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
