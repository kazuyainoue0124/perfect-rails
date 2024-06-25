class Book < ApplicationRecord
  enum sales_status: {
    reservation: 0, # 予約受付中
    now_on_sale: 1, # 発売中
    end_of_print: 2 # 販売終了
  }
  scope :costly, -> { where('price > ?', 3000) }
  scope :written_about, ->(theme) { where('name like ?', "%#{theme}%") }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  # validate メソッドによるカスタムバリデーションの例
  validate do |book|
    if book.name.include?("exercise")
      book.errors[:name] << "I don't like exercise."
    end
  end
  # before_validation コールバックの例
  before_validation do
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end
  # after_destroy コールバックの例
  after_destroy do
    Rails.logger.info "Book is deleted: #{self.attributes}"
  end
  # コールバック起動の条件を指定する例
  after_destroy if: :high_price? do
    Rails.logger.warn "Book with high price is deleted: #{self.attributes}"
    Rails.logger.warn "Please check it out!"
  end

  def high_price?
    price >= 5000
  end
end