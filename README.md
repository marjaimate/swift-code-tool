# SWIFT Code Tool

SWIFT (BIC) Code Tool for validating 

# Usage
	sc = SWIFTCodeTool::SWIFT.new('deutdeff')

	puts sc.code
	=> "DEUTDEFF"

	puts sc.bank_code
	=> "DEUT"

	puts sc.country_code
	=> "DE"

	puts sc.location_code
	=> "FF"

	puts sc.branch_code
	=> ""

	puts SWIFTCodeTool::SWIFT.valid?('DEUTDEFF')
	=> true

	puts SWIFTCodeTool::SWIFT.valid?('DEUT DE MU', 'de')
	=> true
