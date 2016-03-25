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


  describe '#truncated_body' do
    context 'when body have more then 100 chars' do
      let(:post) { create(:post, user:  create(:user) ) }
      it 'should return first 100 chars of body plus ...' do
        expect(post.truncated_body).to eq(post.body.first(100) + "...")
      end
    end
    context "when body don't have more then 100 chars" do
      let(:post) { create(:post, body: 'Some small body.', user: create(:user) ) }
      it 'should return complete body without ...' do
        expect(post.truncated_body).to eq(post.body)
      end
    end
  end

end
