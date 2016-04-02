# Meater

A concoction of scripts whose combined function it is to read the image from a webcam pointed at a utility meter (in this case central heating displaying MWh):

![meater.jpg](https://github.com/dhogborg/meater/blob/master/sample/meater.jpg?raw=true)

Then extract from that image a subimage of the seven segment display, increase the contrast and make it grayscale by using imagemagick as pre-processor.

The options can be customized with the `$PREPROCESS` env variable. This is an example: `-rotate -3.8 -crop 00x22+305+193 -modulate 100,0 -level 25%,70%`. Which produces:

![crop.jpg](https://github.com/dhogborg/meater/blob/master/sample/crop.jpg?raw=true)

That image is then passed to [Gosser](https://github.com/dhogborg/gosser) for decoding.

Finally the result is inserted to a InfluxDb instance liked to the container with `--link influxdb:influxdb`. 