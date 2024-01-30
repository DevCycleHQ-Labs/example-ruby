class HelloController < ApplicationController
  def index
    user = DevCycle::User.new({ user_id: 'user_id_example' })
    features = DevCycleClient.all_features(user)

    @variation_name = features.key?("hello-togglebot") ? features["hello-togglebot"]["variationName"] : "Default"

    @speed = DevCycleClient.variable_value(user, "togglebot-speed", "off")
    case @speed
    when 'slow'
      @message = 'Awesome, look at you go!'
    when 'fast'
      @message = 'This is fun!'
    when 'off-axis'
      @message = '...I\'m gonna be sick...'
    when 'surprise'
      @message = 'What the unicorn?'
    else
      @message = 'Hello! Nice to meet you.'
    end

    @wink = DevCycleClient.variable_value(user, "togglebot-wink", false)
    @togglebot_src = @wink ? 'togglebot-wink.png' : 'togglebot.png'
    if @speed == 'surprise'
      @togglebot_src = 'unicorn.svg'
    end

    @step = DevCycleClient.variable_value(user, "example-text", "default")
    case @step 
    when 'step-1'
      @header = "Welcome to DevCycle's example app."
      @body = "If you got here through the onboarding flow, just follow the instructions to change and create new Variations and see how the app reacts to new Variable values."
    when 'step-2'
      @header = "Great! You've taken the first step in exploring DevCycle."
      @body = "You've successfully toggled your very first Variation. You are now serving a different value to your users and you can see how the example app has reacted to this change. Next, go ahead and create a whole new Variation to see what else is possible in this app."
    when 'step-3'
      @header = "You're getting the hang of things."
      @body = "By creating a new Variation with new Variable values and toggling it on for all users, you've already explored the fundamental concepts within DevCycle. There's still so much more to the platform, so go ahead and complete the onboarding flow and play around with the feature that controls this example in your dashboard."
    else
      @header = "Welcome to DevCycle's example app."
      @body = "If you got to the example app on your own, follow our README guide to create the Feature and Variables you need to control this app in DevCycle."
    end
  end
end
