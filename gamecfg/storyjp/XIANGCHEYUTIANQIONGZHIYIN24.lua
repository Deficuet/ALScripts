return {
	id = "XIANGCHEYUTIANQIONGZHIYIN24",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			mode = 1,
			stopbgm = true,
			asideType = 1,
			blackBg = true,
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
					"T=T-N",
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "光が消えると、自分は「ギャラクシーコア」に戻っていた。",
			bgm = "theme-weimu",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			location = {
				"ユニオン・「星の海」",
				3
			},
			flashin = {
				black = true,
				dur = 1,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "時間は「ヘレナ」が自分たちを連れ去る直前のままだった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "先ほどの異常現象で多くの機器がオーバーロード状態に陥り、今の「星の海」基地は警報音に包まれている。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "指揮官……私は……あなたは？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "レキシントンが医療カプセルからゆっくりと体を起こし、茫然と周囲を見回した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――安心して。「星の海」にちょっとした不具合が起きただけだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――それより体調はどう？……違和感はないか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "ううん……特に違和感はないわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "でもこの装備……どうしてこの装備が実在しているのかしら……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "指揮官、私はとても長い夢を見てたような気がするわ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107160,
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "珊瑚海の後……あの幻想的な街……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "あれは……ただの夢じゃないでしょう？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "――……全て終わったことだ。今この瞬間、目に映っているものが「真実」だ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "おかえり、レキシントン",
					flag = 1
				}
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "指揮官……ただいま！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "「全て異常なし」とのメッセージを仲間たちに送り、「星の海」の騒動は次第に収まっていった。",
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
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "医療カプセルで起きた奇跡を前に、周囲は沈黙に包まれた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "やがて大きな歓声が上がった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "サラトガが真っ先に駆け寄り、メンフィスとヘレナも後に続いた……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "しかし、目にしたものは想像していた抱擁と涙ではなかった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "自分とレキシントンは、無理やり医療エリアへ向かうシャトルバスへと移された。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_starsea_core_3",
			hidePaintObj = true,
			say = "どうやら徹底的な検査を受けるまでは解放されそうにないらしい……",
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
			say = "興奮ぎみのメンフィスとは違い、反対側にいたヘレナは担架に乗せられた自分を静かに見つめて微笑んだ。",
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
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "もしかしたら彼女も、「ヘレナ」との最終決断の瞬間を目の当たりにしたのだろうか。",
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
			say = "彼女もまた、完璧な未来で起きた全ての出来事を覚えているのかもしれない……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			blackBg = true,
			mode = 1,
			asideType = 1,
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
					"「いずれにせよ、世界はようやく正常に戻った」",
					0
				},
				{
					"「全てが終わった――」",
					1
				},
				{
					"「――のだろうか？」",
					2
				}
			}
		}
	}
}
