# Meater

A concoction of scripts whose combined function it is to read the image from a webcam pointed at a utility meter (in this case central heating displaying MWh):

![meater.jpg](https://github.com/dhogborg/meater/blob/master/sample/meater.jpg?raw=true)

Then extract from that image a subimage of the seven segment display, increase the contrast and make it grayscale:

![crop.jpg](https://github.com/dhogborg/meater/blob/master/sample/crop.jpg?raw=true)

That image is then passed to [Gosser](https://github.com/dhogborg/gosser) for decoding.

Finally the result is inserted to a InfluxDb instance liked to the container with `--link influxdb:influxdb`. 