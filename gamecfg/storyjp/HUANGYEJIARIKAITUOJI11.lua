return {
	fadeOut = 1.5,
	mode = 2,
	id = "HUANGYEJIARIKAITUOJI11",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = "login",
			dir = 1,
			bgm = "story-richang-westdaily",
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指揮官、こっちです～！",
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
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "声の方角に振り向くと、そこにはプールのエアベッドに横たわって、こちらに手を振っているパンルヴェの姿が見えた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指揮官に会えるよう祈っていましたら、本当に指揮官が現れてくださるなんて……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ふふふ、やっぱり幸ある日の願いは叶うのですね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "今日はパンルヴェの幸運の日か？",
					flag = 1
				},
				{
					content = "自分の幸運の日でもあるからね",
					flag = 2
				}
			}
		},
		{
			hidePaintObj = true,
			side = 2,
			bgName = "star_level_bg_133",
			dir = 1,
			optionFlag = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "はい、そうなんです。そして占いによれば今日はデートにも適していると……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			optionFlag = 1,
			hideRecordIco = true,
			actor = 807022,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "――デート？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = "headtouch",
			dir = 1,
			optionFlag = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "な、なんでもありませんっ……すみませんお見苦しい所を…///",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			optionFlag = 2,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "え…？パンルヴェに会うのが…幸運だとおっしゃいましたか…？///",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			optionFlag = 2,
			hideRecordIco = true,
			actor = 807022,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "――そうだな。だって予定が変わって珍しくこの時間に休めたし",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			optionFlag = 2,
			hideRecordIco = true,
			actor = 807022,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "――パンルヴェに会えたのももちろん、幸運なことに入るよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			optionFlag = 2,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そうだったんですね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そう言えば指揮官は最近、映画撮影の件で忙しいですよね…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = "main1",
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "せっかくの休憩ですし、よければパンルヴェと…プールでリラックスしませんか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "誘われてプールに足を入れると、ひんやりとした水がすぐ暑さを消し飛ばしてくれた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そのままエアベッドに体を乗せて、パンルヴェのそばまで行った。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "あ、あの…恐れ入りますが指揮官、パフェを持っていただけませんか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = "touch2",
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "さっきから指揮官をずっと見つめてたら…パフェをこぼしてしまいました…あぅ…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "片手にパフェを持っていながら、片手で胸元に落ちたクリームを拭こうとするパンルヴェ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			hideRecordIco = true,
			actor = 807022,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "――任せて。パンルヴェは先に拭いてて",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ありがとうございます。あ、指揮官もクリームをこぼさないよう気をつけてください",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "パフェのグラスをこちらに渡すと、パンルヴェは再び自身の胸に集中した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……ちょっと恥ずかしいです……あ、別に指揮官によそ見してほしい、という意味ではなくて…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "あぅ、少しベタついてしまいましたね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "拭きやすくしようとパンルヴェはプールから水をすくい、そのままクリームのついた場所を濡らした。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "滴る水で水着が濡れ、そして白い生地の部分も少女の肌に密着し、半分透けているように見えた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ふぅ……これで大丈夫ですね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "姿勢を正したパンルヴェにパフェを返す。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "このパフェは今日の幸あるアイテムなんですよ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "パフェを受け取ったパンルヴェは恥ずかしそうに微笑み、頬を赤らめた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ええと……この幸運を指揮官にも分けたく思いますが…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			hideRecordIco = true,
			actor = 807022,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "――分けてくれるの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = "main2",
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "はい。つまり……あーんして食べさせたい、という意味で…///",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ちょっとだけ融けましたけど…味はきっと気に入ってくれると思います",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "口に入れてもらうと、いちごとクリームの甘さが舌を撫でた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ど、どうですか？味は……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "評価する",
					flag = 1
				},
				{
					content = "もう一口",
					flag = 2
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			optionFlag = 1,
			hideRecordIco = true,
			actor = 807022,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "――確かに美味しいな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			optionFlag = 1,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それはよかったです…！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			optionFlag = 2,
			hideRecordIco = true,
			actor = 807022,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "――もう一口味あわせてほしいな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			dir = 1,
			optionFlag = 2,
			actor = 807022,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "し、指揮官……///",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807022,
			side = 2,
			bgName = "star_level_bg_133",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "こうして、「幸あるいちごパフェ」を二人で食べながらゆっくりと午後を過ごした――",
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
		}
	}
}
