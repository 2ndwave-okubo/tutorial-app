require 'test_helper'

class CommentaddsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commentadd = commentadds(:one)
  end

  test "should get index" do
    get commentadds_url
    assert_response :success
  end

  test "should get new" do
    get new_commentadd_url
    assert_response :success
  end

  test "should create commentadd" do
    assert_difference('Commentadd.count') do
      post commentadds_url, params: { commentadd: { user_id: @commentadd.user_id } }
    end

    assert_redirected_to commentadd_url(Commentadd.last)
  end

  test "should show commentadd" do
    get commentadd_url(@commentadd)
    assert_response :success
  end

  test "should get edit" do
    get edit_commentadd_url(@commentadd)
    assert_response :success
  end

  test "should update commentadd" do
    patch commentadd_url(@commentadd), params: { commentadd: { user_id: @commentadd.user_id } }
    assert_redirected_to commentadd_url(@commentadd)
  end

  test "should destroy commentadd" do
    assert_difference('Commentadd.count', -1) do
      delete commentadd_url(@commentadd)
    end

    assert_redirected_to commentadds_url
  end
end
