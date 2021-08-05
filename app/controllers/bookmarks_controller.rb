class BookmarksController < ApplicationController
    def new
        @bookmark = Bookmark.new
    end
    
    def create
        @bookmark = Bookmark.find(bookmark_params)
        @bookmark.save
        redirect_to lists_path
    end

    def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.delete
        redirect_to lists_path
    end

    private

    def bookmark_params
        params.require(:bookmark).permit(
            :comment
        )
    end
end
