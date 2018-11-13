class ArtworksController < ApplicationController
  def index
    # artworks = Artwork.all
    # render json: artworks

    user = User.find_by(id: params[:user_id])

    render json: user.artworks  + user.shared_artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      render json: artwork
    else
      redirect_to action: "index"
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      artwork.update(artwork_params)
      render json: artwork
    else
      render plain: "Couldn't find artwork when updating artwork with id #{params[:id]}", status: 422
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      artwork.destroy
      render json: artwork
    else
      render plain: "There was an error destroying artwork with id #{params[:id]}"
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end
end
