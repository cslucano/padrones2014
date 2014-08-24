require 'open-uri'
f_dist_elec = File.open('./distritos_electorales.csv')
url_base = 'http://consultamiembrodemesa.onpe.gob.pe/pdf/'
f_dist_elec.each_line do |line|
  url = url_base + URI::encode(line.chomp)
  file_name = line.chomp
  file_name = file_name.gsub('/', '_')
  open('padrones/'+file_name, 'wb') do |file|
    begin
      file << open(url).read
    rescue Exception => e
      print 'failed : ' + file_name
      file.close
    end
  end
end
