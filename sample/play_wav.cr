require "../src/*"

module ASoundSample
  include ALSA

  PCM_DEVICE = "default"
  DEFAULT_RATE = 44100_u32
  DEFAULT_CHANNELS = 1
  DEFAULT_SECONDS = 8

  def self.main
    num_args = ARGV.size
    if num_args < 4
      puts "Usage: play-wav </path/to/file.wav> <sample_rate> <channels> <seconds>"
      return -1
    end

    file_name = ARGV[0]
    rate = ARGV[1].to_u32 { DEFAULT_RATE }
    channels = ARGV[2].to_i { DEFAULT_CHANNELS }
    seconds = ARGV[3].to_i { DEFAULT_SECONDS }

    unless File.exists? file_name
      puts "The given file is not exists!"
      return -1
    end

    pcm_handle : ASound::SndPcmT = nil.as(ASound::SndPcmT)
    # Open the PCM device in playback mode
    pcm = ASound.snd_pcm_open(pointerof(pcm_handle), PCM_DEVICE, ASound::SndPcmStreamT::SND_PCM_STREAM_PLAYBACK, 0)
    if pcm < 0
      error = ASound.snd_strerror pcm
      puts "ERROR: Can't open \"#{PCM_DEVICE}\" PCM device. #{error}"
      return -1
    end

    # Allocate parameters object and fill it with default values
    params = ALSA.snd_pcm_hw_params_alloca.as(ASound::SndPcmHwParamsT)

    ASound.snd_pcm_hw_params_any(pcm_handle, params)

    # Set parameters
    pcm = ASound.snd_pcm_hw_params_set_access(pcm_handle, params, ASound::SndPcmAccessT::SND_PCM_ACCESS_RW_INTERLEAVED)
    if pcm < 0
      error = ASound.snd_strerror pcm
      puts "ERROR: Can't set interleaved mode. #{error}"
    end

    pcm = ASound.snd_pcm_hw_params_set_format(pcm_handle, params, ASound::SndPcmFormatT::SND_PCM_FORMAT_S16_LE)
    if pcm < 0
      error = ASound.snd_strerror pcm
      puts "ERROR: Can't set format. #{error}"
    end

    pcm = ASound.snd_pcm_hw_params_set_channels(pcm_handle, params, channels)
    if pcm < 0
      error = ASound.snd_strerror pcm
      puts "ERROR: Can't set channels number. #{error}"
    end

    pcm = ASound.snd_pcm_hw_params_set_rate_near(pcm_handle, params, pointerof(rate), nil)
    if pcm < 0
      error = ASound.snd_strerror pcm
      puts "ERROR: Can't set rate. #{error}"
    end

    # Write parameters
    pcm = ASound.snd_pcm_hw_params(pcm_handle, params)
    if pcm < 0
      error = ASound.snd_strerror pcm
      puts "ERROR: Can't set harware parameters. #{error}"
    end

    # Resume information
    name = ASound.snd_pcm_name(pcm_handle).value
    puts "PCM name: '#{name}'"

    state_name = ASound.snd_pcm_state_name(ASound.snd_pcm_state(pcm_handle)).value
    puts "PCM state: #{state_name}"

    ASound.snd_pcm_hw_params_get_channels(params, out tmp)
    puts "channels: #{tmp}"

    if tmp == 1_u32
      puts "(mono)"
    elsif tmp == 2_u32
      puts "(stereo)"
    end

    ASound.snd_pcm_hw_params_get_rate(params, pointerof(tmp), nil)
    puts "rate: #{tmp} bps"

    puts "seconds: #{seconds}"

    # Allocate buffer to hold single period
    ASound.snd_pcm_hw_params_get_period_size(params, out frames, nil)

    buff_size = frames * channels * 2
    buff = Bytes.new buff_size

    ASound.snd_pcm_hw_params_get_period_time(params, pointerof(tmp), nil)

    file = File.open file_name

    loops = (seconds * 1000000) / tmp
    loops.times do
      pcm = file.read_fully? buff
      if pcm.nil?
        puts "Early end of file."
        ASound.snd_pcm_drain pcm_handle
        ASound.snd_pcm_close pcm_handle
        return 0
      end

      pcm = ASound.snd_pcm_writei(pcm_handle, buff.to_unsafe, frames)
      if pcm == -LibC::EPIPE
        puts "XRUN."
      elsif pcm < 0
        error = ASound.snd_strerror pcm
        puts "ERROR. Can't write to PCM device. #{error}"
      end
    end

    ASound.snd_pcm_drain pcm_handle
    ASound.snd_pcm_close pcm_handle
    0
  end

  main
end
