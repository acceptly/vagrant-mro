begin
  require 'vagrant'
rescue LoadError
  raise "This libary only makes sense from within Vagrant."
end

if Vagrant::VERSION < "1.6.0"
  raise "Requires Vagrant version 1.6.0 or greater."
end

module VagrantPlugins
  module MRO
    class Plugin < Vagrant.plugin(2)

      name "vagrant-mro"
      description "Produces machine-readable output of global status."

      command :mro do
        require_relative 'command'
        Command
      end
    end
  end
end
