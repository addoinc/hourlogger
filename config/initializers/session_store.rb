# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hourlooger_session',
  :secret      => '2d12a707a1c4c79d72c636b68c27e9266dd9e2e6e67248e6356f55e2bf7898ae98347f53bb51ca0a63332b8603801d268ca398d6a272804375257f259ca5a7e9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
