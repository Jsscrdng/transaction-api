class Account < ApplicationRecord
  # Associations
  belongs_to :user

  # Constants
  enum currency: { eur: 3, usd: 1 }

  # Callbacks
end

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  balance    :float
#  currency   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
