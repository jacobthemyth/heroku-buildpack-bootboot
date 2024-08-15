RSpec.describe "Stack Changes" do
  it "should not reinstall gems if the stack did not change" do
    app = Hatchet::Runner.new("default_ruby", stack: "heroku-24").setup!
    app.deploy do |app, heroku|
      app.update_stack("heroku-24")
      run!(%(git commit --allow-empty -m "noop"))

      app.push!
      puts app.output
      expect(app.output).to match("Using rack 1.5.0")
    end
  end
end
