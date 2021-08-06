class Api::V1::PokemonMovesController < ApplicationController
  before_action :set_pokemon_move, only: [:show, :update, :destroy]

  # GET /pokemon_moves
  def index
    @pokemon_moves = PokemonMove.all

    render json: @pokemon_moves
  end

  # GET /pokemon_moves/1
  def show
    render json: @pokemon_move
  end

  # POST /pokemon_moves
  def create
    @pokemon_move = PokemonMove.new(pokemon_move_params)

    if @pokemon_move.save
      render json: @pokemon_move, status: :created, location: @pokemon_move
    else
      render json: @pokemon_move.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemon_moves/1
  def update
    if @pokemon_move.update(pokemon_move_params)
      render json: @pokemon_move
    else
      render json: @pokemon_move.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemon_moves/1
  def destroy
    @pokemon_move.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_move
      @pokemon_move = PokemonMove.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_move_params
      params.fetch(:pokemon_move, {})
    end
end
