class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product

  def create
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment has been created"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Something is wrong. Please one again"
      redirect_to product_path(@product)
    end
  end
  def edit
    @comment = @product.comments.find(params[:id])
  end

  def update
    @comment = @product.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment has been updated"
      redirect_to product_path(@product)
    end
  end

  def destroy
    @comment = @product.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment has been destroyed "
      redirect_to product_path(@product)
    else
      flash[:alert] = 'Something is wrong'
      redirect_to product_path(@product)
    end
  end



  private
  def find_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:rating, :body )
  end
end
