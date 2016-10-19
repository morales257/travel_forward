APP_CONFIG = YAML.load_file(ERB.new("#{Rails.root}/config/initializers/config.yml"))
