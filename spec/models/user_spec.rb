require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:received_followings) }

    it { should have_many(:sent_followings) }

    it { should have_many(:likes) }

    it { should have_many(:posts) }

    end

    describe "InDirect Associations" do

    it { should have_many(:leaders) }

    it { should have_many(:followers) }

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }
      
    end
end
