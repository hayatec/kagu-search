class ItemsController < ApplicationController
  #before_action :set_item, only: [:show]
  before_action :set_item, only: [:edit, :update, :destroy]
  require 'amazon_call_browsnode'
  require 'amazon_parse'
  require 'amazon_size_define'
  
  delegate :strip_tags, to: 'ApplicationController.helpers'

  def index
    #param =""
    #param = params[:q] unless params[:q].present?
    @search = Item.search(params[:q])
    p params
    @item = @search.result
  end

  def search
    @search = Item.search(params[:q])
    @item = @search.result
    #@item = Item.all
    
  end
  
  
  def new
    if params[:q]
      response = Amazon::Ecs.item_search(params[:q] , 
        :search_index => 'All' , 
        :response_group => 'Medium' , 
        :country => 'jp')
      @amazon_items = response.items
    end
  end

  def create

    browsenode_ids = Category.all

    browsenode_ids.each do |b|
     #binding.pry
     browsenode_id = b.browsenode_id
     puts browsenode_id
     retry_count = 0
     
      for item_page in 1..1
        begin
          #binding.pry
          #response = amazon_call_browsnode(browsenode_id, item_page)
          #amazon_parse(response)
        rescue
          retry_count += 1
          if retry_count < 5
            sleep(3)
            retry
          else
            return false
            #rescue Amazon::RequestError => e
            #return render :js => "alert('#{e.message}')"
          end
        end
      end
   end
   
    @item = Item.all
    @item.each do |item|
      p "-----------"
      p item.title
      amazon_size_define(item)
    end

    #@items = ERB::Util.html_escape(Item.all)
    #f = File.open('item_all.txt', 'w') # wは書き込み権限
    #  f.puts Item.all.second
    #f.close
  
    @item = Item.all
    
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def redefine
    item_id = params[:item_id]
    item = Item.find_by(id: item_id)
    amazon_size_define(item)
    @item = Item.find_by(id: item_id)
    render 'edit'
  end
  
  


  private
  def get_amazon_response(browsnode_id,item_page)
    #
    #item_page = 3
    #392270011
    response = Amazon::Ecs.item_search('', :search_index => 'Kitchen', :browse_node => browsnode_id, :response_group=>"Medium, BrowseNodes", :country => 'jp',   :sort => "salesrank", :item_page => item_page )
    #responseから要素抜き出し
  end


  private
  def request_params
    params.require(:message).permit(:browsnode_id)
    #TODO
    #item_pageも含めるか検討
  end
  
  
  private
  def item_params
    params.require(:item).permit(:id, :title, :color, :height, :width, :length)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

end