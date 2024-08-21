# frozen_string_literal: true

class SessionForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :email, :string
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  attr_accessor :user

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Session')
  end

  def save!(user)
    user.update!(email:)
    AuthMailer.with(user:).sign_in_email.deliver_later
  end

  def persisted?
    false
  end
end
