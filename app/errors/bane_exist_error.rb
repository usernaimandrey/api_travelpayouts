# frozen_string_literal: true

class BaneExistError < StandardError
  def initialize
    super(I18n.t('bane_exist'))
  end
end
