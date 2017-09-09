module ALSA::C
  @[Link("asound")]
  lib ASound
    # Global Global defines and functions
    #  Global defines and functions.
    #  The ALSA library implementation uses these macros and functions.
    #  Most applications probably do not need them.

    fun snd_asoundlib_version() : UInt8*

    struct SndDlsymLink
      next : SndDlsymLink*
      dlsym_name : UInt8*
      dlsym_ptr : UInt8*
    end

    $snd_dlsym_start : SndDlsymLink*

    fun snd_dlopen(file : UInt8*, mode : Int32) : Void*
    fun snd_dlsym(handle : Void*, name : UInt8*, version : UInt8*) : Void*
    fun snd_dlclose(handle : Void*) : Int32

    # Internal structure for an async notification client handler.
    #
    # The ALSA library uses a pointer to this structure as a handle to an async
    # notification object. Applications don't access its contents directly.
    alias SndAsyncHandlerT = Void*

    # Async notification callback.
    #
    # See the #snd_async_add_handler function for details.
    alias SndAsyncCallbackT = SndAsyncHandlerT -> Void

    fun snd_async_add_handler(handler : SndAsyncHandlerT*, fd : Int32, callback : SndAsyncCallbackT, private_data : Void*) : Int32
    fun snd_async_del_handler(handler : SndAsyncHandlerT) : Int32
    fun snd_async_handler_get_fd(handler : SndAsyncHandlerT) : Int32
    fun snd_async_handler_get_signo(handler : SndAsyncHandlerT) : Int32
    fun snd_async_handler_get_callback_private(handler : SndAsyncHandlerT) : Void*

    #fun snd_shm_area_create(shmid : Int32, ptr : Void*) : SndShmArea*
    #fun snd_shm_area_share(area : SndShmArea) : SndShmArea*
    #fun snd_shm_area_destroy(area : SndShmArea*) : Int32

    fun snd_user_file(file : UInt8*, result : UInt8**) : Int32

    struct Timeval
      tv_sec : LibC::TimeT # seconds
      tv_usec : Int64 # microseconds
    end

    struct Timespec
      tv_sec : LibC::TimeT  # seconds
      tv_nsec : Int64 # nanoseconds
    end

    # Timestamp
    alias SndTimestampT = Timeval
    # Hi-res timestamp
    alias SndHTimestampT = Timespec
  end
end
