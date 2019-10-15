require 'test_helper'

class ScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @score = scores(:one)
  end

  test "should get index" do
    get scores_url, as: :json
    assert_response :success
  end

  test "should create score" do
    assert_difference('Score.count') do
      post scores_url, params: { score: { game_id: @score.game_id, name: @score.name, points: @score.points } }, as: :json
    end

    assert_response 201
  end

  test "should show score" do
    get score_url(@score), as: :json
    assert_response :success
  end

  test "should update score" do
    patch score_url(@score), params: { score: { game_id: @score.game_id, name: @score.name, points: @score.points } }, as: :json
    assert_response 200
  end

  test "should destroy score" do
    assert_difference('Score.count', -1) do
      delete score_url(@score), as: :json
    end

    assert_response 204
  end
end
