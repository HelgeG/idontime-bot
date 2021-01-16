# frozen_string_literal: true

require 'yaml'
require_relative 'id_dsl'

PROPERTIES_FILE = 'idontime.yaml'
props = YAML.safe_load(File.read(PROPERTIES_FILE))
user = ENV['IDONTIME_USER']
password = ENV['IDONTIME_PASSWORD']
ENTRY_IN = 0
ENTRY_OUT = 1

def create_entry(driver, type, props)
  if type == ENTRY_IN
    time = props['time_in']
    entry = props['entry_in']
  else
    time = props['time_out']
    entry = props['entry_out']
  end
  go_to_url(driver, props['mov_url'])
  wait
  click(driver, props['add_button'])
  wait
  frame(driver, props['add_frame'])
  find_by_id_clear_and_fill_in(driver, props['date_field'], "#{props['date_to_add']} #{time}")
  wait
  click(driver, props['entry_dropdown'])
  wait
  click(driver, entry)
  wait
  click(driver, props['submit_button'])
end

driver = create_driver

go_to_url(driver, props['url'])
find_by_id_and_fill_in(driver, props['user_field'], user)
find_by_id_and_fill_in(driver, props['password_field'], password)
click(driver, props['login_button'])
create_entry(driver, ENTRY_IN, props)
create_entry(driver, ENTRY_OUT, props)
wait
driver.quit
