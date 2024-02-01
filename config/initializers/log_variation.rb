# Since this is used outside of a request context, we define a service user.
# This can contian properties unique to this service, and allows you to target
# services in the same way you would target app users.
$service_user = DevCycle::User.new({ user_id: 'api-servce' })

def log_variation (idx)
    features = DevCycleClient.all_features($service_user)
    variation_name = features.key?("hello-togglebot") ? features["hello-togglebot"]["variationName"] : "Default"

    wink = DevCycleClient.variable_value($service_user, "togglebot-wink", false)
    speed = DevCycleClient.variable_value($service_user, "togglebot-speed", "off")

    spin_chars = speed == 'slow' ? ['◜', '◝', '◞', '◟'] : ['◜', '◠', '◝', '◞', '◡', '◟']
    spinner = speed == 'off' ? '○' : spin_chars[idx % spin_chars.length]
    face = wink ? '(- ‿ ○)' : '(○ ‿ ○)'

    frame = "#{spinner} Serving variation: #{variation_name} #{face}"
    color = speed == 'surprise' ? 'rainbow' : 'blue'

    write_to_console frame, color

    timeout = speed == 'off' || speed == 'slow' ? 500 : 100
	sleep timeout / 1000.0

    log_variation((idx + 1) % spin_chars.length)
end

def add_color (text, color)
    colors = {
        "red" => "\033[91m",
        "green" => "\033[92m",
        "yellow" => "\033[93m",
        "blue" => "\033[94m",
        "magenta" => "\033[95m",
        "rainbow" => "\033[38;5;#{Time.now.to_i % 230}m"
    }
	end_char = "\033[0m"

	return colors.key?(color) ? colors[color] + text + end_char : text
end

def write_to_console (frame, color)
    frame = add_color(frame, color)
    $stdout.write "\x1b[K  #{frame}\r"
end

Thread.new do
    log_variation 0
end