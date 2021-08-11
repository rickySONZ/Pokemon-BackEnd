class Api::V1::UserPokemonsController < ApplicationController
  before_action :set_user_pokemon, only: [:show, :update, :destroy]

  # GET /user_pokemons
  def index
    @user_pokemons = UserPokemon.all

    render json: @user_pokemons
  end

  # GET /user_pokemons/1
  def show
    render json: @user_pokemon
  end

  # POST /user_pokemons
  def create
    
    @user_pokemon = UserPokemon.new(user_id: params[:user_id], pokemon_id: params[:pokemon_id])
    
    
    if @user_pokemon.save
      render json: @user_pokemon, status: :created
    else
      render json: @user_pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_pokemons/1
  def update
    if @user_pokemon.update(user_pokemon_params)
      render json: @user_pokemon
    else
      render json: @user_pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_pokemons/1
  def destroy
    @user_pokemon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_pokemon
      @user_pokemon = UserPokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_pokemon_params
      params.fetch(:user_pokemon, {})
    end
end
