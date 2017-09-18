require "./c/pcm"

module ALSA
  include ALSA::C

  # PCM Format Mask
  class PcmFormatMask
    def initialize
      res = ASound.snd_pcm_format_mask_malloc(out @mask)
      raise AlsaException.new(res) unless res == 0
      ASound.snd_pcm_format_mask_any(@mask)
    end

    def finalize
      ASound.snd_pcm_format_mask_free(@mask)
    end

    def self.sizeof
      ASound.snd_pcm_format_mask_sizeof
    end

    def dup : PcmFormatMask
      copy = PcmFormatMask.new
      ASound.snd_pcm_format_mask_copy(copy.to_unsafe, @mask)
      copy
    end

    # Reset all bits.
    def none
      ASound.snd_pcm_format_mask_none(@mask)
      self
    end

    # Test the presence of a format.
    def test(val : PcmFormat) : Int32
      ASound.snd_pcm_format_mask_test(@mask, ASound::SndPcmFormatT.new(val.value))
    end

    def empty? : Bool
      ASound.snd_pcm_format_mask_empty(@mask) == 1
    end

    # Make a format presented.
    def set=(val : PcmFormat)
      ASound.snd_pcm_format_mask_set(@mask, ASound::SndPcmFormatT.new(val.value))
      self
    end

    # Make a format missing.
    def reset(val : PcmFormat)
      ASound.snd_pcm_format_mask_reset(@mask, ASound::SndPcmFormatT.new(val.value))
      self
    end

    def to_unsafe : ASound::SndPcmFormatMaskT
      @mask
    end
  end
end
