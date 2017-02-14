require 'rails_helper'

describe User do
  describe "avatar_attachment" do 
    it { should have_attached_file(:avatar) }
    it { should validate_attachment_content_type(:avatar).allowing('image/png', 'image/gif').rejecting('text/plain', 'text/xml') }
  end

  it "#first_name_and_last_name" do 
    user = build(:user, first_name: "Von", last_name: "Halip")

    expect(user.first_name_and_last_name).to eql("Von Halip")
  end

  it '#full_name' do
    user = build(:user, first_name: "Von", middle_name: 'Pinosan', last_name: 'Halip')

    expect(user.full_name).to eql('Von P. Halip')
  end

  describe "enums" do
    it { is_expected.to define_enum_for(:designation).with([:administrative_officer_v, :administrative_officer_iv, :supervising_tesd_specialist,
                                                            :senior_tesd_specialist, :tesda_specialist_ii]) }
  end

end
