/**
 * Collection of methods for manipulating strings
 * @returns
 */
function StringUtils() 
{
	
}
/**
 * Tests whether the specified string starts with the specified prefix
 * @param str String to test
 * @param prefix String to look for
 * @returns {boolean}
 */
StringUtils.startsWith = function(str, prefix) {
	
	if (str && prefix)
	{
		if (str.length >= prefix.length)
		{
			if (str.substring(0, prefix.length) === prefix)
			{
				return true;
			}
		}
	}
	
	return false;
};