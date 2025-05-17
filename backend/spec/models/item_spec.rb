require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "associations" do
    it { should have_many(:item_parts).dependent(:destroy) }
    it { should have_many(:all_item_parts).class_name('ItemPart').dependent(:destroy) }
  end
end
