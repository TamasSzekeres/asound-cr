require "./c/pcm"

module ALSA
  include ALSA::C

  # PCM Acess Mask
  class PcmAccessMask
    def initialize
      res = ASound.snd_pcm_access_mask_malloc(out @mask)
      raise AlsaException.new(res) unless res == 0
      ASound.snd_pcm_access_mask_any(@mask)
    end

    def finalize
      ASound.snd_pcm_access_mask_free(@mask)
    end

    def self.sizeof
      ASound.snd_pcm_access_mask_sizeof
    end

    def dup : PcmAccessMask
      copy = PcmAccessMask.new
      ASound.snd_pcm_access_mask_copy(copy.to_unsafe, @mask)
      copy
    end

    # Reset all bits.
    def none
      ASound.snd_pcm_access_mask_none(@mask)
      self
    end

    # Test the presence of an access type.
    def test(val : PcmAccess) : Int32
      ASound.snd_pcm_access_mask_test(@mask, ASound::SndPcmAccessT.new(val.value))
    end

    def empty? : Bool
      ASound.snd_pcm_access_mask_empty(@mask) == 1
    end

    # Make an access type presented.
    def set=(val : PcmAccess)
      ASound.snd_pcm_access_mask_set(@mask, ASound::SndPcmAccessT.new(val.value))
      self
    end

    # Make an access type missing.
    def reset(val : PcmAccess)
      ASound.snd_pcm_access_mask_reset(@mask, ASound::SndPcmAccessT.new(val.value))
      self
    end

    def to_unsafe : ASound::SndPcmAccessMaskT
      @mask
    end
  end
end
