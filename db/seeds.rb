User.find_or_create_by!(email: 'guest@example.com') do |user|
    user.name ='ゲストユーザー'
    user.email = 'guest@example.com'
    user.password = 'test_password'
    user.password_confirmation = 'test_password'
    user.activated =  true
    user.activated_at = Time.zone.now
end