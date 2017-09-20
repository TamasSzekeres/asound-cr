require "./c/pcm"

module ALSA
  include ALSA::C

  # Wrapper for ASound::SndPcmAudioTstampConfigT
  struct PcmAudioTstampConfig
    def initialize
      @config = ASound::SndPcmAudioTstampConfigT.new
    end

    def type_requested : UInt16
      @config.bits & 15_u16
    end

    def type_requested=(type_requested : UInt16)
      @config.bits &= ~15_u16
      @config.bits |= (type_requested & 15_u16)
    end

    def report_delay : UInt16
      (@config.bits >> 4_u16) & 1_u16
    end

    def report_delay=(report_delay : UInt16)
      bit = report_delay & 1_u16
      if bit == 1_u16
        @config.bits |= (1_u16 << 4_u16)
      else
        @config.bits &= ~(1_u16 << 4_u16)
      end
    end

    def bits : UInt16
      @config.bits
    end

    def bits=(bits : UInt16)
      @config.bits = bits
    end

    # Returns the underlieing structure.
    def config : ASound::SndPcmAudioTstampConfigT
      @config
    end
  end
end
