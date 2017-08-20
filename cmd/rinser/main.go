package main

import (
	"os"

	"github.com/urfave/cli"
)

func main() {
	var configfile string

	app := cli.NewApp()
	app.Name = "rinser"
	app.Usage = "Cleanse all the datas!"

	app.Flags = []cli.Flag{
		cli.StringFlag{
			Name:        "config, c",
			Usage:       "Load configuration from `FILE`",
			Destination: &configfile,
		},
	}

	app.Run(os.Args)
}
