package main

import (
	"flag"
	"fmt"
	"github.com/sclevine/agouti"
	"log"
	"regexp"
)

const defaultSeleniumPort = 4444
const defaultSeleniumProto = "http"
const defaultSeleniumAddr = "127.0.0.1"

var selenium_url = flag.String("h", fmt.Sprintf("%s://%s:%d", defaultSeleniumProto, defaultSeleniumAddr, defaultSeleniumPort), "Selenium host URL. Http is used if no protocol is specified")
var screenshot_file = flag.String("s", "", "Take final screenshot and save it to file with this name")

func checkErrFatal(err error) {
	if err != nil {
		log.Panic(err)
	}
}

func getSeleniumURL(url string) string {
	return getValidUrl(url) + "/wd/hub"
}

func getValidUrl(url string) string {
	matched, err := regexp.MatchString("^https?://", url)
	checkErrFatal(err)
	if !matched {
		url = defaultSeleniumProto + "://" + url
	}
	matched, err = regexp.MatchString(`.*:\d+`, url)
	checkErrFatal(err)
	if !matched {
		url = fmt.Sprintf("%s:%d", url, defaultSeleniumPort)
	}
	return url
}

func getValidScreenshotFile(name string) string {
	matched, err := regexp.MatchString(`.*\.jpe?g$`, name)
	checkErrFatal(err)
	if !matched {
		name = name + ".jpg"
	}
	return name
}

func main() {
	flag.Parse()
	seleniumURL := getValidUrl(*selenium_url)
	capabilities := agouti.NewCapabilities().Browser("chrome").Platform("linux").With("javascriptEnabled")
	log.Println("Connecting to selenium")
	page, err := agouti.NewPage(seleniumURL+"/wd/hub", agouti.Desired(capabilities))
	if err != nil {
		log.Fatal("Failed to open page:", err)
	}

	log.Println("Navigating to URL")
	if err := page.Navigate(seleniumURL + "/grid/console"); err != nil {
		log.Fatal("Failed to navigate:", err)
	}

	log.Println("Getting header")
	selection, err := page.FindByID("header").All("h2").Text()
	if err != nil {
		log.Fatal("Failed to get element:", err)
	}

	if *screenshot_file != "" {
		screenshotFile := getValidScreenshotFile(*screenshot_file)
		log.Printf("Getting %s screenshot\n", screenshotFile)
		err = page.Screenshot(screenshotFile)
		if err != nil {
			log.Fatal("Failed to get screenshot:", err)
		}
	}
	fmt.Println(selection)
}
