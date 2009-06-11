UBIQUO_GUIDES_ROOT = File.join(File.dirname(__FILE__), '..')
namespace :ubiquo do
  desc 'Generate guides (for authors), use ONLY=foo to process just "foo.textile"'
  task :guides do
    ENV["WARN_BROKEN_LINKS"] = "1" # authors can't disable this
    ruby File.join(UBIQUO_GUIDES_ROOT, "guides/rails_guides.rb")
  end
end
