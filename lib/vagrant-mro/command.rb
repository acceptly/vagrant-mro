require 'vagrant/util/silence_warnings'

module VagrantPlugins
  module MRO
    class Command < Vagrant.plugin("2", :command)
      def self.synopsis
        "Outputs machine-readable global status."
      end

      def execute
        attrs = [:id, :name, :state]
        entries = []
        Vagrant::Util::SilenceWarnings.silence! do
          @env.machine_index.each do |entry|
            # Always prune invalid entries.
            if !entry.valid?(@env.home_path)
              @env.machine_index.delete(entry.id)
            end
            entries << entry
          end
        end

        if entries.empty?
          @env.ui.info(I18n.t("vagrant.global_status_none"))
          return 0
        end

        entries.each do |entry|
          v = {}
          attrs.each do |method|
            v[method] = entry.send(method).to_s
            v[method] = v[method][0...7] if method == :id
          end
          @env.ui.info("#{v[:id]},#{v[:name]},#{v[:state]}", new_line: true)
        end

        # Success, exit status 0
        0
      end
    end
  end
end
