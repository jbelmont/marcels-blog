+++
date = "2018-04-28T12:00:00"
draft = false
tags = ["Debugging", "Tricks", "Golang"]
title = "Tips and Tricks with Golang"
math = true
summary = """
Tips and Tricks with Golang
"""

+++

# In this Blog Post I go over Tips and Tricks with Golang

Make sure to have [Golang Installed](https://golang.org/dl/) and you have the `GOPATH` variable set.

Set your `GOPATH` variable in Mac OS X by setting it in `~/.bashrc, ~/.zshrc` etc

Add the following entry to your `.zshrc`: `export GOPATH=$HOME/go`

Run `source ~/.zshrc` to get the environment variable set in your current shell process.

Once golang is installed run the following command to see what is set:

```bash
go env
GOARCH="amd64"
GOBIN=""
GOCACHE="/Users/jean-marcelbelmont/Library/Caches/go-build"
GOEXE=""
GOHOSTARCH="amd64"
GOHOSTOS="darwin"
GOOS="darwin"
GOPATH="/Users/jean-marcelbelmont/go"
GORACE=""
GOROOT="/usr/local/Cellar/go/1.10/libexec"
GOTMPDIR=""
GOTOOLDIR="/usr/local/Cellar/go/1.10/libexec/pkg/tool/darwin_amd64"
GCCGO="gccgo"
CC="clang"
CXX="clang++"
CGO_ENABLED="1"
CGO_CFLAGS="-g -O2"
CGO_CPPFLAGS=""
CGO_CXXFLAGS="-g -O2"
CGO_FFLAGS="-g -O2"
CGO_LDFLAGS="-g -O2"
PKG_CONFIG="pkg-config"
GOGCCFLAGS="-fPIC -m64 -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/g6/jldtb40j5vvfxtjmg0f5nt4h0000gp/T/go-build176900775=/tmp/go-build -gno-record-gcc-switches -fno-common"
```

Notice I have set my `GOPATH` but there is some other defaults that are set.

## Using Go Docs

You can easily go into docs for any GO package by doing the following:

One trick that I do is that I copy the import statement in my editor like this:

{{< figure src="/media/goimport.png" >}}

Once you have that copied you just do the following:

Type `godoc.org/` into a browser window and paste the package into the URL:

{{< figure src="/media/gourl.png" >}}

Now this takes straight you straight to the documentation for this package.

Now for a protip type `?` in the documentation page and get a help context menu like this:

{{< figure src="/media/gohelpmenu.png" >}}

Assuming that you know what functions/methods you can easily jump to them by pressing `f` in your keyboard:

Press `f`:

{{< figure src="/media/gofindmenu.png" >}}

In this example just type `WithStack` and you can jump straight to the `WithStack` function.

You can also go into your terminal and see the documentation by doing the following:

`go doc fmt.Printf` ==> This command gives you the docs for `fmt.Printf`.

## Sharing Go Code

You can easily share your go code with others by going to either the [Go Playground](https://play.golang.org/) or [Go Play](https://goplay.space/).

## Create your own custom assert test function

Here is a sample test file from my [api-workshop](https://github.com/jbelmont/api-workshop/blob/master/internal/hero/hero_test.go)

```go
...
// TestCreateInsertsProperly validates users can be created in the database.
func TestCreateInsertHero(t *testing.T) {
	// Insert User
	heroInfo := heroInfo()
	// Translate CreateProduct to Product in order to assert result.
	cuBytes, _ := json.Marshal(heroInfo.hero)
	var exH hero.Hero
	json.Unmarshal(cuBytes, &exH)
	h, err := hero.Create(ctx, masterDB, &heroInfo.hero)
	if err != nil {
		t.Fatalf("Should be able to create a hero : %s.", err)
	}
	if !h.ID.Valid() {
		t.Errorf("Should generate valid Hero ID, got: %s", h.ID)
	}
	assertEqualUsers(&exH, h, t)

	// Test the user context value
	ctxValues := ctx.Value(apiContext.KeyValues).(*apiContext.Values)
	HeroID := bson.ObjectIdHex(ctxValues.ID).Hex()
	if *h.CreatedByID != HeroID {
		t.Errorf("Should create a user by userID: %s, got: %s", HeroID, *h.CreatedByID)
	}
}

func assertEqualUsers(actual *hero.Hero, expected *hero.Hero, t *testing.T) {
	if actual.Name != expected.Name {
		t.Errorf("Should create hero Name: %s, but got: %s", expected.Name, actual.Name)
	}
}
...
```

If you familiar with XUnit style assertions you can just write your own using a function in Golang.

## Go Tooling

You can easily discover the go tooling by typing `go help` in your terminal

If you like this Blog Post please follow me at [jbelmont at Github](https://github.com/jbelmont)