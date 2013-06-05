namespace :joel do
 desc "Old with New -- rake joel:replace_text old='o of' new='a ok' dir='app/models/**/*.rb' "
 task :replace_text do 
  begin
   puts "\n\n---> Starting.\n"
   old_string = ENV['old'] 
   new_string = ENV['new'] 
   directory = ENV['dir']
   puts "---> Replacing [#{old_string}] with [#{new_string}] in [#{directory}]."
   Dir[Rails.root + directory].each do |path_filename|
    begin
     file = File.read(path_filename)
     new_content = file.gsub!(/#{old_string}/, new_string)
     if new_content
      puts "--->    #{old_string} replaced! in #{path_filename}"
      File.open(path_filename, 'w') { |io| io.write new_content }
     else
      puts "--->    #{old_string} not found in #{path_filename}"
     end
    rescue Exception => e
     puts "---> Exception. File edit failed: #{e.inspect}."
    end
   end
   puts "\n---> Ending.\n\n"

  rescue Exception => e
   puts "---> Exception. Task not performed: #{e.inspect}."
  end
 end
end
