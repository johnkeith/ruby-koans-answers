class Television
  attr_accessor :channel

  def power
    if @power == :on
      @power = :off
    else
      @power = :on
    end
  end

  def on?
    @power == :on
  end
end

class Proxy
  attr_accessor :messages

  def initialize(target_object)
    @object = target_object
    @messages = []
  end

  def called?(method)
    @messages.include?(method) ? true : false
  end

  def number_of_times_called(method)
    @messages.count(method)
  end

  def method_missing(method_name, *args, &block)

    if self.respond_to?(method_name)
      @messages << method_name
      super(method_name, *args, &block)
    else
      @messages << method_name
      @object.send(method_name)
    end
  end
end
  tv = Proxy.new(Television.new)
  tv.power
  tv.on?
  p tv.messages