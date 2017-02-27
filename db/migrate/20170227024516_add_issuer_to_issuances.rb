class AddIssuerToIssuances < ActiveRecord::Migration[5.0]
  def change
    add_reference :issuances, :user, foreign_key: true
  end
end
