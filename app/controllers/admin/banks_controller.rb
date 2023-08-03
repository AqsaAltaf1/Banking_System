module Admin
  class BanksController < ApplicationController
    before_action :set_bank, except: %i[index new create]

    def index
      @banks = Bank.all
    end
    
    def new
      @bank = Bank.new
    end

    def show
    end

    def create
      @bank = Bank.new(bank_params)

      if @bank.save
        redirect_to banks_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @bank.update(bank_params)
        redirect_to banks_path
      else
        render :edit
      end
    end
    
    def destroy
      @bank.destroy
      redirect_to banks_path
    end
    private

    def bank_params
      params.require(:bank).permit(:name, :address)
    end

    def set_bank
      @bank = Bank.find(params[:id])
    end
  end 
end