module Slugifiable 

module InstanceMethods
def slug 
    self.name.strip.downcase.gsub(" ", "-")
  end 
end 

    module ClassMethods
        def self.find_by_slug(slug) 
    self.all.find {|x| x.slug == slug}
        end 
    end
end 