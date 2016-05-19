require 'rails_helper'

RSpec.describe Download, type: :model do
  let(:user) {FactoryGirl.create(:user)}

  it "can download" do
    expect(user.downloads.create(attributes_for(:download))).to be_valid
  end

  it "needs a downloaded_id" do
    expect(user.downloads.create(attributes_for(:download, downloaded_id: nil))).to_not be_valid
  end


end
