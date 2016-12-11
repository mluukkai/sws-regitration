class MailWorker
  include Sidekiq::Worker

  def perform(id)
    application = Application.find(id)
    puts "async worker\n"*5
    email_url = 'http://sws-app.herokuapp.com'
    resp = HTTParty.post("#{email_url}/confirmations", 
      body: application.mail_json,
      headers: { "ContentType"=>"application/json"}, 
      basic_auth: { username: ENV['USER'], password: ENV['PASSWORD'] }
    )
    puts resp.parsed_response
  end
end