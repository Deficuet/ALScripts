return {
	id = "ISLANDDAILYTASK3",
	mode = 10,
	map = {
		{
			100300,
			10020004
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			animation = "clap",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "ふぅ――やっと来た！本当にありがとう！",
			face2Face = {
				{
					0,
					100300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "あぁ……また忙しくなっちゃうけど……指揮官の役に立てるならそれでいいの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "えへへ。安心して！いくら私でも、ずっとサボってるわけじゃないから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
