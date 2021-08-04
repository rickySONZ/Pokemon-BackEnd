require "test_helper"

class PokemonMovesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon_move = pokemon_moves(:one)
  end

  test "should get index" do
    get pokemon_moves_url, as: :json
    assert_response :success
  end

  test "should create pokemon_move" do
    assert_difference('PokemonMove.count') do
      post pokemon_moves_url, params: { pokemon_move: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show pokemon_move" do
    get pokemon_move_url(@pokemon_move), as: :json
    assert_response :success
  end

  test "should update pokemon_move" do
    patch pokemon_move_url(@pokemon_move), params: { pokemon_move: {  } }, as: :json
    assert_response 200
  end

  test "should destroy pokemon_move" do
    assert_difference('PokemonMove.count', -1) do
      delete pokemon_move_url(@pokemon_move), as: :json
    end

    assert_response 204
  end
end
