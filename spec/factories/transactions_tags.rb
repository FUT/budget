# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transactions_tag, :class => 'TransactionsTags' do
    transaction_id 1
    tag_id 1
  end
end
