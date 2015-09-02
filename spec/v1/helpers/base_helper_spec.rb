require 'spec_helper'

RSpec.describe 'Logvisual::V1::BaseHelper' do
  pending 'add some examples to (or delete)' do
    let(:helpers) { Class.new }
    before { helpers.extend Logvisual::V1::BaseHelper }
    subject { helpers }

    it 'should return nil' do
      expect(subject.foo).to be_nil
    end
  end
end
