# Tor::Playground

A personal and quasi-professional playground for playing with the semantic web.

## Experiment 1

Goal: Develop a better understanding of Sparql queries.

My plan is to start with a semantic data-set of which I'm familiar: [My personal blog](https://takeonrules.com).

- [X] Extract RDF graph of one page
  - This involved updating my site's build script to preserve self-closing tags.
- [X] Wrap extracted RDF graph in Sparql complient end-point
- [X] Query against that end-point
- [X] Write a query selecting only a specific predicate

Solution: See `task experiments:one` in `./Rakefile`
