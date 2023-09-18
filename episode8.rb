require 'dxruby'

WINDOW_X = 640
WINDOW_Y = 480

# 人物の画像設定
normal_img = Image.load("image/character/hohoemi.png") # 通常
smile_img = Image.load("image/character/smile.png") # 通常
ira_img = Image.load("image/character/iraira.png") # 通常
mu_img = Image.load("image/character/muhyojo.png") # 通常

# その他画像設定
back_img = Image.load("image/back/bunkasai.jpg") #背景
back2_img = Image.load("image/back/taikukan.jpg") #背景
window_img = Image.load("image/textbox/window_01.png") #メッセージボックス
button_img = Image.load("image/textbox/button_01.png") # 選択肢
button_hover_img = Image.load("image/textbox/button_01_hover.png") # 選択肢（選択状態）

# フォント設定
font = Font.new(24, fontname="ドットゴシック16") # 本文（サイズは24pt）
font_name = Font.new(22, fontname="ドットゴシック16") # 人物の名前（サイズ）

# 各種初期化
likability = 0 # 好感度
flag = 0 #　フラグ
flag2 = 0
flag_end = 0 # 終了フラグ
player_chose = 0 # どの選択肢を選んだか
timer = 0
click_count = 0

Window.loop do
    # マウスの座標取得
    x = Input.mouse_pos_x  # マウスカーソルのx座標
    y = Input.mouse_pos_y  # マウスカーソルのy座標

    # タイマーのカウントアップ
    timer += 1 if flag == 1

    # 背景の表示
    Window.draw_scale(0, 0, back_img, 0.45, 0.45, 0, 0)

    # モノローグの部分はcase文で管理
    case flag2
    when 0
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "-廊下-", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 1
        end
    when 1
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "今日は文化祭。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 2
        end
    when 2
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "学校中が賑わって、\nあっちもこっちも楽しい日！", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 3
        end
    when 3
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "あっあの、中野くん……", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =4
        end
    when 4
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "鏡子ちゃん、どうしたの？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =5
        end
    when 5
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "あのね、一緒に文化祭回りたいんだけど、どうかな", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 6
        end
    when 6
        Window.draw(125, 0, smile_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "良いじゃん、楽しそうだね。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 7
        end
    when 7
        Window.draw(125, 0, smile_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "やったぁ。じゃあ…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 8
        end
    else
        # メッセージウィンドウの表示
        #Window.draw(125, 0, normal_img)
        #Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        #Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        #Window.draw_font(44, 404, "僕は中野黄治。君は？", font, color:[165, 83, 126])

        # 「Input.mouse_down?~」だけではマウスが押されている間しか選択肢が表示されないので
        # 一旦フラグを挟み、「マウスが押されたらフラグを1にする→フラグが1の間は選択肢を表示する」
        # とすることで、意図したとおりに表示することができます。
        if Input.mouse_push?(M_LBUTTON) then
            flag = 1
        end

        # 選択肢による反応の変化と、好感度の加算
        case player_chose
        when 1 then
	        case flag2
            when 8
                Window.draw_scale(0, 0, back2_img, 0.2, 0.2, 0, 0)
                Window.draw(125, 0, mu_img)
                Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
                Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
                Window.draw_font(44, 404, "3番の人、かっこいいなぁ", font, color:[165, 83, 126])
                Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
	            if Input.mouse_push?(M_LBUTTON)
                    flag2 =9
	            end
            when 9
                Window.draw_scale(0, 0, back2_img, 0.2, 0.2, 0, 0)
                Window.draw(125, 0, mu_img)
                Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
                Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
                Window.draw_font(44, 404, "こんなやつが好きなんだ。へぇ…", font, color:[165, 83, 126])
                Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
            end
	    when 2 then
	        case flag2
            when 8
                Window.draw(125, 0, ira_img)
                Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
                Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
                Window.draw_font(44, 404, "ぎゃああああああ！", font, color:[165, 83, 126])
                Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
	            if Input.mouse_push?(M_LBUTTON)
                    flag2 = 9
                end
            when 9
                Window.draw(125, 0, ira_img)
                Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
                Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
                Window.draw_font(44, 404, "さすがに叫びすぎだよ…うるさいってば", font, color:[165, 83, 126])
                Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
            end
        when 3 then
	        case flag2
	        when 8
                Window.draw(125, 0, normal_img)
                Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
                Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
                Window.draw_font(44, 404, "あれとこれと、あとそれ美味しかったね！", font, color:[165, 83, 126])
                Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
	            if Input.mouse_push?(M_LBUTTON)
                    flag2 = 9
                end
            when 9
                Window.draw(125, 0, smile_img)
                Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
                Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
                Window.draw_font(44, 404, "そうだね。\n僕たち、食べ物の好み同じみたい。", font, color:[165, 83, 126])
                Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
            end
        end

        # 選択肢を表示する
        if flag == 1 && flag_end == 0 then
            # 選択肢1
            Window.draw_scale(109, 224, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(228, 229, "ミスターコンテスト見に行こう", font, color:[165, 83, 126])
            # 選択肢2
            Window.draw_scale(109, 274, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(259, 279, "お化け屋敷行こう", font, color:[165, 83, 126])
            # 選択肢3
            Window.draw_scale(109, 324, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(220, 329, "食べ物のお店、全制覇しよう", font, color:[165, 83, 126])

            if timer >= 40
                # マウスの座標が特定の領域にある間、選択肢をホバー状態にする
                if (109 < x && x <541 && 224 < y && y < 260) then # 選択肢1
                    Window.draw_scale(109, 224, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(228, 229, "ミスターコンテスト見に行こう", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 1
                        flag = 0
                        flag_end = 1
                        likability -= 1
                    end
                elsif (109 < x && x <541 && 274 < y && y < 310) then # 選択肢2
                    Window.draw_scale(109, 274, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(259, 279, "お化け屋敷行こう", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 2
                        flag = 0
                        flag_end = 1
                        likability -= 1
                    end
                elsif (109 < x && x <541 && 324 < y && y < 360) then # 選択肢3
                    Window.draw_scale(109, 324, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(220, 329, "食べ物のお店、全制覇しよう", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 3
                        flag = 0
                        flag_end = 1
                        likability += 1
                    end
                end
            end
        end
    end
end