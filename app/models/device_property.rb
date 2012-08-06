class DeviceProperty
  include Mongoid::Document
  include Mongoid::Timestamps
  include Resourceable

  field :_id, default: ->{ property_id }
  field :property_id, type: Moped::BSON::ObjectId
  field :value,       default: ''
  field :physical,    default: ''

  embedded_in :device

  validates :property_id, presence: true
end
