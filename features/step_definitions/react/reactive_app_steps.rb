Then(/^I should see (\d+) posts on the page$/) do |number|
  number.to_i.times do |n|
    post = instance_variable_get("@post#{n.to_i + 1}")
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.truncated_body)
  end
end

Then(/^I should see (\d+) posts on the page with full body$/) do |number|
  number.to_i.times do |n|
    post = instance_variable_get("@post#{n.to_i + 1}")
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
  end
end

When(/^I type post (\d+) title in search bar$/) do |number|
  post = instance_variable_get("@post#{number}")
  within("#searchForm") do
    fill_in 'searchInput', :with => post.title
  end
end

Then(/^I should see matched post on the page$/) do
  expect(page).to have_content(@search_string)
end
