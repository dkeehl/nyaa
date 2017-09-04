require 'test_helper'

class TorrentTest < ActiveSupport::TestCase

  def setup
    @category = categories(:anime)
    @sub_category = sub_categories(:raw)
    @status = status(:normal)
    @torrent = Torrent.new(name: 'Calabash Brothers',
                           torrent_hash: 'aaaaaaaaaaaaaa',
                           category_id: @category.id,
                           sub_category_id: @sub_category.id,
                           status_id: @status.id,)
  end

  test 'should be valid' do
    assert @torrent.valid?
  end

  test 'should validate name' do
    @torrent.name = ''
    assert_not @torrent.valid?
  end

  test 'should validate hash' do
    @torrent.torrent_hash = ''
    assert_not @torrent.valid?
  end

  test 'should validate category' do
    @torrent.category_id = nil
    assert_not @torrent.valid?
  end

  test 'should validate sub_category' do
    @torrent.sub_category = nil
    assert_not @torrent.valid?
  end

  test 'should validate status' do
    @torrent.status_id = nil
    assert_not @torrent.valid?
  end

  test 'should have a category, a sub_category and status' do
    @torrent.save
    assert_equal @category.name, @torrent.category.name
    assert_equal @sub_category.name, @torrent.sub_category.name
    assert_equal @status.name, @torrent.status.name
  end

end

