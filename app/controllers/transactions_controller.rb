class TransactionsController < ApplicationController
  respond_to :js, :html
  def index
    if current_user.superadmin?
      @transactions = Transaction.all
    else
      @transactions = current_user.transactions
    end
  end

  def new
    @transaction = Transaction.new
  end 

  def create
    @transaction = Transaction.new(transaction_params)
    if  @transaction.save
      redirect_to transactions_path
      flash[:notice] = "transaction successful."
    else 
      flash[:notice] = "transaction failed."
      respond_with(@transaction) do |format|
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:bank_id, :user_id, :account_id, :reciever_id, :amount)
  end
end
