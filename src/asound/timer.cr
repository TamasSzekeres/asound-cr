module ALSA
  @[Link("asound")]
  lib ASound
    # Timer Timer Interface

    # timer identification structure
    alias SndTimerIdT = Void*
    # timer global info structure
    alias SndTimerGinfoT = Void*
    # timer global params structure
    alias SndTimerGparamsT = Void*
    # timer global status structure
    alias SndTimerGstatusT = Void*
    # timer info structure
    alias SndTimerInfoT = Void*
    # timer params structure
    alias SndTimerParamsT = Void*
    # timer status structure
    alias SndTimerStatusT = Void*

    # timer master class
    enum SndTimerClassT
      SND_TIMER_CLASS_NONE = -1 # invalid
      SND_TIMER_CLASS_SLAVE = 0 # slave timer
      SND_TIMER_CLASS_GLOBAL # global timer
      SND_TIMER_CLASS_CARD # card timer
      SND_TIMER_CLASS_PCM # PCM timer
      SND_TIMER_CLASS_LAST = SND_TIMER_CLASS_PCM # last timer
    end

    # timer slave class
    enum SndTimerSlaveClassT
      SND_TIMER_SCLASS_NONE = 0 # none
      SND_TIMER_SCLASS_APPLICATION # for internal use
      SND_TIMER_SCLASS_SEQUENCER # sequencer timer
      SND_TIMER_SCLASS_OSS_SEQUENCER # OSS sequencer timer
      SND_TIMER_SCLASS_LAST = SND_TIMER_SCLASS_OSS_SEQUENCER # last slave timer
    end

    # timer read event identification
    enum SndTimerEventT
      SND_TIMER_EVENT_RESOLUTION = 0 # val = resolution in ns
      SND_TIMER_EVENT_TICK # val = ticks
      SND_TIMER_EVENT_START # val = resolution in ns
      SND_TIMER_EVENT_STOP # val = 0
      SND_TIMER_EVENT_CONTINUE # val = resolution in ns
      SND_TIMER_EVENT_PAUSE # val = 0
      SND_TIMER_EVENT_EARLY # val = 0
      SND_TIMER_EVENT_SUSPEND # val = 0
      SND_TIMER_EVENT_RESUME # val = resolution in ns
      # master timer events for slave timer instances
      SND_TIMER_EVENT_MSTART = SND_TIMER_EVENT_START + 10
      SND_TIMER_EVENT_MSTOP = SND_TIMER_EVENT_STOP + 10
      SND_TIMER_EVENT_MCONTINUE = SND_TIMER_EVENT_CONTINUE + 10
      SND_TIMER_EVENT_MPAUSE = SND_TIMER_EVENT_PAUSE + 10
      SND_TIMER_EVENT_MSUSPEND = SND_TIMER_EVENT_SUSPEND + 10
      SND_TIMER_EVENT_MRESUME = SND_TIMER_EVENT_RESUME + 10
    end

    # timer read structure
    struct SndTimerReadT
      resolution : UInt32 # tick resolution in nanoseconds
      ticks : UInt32 # count of happened ticks
    end

    # timer tstamp + event read structure
    struct SndTimerTreadT
      event : SndTimerEventT # Timer event
      tstamp : SndHTimestampT # Time stamp of each event
      val : UInt32 # Event value
    end

    # global timer - system
    SND_TIMER_GLOBAL_SYSTEM = 0
    # global timer - RTC
    SND_TIMER_GLOBAL_RTC = 1
    # global timer - HPET
    SND_TIMER_GLOBAL_HPET = 2
    # global timer - HRTIMER
    SND_TIMER_GLOBAL_HRTIMER = 3

    # timer open mode flag - non-blocking behaviour
    SND_TIMER_OPEN_NONBLOCK = (1<<0)
    # use timestamps and event notification - enhanced read
    SND_TIMER_OPEN_TREAD = (1<<1)

    # timer handle type
    enum SndTimerTypeT
      # Kernel level HwDep
      SND_TIMER_TYPE_HW = 0
      # Shared memory client timer (not yet implemented)
      SND_TIMER_TYPE_SHM
      # INET client timer (not yet implemented)
      SND_TIMER_TYPE_INET
    end

    # timer query handle
    alias SndTimerQueryT = Void*
    # timer handle
    alias SndTimerT = Void*


    fun snd_timer_query_open(handle : SndTimerQueryT*, name : UInt8*, mode : Int32) : Int32
    fun snd_timer_query_open_lconf(handle : SndTimerQueryT*, name : UInt8*, mode : Int32, lconf : SndConfigT) : Int32
    fun snd_timer_query_close(handle : SndTimerQueryT) : Int32
    fun snd_timer_query_next_device(handle : SndTimerQueryT, tid : SndTimerIdT) : Int32
    fun snd_timer_query_info(handle : SndTimerQueryT, info : SndTimerGinfoT) : Int32
    fun snd_timer_query_params(handle : SndTimerQueryT, params : SndTimerGparamsT) : Int32
    fun snd_timer_query_status(handle : SndTimerQueryT, status : SndTimerGstatusT) : Int32

    fun snd_timer_open(handle : SndTimerT*, name : UInt8*, mode : Int32) : Int32
    fun snd_timer_open_lconf(handle : SndTimerT*, name : UInt8*, mode : Int32, lconf : SndConfigT) : Int32
    fun snd_timer_close(handle : SndTimerT) : Int32
    fun snd_async_add_timer_handler(handler : SndAsyncHandlerT*, timer : SndTimerT, callback : SndAsyncCallbackT, private_data : Void*) : Int32
    fun snd_async_handler_get_timer(handler : SndAsyncHandlerT) : SndTimerT
    fun snd_timer_poll_descriptors_count(handle : SndTimerT) : Int32
    fun snd_timer_poll_descriptors(handle : SndTimerT, pfds : Pollfd*, space : UInt32) : Int32
    fun snd_timer_poll_descriptors_revents(timer : SndTimerT, pfds : Pollfd*, nfds : UInt32, revents : UInt16*) : Int32
    fun snd_timer_info(handle : SndTimerT, timer : SndTimerInfoT) : Int32
    fun snd_timer_params(handle : SndTimerT, params : SndTimerParamsT) : Int32
    fun snd_timer_status(handle : SndTimerT, status : SndTimerStatusT) : Int32
    fun snd_timer_start(handle : SndTimerT) : Int32
    fun snd_timer_stop(handle : SndTimerT) : Int32
    fun snd_timer_continue(handle : SndTimerT) : Int32
    fun snd_timer_read(handle : SndTimerT, buffer : Void*, size : LibC::SizeT) : LibC::SSizeT

    fun snd_timer_id_sizeof() : LibC::SizeT
    fun snd_timer_id_malloc(ptr : SndTimerIdT*) : Int32
    fun snd_timer_id_free(obj : SndTimerIdT) : Void
    fun snd_timer_id_copy(dst : SndTimerIdT, src : SndTimerIdT) : Void

    fun snd_timer_id_set_class(id : SndTimerIdT, dev_class : Int32) : Void
    fun snd_timer_id_get_class(id : SndTimerIdT) : Int32
    fun snd_timer_id_set_sclass(id : SndTimerIdT, dev_sclass : Int32) : Void
    fun snd_timer_id_get_sclass(id : SndTimerIdT) : Int32
    fun snd_timer_id_set_card(id : SndTimerIdT, card : Int32) : Void
    fun snd_timer_id_get_card(id : SndTimerIdT) : Int32
    fun snd_timer_id_set_device(id : SndTimerIdT, device : Int32) : Void
    fun snd_timer_id_get_device(id : SndTimerIdT) : Int32
    fun snd_timer_id_set_subdevice(id : SndTimerIdT, subdevice : Int32) : Void
    fun snd_timer_id_get_subdevice(id : SndTimerIdT) : Int32

    fun snd_timer_ginfo_sizeof() : LibC::SizeT
    fun snd_timer_ginfo_malloc(ptr : SndTimerGinfoT*) : Int32
    fun snd_timer_ginfo_free(obj : SndTimerGinfoT) : Void
    fun snd_timer_ginfo_copy(dst : SndTimerGinfoT, src : SndTimerGinfoT) : Void

    fun snd_timer_ginfo_set_tid(obj : SndTimerGinfoT, tid : SndTimerIdT) : Int32
    fun snd_timer_ginfo_get_tid(obj : SndTimerGinfoT) : SndTimerIdT
    fun snd_timer_ginfo_get_flags(obj : SndTimerGinfoT) : UInt32
    fun snd_timer_ginfo_get_card(obj : SndTimerGinfoT) : Int32
    fun snd_timer_ginfo_get_id(obj : SndTimerGinfoT) : UInt8*
    fun snd_timer_ginfo_get_name(obj : SndTimerGinfoT) : UInt8*
    fun snd_timer_ginfo_get_resolution(obj : SndTimerGinfoT) : UInt64
    fun snd_timer_ginfo_get_resolution_min(obj : SndTimerGinfoT) : UInt64
    fun snd_timer_ginfo_get_resolution_max(obj : SndTimerGinfoT) : UInt64
    fun snd_timer_ginfo_get_clients(obj : SndTimerGinfoT) : UInt32

    fun snd_timer_info_sizeof() : LibC::SizeT
    fun snd_timer_info_malloc(ptr : SndTimerInfoT*) : Int32
    fun snd_timer_info_free(obj : SndTimerInfoT) : Void
    fun snd_timer_info_copy(dst : SndTimerInfoT, src : SndTimerInfoT) : Void

    fun snd_timer_info_is_slave(info : SndTimerInfoT) : Int32
    fun snd_timer_info_get_card(info : SndTimerInfoT) : Int32
    fun snd_timer_info_get_id(info : SndTimerInfoT) : UInt8*
    fun snd_timer_info_get_name(info : SndTimerInfoT) : UInt8*
    fun snd_timer_info_get_resolution(info : SndTimerInfoT) : Int64

    fun snd_timer_params_sizeof() : LibC::SizeT
    fun snd_timer_params_malloc(ptr : SndTimerParamsT*) : Int32
    fun snd_timer_params_free(obj : SndTimerParamsT) : Void
    fun snd_timer_params_copy(dst : SndTimerParamsT, src : SndTimerParamsT) : Void

    fun snd_timer_params_set_auto_start(params : SndTimerParamsT, auto_start : Int32) : Int32
    fun snd_timer_params_get_auto_start(params : SndTimerParamsT) : Int32
    fun snd_timer_params_set_exclusive(params : SndTimerParamsT, exclusive : Int32) : Int32
    fun snd_timer_params_get_exclusive(params : SndTimerParamsT) : Int32
    fun snd_timer_params_set_early_event(params : SndTimerParamsT, early_event : Int32) : Int32
    fun snd_timer_params_get_early_event(params : SndTimerParamsT) : Int32
    fun snd_timer_params_set_ticks(params : SndTimerParamsT, ticks : Int64) : Void
    fun snd_timer_params_get_ticks(params : SndTimerParamsT) : Int64
    fun snd_timer_params_set_queue_size(params : SndTimerParamsT, queue_size : Int64) : Void
    fun snd_timer_params_get_queue_size(params : SndTimerParamsT) : Int64
    fun snd_timer_params_set_filter(params : SndTimerParamsT, filter : UInt32) : Void
    fun snd_timer_params_get_filter(params : SndTimerParamsT) : UInt32

    fun snd_timer_status_sizeof() : LibC::SizeT
    fun snd_timer_status_malloc(ptr : SndTimerStatusT*) : Int32
    fun snd_timer_status_free(obj : SndTimerStatusT) : Void
    fun snd_timer_status_copy(dst : SndTimerStatusT, src : SndTimerStatusT) : Void

    fun snd_timer_status_get_timestamp(status : SndTimerStatusT) : SndHTimestampT
    fun snd_timer_status_get_resolution(status : SndTimerStatusT) : Int64
    fun snd_timer_status_get_lost(status : SndTimerStatusT) : Int64
    fun snd_timer_status_get_overrun(status : SndTimerStatusT) : Int64
    fun snd_timer_status_get_queue(status : SndTimerStatusT) : Int64

    # deprecated functions, for compatibility
    fun snd_timer_info_get_ticks(info : SndTimerInfoT) : Int64
  end

  @[AlwaysInline]
  def self.snd_timer_id_alloca : ASound::SndTimerIdT
    LibC.malloc(ASound.snd_timer_id_sizeof).as(ASound::SndTimerIdT)
  end

  @[AlwaysInline]
  def self.snd_timer_ginfo_alloca : ASound::SndTimerGinfoT
    LibC.malloc(ASound.snd_timer_ginfo_sizeof).as(ASound::SndTimerGinfoT)
  end

  @[AlwaysInline]
  def self.snd_timer_info_alloca : ASound::SndTimerInfoT
    LibC.malloc(ASound.snd_timer_info_sizeof).as(ASound::SndTimerInfoT)
  end

  @[AlwaysInline]
  def self.snd_timer_params_alloca : ASound::SndTimerParamT
    LibC.malloc(ASound.snd_timer_params_sizeof).as(ASound::SndTimerParamT)
  end

  @[AlwaysInline]
  def self.snd_timer_status_alloca : ASound::SndTimerStatusT
    LibC.malloc(ASound.snd_timer_status_sizeof).as(ASound::SndTimerStatusT)
  end
end
