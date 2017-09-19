require "./c/pcm"

module ALSA
  include ALSA::C

  # PCM Subformat Mask
  class PcmSubformatMask
    def initialize
      res = ASound.snd_pcm_subformat_mask_malloc(out @mask)
      raise AlsaException.new(res) unless res == 0
      ASound.snd_pcm_subformat_mask_any(@mask)
    end

    def finalize
      ASound.snd_pcm_subformat_mask_free(@mask)
    end

    def self.sizeof
      ASound.snd_pcm_subformat_mask_sizeof
    end

    def dup : PcmSubformatMask
      copy = PcmSubformatMask.new
      ASound.snd_pcm_subformat_mask_copy(copy.to_unsafe, @mask)
      copy
    end

    # Reset all bits.
    def none
      ASound.snd_pcm_subformat_mask_none(@mask)
      self
    end

    # Test the presence of a format.
    def test(val : PcmSubformat) : Bool
      ASound.snd_pcm_subformat_mask_test(@mask, ASound::SndPcmSubformatMaskT.new(val.value)) == 1
    end

    def empty? : Bool
      ASound.snd_pcm_subformat_mask_empty(@mask) == 1
    end

    # Make a format presented.
    def set(val : PcmSubformat)
      ASound.snd_pcm_subformat_mask_set(@mask, ASound::SndPcmSubformatT.new(val.value))
      self
    end

    # Make a format missing.
    def reset(val : PcmSubformat)
      ASound.snd_pcm_subformat_mask_reset(@mask, ASound::SndPcmSubformatT.new(val.value))
      self
    end

    def to_unsafe : ASound::SndPcmSubformatMaskT
      @mask
    end
  end
end
