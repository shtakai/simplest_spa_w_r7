# frozen_string_literal: true

class PostSerializer
  include JSONAPI::Serializer
  attributes :body
end
