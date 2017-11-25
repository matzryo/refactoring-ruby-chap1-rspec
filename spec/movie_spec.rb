require_relative '../lib/movie.rb'

RSpec.describe Movie do
  let(:title) { "Matrix" }
  let(:price) { RegularPrice.new }
  subject { Movie.new(title, price) }

  describe "#title" do
    it "タイトルを返す" do
      expect(subject.title).to eq title
    end
  end
end
