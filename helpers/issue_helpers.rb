module IssueHelpers
  def latest_issue
    issues.last
  end

  def current_issue
    return unless current_page.locals[:cweek]
    @current_issue ||= issues.find { |i|
      i.year == current_page.locals[:year] &&
        i.cweek == current_page.locals[:cweek]
    }
  end

  def pre_issue
    i = issues.index(current_issue)
    i != 0 && issues[i - 1]
  end

  def next_issue
    i = issues.index(current_issue)
    issues[i + 1]
  end

  def issues
    @issues ||= Issue.all
  end
end
