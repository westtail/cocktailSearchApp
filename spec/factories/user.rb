FactoryBot.define do
    factory :user do
        name {'テストユーザー'}
        email {'test@test.test'}
        password {'password'}
        activated {true}
    end
end