# frozen_string_literal: true

describe "Dual booting" do
  around(:each) do |spec|
    Bundler.with_unbundled_env(&spec)
  end

  describe "different Ruby versions" do
    it "handles apps with different Ruby versions in Gemfile.lock and Gemfile_next.lock" do
      buildpacks = ["heroku/ruby", :default]

      before_deploy = proc do
        FileUtils.cp("Gemfile.lock", "Gemfile_next.lock")

        open("Gemfile.lock", "a") do |f|
          f.puts <<~EOS
            RUBY VERSION
                ruby 3.1.6p260
          EOS
        end

        open("Gemfile_next.lock", "a") do |f|
          f.puts <<~EOS
            RUBY VERSION
                ruby 3.2.5p208
          EOS
        end
      end

      Hatchet::Runner.new("default_ruby", buildpacks: buildpacks, before_deploy: before_deploy).deploy do |app|
      end
    end
  end
end
