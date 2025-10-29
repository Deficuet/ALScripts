return {
	id = "ISLANDSIDE00712",
	mode = 10,
	map = {
		{
			100800,
			10060002
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
			animation = "hi",
			say = "――アムマーマー",
			face2Face = {
				{
					0,
					100800
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100800,
			subName = "商店街管理人",
			say = "あら、指揮官？あなたも商店街に美味しいものを食べに来たんですか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "――いや、そうじゃなくて。ローズマリーがあるような場所を知らない？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "商店街管理人",
			characterId = 100800,
			say = "ローズマリー？指揮官、それを何に使うんですか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――ブレーメンからはちみつ水のレシピをもらってな。試してみたいんだが、それを作るのにローズマリーが必要なんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100800,
			subName = "商店街管理人",
			say = "ブレーメンさんのレシピですかぁ、それなら確かに試す価値はありますね。えっと……わかりました",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "商店街管理人",
			characterId = 100800,
			say = "有魚レストランにローズマリーがあるはずです……よく料理の風味付けに使われているので。指揮官、行ってみたらどうですか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――お！有魚レストランか！わかった。行ってみるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
