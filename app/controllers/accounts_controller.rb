class AccountsController < ApplicationController
  before_action :set_account

  def balance
    render json: {
      balance: @account.balance,
      locked_balance: @account.locked_balance
    }
  end

  private

  def set_account
    user = User.find_by(id: params[:user_id])
    return render json: { error: "User not found" }, status: :not_found unless user

    @account = user.account
  end
end