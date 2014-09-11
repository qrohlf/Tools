#!/usr/bin/env ruby
require 'pry'

# Item pattern
def I(l)
    l.match /^- .*$/
end

readme = File.readlines('Readme.md')
readme_header = []
readme_footer = []
sink = File.readlines('kitchensink.md')

until /^##/ =~ readme.first
  readme_header << readme.shift
end

loop do
  readme_footer.unshift readme.pop
  break if /^---/ =~ readme_footer.first
end

readme_sections = readme.group_by{|l| /^##/ =~ l}

binding.pry
# readme_sections = readme.split '##'
