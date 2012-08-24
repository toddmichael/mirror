module Repo
  module Mirror
    # TODO: mirror class might be cleaner

    def rsync(name, mirror)
      # if we are a master, and this is an athoritative mirror don't sync
      if node.recipes.include?("mirror::master")
        return if mirror.has_key? :authoritative and  mirror[:authoritative] == true
      end

      if node.recipes.include?("mirror::slave") 
        local_destination = "#{node[:mirror][:base_path]}/prod/#{name}"
      end

      mirror_rsync name do
        base_path node[:mirror][:base_path]
        exclude   mirror[:exclude] if node[:mirror][name].has_key? :exclude
        limit     mirror[:bw_limit] || 0
        owner     node[:apache][:user]
        group     node[:apache][:group]
        url       mirror[:url]
        destination  local_destination
        schedule  mirror[:schedule] if  mirror.has_key? :schedule
      end
    end

    #
    # return true if checks pass
    # return false if not 
    def validate(name, mirror)
      Chef::Log.debug "Validating Mirror #{name} Data: #{mirror.inspect} "
      return false if name == "base_path"
      return false if mirror.has_key? :enabled and mirror[:enabled] == false
      unless  mirror.has_key? :url  
        raise AttributeError, "Mirror entries should include a url paramater" 
        return false
      end
      true
    end

    def dispatch(name, mirror)
      uri = URI.parse(mirror[:url])
      if uri.scheme == "rsync"
        self.rsync(name, mirror)
      else 
       Chef::Log.warning "Mirror #{name} URL using unsuported URI format #{mirror[:url]} "
      end
    end

  end
end
