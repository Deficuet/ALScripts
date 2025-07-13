return {
	id = "JIARIXINTIAODAYOULUN26",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "クルーズ船内のアクアリウムにやってきた。",
			bgm = "story-niceship-soft",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（そういえばちょっと不思議だな。どうして海の上を進む船に海の中を模したアクアリウムがあるんだ…？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 108080,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "し、指揮官も魚たちを見に来たの？",
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
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "ふふふ、おはよう指揮官さん♪",
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
			actor = 101401,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "ん？よかったら指揮官もエールウィンたちと一緒に見ませんか？",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "適当に散策して帰るつもりが、予想外の組み合わせと会った。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "一緒に回りたいとの誘いがあり、アクアリウムの通路をゆっくりと進んでいく。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107300,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "指揮官さん、クルーズ船なのにどうしてアクアリウムがあるのか気になりませんか？",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "あ。「フラッシャーちゃんが提案して、そして承認された」ってことじゃないですよ？",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――ん？それ以外にも何か理由があるの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101401,
			say = "みんな普段あまり海の中を見ないからじゃないですか？水上艦は意外と海の中の風景を見る機会がないですし",
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
			expression = 6,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 108080,
			say = "あぅ……さ、魚ちゃんたちがかわいいって皆も思ってたり…？",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "ブブー。ふせいかーい",
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "アクアリウムは定番のデートスポットですからね～。雰囲気はおだやかで、照明もロマンチック…",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "せっかくのバカンスですから、デートスポットを一つ追加しても納得できますよね～",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 108080,
			say = "そういうことがあったんだ……道理でわたしの提案がすぐ通ったと……",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101401,
			say = "それだけじゃないでしょ？ふふふ、サン・ジャシントさん、もしかして冗談でした？",
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "あら、そんなに早くバラさないで～♪",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "談笑している少女たちの声を聞きながら、巨大な水槽を見上げた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "珊瑚の造庭を魚たちと、クジラやサメなどが混じって泳いでいる。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（確かに美しいけど、クルーズ船が母港に戻ったらこの魚たちはどうするつもりだろう…？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（近くの海域に放生するわけにもいかないし…母港のアクアリウムに移すんだろうか）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――ふむ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "指揮官さん、眉をひそめちゃっています？戻った後、ここの魚たちをどうするか悩んでたりします？",
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
			actor = 107300,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "そのことでしたら、フラッシャーちゃんにいいアイデアがありますよ♪",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 108080,
			say = "は、はい！責任を持って面倒をみるよ……怪我しないように！",
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
			actor = 101401,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "エールウィンも手伝わせてくださいね",
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
			expression = 6,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 108080,
			say = "よかったぁ…くすん……ごめんなさいっ、涙が……フラッシャー、本当に、本当に嬉しい……！",
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
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			},
			options = {
				{
					content = "フラッシャーの涙を拭いてあげる",
					flag = 1
				},
				{
					content = "フラッシャーをほめる",
					flag = 2
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_173",
			dir = 1,
			optionFlag = 1,
			actor = 108080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……っ！くすん……指揮官……フラッシャー、幸せ……！",
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
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_173",
			dir = 1,
			optionFlag = 2,
			actor = 108080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "えへへへ……指揮官、ありがとう……くすん…",
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
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "指揮官さん、相変わらず優しいですね",
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "「アクアリウムがデートスポットだから設置された」というのは冗談でしたけど、でも……",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "サン・ジャシントがこちらの手を取り、そして……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "リードされるかのように手を引っ張られた",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107300,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "せっかくいい雰囲気ですもの、付き合ってくださいね。指揮官さん♪",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "サン・ジャシントたちとのんびりとアクアリウムを散策した。",
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
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "外に出ると、もう日が暮れているようだ。とは言えまだ寝る時間じゃないし、もう少し回ろう――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
