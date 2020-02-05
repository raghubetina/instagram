require 'rails_helper'

RSpec.describe Post, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    it { should have_many(:likes) }

    end

    describe "InDirect Associations" do

    it { should have_many(:fans) }

    end

    describe "Validations" do

    it { should validate_presence_of(:image) }
      
    end
end
