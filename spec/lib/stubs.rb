class ClientStub
  def call(method, params)
    id = 0
    id = 1 if method == :login
    id = 2 if method == :add_product
    id = 3 if method == :set_billing_details
    id = 4 if method == :get_product_by_code
    ResponseStub.new id
  end
end

class ResponseStub

  def initialize(id)
    @id = id
  end

  def body
    [[0,[[0,@id],0]],[0,[0,0]]]
  end
end