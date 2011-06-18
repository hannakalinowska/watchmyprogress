Factory.define :project do |f|
  f.name 'Test'
  f.description 'test'
  f.starts_at '0'
  f.ends_at '100'
  f.association :user
end

Factory.define :user do |f|
  f.name 'User'
  f.email 'user@example.com'
end
