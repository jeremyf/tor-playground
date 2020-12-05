require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :experiments do
  task :one do
    require 'rdf/rdfa'
    require 'rdf/turtle'
    require 'sparql'

    # ROOT = "https://raw.githubusercontent.com/takeonrules/takeonrules.github.io/7d25cba04e04a479da2c2af845b52c36d497c56a"
    ROOT = "http://localhost:1313/"
    graph = RDF::Graph.new
    repository = RDF::Repository.new

    _paths = [
      "/2020/11/30/session-7-new-vistas-in-the-thel-sector/index.html",
      "/site-map/session-reports/index.html",
      "/index.html"
    ]

    GIT_REPO = "/Users/jfriesen/git/takeonrules.github.io/public"
    paths = Dir.glob(File.join(GIT_REPO, "/**/*.html")).map do |filename|
      filename.sub(GIT_REPO, "")
    end

    paths.each do |path|
      next if path.include?("/amp/")
      next if path.include?("/tag/")
      next if path.include?("/tables/")
      uri = File.join(ROOT, path)
      begin
        RDF::Reader.open(uri) do |reader|
          reader.each_statement do |statement|
            if statement.object.literal?
              statement.object.squish!
            end
            repository.insert(statement)
          end
        end
      rescue IOError, REXML::ParseException => e
        $stderr.puts "Error in #{path}"
      end
    end
    solutions = SPARQL.execute("PREFIX sc: <http://schema.org/>\nSELECT * WHERE { ?s sc:headline ?o }", repository)
    require 'byebug'; debugger; true
    :debugger

  end
end