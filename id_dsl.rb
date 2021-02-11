# frozen_string_literal: true

require 'selenium-webdriver'

def wait
  sleep 1
end

def rescue_exceptions
  yield
rescue Selenium::WebDriver::Error::NoSuchElementError
  puts 'Error: Could not find element'
  false
rescue Selenium::WebDriver::Error::StaleElementReferenceError
  puts 'Error: Element is stale'
  false
end

# @return [Selenium::WebDriver::IE::Driver, Selenium::WebDriver::Chrome::Driver]
def create_driver(headless)
  driver_options = Selenium::WebDriver::Chrome::Options.new
  driver_options.add_argument('--disable-popup-blocking')
  driver_options.add_argument('--disable-translate')
  driver_options.add_argument('--headless') if headless
  Selenium::WebDriver.for :chrome, options: driver_options
end

def go_to_url(driver, url)
  driver.navigate.to url
  wait
end

def find_by_id_and_fill_in(driver, id, value)
  element = driver.find_element(id: id)
  element.send_keys value
  wait
end

def find_by_id_clear_and_fill_in(driver, id, value)
  element = driver.find_element(id: id)
  element.clear
  element.send_keys value
  wait
end

def click(driver, id)
  element = driver.find_element(id: id)
  element.click
  wait
end

def frame(driver, id)
  driver.switch_to.frame(id)
  wait
end

def login(driver, options)
  go_to_url(driver, options[:url])
  find_by_id_and_fill_in(driver, options[:user_field], options[:user])
  find_by_id_and_fill_in(driver, options[:password_field], options[:password])
  click(driver, options[:login_button])
end

def create_entry(driver, date, time, options)
  go_to_url(driver, options[:mov_url])
  click(driver, options[:add_button])
  frame(driver, options[:add_frame])
  find_by_id_clear_and_fill_in(driver, options[:date_field], "#{date} #{time}")
  click(driver, options[:submit_button])
end
