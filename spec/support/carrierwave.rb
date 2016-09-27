RSpec.configure do |config|
  config.after(:all) do
    if Rails.env.test? || Rails.env.cucumber?
      tmp = FactoryGirl.build(:image)
      store_path = File.dirname(File.dirname(tmp.file.url))
      temp_path = tmp.file.cache_dir
      FileUtils.rm_rf(Dir["#{Rails.root}/public/#{store_path}/[^.]*"])
      FileUtils.rm_rf(Dir["#{temp_path}/[^.]*"])
    end
  end
end
