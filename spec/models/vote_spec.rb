  require 'rails_helper'
 
describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect ( @vote.valid ).to eq(-1)
        expect ( @vote.valid ).to eq(1) 
      end
    end
  end
end