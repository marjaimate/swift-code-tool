# SWIFT Code Tool

SWIFT (BIC) Code Tool for validating 

# Usage
	sc = SWIFTCodeTool::SWIFT.new('deutdeff')

	sc.code
	=> "DEUTDEFF"

	sc.bank_code
	=> "DEUT"

	sc.country_code
	=> "DE"

	sc.location_code
	=> "FF"

	sc.branch_code
	=> ""

	SWIFTCodeTool::SWIFT.valid?('DEUTDEFF')
	=> true

	SWIFTCodeTool::SWIFT.valid?('DEUT DE MU', 'de')
	=> true
