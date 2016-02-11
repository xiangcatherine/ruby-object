require_relative '../lib/shape.rb'

context "Shape" do

  before(:context) do
    @shape = Shape.new(4, 10)
  end

  context "initialized in before(:context)" do

    describe ".num_sides" do
      it "is readable" do
        expect(@shape.num_sides).to eq(4)
      end
      it "is not editable" do
        expect{@shape.num_sides = 8}.to raise_error(NoMethodError)
      end
    end

    describe ".side_length" do
      it "is readable" do
        expect(@shape.side_length).to eq(10)
      end
      it "is writeable" do
        @shape.side_length = 25
        expect(@shape.side_length).to eq(25)
      end
    end

    describe ".color" do
      it "is writeable and readable" do
        @shape.color = "red"
        expect(@shape.color).to eq("red")
      end
    end

  end

  describe ".calculate_area" do
    it "should calculate area for a given side length" do
      expect(Shape.new(4,10).calculate_area.round(2)).to eq(100.00)
      expect(Shape.new(6,5).calculate_area.round(2)).to eq(64.95)
      expect(Shape.new(9,13).calculate_area.round(2)).to eq(1044.73)
    end
  end

end
