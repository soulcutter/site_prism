require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

$: << './test_site'
$: << './lib'

require 'site_prism'
require 'test_site'
require 'sections/people'
require 'sections/no_element_within_section'
require 'sections/container_with_element'
require 'pages/my_iframe'
require 'pages/home'

class MyTest
  def response
    [200, {'Content-Length' => '9'}, ['MyTestApp']]
  end
end

class MyTestApp
  def call(env)
    MyTest.new.response
  end
end

Capybara.app = MyTestApp.new

