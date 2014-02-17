require 'spec_helper'

describe Post do
  it "is valid with a title, body, and user_id" do
    expect(build(:post)).to be_valid
  end

  it "is invalid without a title" do
    expect(build(:post, title: nil)).to have(1).errors_on(:title)
  end

  it "is invalid without a body" do
    expect(build(:post, body: nil)).to have(1).errors_on(:body)
  end

  it "is invalid without a user_id" do
    expect(build(:post, user_id: nil)).to have(1).errors_on(:user_id)
  end

  it "returns a capitalized title as a string" do
    post = build(:post, title: 'New stuff please!')
    expect(post.pretty_title).to eq 'New Stuff Please!'
  end

  it "returns a user object" do
    user = create(:user)
    expect(build(:post, user: user).user).to eq user
  end
end