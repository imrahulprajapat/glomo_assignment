class Transaction < ApplicationRecord
  belongs_to :account

  STATES = %w[pending processing completed failed]

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :state, inclusion: { in: STATES }

  before_validation :set_defaults, on: :create

  def process!
    raise "Transaction already processed" unless state == "pending"

    transaction do
      update!(state: "processing")

      account.with_lock do
        apply!
        account.save!
      end

      update!(state: "completed")
    end
  rescue => e
    update!(state: "failed") rescue nil
    raise e
  end

  private

  def set_defaults
    self.state ||= "pending"
  end

  def apply!
    raise NotImplementedError
  end
end