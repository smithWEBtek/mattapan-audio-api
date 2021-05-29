def load_audio_files
  csv_text = File.read(Rails.root.join("lib", "audio_files.csv"))
  csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
  csv.each do |row|
    geocode = nil

    if row["lat"].split('')[0].to_i != 0
      geocode = [row["lat"],row["lng"]].join
    end

    audio_file = AudioFile.new(
      interviewee: row["interviewee"],
      headline: row["headline"],
      description: row["description"],
      url: row["url"],
      location: row["location"],
      street_number: row["street_number"],
      street_name: row["street_name"],
      city: row["city"],
      state: row["state"],
      postal_code: row["postal_code"],
      geocode: geocode,
      address_string: row["address_string"],
      approved: row["approved"]
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
