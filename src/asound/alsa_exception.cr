module ALSA
  class AlsaException < Exception
    getter code : Int32

    def initialize(@code : Int32, message : String? = nil)
      super(message)
    end
  end
end
