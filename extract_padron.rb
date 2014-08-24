require 'tabula'

files = Dir.glob "./input/*.pdf"

outfilename = "./output/padron_electoral.csv"
out = open(outfilename, 'w')

area_input =  [130, 30, 1300, 180]
files.each do |file_name|
    print file_name
    extractor = Tabula::Extraction::ObjectExtractor.new(file_name, :all)
    extractor.extract.each do |pdf_page|
      page_area = pdf_page.get_area(area_input)
      table = page_area.make_table({})
      Tabula::Writers.CSV(table, out)
    end
end

out.close
