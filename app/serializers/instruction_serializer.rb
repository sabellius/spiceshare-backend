class InstructionSerializer
  include JSONAPI::Serializer

  attributes :id, :step_number, :description
end
