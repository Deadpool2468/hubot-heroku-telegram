module.exports = (robot) ->
  # Dynamically populated list of factoids
  facts =
    fact1: 'stuff'
    fact2: 'other stuff'

  robot.listen(
    # Matcher
    (message) ->
      match = message.match(/^~(.*)$/)
      # Only match if there is a matching factoid
      if match and match[1] in facts
        match[1]
      else
        false
    # Callback
    (response) ->
      fact = response.match
      res.reply "#{fact} is #{facts[fact]}"
  )
