return {
	id = "ISLANDSIDE00304",
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
			characterId = 0,
			say = "――ジョン、部品はこれで合ってるか？",
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
			animation = "nod",
			characterId = 100600,
			subName = "鉱山管理人",
			say = "バッチリだよ！まさにこの型番！これで修理に必要な素材が全部揃った！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "今最後の仕上げをするね……すぐ終わるから！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			style = 2,
			sequence = {
				{
					"<size=45>しばらくして……</size>",
					2
				}
			}
		},
		{
			characterId = 0,
			say = "――組み立ては終わった？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100600,
			subName = "鉱山管理人",
			say = "はい！指揮官、これが電力システムのコア――主電源供給ユニットだ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "これに交換して全ての端子をつなぎ直せば……再起動できるはず！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――なるほど……基地に戻って試してみるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100600,
			subName = "鉱山管理人",
			say = "うん、指揮官またね！もし問題があったら、また呼んで！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
