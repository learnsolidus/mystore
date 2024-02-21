require "application_system_test_case"

class HomepageTest < ApplicationSystemTestCase
  setup do
    @store = create(:store, name: "LearnSolidus Store", default: true)
  end

  test "homepage" do
    visit root_url
    assert_selector "h1", text: @store.name
  end
end
