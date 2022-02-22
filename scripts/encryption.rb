# to encrypt a secret, use BCrypt::Password.create(secret)
# to test a secret, use BCrypt::Password.new(encrypted) == secret
# run this file using rails runner scripts/encryption.rb

# 1. encrypt a secret and puts encrypted string
secret_password = "tacos"
encrypted_password = BCrypt::Password.create(secret_password)
puts encrypted_password 

# 2. check if decrypted value matches secret
password_to_test = "tacos"
password_matches = BCrypt::Password.new(encrypted_password) == password_to_test
puts password_matches
