require "test_helper"

class UserPokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_pokemon = user_pokemons(:one)
  end

  test "should get index" do
    get user_pokemons_url, as: :json
    assert_response :success
  end

  test "should create user_pokemon" do
    assert_difference('UserPokemon.count') do
      post user_pokemons_url, params: { user_pokemon: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show user_pokemon" do
    get user_pokemon_url(@user_pokemon), as: :json
    assert_response :success
  end

  test "should update user_pokemon" do
    patch user_pokemon_url(@user_pokemon), params: { user_pokemon: {  } }, as: :json
    assert_response 200
  end

  test "should destroy user_pokemon" do
    assert_difference('UserPokemon.count', -1) do
      delete user_pokemon_url(@user_pokemon), as: :json
    end

    assert_response 204
  end
end
