return {
	id = "ISLAND1001035",
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
			say = "――パトリック、呼んだ？",
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
			say = "うん。あのね、港の近くにもうほとんど完成してる商店街があるのって知ってる？",
			characterId = 100200,
			subName = "依頼管理人",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――商店街？明石の開発計画で見た覚えが……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――確か資金不足で建設が止まってたっていう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "そうなの。もうほぼ完成してるのに、このまま放置するのはもったいなくて",
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
			say = "――それは確かに。あそこってアムマーマーの担当だよね？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "そうそう。最近は広場でずっと建材を整理してるみたい。よかったら様子を見に行ってあげて",
			characterId = 100200,
			animation = "clap",
			subName = "依頼管理人",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――行ってくるよ。あれだけの施設を活かさないのはもったいないからね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
