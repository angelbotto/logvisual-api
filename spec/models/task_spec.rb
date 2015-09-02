require 'spec_helper'
require 'awesome_print'
RSpec.describe Task do
  before do
    @user = FactoryGirl.create(:user)
  end

  context 'Valid task' do
    it 'Create a valid task' do
      task = FactoryGirl.build(:task, user: @user)
      expect(task.save).to eql true
    end

    it 'Capture tasks' do
      task = FactoryGirl.create(:task,
                                content: 'Hello #world i am super #developer',
                                user: @user)
      expect(task.hashtags.size).to eql 2
    end
  end

  context 'Invalid task' do
    it 'Create a invalid task without content' do
      task = FactoryGirl.build(:task, content: nil, user: @user)
      expect(task.save).to eql false
    end

    it 'Create a invalid task without user' do
      task = FactoryGirl.build(:task)
      expect(task.save).to eql false
    end
  end
end
