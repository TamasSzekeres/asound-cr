module ALSA::C
  @[Link("asound")]
  lib ASound
    # The mixer interface.

    # Mixer handle
    alias SndMixerT = Void*
    # Mixer elements class handle
    alias SndMixerClassT = Void*
    # Mixer element handle
    alias SndMixerElemT = Void*

    # Mixer callback function
    alias SndMixerCallbackT = (SndMixerT, UInt32, SndMixerElemT) -> Int32

    # Mixer element callback function
    alias SndMixerElemCallbackT = (SndMixerElemT, UInt32) -> Int32

    # Compare function for sorting mixer elements
    alias SndMixerCompareT = (SndMixerElemT, SndMixerElemT) -> Int32

    # Event callback for the mixer class
    alias SndMixerEventT = (SndMixerClassT, UInt32, SndHctlElemT, SndMixerElemT) -> Int32


    # Mixer element type
    enum SndMixerElemTypeT
      # Simple mixer elements
      SND_MIXER_ELEM_SIMPLE
      SND_MIXER_ELEM_LAST = SND_MIXER_ELEM_SIMPLE
    end

    fun snd_mixer_open(mixer : SndMixerT*, mode : Int32) : Int32
    fun snd_mixer_close(mixer : SndMixerT) : Int32
    fun snd_mixer_first_elem(mixer : SndMixerT) : SndMixerElemT
    fun snd_mixer_last_elem(mixer : SndMixerT) : SndMixerElemT
    fun snd_mixer_handle_events(mixer : SndMixerT) : Int32
    fun snd_mixer_attach(mixer : SndMixerT, name : UInt8*) : Int32
    fun snd_mixer_attach_hctl(mixer : SndMixerT, hctl : SndHctlT) : Int32
    fun snd_mixer_detach(mixer : SndMixerT, name : UInt8*) : Int32
    fun snd_mixer_detach_hctl(mixer : SndMixerT, hctl : SndHctlT) : Int32
    fun snd_mixer_get_hctl(mixer : SndMixerT, name : UInt8*, hctl : SndHctlT*) : Int32
    fun snd_mixer_poll_descriptors_count(mixer : SndMixerT) : Int32
    fun snd_mixer_poll_descriptors(mixer : SndMixerT, pfds : Pollfd*, space : UInt32) : Int32
    fun snd_mixer_poll_descriptors_revents(mixer : SndMixerT, pfds : Pollfd*, nfds : UInt32, revents : UInt16*) : Int32
    fun snd_mixer_load(mixer : SndMixerT) : Int32
    fun snd_mixer_free(mixer : SndMixerT) : Void
    fun snd_mixer_wait(mixer : SndMixerT, timeout : Int32) : Int32
    fun snd_mixer_set_compare(mixer : SndMixerT, msort : SndMixerCompareT) : Int32
    fun snd_mixer_set_callback(obj : SndMixerT, val : SndMixerCallbackT) : Void
    fun snd_mixer_get_callback_private(obj : SndMixerT) : Void*
    fun snd_mixer_set_callback_private(obj : SndMixerT, val : Void*) : Void
    fun snd_mixer_get_count(obj : SndMixerT) : UInt32
    fun snd_mixer_class_unregister(clss : SndMixerClassT) : Int32

    fun snd_mixer_elem_next(elem : SndMixerElemT) : SndMixerElemT
    fun snd_mixer_elem_prev(elem : SndMixerElemT) : SndMixerElemT
    fun snd_mixer_elem_set_callback(obj : SndMixerElemT, val : SndMixerElemCallbackT) : Void
    fun snd_mixer_elem_get_callback_private(obj : SndMixerElemT) : Void*
    fun snd_mixer_elem_set_callback_private(obj : SndMixerElemT, val : Void*) : Void
    fun snd_mixer_elem_get_type(obj : SndMixerElemT) : SndMixerElemTypeT

    fun snd_mixer_class_register(class_ : SndMixerClassT, mixer : SndMixerT) : Int32
    fun snd_mixer_elem_new(elem : SndMixerElemT, type : SndMixerElemTypeT,
          compare_weight : Int32, private_data : Void*, private_free : (SndMixerElemT) -> Void) : Int32
    fun snd_mixer_elem_add(elem : SndMixerElemT, class_ : SndMixerClassT) : Int32
    fun snd_mixer_elem_remove(elem : SndMixerElemT) : Int32
    fun snd_mixer_elem_free(elem : SndMixerElemT) : Void
    fun snd_mixer_elem_info(elem : SndMixerElemT) : Int32
    fun snd_mixer_elem_value(elem : SndMixerElemT) : Int32
    fun snd_mixer_elem_detach(melem : SndMixerElemT, helem : SndHctlElemT) : Int32
    fun snd_mixer_elem_attach(melem : SndMixerElemT, helem : SndHctlElemT) : Int32
    fun snd_mixer_elem_empty(melem : SndMixerElemT) : Int32
    fun snd_mixer_elem_get_private(melem : SndMixerElemT) : Void*

    fun snd_mixer_class_sizeof() : LibC::SizeT
    fun snd_mixer_class_malloc(ptr : SndMixerClassT*) : Int32
    fun snd_mixer_class_free(obj : SndMixerClassT) : Void
    fun snd_mixer_class_copy(dst : SndMixerClassT, src : SndMixerClassT) : Void
    fun snd_mixer_class_get_mixer(class_ : SndMixerClassT) : SndMixerT
    fun snd_mixer_class_get_event(class_ : SndMixerClassT) : SndMixerEventT
    fun snd_mixer_class_get_private(class_ : SndMixerClassT) : Void*
    fun snd_mixer_class_get_compare(class_ : SndMixerClassT) : SndMixerCompareT
    fun snd_mixer_class_set_event(class_ : SndMixerClassT, event : SndMixerEventT) : Int32
    fun snd_mixer_class_set_private(class_ : SndMixerClassT, private_data : Void*) : Int32
    fun snd_mixer_class_set_private_free(class_ : SndMixerClassT, private_free : (SndMixerClassT) -> Void) : Int32
    fun snd_mixer_class_set_compare(class_ : SndMixerClassT, compare : SndMixerCompareT) : Int32

    #  The simple mixer interface.

    # Simple mixer elements API

    # Mixer simple element channel identifier
    enum SndMixerSelemChannelIdT
      # Unknown
      SND_MIXER_SCHN_UNKNOWN = -1
      # Front left
      SND_MIXER_SCHN_FRONT_LEFT = 0
      # Front right
      SND_MIXER_SCHN_FRONT_RIGHT
      # Rear left
      SND_MIXER_SCHN_REAR_LEFT
      # Rear right
      SND_MIXER_SCHN_REAR_RIGHT
      # Front center
      SND_MIXER_SCHN_FRONT_CENTER
      # Woofer
      SND_MIXER_SCHN_WOOFER
      # Side Left
      SND_MIXER_SCHN_SIDE_LEFT
      # Side Right
      SND_MIXER_SCHN_SIDE_RIGHT
      # Rear Center
      SND_MIXER_SCHN_REAR_CENTER
      SND_MIXER_SCHN_LAST = 31
      # Mono (Front left alias)
      SND_MIXER_SCHN_MONO = SND_MIXER_SCHN_FRONT_LEFT
    end

    # Mixer simple element - register options - abstraction level
    enum SndMixerSelemRegoptAbstract
      # no abstraction - try use all universal controls from driver
      SND_MIXER_SABSTRACT_NONE = 0
      # basic abstraction - Master,PCM,CD,Aux,Record-Gain etc.
      SND_MIXER_SABSTRACT_BASIC
    end

    # Mixer simple element - register options
    struct SndMixerSelemRegopt
      # structure version
      ver : Int32
      # v1: abstract layer selection
      abstract : SndMixerSelemRegoptAbstract
      # v1: device name (must be NULL when playback_pcm or capture_pcm != NULL)
      device : UInt8*
      # v1: playback PCM connected to mixer device (NULL == none)
      playback_pcm : SndPcmT
      # v1: capture PCM connected to mixer device (NULL == none)
      capture_pcm : SndPcmT
    end

    # Mixer simple element identifier
    alias SndMixerSelemIdT = Void*

    fun snd_mixer_selem_channel_name(channel : SndMixerSelemChannelIdT) : UInt32*

    fun snd_mixer_selem_register(mixer : SndMixerT, options : SndMixerSelemRegopt*, classp : SndMixerClassT*) : Int32
    fun snd_mixer_selem_get_id(element : SndMixerElemT, id : SndMixerSelemIdT) : Void
    fun snd_mixer_selem_get_name(elem : SndMixerElemT) : UInt8*
    fun snd_mixer_selem_get_index(elem : SndMixerElemT) : UInt32
    fun snd_mixer_find_selem(mixer : SndMixerT, id : SndMixerSelemIdT) : SndMixerElemT

    fun snd_mixer_selem_is_active(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_is_playback_mono(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_playback_channel(obj : SndMixerElemT, channel : SndMixerSelemChannelIdT) : Int32
    fun snd_mixer_selem_is_capture_mono(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_capture_channel(obj : SndMixerElemT, channel : SndMixerSelemChannelIdT) : Int32
    fun snd_mixer_selem_get_capture_group(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_common_volume(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_playback_volume(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_playback_volume_joined(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_capture_volume(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_capture_volume_joined(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_common_switch(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_playback_switch(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_playback_switch_joined(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_capture_switch(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_capture_switch_joined(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_has_capture_switch_exclusive(elem : SndMixerElemT) : Int32

    fun snd_mixer_selem_ask_playback_vol_dB(elem : SndMixerElemT, value : Int64, dBvalue : Int64*) : Int32
    fun snd_mixer_selem_ask_capture_vol_dB(elem : SndMixerElemT, value : Int64, dBvalue : Int64*) : Int32
    fun snd_mixer_selem_ask_playback_dB_vol(elem : SndMixerElemT, dBvalue : Int64, dir : Int32, value : Int64*) : Int32
    fun snd_mixer_selem_ask_capture_dB_vol(elem : SndMixerElemT, dBvalue : Int64, dir : Int32, value : Int64*) : Int32
    fun snd_mixer_selem_get_playback_volume(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int64*) : Int32
    fun snd_mixer_selem_get_capture_volume(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int64*) : Int32
    fun snd_mixer_selem_get_playback_dB(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int64*) : Int32
    fun snd_mixer_selem_get_capture_dB(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int64*) : Int32
    fun snd_mixer_selem_get_playback_switch(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int32*) : Int32
    fun snd_mixer_selem_get_capture_switch(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int32*) : Int32
    fun snd_mixer_selem_set_playback_volume(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int64) : Int32
    fun snd_mixer_selem_set_capture_volume(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int64) : Int32
    fun snd_mixer_selem_set_playback_dB(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int64, dir : Int32) : Int32
    fun snd_mixer_selem_set_capture_dB(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int64, dir : Int32) : Int32
    fun snd_mixer_selem_set_playback_volume_all(elem : SndMixerElemT, value : Int64) : Int32
    fun snd_mixer_selem_set_capture_volume_all(elem : SndMixerElemT, value : Int64) : Int32
    fun snd_mixer_selem_set_playback_dB_all(elem : SndMixerElemT, value : Int64, dir : Int32) : Int32
    fun snd_mixer_selem_set_capture_dB_all(elem : SndMixerElemT, value : Int64, dir : Int32) : Int32
    fun snd_mixer_selem_set_playback_switch(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int32) : Int32
    fun snd_mixer_selem_set_capture_switch(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, value : Int32) : Int32
    fun snd_mixer_selem_set_playback_switch_all(elem : SndMixerElemT, value : Int32) : Int32
    fun snd_mixer_selem_set_capture_switch_all(elem : SndMixerElemT, value : Int32) : Int32
    fun snd_mixer_selem_get_playback_volume_range(elem : SndMixerElemT, min : Int64*, max : Int64*) : Int32
    fun snd_mixer_selem_get_playback_dB_range(elem : SndMixerElemT, min : Int64*, max : Int64*) : Int32
    fun snd_mixer_selem_set_playback_volume_range(elem : SndMixerElemT, min : Int64, max : Int64) : Int32
    fun snd_mixer_selem_get_capture_volume_range(elem : SndMixerElemT, min : Int64*, max : Int64*) : Int32
    fun snd_mixer_selem_get_capture_dB_range(elem : SndMixerElemT, min : Int64*, max : Int64*) : Int32
    fun snd_mixer_selem_set_capture_volume_range(elem : SndMixerElemT, min : Int64, max : Int64) : Int32

    fun snd_mixer_selem_is_enumerated(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_is_enum_playback(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_is_enum_capture(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_get_enum_items(elem : SndMixerElemT) : Int32
    fun snd_mixer_selem_get_enum_item_name(elem : SndMixerElemT, idx : UInt32, maxlen : LibC::SizeT, str : UInt8*) : Int32
    fun snd_mixer_selem_get_enum_item(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, idxp : UInt32*) : Int32
    fun snd_mixer_selem_set_enum_item(elem : SndMixerElemT, channel : SndMixerSelemChannelIdT, idx : UInt32) : Int32

    fun snd_mixer_selem_id_sizeof() : LibC::SizeT
    fun snd_mixer_selem_id_malloc(ptr : SndMixerSelemIdT*) : Int32
    fun snd_mixer_selem_id_free(obj : SndMixerSelemIdT) : Void
    fun snd_mixer_selem_id_copy(dst : SndMixerSelemIdT, src : SndMixerSelemIdT) : Void
    fun snd_mixer_selem_id_get_name(obj : SndMixerSelemIdT) : UInt8*
    fun snd_mixer_selem_id_get_index(obj : SndMixerSelemIdT) : UInt32
    fun snd_mixer_selem_id_set_name(obj : SndMixerSelemIdT, val : UInt8*) : Void
    fun snd_mixer_selem_id_set_index(obj : SndMixerSelemIdT, val : UInt32) : Void
  end

  @[AlwaysInline]
  def self.snd_mixer_class_alloca : ASound::SndMixerClassT
    LibC.malloc(ASound.snd_mixer_class_sizeof).as(ASound::SndMixerClassT)
  end

  @[AlwaysInline]
  def self.snd_mixer_selem_id_alloca : ASound::SndMixerSelemIdT
    LibC.malloc(ASound.snd_mixer_selem_id_sizeof).as(ASound::SndMixerSelemIdT)
  end
end
