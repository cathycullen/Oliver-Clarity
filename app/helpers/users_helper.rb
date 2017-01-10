module UsersHelper

  def gravatar_for(user, size: 50)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def add_to_expenses_total(amount)
    @expenses_total += amount
  end

  def add_to_fees_total(amount)
    @fees_total += amount
  end
end
