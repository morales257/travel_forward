require 'rails_helper'

RSpec.describe Credit, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  let(:user) {FactoryGirl.create(:user)}

  it "has credits" do
    expect(user.create_credit(attributes_for(:credit))).to be_valid
  end
end
