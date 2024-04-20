require 'httparty'
require 'json'

def fetch_repositories(username)
  url = "https://api.github.com/users/#{JaylonT23}/repos"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def analyze_repositories(repositories)
  most_starred_repo = repositories.max_by { |repo| repo['stargazers_count'] }
  most_starred_repo_details = {
    name: most_starred_repo['name'],
    description: most_starred_repo['description'],
    stars: most_starred_repo['stargazers_count'],
    url: most_starred_repo['html_url']
  }
  most_starred_repo_details
end

def display_repository_details(repository)
  puts "Most Starred Repository:"
  puts "Name: #{repository[:name]}"
  puts "Description: #{repository[:description]}"
  puts "Stars: #{repository[:stars]}"
  puts "URL: #{repository[:url]}"
end

# Example usage:
username = 'your_github_username'
repositories = fetch_repositories(username)
most_starred_repository = analyze_repositories(repositories)
display_repository_details(most_starred_repository)
