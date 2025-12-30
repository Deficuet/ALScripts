return {
	id = "DATEALANEGUANQIA11",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			say = "折紙はしばらくZ2、Z13と共に擬似天宮市で行動を続けていた。",
			bgm = "theme-bismark-reborn",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			location = {
				"異常海域・第3戦闘区域・某所",
				3
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
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			say = "シェルターで態勢を整え、情報を交換し、そして艤装の使い方を学び、練習を続けるうちに敵拠点と思われる区域を発見した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			say = "さらに詳しい情報を集めようとした矢先、一隻の飛行艦が彼女たちの視界に現れた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401130,
			say = "まさか……飛行艦！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401130,
			say = "さすが「世界改変」なんて言葉がさらっと出てくるような世界だけあるね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11500020,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "「フラクシナス」……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11500020,
			say = "どうやら琴里はすでに、そちらの母港と協力関係にあるみたい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			say = "「フラクシナスAL」を中継したためか、長らく機能しなかったZ12とZ13の通信機がようやく復旧した。",
			bgm = "battle-eagleunion",
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
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11500030,
			say = "折紙はパトロール隊と行動を共にし、多くの情報を手に入れただけじゃなく、敵の重要拠点の所在まで突き止めてくれたわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――となれば、次にすべきことは明白だ。戦力を結集し、拠点を叩け！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
