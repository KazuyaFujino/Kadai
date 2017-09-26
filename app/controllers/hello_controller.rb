class HelloController < ApplicationController

	layout 'application'
	before_action :authenticate_account!#,only: :login_check

	def index
		@msg = 'sample'
	end

	def login_check
		@account = current_account
		@msg = 'you logined at:'+@account.current_sign_in_at.to_s
	end

end
