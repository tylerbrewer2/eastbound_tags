class PlayersController < ApplicationController
  before_action :set_player, only: %i[ edit update destroy ]

  # GET /players/new
  def new
    @round_id = params[:round_id]
    @player = Player.new
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        round = Round.find(@player.round_id)
        format.html { redirect_to round, notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /players/1/edit
  def edit
    @round_id = params[:round_id]
  end

  # PATCH/PUT /rounds/1 or /rounds/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        round = Round.find(@player.round_id)
        format.html { redirect_to round, notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to round_url(@player.round_id), notice: "Player was successfully removed." }
      format.json { head :no_content }
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :tag_in, :tag_out, :score, :round_id)
  end
end
