class Issue
  attr_reader :year, :cweek

  def self.all
    issues = []
    (2016..2020).each do |year|
      (1..52).each do |cweek|
        if File.exists?("./source/issues/#{year}/_#{cweek}.html")
          issues << new(year, cweek)
        end
      end
    end
    issues
  end

  def initialize(year, cweek)
    @year, @cweek = year, cweek
  end

  def title
    if date > Date.commercial(2017, 5)
      "Apple Focus #{year}/#{cweek}"
    else
      "Apple Weekly #{year}/#{cweek}"
    end
  end

  def date
    Date.commercial(@year, @cweek)
  end

  def path
    "/#{year}/#{cweek}.html"
  end

  def <=>(another_issue)
    if year < another_issue.year
      -1
    elsif year > another_issue.year
      1
    elsif cweek < another_issue.cweek
      - 1
    elsif cweek > another_issue.cweek
      1
    else
      0
    end
  end
end
