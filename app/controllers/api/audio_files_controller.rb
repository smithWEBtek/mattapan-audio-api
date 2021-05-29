class Api::AudioFilesController < ApplicationController
	before_action :set_audio_file, only: [:show, :update, :destroy]

	def index
		@audio_files = AudioFile.all
		render json: @audio_files
	end

	def show
		render json: @audio_file
	end

	def create
		@audio_file = AudioFile.new(audio_file_params)
		@audio_file.address_string
		if @audio_file.save
			render json: @audio_file
		else
			render json: {message: "AudioFile NOT created.", params_received: params}
		end
	end

	def update
		if @audio_file.update(audio_file_params)
			render json: @audio_file
		else
			render json: {message: "AudioFile NOT updated.", params_received: params}
		end
	end

	def destroy
		@audio_file.delete
		render json: {message: "AudioFile deleted.", params_received: params}
	end

	def markers
		@audio_files = AudioFile.all.select{|v| !v.geocode.nil? }
		if @audio_files.count == 0
			render json: {message: "no audio_file locations yet"}
		else
			render json: @audio_files 
		end
	end

	private
		def set_audio_file
			@audio_file = AudioFile.find_by(id: params[:id])
			render json: @audio_file
		end

		def audio_file_params
			params.require(:audio_file).permit(
        :interviewee,
        :headline,
        :description,
        :url,
        :location,
        :street_number,
        :street_name,
        :city,
        :state,
        :postal_code,
        :geocode,
        :address_string,
        :approved
      )
		end
end
	