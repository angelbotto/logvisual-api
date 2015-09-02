require 'spec_helper'

RSpec.describe 'Logvisual::V1::AuthHelper' do
  pending 'add some examples to (or delete)' do
    let(:helpers) { Class.new }
    before { helpers.extend Logvisual::V1::AuthHelper }
    subject { helpers }

    it 'should return nil' do
      expect(subject.foo).to be_nil
    end
  end
end
