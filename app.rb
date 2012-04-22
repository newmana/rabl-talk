ActiveRecord::Base.connection_pool.with_connection do
  get "/properties" do
    process_properties
  end

  post "/properties" do
    process_properties
  end
end

def process_properties
  command = params[:command]
  parcel_ids = params[:parcel_ids]
  plan_no = params[:plan_no]
  if !command.nil? && command.upcase == "INTERSECTS"
    feature = params[:feature]
    common_property = params[:search_common_property]
    intersects(feature, common_property)
  elsif !parcel_ids.nil?
    parcel_ids(parcel_ids)
  elsif !plan_no.nil?
    property(plan_no)
  else
    no_properties
  end
end

def intersects(feature, common_property)
  common_property.downcase unless common_property.nil?
  @properties = Property.intersects(feature, common_property.eql?('true'))
  if (@properties.length == 0 || @properties.length > 999)
    response.status = 500
    @error = "No properties found" if @properties.length == 0
    @error = "Too many parcels - please reduce your search area"  if @properties.length > 999
    render :rabl, :error, :format => "json"
  else
    render :rabl, :property, :format => "json"
  end
end

def parcel_ids(parcel_ids)
  @geom = Property.parcel_ids(parcel_ids)
  @parcel_ids = nil
  @parcel_ids = parcel_ids unless @geom.first.text_geom.nil?
  render :rabl, :geom, :format => "json"
end

def property(plan_no)
  @properties = Property.where(:plan_no => plan_no)
  render_property
end

def no_properties
  @properties = []
  render_property
end

private

def render_property
  render :rabl, :property, :format => "json"
end

