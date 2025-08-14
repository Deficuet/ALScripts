return {
	fadeOut = 1.5,
	mode = 2,
	id = "QIYUANXIADEMIMI10",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			say = "奇渊第一平台·永寂冰湖",
			bgm = "theme-fushun-adventure",
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 206080,
			say = "说起来……为什么指挥官回到了学院，大胆前辈却选择留在奇渊呢？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 801050,
			say = "因为我们以为指挥官已经死了啊！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 0,
			bgName = "star_level_bg_544",
			actor = 206080,
			dir = 1,
			actorName = "忒修斯&伴尔维",
			hideOther = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "啊……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			subActors = {
				{
					expression = 2,
					actor = 807020,
					paintingNoise = false,
					hidePaintObj = false,
					dir = 1,
					pos = {
						x = 1125,
						y = 0
					}
				}
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "……啊？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "谁设计的剧本把我写死了？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 801050,
			say = "哦不对不对……这个是上一版剧本的内容……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 801050,
			say = "最新的剧情我想想……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 801050,
			say = "哦对……因为我们以为指挥官中了陷阱，被困在了奇渊里啊！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "……好，继续。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 801050,
			say = "当初我们正在探索一处古代遗迹，然后就看到金光一闪——指挥官就消失了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 801050,
			say = "大家都不相信指挥官会就这么……所以，就决定前往奇渊各层寻找指挥官。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 801050,
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "我留在了第一层，迪盖·特鲁因和迪凯纳结伴前往了第二层……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 801050,
			say = "对了，你们要不要去看看那处古代遗迹，说不定能找到重要线索呢！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "问问马塞纳的想法",
					flag = 1
				},
				{
					content = "看一眼攻略书",
					flag = 2
				}
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			actor = 0,
			say = "马塞纳，你想去么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_544",
			dir = 1,
			optionFlag = 1,
			actor = 804010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "唔……想去！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "story_tablet",
			side = 2,
			bgName = "star_level_bg_544",
			actorName = "魔法圣典",
			optionFlag = 2,
			hideRecordIco = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "【推荐任务】前往上古未知遗迹，获取未知奖励。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_544",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "好，我们去吧！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
