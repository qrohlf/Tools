#!/usr/bin/env ruby
def I(l)
    l.match /^- .*$/
end

def items(a)
    a.select{|l| I(l)}
end

def footer(a)
    a.slice(a.rindex{|l| I(l)} + 1, a.size)
end

def header(a)
    a.take(a.index{|l| I(l)})
end

readme = File.readlines('Readme.md')
sink = File.readlines('kitchensink.md')

all = items(readme) + items(sink)
all.uniq!
all.sort!
all.join('')

File.write('kitchensink.md', (header(sink)+all+footer(sink)).join(''))