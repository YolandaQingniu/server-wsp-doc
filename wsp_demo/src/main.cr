require "kemal"
require "mysql"
require "granite"
require "granite/adapter/mysql"
DATABASE_URL = ENV["DATABASE_URL"]? || "mysql://root:1234@localhost/test"
Granite::Connections << Granite::Adapter::Mysql.new(name: "mysql", url: DATABASE_URL)
require "./controllers/*"
require "./models/*"
require "micrate"

begin
  DB.open DATABASE_URL do |db|
    db.exec "CREATE DATABASE wsp"
  end
rescue
  puts "数据库已存在"
end

Micrate::DB.connection_url = DATABASE_URL
Micrate::Cli.run_up
Kemal.config.port = ENV["PORT"].to_i if ENV["PORT"]?
Kemal.run
