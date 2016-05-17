module HomeHelper
  def show_in_two_rows(str)
    raw(str.strip.split(/\s+/).join("<br/>"))
  end
  
  def tweeter_accounts(tw_accounts)
    if tw_accounts.empty?
      " - "
    else
      tw_accounts = tw_accounts.map{ |ta| "<a href=\"http://twitter.com/@#{ta.username}\" target=\"_blank\">#{ta.username}</a>" }
      ([tw_accounts.first(tw_accounts.size - 1).join(", "), tw_accounts.last(1)] - [""]).join(" and ")
    end
  end

  def yaml_key_creator(section_name, section_index, suffix)
    cand_1 = "#{section_name}_#{section_index}#{suffix}"
    cand = (I18n.t(cand_1.to_sym, :default => '')).empty? ? "#{section_name}_#{section_index}#{suffix}_html" : cand_1

    cand.to_sym
  end
end
