class Budget < ApplicationRecord
  belongs_to :user

  def spend_this_month()
    (self.annual_amount.to_f / 12).round(0)
  end

  def spend_this_year()
    (self.spend_this_month.to_f * 3).round(0)
  end

  def remaining()
    (self.annual_amount.to_f - self.spend_this_year).round(0)
  end
end
