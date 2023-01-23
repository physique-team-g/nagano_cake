class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  enum payment_method: {クレジットカード:0, 銀行振込:1}
  enum address: [:"ご自身の住所", :"登録済住所から選択", :"新しいお届け先"]
  enum status: {nyuukinmati: 0, nyuukinkakunin: 1, seisakutyuu: 2, hassouzyunbityuu: 3, hassouzumi: 4 }

end
