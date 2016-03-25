require 'rails_helper'

describe UserParamsSanitizer do

  context "for :sign_up" do
    let(:params) do
      ActionController::Parameters.new(user:
        {
          email:          'someone@me.com',
          name: 'username',
          password:       'password',
          password_confirmation: 'password',
          remember_me:    true,
          to_be_filtered: 'meow',
          admin: true,
          role: 'admin'
        })
    end
    let(:expected_params) do
      {
        email:          'someone@me.com',
        name: 'username',
        password:       'password',
        password_confirmation: 'password',
      }
    end
    let(:sanitizer) do
      UserParamsSanitizer.new(User, :user, params)
    end

    subject { sanitizer.sanitize(:sign_up) }
    it { should eq(expected_params.with_indifferent_access) }
  end

  context "for :account_update" do
    let(:params) do
      ActionController::Parameters.new(user:
        {
          email:          'someone@me.com',
          name: 'username',
          password: 'newpassword',
          password_confirmation: 'newpassword',
          current_password: 'password',
          remember_me:    true,
          to_be_filtered: 'meow',
          admin: true,
          role: 'admin'
        })
    end
    let(:expected_params) do
      {
        email:          'someone@me.com',
        name: 'username',
        password: 'newpassword',
        password_confirmation: 'newpassword',
        current_password: 'password'
      }
    end
    let(:sanitizer) do
      UserParamsSanitizer.new(User, :user, params)
    end

    subject { sanitizer.sanitize(:account_update) }
    it { should eq(expected_params.with_indifferent_access) }
  end
end
