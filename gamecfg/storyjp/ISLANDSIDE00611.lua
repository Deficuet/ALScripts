return {
	id = "ISLANDSIDE00611",
	mode = 10,
	map = {
		{
			100500,
			10010003
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
			say = "――アメリゴ、必要な木材を持ってきた",
			face2Face = {
				{
					0,
					100500
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "指揮官、あたしも工具を用意したよ！",
			characterId = 100500,
			animation = "nod",
			subName = "牧場管理人",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――よし、じゃあさっそく始めようか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100500,
			subName = "牧場管理人",
			say = "は～い！それじゃあ、作業開始！",
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
			animation = "talk",
			characterId = 0,
			say = "――アメリゴ、こっちは出来上がったよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100500,
			subName = "牧場管理人",
			say = "うん、指揮官。こっちも終わったよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧場管理人",
			characterId = 100500,
			say = "ふふん、これだけしっかり補強すれば、メェメーたちがどんだけぶつかっても開かないでしょう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧場管理人",
			characterId = 100500,
			say = "えへへ、指揮官も一日お疲れさま〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100500,
			subName = "牧場管理人",
			say = "メェメーたちを全部見つけてくれて、柵の補強まで手伝ってくれてありがとう！これでもう逃げ出す心配がなくなったよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――でも油断は禁物だ。毎日ちゃんと点検した方がいい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧場管理人",
			characterId = 100500,
			say = "うんうん。もちろんだよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――アメリゴも疲れただろうし、ちゃんと休んでね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100500,
			subName = "牧場管理人",
			say = "うん、指揮官。またね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
