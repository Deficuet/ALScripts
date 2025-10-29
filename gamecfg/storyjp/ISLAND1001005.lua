return {
	fadeOut = 1,
	mode = 10,
	id = "ISLAND1001005",
	map = {
		{
			100600,
			10040022
		},
		{
			100700,
			10040045
		}
	},
	look_weight = {
		{
			0,
			0
		},
		{
			0.3,
			0
		},
		{
			0.7,
			0
		}
	},
	scripts = {
		{
			characterId = 0,
			camera = "StoryCamera2",
			say = "――ジョン、これで十分かな？",
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
			say = "おお！さすが指揮官！すごいすごい！",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			speed = 3.5,
			style = 4,
			hide = false,
			characterId = 100700,
			delay = 0,
			wait_until_done = false,
			position = {
				71.59,
				3.98,
				70.66
			}
		},
		{
			characterId = 100600,
			subName = "鉱山管理人",
			say = "指揮官が掘ってくれた分を合わせたら揃ったよ！やっと希望が見えてきた…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "じゃあこれで修理できるのか？",
					flag = 1
				}
			}
		},
		{
			say = "あと少し！完全に直すには屋根の補強用木材も欲しいから",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "あ……も、木材ですか？そこは準備していませんでした……",
			characterId = 100700,
			subName = "森の管理人",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――ジョン、今からでも間に合う？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "うん！絶対に間に合うよ！",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "指揮官たちが木材の準備をしてくれてる間に、この石炭を使って路面の修復からやってみる！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "二手に分かれれば間に合うでしょ！オブライン、指揮官を森に連れて行ってくれる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "は、はい！",
			characterId = 100700,
			subName = "森の管理人",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100700,
			subName = "森の管理人",
			say = "指揮官……早く木材を集めに行きましょう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "わかった。すぐ行く",
					flag = 1
				},
				{
					content = "任せて！",
					flag = 2
				}
			}
		}
	}
}
