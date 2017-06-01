require 'sinatra'
require_relative 'config/database.rb'
require_relative 'lib/menu.rb'

MYMENU = Menu.new
configure do
  set :erb, layout: :'layouts/layout'
  enable :inline_templates
end

get '/' do
  MYMENU.menu + '<br> NUTRITION HOME PAGE'
end

get '/basictext' do
  erb :'basictext'
end
