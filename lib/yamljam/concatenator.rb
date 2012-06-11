module Yamljam
	class Concatenator
		def concatenate(input_files, output_file)
      output_hashmap = input_files.map{|input_file| make_hashmap(input_file)}.reduce({}, &:merge)
    	File.open(output_file, 'w') do |f|
    		f.puts("# Generated by Yamljam. Do not directly edit this file.")
    		f.write(output_hashmap.to_yaml)
  		end 
		end

    def make_hashmap(input_file)
      base_hashmap = YAML::load_file(input_file)
      return {input_file.to_sym => base_hashmap}
    end

    def jam(input_directory_path = nil, namespace)
      # input directory will contain #{namespace}.yml (output file, which will be blown away)
      # and a directory called #{namespace}. All files in the #{namespace} directory will be
      # assumed to be yaml input files if they end in .yml or .yaml, and ignored otherwise.
      input_directory_path ||= Dir.getwd
      input_file_dir = File.join(input_directory_path, namespace)
      Dir.chdir(input_file_dir) do
        input_files = Dir.glob("*.yaml") + Dir.glob("*.yml")
        concatenate(input_files, File.join("..", "#{namespace}.yml"))
      end
    end
  end
end