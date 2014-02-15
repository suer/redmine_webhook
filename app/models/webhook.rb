class Webhook < ActiveRecord::Base
  unloadable
  belongs_to :project
end
