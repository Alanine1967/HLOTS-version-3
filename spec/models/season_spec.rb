require 'spec_helper'

describe Season do
  it { should validate_presence_of(:number) }
  it { should validate_uniqueness_of(:number) }
  it { should validate_numericality_of(:number) }
  it { should validate_presence_of(:year) }
  it { should validate_numericality_of(:year) }
end
