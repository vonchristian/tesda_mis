Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
Dir[File.join(Rails.root, 'db', 'seeds', 'qualifications', '*.rb')].sort.each { |seed| load seed }
