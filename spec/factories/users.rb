FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    first_name            {"陸太郎"}
    last_name             {"山田"}
    kana_first_name       {"リクタロウ"}
    kana_last_name        {"ヤマダ"}
    date_of_birth         {"1990,1,11"}

  end
end