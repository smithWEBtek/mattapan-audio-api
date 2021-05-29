class AudioFileSerializer < ActiveModel::Serializer
  attributes :id,
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
end
