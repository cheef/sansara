task :build => 'project:build'

namespace :project do
  require 'rake/clean'

  task :build => [ :environment, :setup, :clean, "assets:precompile", :remove_fingerprints ]

  task :setup => :environment do
    CLEAN.include files_path
  end

  task :remove_fingerprints do
    Dir[ "#{files_path}/**/*" ].each do |path|
      unless File.directory?(path)
        FileUtils.mv path, without_fingerprint(path)
      end
    end
  end

  def files_path
    Rails.root.join('public/assets').to_s
  end

  def new_file_name path
    File.basename(path).sub /^(.+)-([a-z0-9]+)\.([a-z]*)$/, '\1.\3'
  end

  def without_fingerprint path
    File.dirname(path) + "/" + new_file_name(path)
  end

end

