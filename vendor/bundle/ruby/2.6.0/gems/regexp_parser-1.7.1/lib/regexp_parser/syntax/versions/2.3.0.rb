module Regexp::Syntax
  class V2_3_0 < Regexp::Syntax::V2_2
    def initialize
      super

      implements :property,    UnicodeProperty::V2_3_0
      implements :nonproperty, UnicodeProperty::V2_3_0
    end
  end
end
