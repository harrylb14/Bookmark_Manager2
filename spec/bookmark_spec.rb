require 'bookmark'
describe Bookmark do
  it 'shows a list of hardcoded bookmarks' do
    expect(Bookmark.all).to eq(["Facebook", "GitHub", "Makers"])
  end
end
