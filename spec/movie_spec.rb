require_relative '../movie'

describe Movie do
    before(:each) do
        @movie = Movie.new(publish_date: '2020-10-10', silet: false, archived: true)
    end

    it 'shows instance of Movie class' do
        expect(@movie).to be_instance_of Movie
    end

    it 'show inheritance from person class' do
        expect(@movie).to be_kind_of Item
    end

    it 'verifies can_be_archived? method return false' do
        expect(@movie.can_be_archived?).to be false
    end

    it 'verifies can_be_archived? method return true' do
        movie = Movie.new(publish_date: '2020-10-10', silet: true, archived: true)
        expect(movie.can_be_archived?).to be true
    end
end