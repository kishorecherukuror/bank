class AccountsController < ApplicationController
  def new
  	@user = User.find params[:id]
  	@account = @user.accounts.build
  end

  def create
  	#binding.pry
  	@account = Account.new(accounts_params)
  	if @account.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def deposit
    #binding.pry
  	@accounts = Account.all
  	unless params[:account].nil?
	  	@account = Account.find params[:account]
	  	@amount = @account.amount.to_i + params[:amount].to_i

      @account.transactions.create(:transaction_type => "deposit", :amount => params[:amount].to_i, trasaction_date: Time.now, :user_id => @account.user_id )

	  	if @account.update_attributes(:amount => @amount)
	  		redirect_to root_path
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
      elsif @account.update_attributes(:amount => @amount)
       @account.transactions.create(:transaction_type => "withdraw", :amount => params[:amount].to_i, trasaction_date: Time.now, :user_id => current_user.id )
        redirect_to root_path
      end
   end
  end

  private

  def accounts_params
  	params.require(:account).permit!
  end
end
