class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :area
  belongs_to :category
  belongs_to :payed
  belongs_to :progress
  belongs_to :state


  validates :title, :description, :price, presence: true
#  validates :image, attached_file_presence: true
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
