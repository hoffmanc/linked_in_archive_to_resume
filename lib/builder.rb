require "haml"
require "csv"
require "builder_opts"
require "fileutils"

class Builder
  def self.call(argv)
    @options = BuilderOpts.parse(argv)

    @profile = CSV.open("Profile.csv", headers: true).readlines.first

    CSV.open("Email Addresses.csv", headers: true).each do |row|
      if row["Primary"] == "Yes"
        @primary_email = row["Email Address"]
      end
    end

    @experience_rows = CSV.open("Positions.csv", headers: true).readlines.map do |row|
      row["Description"] = row["Description"].gsub(/\n+/, "</p><p>")
      row
    end
    @project_rows = CSV.open("Projects.csv", headers: true).readlines.sort_by do |row|
      Date.strptime(row["Start Date"], "%b %Y")
    end.reverse
    @education_rows = CSV.open("Education.csv", headers: true).readlines
    recommendation_rows = CSV.open("Recommendations Received.csv", headers: true).readlines
    @recommendations_hash = {}
    recommendation_rows.each do |row|
      if @recommendations_hash[row["Company"]].nil?
        @recommendations_hash[row["Company"]] = []
      end
      @recommendations_hash[row["Company"]] << row
    end

    template_path = File.join(File.dirname(__FILE__),"template.haml")
    engine = Haml::Engine.new(open(template_path).read)
    File.open("resume.html","w") do |ofile|
      ofile.puts engine.render(self)
    end
    styles = File.join(File.dirname(__FILE__),"..","assets","*")
    FileUtils.cp(Dir.glob(styles), ".")
  end
end
