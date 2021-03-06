OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
      {:scope => 'email,user_birthday,user_location,user_actions.music,public_profile,user_friends',
      :info_fields => 'id, name, first_name, middle_name,last_name, age_range, link, gender, locale, timezone, updated_time, verified, email, birthday, location', :display => 'popup',:client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
end