require 'test_helper'

class ConfiguratorTest < ActiveSupport::TestCase

  [
    {env_value: nil, expected: 'https://github.com/octobox/octobox'},
    {env_value: '', expected: 'https://github.com/octobox/octobox'},
    {env_value: ' ', expected: 'https://github.com/octobox/octobox'},
    {env_value: 'https://github.com/foo/bar', expected: 'https://github.com/foo/bar'}
  ].each do |t|
    env_value_string = t[:env_value].nil? ? 'nil' : "'#{t[:env_value]}'"
    test "When ENV['SOURCE_REPO'] is #{env_value_string}, config.source_repo is '#{t[:expected]}'" do
      stub_env_var('SOURCE_REPO', t[:env_value])
      assert_equal t[:expected], Octobox.config.source_repo
    end
  end

  test "when ENV['FETCH_SUBJECT'] is false, config.fetch_subject is false" do
    stub_env_var('FETCH_SUBJECT', 'false')
    assert_equal false, Octobox.config.fetch_subject
  end

  test "when ENV['FETCH_SUBJECT'] is nil, config.fetch_subject is false" do
    stub_env_var('FETCH_SUBJECT', '')
    assert_equal false, Octobox.config.fetch_subject
  end

  test "when ENV['FETCH_SUBJECT'] is true, config.fetch_subject is true" do
    stub_env_var('FETCH_SUBJECT', 'true')
    assert_equal true, Octobox.config.fetch_subject
  end
end
