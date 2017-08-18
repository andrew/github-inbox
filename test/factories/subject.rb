FactoryGirl.define do
  factory :subject do
    sequence(:url) { |n| "https://api.github.com/repos/octobox/octobox/issues/#{n}" }
    state 'open'
    author 'andrew'
  end
end
