#!/opt/local/bin/ruby1.9
require 'irb/ext/save-history'
IRB.conf[:AUTO_INDENT] = false
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"


class Object
  # Return only the methods not present on basic objects
  def imethods
    (self.methods - Object.new.methods).sort
  end
end