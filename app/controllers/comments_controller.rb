class CommentsController < ApplicationController
    def new
        board = Article.find(params[:board_id])
      @comment = board.comments.build
    end
    def create
        board = Article.find(params[:board_id])
        @comment = board.comments.build(comment_params)
        if @comment.save
          redirect_to board_path(board), notice: 'Add Cmments'
        else
          flash.now[:error] = 'Could not update'
          render :new
        end
      end
      private
      def comment_params
        params.require(:comment).permit(:content)
      end
      end