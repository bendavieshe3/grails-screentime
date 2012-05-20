/*
 * assertions.js
 * Simple assertion functions for javascript
 */

var assert = function(value, msg) {
	"use strict";
	if(!value) {
		throw(msg || (value + "does not equal true"));		
	}	
};

var assertEquals = function(val1, val2, msg) {
	"use strict";
	if(val1 !== val2) {
		throw(msg || (val1 + " does not equal " + val2));
	}	
};



