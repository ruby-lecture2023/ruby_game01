require 'dxruby'

WINDOW_X = 640
WINDOW_Y = 480

# 人物の画像設定
normal1_img = Image.load("image/character/hohoemi.png") # 通常
normal2_img = Image.load("image/character/bikkuri.png") # 通常（開口）
smile2_img = Image.load("image/character/smile.png") # 超笑顔
angry1_img = Image.load("image/character/ikari.png") #怒った顔
confounded2_img = Image.load("image/character/kanashii.png") # 困り顔

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
flag_end = 0 # 終了フラグ
player_chose = 0 # どの選択肢を選んだか
timer = 0

Window.loop do
    # マウスの座標取得
    x = Input.mouse_pos_x  # マウスカーソルのx座標
    y = Input.mouse_pos_y  # マウスカーソルのy座標

    # タイマーのカウントアップ
    timer += 1 if flag == 1

    # 背景と人物の表示
    Window.draw(0, 0, back_img)
    Window.draw(125, 0, normal2_img)

    # メッセージウィンドウの表示
    Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
    Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
    Window.draw_font(44, 404, "君が隣の席？よろしくね！", font, color:[165, 83, 126])

    # 「Input.mouse_down?~」だけではマウスが押されている間しか選択肢が表示されないので
    # 一旦フラグを挟み、「マウスが押されたらフラグを1にする→フラグが1の間は選択肢を表示する」
    # とすることで、意図したとおりに表示することができます。
    if Input.mouse_push?(M_LBUTTON) then
        flag = 1
    end

    # 選択肢による反応の変化と、好感度の加算
    case player_chose
    when 1 then
        Window.draw(125, 0, smile2_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "おう！仲よくしような", font, color:[165, 83, 126])
        Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
    when 2 then
        Window.draw(125, 0, confounded2_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "えっ、困らせちゃった！？ごめんね", font, color:[165, 83, 126])
        # 2は好感度が変化しない選択肢
        Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
    when 3 then
        Window.draw(125, 0, normal1_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "(無視？感じわるーこの人……)", font, color:[165, 83, 126])
        Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
    end

    # 選択肢を表示する
    if flag == 1 && flag_end == 0 then
        # 選択肢1
        Window.draw_scale(109, 224, button_img, 0.6, 0.6, 0, 0)
        Window.draw_font(239, 229, "こちらこそよろしく！", font, color:[165, 83, 126])
        # 選択肢2
        Window.draw_scale(109, 274, button_img, 0.6, 0.6, 0, 0)
        Window.draw_font(259, 279, "あ、えっと……", font, color:[165, 83, 126])
        # 選択肢3
        Window.draw_scale(109, 324, button_img, 0.6, 0.6, 0, 0)
        Window.draw_font(269, 329, "……（無視）", font, color:[165, 83, 126])

        if timer >= 60
        # マウスの座標が特定の領域にある間、選択肢をホバー状態にする
        if (109 < x && x <541 && 224 < y && y < 260) then # 選択肢1
            Window.draw_scale(109, 224, button_hover_img, 0.6, 0.6, 0, 0)
            Window.draw_font(239, 229, "こちらこそよろしく！", font, color:[255, 255, 255])
            if Input.mouse_push?(M_LBUTTON) then
                player_chose = 1
                flag = 0
                flag_end = 1
                likability += 1
            end
        elsif (109 < x && x <541 && 274 < y && y < 310) then # 選択肢2
            Window.draw_scale(109, 274, button_hover_img, 0.6, 0.6, 0, 0)
            Window.draw_font(259, 279, "あ、えっと……", font, color:[255, 255, 255])
            if Input.mouse_push?(M_LBUTTON) then
                player_chose = 2
                flag = 0
                flag_end = 1
            end
        elsif (109 < x && x <541 && 324 < y && y < 360) then # 選択肢3
            Window.draw_scale(109, 324, button_hover_img, 0.6, 0.6, 0, 0)
            Window.draw_font(269, 329, "……（無視）", font, color:[255, 255, 255])
            if Input.mouse_push?(M_LBUTTON) then
                player_chose = 3
                flag = 0
                flag_end = 1
                likability -= 1
            end
        end
        end
    end

end