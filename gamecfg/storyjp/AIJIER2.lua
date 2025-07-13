return {
	id = "AIJIER2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			sequence = {
				{
					"激動する荒海の主\n\n<size=45>二 やり直し</size>",
					1
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "エーギルに一度ソファに追いやられたが、流石にこのまま彼女だけを働かせっぱなしにするわけにはいかない。",
			bgm = "story-richang-7",
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
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "意地でも散らばったファイルをすべて机に戻してから休憩することにした。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "5分後――",
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
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（はあ…散らばったファイルを拾い集めて机に戻すだけで、5分もかかったか…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（この量をエーギル一人で整理するとなると…何とかしてこっちにも手伝わせてもらわないと）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 499050,
			say = "さて、ここからは私に任せなさい",
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
			actor = 499050,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "この山をやり直すのは…なかなかの挑戦ね。ふん、ならこのエーギルの力、とくと見せてやるわ！",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "エーギルにバレずにこっそりと手伝う方法を思案していると、突然ドアの方からノックの音が聞こえてきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（そうだ！そういえば昨日、ペーター・シュトラッサーが演習報告を届けに来ると言ってたな。）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（彼女なら力になってくれるはず…！）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "ソファに座っている姿勢を正し、ペーター・シュトラッサーに声をかけて入室を許可した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "ペーターが演習報告を渡してきた瞬間、目配りして横にいるエーギルの方のほうを指し示した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "一瞬戸惑ったペーターだが、ファイルの整理に集中しているエーギルを見てすぐに納得の表情を見せた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 407030,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "……はい、報告内容は以上になるわ。問題なければここにサインを",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 407030,
			say = "それから…エーギル、ファイルの仕分けをもっと効率的にやれる方法を知っているわ。試してみない？",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "さりげなくペーターは話題をエーギルのほうに変えてくれた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 499050,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "いいわ。ペーター、その方法を早く教えなさい！",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 499050,
			say = "…手伝いはさせないわよ",
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
			actor = 407030,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "もちろん、これは卿の仕事よ。時間が惜しいから早速始めましょうか",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			say = "ペーター・シュトラッサーがレクチャーしたおかげで、1時間の「奮闘」の末、エーギルの整理作業はいよいよ終わりが見えてきた。",
			bgm = "story-richang-6",
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
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			say = "エーギルが佳境に入ったのを確認するやいなや、ペーター・シュトラッサーから相談があると言われ、二人で執務室の外に出た。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 407030,
			say = "ふふふ。さっきからなにか言いたそうにしてたわね",
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
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 407030,
			say = "卿を誘い出したのはそれを確かめるためよ。…聞きたいことがあれば早く言って？報告の時間はあまり残ってないわよ",
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
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――さすがペーター、察しがいいな。実は、エーギルのことだが……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 407030,
			say = "ああ、なるほど。エーギルと仲良くなりたいって？でも私から見るに、卿はすでにエーギルとかなり仲良くやっているじゃない",
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
			expression = 4,
			side = 2,
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 407030,
			say = "……それでもまだ物足りないなら、凝った小物でもプレゼントしてみたら？",
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
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――凝った小物……アクセサリーとか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 407030,
			say = "そうよ。卿なら彼女に合うプレゼントを直感で当てられると思うわ",
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
			actor = 407030,
			side = 2,
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "…それにしてもプレゼントのことを聞くとはね…ふふふ♪",
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
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――ん？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 407030,
			say = "なんでもないわ。それじゃあ、幸運を祈るわ",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			say = "そう言い残して、ペーターはこの場から立ち去った。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_513",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（よし…こっちもエーギルの手伝いに戻ろう）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
