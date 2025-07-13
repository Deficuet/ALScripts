return {
	id = "ZHANFANGYUHUIGUANGZHICHENG30",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			asideType = 3,
			bgmDelay = 2,
			blackBg = true,
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
			},
			sequence = {
				{
					"？？？",
					1
				},
				{
					"キャメロット・庭園",
					2
				},
				{
					"しばらくして",
					3
				}
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			say = "キャメロットの庭園にある芝生の上に、「クイーンズライト号」…の3つの車両は静かに置かれている。",
			bgm = "theme-camelot",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "マルティリウムの具現を解除。戦闘痕跡、残留情報の完全削除を確認",
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
			actor = 900315,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "ふぅ。ようやくあなたを家に連れて帰れるわ",
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
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "その顔だとまだ聞きたいことがあるのね",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――「META」のロドニーのことだが…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "非常に不安定な状態にあるから、連れ戻して治療しなきゃならないわ",
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
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "でも保証する。すぐに会えるわよ",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――よかった",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "ほかに聞きたいことは？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "もうない",
					flag = 1
				},
				{
					content = "「再彫刻」について",
					flag = 2
				}
			}
		},
		{
			actor = 900315,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			optionFlag = 1,
			nameColor = "#FFC960",
			say = "………そう",
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
			side = 2,
			bgName = "bg_camelot_15",
			dir = 1,
			optionFlag = 1,
			actor = 900315,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "「再彫刻」…やっぱり気になるでしょ？",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			optionFlag = 1,
			say = "――教えてくれるのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_camelot_15",
			dir = 1,
			optionFlag = 1,
			actor = 900315,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "危険で不安定なMETA化の特殊段階とだけ知ってればいいわ",
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
			side = 2,
			bgName = "bg_camelot_15",
			dir = 1,
			optionFlag = 2,
			actor = 900315,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "「パーミャチ」の時に言った通り、「再彫刻」はあくまでMETA化の特殊段階よ。危険で不安定なの",
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
			actor = 900315,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			optionFlag = 2,
			nameColor = "#FFC960",
			say = "ただ、さっき指揮官がとっさに判断してくれてなければ、今のロドニーはいなかったわ",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			optionFlag = 2,
			say = "――じゃあ「メンフィス」や「ヴェスタル」たちは…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_camelot_15",
			dir = 1,
			optionFlag = 2,
			actor = 900315,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "ん？彼女たちがどうしたの？",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			optionFlag = 2,
			say = "――いや、なんでもない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_camelot_15",
			dir = 1,
			optionFlag = 2,
			actor = 900315,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "ええ。この話題はここまでで",
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
			actor = 900315,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "じゃあ私からも聞かせてもらってもいい？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "どんどん聞いてくれて構わない",
					flag = 1
				},
				{
					content = "全部知っているのでは？",
					flag = 2
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_camelot_15",
			dir = 1,
			optionFlag = 2,
			actor = 900315,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "ふふふ。私は私が知っていることしか知らないわ",
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
			actor = 900315,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "今回の作戦に参加した「META」はエリザベス以外に誰がいたの？",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――他にはいなかったよ。「エリザベス」はもともと部下を連れていきたいと言ってたが、結局一人で参加した",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "「一人」ねえ……",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――それがどうかしたのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "大丈夫。うん、そろそろ帰ろう",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
