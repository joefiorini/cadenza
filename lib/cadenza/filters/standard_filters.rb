# adds slashes to \, ', and " characters in the given string
define_filter :addslashes do |string|
   word = string.dup
   word.gsub!(/\\/, "\\\\\\\\")
   word.gsub!(/'/, "\\\\'")
   word.gsub!(/"/, "\\\"")
   word
end

# capitalizes the first letter of the string
define_filter :capitalize, &:capitalize

# centers the string in a fixed width field with the given padding
define_filter :center do |string, length, padding=' '|
   string.center(length, padding)
end

# removes all instances of the given string from the string
define_filter :cut do |string, value|
   string.gsub(value, '')
end

# formats the given date object with the given format string
define_filter :date do |date, format='%F'|
   date.strftime(format)
end