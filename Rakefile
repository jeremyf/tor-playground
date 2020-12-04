require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :experiments do
  task :one do
    require 'rdf/rdfa'
    require 'rdf/turtle'
    require 'sparql'

    filename = "https://raw.githubusercontent.com/takeonrules/takeonrules.github.io/7d25cba04e04a479da2c2af845b52c36d497c56a/index.html"
    graph = RDF::Graph.load(filename, format: :rdfa, content_type: "text/html")
    repository = RDF::Repository.new
    repository.insert(graph.statements)
    all_solutions = SPARQL.execute("SELECT * WHERE { ?s ?p ?o }", repository)
    raise "Expected at least one solution to query" if all_solutions.count < 1
    solutions = SPARQL.execute("PREFIX sc: <http://schema.org/>\nSELECT * WHERE { ?s sc:headline ?o }", repository)
    raise "Expected 10 solutions for headlines; that's the pagination size of the source" unless solutions.count == 10
  end
end