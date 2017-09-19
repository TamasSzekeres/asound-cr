require "./c/pcm"

module ALSA
  include ALSA::C

  # PCM hardware configuration
  class PcmHwParams
    def initialize(pcm : Pcm)
      # Allocate parameters object and fill it with default values
      @params = ALSA::C.snd_pcm_hw_params_alloca.as(ASound::SndPcmHwParamsT)
      @pcm = pcm
      ASound.snd_pcm_hw_params_any(@pcm.to_unsafe, @params)
    end

    def initialize(@pcm : Pcm, @params : ASound::SndPcmHwParamsT)
    end

    def finalize
      ASound.snd_pcm_hw_params_free @params
    end

    # Get size of underlieing params structure.
    def self.sizeof
      ASound.snd_pcm_hw_params_sizeof
    end

    def dup : PcmHwParams
      copy = PcmHwParams.new @pcm
      ASound.snd_pcm_hw_params_copy(copy.to_unsafe, @params)
      copy
    end

    # Check if hardware supports sample-resolution mmap for given configuration.
    def can_mmap_sample_resolution? : Bool
      ASound.snd_pcm_hw_params_can_mmap_sample_resolution(@params) == 1
    end

    # Check if hardware does double buffering for start/stop for given configuration.
    def is_double? : Bool
      ASound.snd_pcm_hw_params_is_double(@params) == 1
    end

    # Check if hardware does double buffering for data transfers for given configuration.
    def is_batch? : Bool
      ASound.snd_pcm_hw_params_is_batch(@params) == 1
    end

    # Check if hardware does block transfers for samples for given configuration.
    def is_block_transfer? : Bool
      ASound.snd_pcm_hw_params_is_block_transfer(@params) == 1
    end

    # Check if timestamps are monotonic for given configuration.
    def is_monotonic? : Bool
      ASound.snd_pcm_hw_params_is_monotonic(@params) == 1
    end

    # Check if hardware supports overrange detection.
    def can_overrange? : Bool
      ASound.snd_pcm_hw_params_can_overrange(@params) == 1
    end

    # Check if hardware supports pause.
    def can_pause? : Bool
      ASound.snd_pcm_hw_params_can_pause(@params) == 1
    end

    # Check if hardware supports resume.
    def can_resume? : Bool
      ASound.snd_pcm_hw_params_can_resume(@params) == 1
    end

    # Check if hardware does half-duplex only.
    def is_half_duplex? : Bool
      ASound.snd_pcm_hw_params_is_half_duplex(@params) == 1
    end

    # Check if hardware does joint-duplex (playback and capture are somewhat correlated).
    def is_joint_duplex? : Bool
      ASound.snd_pcm_hw_params_is_joint_duplex(@params) == 1
    end

    # Check if hardware supports synchronized start with sample resolution.
    def can_sync_start? : Bool
      ASound.snd_pcm_hw_params_can_sync_start(@params) == 1
    end

    # Check if hardware can disable period wakeups.
    def can_disable_period_wakeup? : Bool
      ASound.snd_pcm_hw_params_can_disable_period_wakeup(@params) == 1
    end

    # Check if hardware supports audio wallclock timestamps.
    def supports_audio_wallclock_ts? : Bool
      ASound.snd_pcm_hw_params_supports_audio_wallclock_ts(@params) == 1
    end

    # Check if hardware supports type of audio timestamps.
    def supports_audio_ts_type?(type : Int32) : Bool
      ASound.snd_pcm_hw_params_supports_audio_ts_type(@params, type) == 1
    end

    # Get rate exact info from a configuration space.
    def snd_pcm_hw_params_get_rate_numden : NamedTuple(rate_num: UInt32, rate_den: UInt32)
      res = ASound.snd_pcm_hw_params_get_rate_numden(@params, out rate_num, rate_den)
      raise AlsaException(res) unless res == 0
      {rate_num: rate_num, rate_den: rate_den}
    end

    # Get sample resolution info from a configuration space.
    def sbits : Int32
      ASound.snd_pcm_hw_params_get_sbits(@params)
    end

    # Get hardware FIFO size info from a configuration space.
    def fifo_size : Int32
      ASound.snd_pcm_hw_params_get_fifo_size(@params)
    end

    # Extract access type from a configuration space.
    def access : PcmAccess
      ASound.snd_pcm_hw_params_get_access @params, out access
      PcmAccess.new access.value
    end

    # Verify if an access type is available inside a configuration space for a PCM.
    def test_access(access : PcmAccess)
      ASound.snd_pcm_hw_params_test_access(@pcm.to_unsafe, @params, ASound.SndPcmAccessT.new(access.value))
      raise AlsaException(res) unless res == 0
      self
    end

    # Restrict a configuration space to contain only one access type.
    def access=(access : PcmAccess)
      ASound.snd_pcm_hw_params_set_access(@pcm.to_unsafe, @params, ASound::SndPcmAccessT.new(access.value))
      self
    end

    # Restrict a configuration space to contain only its first access type.
    def access_first=(access : PcmAccess)
      ASound.snd_pcm_hw_params_set_access_first(@pcm.to_unsafe, @params, ASound::SndPcmAccessT.new(access.value))
      self
    end

    # Restrict a configuration space to contain only its last access type.
    def access_last=(access : PcmAccess)
      ASound.snd_pcm_hw_params_set_access_last(@pcm.to_unsafe, @params, ASound::SndPcmAccessT.new(access.value))
      self
    end

    # Restrict a configuration space to contain only a set of access types.
    def access_mask=(mask : ASound::SndPcmAccessMaskT)
      ASound.snd_pcm_hw_params_set_access_mask(@pcm.to_unsafe, @params, mask)
      self
    end

    def channels : UInt32
      ASound.snd_pcm_hw_params_get_channels(@params, out channels)
      channels
    end

    def channels=(channels : UInt32)
      res = ASound.snd_pcm_hw_params_set_channels(@pcm.to_unsafe, @params, channels)
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
