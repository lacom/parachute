require 'spec_helper'

describe User do
  
  it "is valid with a first_name, last_name and email" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a first_name" do
    expect(build(:user, first_name: nil)).to have(1).errors_on(:first_name)
  end

  it "is invalid without a last_name" do
    expect(build(:user, last_name: nil)).to have(1).errors_on(:last_name)
  end

  it "is invalid without an email" do
    expect(build(:user, email: nil)).to have(1).errors_on(:email)
  end

  describe "return user's full name" do

    context "correctly capitalized letters" do
      it "returns user's full name as a string" do
        user = build(:user,
          first_name: "Tony",
          last_name: "Stark")
        expect(user.name).to eq "Tony Stark"
      end
    end

    context "incorrectly capitalized letters" do
      it "returns user's full name as a string" do
        user = build(:user,
          first_name: "Tony",
          last_name: "stark")
        expect(user.name).to eq "Tony Stark"
      end    
    end
  
  end
end