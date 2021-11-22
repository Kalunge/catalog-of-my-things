require_relative '../book'

describe 'Book' do
  before :each do
    @book = Book.new(cover_state: 'bad', publisher: 'longhorn', publish_date: 2020)
  end

  describe 'can archived' do
    it 'returns true when coverstate' do
      expect(@book.can_be_archived?).to be(true)
    end
  end
end
