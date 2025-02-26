class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  before_validation :downcase_category

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }

  private

  def downcase_category
    self.category = category.downcase.strip if category.present?
  end
end
