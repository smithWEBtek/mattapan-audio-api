def load_audio_files
  csv_text = File.read(Rails.root.join("lib", "audio_files.csv"))
  csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
  csv.each do |row|
    audio_file = AudioFile.new(
      interviewee: row["interviewee"],
      url: row["url"],
      title: row["title"],
      location_description: row["location_description"],
      file_description: row["file_description"],
      street_number: row["street_number"],
      street_name: row["street_name"],
      city: row["city"],
      state: row["state"],
      postal_code: row["postal_code"],
      geocode: [row["lat"],row["lng"]].join,
      address_string: row["address_string"]
    )
    audio_file.save
    print "*"
  end
end

def truncate_database
  puts "truncate_audio_files_table ------------------------------------"
  AudioFile.all.each { |file| file.delete }
  ActiveRecord::Base.connection.reset_pk_sequence!("audio_files")
end

def main
  truncate_database
  load_audio_files
end

main
