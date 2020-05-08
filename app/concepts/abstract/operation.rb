# frozen_string_literal: true

# require 'dry/monads/list'
require 'dry/monads/maybe'
require 'dry/monads/result'
require 'dry/monads/try'

class Abstract::Operation
  # include Dry::Monads::List::Mixin
  include Dry::Monads::Maybe::Mixin
  include Dry::Monads::Result::Mixin
  include Dry::Monads::Try::Mixin

  attr_accessor :actor, :args

  def call(actor, args)
    @actor ||= actor
    args.symbolize_keys! if args.is_a?(Hash)
    @args = args
  end

  private

  def valid
    @valid ||= validation.to_h
  end

  def validation
    @validation ||= contract.new.call(args.to_h)
  end

  def invalid
    validation.errors.to_h
  end

  def contract
    [self.class.name.split('::').first,
     'Contract',
     self.class.name.split('::').last].join('::').constantize
  end

  def failure_403
    Failure(code: 403, message: I18n.t(:forbidden))
  end

  def failure_404
    Failure(code: 404, message: I18n.t(:not_found))
  end
end
