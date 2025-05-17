require 'rails_helper'

RSpec.describe ItemPartAttribute, type: :model do
  describe "associations" do
    it { should belong_to(:item_part) }
    it { should have_many(:item_part_attribute_options).dependent(:destroy) }
  end
end
