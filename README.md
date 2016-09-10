# MyScreen

[![Build Status](https://circleci.com/gh/gustavosobral/my-screen.svg?style=shield&circle-token=f657a6b42787bc052ec855094bcf3f514c2f2f1e)](https://circleci.com/gh/gustavosobral/my-screen)
[![codecov](https://codecov.io/gh/gustavosobral/my-screen/branch/master/graph/badge.svg?token=A4I6swfgAL)](https://codecov.io/gh/gustavosobral/my-screen)

## Dependencies

To run this project you need to have:

* Ruby 2.3.1 - You can use [RVM](http://rvm.io)
* [PostgreSQL](http://www.postgresql.org/)
* [ImageMagick](http://www.imagemagick.org/script/index.php)
* FFmpeg

To **integrate** this project to Heroku, you'll need:

* [Heroku Toolbelt](https://toolbelt.heroku.com/)

### Installing FFmpeg on Ubuntu 14.04

FFmpeg has been removed from Ubuntu 14.04. This decision has been reversed so that FFmpeg is available in Ubuntu 15.04 again. So, you only need to do this on Ubuntu 14.04
```
$ sudo add-apt-repository ppa:mc3man/trusty-media
$ sudo apt-get update
$ sudo apt-get install ffmpeg
```

## Setup the project

1. Install the dependencies above
2. `$ git clone <REPOSITORY_URL> my-screen` - Clone the project
3. `$ cd my-screen` - Go into the project folder
4. `$ gem install bundler` - Install bundler on project gemset
4. `$ bundle install` - Install project dependencies with bundler
5. `$ rspec` - Run the specs to see if everything is working fine

If everything goes OK, you can now run the project!
