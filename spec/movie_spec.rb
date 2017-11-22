require_relative '../lib/movie.rb'

RSpec.describe Movie do
  let(:title) { "Matrix" }
  let(:price_code) { 0 }
  subject { Movie.new(title, price_code) }

  describe "#title" do
    it "タイトルを返す" do
      expect(subject.title).to eq title
    end
  end
  describe "#price_code" do
    it "価格コードを返す" do
      expect(subject.price_code).to eq price_code
    end
  end
end
