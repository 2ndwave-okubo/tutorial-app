require "application_system_test_case"

class CommentaddsTest < ApplicationSystemTestCase
  setup do
    @commentadd = commentadds(:one)
  end

  test "visiting the index" do
    visit commentadds_url
    assert_selector "h1", text: "Commentadds"
  end

  test "creating a Commentadd" do
    visit commentadds_url
    click_on "New Commentadd"

    fill_in "User", with: @commentadd.user_id
    click_on "Create Commentadd"

    assert_text "Commentadd was successfully created"
    click_on "Back"
  end

  test "updating a Commentadd" do
    visit commentadds_url
    click_on "Edit", match: :first

    fill_in "User", with: @commentadd.user_id
    click_on "Update Commentadd"

    assert_text "Commentadd was successfully updated"
    click_on "Back"
  end

  test "destroying a Commentadd" do
    visit commentadds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Commentadd was successfully destroyed"
  end
end
