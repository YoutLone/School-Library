require './app'
require_relative 'option'

class Main
  def initialize
    @app = App.new
  end

  def run
    Option.new(@app).start
  end
end

main = Main.new
main.run
