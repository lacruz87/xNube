class ServiciosController < ApplicationController
   require 'nokogiri'
  require 'open-uri'

  def descargar_stocks
  	Inventario.delete_all

  	url = "http://qad-prod.watts.cl/cgi-bin/wspd_cgi.sh/WService=ws-default/webspeed/xxplnexec.p?domain=DIWATTS&program=stk&user=excel&format=xml"
	xml = Nokogiri::XML(open(url))

	lines = xml.search('line').map do |line|
		%w[
		part site site_desc loc lot ref loc_des create expire qty_oh qty_all status
		].each_with_object({}) do |n, o|
			o[n] = line.at(n).text
		end
	end

	i=1
	lines.each do |x|
		inventario = Inventario.new(x)
		inventario.ln=i
		inventario.save
		i=i+1
	end


  end
  def index1

  end

  def view_xml
  	inv=Inventario.where("cast(part as INTEGER)>?",900000)

	builder = Nokogiri::XML::Builder.new do |xml|
	  xml.xml {
	    xml.stk {
	  inv.each do |x|
	      xml.line("ln" => x.ln){
	        xml.part x.part
	        xml.site x.site
	        xml.site_desc x.site_desc
	        xml.loc x.loc
	        xml.lot x.lot
	        xml.ref x.ref
	        xml.loc_des x.loc_des
	        xml.create x.create
	        xml.expire x.expire
	        xml.qty_oh x.qty_oh
	        xml.qty_all x.qty_all
	        xml.status x.status
	      }
	  end
	    }
	  }

	end
	render xml:builder.to_xml
  end

end
