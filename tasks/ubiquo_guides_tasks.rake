UBIQUO_GUIDES_ROOT = File.join(File.dirname(__FILE__), '..')
namespace :ubiquo do
  desc 'Generate guides (for authors), use ONLY=foo to process just "foo.textile"'
  task :guides do
    ENV["WARN_BROKEN_LINKS"] = "1" # authors can't disable this
    ruby File.join(UBIQUO_GUIDES_ROOT, "guides/rails_guides.rb")
  end
  namespace :guides do
    desc 'Uploads guides to the ubiquo guide server'
    task :publish => :guides do
      src_path = File.join(UBIQUO_GUIDES_ROOT, "guides/output")
      dst_path = "~/guides/edge"
      system("scp -r #{src_path}/* ubiquo@guides.ubiquo.me:#{dst_path}")
    end
  end
end
