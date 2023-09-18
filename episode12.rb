require 'dxruby'

WINDOW_X = 640
WINDOW_Y = 480

# 人物の画像設定
normal_img = Image.load("image/character/hohoemi.png") # 通常

# その他画像設定
back_img = Image.load("image/back/kyousitu01.jpg") #背景
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
    Window.draw(0, 0, back_img)

    # モノローグの部分はcase文で管理
    case flag2
    when 0
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "-体育館-", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 1
        end
    when 1
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "１年はあっという間で、私たちは終業式を迎えた。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
        end
    else
    if likeability >= 7  #好感度が7以上の時告白ルート
    flag2 = 2
     case flag2
     when 2
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "鏡子ちゃん、今いいかな", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 3
        end
    when 3
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "僕、鏡子ちゃんが好きだよ。付き合ってくれると嬉しいんだけど…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
        end
    else       

        if likeability <= 6  || likeability ==0 #好感度が0～6の時TRUE END
     case flag2
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "鏡子ちゃん、1年間ありがとう。\n来年また同じクラスになったら、よろしくね。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
        end
    else     

    if likeability < 0    #好感度が０以下、ドボン選択肢を選んだ場合BAD END
    flag2 = 4
    case flag2
            when 4
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "来年は受験生だ、頑張ろう。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 5
        end
    when 6
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "BAD END", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
        end
    else
        if Input.mouse_push?(M_LBUTTON) then
            flag = 1
        end

        # 選択肢による反応の変化と、好感度の加算
        case player_chose
        when 1 then
            Window.draw(125, 0, normal_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(44, 404, "HAPPY END", font, color:[165, 83, 126])
            Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
        when 2 then
            Window.draw(125, 0, normal_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(44, 404, "BAD END", font, color:[165, 83, 126])
            # 2は好感度が変化しない選択肢
            Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
        end

        # 選択肢を表示する
        if flag == 1 && flag_end == 0 then
            # 選択肢1
            Window.draw_scale(109, 224, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(239, 229, "嬉しい、私も中野くんが好きだよ", font, color:[165, 83, 126])
            # 選択肢2
            Window.draw_scale(109, 274, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(259, 279, "ごめんね、中野くんのことは友達以上に見れないな", font, color:[165, 83, 126])

            if timer >= 45
                # マウスの座標が特定の領域にある間、選択肢をホバー状態にする
                if (109 < x && x <541 && 224 < y && y < 260) then # 選択肢1
                    Window.draw_scale(109, 224, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(239, 229, "嬉しい、私も中野くんが好きだよ", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 1
                        flag = 0
                        flag_end = 1
                    end
                elsif (109 < x && x <541 && 274 < y && y < 310) then # 選択肢2
                    Window.draw_scale(109, 274, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(259, 279, "ごめんね、中野くんのことは友達以上に見れないな", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 2
                        flag = 0
                        flag_end = 1
                    end
                end
            end
        end
    end
end