module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    # Don't need to put 'self.' in the Class method modules
    # Ruby can tell just by the 'extend' keyword
    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug}
    end
  end
end