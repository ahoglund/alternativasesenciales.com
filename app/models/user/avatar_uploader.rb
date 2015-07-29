class User::AsAvatar < ActiveType::Record[User]

  mount_uploader :avatar, AvatarUploader

  validates :avatar, presence: true

  private

end