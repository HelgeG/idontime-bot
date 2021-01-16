# frozen_string_literal: true

require 'yaml'
require_relative 'id_dsl'

PROPERTIES_FILE = 'idontime.yaml'
props = YAML.safe_load(File.read(PROPERTIES_FILE))
user = ENV['IDONTIME_USER']
password = ENV['IDONTIME_PASSWORD']

driver = create_driver
go_to_url(driver, props['url'])
find_by_id_and_fill_in(driver, props['user_field'], user)
find_by_id_and_fill_in(driver, props['password_field'], password)
click(driver, props['login_button'])
go_to_url(driver, props['mov_url'])
wait
click(driver, props['add_button'])
wait
frame(driver, props['add_frame'])
find_by_id_clear_and_fill_in(driver, props['date_field'], props['date_to_add'])

puts driver.title

driver.quit
