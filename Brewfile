# vim: set ft=ruby

def load_brewfile(brewfile)
  path = File.expand_path(brewfile, __dir__)
  instance_eval(File.read(arch_brews), path) if File.exist?(path)
end

load_brewfile ".Brewfile.arch"
load_brewfile ".Brewfile.host"
