class User::AsAvatarUploader < ActiveType::Record[User]

  mount_uploader :avatar, ::AvatarUploader

  validates :avatar, presence: true

  private

end