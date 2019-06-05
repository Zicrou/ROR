class CommentsController < ApplicationController

http_basic_authenticate_with name: "zicrou", password: "ZicroU", only: :destroy

    def create
      @word = Word.find(params[:word_id])
      @comment = @word.comments.create(comment_params)
      redirect_to word_path(@word)
    end
    
    def destroy
      @word = Word.find(params[:word_id])
      @comment = @word.comments.find(params[:id])
      @comment.destroy
      redirect_to word_path(@word)
    end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
