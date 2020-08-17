class ProfilesController < ApplicationController
    before_action :authenticate_model!
  
    def show
      @profile = current_model.profile
    end
  
    def edit
        @profile = current_model.build_profile
    end

    def update
        @profile = current_model.build_profile
        if @profile.save
          redirect_to profile_path, notice: 'profile update'
        else
          flash.now[:error] = 'update error'
          render :edit
        end
      end
  
      private
      def profile_params
          params.require(:profile).permit(
            :nickname,
            :introduction,
            :avatar
          )
      end
  end