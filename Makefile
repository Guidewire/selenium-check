TARGET = selenium-check
BUILDDIR = build
ARCHIVEDIR = archive

android.arm:     GOOS=android
darwin.386:      GOOS=darwin
darwin.amd64:    GOOS=darwin
darwin.arm:      GOOS=darwin
darwin.arm64:    GOOS=darwin
dragonfly.amd64: GOOS=dragonfly
freebsd.386:     GOOS=freebsd
freebsd.amd64:   GOOS=freebsd
freebsd.arm:     GOOS=freebsd
linux.386:       GOOS=linux
linux.amd64:     GOOS=linux
linux.arm:       GOOS=linux
linux.arm64:     GOOS=linux
linux.ppc64:     GOOS=linux
linux.ppc64le:   GOOS=linux
linux.mips:      GOOS=linux
linux.mipsle:    GOOS=linux
linux.mips64:    GOOS=linux
linux.mips64le:  GOOS=linux

netbsd.386:      GOOS=netbsd
netbsd.amd64:    GOOS=netbsd
netbsd.arm:      GOOS=netbsd
openbsd.386:     GOOS=openbsd
openbsd.amd64:   GOOS=openbsd
openbsd.arm:     GOOS=openbsd
plan9.386:       GOOS=plan9
plan9.amd64:     GOOS=plan9
solaris.amd64:   GOOS=solaris
windows.386:     GOOS=windows
windows.amd64:   GOOS=windows
android.arm:     GOARCH=arm
darwin.386:      GOARCH=386
darwin.amd64:    GOARCH=amd64
darwin.arm:      GOARCH=arm
darwin.arm64:    GOARCH=arm64
dragonfly.amd64: GOARCH=amd64
freebsd.386:     GOARCH=386
freebsd.amd64:   GOARCH=amd64
freebsd.arm:     GOARCH=arm
linux.386:       GOARCH=386
linux.amd64:     GOARCH=amd64
linux.arm:       GOARCH=arm
linux.arm64:     GOARCH=arm64
linux.ppc64:     GOARCH=ppc64
linux.ppc64le:   GOARCH=ppc64le
linux.mips:      GOARCH=mips
linux.mipsle:    GOARCH=mipsle
linux.mips64:    GOARCH=mips64
linux.mips64le:  GOARCH=mips64le
netbsd.386:      GOARCH=386
netbsd.amd64:    GOARCH=amd64
netbsd.arm:      GOARCH=arm
openbsd.386:     GOARCH=386
openbsd.amd64:   GOARCH=amd64
openbsd.arm:     GOARCH=arm
plan9.386:       GOARCH=386
plan9.amd64:     GOARCH=amd64
solaris.amd64:   GOARCH=amd64
windows.386:     GOARCH=386
windows.amd64:   GOARCH=amd64

all: test build archive
test: main.go
	go test

build: darwin.386 darwin.amd64 darwin.arm dragonfly.amd64 freebsd.386 freebsd.amd64 freebsd.arm linux.386 linux.amd64 linux.arm linux.arm64 linux.ppc64 linux.ppc64le linux.mips64 linux.mips64le
# https://golang.org/doc/install/source#environment
# android.arm
# darwin.arm64
# linux.mips
# linux.mipsle

clean:
	go clean
	@rm -rvf $(BUILDDIR)
	@rm -rvf $(ARCHIVEDIR)

archive:
	@mkdir -p $(ARCHIVEDIR)
	@for dir in $$(ls $(BUILDDIR)); do \
	    echo tar -czf $(ARCHIVEDIR)/$$dir.tgz; \
	    tar -czf $(ARCHIVEDIR)/$$dir.tgz -C $(BUILDDIR)/$$dir $(TARGET) ; \
	done

android.arm:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
darwin.386:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
darwin.amd64:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
darwin.arm:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
darwin.arm64:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
dragonfly.amd64:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
freebsd.386:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
freebsd.amd64:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
freebsd.arm:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
linux.386:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
linux.amd64:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
linux.arm:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
linux.arm64:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
linux.ppc64:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
linux.ppc64le:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
linux.mips:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
linux.mipsle:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
linux.mips64:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)
linux.mips64le:
	@mkdir -p $(BUILDDIR)/$(GOOS)_$(GOARCH) 
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILDDIR)/$(GOOS)_$(GOARCH)/$(TARGET)

.PHONY: archive clean
