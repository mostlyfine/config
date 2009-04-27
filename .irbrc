require 'rubygems'
require 'pp'
require 'wirble'
require 'irb/completion'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:AUTO_INDENT] = true

Wirble.init
Wirble.colorize

if IRB.conf[:LOAD_MODULES].join =~ /config\/environment/
  # console上でARが発行するSQLなどを表示するメソッド
  def log_to(stream = STDOUT)
    ActiveRecord::Base.logger = Logger.new(stream)
    ActiveRecord::Base.clear_active_connections!
  end

end
