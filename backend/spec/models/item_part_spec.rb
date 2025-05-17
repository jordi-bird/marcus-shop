require 'rails_helper'

RSpec.describe ItemPart, type: :model do
  describe "associations" do
    it { should belong_to(:item) }
    it { should belong_to(:parent).class_name('ItemPart').optional }
    it { should have_many(:children).class_name('ItemPart').with_foreign_key(:parent_id).dependent(:destroy) }
    it { should have_many(:item_part_attributes).dependent(:destroy) }
  end
end
