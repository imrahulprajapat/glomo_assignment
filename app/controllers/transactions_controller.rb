class TransactionsController < ApplicationController
  before_action :set_account

  def create
  	amount = params[:amount].to_f
		raise "Amount must be positive" if amount <= 0
		# As of now we are creating desposit only.
    transaction = Deposit.create!(
      account: @account,
      amount: params[:amount].to_f
    )

    transaction.process!

    render json: {
      message: "Deposit successful",
      balance: @account.reload.balance
    }
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def set_account
    user = User.find_by(id: params[:user_id])
    return render json: { error: "User not found" }, status: :not_found unless user

    @account = user.account
  end
end