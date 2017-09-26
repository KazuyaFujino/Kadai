class DiaryController < ApplicationController
  
  layout 'diary'
  #layout 'application'
  before_action :authenticate_account!#,only: :login_check

  def index
    @header = '棋譜管理β'
    @footer = 'compyright KAZUYA-Fujino 2017'
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
    @kyoku = Kyoku.new kyoku_params
  	if @kyoku.save then
  		redirect_to '/diary'
  	else
      @msg= '入力に問題があります'
      render 'add'
    end
  end

  def edit
  	@msg = "データの再編集ができます"
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

  def find
    @msg = '検索するワードを打ち込んでください'
    @diary = Array.new
    if request.post? then
      @diary = Kyoku.where "senkei like ?", '%' + params[:find] + '%'
    end
  end

  def login_check
    @account = current_account
    @msg = 'you logined at:'+@account.current_sign_in_at.to_s
  end

  private
  def kyoku_params
  	params.require(:kyoku).permit(:day,:senkei,:comment,:kif)
  end
end
