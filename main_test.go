package main

import "testing"

func TestGetValidUrl(t *testing.T) {
	cases := map[string]struct{ addr_string, expected string }{
		"full address string": {"http://127.0.0.1:4444", "http://127.0.0.1:4444"},
		"no port":             {"http://127.0.0.1", "http://127.0.0.1:4444"},
		"no proto":            {"127.0.0.1:4444", "http://127.0.0.1:4444"},
	}

	for k, tc := range cases {
		actual := getValidUrl(tc.addr_string)
		if actual != tc.expected {
			t.Errorf(
				"%s: URL is '%s', expected '%s'",
				k, tc.addr_string, tc.expected,
			)
		}
	}

}

func TestGetValidScreenshotFile(t *testing.T) {
	cases := map[string]struct{ name, expected string }{
		"no extension":   {"screenshot", "screenshot.jpg"},
		"jpeg extension": {"screenshot.jpeg", "screenshot.jpeg"},
		"jpg extension":  {"screenshot.jpg", "screenshot.jpg"},
	}

	for k, tc := range cases {
		actual := getValidScreenshotFile(tc.name)
		if actual != tc.expected {
			t.Errorf(
				"%s: URL is '%s', expected '%s'",
				k, tc.name, tc.expected,
			)
		}
	}

}
