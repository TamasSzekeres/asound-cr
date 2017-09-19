require "./c/pcm"

module ALSA
  include ALSA::C

  # PCM software configuration
  class PcmSwParams
    def initialize(@pcm : Pcm, @params : ASound::SndPcmSwParamsT)
    end
  end
end
