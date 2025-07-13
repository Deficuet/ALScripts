return {
	fadeOut = 1.5,
	mode = 2,
	id = "JUFENGYUCHENMIANZHIHAI14-2",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_jufengv2_2",
			hidePaintObj = true,
			say = "テンペスタの仲間たちが戦闘を始めると、海霧の向こうにある輝きが目に見える速さで減っていく。",
			bgm = "story-temepest-2",
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
			expression = 4,
			side = 2,
			bgName = "bg_jufengv2_2",
			factiontag = "深淵に蠢く者",
			dir = 1,
			actor = 9600080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "あなたの仲間たち、なかなかやるわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_jufengv2_2",
			factiontag = "深淵に蠢く者",
			dir = 1,
			actor = 9600080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "私も……我慢できなくなった",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "戦うのか？",
					flag = 1
				},
				{
					content = "ご飯の時間か？",
					flag = 2
				}
			}
		},
		{
			side = 2,
			bgName = "bg_jufengv2_2",
			factiontag = "深淵に蠢く者",
			dir = 1,
			optionFlag = 1,
			actor = 9600080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うん。少し体を動かす",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_jufengv2_2",
			factiontag = "深淵に蠢く者",
			dir = 1,
			optionFlag = 2,
			actor = 9600080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うん。少しだけ摂食する…少しだけ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			hidePainting = true,
			side = 2,
			bgName = "bg_jufengv2_cg6",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "目の前で紫の炎が燃え盛り、まるで波のように広がった。",
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
			bgName = "bg_jufengv2_cg6",
			hidePaintObj = true,
			hidePainting = true,
			say = "黒い拘束具が灰となり、ファンシーのヒトならざる目を顕にした。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_jufengv2_cg6",
			hidePaintObj = true,
			hidePainting = true,
			say = "口を開き、炎を纏った触手が霧の海を突っ込んでいき――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "静寂の魂",
			bgName = "bg_jufengv2_cg6",
			hidePaintObj = true,
			nameColor = "#FF9B93",
			hidePainting = true,
			say = "――――――！！！",
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
			bgName = "bg_jufengv2_cg6",
			hidePaintObj = true,
			hidePainting = true,
			say = "「静寂」と名付けられた魂たちの絶叫は木霊する。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "bg_jufengv2_cg6",
			side = 2,
			hidePainting = true,
			factiontag = "深淵に蠢く者",
			dir = 1,
			actor = 9600080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "これが「本当のファンシー」。幻想より生まれし深淵に蠢く者",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "bg_jufengv2_cg6",
			side = 2,
			hidePainting = true,
			factiontag = "深淵に蠢く者",
			dir = 1,
			actor = 9600080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "はじめまして、指揮官rrrrrrrrrr――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_jufengv2_cg6",
			hidePaintObj = true,
			hidePainting = true,
			say = "慄く水音。爆ぜる轟音。口器の咀嚼から紡ぎ出される交響。さまよえる魂を跡形もなく平らげていく。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
