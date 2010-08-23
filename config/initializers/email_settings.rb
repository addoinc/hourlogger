begin
  unless test?
    if true
      ActionMailer::Base.delivery_method = :smtp
      ActionMailer::Base.smtp_settings = {
        :tls            => true,
        :address        => "smtp.gmail.com",
        :port           => 587,
        :domain         => "",
        :user_name      => "",
        :password       => "",
        :authentication => :plain
      }
      ActionMailer::Base.perform_deliveries = :true
      ActionMailer::Base.raise_delivery_errors = :true
      ActionMailer::Base.default_charset = "utf-8"
    end
  end
rescue => e
  # Rescue from the error raised upon first migrating
  # (needed to bootstrap the preferences).
  nil
end
