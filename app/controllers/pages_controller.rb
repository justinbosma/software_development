class PagesController < ApplicationController
  def home
    @microsites = Microsite.all
    @sites = Microsite.all.collect{|m| m.site}.uniq.sort
    @country = Microsite.all.collect{|m| m.country}.uniq.sort
    @state_province = Microsite.all.collect{|m| m.state_province}.uniq.sort
    @zone = Microsite.all.collect{|m| m.zone}.uniq.sort
    @sub_zone = Microsite.all.collect{|m| m.sub_zone}.uniq.sort
    @hash = Gmaps4rails.build_markers(@microsites) do |microsite, marker|
      marker.lat microsite.field_lat
      marker.lng microsite.field_lon
    end
  end
end
