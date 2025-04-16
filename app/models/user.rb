class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  validates :password, format: {
    with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}\z/,
    message: 'は6文字以上の半角英数字で入力してください（英字と数字の両方を含む）'
  }, if: -> { password.present? }

  validates :last_name, presence: true,
                        format: {
                          with: /\A[ぁ-んァ-ン一-龥々]+\z/,
                          message: 'は全角（漢字・ひらがな・カタカナ）で入力してください'
                        }

  validates :first_name, presence: true,
                         format: {
                           with: /\A[ぁ-んァ-ン一-龥々]+\z/,
                           message: 'は全角（漢字・ひらがな・カタカナ）で入力してください'
                         }

  validates :last_name_kana, presence: true,
                             format: {
                               with: /\A[ァ-ヶー－]+\z/,
                               message: 'は全角カタカナで入力してください'
                             }

  validates :first_name_kana, presence: true,
                              format: {
                                with: /\A[ァ-ヶー－]+\z/,
                                message: 'は全角カタカナで入力してください'
                              }

  validates :birthday, presence: true
end
