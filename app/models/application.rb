class Application < ActiveRecord::Base
  validates_presence_of :firstname, :message => "Etunimi ei voi olla tyhjä"
  validates_presence_of :surename, :message => "Lastname ei voi olla tyhjä"
  validates_presence_of :street, :message => "Osoite ei voi olla tyhjä"
  validates_presence_of :zip, :message => "Postinumero ei voi olla tyhjä"
  validates_presence_of :city, :message => "Postitoimipaikka ei voi olla tyhjä"
  validates_presence_of :email, :message => "Sähköpostiosoite ei voi olla tyhjä"   


  def mail_for_sws
    result = []
    result << "Etunimi: #{firstname}" 
    result << "Sukunimi: #{surename}"
    result << "Osoite: #{street}"
    result << "Postinumero: #{zip}"
    result << "Postitoimipaikka: #{city}"
    result << "Sähköpostiosoite: #{email}"

    result << "Nuorisojäsen: #{born}" if born and not born.empty?
    result << "Puhelin GSM: #{phone}" if phone and not phone.empty?
    result << "Nimet: #{family}" if family and not family.empty?

    result.join("\n") 
  end 

  def mail_json
    {
      firstname: firstname,
      surename: surename,
      street: street,
      zip: zip,
      city: city,
      email: email
    }.to_json
  end
end
