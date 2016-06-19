class CategoriesController < ApplicationController
      before_action :set_categories, only: [:edit, :update, :destroy]
  
  def index
    @categories = Category.new
    # categoriesを全て取得する。
    @categories = Category.all
  end
  
  def show
    @categories = Category.all
  end

  def create
    @categories = categories.new(categories_params)
    if @categories.save
      redirect_to category_path , notice: 'メッセージを保存しました'
    else
      # メッセージが保存できなかった時
      @categories = categories.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end
  
  def edit
  end
  
  def update
    if @categories.update(categories_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to category_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def destroy
    @categories.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end

  private
  def categories_params
    params.require(:category).permit(:browsenode_id, :category_name)
  end

  def set_categories
    @categories = Category.find(params[:id])
  end
end
