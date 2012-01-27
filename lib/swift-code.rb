#SWIFT / BIC code
#
# Format:
# BBBB CC LL XXX
#
# BBBB => Bank code
# CC => Country code
# LL => Location code
# XXX => Branch code, optional

module SWIFTCodeTool
  class SWIFT
    REGEX = /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/

    def initialize(code)
      @code = SWIFT.canonicalize_code(code)
    end
    
    def code
      @code
    end
    
    def bank_code
      @code[0..3]
    end
    
    def country_code
      @code[4..5]
    end
    
    def location_code
      @code[6..7]
    end
    
    def branch_code
      @code[8..10]
    end
    
    #escape whitespace and convert to uppercase
    def self.canonicalize_code( code )
      code.strip.gsub(/\s+/, '').upcase
    end
    
    def self.valid?(code, country_code = nil)
      new(code).validation_errors(country_code).empty?
    end
    
    def validation_errors(expected_country_code)
      errors = []
      return [:unexpected_country_code] if not expected_country_code.nil? and (country_code != expected_country_code.upcase)
      return [:too_short] if @code.size < 8
      return [:too_long] if @code.size > 11
      return [:bad_chars] unless @code =~ /^[A-Z0-9]+$/
      errors << :bad_format unless @code =~ REGEX
      errors
    end
  end
end

