require_relative '../lib/movie.rb'
require_relative '../lib/rental.rb'

RSpec.describe Rental do
  let(:price_code) { Movie::REGULAR }
  let(:movie) { Movie.new("Matrix", price_code) }
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
  describe "#charge" do
    context "一般"
      let(:price_code) { Movie::REGULAR }
      it "2日までは2、3日目以降は一日あたり1.5(ドル?)加えた数を返す" do
        expect(subject.charge).to eq (2 + (days_rented - 2) * 1.5)
      end
    context "新作" do
      let(:price_code) { Movie::NEW_RELEASE }
      it "日数 * 3(ドル?)を返す" do
        expect(subject.charge).to eq (days_rented * 3)
      end
    end
    context "子供向け" do
      let(:price_code) { Movie::CHILDRENS }
      it "3日までは1.5、4日目以降は一日あたり1.5(ドル?)加えた数を返す" do
        expect(subject.charge).to eq (1.5 + (days_rented - 3) * 1.5)
      end
    end
  end
  describe "#frequent_renter_points" do
    context "新作かつレンタル日数2日以上"
      let(:days_rented) { 2 }
      let(:price_code) { Movie::NEW_RELEASE }
      it "2を返す" do
        expect(subject.frequent_renter_points).to eq (2)
      end
    context "'新作かつレンタル日数2日以上'でない" do
      context "新作で1日レンタル" do
        let(:days_rented) { 1 }
        let(:price_code) { Movie::NEW_RELEASE }
        it "1を返す" do
          expect(subject.frequent_renter_points).to eq (1)
        end
      end
      context "一般で2日レンタル" do
        let(:days_rented) { 2 }
        let(:price_code) { Movie::REGULAR }
        it "1を返す" do
          expect(subject.frequent_renter_points).to eq (1)
        end
      end
    end
  end
end
