module SimpleResponse
  module QueryMethods
    def existing_query_method?(name)
      return false unless query_method?(name)
      return false unless respond_to?(name[0...-1])

      attribute_class = send(name[0...-1]).class
      attribute_class == TrueClass || attribute_class == FalseClass
    end

    private

    def query_method?(name)
      name[-1] == '?'
    end

    def query_method(name)
      send(name[0...-1])
    end
  end
end
