module Moped
  module BSON
    ObjectId = ::BSON::ObjectId
  end
end

module BSON
  class ObjectId
    def as_json(options = {})
      to_s
    end
  end
end

module Mongoid
  module Document
    def as_json(options={})
      attrs = super options
      attrs['id'] = self.persisted? ? attrs.delete('_id') : nil
      attrs
    end
  end
end
