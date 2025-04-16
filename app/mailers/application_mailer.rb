class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end


# category_id      | integer    | null: false                    |
# | condition_id     | integer    | null: false                    |
# | shipping_fee_id  | integer    | null: false                    |
# | prefecture_id    | integer    | null: false                    |
# | delivery_time_id | integer    | null: false       


# rails g model Category --skip-migration

# rails g model Condition --skip-migration
# rails g model ShippingFee --skip-migration
# rails g model Prefecture --skip-migration
# rails g model DeliveryTime --skip-migration