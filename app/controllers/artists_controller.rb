class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy]

  # GET /artists
  def index
    @artists = Artist.all.reverse

    render json: @artists.to_json(include: { tracks: { include: :genre }})
  end

  # GET /artists/1
  def show
    render json: @artist.to_json(include: { tracks: { include: :genre }})
  end

  # POST /artists
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      @artist.save_attachments(artist_params) if params[:artist][:track_data]
      render json: @artist, status: :created
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artists/1
  def update
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artists/1
  def destroy
    @artist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_params
      params.require(:artist).permit(:name, :email, :status, :mp3, :track_data => [])
    end
end
