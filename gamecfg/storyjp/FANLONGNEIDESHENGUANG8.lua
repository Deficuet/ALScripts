return {
	id = "FANLONGNEIDESHENGUANG8",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			asideType = 3,
			blackBg = true,
			say = "？？？·？？？",
			sequence = {
				{
					"？？？·？？？",
					1
				},
				{
					"？？？？",
					2
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			say = "扉の向こうの「記録」から戻ってくると、遠方に見えていたシルエットが、少しだけはっきりとしたように感じられた。",
			bgm = "theme-underheaven",
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
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（「プロジェクト：H」⋯⋯それもメンタル・アーティファクト⋯人工知能の一体か）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_505",
			hidePaintObj = true,
			say = "心の中でそんなことを思い浮かべてると、道の先にまた新しい扉が姿を現した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = false,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_505",
			hidePaintObj = true,
			say = "扉に触れた瞬間、目の前の世界が一変した――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			oldPhoto = true,
			side = 2,
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "銀白色の海面を艦隊が高速で航行している。",
			bgm = "battle-thehierophantv",
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
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900465,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			side = 2,
			actorName = "ProjectM",
			oldPhoto = true,
			say = "「ハイエロファント」、あと3分ほどで救難信号の発信地点に到着する",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "今のところ、生存反応は確認できてないわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900465,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			side = 2,
			actorName = "ProjectM",
			oldPhoto = true,
			say = "⋯⋯ええ、わかってるわ。妨害があまりに激しいから、検知結果が当てにならないの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			oldPhoto = true,
			say = "―――――！",
			soundeffect = "event:/battle/boom2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashN = {
				color = {
					1,
					1,
					1,
					1
				},
				alpha = {
					{
						0,
						1,
						0.2,
						0
					},
					{
						1,
						0,
						0.2,
						0.2
					},
					{
						0,
						1,
						0.2,
						0.4
					},
					{
						1,
						0,
						0.2,
						0.6
					}
				}
			},
			dialogShake = {
				speed = 0.09,
				x = 8.5,
				number = 2
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "警告。救難信号海域にて偽相獣艦隊を確認。待ち伏せをしているらしい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "警告。全艦のシステムから偽相獣による妨害を検知。やはり罠ね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "実験型「ハイエロファント・ロッド」の使用状況を確認",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900465,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			side = 2,
			actorName = "ProjectM",
			oldPhoto = true,
			say = "ハイエロファント、妨害が弱まりつつあるわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――うん、同時に妨害発生源の消失も確認した",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "実験型「ハイエロファント・ロッド」の使用完了。データ収集完了。「ツングースカ隕石サンプル」に異常なし",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900465,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			side = 2,
			actorName = "ProjectM",
			oldPhoto = true,
			say = "実験型「ハイエロファント・ロッド」の使用状況を確認",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "瓦解特性：ホワイト。観測成功",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "攻撃効果を確認。空中および水面の偽相体X付着エリアが崩壊中",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "実験型「ハイエロファント・ロッド」の使用完了。データ収集完了。「ツングースカ隕石サンプル」に異常なし",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900465,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			side = 2,
			actorName = "ProjectM",
			oldPhoto = true,
			say = "ハイエロファント、次の行動地点の座標が届いた。コースを修正中よ――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
