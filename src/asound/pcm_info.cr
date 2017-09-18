require "./c/pcm"

module ALSA
  include ALSA::C

  class PcmInfo
    def initialize
      ASound.snd_pcm_info_malloc(out @info)
    end

    def finalize
      ASound.snd_pcm_info_free @info
    end

    # Get size of underlieing info structure.
    def self.size
      ASound.snd_pcm_info_sizeof
    end

    # Get device from a PCM info container.
    def device : UInt32
      ASound.snd_pcm_info_get_device @info
    end

    # Get subdevice from a PCM info container.
    def subdevice : UInt32
      ASound.snd_pcm_info_get_subdevice @info
    end

    # Get stream (direction) from a PCM info container.
    def stream : PcmStream
      PcmStream.new ASound.snd_pcm_info_get_stream(@info)
    end

    # Get card from a PCM info container.
    def card : Int32
      ASound.snd_pcm_info_get_card @info
    end

    # Get id from a PCM info container.
    def id : String
      String.new snd_pcm_info_get_id(@info)
    end

    # Get name from a PCM info container.
    def name : String
      String.new ASound.snd_pcm_info_get_name(@info)
    end

    # Get subdevice name from a PCM info container.
    def subdevice_name : String
      String.new snd_pcm_info_get_subdevice_name(@info)
    end

    # Get class from a PCM info container.
    def class : PcmClass
      PcmClass.new ASound.snd_pcm_info_get_class(@info)
    end

    # Get subclass from a PCM info container.
    def subclass : PcmSubclass
      PcmSubclass.new ASound.snd_pcm_info_get_subclass(@info)
    end

    # Get subdevices count from a PCM info container.
    def subdevices_count : UInt32
      ASound.snd_pcm_info_get_subdevices_count @info
    end

    # Get available subdevices count from a PCM info container.
    def subdevices_avail : UInt32
      ASound.snd_pcm_info_get_subdevices_avail @info
    end

    # Get hardware synchronization ID from a PCM info container.
    def sync : ASound::SndPcmSyncIdT
      ASound.snd_pcm_info_get_sync @info
    end

    # Set wanted device inside a PCM info container.
    def device=(val : UInt32)
      ASound.snd_pcm_info_set_device(@info, val)
      self
    end

    # Set wanted subdevice inside a PCM info container.
    def subdevice=(val : UInt32)
      ASound.snd_pcm_info_set_subdevice(@info, val)
      self
    end

    # Set wanted stream inside a PCM info container.
    def stream=(val : PcmStream)
      ASound.snd_pcm_info_set_stream(@info, val.value)
      self
    end

    def to_unsafe : ASound::SndPcmInfoT
      @info
    end
  end
end
