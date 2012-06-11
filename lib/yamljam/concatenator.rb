module Yamljam
	class Concatenator
		def concatenate(input_files, output_file)
      output_hashmap = merge_files(input_files)
      write_output(output_hashmap, output_file)
    end

    def write_output(output_hashmap, output_file)
    	File.open(output_file, 'w') do |f|
    		f.puts("# Generated by Yamljam. Do not directly edit this file.")
    		f.write(output_hashmap.to_yaml)
  		end
    rescue Exception => ex # if it's any solace I cringed when I wrote that
      puts "hit exception when writing output file! #{ex.class} #{ex.message} #{ex.backtrace}"
      raise ex
		end

    def merge_files(input_files)
      {@namespace => input_files.map{|input_file| make_hashmap(input_file)}.reduce({}, &:merge)}
    end

    def make_hashmap(input_file)
      base_hashmap = YAML::load_file(input_file)
    end

    def jam(input_directory_path = nil, namespace)
      # input directory will contain #{namespace}.yml (output file, which will be blown away)
      # and a directory called #{namespace}. All files in the #{namespace} directory will be
      # assumed to be yaml input files if they end in .yml or .yaml, and ignored otherwise.
      @namespace = namespace
      input_directory_path ||= Dir.getwd
      input_file_dir = File.join(input_directory_path, namespace)
      Dir.chdir(input_file_dir) do
        input_files = Dir.glob("*.yaml") + Dir.glob("*.yml")
        concatenate(input_files, File.join("..", "#{namespace}.yml"))
      end
    end
  end
end