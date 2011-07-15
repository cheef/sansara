task :build => 'project:build'

namespace :project do
  require 'rake/clean'

  task :build => %w(environment setup clean assets:precompile remove_fingerprints copy_assets clean)

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

  task :copy_assets do
    Dir[ "#{files_path}/*" ].each do |path|
      FileUtils.mv path, "#{src_path}/", :force => true
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

  def src_path
    Rails.root.join('../src').to_s
  end

end

