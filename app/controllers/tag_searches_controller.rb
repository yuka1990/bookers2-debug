class TagSearchesController < ApplicationController
  
  def search
      @model = Book
      @word = params[:word]
      @books = Book.where("tag LIKE?","%#{@word}%")
      render "serches/result"
  end
end
