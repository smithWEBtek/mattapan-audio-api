class CreateAudioFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_files do |t|
      t.string :interviewee
			t.string :url
			t.string :title
			t.string :location_description
			t.string :file_description
			t.string :street_number
			t.string :street_name
			t.string :city
			t.string :state
			t.string :postal_code
			t.string :geocode
			t.string :address_string
      t.timestamps
    end
  end
end
