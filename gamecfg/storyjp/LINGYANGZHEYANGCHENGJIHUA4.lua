return {
	defaultTb = 2001,
	mode = 2,
	fadeOut = 1.5,
	id = "LINGYANGZHEYANGCHENGJIHUA4",
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_project_oceana_room1",
			hidePaintObj = true,
			say = "ナビィは家の中を一通り「巡回」し終えると、満足そうにソファに腰を下ろした。",
			bgm = "qe-ova-2",
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
			expression = 7,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actorName = "ナビィ",
			tbActor = true,
			actor = 2001,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "へえ～、ポンコツ指揮官の割に意外と整理整頓できてるじゃない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_project_oceana_room1",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――んー。これからずっとその呼び方なの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actorName = "ナビィ",
			tbActor = true,
			actor = 2001,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "別にぃ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actorName = "ナビィ",
			tbActor = true,
			actor = 2001,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「保護者」とか「おい」って呼んでも、個性がなさすぎて面白くないでしょ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actorName = "ナビィ",
			tbActor = true,
			actor = 2001,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "だから「ポンコツ指揮官」が一番わかりやすいの！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 2001,
			nameColor = "#A9F548FF",
			bgName = "bg_project_oceana_room1",
			hidePaintObj = true,
			actorName = "ナビィ",
			side = 2,
			say = "どうしても他の呼び方がいいって言うなら、考えてやってもいいけど？",
			tbActor = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actorName = "ナビィ",
			tbActor = true,
			actor = 2001,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "さあ、呼んでほしい呼び方を教えなさいな♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
