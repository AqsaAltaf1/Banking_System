class AccountsController < ApplicationController
  respond_to :js, :html
  before_action :set_account, except: %i[index new create user_accounts bank_accounts]
  
  def index
    if current_user.superadmin?
      @accounts = Account.all
    else
      @accounts = current_user.accounts
    end
  end

  def show
  end

  def new
    @account = Account.new
    @random = [*0..9,'-',*0..9].shuffle.join
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to user_path(current_user)
      flash[:notice] = "successfull ."
    else
      flash[:notice] = "Account is already present in bank ."
      respond_with(@account) do |format|
        format.html {render :new, status: :unprocessable_entity}
      end
    end
  end
  
  def edit
  end
  
  def update
    if @account.update(account_params)
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to root_path
  end

  def bank_accounts
    @bank = Bank.find(params[:id])
    @accounts = @bank.accounts
    respond_to do |format|
      format.js 
    end
  end

  private

  def account_params
    params.require(:account).permit(:number, :balance, :user_id, :bank_id, :status)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end

