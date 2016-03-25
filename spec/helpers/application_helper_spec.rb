require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#bootstrap_class_for' do
    it 'should return correct class' do
      expect(helper.bootstrap_class_for 'success').to eq('alert-success')
      expect(helper.bootstrap_class_for 'error').to eq('alert-danger')
      expect(helper.bootstrap_class_for 'alert').to eq('alert-warning')
      expect(helper.bootstrap_class_for 'notice').to eq('alert-info')
    end
    it 'should return correct class when passing symbol' do
      expect(helper.bootstrap_class_for :success).to eq('alert-success')
      expect(helper.bootstrap_class_for :error).to eq('alert-danger')
      expect(helper.bootstrap_class_for :alert).to eq('alert-warning')
      expect(helper.bootstrap_class_for :notice).to eq('alert-info')
    end
    it 'should return passed arg when no class is found' do
      expect(helper.bootstrap_class_for 'something').to eq('something')
    end
  end

end
