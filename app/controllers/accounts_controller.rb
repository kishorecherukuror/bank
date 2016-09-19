class AccountsController < ApplicationController
  def new
  	@user = User.find params[:id]
  	@account = @user.accounts.build
  end

  def create
  	#binding.pry
  	@account = Account.new(accounts_params)
  	if @account.save
  		redirect_to users_path
  	else
  		render 'new'
  	end
  end

  def deposit
  	@accounts = Account.all
  	unless params[:account].nil?
	  	@account = Account.find params[:account]
	  	@amount = @account.amount.to_i + params[:amount].to_i
	  	if @account.update_attributes(:amount => @amount)
	  		redirect_to users_path
	  	end
	  end
  end

  def withdraw
    @accounts = Account.all
    unless params[:account].nil?
      @account = Account.find params[:account]
      @amount = @account.amount.to_i - params[:amount].to_i

      if @amount < 0
        flash[:error] = "Amount is exeeced"
        redirect_to accounts_withdraw_path    
      elsif @account.update_attributes(:amount => @amount)
        redirect_to users_path
      end
    end
  end

  private

  def accounts_params
  	params.require(:account).permit!
  end
end
