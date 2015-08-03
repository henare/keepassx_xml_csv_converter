require "csv"
require "cgi"

input_file_path = ARGV[0]
output_file_path = ARGV[1]

def escape(string)
  CGI.escapeHTML(string) if string
end

output = <<-END
<!DOCTYPE KEEPASSX_DATABASE>
<database>
 <group>
  <title>Imported passwords</title>
  <icon>1</icon>
END

CSV.foreach(input_file_path, headers: true) do |item|
  output += "
  <entry>
   <title>#{escape item["name"]}</title>
   <username>#{escape item["username"]}</username>
   <password>#{escape item["password"]}</password>
   <url>#{escape item["url"]}</url>
   <comment>#{escape item["extra"]}</comment>
   <icon>1</icon>
   <expire>Never</expire>
  </entry>"
end

output += <<-END
 </group>
</database>
END

File.open(output_file_path, "w") { |f| f << output }

puts "All done. I converted #{input_file_path} to #{output_file_path}."
