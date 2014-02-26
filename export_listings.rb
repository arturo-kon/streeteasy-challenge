class ExportListings
  def initialize(file_name, data)
    @file_name = file_name
    @data = data
    export
  end

  def export
    File.open(@file_name,"w") do |f|
      f.write(@data.to_json)
    end
  end
end
