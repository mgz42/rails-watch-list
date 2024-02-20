class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new()
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(safe_params)
    @bookmark.list_id = (params[:list_id])
    @bookmark.save
    redirect_to list_path(params[:list_id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id), status: :see_other
  end

  private

  def safe_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
