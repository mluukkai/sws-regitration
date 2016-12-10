class Application < ActiveRecord::Base
  validates_presence_of :firstname, :message => "Etunimi ei voi olla tyhjä"
  validates_presence_of :surename, :message => "Lastname ei voi olla tyhjä"
  validates_presence_of :street, :message => "Osoite ei voi olla tyhjä"
  validates_presence_of :zip, :message => "Postinumero ei voi olla tyhjä"
  validates_presence_of :city, :message => "Postitoimipaikka ei voi olla tyhjä"
  validates_presence_of :email, :message => "Sähköpostiosoite ei voi olla tyhjä"    
end