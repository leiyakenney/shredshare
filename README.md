# Shred Share

Shred Share is a Ride Share app built to increase community engagement, help cut carbon emissions, and reduce traffic to and from the mountains. We hope you will consider using Shred Share on your next trip to the mountains and make some new friends along the way!

Shred Share is brought to you by:
- [Leiya Kenney](https://alumni.turing.io/alumni/leiya-kenney)
- [Nathan Thomas](https://alumni.turing.io/alumni/nathan-thomas)
- [Smitha Hosmani](https://alumni.turing.io/alumni/smitha-hosmani)
- [Kelly Sandeson](https://alumni.turing.io/alumni/kelly-sandeson)

Check out the Shred Share Repo [HERE](https://github.com/leiyakenney/shredshare)

Interact with Shred Share on Heroku [HERE](https://shred-share.herokuapp.com)

# Built Using
- Rails
- Ruby
- Google API
- PostgreSQL database
- Sinatra mico-service

Check out the Sinatra micro-service repo [HERE](https://github.com/nathangthomas/shredshare_microservice)

# Run Shred Share on your local machine
1. `$ git clone git@github.com:leiyakenney/shredshare.git`
2. `$ bundle`
3. `$ bundle exec figaro install` (Add your google_client_id and google_client_secret to ./config/application.yml for google OAuth)

```GOOGLE_CLIENT_ID: "<your Google Client ID>"
GOOGLE_CLIENT_SECRET: "<your Google Client Secret>"```

4. `$ bundle exec rspec install`
5. `$ rails db:{create,migrate}`
6. `$ rake import:rtd`
7. You can run test suite with `$ bundle exec rspec`
8. Start a local server with `$ rails s` and access Shred Share in your browser at localhost:3000
