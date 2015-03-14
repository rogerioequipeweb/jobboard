class CommentsController < ApplicationController
	def create
		@job = Job.find(params[:job_id])
		@comment = @job.comments.build(comment_params)
		if @comment.save
			flash[:notice] = "Comentario foi criado"
		else
			flash[:alert] = "Erro na gravacao dos dados"
		end
		redirect_to @job
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @comment.job, notice: "comentario deletado com sucesso."
	end

  private
  def comment_params    
    params.require(:comment).permit(:name, :body)
  end
end

