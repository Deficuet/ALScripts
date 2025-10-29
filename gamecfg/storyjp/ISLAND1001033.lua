return {
	id = "ISLAND1001033",
	mode = 10,
	map = {
		{
			101000,
			10030008
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
			say = "――エリザベス",
			face2Face = {
				{
					0,
					101000
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "指揮官、ようこそ自由建設地へ。集会島の受付係、エリザベスです",
			characterId = 101000,
			animation = "hi",
			subName = "集会島受付",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島受付",
			characterId = 101000,
			say = "何かお飲みになりますか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "よかったら紅茶などいかがですか？旅の疲れを癒やしてくれますよ",
			characterId = 101000,
			animation = "talk",
			subName = "集会島受付",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "――ありがとう。まだ大丈夫だ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――それよりさっきこのバス停の図面を手に入れたから、ここに置いてみたい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "これは…メリーが渡したものでしょうか？この島に建てたいって何度も私にせがんできて…",
			characterId = 101000,
			animation = "think",
			subName = "集会島受付",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――だからあんな張り切ってたんだ…何か手伝おうか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島受付",
			characterId = 101000,
			say = "配置を決めて教えていただければ、それで大丈夫です",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
