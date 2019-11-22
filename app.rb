require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require './models/post.rb'

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    Post.create(name: 'new post from controller')
    @posts = Post.all
    erb :index
  end
end
