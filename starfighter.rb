require 'rubygems'
require 'gosu'

ROOT_PATH = File.dirname(__FILE__)
require File.join(ROOT_PATH, 'z_order')
require File.join(ROOT_PATH, 'game')
require File.join(ROOT_PATH, 'player')
require File.join(ROOT_PATH, 'star')

window = GameWindow.new
window.show

