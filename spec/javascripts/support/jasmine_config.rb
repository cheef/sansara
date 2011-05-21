module Jasmine
  class Config

    def js_files spec_filter = nil
      (src_files + helpers + spec_files).collect { |f| "#{simple_config['server_url']}/#{f}" }
    end

    def css_files
      stylesheets.collect { |f| "#{simple_config['server_url']}/#{f}" }
    end

    def src_files
      simple_config['src_files'] || []
    end

    def spec_files
      simple_config['spec_files'] || []
    end

    def stylesheets
      simple_config['stylesheets'] || []
    end

    def helpers
      simple_config['helpers'] || []
    end

  end
end


# Note - this is necessary for rspec2, which has removed the backtrace
module Jasmine
  class SpecBuilder
    def declare_spec(parent, spec)
      me = self
      example_name = spec["name"]
      @spec_ids << spec["id"]
      backtrace = @example_locations[parent.description + " " + example_name]
      parent.it example_name, {} do
        me.report_spec(spec["id"])
      end
    end
  end
end
