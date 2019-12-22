Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
    puts "Loading seed #{File.basename(seed, '.rb')}"
    load seed
end