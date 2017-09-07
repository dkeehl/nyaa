require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test 'should get root' do
    get root_url
    assert_template 'torrents/index'
    assert_select 'div.pagination'
  end

end
