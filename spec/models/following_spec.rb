require 'rails_helper'

RSpec.describe Following, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:sender) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
