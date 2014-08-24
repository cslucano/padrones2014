require 'fileutils'

files = Dir.entries('.')
files.delete('.')
files.delete('..')

files.each do |file_name|
  if file_name.match(/.*pdf\..*/)
    new_file_name = file_name.gsub(/(.*)\.pdf\.(.*)/,'\1_\2_.pdf')

    FileUtils.mv(file_name, new_file_name)
  end
end
