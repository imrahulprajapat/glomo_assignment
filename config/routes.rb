Rails.application.routes.draw do
  post "/login", to: "auth#login"
  get "/balance/:user_id", to: "accounts#balance"
  post "/transactions/:user_id", to: "transactions#create"
end
