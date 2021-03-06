# frozen_string_literal: true

namespace :build do
  desc 'Build all (gem and docs'
  task :all do
    Rake::Task['build:gem'].invoke
    Rake::Task['build:docs'].invoke
  end

  desc 'Build gem'
  task :gem do
    puts "[ INFO ] Building gem..."
    system('rm teuton-client-*.*.*.gem')
    system('gem build teuton-client.gemspec')
  end

  desc 'Generate docs'
  task :docs do
    puts "[ INFO ] Generating documentation..."
    system('rm -r html/')
    system('yardoc lib/* -o html')
    puts "[ INFO ] Done"
  end
end
