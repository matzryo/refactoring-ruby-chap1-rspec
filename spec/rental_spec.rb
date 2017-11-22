require_relative '../lib/movie.rb'
require_relative '../lib/rental.rb'

RSpec.describe Rental do
  let(:movie) { Movie.new("Matrix", 0) }
  let(:days_rented) { 7 }
  subject { Rental.new(movie, days_rented) }

  describe "#movie" do
    it "Movieを返す" do
      expect(subject.movie).to eq movie
    end
  end
  describe "#days_rented" do
    it "レンタル期間を返す" do
      expect(subject.days_rented).to eq days_rented
    end
  end
end
