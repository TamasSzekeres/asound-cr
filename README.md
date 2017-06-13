# asound-cr

ALSA/libasound bindings for sound programming in Crystal language.

[![Build Status](https://travis-ci.org/TamasSzekeres/asound-cr.svg?branch=master)](https://travis-ci.org/TamasSzekeres/asound-cr)

## Installation

First install shared libraries and other development files:
```bash
sudo apt-get install libasound2 libasound2-data libasound2-dev
```

Add this to your application's `shard.yml`:

```yaml
dependencies:
  asound:
    github: TamasSzekeres/asound-cr
    branch: master
```
Then run in terminal:
```bash
crystal deps
```

## Usage

```crystal
require "asound"

module YourModule
  include ALSA
end
```

For more details see the sample in [/sample](/sample) folder.

## Sample

Build and run the sample:
```bash
  mkdir bin
  crystal build -o bin/play-wav sample/play_wav.cr --release
```
*Usage*
```bash
  ./bin/play-wav </path/to/file.wav> <sample_rate> <channels> <seconds>
```

*Example*
```bash
  ./bin/play-wav /usr/share/sounds/alsa/Front_Center.wav 44100 1 2
```

## Contributing

1. Fork it ( https://github.com/TamasSzekeres/asound-cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [TamasSzekeres](https://github.com/TamasSzekeres) Tamás Szekeres - creator, maintainer
