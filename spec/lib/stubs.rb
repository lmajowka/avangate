class ClientStub
  def call(method, params)
    ResponseStub.new method
  end
end

class ResponseStub

  def initialize(method)
    @method = method
  end

  def body
    response = {}
    response[response_symbol('response')] = {}
    response[response_symbol('response')][response_symbol('return')] = 1
    response
  end

  def response_symbol(suffix)
    "#{@method.to_s}_#{suffix}".to_sym
  end
end