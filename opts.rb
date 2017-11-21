require "optparse"
require "ostruct"

class BuilderOpts
  def self.parse(args)
    options = OpenStruct.new
    options.show_projects = false
    options.show_recommendations = false

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: builder.rb [options]"
      opts.separator ""
      opts.separator "Specific options:"

      opts.on("-p", "--[no-]show-projects", "Show projects") do |projects|
        options.show_projects = projects
      end

      opts.on("-r", "--[no-]show-recommendations", "Show recommendations") do |recom|
        options.show_recommendations = recom
      end

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(args)
    options
  end
end
