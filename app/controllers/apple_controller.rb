class AppleController < ApplicationController

  # [[<display_name>, <actual Mac appl name - make sure quotes are retained>]
  APPS = [["Preview", "Preview"], ["Google Chrome", '"Google Chrome"'], ["Don't Care", "DONT_CARE"]]
  BUTTONS = {:left => "Left", :down => "Down", :up => "Up", :right => "Right", :zoomin => "Zoom In", :zoomout => "Zoom Out", :volplus => "Vol +", :volminus => "Vol -"}
  REV_BUTTONS = BUTTONS.invert
  SCRIPT_PATH = File.expand_path(File.join(File.dirname(__FILE__), "../../lib/applescripts/controlmac.scpt"))

  def self.get_colors
    BUTTONS.collect { (0..2).map { "%0x" % (rand * 0x80 + 0x80) }.join }
  end

  def get
    @apps = APPS
    @buttons = BUTTONS
    @colors = AppleController.get_colors

    if params["commit"]
      action = REV_BUTTONS[params["commit"]]
      puts "*** Running applescript #{SCRIPT_PATH} with args #{params["app"]} #{action}***"
      `osascript #{SCRIPT_PATH} #{params["app"]} #{action}`
    end
  end
end
