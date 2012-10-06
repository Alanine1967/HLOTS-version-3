require 'spec_helper'

describe 'visiting the homepage' do
  before do
    pending
    visit '/'
  end

  it 'should have a body' do
    page.should have_css('body')    
  end
end
