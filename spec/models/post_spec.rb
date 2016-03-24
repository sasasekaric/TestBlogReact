require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user)  {build(:user)}
  let(:post)  {build(:post, user: user)}

  it 'should have valid factory' do
    expect(post).to be_valid
  end

  it { should belong_to :user }
  it { should validate_presence_of :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }




end
