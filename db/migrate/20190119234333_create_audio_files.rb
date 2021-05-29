class CreateAudioFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_files do |t|
      t.string :interviewee
			t.string :headline
			t.string :description
			t.string :url
			t.string :location
      t.string :lat
      t.string :lng
			t.string :geocode
			t.string :street_number
			t.string :street_name
			t.string :city
			t.string :state
			t.string :postal_code
			t.string :address_string
      t.boolean :approved

      t.timestamps
    end
  end
end
