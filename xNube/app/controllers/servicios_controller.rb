class ServiciosController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def index
  	@fecha=Inventario.first.created_at
  end

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

	@out_put='{"status":"ok"}'  
    render :json=>@out_put  


  end

  def view_xml
  	#inv=Inventario.where("cast(part as INTEGER)>?",900000)
  	excep_part=Excep.all
  	#inv_part=Inventario.select(:part)
  	inv=Inventario.where('part NOT IN (?)',excep_part.map(&:part))

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

  def borrar_bd_excep
  	#Fletero2.delete_all
  	@out_put='{"status":"ok"}'  
    render :json=>@out_put  
  end

  def agregar_excep

    #@fletero2 = Fletero2.new(fletero2_params)
#
 #     if @fletero2.save
  #        @out_put="["+@fletero2.to_json+"]"          
   #       render :json=>@out_put
    #  else
	#	    render :json=>@fletero2.errors
     # end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def excep_params
      params.permit(:fletero, :Estado, :anden)
    end


end
