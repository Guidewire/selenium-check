# selenium-check

This tool is designed to test selenium installations, written for [selenium ansible role](/Guidewire/ansible-role-selenium). It connects to selenium, navigates to `/grid/console`, gets `h2` header and prints it.

Currently requires `chrome` on `linux`.

Use `-h` flag to specify selenium host, `-s` for a screenshot file name, screenshot is made only when flag is defined.

#### Example

```
$ selenium-check -h 172.28.128.14 -s test2
2017/03/31 11:38:11 Connecting to selenium
2017/03/31 11:38:12 Navigating to URL
2017/03/31 11:38:12 Getting header
2017/03/31 11:38:12 Getting test2.jpg screenshot
Grid Console v.3.3.1
```
