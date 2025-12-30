return {
	fadeOut = 1.5,
	mode = 2,
	id = "ZHIMEIHAOSHIJIE3",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			sequence = {
				{
					"美しい世界へ\n\n<size=45>第二幕</size>",
					1
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_endingsong_3",
			hidePaintObj = true,
			say = "ロイヤルでの予定をすべて終えたあと、エリザベスから熱烈なバカンスの誘いがあったが、やんわりと断った。",
			bgm = "story-richang-light",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_endingsong_3",
			hidePaintObj = true,
			say = "そしてそのまま休む間もなく、次の目的地、「星の海」へと向かった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "基地に足を踏み入れた瞬間、空気がどこか違うように感じた。",
			bgm = "story-richang-relax",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			location = {
				"ユニオン・「星の海」",
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
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "すれ違う誰もが、どこか含みのある笑みを浮かべながら自分を見てくる。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "メンフィスが言っていたサプライズという言葉―― そして急な「星の海」への移動。ひとつの予感が閃いた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（……まさか！）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "抑えきれない高鳴りを感じながら、歩を速め、いくつもの作業区画を駆け抜けた。そして――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "「星の海」の主機",
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "認証が完了しました。指揮官、どうぞお入りください",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "ここはもともとレキシントンの医療カプセルが設置されている病室のはずだが、しかし今日は――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――医療カプセルがない……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "レキシントン……いるのか？",
					flag = 1
				}
			}
		},
		{
			side = 2,
			actorName = "？？？？",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			hidePainting = true,
			say = "指揮官、来てくれたのね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "――……！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "……？！本当に……レキシントンなのか？やっと目を覚ましたんだな！体はもう大丈夫なのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "？？？？",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			hidePainting = true,
			say = "もちろん！サラトガちゃんが日々頑張ってくれたおかげで、もう完全に回復したわよ♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "？？？？",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			hidePainting = true,
			say = "だからね、あとでサラトガちゃんに会ったら、ちゃんと褒めてあげて♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（……？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――レキシントン……どこにいるんだ？なぜ姿がない？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "？？？？",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			hidePainting = true,
			say = "ちょっとミステリーっぽくして、サプライズを演出したいからよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "？？？？",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			hidePainting = true,
			say = "ふふーん……探してみて？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "部屋を見回すと、医療機器も医療カプセルもすべて片付けられていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
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
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "代わりに柔らかなベッド、大きなクローゼット、ソファや装飾家具が並び、生活感あふれている。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "この中で、隠れられそうな場所といえば……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――待てよ……探してみてって……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "――…………サラトガ！！！",
			fontsize = 60,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			actor = 107039,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "えへへ〜さっすが指揮官、もうバレちゃった♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			actorPosition = {
				x = -2500,
				y = 0
			},
			action = {
				{
					type = "move",
					y = 0,
					delay = 0.6,
					dur = 0.5,
					x = 2500
				}
			}
		},
		{
			actor = 107039,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "わっ！ちょ、怒らないで！手を出すのもナシだよ！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107039,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "ちょっと場の空気を明るくしたかったんだもん。それにこのサプライズは指揮官だけじゃなくて、お姉ちゃんのためにも用意したんだ♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――……じゃあ、レキシントンは本当に……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107039,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "もちろん！こんな大事なことで嘘をつくわけないでしょ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107039,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "ふふっ……ほら、聞こえる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "耳を澄ますと、廊下の向こうからゆっくりと近づいてくる話し声が聞こえた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 102160,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "メンフィス",
			say = "今日の検査結果はすべて良好だったわね。本当によかった～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			portrait = 107020,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "レキシントン",
			say = "もちろんよ～。自分の体のことは自分が一番わかってるもの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 107020,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "レキシントン",
			say = "サラトガちゃんが心配性じゃなければ、昨日の時点で退院できてたと思う",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 102160,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "メンフィス",
			say = "あはは……サラトガだけじゃなくて、私たち全員心配だったのよ。 だから焦らず慎重に行こうってこと",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 107020,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "レキシントン",
			say = "でも、今日になって急に追加されたこの検査項目は……やっぱりちょっとヘンね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 107020,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "レキシントン",
			say = "もしかして私に内緒で…サラトガちゃんと何か企んでるんじゃないの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 102160,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "メンフィス",
			say = "あははは……えっと、それは……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 102160,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "メンフィス",
			say = "あっ！レキシントン、もう着いたわよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 102160,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "メンフィス",
			say = "ほら、ドアを開けて――！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "「星の海」の主機",
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "認証が完了しました。レキシントン、メンフィス、どうぞお入りください",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
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
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "アナウンスとともに、扉が静かに開いた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107020,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "――……！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "レキシントンは部屋の入り口に立っていた。自分と彼女の間を阻むものは何もなかった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "久しぶり、レキシントン",
					flag = 1
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107020,
			say = "ただいま。 {playername}――私の指揮官",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "これは確かにサプライズだった。あまりにも大きな出来事すぎて、完全に予想外だった。",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "そのおかげなのか、レキシントンがイタズラの件でサラトガを説教していた時、思わず口を挟んで止めてしまった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "サラトガの話によれば、レキシントンの回復は最近「星の海」で達成された幾つかの技術的ブレイクスルーによるものらしい。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "それに対しては、少しの疑念と、わずかな違和感を覚えたが――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "それでも今はただ、この瞬間を喜びたかった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "――レキシントンが帰ってきたのだから。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
