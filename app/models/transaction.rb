class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :account
end

# == Schema Information
#
# Table name: transactions
#
#  id                     :bigint           not null, primary key
#  amount                 :float
#  description            :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  destination_account_id :bigint           not null
#  origin_account_id      :bigint           not null
#
# Indexes
#
#  index_transactions_on_destination_account_id  (destination_account_id)
#  index_transactions_on_origin_account_id       (origin_account_id)
#
# Foreign Keys
#
#  fk_rails_...  (destination_account_id => accounts.id)
#  fk_rails_...  (origin_account_id => accounts.id)
#
