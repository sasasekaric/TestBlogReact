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

  describe '.search' do
    let(:post) { create(:post, created_at: Time.zone.now - 1.day) }
    let(:post1) { create(:post, created_at: Time.zone.now - 1.minute) }
    let(:post2) { create(:post, title: post.title) }

    it 'should return correct posts' do
      expect(Post.search(:title, post.title)).to eq([post, post2])
      expect(Post.search(:body, post.body.first(10))).to eq([post])
    end
  end

  describe '#truncated_body' do
    context 'when body have more then 100 chars' do
      let(:post) { create(:post, body: Faker::Lorem.paragraph(30) , user:  create(:user) ) }
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
