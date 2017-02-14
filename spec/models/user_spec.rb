require 'rails_helper'

describe User do
  describe "avatar_attachment" do 
    it { should have_attached_file(:avatar) }
    it { should validate_attachment_content_type(:avatar).allowing('image/png', 'image/gif').rejecting('text/plain', 'text/xml') }
  end
end
