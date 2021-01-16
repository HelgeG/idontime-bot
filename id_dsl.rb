# frozen_string_literal: true

require 'selenium-webdriver'

# @return [Selenium::WebDriver::IE::Driver, Selenium::WebDriver::Chrome::Driver]
def create_driver
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--ignore-certificate-errors')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-translate')
  Selenium::WebDriver.for :chrome, options: options
end

def go_to_url(driver, url)
  driver.navigate.to url
end

def find_by_id_and_fill_in(driver, id, value)
  element = driver.find_element(id: id)
  element.send_keys value
end

def find_by_id_clear_and_fill_in(driver, id, value)
  element = driver.find_element(id: id)
  element.clear
  element.send_keys value
end

def find_by_name_and_fill_in(driver, name, value)
  element = driver.find_element(name: name)
  element.send_keys value
end

def click(driver, id)
  element = driver.find_element(id: id)
  element.click
end

def wait
  sleep 1
end

def frame(driver, id)
  driver.switch_to.frame(id)
end
