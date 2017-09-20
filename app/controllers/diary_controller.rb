class DiaryController < ApplicationController
  
  def index
  	@msg = '全データ'
  	@data = Kyoku.all
  end
  
  def show
  	@msg = 'データの詳細'
  	@data = Kyoku.find(params[:id])
  end
  
  def add
  	@msg = "情報の詳細を記入してください"
  	@diary = Kyoku.new
  end


  def create
  	if request.post? then
  		Kyoku.create(kyoku_params)
  	end
  	redirect_to '/diary'
  end

  def edit
  	@msg = "データの再編集ができます"+ params[:id] +""
  	@diary = Kyoku.find(params[:id])
  end
  
  def update
  	obj = Kyoku.find(params[:id])
	obj.update(kyoku_params)
	redirect_to '/diary'
  end 

  def delete
  	obj = Kyoku.find(params[:id])
  	obj.destroy
  	redirect_to '/diary'
  end

  private
  def kyoku_params
  	params.require(:kyoku).permit(:day,:senkei,:comment,:kif)
  end
end
