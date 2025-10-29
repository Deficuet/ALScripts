return {
	id = "ISLAND1001012",
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
			animation = "talk",
			say = "――……これで全部かな？確認は取れた？",
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
			say = "はい。質も量も問題なし。お疲れさま、指揮官",
			characterId = 100200,
			subName = "依頼管理人",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――それならよかった。ついでに聞くけど、明石がどこにいるか知ってる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "明石？あそこの饅頭カフェが見える？よくその辺で見かけるから、一度行ってみるといいかもよ",
			characterId = 100200,
			subName = "依頼管理人",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――饅頭カフェの近くか……じゃあ行ってくる！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "ふふ。それじゃあ指揮官、またね！",
			characterId = 100200,
			subName = "依頼管理人",
			animation = "bye",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
