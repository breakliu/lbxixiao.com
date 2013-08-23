class HomeController < ApplicationController
  def index
  end

  def page
    category = Category.find(params[:category_id])
    children = Category.find(params[:children_id])

    @posts = children.posts.page(params[:page]).per(6)

    if category.root?
      @tabs = category.children
    else
      @tabs = category.self_and_siblings
    end

    # 不同情况使用不同的模版
    respond_to do |format|
      format.html { render layout: children.ctype.page_tpl }
      format.json
    end
  end

  def topic
    @category = Category.find(params[:category_id])
    @children = Category.find(params[:children_id])

    @posts = @children.posts.page(params[:page]).per(6)
    @tabs = @category.children

    # 不同情况使用不同的模版
    respond_to do |format|
      format.html { render layout: @children.ctype.page_tpl }
      format.json
    end
  end
end
