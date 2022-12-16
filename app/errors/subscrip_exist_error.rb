class SubscripExistError < StandardError
  def initialize
    super(I18n.t('subscrip_alredy_exist'))
  end
end