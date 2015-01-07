
require 'pry'

alphabet = {'a' => 'alpha','b' => 'bravo', 'c' => 'charlie', 'd' => 'danger', 
	        'e' => 'expo', 'f' => 'foreword', 'g' => 'green', 'h' => 'habit', 
	        'i' => 'igloo', 'j' => 'jango', 'k' => 'kingship', 'l' => 'lively',
	    	'm' => 'mortar', 'n' => 'neverwinter', 'o' => 'obtuse', 'p' => 'penguin',
	    	'q' => 'quiet', 'r' => 'resistance', 's' => 'security', 't' => 'titanium',
	    	'u' => 'ultimate', 'v' => 'victory', 'w' => 'wisdom', 'x' => 'xtreme',
	    	'y' => 'yoyo', 'z' => 'zanzibar'}

alphabet2 = alphabet.invert

def encode(msg,alphabet)
	msg.each_char do |c|
		# For particular letter 'c' key, do alphabet[c]

		puts alphabet[c]
	end
end


def decode(msg,alphabet2)
	msg.split.each do |b|

		puts alphabet2[b]
	end
end	

encode('okey day', alphabet)

decode('obtuse kingship expo yoyo  danger alpha yoyo', alphabet2)