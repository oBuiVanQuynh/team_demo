class TeamsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy,:index]
	before_action :correct_user, only: :destroy
	def index
		@teams = Team.paginate(page: params[:page], per_page: 3)
	end
	def create
		@team = current_user.teams.build(team_params)
		if @team.save
			flash[:success] = "Create team success"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end
	def destroy
		@team.destroy
		redirect_to root_url
	end
	private

    def team_params
      params.require(:team).permit(:name)
    end
    def correct_user
      @team = current_user.teams.find_by(id: params[:id])
      redirect_to root_url if @team.nil?
    end
end