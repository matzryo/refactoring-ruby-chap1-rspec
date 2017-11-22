require_relative '../lib/movie.rb'
require_relative '../lib/rental.rb'
require_relative '../lib/customer.rb'

RSpec.describe Customer do
  let(:movie_name) {"Matrix"}
  let(:movie) { Movie.new(movie_name, 0) }
  let(:days_rented) { 7 }
  let(:rental) { Rental.new(movie, days_rented) }
  let(:name) { "taro" }
  subject { Customer.new(name) }

  describe "#name" do
    it "名前を返す" do
      expect(subject.name).to eq name
    end
  end
  describe "#statement" do
    before do
      subject.add_rental rental
    end
    it "レンタル期間を返す" do
      STATE = "Rental Record for #{name}\n\t#{movie_name}\t9.5\nAmount owed is 9.5\nYou earned 1 frequent renter points"
      expect(subject.statement).to eq STATE
    end
  end
end
