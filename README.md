# IDONTIME bot

This script facilitates the filling in of time sheets using the IDONTIME system.

By default, the script will generate IN and OUT entries for the current day, with entry at 9am, and exit at 6pm.

The script requires a ruby installation (written using Ruby 2.7.2).

The dependencies can be installed with help of the bundler gem (gem install bundler), and then using the commnad `bundle install` in the project directory.

If the macOS gatekeeper doesn't want to launch the chrome webdriver, the following command can be used to circumvent the problem:

`$ xattr -d com.apple.quarantine /usr/local/bin/chromedriver` (adjust the path if installed in another location).


## Usage

`$ ./idontime [arguments...]`

The following command line arguments can be used:

`'-h', '--headless' `

If present, will run the script without a Chrome GUI (i.e. headless).

`'-i hh:mm', '--in hh:mm'`

If present, will set the time of entry. If not present, will use the default time specified in the `idontime.yaml` preference file.


`'-o hh:mm', '--out hh:mm'`

If present, will set the time of exit. If not present, will use the default time specified in the `idontime.yaml` preference file.

`'-d dd-mm-yyyy', '--date dd-mm-yyyy'`

If present, will set the date of the records. If not present, will use today's date.

`'-u [USERNAME]', '--user [USERNAME]'`

Will set the username to `[USERNAME]`. If not present, uses the value of the environment variable `IDONTIME_USER`

`'-p [PASSWORD]', '--password [PASSWORD]'`.

Will set the password to `[PASSWORD]`. If not present, uses the value of the environment variable `IDONTIME_PASSWORD`.

## Example

`$ ./idontime -i 08:00 --out 17:00 --date 18-01-2021 --headless`

Will run the script in headless mode, and create a set of entries for the date 18-01-2021, starting at 8am, ending at 5pm.

The username and password will be fetched from environment variables.


## Properties

A set of properties are defined in the file `idontime.yaml`:

```yaml
---
:url: https://idontime.vwgs.pt/default.aspx?l=1
:mov_url: https://idontime.vwgs.pt/areas/as/asmovimentos.aspx
:user_field: cpLogin_txtUtilizador_I
:password_field: cpLogin_txtSenha
:login_button: cpLogin_btnEntrar_CD
:add_frame: ctl00_ASPxSplitter_cphContent_popupEdita_CIF-1
:add_button: ctl00_ASPxSplitter_botoes_btnAdicionar
:date_field: ctl00_cphContent_txtData_I
:entry_dropdown: ctl00_cphContent_cbTipoMov_B-1Img
:entry_in: ctl00_cphContent_cbTipoMov_DDD_L_LBI3T0
:entry_out: ctl00_cphContent_cbTipoMov_DDD_L_LBI4T0
:submit_button: ctl00_btnGuardar
:default_time_in: '09:00'
:default_time_out: '18:00'
```

Most of the values here are the HTML ID attributes of the UI elements in the IDONTIME system, as well as the URLs used to access the application.
The default times for entry and exit are also defined here.
