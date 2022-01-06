class Student < ApplicationRecord
  # relations
  has_one_attached :image

  # validations
  validates :suba, :subb, :subc, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :name, presence: true

  # call backs
  before_commit :calc_percentages, on: [:create, :update]

  def calc_percentages
    self.percentage = (self.suba + self.subb + self.subc) / 3
    self.save
  end
end
