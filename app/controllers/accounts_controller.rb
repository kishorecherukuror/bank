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
     @user = User.find params[:id] 
   	 @account=@user.accounts.all
   	  unless params[:account].nil?
   	  	  @account=Account.find params[:account]
   	  	  @amount=@account.amount.to_i + params[:amount].to_i
   	  	 if @account.update_attributes(:amount =>@amount)
            redirect_to root_path
          end
      end
    end

   def withdraw
    #binding.pry
     @user = User.find params[:id] 
     @account=@user.accounts.all
   	  unless params[:account].nil?
   	  	  @account=Account.find params[:account]
   	  	  @amount=@account.amount.to_i - params[:amount].to_i
          if @amount < 0
            flash[:error] = "Amount Exceded"
            redirect_to accounts_withdraw_path, :notice => "Amount Exceded"
   	  	  elsif @account.update_attributes(:amount=>@amount)
   	  	   redirect_to root_path 
         end
        end
    end      


     private
       def accounts_params
         params.require(:account).permit!
        end
end          