class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include PgSearch
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum designation: [:administrative_officer_v, :administrative_officer_iv, :supervising_tesd_specialist, :senior_tesd_specialist, :tesda_specialist_ii]

  has_many :issued_certificates, class_name: "Issuance", foreign_key: "user_id"
  has_many :uploaded_registries, class_name: "Registry", foreign_key: 'user_id'
  has_attached_file :avatar,
  styles: { large: "120x120>",
            medium: "70x70>",
            thumb: "40x40>",
            small: "30x30>",
            x_small: "20x20>"},
  default_url: ":style/profile_default.jpg",
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  :url => "/system/:attachment/:id/:style/:filename"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def first_name_and_last_name 
    "#{first_name} #{last_name}"
  end

  def full_name
    "#{first_name} #{middle_name.try(:first)}. #{last_name}"
  end
end
