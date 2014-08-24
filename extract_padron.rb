require 'tabula'

files = Dir.glob "./input/*.pdf"

outfilename = "./output/padron_electoral.csv"
out = open(outfilename, 'w')

areas =  [
             [130,  30, 800, 210],
             [130, 210, 800, 390],
             [130, 390, 800, 570]
         ]
files.each do |file_name|
    print file_name
    extractor = Tabula::Extraction::ObjectExtractor.new(file_name, [1])
    extractor.extract.each do |pdf_page|
      page_areas = areas.map{ |area| pdf_page.get_area(area) }
      tables = page_areas.map{ |page_area| page_area.make_table({}) }

      tables.each do |table| 
        Tabula::Writers.CSV(table, out)
      end
    end
end

out.close
