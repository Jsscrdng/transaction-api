class User < ApplicationRecord
  # Modules
  include Tokenable

  # Callbacks
  has_many :accounts, dependent: :destroy

  # Associations
  before_create :assign_access_token

  # Validations
  validates_uniqueness_of :email
end

# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  access_token :string           default(""), not null
#  email        :string
#  first_name   :string
#  last_name    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_users_on_access_token  (access_token) UNIQUE
#  index_users_on_email         (email) UNIQUE
#
