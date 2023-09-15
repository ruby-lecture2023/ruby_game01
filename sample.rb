require 'dxruby'

WINDOW_X = 640
WINDOW_Y = 480

normal_img = Image.load("image/tachie_normal.png")
back_img = Image.load("image/classloom.jpg")
font = Font.new(20)

likability = 0 # 好感度
flag = 0

Window.loop do
    # 背景と人物の表示
    Window.draw(0, 0, back_img)
    Window.draw(125, 0, normal_img)

    # メッセージウィンドウの表示
    Window.draw_box_fill(4, 384, 634, 474, [150, 255, 255, 255])
    Window.draw_box(4, 384, 634, 474, [42, 88, 227])
    Window.draw_box(7, 387, 631, 471, [42, 88, 227])
    Window.draw_font(15, 395, "君が隣の席？よろしくね！", font, color:[0, 0, 0])

    if Input.key_down?(K_SPACE) then
        flag = 1
    end

    if flag == 1 then
        Window.draw_box_fill(0, 0, 639, 479, [100, 0, 0, 0])
        
    end
end