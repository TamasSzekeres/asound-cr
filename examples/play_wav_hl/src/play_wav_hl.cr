require "asound"

module PlayWavHL
  include ALSA::C
  include ALSA

  DEFAULT_RATE = 44100_u32
  DEFAULT_CHANNELS = 1_u32
  DEFAULT_SECONDS = 8

  def self.main
    num_args = ARGV.size
    if num_args < 4
      puts "Usage: play_wav_hl </path/to/file.wav> <sample_rate> <channels> <seconds>"
      return -1
    end

    file_name = ARGV[0]
    rate = ARGV[1].to_u32 { DEFAULT_RATE }
    channels = ARGV[2].to_u32 { DEFAULT_CHANNELS }
    seconds = ARGV[3].to_i { DEFAULT_SECONDS }

    unless File.exists? file_name
      puts "The given file is not exists!"
      return -1
    end

    pcm = Pcm.new(Pcm::DEFAULT, PcmStream::Playback)

    # Allocate parameters object and fill it with default values
    params = PcmHwParams.new pcm

    # Set parameters
    params.access = PcmAccess::RWInterleaved
    params.format = PcmFormat::S16_LE
    params.channels = channels
    params.set_rate_near rate

    # Write parameters
    pcm.hw_params = params

    # Resume information
    name = pcm.name
    puts "PCM name: '#{name}'"

    state_name = pcm.state_name
    puts "PCM state: #{state_name}"

    tmp = params.channels
    puts "channels: #{tmp}"

    if tmp == 1_u32
      puts "(mono)"
    elsif tmp == 2_u32
      puts "(stereo)"
    end

    # ASound.snd_pcm_hw_params_get_rate(params, pointerof(tmp), nil)
    tmp = params.rate[:val]
    puts "rate: #{tmp} bps"

    puts "seconds: #{seconds}"

    # Allocate buffer to hold single period
    frames = params.period_size[:frames]

    buff_size = frames * channels * 2
    buff = Bytes.new buff_size

    tmp = params.period_time[:val]

    file = File.open file_name

    loops = (seconds * 1000000) / tmp
    loops.times do
      res = file.read_fully? buff
      if res.nil?
        puts "Early end of file."
        return 0
      end

      res = pcm.writei buff, frames
      if res == -LibC::EPIPE
        puts "XRUN."
      elsif res < 0
        error = ASound.snd_strerror res
        puts "ERROR. Can't write to PCM device. #{error}"
      end
    end

    0
  end

  main
end
