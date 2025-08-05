return {
	id = "YOUMIYAGUANQIAPIAN1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			mode = 1,
			blackBg = true,
			effects = {
				{
					active = true,
					name = "lianjinshushiyutianjijiaohuizhita"
				}
			},
			sequence = {
				{
					"",
					1
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			say = "とある日、とある洞窟の奥深くにて、アラディス調査団の一行は重要な任務を遂行していた——",
			bgm = "yumia-70",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			},
			effects = {
				{
					active = true,
					name = "miwu_01",
					center = true
				},
				{
					active = false,
					name = "lianjinshushiyutianjijiaohuizhita"
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900516,
			say = "洞窟を抜ければ調査対象のエリアに到着です。皆さん頑張りましょう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900517,
			say = "ずいぶん前にも同じことを言ってたけどね……ニーナさん、前にこの洞窟を探索した時ってこんなにかかったっけ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900517,
			say = "ひょっとしてあたしたち、道に迷ったんじゃ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900518,
			say = "この洞窟は最初から最後まで一本道よ。むしろ迷子になるほうが難しいわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900518,
			say = "でもまあ、前回はこんな風に濃い霧が立ち込めていたりはしなかったわね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900517,
			say = "ユミアに案内してもらわなきゃ通れないほどの高濃度マナ領域でもなかったよね？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900518,
			say = "そうね。前回の状況から鑑みるに、今洞窟内で起きている事象はどこか変だわ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900516,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "うーん……一度調査を中断して状況を整理したほうがいいかな…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900519,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "……ユミアさん、ニーナさん……もしかすると、もうすぐ外に出られるかもしれません……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900519,
			say = "レイニャ、嗅ぎ付けました……湿った風が吹き抜ける香りを…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900516,
			say = "湿った風……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900516,
			say = "私たちの目的地は荒野だったはずなんだけど…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900516,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "まあ、ならとにかく先に外へ出てから考えよう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_500",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900516,
			say = "さあみんな、あともうひと踏ん張りです！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
