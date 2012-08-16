notifying_action :enable do
  name  = new_resource.name
  url   = new_resource.url
  limit = new_resource.limit
  schedule  = new_resource.schedule
  base_path = new_resource.base_path
  
  # setup the centos mirror scripts
  template "#{base_path}/bin/#{name}-mirror" do
    source "mirror.erb"
    owner new_resource.owner
    group new_resource.group
    mode 0755
    variables( 
      :exclude_file     => "#{base_path}/bin/exclude-#{name}",
      :mirror_location  => url,
      :repo_destination => "#{base_path}/stage/#{name}",
      :bandwidth_limit  => limit
    )
  end

  template "#{base_path}/bin/exclude-#{name}" do
    source "exclude.erb"
    owner new_resource.owner
    group new_resource.group
    mode 0664
    variables( :excludes => exclude ) 
  end

  template "#{base_path}/bin/promote-#{name}" do
    source "promote.erb"
    owner new_resource.owner
    group new_resource.group
    mode 0755
    variables(
      :exclude_file     => "#{base_path}/bin/exclude-#{name}",
      :source => "#{base_path}/stage/#{name}/",
      :dest   => "#{base_path}/prod/#{name}/"
    )
  end
    
  cron_command =  "#{base_path}/bin/mirror-#{name}"
  if current_resource.auto_promote == true
    cron_command << " && #{base_path}/bin/promote-#{name}"
  end

  cron "mirror-#{name}" do
    minute schedule[:minute]
    hour schedule[:hour]
    day  schedule[:day]
    month schedule[:month]
    weekday schedule[:weekday]
    command cron_command
  end
end

notifying_action :disable do
  cron "mirror-#{name}" do 
    action :delete
  end
end
