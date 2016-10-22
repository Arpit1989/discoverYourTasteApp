OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1097370130305460', 'd0333330f534fbd79848c607a62aee57',
      :scope => 'email,user_birthday,user_location,user_actions.music,public_profile,user_friends',
      :info_fields => 'id, name, first_name, middle_name,last_name, age_range, link, gender, locale, timezone, updated_time, verified, email, birthday, location', :display => 'popup'
end