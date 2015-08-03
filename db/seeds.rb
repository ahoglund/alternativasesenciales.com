# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = [User.new(
    email: "admin@example.com",
    password: "1234",
    admin: true
),User.new(
    email: "notadmin@example.com",
    password: "1234",
    admin: false
)
]
u.each do |i|
  i.skip_confirmation!
  i.save!
end
