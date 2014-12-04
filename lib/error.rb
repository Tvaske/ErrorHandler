class Error
  include DataMapper::Resource

  property :id,   Serial
  property :server, String
  property :priority, String
  property :status, String
  property :error, String
  property :errorlong, String
  property :smgroup, String
  property :created_at, DateTime
  
  validates_presence_of :server
  validates_presence_of :priority
  validates_presence_of :status
  validates_presence_of :error
  validates_presence_of :errorlong
  validates_presence_of :smgroup
end
