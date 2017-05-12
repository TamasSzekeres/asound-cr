module ALSA
  @[Link("asound")]
  lib ASound
    # Config Configuration Interface
    # The configuration functions and types allow you to read, enumerate,
    # modify and write the contents of ALSA configuration files.

    # dlsym version for the config evaluate callback.
    #SND_CONFIG_DLSYM_VERSION_EVALUATE = _dlsym_config_evaluate_001
    # dlsym version for the config hook callback.
    #SND_CONFIG_DLSYM_VERSION_HOOK  = _dlsym_config_hook_001

    # Configuration node type.
    enum SndConfigTypeT
      # Integer number.
      SND_CONFIG_TYPE_INTEGER,
      # 64-bit integer number.
      SND_CONFIG_TYPE_INTEGER64
      # Real number.
      SND_CONFIG_TYPE_REAL
      # Character string.
      SND_CONFIG_TYPE_STRING
      # Pointer (runtime only, cannot be saved).
      SND_CONFIG_TYPE_POINTER
      # Compound node.
      SND_CONFIG_TYPE_COMPOUND = 1024
    end

    # Internal structure for a configuration node object.
    #
    # The ALSA library uses a pointer to this structure as a handle to a
    # configuration node. Applications don't access its contents directly.
    alias SndConfigT = Void*

    # Type for a configuration compound iterator.
    #
    # The ALSA library uses this pointer type as a handle to a configuration
    # compound iterator. Applications don't directly access the contents of
    # the structure pointed to by this type.
    alias SndConfigIteratorT = Void*

    # Internal structure for a configuration private update object.
    #
    # The ALSA library uses this structure to save private update information.
    alias SndConfigUpdateT = Void*

    #snd_config : SndConfigT*
    #extern snd_config_t *snd_config;

    fun snd_config_top(config : SndConfigT*) : Int32

    fun snd_config_load(config : SndConfigT, in : SndInputT*) : Int32
    fun snd_config_load_override(config : SndConfigT, in : SndInputT*) : Int32
    fun snd_config_save(config : SndConfigT, out : SndOutputT*) : Int32
    fun snd_config_update() : Int32
    fun snd_config_update_r(top : SndConfigT*, update : SndConfigUpdateT*, path : UInt8*) : Int32
    fun snd_config_update_free(update : SndConfigUpdateT) : Int32
    fun snd_config_update_free_global() : Int32

    fun snd_config_search(config : SndConfigT, key : UInt8*, result : SndConfigT*) : Int32
    fun snd_config_searchv(config : SndConfigT, result : SndConfigT*, ...) : Int32
    fun snd_config_search_definition(config : SndConfigT, base : UInt8*, key : UInt8*, result : SndConfigT*) : Int32

    fun snd_config_expand(config : SndConfigT, root : SndConfigT, args : UInt8*, private_data : SndConfigT, result : SndConfigT*) : Int32
    fun snd_config_evaluate(config : SndConfigT, root : SndConfigT, private_data : SndConfigT, result : SndConfigT*) : Int32

    fun snd_config_add(config : SndConfigT, leaf : SndConfigT) : Int32
    fun snd_config_delete(config : SndConfigT) : Int32
    fun snd_config_delete_compound_members(config : SndConfigT) : Int32
    fun snd_config_copy(dst : SndConfigT*, src : SndConfigT) : Int32

    fun snd_config_make(config : SndConfigT*, key : UInt8*, type : SndConfigTypeT) : Int32
    fun snd_config_make_integer(config : SndConfigT*, key : UInt8*) : Int32
    fun snd_config_make_integer64(config : SndConfigT*, key : UInt8*) : Int32
    fun snd_config_make_real(config : SndConfigT*, key : UInt8*) : Int32
    fun snd_config_make_string(config : SndConfigT*, key : UInt8*) : Int32
    fun snd_config_make_pointer(config : SndConfigT*, key : UInt8*) : Int32
    fun snd_config_make_compound(config : SndConfigT*, key : UInt8*, join : Int32) : Int32

    fun snd_config_imake_integer(config : SndConfigT*, key : UInt8*, value : Int64) : Int32
    fun snd_config_imake_integer64(config : SndConfigT*, key : UInt8*, value : Int64) : Int32
    fun snd_config_imake_real(config : SndConfigT*, key : UInt8*, value : Float64) : Int32
    fun snd_config_imake_string(config : SndConfigT*, key : UInt8*, ascii : UInt8*) : Int32
    fun snd_config_imake_safe_string(config : SndConfigT*, key : UInt8*, ascii : UInt8*) : Int32
    fun snd_config_imake_pointer(config : SndConfigT*, key : UInt8*, ptr : Void*) : Int32

    fun snd_config_get_type(config : SndConfigT) : SndConfigTypeT

    fun snd_config_set_id(config : SndConfigT, id : UInt8*) : Int32
    fun snd_config_set_integer(config : SndConfigT, value : Int64) : Int32
    fun snd_config_set_integer64(config : SndConfigT, value : Int64) : Int32
    fun snd_config_set_real(config : SndConfigT, value : Float64) : Int32
    fun snd_config_set_string(config : SndConfigT, value : UInt8) : Int32
    fun snd_config_set_ascii(config : SndConfigT, ascii : UInt8*) : Int32
    fun snd_config_set_pointer(config : SndConfigT, ptr : Void*) : Int32
    fun snd_config_get_id(config : SndConfigT, value : UInt8**) : Int32
    fun snd_config_get_integer(config : SndConfigT, value : Int64) : Int32
    fun snd_config_get_integer64(config : SndConfigT, value : Int64*) : Int32
    fun snd_config_get_real(config : SndConfigT, value : Float64*) : Int32
    fun snd_config_get_ireal(config : SndConfigT, value : Float64*) : Int32
    fun snd_config_get_string(config : SndConfigT, value : UInt8**) : Int32
    fun snd_config_get_ascii(config : SndConfigT, value : UInt8**) : Int32
    fun snd_config_get_pointer(config : SndConfigT, value : Void**) : Int32
    fun snd_config_test_id(config : SndConfigT, id : UInt8*) : Int32

    fun snd_config_iterator_first(node : SndConfigT) : SndConfigIteratorT
    fun snd_config_iterator_next(iterator : SndConfigIteratorT) : SndConfigIteratorT
    fun snd_config_iterator_end(node : SndConfigT) : SndConfigIteratorT
    fun snd_config_iterator_entry(iterator : SndConfigIteratorT) : SndConfigT

    # Helper macro to iterate over the children of a compound node.
    # param[in,out] pos Iterator variable for the current node.
    # param[in,out] next Temporary iterator variable for the next node.
    # param[in] node Handle to the compound configuration node to iterate over.
    #
    # This macro allows deleting or removing the current node.

    #define snd_config_for_each(pos, next, node) \
    #  for (pos = snd_config_iterator_first(node), next = snd_config_iterator_next(pos); pos != snd_config_iterator_end(node); pos = next, next = snd_config_iterator_next(pos))

    # Misc functions

    fun snd_config_get_bool_ascii(ascii : UInt8*) : Int32
    fun snd_config_get_bool(conf : SndConfigT) : Int32
    fun snd_config_get_ctl_iface_ascii(ascii : UInt8*) : Int32
    fun snd_config_get_ctl_iface(conf : SndConfigT) : Int32

    # Names functions

    # Device-name list element (definition)
    struct SndDevnameT
      name : UInt8* # Device name string
      comment : UInt8* # Comments
      next : SndDevnameT* # Next pointer
    end

    fun snd_names_list(iface : UInt8*, list : SndDevnameT**) : Int32
    fun snd_names_list_free(list : SndDevnameT*) : Void
  end
end
