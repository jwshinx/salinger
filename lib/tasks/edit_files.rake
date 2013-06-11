namespace :joel do

 desc "rake joel:new_line_of text...go open file to see examples"
 task :new_line_of_text do
  # rake joel:new_line_of_text old='regex' new='new_old' add='line' dir='app/models/**/*.rb' "
  # rake joel:new_line_of_text old='\.field' new='.field' add='-----' dir='app/views/**/*.rb' "
  # rake joel:new_line_of_text old='\.field$' new='.field' add='.width_medium' dir='app/views/**/_form.html.haml'
  begin
   puts "\n\n---> Starting.\n"
   old_regex = ENV['old']
   new_string = ENV['new']
   add_string = ENV['add']
   directory = ENV['dir']
   puts "---> Replacing [#{old_regex}] with [#{new_string}] and [#{add_string}] in [#{directory}]."
   Dir[Rails.root + directory].each do |path_filename|
    begin
     file = File.read(path_filename)
     new_content = file.gsub!(/#{old_regex}/, new_string+"\n#{add_string}")
     if new_content
      puts "--->    #{old_regex} replaced! in #{path_filename}"
      File.open(path_filename, 'w') { |io| io.write new_content }
     else
      puts "--->    #{old_regex} not found in #{path_filename}"
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
