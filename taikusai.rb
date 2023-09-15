require 'dxruby'

WINDOW_X = 640
WINDOW_Y = 480

# 画像設定

normal_img = Image.load("image/tachie_normal.png") # 人物
back_img = Image.load("back/koutei.jpg") #背景
trim_back_img = back_img.slice(1200,1600,640,480)
window_img = Image.load("image/window_01.png") #メッセージボックス
button_img = Image.load("image/button_01.png") # 選択肢
button_hover_img = Image.load("image/button_01_hover.png") # 選択肢（選択状態）

# フォント設定
font = Font.new(24, fontname="ドットゴシック16") # 本文（サイズは24pt）
font_name = Font.new(22, fontname="ドットゴシック16") # 人物の名前（サイズ）

# 各種初期化
likability = 0 # 好感度
flag = 0

Window.loop do
    # マウスの座標取得
    x = Input.mouse_pos_x  # マウスカーソルのx座標
    y = Input.mouse_pos_y  # マウスカーソルのy座標

    # 背景と人物の表示
    Window.draw(0, 0, trim_back_img)
    Window.draw(125, 0, normal_img)

    # メッセージウィンドウの表示
    Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
    Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
    Window.draw_font(44, 404, "君が隣の席？よろしくね！", font, color:[165, 83, 126])

    # if Input.key_down?(K_SPACE) then
    if Input.mouse_down?(M_LBUTTON) then
        flag = 1
    end

    if flag == 1 then
        Window.draw_scale(109, 224, button_img, 0.6, 0.6, 0, 0)
        Window.draw_font(239, 229, "こちらこそよろしく！", font, color:[165, 83, 126])
        Window.draw_scale(109, 274, button_img, 0.6, 0.6, 0, 0)
        Window.draw_font(259, 279, "あ、えっと……", font, color:[165, 83, 126])
        Window.draw_scale(109, 324, button_img, 0.6, 0.6, 0, 0)
        Window.draw_font(269, 329, "……（無視）", font, color:[165, 83, 126])
    end

=begin
    case (x, y)
    when (109 to 469, 224 to 254) then
        Window.draw_scale(109, 224, button_hover_img, 0.6, 0.6, 0, 0)
    when (109 to 469, 274 to 304) then
        Window.draw_scale(109, 274, button_hover_img, 0.6, 0.6, 0, 0)
    when (109 to 469, 324 to 354) then
        Window.draw_scale(109, 324, button_hover_img, 0.6, 0.6, 0, 0)
    end
=end

end