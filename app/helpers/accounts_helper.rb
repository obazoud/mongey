module AccountsHelper
  def child_account_path(account)
    case account
      when Bankaccount then bankaccount_path(account)
      when Payee then payee_path(account)
      else account_path(account)
    end
  end
end
