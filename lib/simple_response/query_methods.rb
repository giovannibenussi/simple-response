module SimpleResponse
  module QueryMethods
    def existing_query_method?(name)
      return false unless query_method?(name)
      return false unless respond_to?(name[0...-1].to_sym)

      attribute_class = @attributes[name[0...-1].to_sym].class
      attribute_class == TrueClass || attribute_class == FalseClass
    end

    private

    def query_method?(name)
      name[-1] == '?'
    end

    def query_method(name)
      @attributes[name[0...-1].to_sym]
    end
  end
end
