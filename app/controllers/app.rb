require 'pry'
class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}

  get '/' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    # binding.pry
    erb :'songs/show'
  end

  get '/songs/:id/edit' do #this prompts edit page
    @song = Song.find(params[:id])
    #use id to find ingredient; find params to find song
    #render a page that pre-fills the page out with values of song
    erb :'songs/edit'
  end

  patch '/songs/:id' do
    @song = Song.find(params[:id])
    @song.update(params[:id])

    redirect "/songs/#{@song.id}"
  end
end
