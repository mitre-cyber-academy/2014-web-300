require 'digest'
path = "" #path to directory
Dir.entries(path).sort.each do |entry|
	if entry.chars.first != "."
		origin = File.basename(entry, File.extname(entry))
		newEntry = Digest::MD5.hexdigest(origin.gsub("pano_adams_Library_450px [www.imagesplitter.net]-", '').gsub('-','x') << "x0") << ".jpeg" #remane file to MD5 Hash of LATITUDExLONGITUDExZOOM
		File.rename( "#{path}/#{entry}", "#{path}/#{newEntry}" )
		puts "Rename from " + origin + " to " + newEntry
	end
end