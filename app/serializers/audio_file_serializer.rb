class AudioFileSerializer < ActiveModel::Serializer
  attributes :id,
    :interviewee,
    :url,
    :title,
    :location_description,
    :file_description,
    :street_number,
    :street_name,
    :city,
    :state,
    :postal_code,
    :geocode,
    :address_string
end
