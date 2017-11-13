#!/usr/bin/env ruby -w

require "rubygems"
require "haml"
require "csv"

@profile = CSV.open("data/Profile.csv", headers: true).readlines.first

CSV.open("data/Email Addresses.csv", headers: true).each do |row|
  if row["Primary"] == "Yes"
    @primary_email = row["Email Address"]
  end
end

@experience_rows = CSV.open("data/Positions.csv", headers: true).readlines.map do |row|
  row["Description"] = row["Description"].gsub(/\n+/, "</p><p>")
  row
end
@project_rows = CSV.open("data/Projects.csv", headers: true).readlines.sort_by do |row|
  Date.strptime(row["Start Date"], "%b %Y")
end.reverse
@education_rows = CSV.open("data/Education.csv", headers: true).readlines
recommendation_rows = CSV.open("data/Recommendations Received.csv", headers: true).readlines
@recommendations_hash = {}
recommendation_rows.each do |row|
  if @recommendations_hash[row["Company"]].nil?
    @recommendations_hash[row["Company"]] = []
  end
  @recommendations_hash[row["Company"]] << row
end

engine = Haml::Engine.new(open("template.haml").read)
File.open("resume.html","w") do |ofile|
  ofile.puts engine.render(self)
end
