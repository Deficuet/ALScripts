return {
	id = "JINNIANDECUXIAOXINGSHISHI1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "母港・執務室",
			bgm = "story-richang-12",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――そういえば、今日ってもしかして……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 312010,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "そうにゃ！毎年恒例の日がやってきたにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 312010,
			say = "指揮官、プロモーションビデオを見て欲しいにゃ～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			blackBg = true,
			mode = 1,
			asideType = 1,
			bgm = "story-richang-10",
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
			sequence = {
				{
					"【キャッチコピー1つめ。文字数25文字以内でお願いします】",
					1.5
				},
				{
					"【キャッチコピー2つめ。文字数25文字以内でお願いします】",
					3
				}
			}
		},
		{
			mode = 1,
			blackBg = true,
			asideType = 1,
			sequence = {
				{
					"【カメラ切り替えて雰囲気づくり】",
					1.5
				},
				{
					"【素材未着。仮で】",
					3
				}
			}
		},
		{
			mode = 1,
			blackBg = true,
			asideType = 1,
			sequence = {
				{
					"【キャンペーンまとめはここ】",
					1
				},
				{
					"【キャンペーン名はここ】",
					2
				},
				{
					"【開催時間はここ】",
					3
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "…………？",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 312010,
			say = "……にゃ？ファイルを間違えたにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			say = "【都市の映像に切り替えて】【ノリノリの音楽を流して】",
			bgm = "story-richang-11",
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
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			say = "【画面を切り替えてタレント登場させる】",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 799010,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "チカロフ",
			say = "うぅ……頭がクラクラしてて…ちょっと飲みすぎたようね……",
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
			portrait = 799010,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "チカロフ",
			say = "アフレコ進行でよかったわ…テンポとリップシンクさえどうにかすれば……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 799023,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actorName = "アドミラル・ナヒーモフ ",
			say = "なるべくカメラを見ないように。自然体でセリフを喋るように",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 799023,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actorName = "アドミラル・ナヒーモフ ",
			say = "チカロフ先生、今日買ったものは本っ当にお得ねー",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 799023,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actorName = "アドミラル・ナヒーモフ ",
			say = "こんなにお得なアイテムを、一体どこで買えるのかなー？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 799010,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "チカロフ",
			say = "どれも明石のセールキャンペーンの対象商品よ。他はともかく、酒類はホントに安いの……見てみる価値があるわー",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			say = "【高級車が登場してカメラズームイン】",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 105174,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "ニュージャージー",
			say = "わぉ！ハニー見て！今あたし公道を走ってるよ♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 105174,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "ニュージャージー",
			say = "撮影で街中が交通規制になってるのに、あたしだけドライブを楽しめてるみたいだけど！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 904021,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "斯特拉斯堡",
			say = "こほん。ニュージャージー……セリフを",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 105174,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "ニュージャージー",
			say = "そうだった……ハニー！今年も明石がすごいお得なキャンペーンをやってくれるそうよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 105174,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "ニュージャージー",
			say = "あとで一緒に見に行こう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 904021,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "斯特拉斯堡",
			say = "……台本と違うわね。あなた、まさか本気で明石のキャンペーンがお得だとか思ってないでしょうね…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 105174,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "ニュージャージー",
			say = "え？違うの？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 105174,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "ニュージャージー",
			say = "毎日ノベルティを配ってるのに！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 904021,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "斯特拉斯堡",
			say = "それだけね……いいしきたりを残してくれたわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 312010,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "明石",
			say = "もちろんにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 312010,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "明石",
			say = "今年も余計なものはなく、徹底的にサービスするにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 312010,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "明石",
			say = "きせかえの再販や、キャンペーン期間限定のお得パックもぜーんぶ用意したにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 312010,
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "明石",
			say = "では、キャンペーン開始日にまた会おうにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_blackfriday_cg2",
			hidePaintObj = true,
			say = "【カメラは明るい空に切り替えて〆】",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "…………",
			bgm = "story-richang-9",
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
			actor = 312010,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "………………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "個性的なプロモーションビデオだなぁ…",
					flag = 1
				},
				{
					content = "新しいプロモーションビデオだなぁ…",
					flag = 2
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 312010,
			say = "今ファイルを変えてくるにゃ――！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 312010,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "今年もチラシを読んでほしいにゃ！絶好のチャンスを見逃さないでにゃ♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "チラシの束を置いて、明石は執務室からあっという間に消え去った。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――今年も執務室をチラシ置き場にしていったな…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――まあいい、せっかくのセールキャンペーンだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――仕事が終わったら見に行こう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
