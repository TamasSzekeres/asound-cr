require "./c/pcm"

module ALSA
  include ALSA::C

  class PcmHwParams
    def initialize(pcm : Pcm)
      # Allocate parameters object and fill it with default values
      @params = ALSA::C.snd_pcm_hw_params_alloca.as(ASound::SndPcmHwParamsT)
      @pcm = pcm
      ASound.snd_pcm_hw_params_any(@pcm.to_unsafe, @params)
    end

    def finalize
      ASound.snd_pcm_hw_params_free @params
    end

    def access : PcmAccess
      ASound.snd_pcm_hw_params_get_access @params, out access
      PcmAccess.new access.value
    end

    def access=(access : PcmAccess)
      ASound.snd_pcm_hw_params_set_access @pcm.to_unsafe, @params, ASound::SndPcmAccessT.new(access.value)
      self
    end

    def channels : UInt32
      ASound.snd_pcm_hw_params_get_channels @params, out channels
      channels
    end

    def channels=(channels : UInt32)
      res = ASound.snd_pcm_hw_params_set_channels @pcm.to_unsafe, @params, channels
      raise AlsaException.new(res) unless res == 0
      self
    end

    def format() : PcmFormat
      ASound.snd_pcm_hw_params_get_format @params, out format
      PcmFormat.new format.value
    end

    def format=(format : PcmFormat)
      res = ASound.snd_pcm_hw_params_set_format @pcm.to_unsafe, @params, ASound::SndPcmFormatT.new(format.value)
      raise AlsaException.new(res) unless res == 0
      self
    end

    def period_size : NamedTuple(frames: UInt64, dir: Int32)
      ASound.snd_pcm_hw_params_get_period_size @params, out frames, out dir
      {frames: frames, dir: dir}
    end

    def period_time : NamedTuple(val: UInt32, dir: Int32)
      ASound.snd_pcm_hw_params_get_period_time @params, out val, out dir
      {val: val, dir: dir}
    end

    def rate : NamedTuple(val: UInt32, dir: Int32)
      ASound.snd_pcm_hw_params_get_rate @params, out val, out dir
      {val: val, dir: dir}
    end

    def set_rate_near(val : UInt32, dir : Int32? = nil)
      res = ASound.snd_pcm_hw_params_set_rate_near @pcm.to_unsafe, @params, pointerof(val), dir
      val
    end

    def to_unsafe : ASound::SndPcmHwParamsT
      @params
    end
  end
end
