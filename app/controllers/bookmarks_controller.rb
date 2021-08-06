class BookmarksController < ApplicationController
    def new
        @bookmark = Bookmark.new
    end
    
    def create
        @bookmark = Bookmark.new(bookmark_params)
        @list = List.find(params[:list_id])
        @bookmark.list = @list
        if @bookmark.save
            redirect_to list_path(@list)
        else
            render :new
        end
    end

    def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.delete
        redirect_to list_path(@list)
    end

    private

    def bookmark_params
        params.require(:bookmark).permit(
            :id, 
            :comment
        )
    end
end