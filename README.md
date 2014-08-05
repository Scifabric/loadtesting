Load testing of PyBossa instances
=================================

Load tests for a production PyBossa instance.

After reviewing several load testing solutions (e.g. JMeter, funkload) we decided to use [Locust](http://locust.io/).

**Warning:** Please do load tests only with your **own** PyBossa server!
The files in this repo are examples on how to write a load tester for PyBossa.

## Installation

> It is recommend (but of course optional) to use virtualenv: [Manual for virtualenv usage](http://virtualenv.readthedocs.org/en/latest/virtualenv.html#usage).

### Install Locust
```
pip install -r requirements.txt
```

### Do load testing

All available load tests are in the `pybossa-locust` folder.  
If you want to write them yourself look at the [Locust manual](http://docs.locust.io/en/latest/index.html).

To run a locust file run them e.g. with
```
locust -f pybossa-locust/mainandprojects.py --host http://yourpybossaserver
```

and open your browser to  
[http://localhost:8089](http://localhost:8089)

Start running the load test and see the result in your browser! :)


## Copyright / License

Copyright 2014 SF Isle of Man Limited. 

Source Code License: The GNU Affero General Public License, either version 3 of the License
or (at your option) any later version. (see COPYING file)

The GNU Affero General Public License is a free, copyleft license for
software and other kinds of works, specifically designed to ensure
cooperation with the community in the case of network server software.

Documentation and media is under a Creative Commons Attribution License version
3.