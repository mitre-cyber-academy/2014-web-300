require 'digest'
path = "../../Pics" #path to directory
Dir.entries(path).sort.each do |entry|
	if entry.chars.first != "."
		origin = File.basename(entry, File.extname(entry))
		newEntry = Digest::MD5.hexdigest(Digest::MD5.hexdigest(origin)) << ".jpeg" #remane file to MD5 Hash of LATITUDExLONGITUDExZOOM
		File.rename( "#{path}/#{entry}", "#{path}/#{newEntry}" )
		puts "Rename from " + origin + " to " + newEntry
	end
end