require "bootboot_buildpack/bootboot"
require "bootboot_buildpack/heroku_ruby_installer_patch"
require "bootboot_buildpack/no_lockfile_next"

module BootbootBuildpack
  def self.detect(build_dir, cache_dir)
    Dir.chdir(build_dir)

    pack = [BootbootBuildpack::NoLockfileNext].detect { |klass|
      klass.use?
    }

    pack&.new(build_dir, cache_dir)
  end
end
