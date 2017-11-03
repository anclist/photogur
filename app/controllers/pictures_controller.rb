class PicturesController < ApplicationController

  # before_action :ensure_logged_in, except: [:show, :index]

  def index
    @pictures =Picture.all
    # @older_pictures = Picture.created_before
    # # @show_year = Picture.find_the_year
    # @pictures_by_year = Picture.pictures_created_in_year
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new( picture_params )

    # @picture.artist = params[:picture][:artist]
    # @picture.title = params[:picture][:title]
    # @picture.image = params[:picture][:image]


    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.update(picture_params)


    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

  private

  def picture_params
    return params.require(:picture).permit(:artist, :title, :image)
  end

end
