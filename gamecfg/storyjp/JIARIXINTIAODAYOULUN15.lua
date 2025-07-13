return {
	id = "JIARIXINTIAODAYOULUN15",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			say = "情報員の飛雲とアルバコアの報告によると、クルーズ船の各所で今晩また異常事件が起こったそうだ。",
			bgm = "login_us_0401",
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
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			say = "アクアリウム、教室、弾薬庫など様々なエリアがその影響を受けたという。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			say = "この事態を受け、クルーズ船不思議事件特別調査隊は再び緊急会議を開いた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101490,
			say = "コホン。みんな、忙しい中来てくれてありがとう",
			painting = {
				alpha = 0.3,
				time = 1
			},
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
			actor = 101490,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "緊急会議が開かれた原因、みんなもすでにここに来る途中把握したかと！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 805030,
			say = "アルザス、驚きの感情を認む…異常事件がまた起きるなんて",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 501020,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "ふふん。こないだあまりにもあっさり解決したから、絶対裏に何かあるって思ってたよ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 45,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			actor = 501020,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "だって、七不思議なのに、三つ目で終わっちゃうなんてありえないよ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "それでは容疑者1号、メアリー・セレストに話してもらいましょう。この件について、何か供述がありますか？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107094,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "貴方には黙秘権があるが、その供述は一言一句記録され、法廷で証拠として用いられます！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 9600040,
			say = "今回の異常事件にはなにも関わっていない！誓ってもいい！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 9600040,
			say = "ほら、このクルーズ船はもうテンペスタに「拉致」されただろ？目的は果たしたし、これ以上姿を隠す必要ないじゃない",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 9600040,
			say = "それにいたずらはもうみんなにバレたし、そんな無粋なマネはなおさらしないさ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "ふむふむ…一理ありますね",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			side = 2,
			actor = 601080,
			say = "…ってことは、今回は本物の不思議事件？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			side = 2,
			actor = 601090,
			say = "あるいは…実は黒幕がもう一人いるとか…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――（薄々感づいてはいたが…やはりそうか）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――裏で糸を引いているもう一人の可能性について、先にいくつか確認させて欲しい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "最初に確認したいのは…",
					flag = 1
				}
			}
		},
		{
			expression = 7,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			side = 2,
			actor = 0,
			say = "メアリーは「抜け出せない廊下」という噂を知っているか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 9600040,
			say = "抜け出せない…廊下？初耳だが？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "これまでの調査で、客室エリアのとある廊下では、方向感覚を失わせる濃い「海霧」が発生することを突き止めた。これはメアリーが仕組んだのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 9600040,
			say = "ふむ……いや、別に私ではないぞ？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 9600040,
			say = "食べ物を探す時何度も廊下を通ったが、目くらましに海霧を出したことはない。そもそも必要ないしな",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――…やはり、か",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "次に確認したいのは……",
					flag = 1
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "エセックス、自分とテラスバーで一杯しゃれこむのと、探偵として引き続き事件を調査するのを選ぶことになったら、どっちを選ぶ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "考えるまでもありません！もちろん指揮官とテラスバーに行くことを選びます！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――うん…分かった",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――（…残りの一つはこの場では裏が取れない）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――（最初に見つかった、「彼方」と「敬具」の文字しか判別できない紙切れについてだ）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――（いや…もしかしたらもう見当はついたかも）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_131",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――（でも今はまだ証拠がない…もうしばらく様子を見てみよう）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
