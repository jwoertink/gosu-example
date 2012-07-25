class GameWindow < Gosu::Window
  
  def initialize
    # Width, Height, Full screen?
    super 640, 480, false
    # The title of the window
    self.caption = "StarFighter"
                        # the window, image path, hard borders for tiles?
    @background_image = Gosu::Image.new(self, "assets/space.png", true)
    @player = Player.new(self)
    @player.warp(320, 240)
    
    @star_anim = Gosu::Image.load_tiles(self, "assets/Star.png", 25, 25, false) #tile w, tile h, tileable
    @stars = []
    
    @font = Gosu::Font.new(self, Gosu.default_font_name, 20) # 20px font
  end
  
  def update
    @player.turn_left if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft
    @player.turn_right if button_down? Gosu::KbRight or button_down? Gosu::GpRight
    @player.accelerate if button_down? Gosu::KbUp or button_down? Gosu::GpButton0
    @player.move
    @player.collect_stars(@stars)
    if rand(100) < 4 and @stars.size < 25
      @stars << Star.new(@star_anim)
    end
  end
  
  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
    @stars.map(&:draw)
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffaa00) # hex is font color in aa/rr/gg/bb
  end
  
  def button_down(id)
    close if id.eql? Gosu::KbEscape
  end
  
end
