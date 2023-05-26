class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :area
  belongs_to :category
  belongs_to :payed
  belongs_to :progress
  belongs_to :state


  validates :title,  length: { maximum: 40 }, presence: true
  validates :description,  length: { maximum: 1000 }, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: true, inclusion: { in: 300..9_999_999 }
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :state_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :payed_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :progress_id, numericality: { other_than: 1 ,message: "can't be blank"}

  has_one_attached :image

  def was_attached?
    self.image.attached?
  end
end
