
actions :enable, :disable, :send_notification

# chef 10.10+
default_action :enable

cron_schedule = {
  :minute => "0", 
  :hour => "0", 
  :day => "*",
  :month => "*",
  :weekday => "*" 
}

attribute :exclude, :kind_of => Array, :default => []
attribute :url, :kind_of => String, :default => nil
attribute :base_path, :kind_of => String, :default => nil
attribute :limit, :kind_of => Fixnum, :default => 0
attribute :group, :kind_of => String, :default => "nobody" 
attribute :owner, :kind_of => String, :default => "nobody" 
attribute :schedule, :kind_of => Hash, :default => cron_schedule
attribute :destination, :kind_of => String, :default => ""
attribute :auto_promote, :kind_of => [ TrueClass, FalseClass ], :default => false
