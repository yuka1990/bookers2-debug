class TagSearchesController < ApplicationController

  def search
      @model = Book
      @word = params[:content]
      @books = Book.where("tag LIKE?","%#{@word}%")
      render "tag_searches/tagsearch"
  end
end
