require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test 'should get root' do
    get root_url
    assert_template 'torrents/index'
    assert_select 'div.pagination'

    Torrent.paginate(page: 1).each do |torrent|
      assert_select 'a[href=?]', torrent_path(torrent), text: torrent.name
    end

  end

  test 'should get torrent page' do
    torrent = Torrent.first
    get torrent_path(torrent)
    assert_template 'torrents/show'
  end

end
