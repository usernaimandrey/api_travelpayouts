class UserExistError < StandardError
  def initialize
    super(I18n.t('user_exist'))
  end
end