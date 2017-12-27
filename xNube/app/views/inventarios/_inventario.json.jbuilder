json.extract! inventario, :id, :ln, :part, :site, :site_desc, :loc, :lot, :ref, :loc_des, :create, :expire, :qty_oh, :qty_all, :status, :created_at, :updated_at
json.url inventario_url(inventario, format: :json)
